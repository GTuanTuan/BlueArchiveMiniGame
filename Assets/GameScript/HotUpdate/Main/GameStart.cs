using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.Rendering.Universal;
using YooAsset;

public class GameStart : MonoBehaviour
{
    [SerializeField] private string mainSceneAddress = "Player_GameDev";
    private readonly List<AudioListener> _mutedStartupListeners = new List<AudioListener>();
    private readonly List<Camera> _suspendedStartupCameras = new List<Camera>();
    private readonly List<UniversalAdditionalCameraData> _uiCameraHosts = new List<UniversalAdditionalCameraData>();
    private Camera _attachedUICamera;

    private void Start()
    {
        DontDestroyOnLoad(gameObject);
        StartCoroutine(StartupSequence());
    }

    private void OnDestroy()
    {
        foreach (var host in _uiCameraHosts)
            if (host != null && host.cameraStack != null) host.cameraStack.Remove(_attachedUICamera);
        _uiCameraHosts.Clear();
        foreach (var camera in _suspendedStartupCameras)
            if (camera != null) camera.enabled = true;
        _suspendedStartupCameras.Clear();
        RestoreStartupAudioListeners(keepActiveSceneListener: true);
        UIManager.Inst.Shutdown();
        GraphicsManager.Inst.Shutdown();
    }

    private IEnumerator StartupSequence()
    {
        Debug.Log("开始游戏启动流程...");
        if (!InitializeGameSystems())
            yield break;
        yield return null;

        SceneHandle sceneHandle = BeginMainSceneLoad();
        if (sceneHandle == null)
            yield break;

        bool finished = false;
        LoadingWindow loadingWindow = null;
        try
        {
            UIManager.Inst.ShowWindow<LoadingWindow>("LoadingWindow", UILayer.Overlay, window =>
            {
                // A cached or very small scene may finish before the UI loads.
                if (finished || !sceneHandle.IsValid || sceneHandle.IsDone)
                {
                    UIManager.Inst.HideWindow("LoadingWindow");
                    return;
                }
                loadingWindow = window;
                window.TrackOperation(sceneHandle);
            });
        }
        catch (Exception exception)
        {
            // Scene loading remains independent of the optional progress window.
            Debug.LogException(exception);
        }

        yield return sceneHandle;
        finished = true;
        if (loadingWindow != null)
            loadingWindow.StopTracking();
        UIManager.Inst.HideWindow("LoadingWindow");

        if (!sceneHandle.IsValid || sceneHandle.Status != EOperationStatus.Succeeded)
        {
            RestoreStartupAudioListeners();
            string error = sceneHandle.IsValid ? sceneHandle.Error : "Scene handle is no longer valid.";
            ReportStartupFailure("主场景加载失败", mainSceneAddress + "：" + error);
            if (sceneHandle.IsValid)
                sceneHandle.Release();
            yield break;
        }

        Scene loadedScene = sceneHandle.SceneObject;
        if (SceneManager.GetActiveScene() != loadedScene && !sceneHandle.ActivateScene())
        {
            RestoreStartupAudioListeners();
            ReportStartupFailure("主场景激活失败", mainSceneAddress);
            yield break;
        }

        CompleteStartupAudioHandoff(loadedScene);
        HandoffStartupCameras(loadedScene);

        var canvas = GameManager.Inst.MainUICanvas;
        if (canvas != null)
        {
            var patchWindow = canvas.transform.Find("PatchWindow");
            if (patchWindow != null)
                patchWindow.gameObject.SetActive(false);
        }

        // Keep the successful scene handle alive. YooAsset releases it when the
        // scene unloads; releasing here could unload resources used by the scene.
        Debug.Log($"游戏启动流程完成：{mainSceneAddress}");
        var bootstrap = FindObjectOfType<Boot>();
        if (bootstrap != null) bootstrap.OnGameStarted();
    }

