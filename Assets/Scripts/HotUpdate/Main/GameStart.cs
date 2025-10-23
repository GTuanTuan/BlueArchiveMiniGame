using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using YooAsset;

public class GameStart : MonoBehaviour
{

    void Start()
    {
        DontDestroyOnLoad(gameObject);
        StartCoroutine(StartupSequence());
    }

    IEnumerator StartupSequence()
    {
        Debug.Log("开始游戏启动流程...");

        yield return StartCoroutine(InitializeGameSystems());

        yield return StartCoroutine(LoadMainScene());

        Debug.Log("游戏启动流程完成");
    }

    IEnumerator InitializeGameSystems()
    {
        Debug.Log("初始化游戏系统...");
        GameSystem.Inst.Init();
        Debug.Log("游戏系统初始化完成");
        yield return null;
    }
    IEnumerator LoadMainScene()
    {
        SceneHandle sceneHandle = YooAssets.LoadSceneAsync("MirrorRoomOffline");
        UIManager.Inst.ShowWindow<LoadingWindow>("LoadingWindow", window =>
        {
            window.TrackOperation(sceneHandle);
            sceneHandle.UnSuspend();
        });
        sceneHandle.Completed += (handle) =>
        {
            GameManager.Inst.MainUICanvas.transform.Find("PatchWindow").gameObject.SetActive(false);
            handle.ActivateScene();
            StartCoroutine(LoadNetWorkHUD());
        };
        yield return sceneHandle;
    }
    IEnumerator LoadNetWorkHUD()
    {
        AssetHandle _handle = YooAssets.LoadAssetAsync<GameObject>("MyNetWorkHUD");
        _handle.Completed += (handle) =>
        {
            GameObject go = Instantiate((GameObject)_handle.AssetObject,GameManager.Inst.MainUICanvas.transform);
            Debug.Log(_handle.AssetObject);
        };
        yield return _handle;
    }
}
