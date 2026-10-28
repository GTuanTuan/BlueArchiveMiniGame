using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using BA.Bootstrap;
using UnityEngine;
using YooAsset;

// Shared game context retained for existing gameplay. Resource update policy lives in PackageUpdater.
public class GameManager
{
    public MonoBehaviour Behaviour;
    public string ServerAddress;
    public bool isServer;
    public GameObject MainUICanvas;
    public Camera UICamera;
    private static GameManager _instance;
    public static GameManager Inst => _instance ?? (_instance = new GameManager());

    public void StartCoroutine(IEnumerator enumerator) { Behaviour.StartCoroutine(enumerator); }
    public bool TryLoadDll(ResourcePackage package, string dll, out string error)
        => HotUpdateLoader.TryLoadDll(package, dll, out error);
    public bool TryLoadAotMetadata(ResourcePackage preload, IList<string> fallbackNames, out string error)
        => HotUpdateLoader.TryLoadAotMetadata(preload, fallbackNames, out error);

    public void ShowStartupError(string title, string error)
    {
        Debug.LogError(title + "：" + error);
        var box = MessageBox.Show();
        if (box != null) box.SetTitle(title).SetContent(error + "\n请检查资源或网络后重新启动。").AddButton("知道了");
    }

    public void LoadServerSettings()
    {
        var settings = ReadServerSettings("settings.json") ?? new ServerSettings();
        ServerAddress = settings.serverAddress;
        isServer = settings.isServer;
        // The hot-update settings window owns game-settings.json. Read only its stable
        // connection field so AOT startup does not depend on the Main assembly's schema.
        var gameSettings = ReadServerSettings("game-settings.json");
        if (gameSettings != null) ServerAddress = gameSettings.serverAddress;
    }

    private static ServerSettings ReadServerSettings(string fileName)
    {
        string path = Path.Combine(Application.persistentDataPath, fileName);
        if (!File.Exists(path)) return null;
        try { return JsonUtility.FromJson<ServerSettings>(File.ReadAllText(path)); }
        catch (Exception ex)
        {
            Debug.LogWarning("无法读取连接设置 " + fileName + "，使用默认连接：" + ex.Message);
            return null;
        }
    }

    [Serializable] public class ServerSettings
    {
        public string serverAddress;
        public bool isServer;
    }
}