    private void HandoffStartupCameras(Scene loadedScene)
    {
        // The loaded scene owns world rendering. Keep the persistent UI camera,
        // but stack it on gameplay and cut-in cameras instead of drawing the
        // entire world a second time through the old startup camera.
        Camera uiCamera = GameManager.Inst.UICamera;
        bool hasSceneBaseCamera = false;
        foreach (var root in loadedScene.GetRootGameObjects())
            foreach (var camera in root.GetComponentsInChildren<Camera>(true))
            {
                var data = camera.GetComponent<UniversalAdditionalCameraData>();
                if (data == null || data.renderType != CameraRenderType.Base) continue;
                if (camera.enabled && camera.gameObject.activeInHierarchy) hasSceneBaseCamera = true;
                if (uiCamera != null && !data.cameraStack.Contains(uiCamera))
                {
                    data.cameraStack.Add(uiCamera);
                    _uiCameraHosts.Add(data);
                }
            }
        _attachedUICamera = uiCamera;
        if (!hasSceneBaseCamera) return;
        foreach (var camera in FindObjectsOfType<Camera>(true))
        {
            if (camera == uiCamera || camera.gameObject.scene != gameObject.scene || !camera.enabled) continue;
            var data = camera.GetComponent<UniversalAdditionalCameraData>();
            if (data != null && data.renderType == CameraRenderType.Overlay) continue;
            camera.enabled = false;
            _suspendedStartupCameras.Add(camera);
        }
    }

    private void PrepareStartupAudioHandoff()
    {
        // Scene activation can enable its listener before the load handle resumes this coroutine.
        // Disable only currently active listeners before starting the load, saving exact ownership.
        foreach (var listener in FindObjectsOfType<AudioListener>(true))
        {
            if (!listener.enabled || !listener.gameObject.activeInHierarchy) continue;
            _mutedStartupListeners.Add(listener);
            listener.enabled = false;
        }
    }

    private void CompleteStartupAudioHandoff(Scene loadedScene)
    {
        foreach (var root in loadedScene.GetRootGameObjects())
            foreach (var listener in root.GetComponentsInChildren<AudioListener>(true))
                if (listener.enabled && listener.gameObject.activeInHierarchy)
                    return;
        // A scene without a listener can keep using the startup listener.
        RestoreStartupAudioListeners();
    }

    private void RestoreStartupAudioListeners(bool keepActiveSceneListener = false)
    {
        if (keepActiveSceneListener)
        {
            // Do not re-enable the old listener if gameplay still owns an active one.
            foreach (var listener in FindObjectsOfType<AudioListener>(true))
                if (listener.enabled && listener.gameObject.activeInHierarchy && !_mutedStartupListeners.Contains(listener))
                {
                    _mutedStartupListeners.Clear();
                    return;
                }
        }
        foreach (var listener in _mutedStartupListeners)
            if (listener != null) listener.enabled = true;
        _mutedStartupListeners.Clear();
    }

    private void ReportStartupFailure(string title, string error)
    {
        var bootstrap = FindObjectOfType<Boot>();
        if (bootstrap != null)
        {
            Debug.LogError(title + "：" + error);
            bootstrap.OnGameStartupFailed(title + "：" + error);
        }
        else GameManager.Inst.ShowStartupError(title, error);
    }

    private bool InitializeGameSystems()
    {
        try
        {
            GameSystem.Inst.Init();
            return true;
        }
        catch (Exception exception)
        {
            ReportStartupFailure("游戏系统初始化失败", exception.Message);
            Debug.LogException(exception);
            return false;
        }
    }

    private SceneHandle BeginMainSceneLoad()
    {
        if (string.IsNullOrWhiteSpace(mainSceneAddress))
        {
            ReportStartupFailure("主场景未配置", "请在GameStart上配置YooAsset场景地址。");
            return null;
        }
        try
        {
            // Mute before LoadSceneAsync: even cached scenes may activate before its caller resumes.
            PrepareStartupAudioHandoff();
            return YooAssets.GetPackage("Main").LoadSceneAsync(mainSceneAddress, LoadSceneMode.Single,
                LocalPhysicsMode.None, allowSceneActivation: true);
        }
        catch (Exception exception)
        {
            RestoreStartupAudioListeners();
            ReportStartupFailure("无法开始加载主场景", mainSceneAddress + "：" + exception.Message);
            Debug.LogException(exception);
            return null;
        }
    }
}
