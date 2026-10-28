using System;
using System.Collections.Generic;
using UnityEngine;
using YooAsset;

public enum UILayer { Screen, Window, Overlay }
public enum UIWindowState { None, Loading, Hidden, Visible }

/// <summary>One address identifies one window. All methods run on Unity's main thread.</summary>
public sealed class UIManager : Singleton<UIManager>
{
    private sealed class Entry
    {
        public Type Type;
        public UILayer Layer;
        public UIBaseWindow Window;
        public IUIAssetRequest Request;
        public Action<IUIAssetRequest> Completion;
        public bool WantsVisible = true;
        public bool Presenting;
        public int Revision;
        public readonly List<Action<UIBaseWindow>> Callbacks = new List<Action<UIBaseWindow>>();
    }

    private readonly Dictionary<string, Entry> _windows = new Dictionary<string, Entry>(StringComparer.Ordinal);
    private readonly Dictionary<UILayer, Transform> _layers = new Dictionary<UILayer, Transform>();
    private Transform _container;
    private Transform _root;
    private Transform _staging;
    private IUIAssetLoader _loader;
    public event Action<string, string> WindowLoadFailed;
    public UISpriteAtlasCache Atlases { get; private set; }

    public void Init(Transform container) => Init(container, YooAssets.GetPackage("Main"));

    public void Init(Transform container, ResourcePackage package)
    {
        Init(container, new YooUIAssetLoader(package));
        Atlases = new UISpriteAtlasCache(package);
    }

    // The small loader seam also allows deterministic completion-order tests.
    public void Init(Transform container, IUIAssetLoader loader)
    {
        if (container == null) throw new ArgumentNullException(nameof(container));
        if (loader == null) throw new ArgumentNullException(nameof(loader));
        Shutdown();
        _container = container;
        _loader = loader;
        _root = CreateRoot("Game UI", container);
        foreach (UILayer layer in Enum.GetValues(typeof(UILayer)))
            _layers.Add(layer, CreateRoot(layer.ToString(), _root));
        _staging = CreateRoot("Pending UI", _root);
        _staging.gameObject.SetActive(false);
    }

    private static Transform CreateRoot(string name, Transform parent)
    {
        var root = new GameObject(name, typeof(RectTransform)).GetComponent<RectTransform>();
        root.SetParent(parent, false);
        root.anchorMin = Vector2.zero;
        root.anchorMax = Vector2.one;
        root.offsetMin = root.offsetMax = Vector2.zero;
        return root;
    }

    public void ShowWindow<T>(string windowName, Action<T> onShow = null) where T : UIBaseWindow
        => ShowWindow(windowName, UILayer.Window, onShow);

    public void ShowWindow<T>(string windowName, UILayer layer, Action<T> onShow = null) where T : UIBaseWindow
    {
        if (_container == null || _root == null || _loader == null)
            throw new InvalidOperationException("Initialize UIManager with a live UI container before opening a window.");
        if (string.IsNullOrWhiteSpace(windowName)) throw new ArgumentException("A UI address is required.", nameof(windowName));
        if (!_layers.ContainsKey(layer)) throw new ArgumentOutOfRangeException(nameof(layer));

        if (_windows.TryGetValue(windowName, out var entry) && entry.Request == null && entry.Window == null)
        {
            _windows.Remove(windowName);
            entry = null;
        }
        if (entry != null && !typeof(T).IsAssignableFrom(entry.Type))
            throw new InvalidOperationException($"Window '{windowName}' was opened as {entry.Type.Name}, not {typeof(T).Name}.");

        bool load = entry == null;
        if (load)
        {
            entry = new Entry { Type = typeof(T), Layer = layer };
            _windows.Add(windowName, entry);
        }
        entry.WantsVisible = true;
        entry.Layer = layer;
        if (onShow != null) entry.Callbacks.Add(window => onShow((T)window));
        if (!load)
        {
            if (entry.Window != null) Present(windowName, entry);
            return;
        }

        try
        {
            entry.Request = _loader.LoadPrefab(windowName);
            if (entry.Request == null) throw new InvalidOperationException("UI loader returned no request.");
            var captured = entry;
            entry.Completion = request => Complete(windowName, captured, request);
            if (entry.Request.IsDone) Complete(windowName, entry, entry.Request);
            else entry.Request.Completed += entry.Completion;
        }
        catch (Exception exception) { Fail(windowName, entry, exception.Message); }
    }

