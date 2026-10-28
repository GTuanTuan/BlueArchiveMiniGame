using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using HybridCLR;
using UnityEngine;
using YooAsset;

namespace BA.Bootstrap
{
    /// <summary>Loads a hot-update assembly once per process, before instantiating its prefabs.</summary>
    public static class HotUpdateLoader
    {
        private static readonly Dictionary<string, string> LoadedVersions = new Dictionary<string, string>(StringComparer.Ordinal);

        public static bool TryLoadDll(ResourcePackage package, string dll, out string error)
        {
            error = null;
            try
            {
                if (package == null) throw new ArgumentNullException(nameof(package));
                if (string.IsNullOrWhiteSpace(dll)) throw new ArgumentException("缺少热更程序集名称。", nameof(dll));
                string assemblyName = Path.GetFileName(dll);
                if (assemblyName.EndsWith(".bytes", StringComparison.OrdinalIgnoreCase)) assemblyName = Path.GetFileNameWithoutExtension(assemblyName);
                if (assemblyName.EndsWith(".dll", StringComparison.OrdinalIgnoreCase)) assemblyName = Path.GetFileNameWithoutExtension(assemblyName);

#if UNITY_EDITOR
                if (AppDomain.CurrentDomain.GetAssemblies().Any(a => a.GetName().Name == assemblyName)) return true;
                throw new InvalidOperationException("编辑器中未找到程序集 " + assemblyName + "，请先解决编译错误。");
#else
                string version = package.GetPackageVersion();
                if (string.IsNullOrEmpty(version)) throw new InvalidOperationException("加载程序集前必须激活完整资源版本。");
                string identity = package.PackageName + "@" + version;
                string loadedIdentity;
                if (LoadedVersions.TryGetValue(assemblyName, out loadedIdentity))
                {
                    if (loadedIdentity == identity) return true;
                    throw new InvalidOperationException(assemblyName + " 已从 " + loadedIdentity + " 加载。新版本 " + identity + " 需要重新启动后生效。");
                }
                if (AppDomain.CurrentDomain.GetAssemblies().Any(a => a.GetName().Name == assemblyName))
                    throw new InvalidOperationException(assemblyName + " 已加载，但来源版本未知，无法安全替换。请重新启动游戏。");

                using (var handle = package.LoadAssetSync<TextAsset>(assemblyName))
                {
                    var asset = handle.AssetObject as TextAsset;
                    if (handle.Status != EOperationStatus.Succeeded || asset == null)
                        throw new InvalidOperationException("无法加载 " + assemblyName + "：" + handle.Error);
                    var assembly = Assembly.Load(asset.bytes);
                    if (assembly.GetName().Name != assemblyName)
                        throw new InvalidOperationException("程序集资源名称与 DLL 标识不一致：" + assemblyName + "。请修复发布内容后重新启动。");
                    LoadedVersions.Add(assemblyName, identity);
                }
                Debug.Log("加载热更程序集 " + assemblyName + "：" + identity);
                return true;
#endif
            }
            catch (Exception exception) { error = exception.Message; return false; }
        }

        /// <summary>Metadata must come from the same platform/player build as the installed application.</summary>
        public static bool TryLoadAotMetadata(ResourcePackage preload, IList<string> fallbackNames, out string error)
        {
            error = null;
#if ENABLE_IL2CPP && !UNITY_EDITOR
            try
            {
                if (preload == null) throw new ArgumentNullException(nameof(preload));
                IEnumerable<string> names = fallbackNames;
                if (preload.IsLocationValid("AOTMetadataList"))
                {
                    using (var handle = preload.LoadAssetSync<TextAsset>("AOTMetadataList"))
                    {
                        var list = handle.AssetObject as TextAsset;
                        if (handle.Status != EOperationStatus.Succeeded || list == null)
                            throw new InvalidOperationException("AOT 元数据清单加载失败：" + handle.Error);
                        names = list.text.Split(new[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries);
                    }
                }
                var metadataNames = names == null ? new string[0] : names
                    .Where(name => !string.IsNullOrWhiteSpace(name)).Select(name => name.Trim()).Distinct().ToArray();
                if (metadataNames.Length == 0)
                    throw new InvalidOperationException("缺少 AOT 元数据清单，请先生成补充元数据并构建 Preload。");

                foreach (string name in metadataNames)
                {
                    using (var handle = preload.LoadAssetSync<TextAsset>(name))
                    {
                        var asset = handle.AssetObject as TextAsset;
                        if (handle.Status != EOperationStatus.Succeeded || asset == null)
                            throw new InvalidOperationException("AOT 元数据缺失 " + name + "：" + handle.Error);
                        var result = RuntimeApi.LoadMetadataForAOTAssembly(asset.bytes, HomologousImageMode.SuperSet);
                        if (result != LoadImageErrorCode.OK && result != LoadImageErrorCode.HOMOLOGOUS_ASSEMBLY_HAS_LOADED)
                            throw new InvalidOperationException("AOT 元数据 " + name + " 加载失败：" + result);
                    }
                }
                return true;
            }
            catch (Exception exception) { error = exception.Message; return false; }
#else
            return true;
#endif
        }
    }
}
