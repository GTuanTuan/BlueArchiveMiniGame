using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Networking;
using YooAsset;

namespace BA.Bootstrap
{
    public sealed class PackageUpdateProgress
    {
        public string Message;
        public float Progress;
        public long DownloadedBytes;
        public long TotalBytes;
    }

    /// <summary>
    /// YooAsset 3.x weak-network A: a remote failure restores a complete local version.
    /// No assets may be loaded from this package while UpdateOrFallback changes its manifest.
    /// PrefetchNext never changes the active manifest and is safe for next-launch updates.
    /// </summary>
    public sealed class PackageUpdater : IDisposable
    {
        private readonly string _name;
        private readonly EPlayMode _mode;
        private readonly IRemoteService _remote;
        private readonly LocalVersionStore _versions;
        private readonly string _cacheRoot;
        private readonly string _builtinRoot;
        private readonly bool _useBuiltin;
        private ResourceDownloaderOperation _downloader;
        private UnityWebRequest _localRequest;
        private bool _cancelled;
        private bool _busy;
        private string _builtinVersion;
        private Action<PackageUpdateProgress> _progress;

        public ResourcePackage Package { get; private set; }
        public bool Succeeded { get; private set; }
        public bool UsedLocal { get; private set; }
        public string Error { get; private set; }
        public string Version { get; private set; }
        public int RequestTimeout = 8;
        public int ManifestTimeout = 15;
        public int RetryCount = 1;
        public int MaxConcurrency = 6;

        public PackageUpdater(string packageName, EPlayMode playMode, IRemoteService remote,
            LocalVersionStore versions, string cacheRoot = null, string builtinRoot = null, bool useBuiltin = false)
        {
            if (string.IsNullOrWhiteSpace(packageName)) throw new ArgumentException("Package name is required.", nameof(packageName));
            _name = packageName;
            _mode = playMode;
            _remote = remote;
            _versions = versions ?? throw new ArgumentNullException(nameof(versions));
            _cacheRoot = cacheRoot ?? GetDefaultCacheRoot(packageName);
            _builtinRoot = builtinRoot ?? Path.Combine(Application.streamingAssetsPath,
                YooAssetConfiguration.GetYooFolderName(), packageName);
            _useBuiltin = useBuiltin;
        }

        public IEnumerator LoadLocal(Action<PackageUpdateProgress> progress = null)
        {
            Begin(progress);
            try
            {
                yield return Guard(Initialize());
                if (!Ready) yield break;
                yield return Guard(LoadLocalCore());
            }
            finally { End(); }
        }

        public IEnumerator UpdateOrFallback(Action<PackageUpdateProgress> progress = null)
        {
            Begin(progress);
            try
            {
                yield return Guard(Initialize());
                if (!Ready) yield break;
                if (_mode == EPlayMode.EditorSimulateMode || _mode == EPlayMode.OfflinePlayMode)
                {
                    yield return Guard(LoadLocalCore());
                    yield break;
                }
                yield return Guard(UpdateRemote(false));
                if (Succeeded || _cancelled) yield break;
                string remoteError = Error;
                Report("更新未完成，正在检查本地资源");
                yield return Guard(LoadLocalCore());
                if (Succeeded)
                    Debug.LogWarning($"[{_name}] 远端更新失败，使用本地版本 {Version}：{remoteError}");
                else
                    Error = $"更新失败：{remoteError}\n本地资源不可用：{Error}";
            }
            finally { End(); }
        }

        public IEnumerator PrefetchNext(Action<PackageUpdateProgress> progress = null)
        {
            Begin(progress);
            try
            {
                if (_mode != EPlayMode.HostPlayMode) yield break;
                yield return Guard(Initialize());
                if (Ready) yield return Guard(UpdateRemote(true));
            }
            finally { End(); }
        }

        private bool Ready => !_cancelled && Package != null && Package.InitializeStatus == EOperationStatus.Succeeded;

