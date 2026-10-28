using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Xml;
using UnityEditor;
using UnityEditor.Build;
using UnityEditor.Build.Reporting;
using UnityEngine;
using YooAsset;
using YooAsset.Editor;
using BuildReport = UnityEditor.Build.Reporting.BuildReport;

// Editor-only checks. This does not upload files or change runtime resource versions.
public static class BootstrapBuildValidation
{
    [Serializable] private sealed class Fingerprint
    {
        public string name;
        public string sha256;
    }

    [Serializable] private sealed class AotBaseline
    {
        public string applicationVersion;
        public string unityVersion;
        public string target;
        public bool development;
        public string playerOutput;
        public string recordedUtc;
        public List<Fingerprint> assemblies = new List<Fingerprint>();
    }

    [Serializable] private sealed class ReleaseCheck
    {
        public string package;
        public string packageVersion;
        public string applicationVersion;
        public string target;
        public string defaultContentChannel;
        public string remoteDirectory;
        public string remoteDirectoryTemplate;
        public bool development;
        public string aotBaselineStatus;
        public string[] requiredAddresses;
        public string publishingInstructions;
        public List<Fingerprint> codeFiles = new List<Fingerprint>();
    }

    public static string[] ValidatePackage(string packageName)
    {
        if (packageName != "Preload" && packageName != "Main")
            throw new ArgumentException("启动构建只支持 Preload 和 Main。", nameof(packageName));
        ValidateGeneratedLinkerConfiguration();

        var setting = BundleCollectorSettingData.Setting;
        var package = setting.GetPackage(packageName);
        if (!package.EnableAddressable)
            throw new InvalidOperationException(packageName + " 必须启用可寻址地址。");
        // Simulation collects the real addresses without building bundles or walking all dependencies.
        var assets = setting.BeginCollect(packageName, true, false, true).CollectAssets;
        var required = packageName == "Preload"
            ? new List<string> { "Preload", "PatchWindow", "AOTMetadataList", "PreloadOriginalAtlas" }
            : new List<string> { "Main", "GameStart", "MainOriginalAtlas" };

        if (packageName == "Preload") required.AddRange(CopyHotDll.ReadAotAssemblyNames());
        if (packageName == "Main")
        {
            var entry = assets.Find(a => a.Address == "GameStart" && a.CollectorType == ECollectorType.MainAssetCollector);
            if (entry != null)
            {
                var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(entry.AssetInfo.AssetPath);
                var component = prefab == null ? null : prefab.GetComponents<MonoBehaviour>()
                    .FirstOrDefault(c => c != null && c.GetType().Name == "GameStart");
                if (component == null) throw new InvalidOperationException("GameStart 入口预制体缺少 GameStart 组件。");
                var scene = new SerializedObject(component).FindProperty("mainSceneAddress");
                if (scene == null || string.IsNullOrWhiteSpace(scene.stringValue))
                    throw new InvalidOperationException("GameStart 没有配置主场景地址。");
                required.Add(scene.stringValue);
            }
        }
        foreach (string address in required)
        {
            string expected = package.LocationToLower ? address.ToLowerInvariant() : address;
            if (!assets.Any(a => a.Address == expected && a.CollectorType == ECollectorType.MainAssetCollector))
                throw new InvalidOperationException(packageName + " 未收集启动资源：" + address);
        }
        return required.ToArray();
    }

