using UnityEngine;
using System.IO;
using YooAsset;
using System;

public class SettingsManager: Singleton<SettingsManager>
{
    private GameSettings _currentSettings;
    public GameSettings CurrentSettings => _currentSettings;
    private string settingsPath;
    public SettingsManager()
    {
        settingsPath = Path.Combine(Application.persistentDataPath, "settings.json");
        LoadSettings();
        Debug.Log("SettingsManager 初始化完成");
    }

    public void LoadSettings()
    {
        if (File.Exists(settingsPath))
        {
            string json = File.ReadAllText(settingsPath);
            _currentSettings = JsonUtility.FromJson<GameSettings>(json);
        }
        else
        {
            ResetToDefaultSettings();
        }
    }

    public void SaveSettings()
    {
        string json = JsonUtility.ToJson(_currentSettings, true);
        File.WriteAllText(settingsPath, json);
    }
    public void ResetToDefaultSettings()
    {
        _currentSettings = new GameSettings();
        SaveSettings();
    }
}

[System.Serializable]
public class GameSettings
{
    public string serverAddress = "http://127.0.0.1:8080";

    public float masterVolume = 0.75f;

    public int qualityLevel = 2;
    public bool vsyncEnabled = true;
    public float shadowDistance = 50f;
    public int antiAliasing = 2;
    public bool bloomEnabled = true;
    public float renderScale = 1.0f;

    public int resolutionIndex = 0;
    public bool fullscreen = true;
    public bool borderless = false;
    public int displayIndex = 0;
}
public interface ISettingsPanel
{
    void ApplySettings();
    void ResetToDefault();
}