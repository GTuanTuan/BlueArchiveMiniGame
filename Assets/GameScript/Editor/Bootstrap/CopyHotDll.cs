using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using UnityEditor;
using UnityEditor.Build.Player;
using UnityEngine;

public class CopyHotDll
{
    [MenuItem("Tools/更新生成PreloadDll")]
    public static void CopyPreloadDll2Byte()
    {
        CompileAndCopy("Preload");
    }

    [MenuItem("Tools/更新生成MainDll")]
    public static void CopyMainDll2Byte()
    {
        CompileAndCopy("Main");
    }

    // BuildAll uses one compilation so both packages contain DLLs from the same source snapshot.
    public static void CompileAndCopy(params string[] assemblyNames)
    {
        if (EditorApplication.isCompiling || EditorApplication.isPlayingOrWillChangePlaymode)
            throw new InvalidOperationException("请等待脚本编译完成并退出运行模式，再编译热更程序集。");
        BootstrapBuildValidation.ValidateGeneratedLinkerConfiguration();
        string[] names = assemblyNames.Distinct(StringComparer.Ordinal).ToArray();
        if (names.Length == 0 || names.Any(n => n != "Preload" && n != "Main"))
            throw new ArgumentException("热更编译只支持 Preload 和 Main。", nameof(assemblyNames));
        var target = EditorUserBuildSettings.activeBuildTarget;
        // A failed compile must never be satisfied by DLLs left by a previous run.
        string output = Path.GetFullPath(Path.Combine(Application.dataPath, "../Temp/BootstrapHotUpdateDlls",
            target.ToString(), Guid.NewGuid().ToString("N")));
        Directory.CreateDirectory(output);
        var settings = new ScriptCompilationSettings
        {
            group = BuildPipeline.GetBuildTargetGroup(target),
            target = target,
            options = EditorUserBuildSettings.development ? ScriptCompilationOptions.DevelopmentBuild : ScriptCompilationOptions.None
        };
        ScriptCompilationResult result;
        try { result = PlayerBuildInterface.CompilePlayerScripts(settings, output); }
        finally { EditorUtility.ClearProgressBar(); }
        if (result.assemblies == null || result.assemblies.Count == 0)
            throw new InvalidOperationException("热更脚本编译未生成程序集，已停止复制。请先解决 Console 编译错误。");
        foreach (string name in names)
        {
            string source = Path.Combine(output, name + ".dll");
            if (!result.assemblies.Any(path => string.Equals(Path.GetFileNameWithoutExtension(path), name, StringComparison.Ordinal)) ||
                !File.Exists(source))
                throw new InvalidOperationException("本次热更脚本编译未生成 " + name + "，已停止复制。请先解决 Console 编译错误。");
            if (!string.Equals(AssemblyName.GetAssemblyName(source).Name, name, StringComparison.Ordinal))
                throw new InvalidDataException("热更程序集身份不匹配：" + source);
        }
        // Validate the complete compilation result before changing either package's DLL bytes.
        foreach (string name in names) CopyHotAssembly(output, name);
        AssetDatabase.Refresh(ImportAssetOptions.ForceSynchronousImport);
    }

    private static void CopyHotAssembly(string compilationDirectory, string name)
    {
        string source = Path.Combine(compilationDirectory, name + ".dll");
        string destination = Path.Combine(Application.dataPath, "GameRes/Packages", name, "HotUpdateDll", name + ".bytes");
        if (!File.Exists(source)) throw new FileNotFoundException("热更程序集未生成", source);
        if (!string.Equals(AssemblyName.GetAssemblyName(source).Name, name, StringComparison.Ordinal))
            throw new InvalidDataException("热更程序集身份不匹配：" + source);
        Directory.CreateDirectory(Path.GetDirectoryName(destination));
        File.Copy(source, destination, true);
        Debug.Log("已复制 " + name + " 热更程序集。");
    }