    public static void ValidateGeneratedLinkerConfiguration()
    {
        string path = Path.GetFullPath(Path.Combine(Application.dataPath,
            HybridCLR.Settings.HybridCLRSettings.instance.outputLinkFile));
        const string recovery = "请执行 HybridCLR/Generate/All，等待 Unity 编译完成后重新构建；本次启动框架重构需要重新生成并发布安装包。";
        if (!File.Exists(path)) throw new FileNotFoundException("缺少 HybridCLR link.xml。" + recovery, path);
        var linker = new XmlDocument { XmlResolver = null };
        using (var reader = XmlReader.Create(path, new XmlReaderSettings { DtdProcessing = DtdProcessing.Prohibit, XmlResolver = null }))
            linker.Load(reader);
        var required = new[]
        {
            new[] { "MyScripts.Runtime", "Boot" },
            new[] { "MyScripts.Runtime", "BA.Bootstrap.IPatchView" },
            new[] { "MyScripts.Runtime", "BA.Bootstrap.PackageUpdateProgress" },
            new[] { "UnityEngine.CoreModule", "UnityEngine.U2D.SpriteAtlas" }
        };
        foreach (var item in required)
        {
            var assembly = linker.SelectSingleNode("/linker/assembly[@fullname='" + item[0] + "']") as XmlElement;
            var type = assembly?.SelectSingleNode("type[@fullname='" + item[1] + "']");
            if (assembly == null || (assembly.GetAttribute("preserve") != "all" && type == null))
                throw new InvalidDataException("HybridCLR link.xml 尚未包含新启动框架/图集所需类型：" + item[1] + "。" + recovery);
        }
    }

    internal static string CheckAotBaseline(string sourceDirectory, IEnumerable<string> names, string extension = "")
    {
        string path = BaselinePath(EditorUserBuildSettings.activeBuildTarget, EditorUserBuildSettings.development);
        if (!File.Exists(path)) return null;
        var baseline = JsonUtility.FromJson<AotBaseline>(File.ReadAllText(path));
        if (baseline == null || baseline.assemblies == null || baseline.assemblies.Count == 0)
            throw new InvalidDataException("播放器 AOT 基线损坏：" + path);
        foreach (string name in names)
        {
            var expected = baseline.assemblies.Find(a => a.name == name);
            string file = Path.Combine(sourceDirectory, name + extension);
            if (expected == null || !File.Exists(file) || HashFile(file) != expected.sha256)
                throw new InvalidDataException("AOT 元数据与该版本播放器不匹配：" + name +
                    "。热更请恢复该安装包构建时保存的 AOT DLL；AOT 代码改变需发布新版本安装包。");
        }
        return "已与该平台、安装包版本、Development 选项的播放器 AOT 基线匹配。";
    }

    public static void WriteReleaseCheck(string packageName, string packageVersion, string outputDirectory, string[] addresses)
    {
        string metadataDirectory = Path.Combine(Application.dataPath, "GameRes/Packages/Preload/HotUpdateDll");
        var aotNames = CopyHotDll.ReadAotAssemblyNames();
        string remoteRoot = Application.productName + "/CDN/" + PlatformFolder(EditorUserBuildSettings.activeBuildTarget) + "/" + packageName;
        var report = new ReleaseCheck
        {
            package = packageName,
            packageVersion = packageVersion,
            applicationVersion = Application.version,
            target = EditorUserBuildSettings.activeBuildTarget.ToString(),
            defaultContentChannel = "v1",
            remoteDirectory = remoteRoot + "/v1",
            remoteDirectoryTemplate = remoteRoot + "/{contentChannel}",
            development = EditorUserBuildSettings.development,
            aotBaselineStatus = CheckAotBaseline(metadataDirectory, aotNames, ".bytes"),
            requiredAddresses = addresses,
            publishingInstructions = "先上传资源文件，再上传该版本 Hash/Manifest；核对下载和离线回退后，最后发布 .version 版本指针。" +
                "Main/Preload 分别上传到 remoteDirectory 所示的包与渠道目录；根目录前加 Boot 的服务器地址。" +
                "默认 contentChannel 为 v1，自定义渠道必须按 Boot 配置替换 remoteDirectoryTemplate 中的 {contentChannel}。" +
                "AOT 代码改变需要重建安装包，并确保发布内容与使用该渠道的播放器兼容。" +
                "同一版本内容不可覆盖。Preload 在游戏内后台下载、下次启动生效，Main 必须兼容仍在使用的旧 Preload。" +
                "保留旧版本资源与播放器 AOT DLL；本报告不代替 IL2CPP 真机验收。"
        };
        string dll = Path.Combine(Application.dataPath, "GameRes/Packages", packageName, "HotUpdateDll", packageName + ".bytes");
        report.codeFiles.Add(new Fingerprint { name = packageName + ".dll", sha256 = HashFile(dll) });
        if (packageName == "Preload")
            foreach (string name in aotNames)
                report.codeFiles.Add(new Fingerprint { name = name, sha256 = HashFile(Path.Combine(metadataDirectory, name + ".bytes")) });
        File.WriteAllText(Path.Combine(outputDirectory, "release-check.json"), JsonUtility.ToJson(report, true), new UTF8Encoding(false));
        Debug.Log("发布检查：" + Path.Combine(outputDirectory, "release-check.json"));
    }

