using System;
using UnityEngine;
using YooAsset;

/// <summary>The UI owns each request until it transfers the lease to an instance.</summary>
public interface IUIAssetRequest : IDisposable
{
    bool IsDone { get; }
    GameObject Prefab { get; }
    string Error { get; }
    event Action<IUIAssetRequest> Completed;
}

public interface IUIAssetLoader
{
    IUIAssetRequest LoadPrefab(string address);
}

public sealed class YooUIAssetLoader : IUIAssetLoader
{
    private readonly ResourcePackage _package;
    public YooUIAssetLoader(ResourcePackage package)
    {
        _package = package ?? throw new ArgumentNullException(nameof(package));
    }

    public IUIAssetRequest LoadPrefab(string address) => new Request(_package.LoadAssetAsync<GameObject>(address));

    private sealed class Request : IUIAssetRequest
    {
        private AssetHandle _handle;
        public event Action<IUIAssetRequest> Completed;
        public bool IsDone => _handle == null || _handle.IsDone;
        public GameObject Prefab => _handle != null && _handle.IsValid &&
            _handle.Status == EOperationStatus.Succeeded ? _handle.AssetObject as GameObject : null;
        public string Error => _handle == null ? "UI request was released." : _handle.Error;

        public Request(AssetHandle handle)
        {
            _handle = handle;
            if (!handle.IsDone) handle.Completed += OnCompleted;
        }

        private void OnCompleted(AssetHandle _) => Completed?.Invoke(this);

        public void Dispose()
        {
            var handle = _handle;
            _handle = null;
            Completed = null;
            if (handle == null) return;
            handle.Completed -= OnCompleted;
            if (handle.IsValid) handle.Release();
        }
    }
}