        private IEnumerator Initialize()
        {
            Report("正在检查资源文件");
            if (!YooAssets.IsInitialized) YooAssets.Initialize();
            if (Package != null && Package.InitializeStatus == EOperationStatus.Succeeded) yield break;
            if (YooAssets.TryGetPackage(_name, out var existing))
            {
                if (existing.InitializeStatus == EOperationStatus.Succeeded)
                {
                    Package = existing;
                    yield break;
                }
                yield return existing.DestroyPackageAsync();
                YooAssets.RemovePackage(_name);
            }
            Package = YooAssets.CreatePackage(_name);
            InitializePackageOptions options;
            if (_mode == EPlayMode.EditorSimulateMode)
            {
#if UNITY_EDITOR
                var build = EditorSimulateBuildInvoker.Build(_name, (int)EBundleType.VirtualAssetBundle);
                options = new EditorSimulateModeOptions {
                    EditorFileSystemParameters = FileSystemParameters.CreateDefaultEditorFileSystemParameters(build.PackageRootDirectory)
                };
#else
                throw new InvalidOperationException("编辑器模拟模式不能用于播放器。");
#endif
            }
            else if (_mode == EPlayMode.OfflinePlayMode)
            {
                options = new OfflinePlayModeOptions {
                    BuiltinFileSystemParameters = FileSystemParameters.CreateDefaultBuiltinFileSystemParameters(_builtinRoot)
                };
            }
            else if (_mode == EPlayMode.HostPlayMode)
            {
                var cache = FileSystemParameters.CreateDefaultSandboxFileSystemParameters(_remote, _cacheRoot);
                cache.AddParameter(EFileSystemParameter.InstallCleanupMode, EInstallCleanupMode.None);
                cache.AddParameter(EFileSystemParameter.FileVerifyLevel, EFileVerifyLevel.High);
                cache.AddParameter(EFileSystemParameter.DownloadWatchdogTimeout, ManifestTimeout);
                cache.AddParameter(EFileSystemParameter.DownloadResumeMinimumSize, 1024L * 1024L);
                // The whole package is downloaded before gameplay. Missing files must fail locally.
                cache.AddParameter(EFileSystemParameter.DownloadDisableOndemand, true);
                FileSystemParameters builtin = null;
                if (_useBuiltin)
                {
                    builtin = FileSystemParameters.CreateDefaultBuiltinFileSystemParameters(_builtinRoot);
                    builtin.AddParameter(EFileSystemParameter.CopyBuiltinPackageManifest, true);
                    builtin.AddParameter(EFileSystemParameter.CopyBuiltinPackageManifestDestRoot, Path.Combine(_cacheRoot, "ManifestFiles"));
                    builtin.AddParameter(EFileSystemParameter.InstallCleanupMode, EInstallCleanupMode.None);
                }
                options = new HostPlayModeOptions { BuiltinFileSystemParameters = builtin, CacheFileSystemParameters = cache };
            }
            else if (_mode == EPlayMode.WebPlayMode)
            {
                // Browser caching is platform-specific; desktop offline guarantees do not apply here.
                options = new WebPlayModeOptions {
                    WebServerFileSystemParameters = FileSystemParameters.CreateDefaultWebServerFileSystemParameters()
                };
            }
            else throw new NotSupportedException("不支持的运行模式：" + _mode);
            var init = Package.InitializePackageAsync(options);
            yield return init;
            if (init.Status != EOperationStatus.Succeeded) Error = "资源初始化失败：" + init.Error;
        }

        private IEnumerator LoadLocalCore()
        {
            Succeeded = false;
            UsedLocal = true;
            if (_mode == EPlayMode.EditorSimulateMode || _mode == EPlayMode.OfflinePlayMode || _mode == EPlayMode.WebPlayMode)
            {
                var version = Package.RequestPackageVersionAsync(new RequestPackageVersionOptions(false, RequestTimeout));
                yield return version;
                if (version.Status != EOperationStatus.Succeeded) { Error = version.Error; yield break; }
                yield return ActivateComplete(version.PackageVersion, false);
                yield break;
            }

            var candidates = new List<string>(_versions.GetVersions(_name));
            // Old PlayerPrefs records have no player/channel identity. Keep the cached bytes,
            // but do not treat an old DLL as compatible with this rebuilt AOT bootstrap.
            if (_useBuiltin)
            {
                yield return ReadBuiltinVersion();
                if (!string.IsNullOrEmpty(_builtinVersion) && !candidates.Contains(_builtinVersion)) candidates.Add(_builtinVersion);
            }
            var errors = new List<string>();
            foreach (string candidate in candidates)
            {
                if (_cancelled) yield break;
                if (_versions.IsRejected(_name, candidate)) { errors.Add(candidate + "：此前启动失败，已跳过"); continue; }
                if (!HasLocalManifest(candidate)) { errors.Add(candidate + "：缺少本地清单"); continue; }
                Report("正在校验本地版本 " + candidate);
                yield return ActivateComplete(candidate, true);
                if (Succeeded) yield break;
                errors.Add(candidate + "：" + Error);
            }
            Error = errors.Count == 0 ? "尚无完整的本地资源，首次使用需要联网下载。" : string.Join("\n", errors);
        }