    internal static void RecordPlayerBaseline(BuildReport report)
    {
        if (report.summary.result != UnityEditor.Build.Reporting.BuildResult.Succeeded) return;
        if (PlayerSettings.GetScriptingBackend(BuildPipeline.GetBuildTargetGroup(report.summary.platform)) != ScriptingImplementation.IL2CPP) return;
        string output = Path.GetFullPath(report.summary.outputPath);
        string temporaryRoot = Path.GetFullPath(Path.Combine(Application.dataPath, "../Temp")) + Path.DirectorySeparatorChar;
        if (output.StartsWith(temporaryRoot, StringComparison.OrdinalIgnoreCase)) return; // HybridCLR Generate/All is not a published player.

        string source = HybridCLR.SettingsUtil.GetAssembliesPostIl2CppStripDir(report.summary.platform);
        if (!Directory.Exists(source)) return;
        var baseline = new AotBaseline
        {
            applicationVersion = Application.version,
            unityVersion = Application.unityVersion,
            target = report.summary.platform.ToString(),
            development = (report.summary.options & BuildOptions.Development) != 0,
            playerOutput = output,
            recordedUtc = DateTime.UtcNow.ToString("O")
        };
        foreach (string file in Directory.GetFiles(source, "*.dll").OrderBy(f => f, StringComparer.Ordinal))
            baseline.assemblies.Add(new Fingerprint { name = Path.GetFileName(file), sha256 = HashFile(file) });
        if (baseline.assemblies.Count == 0) return;
        string path = BaselinePath(report.summary.platform, baseline.development);
        if (File.Exists(path))
        {
            var previous = JsonUtility.FromJson<AotBaseline>(File.ReadAllText(path));
            if (previous == null || previous.assemblies == null || previous.assemblies.Count != baseline.assemblies.Count ||
                baseline.assemblies.Any(a => !previous.assemblies.Any(p => p.name == a.name && p.sha256 == a.sha256)))
            {
                Debug.LogError("同一安装包版本出现不同 AOT 内容，原基线已保留。发布此播放器前请递增 PlayerSettings.bundleVersion 并重新构建。");
                return;
            }
        }
        Directory.CreateDirectory(Path.GetDirectoryName(path));
        File.WriteAllText(path, JsonUtility.ToJson(baseline, true), new UTF8Encoding(false));
        Debug.Log("已记录播放器 AOT 基线：" + path);
    }

    private static string BaselinePath(BuildTarget target, bool development)
    {
        string identity = Application.version + "|" + Application.unityVersion;
        string versionKey;
        using (var sha = SHA256.Create()) versionKey = BitConverter.ToString(sha.ComputeHash(Encoding.UTF8.GetBytes(identity))).Replace("-", "");
        return Path.GetFullPath(Path.Combine(Application.dataPath, "../HybridCLRData/PlayerAotBaselines", target.ToString(),
            development ? "Development" : "Release", versionKey + ".json"));
    }

    // Keep this mapping aligned with Boot.PlatformFolder().
    private static string PlatformFolder(BuildTarget target)
    {
        switch (target)
        {
            case BuildTarget.Android: return "Android";
            case BuildTarget.iOS: return "IPhone";
            case BuildTarget.WebGL: return "WebGL";
            default: return "PC";
        }
    }

    private static string HashFile(string path)
    {
        using (var stream = File.OpenRead(path))
        using (var sha = SHA256.Create()) return BitConverter.ToString(sha.ComputeHash(stream)).Replace("-", "");
    }
}

public sealed class BootstrapPlayerBuildRecorder : IPostprocessBuildWithReport
{
    public int callbackOrder => 10000; // After HybridCLR copies the actual stripped player assemblies.
    public void OnPostprocessBuild(BuildReport report) => BootstrapBuildValidation.RecordPlayerBaseline(report);
}
