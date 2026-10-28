using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using YooAsset;

/// <summary>
/// 拷贝内置清单文件到沙盒目录
/// </summary>
public class CopyBuildinManifestOperation : CustomAsyncOperation
{
    private enum ESteps
    {
        None,
        CheckHashFile,
        UnpackHashFile,
        CheckManifestFile,
        UnpackManifestFile,
        Done,
    }

    private readonly string _packageName;
    private readonly string _packageVersion;
    private ESteps _steps = ESteps.None;
    private IDownloadFileRequest _hashFileRequestOp;
    private IDownloadFileRequest _manifestFileRequestOp;

    public CopyBuildinManifestOperation(string packageName, string packageVersion)
    {
        _packageName = packageName;
        _packageVersion = packageVersion;
    }
    protected override void InternalStart()
    {
        _steps = ESteps.CheckHashFile;
    }
    protected override void InternalUpdate()
    {
        if (_steps == ESteps.None || _steps == ESteps.Done)
            return;

        if (_steps == ESteps.CheckHashFile)
        {
            string hashFilePath = GetCacheHashFilePath();
            if (File.Exists(hashFilePath))
            {
                _steps = ESteps.CheckManifestFile;
                return;
            }

            _steps = ESteps.UnpackHashFile;
        }

        if (_steps == ESteps.UnpackHashFile)
        {
            if(_hashFileRequestOp == null)
            {
                string sourcePath = GetBuildinHashFilePath();
                string destPath = GetCacheHashFilePath();
                Directory.CreateDirectory(Path.GetDirectoryName(destPath));
                string url = DownloadUrlHelper.ToLocalFileUrl(sourcePath);
                _hashFileRequestOp = new UnityWebRequestFile(new DownloadFileRequestArgs(url, 60, 0, destPath), null);
                _hashFileRequestOp.SendRequest();
            }

            if (_hashFileRequestOp.IsDone == false)
                return;

            if (_hashFileRequestOp.Status == EDownloadRequestStatus.Succeeded)
            {
                _steps = ESteps.CheckManifestFile;
            }
            else
            {
                _steps = ESteps.Done;
                SetError(_hashFileRequestOp.Error);
            }
        }

        if (_steps == ESteps.CheckManifestFile)
        {
            string manifestFilePath = GetCacheManifestFilePath();
            if (File.Exists(manifestFilePath))
            {
                _steps = ESteps.Done;
                SetResult();
                return;
            }

            _steps = ESteps.UnpackManifestFile;
        }

        if (_steps == ESteps.UnpackManifestFile)
        {
            if (_manifestFileRequestOp == null)
            {
                string sourcePath = GetBuildinManifestFilePath();
                string destPath = GetCacheManifestFilePath();
                Directory.CreateDirectory(Path.GetDirectoryName(destPath));
                string url = DownloadUrlHelper.ToLocalFileUrl(sourcePath);
                _manifestFileRequestOp = new UnityWebRequestFile(new DownloadFileRequestArgs(url, 60, 0, destPath), null);
                _manifestFileRequestOp.SendRequest();
            }

            if (_manifestFileRequestOp.IsDone == false)
                return;

            if (_manifestFileRequestOp.Status == EDownloadRequestStatus.Succeeded)
            {
                _steps = ESteps.Done;
                SetResult();
            }
            else
            {
                _steps = ESteps.Done;
                SetError(_manifestFileRequestOp.Error);
            }
        }
    }
    protected override void InternalDispose()
    {
        _hashFileRequestOp?.Dispose();
        _manifestFileRequestOp?.Dispose();
        _hashFileRequestOp = null;
        _manifestFileRequestOp = null;
    }

    private string GetBuildinYooRoot()
    {
        return YooAssetConfiguration.GetDefaultBuiltinRoot();
    }
    private string GetBuildinHashFilePath()
    {
        string fileRoot = GetBuildinYooRoot();
        string fileName = YooAssetConfiguration.GetPackageHashFileName(_packageName, _packageVersion);
        return PathUtility.Combine(fileRoot, _packageName, fileName);
    }
    private string GetBuildinManifestFilePath()
    {
        string fileRoot = GetBuildinYooRoot();
        string fileName = YooAssetConfiguration.GetManifestBinaryFileName(_packageName, _packageVersion);
        return PathUtility.Combine(fileRoot, _packageName, fileName);
    }

    private string GetCacheYooRoot()
    {
        return PathUtility.Combine(YooAssetConfiguration.GetDefaultCacheRoot(_packageName), SandboxFileSystemConsts.ManifestFilesFolderName);
    }
    private string GetCacheHashFilePath()
    {
        string fileRoot = GetCacheYooRoot();
        string fileName = YooAssetConfiguration.GetPackageHashFileName(_packageName, _packageVersion);
        return PathUtility.Combine(fileRoot, fileName);
    }
    private string GetCacheManifestFilePath()
    {
        string fileRoot = GetCacheYooRoot();
        string fileName = YooAssetConfiguration.GetManifestBinaryFileName(_packageName, _packageVersion);
        return PathUtility.Combine(fileRoot, fileName);
    }
}
