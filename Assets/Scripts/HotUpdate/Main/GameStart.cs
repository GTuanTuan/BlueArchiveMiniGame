using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using YooAsset;

public class GameStart : MonoBehaviour
{
    SceneHandle sceneHandle;
    void Start()
    {
        DontDestroyOnLoad(gameObject);
        StartCoroutine(LoadScene());
        StartCoroutine(LoadUIManager());
    }
    IEnumerator LoadScene()
    {
        sceneHandle = YooAssets.LoadSceneAsync("MirrorRoomOffline");
        //sceneHandle = YooAssets.LoadSceneAsync("Game");
        sceneHandle.Completed += (handle) =>
        {
            handle.ActivateScene();
            StartCoroutine(LoadNetWorkHUD());
        };
        yield return sceneHandle;
    }
    IEnumerator LoadUIManager()
    {
        AssetHandle _handle = YooAssets.LoadAssetAsync<GameObject>("UIManager");
        _handle.Completed += (handle) =>
        {
            GameObject go = Instantiate((GameObject)_handle.AssetObject);
            DontDestroyOnLoad(go);
            Debug.Log(_handle.AssetObject);
        };
        yield return _handle;
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
    // Update is called once per frame
    void Update()
    {
        if(sceneHandle!=null && sceneHandle.IsValid)
        {
            Debug.Log(sceneHandle.Progress);
        }
    }
}
