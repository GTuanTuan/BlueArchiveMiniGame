using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using BA.Bootstrap;
using UnityEngine;
using YooAsset;

public class Boot : SingletonMono<Boot>
{
    public GameObject MainUICanvas;
    public Camera UICamera;
    public List<string> DepDlls = new List<string> {
        "Cinemachine.dll", "Mirror.Components.dll", "Mirror.dll", "MyScripts.Runtime.dll",
        "System.Core.dll", "Unity.InputSystem.dll", "UnityEngine.CoreModule.dll",
        "UnityEngine.JSONSerializeModule.dll", "YooAsset.dll", "mscorlib.dll"
    };
    public List<GameObject> DontDestroyObjs = new List<GameObject>();
    public EPlayMode PlayMode = EPlayMode.EditorSimulateMode;
    [SerializeField] private string defaultServer = "https://gtuantuan.online:9444";
    [SerializeField] private string contentChannel = "v1";
    private PackageUpdater _preload;
    private PackageUpdater _main;
    private LocalVersionStore _versions;
    private string _loadingPackage;
    private GameObject _window;
    private IPatchView _view;
    private AssetHandle _windowHandle;
    private bool _mainLoaded;
    private bool _gameReady;
    private bool _running;

    private void Awake()
    {
        Application.targetFrameRate = 60;
        Application.runInBackground = true;
        DontDestroyOnLoad(gameObject);
    }

    private void Start() { StartCoroutine(Run(Startup())); }

    private IEnumerator Startup()
    {
        foreach (var obj in DontDestroyObjs) if (obj != null) DontDestroyOnLoad(obj);
        if (MainUICanvas == null) throw new InvalidOperationException("Boot 未绑定 MainUICanvas。");
        GameManager.Inst.Behaviour = this;
        GameManager.Inst.MainUICanvas = MainUICanvas;
        GameManager.Inst.UICamera = UICamera;
        GameManager.Inst.LoadServerSettings();
        if (!YooAssets.IsInitialized) YooAssets.Initialize();
        string compatibility = Application.version + "|" + contentChannel + "|" + PlatformFolder();
        var versions = new LocalVersionStore(Path.Combine(Application.persistentDataPath, "ResourceVersions"), compatibility);
        _versions = versions;
        if (!string.IsNullOrEmpty(versions.LastDiagnostic)) Debug.LogWarning(versions.LastDiagnostic);
        _preload = CreateUpdater("Preload", versions, true);
        _main = CreateUpdater("Main", versions, false);

        // Local-first startup UI. Download its next version only after gameplay starts.
        _loadingPackage = "Preload";
        yield return _preload.LoadLocal();
        if (!_preload.Succeeded) throw new InvalidOperationException("更新界面资源不可用：" + _preload.Error);
        if (!HotUpdateLoader.TryLoadAotMetadata(_preload.Package, DepDlls, out var error) ||
            !HotUpdateLoader.TryLoadDll(_preload.Package, "Preload", out error))
            throw new InvalidOperationException(error);
        _windowHandle = _preload.Package.LoadAssetAsync<GameObject>("PatchWindow");
        yield return _windowHandle;
        if (_windowHandle.Status != EOperationStatus.Succeeded || _windowHandle.AssetObject == null)
            throw new InvalidOperationException("无法加载更新界面：" + _windowHandle.Error);
        _window = Instantiate((GameObject)_windowHandle.AssetObject, MainUICanvas.transform);
        _window.name = "PatchWindow";
        foreach (var behaviour in _window.GetComponents<MonoBehaviour>())
            if (behaviour is IPatchView view) { _view = view; break; }
        if (_view == null) throw new InvalidOperationException("Preload 更新界面不支持当前启动接口，请重新构建内置 Preload 和安装包。");
        var background = MainUICanvas.transform.Find("InitBg");
        if (background != null) background.gameObject.SetActive(false);
        yield return StartMain();
    }

    private IEnumerator StartMain()
    {
        _loadingPackage = null;
        yield return _main.UpdateOrFallback(progress => _view?.Render(progress));
        if (!_main.Succeeded) throw new InvalidOperationException(_main.Error);
        _view?.Render(new PackageUpdateProgress { Message = _main.UsedLocal ? "使用本地版本，正在进入游戏" : "正在进入游戏", Progress = 1 });
        _loadingPackage = "Main";
        _mainLoaded = true;
        if (!HotUpdateLoader.TryLoadDll(_main.Package, "Main", out var error)) throw new InvalidOperationException(error);
        var entry = _main.Package.LoadAssetAsync<GameObject>("GameStart");
        yield return entry;
        if (entry.Status != EOperationStatus.Succeeded || entry.AssetObject == null)
        {
            string failure = entry.Error;
            entry.Release();
            throw new InvalidOperationException("游戏入口加载失败：" + failure);
        }
        GameObject instance = null;
        try
        {
            instance = Instantiate((GameObject)entry.AssetObject);
            instance.AddComponent<StartupAssetOwner>().Own(entry);
        }
        finally { if (instance == null) entry.Release(); }
    }