        private bool HasLocalManifest(string version)
        {
            // Pinned to YooAsset 3.0.6's sandbox layout. This precheck avoids network I/O on fallback.
            string root = Path.Combine(_cacheRoot, "ManifestFiles");
            return File.Exists(Path.Combine(root, YooAssetConfiguration.GetPackageHashFileName(_name, version))) &&
                   File.Exists(Path.Combine(root, YooAssetConfiguration.GetManifestBinaryFileName(_name, version)));
        }

        private IEnumerator ReadBuiltinVersion()
        {
            if (!string.IsNullOrEmpty(_builtinVersion)) yield break;
            string path = Path.Combine(_builtinRoot, YooAssetConfiguration.GetPackageVersionFileName(_name));
            if (!path.Contains("://"))
            {
                if (File.Exists(path)) _builtinVersion = File.ReadAllText(path).Trim();
                yield break;
            }
            // Android StreamingAssets are inside a jar; use UnityWebRequest only for that local URI.
            _localRequest = UnityWebRequest.Get(path);
            _localRequest.timeout = RequestTimeout;
            yield return _localRequest.SendWebRequest();
            if (_localRequest.result == UnityWebRequest.Result.Success)
                _builtinVersion = _localRequest.downloadHandler.text.Trim();
            _localRequest.Dispose();
            _localRequest = null;
        }

        private IEnumerator ActivateComplete(string version, bool save)
        {
            var manifest = Package.LoadPackageManifestAsync(new LoadPackageManifestOptions(version, ManifestTimeout));
            yield return manifest;
            if (manifest.Status != EOperationStatus.Succeeded) { Error = manifest.Error; yield break; }
            var check = Package.CreateResourceDownloader(new ResourceDownloaderOptions(1, 0));
            if (check.TotalDownloadCount != 0) { Error = "本地资源不完整，需要下载 " + check.TotalDownloadCount + " 个文件。"; yield break; }
            if (_cancelled) yield break;
            Version = version;
            if (save) SaveComplete(version);
            Succeeded = true;
            Error = null;
            Report("使用本地资源 " + version, 1);
        }

        private IEnumerator UpdateRemote(bool prefetchOnly)
        {
            Succeeded = false;
            UsedLocal = false;
            Report("正在检查更新");
            var request = Package.RequestPackageVersionAsync(new RequestPackageVersionOptions(true, RequestTimeout));
            yield return request;
            if (request.Status != EOperationStatus.Succeeded) { Error = request.Error; yield break; }
            if (_cancelled) yield break;
            string version = request.PackageVersion;
            if (_versions.IsRejected(_name, version))
            { Error = "该资源版本曾启动失败，等待服务器发布修复版本：" + version; yield break; }
            Report("正在获取资源清单");
            // Prefetch keeps the old manifest intact if any download fails.
            var prefetch = Package.PrefetchManifestAsync(new PrefetchManifestOptions(version, ManifestTimeout));
            yield return prefetch;
            if (prefetch.Status != EOperationStatus.Succeeded) { Error = prefetch.Error; yield break; }
            if (_cancelled) yield break;
            _downloader = prefetch.CreateResourceDownloader(new ResourceDownloaderOptions(MaxConcurrency, RetryCount));
            _downloader.DownloadProgressChanged += OnDownloadProgress;
            if (_downloader.TotalDownloadCount > 0)
            {
                Report("正在下载更新", 0, 0, _downloader.TotalDownloadBytes);
                _downloader.StartDownload();
                yield return _downloader;
                if (_downloader.Status != EOperationStatus.Succeeded) { Error = _downloader.Error; yield break; }
            }
            if (_cancelled) yield break;
            if (prefetch.CreateResourceDownloader(new ResourceDownloaderOptions(1, 0)).TotalDownloadCount != 0)
            { Error = "下载结束后资源仍不完整。"; yield break; }
            if (!prefetchOnly)
            {
                var activate = Package.LoadPackageManifestAsync(new LoadPackageManifestOptions(version, ManifestTimeout));
                yield return activate;
                if (activate.Status != EOperationStatus.Succeeded) { Error = activate.Error; yield break; }
            }
            if (_cancelled) yield break;
            bool saved = SaveComplete(version);
            if (prefetchOnly && !saved)
            { Error = "资源已下载，但版本记录保存失败，下次启动仍使用原版本。"; yield break; }
            Version = version;
            Succeeded = true;
            Error = null;
            Report(prefetchOnly ? "更新界面已下载，将在下次启动生效" : "资源更新完成", 1);
        }

