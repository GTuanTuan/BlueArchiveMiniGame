using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using YooAsset;

public class LoadAssetsByTagOperation<TObject> : CustomAsyncOperation where TObject : UnityEngine.Object
{
    private enum ESteps
    {
        None,
        LoadAssets,
        CheckResult,
        Done,
    }

    private readonly ResourcePackage _resourcePackage;
    private readonly string _tag;
    private ESteps _steps = ESteps.None;
    private List<AssetHandle> _handles;

    /// <summary>
    /// 资源对象集合
    /// </summary>
    public List<TObject> AssetObjects { private set; get; }


    public LoadAssetsByTagOperation(string tag) : this(YooAssets.GetPackage("DefaultPackage"), tag) { }

    public LoadAssetsByTagOperation(ResourcePackage resourcePackage, string tag)
    {
        _resourcePackage = resourcePackage ?? throw new ArgumentNullException(nameof(resourcePackage));
        _tag = tag;
    }
    protected override void InternalStart()
    {
        _steps = ESteps.LoadAssets;
    }
    protected override void InternalUpdate()
    {
        if (_steps == ESteps.None || _steps == ESteps.Done)
            return;

        if (_steps == ESteps.LoadAssets)
        {
            AssetInfo[] assetInfos = _resourcePackage.GetAssetInfos(_tag);
            _handles = new List<AssetHandle>(assetInfos.Length);
            foreach (var assetInfo in assetInfos)
            {
                var handle = _resourcePackage.LoadAssetAsync(assetInfo);
                _handles.Add(handle);
            }
            _steps = ESteps.CheckResult;
        }

        if (_steps == ESteps.CheckResult)
        {
            int index = 0;
            foreach (var handle in _handles)
            {			
                if (handle.IsDone == false)
                {
                    Progress = (float)index / _handles.Count;
                    return;
                }
                index++;
            }

            AssetObjects = new List<TObject>(_handles.Count);
            foreach (var handle in _handles)
            {
                if (handle.Status == EOperationStatus.Succeeded)
                {
                    var assetObject = handle.AssetObject as TObject;
                    if (assetObject != null)
                    {
                        AssetObjects.Add(assetObject);
                    }
                    else
                    {
                        string error = $"资源类型转换失败：{handle.AssetObject?.name ?? "null"}";
                        Debug.LogError($"{error}");
                        AssetObjects.Clear();
                        SetFinish(false, error);
                        return;
                    }
                }
                else
                {
                    Debug.LogError($"{handle.Error}");
                    AssetObjects.Clear();
                    SetFinish(false, handle.Error);
                    return;
                }
            }

            SetFinish(true);
        }
    }
    protected override void InternalDispose()
    {
        if (Status == EOperationStatus.Failed)
            ReleaseHandle();
    }
    private void SetFinish(bool succeed, string error = "")
    {
        if (succeed) SetResult();
        else SetError(error);
        _steps = ESteps.Done;
    }

    /// <summary>
    /// 释放资源句柄
    /// </summary>
    public void ReleaseHandle()
    {
        if (_handles == null) return;
        foreach (var handle in _handles)
        {
            handle.Release();
        }
        _handles.Clear();
    }
}
