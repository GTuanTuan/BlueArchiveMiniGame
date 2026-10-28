using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using YooAsset;

public static class YooAssetsExtension
{
    public static LoadGameObjectOperation LoadGameObjectAsync(this ResourcePackage resourcePackage, string location, Vector3 position, Quaternion rotation, Transform parent, bool destroyGoOnRelease = false)
    {
        var operation = new LoadGameObjectOperation(resourcePackage, location, position, rotation, parent, destroyGoOnRelease);
        resourcePackage.StartOperation(operation);
        return operation;
    }
}

public class LoadGameObjectOperation : CustomAsyncOperation
{
    private enum ESteps
    {
        None,
        LoadAsset,
        Done,
    }

    private readonly ResourcePackage _resourcePackage;
    private readonly string _location;
    private readonly Vector3 _positon;
    private readonly Quaternion _rotation;
    private readonly Transform _parent;
    private readonly bool _destroyGoOnRelease;
    private AssetHandle _handle;
    private ESteps _steps = ESteps.None;

    /// <summary>
    /// 加载的游戏对象
    /// </summary>
    public GameObject Go { private set; get; }


    public LoadGameObjectOperation(string location, Vector3 position, Quaternion rotation, Transform parent, bool destroyGoOnRelease = false)
        : this(YooAssets.GetPackage("DefaultPackage"), location, position, rotation, parent, destroyGoOnRelease) { }

    public LoadGameObjectOperation(ResourcePackage resourcePackage, string location, Vector3 position, Quaternion rotation, Transform parent, bool destroyGoOnRelease = false)
    {
        _resourcePackage = resourcePackage ?? throw new ArgumentNullException(nameof(resourcePackage));
        _location = location;
        _positon = position;
        _rotation = rotation;
        _parent = parent;
        _destroyGoOnRelease = destroyGoOnRelease;
    }
    protected override void InternalStart()
    {
        _steps = ESteps.LoadAsset;
    }
    protected override void InternalUpdate()
    {
        if (_steps == ESteps.None || _steps == ESteps.Done)
            return;

        if (_steps == ESteps.LoadAsset)
        {
            if (_handle == null)
            {
                _handle = _resourcePackage.LoadAssetAsync<GameObject>(_location);
            }

            Progress = _handle.Progress;
            if (_handle.IsDone == false)
                return;

            if (_handle.Status != EOperationStatus.Succeeded)
            {
                SetError(_handle.Error);
                _steps = ESteps.Done;
            }
            else
            {
                Go = _handle.InstantiateSync(new InstantiateOptions(true, _parent, _positon, _rotation));
                SetResult();
                _steps = ESteps.Done;
            }
        }
    }
    protected override void InternalDispose()
    {
        // Successful loads remain owned by the caller until ReleaseHandle().
        // A failed or aborted operation must not retain its resource handle.
        if (Status == EOperationStatus.Failed)
            ReleaseHandle();
    }

    /// <summary>
    /// 释放资源句柄
    /// </summary>
    public void ReleaseHandle()
    {
        if (_handle != null)
        {
            _handle.Release();
            _handle = null;

            if (_destroyGoOnRelease)
            {
                if (Go != null)
                    GameObject.Destroy(Go);
            }
        }
    }
}