        private bool SaveComplete(string version)
        {
            // A disk-write error must not destroy a working session or the old version record.
            try { _versions.SaveComplete(_name, version); return true; }
            catch (Exception ex)
            {
                Debug.LogWarning($"[{_name}] 无法保存完整版本记录，下次启动将使用原记录：{ex.Message}");
                return false;
            }
        }

        private void OnDownloadProgress(DownloadProgressChangedEventArgs args)
        {
            Report("正在下载更新", args.Progress, args.CurrentDownloadBytes, args.TotalDownloadBytes);
        }

        private void Report(string message, float progress = 0, long downloaded = 0, long total = 0)
        {
            _progress?.Invoke(new PackageUpdateProgress { Message = message, Progress = progress, DownloadedBytes = downloaded, TotalBytes = total });
        }

        private void Begin(Action<PackageUpdateProgress> progress)
        {
            if (_busy) throw new InvalidOperationException("同一个资源包不能同时运行两个更新流程。");
            _busy = true;
            _cancelled = false;
            Succeeded = false;
            UsedLocal = false;
            Error = null;
            Version = null;
            _progress = progress;
        }

        private void End()
        {
            if (_downloader != null)
            {
                _downloader.DownloadProgressChanged -= OnDownloadProgress;
                if (!_downloader.IsDone) _downloader.CancelDownload();
                _downloader = null;
            }
            _localRequest?.Dispose();
            _localRequest = null;
            _busy = false;
            _progress = null;
        }

        // Unity does not propagate nested coroutine exceptions to the outer iterator. Flatten them
        // here so IO/manifest exceptions still reach the same local fallback as failed operations.
        private IEnumerator Guard(IEnumerator routine)
        {
            var stack = new Stack<IEnumerator>();
            stack.Push(routine);
            try
            {
                while (stack.Count > 0 && !_cancelled)
                {
                    var current = stack.Peek();
                    bool next;
                    object value = null;
                    try { next = current.MoveNext(); if (next) value = current.Current; }
                    catch (Exception ex) { Succeeded = false; Error = ex.Message; yield break; }
                    if (!next) { (stack.Pop() as IDisposable)?.Dispose(); continue; }
                    if (value is IEnumerator nested && !(value is HandleBase) && !(value is AsyncOperationBase) && !(value is CustomYieldInstruction)) stack.Push(nested);
                    else yield return value;
                }
            }
            finally { while (stack.Count > 0) (stack.Pop() as IDisposable)?.Dispose(); }
        }

        public void Cancel()
        {
            _cancelled = true;
            Succeeded = false;
            Error = "更新已取消。";
            if (_downloader != null && !_downloader.IsDone) _downloader.CancelDownload();
            _localRequest?.Abort();
        }

        public void Dispose() { Cancel(); End(); }

        private static string GetDefaultCacheRoot(string packageName)
        {
            // Match YooAsset 3.0.6 defaults to keep using previously downloaded bundle files.
#if UNITY_EDITOR
            string root = Path.Combine(Path.GetDirectoryName(Application.dataPath), "Library");
#elif UNITY_STANDALONE_WIN || UNITY_STANDALONE_LINUX
            string root = Application.dataPath;
#else
            string root = Application.persistentDataPath;
#endif
            return Path.Combine(root, YooAssetConfiguration.GetYooFolderName(), packageName);
        }
    }
}