    [MenuItem("Tools/更新生成补充数据源")]
    public static void CopyDepDll2Byte()
    {
        var names = ReadAotAssemblyNames();
        string source = HybridCLR.SettingsUtil.GetAssembliesPostIl2CppStripDir(EditorUserBuildSettings.activeBuildTarget);
        var missing = names.Where(n => !File.Exists(Path.Combine(source, n))).ToArray();
        if (missing.Length != 0)
            throw new FileNotFoundException("当前平台缺少裁剪后AOT程序集；先按相同构建选项运行HybridCLR Generate/All：\n" + string.Join("\n", missing));
        BootstrapBuildValidation.CheckAotBaseline(source, names);

        string destination = Path.GetFullPath(Path.Combine(Application.dataPath, "GameRes/Packages/Preload/HotUpdateDll"));
        string manifestPath = Path.Combine(destination, "AOTMetadataList.bytes");
        var oldNames = File.Exists(manifestPath) ? File.ReadAllLines(manifestPath).Where(n => !string.IsNullOrWhiteSpace(n)).Select(n => n.Trim()).ToArray() : new string[0];
        foreach (string name in oldNames)
            if (!System.Text.RegularExpressions.Regex.IsMatch(name, @"\A[A-Za-z0-9_][A-Za-z0-9_.-]*\.dll\z"))
                throw new InvalidDataException("旧AOT清单含非法文件名，停止复制与清理：" + name);

        // Validate every new input and every old cleanup name before touching generated output.
        Directory.CreateDirectory(destination);
        foreach (string name in names) File.Copy(Path.Combine(source, name), Path.Combine(destination, name + ".bytes"), true);
        File.WriteAllText(manifestPath, string.Join("\n", names), new UTF8Encoding(false));
        foreach (string name in oldNames.Except(names, StringComparer.OrdinalIgnoreCase))
        {
            string obsolete = Path.GetFullPath(Path.Combine(destination, name + ".bytes"));
            if (!string.Equals(Path.GetDirectoryName(obsolete), destination, StringComparison.OrdinalIgnoreCase))
                throw new InvalidDataException("AOT清理目标不在输出目录内：" + obsolete);
            if (File.Exists(obsolete)) File.Delete(obsolete);
            if (File.Exists(obsolete + ".meta")) File.Delete(obsolete + ".meta");
        }
        AssetDatabase.Refresh(ImportAssetOptions.ForceSynchronousImport);
        Debug.Log("已从生成源码复制 " + names.Count + " 份AOT元数据及清单到Preload。");
    }

    internal static List<string> ReadAotAssemblyNames()
    {
        // Generate/All can finish before Unity recompiles AOTGenericReferences.
        // Read only that field's initializer from the newly generated source, never its old loaded type.
        string generatedPath = Path.GetFullPath(Path.Combine(Application.dataPath,
            HybridCLR.Settings.HybridCLRSettings.instance.outputAOTGenericReferenceFile));
        if (!File.Exists(generatedPath))
            throw new FileNotFoundException("请先生成HybridCLR AOT引用源码。", generatedPath);
        string generatedSource = File.ReadAllText(generatedPath);
        var blocks = System.Text.RegularExpressions.Regex.Matches(generatedSource,
            @"(?m)^[ \t]*public\s+static\s+readonly\s+IReadOnlyList<string>\s+PatchedAOTAssemblyList\s*=\s*new\s+List<string>\s*\{(?<items>[^{}]*)\}\s*;");
        if (blocks.Count != 1)
            throw new InvalidDataException("AOT引用源码必须包含唯一的PatchedAOTAssemblyList列表初始化区块：" + generatedPath);

        var names = new List<string>();
        var uniqueNames = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        string[] entries = blocks[0].Groups["items"].Value.Split(',');
        for (int i = 0; i < entries.Length; i++)
        {
            string entry = entries[i].Trim();
            if (entry.Length == 0 && i == entries.Length - 1) continue; // optional trailing comma
            var match = System.Text.RegularExpressions.Regex.Match(entry,
                @"\A""(?<dll>[A-Za-z0-9_][A-Za-z0-9_.-]*\.dll)""\z");
            if (!match.Success)
                throw new InvalidDataException("AOT引用列表包含非法DLL项：" + entry);
            string name = match.Groups["dll"].Value;
            if (!uniqueNames.Add(name))
                throw new InvalidDataException("AOT引用列表包含重复DLL：" + name);
            names.Add(name);
        }
        if (names.Count == 0) throw new InvalidDataException("生成的AOT引用列表为空。");

        return names;
    }
}