    private void Complete(string address, Entry entry, IUIAssetRequest request)
    {
        if (entry.Completion != null) request.Completed -= entry.Completion;
        if (!IsCurrent(address, entry)) { request.Dispose(); return; }
        var prefab = request.Prefab;
        if (prefab == null || prefab.GetComponent(entry.Type) == null)
        {
            Fail(address, entry, $"Expected {entry.Type.Name} on UI prefab. {request.Error}");
            return;
        }

        GameObject instance = null;
        try
        {
            // No Awake/OnEnable until ownership and visibility are established.
            instance = UnityEngine.Object.Instantiate(prefab, _staging, false);
            instance.name = address;
            instance.SetActive(false);
            UIWindowAssetLifetime.Track(instance, request);
            entry.Request = null;
            entry.Window = instance.GetComponent(entry.Type) as UIBaseWindow;
            instance.transform.SetParent(_layers[entry.Layer], false);
            entry.Window.SetAddress(address);
            if (entry.WantsVisible) Present(address, entry);
        }
        catch (Exception exception)
        {
            if (instance != null)
            {
                if (entry.Request != null)
                {
                    UIWindowAssetLifetime.Track(instance, request);
                    entry.Request = null;
                }
                UnityEngine.Object.Destroy(instance);
            }
            Fail(address, entry, exception.Message);
        }
    }

    private void Present(string address, Entry entry)
    {
        if (entry.Presenting) return;
        entry.Presenting = true;
        int revision = entry.Revision;
        try
        {
            entry.Window.transform.SetParent(_layers[entry.Layer], false);
            entry.Window.transform.SetAsLastSibling();
            entry.Window.Show();
            // OnShow/callbacks may Hide, Destroy, Clear, or Show another window.
            while (IsCurrent(address, entry) && entry.WantsVisible && entry.Window != null &&
                entry.Revision == revision && entry.Callbacks.Count > 0)
            {
                var callback = entry.Callbacks[0];
                entry.Callbacks.RemoveAt(0);
                try { callback(entry.Window); }
                catch (Exception exception) { Debug.LogException(exception); }
            }
        }
        catch (Exception exception) { Fail(address, entry, exception.Message); }
        finally { entry.Presenting = false; }
        // A Hide -> Show inside a callback starts a new visibility request.
        if (IsCurrent(address, entry) && entry.WantsVisible && entry.Window != null && entry.Revision != revision)
            Present(address, entry);
    }

    public void HideWindow(string windowName)
    {
        if (!_windows.TryGetValue(windowName, out var entry)) return;
        entry.WantsVisible = false;
        entry.Revision++;
        entry.Callbacks.Clear();
        if (entry.Window != null) entry.Window.Hide();
    }

    public UIWindowState GetState(string address)
    {
        if (!_windows.TryGetValue(address, out var entry)) return UIWindowState.None;
        if (entry.Request != null) return UIWindowState.Loading;
        if (entry.Window == null) return UIWindowState.None;
        return entry.Window.IsVisible ? UIWindowState.Visible : UIWindowState.Hidden;
    }

    public bool CheckShow(string windowName) => GetState(windowName) == UIWindowState.Visible;

    public void DestroyWindow(string windowName)
    {
        if (!_windows.TryGetValue(windowName, out var entry)) return;
        _windows.Remove(windowName);
        Release(entry);
    }

    public void Clear()
    {
        var entries = new List<Entry>(_windows.Values);
        _windows.Clear();
        foreach (var entry in entries) Release(entry);
    }

    public void Shutdown()
    {
        Clear();
        Atlases?.Dispose();
        Atlases = null;
        if (_root != null) UnityEngine.Object.Destroy(_root.gameObject);
        _layers.Clear();
        _root = _staging = _container = null;
        _loader = null;
    }

    private void Release(Entry entry)
    {
        entry.Callbacks.Clear();
        entry.WantsVisible = false;
        entry.Revision++;
        if (entry.Request != null)
        {
            entry.Request.Completed -= entry.Completion;
            entry.Request.Dispose();
            entry.Request = null;
        }
        if (entry.Window != null)
        {
            try { entry.Window.Hide(); }
            catch (Exception exception) { Debug.LogException(exception); }
            UnityEngine.Object.Destroy(entry.Window.gameObject);
        }
    }

    private bool IsCurrent(string address, Entry entry) =>
        _windows.TryGetValue(address, out var current) && ReferenceEquals(current, entry);

    private void Fail(string address, Entry entry, string error)
    {
        if (IsCurrent(address, entry)) _windows.Remove(address);
        Release(entry);
        Debug.LogError($"UI '{address}': {error}");
        try { WindowLoadFailed?.Invoke(address, error); }
        catch (Exception exception) { Debug.LogException(exception); }
    }
}
