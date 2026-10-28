using System;
using UnityEditor;
using UnityEngine;
using YooAsset;
using YooAsset.Editor;

public class BuildTool
{
    [MenuItem("Tools/打包Preload")]
    public static void BuildPreload()
    {
        CopyHotDll.CopyPreloadDll2Byte();
        CopyHotDll.CopyDepDll2Byte();
        ExecuteBuild("Preload", EBundledCopyOption.ClearAndCopyAll);
    }

    [MenuItem("Tools/打包Main %G")]
    public static void BuildMain()
    {
        CopyHotDll.CopyMainDll2Byte();
        ExecuteBuild("Main", EBundledCopyOption.None);
    }

    [MenuItem("Tools/全部打包")]
    public static void BuildAll()
    {
        CopyHotDll.CompileAndCopy("Preload", "Main");
        CopyHotDll.CopyDepDll2Byte();
        ExecuteBuild("Preload", EBundledCopyOption.ClearAndCopyAll);
        ExecuteBuild("Main", EBundledCopyOption.None);
    }

    public static BuildResult ExecuteBuild(string packageName, EBundledCopyOption copyOption)
    {
        if ((packageName == "Preload" && copyOption != EBundledCopyOption.ClearAndCopyAll) ||
            (packageName == "Main" && copyOption != EBundledCopyOption.None))
            throw new InvalidOperationException("启动首包要求完整内置 Preload，Main 保持远端下载。");
        string[] requiredAddresses = BootstrapBuildValidation.ValidatePackage(packageName);
        // Match YooAsset 3.0.6's build window: local date and minutes since midnight.
        var now = DateTime.Now;
        string packageVersion = now.ToString("yyyy-MM-dd") + "-" + (now.Hour * 60 + now.Minute);
        string pipelineName = EBuildPipeline.ScriptableBuildPipeline.ToString();
        var parameters = new ScriptableBuildParameters {
            BuildOutputRoot = BundleBuilderHelper.GetDefaultBuildOutputRoot(),
            BundledFileRoot = BundleBuilderHelper.GetStreamingAssetsRoot(),
            BuildPipeline = pipelineName,
            BuildBundleType = (int)EBundleType.AssetBundle,
            BuildTarget = EditorUserBuildSettings.activeBuildTarget,
            PackageName = packageName,
            PackageVersion = packageVersion,
            EnableSharePackRule = true,
            VerifyBuildingResult = true,
            EnableAssetPathValidation = true,
            FileNameStyle = BundleBuilderSetting.GetPackageFileNameStyle(packageName, pipelineName),
            BundledCopyOption = copyOption,
            BundledCopyParams = BundleBuilderSetting.GetPackageBundledCopyParams(packageName, pipelineName),
            CompressOption = BundleBuilderSetting.GetPackageCompressOption(packageName, pipelineName),
            ClearBuildCacheFiles = BundleBuilderSetting.GetPackageClearBuildCache(packageName, pipelineName),
            UseAssetDependencyDB = BundleBuilderSetting.GetPackageUseAssetDependencyDB(packageName, pipelineName),
            BundleEncryptor = CreateExtension<IBundleEncryptor>(BundleBuilderSetting.GetPackageBundleEncryptorClassName(packageName, pipelineName)),
            ManifestEncryptor = CreateExtension<IManifestEncryptor>(BundleBuilderSetting.GetPackageManifestEncryptorClassName(packageName, pipelineName)),
            ManifestDecryptor = CreateExtension<IManifestDecryptor>(BundleBuilderSetting.GetPackageManifestDecryptorClassName(packageName, pipelineName)),
            BuiltinShadersBundleName = DefaultBundlePackRule.CreateShadersPackRuleResult().GetBundleName(packageName, BundleCollectorSettingData.Setting.UniqueBundleName)
        };
        var result = new ScriptableBuildPipeline().Run(parameters, true);
        if (!result.Success) throw new InvalidOperationException("资源包构建失败：" + packageName + "，详见构建日志。");
        BootstrapBuildValidation.WriteReleaseCheck(packageName, packageVersion, result.OutputPackageDirectory, requiredAddresses);
        EditorUtility.RevealInFinder(result.OutputPackageDirectory);
        return result;
    }

    private static T CreateExtension<T>(string name) where T : class
    {
        if (string.IsNullOrEmpty(name)) return null;
        var type = EditorAssemblyUtility.GetAssignableTypes(typeof(T)).Find(t => t.FullName == name);
        if (type == null) throw new InvalidOperationException("未找到构建扩展：" + name);
        return (T)Activator.CreateInstance(type);
    }
}