    // Main calls this only after its entry scene has loaded and activated.
    public void OnGameStarted()
    {
        if (_gameReady) return;
        _gameReady = true;
        _loadingPackage = null;
        StartCoroutine(FinishStartup());
    }

    public void OnGameStartupFailed(string message)
    {
        QuarantineFailedVersion();
        _view?.ShowFailure(message + "\n请重新启动以使用之前的资源版本。", null);
    }

    private void QuarantineFailedVersion()
    {
        var updater = _loadingPackage == "Preload" ? _preload : _loadingPackage == "Main" ? _main : null;
        if (updater == null || string.IsNullOrEmpty(updater.Version) || PlayMode != EPlayMode.HostPlayMode) return;
        try { _versions.RejectVersion(_loadingPackage, updater.Version); }
        catch (Exception ex) { Debug.LogWarning("无法保存失败版本记录：" + ex.Message); }
    }

    private IEnumerator FinishStartup()
    {
        _view = null;
        if (_window != null) Destroy(_window);
        _window = null;
        yield return null;
        _windowHandle?.Release();
        _windowHandle = null;
        var package = _preload.Package;
        yield return package.UnloadUnusedAssetsAsync();
        if (PlayMode == EPlayMode.HostPlayMode)
        {
            yield return _preload.PrefetchNext();
            if (!_preload.Succeeded) Debug.LogWarning("更新界面后台更新未完成，下次继续使用本地版本：" + _preload.Error);
            else Debug.Log("更新界面已准备，下次启动使用：" + _preload.Version);
        }
        yield return package.DestroyPackageAsync();
        YooAssets.RemovePackage(package.PackageName);
    }

    private PackageUpdater CreateUpdater(string name, LocalVersionStore versions, bool builtin)
    {
        string server = string.IsNullOrWhiteSpace(GameManager.Inst.ServerAddress) ? defaultServer : GameManager.Inst.ServerAddress;
        string root = $"{server.TrimEnd('/')}/{Application.productName}/CDN/{PlatformFolder()}/{name}/{contentChannel}";
        return new PackageUpdater(name, PlayMode, new PatchRemoteService(root), versions, useBuiltin: builtin);
    }

    private static string PlatformFolder()
    {
#if UNITY_EDITOR
        switch (UnityEditor.EditorUserBuildSettings.activeBuildTarget)
        {
            case UnityEditor.BuildTarget.Android: return "Android";
            case UnityEditor.BuildTarget.iOS: return "IPhone";
            case UnityEditor.BuildTarget.WebGL: return "WebGL";
            default: return "PC";
        }
#else
        switch (Application.platform)
        {
            case RuntimePlatform.Android: return "Android";
            case RuntimePlatform.IPhonePlayer: return "IPhone";
            case RuntimePlatform.WebGLPlayer: return "WebGL";
            default: return "PC";
        }
#endif
    }

    private IEnumerator Run(IEnumerator routine)
    {
        if (_running) yield break;
        _running = true;
        var stack = new Stack<IEnumerator>();
        stack.Push(routine);
        string error = null;
        try
        {
            while (stack.Count > 0)
            {
                bool next;
                object value = null;
                try { next = stack.Peek().MoveNext(); if (next) value = stack.Peek().Current; }
                catch (Exception ex) { error = ex.Message; break; }
                if (!next) { (stack.Pop() as IDisposable)?.Dispose(); continue; }
                // YooAsset handles implement IDisposable for resource ownership, not iterator cleanup.
                // Yield them to Unity intact; only dispose the coroutine iterators that we own.
                if (value is IEnumerator nested && !(value is HandleBase) && !(value is AsyncOperationBase) && !(value is CustomYieldInstruction)) stack.Push(nested);
                else yield return value;
            }
        }
        finally
        {
            while (stack.Count > 0) (stack.Pop() as IDisposable)?.Dispose();
            _running = false;
        }
        if (error == null) yield break;
        QuarantineFailedVersion();
        Debug.LogError("启动未完成：" + error);
        if (_view != null)
            _view.ShowFailure(_mainLoaded ? error + "\n请重新启动以使用之前的资源版本。" : error,
                _mainLoaded ? null : (Action)(() => StartCoroutine(Run(StartMain()))));
        else GameManager.Inst.ShowStartupError("启动未完成", error + "\n请重新启动，系统将尝试之前的完整版本或内置资源。");
    }

    private void OnDestroy()
    {
        StopAllCoroutines();
        _main?.Dispose();
        _preload?.Dispose();
        if (_window != null) Destroy(_window);
        _windowHandle?.Release();
        _windowHandle = null;
    }
}
