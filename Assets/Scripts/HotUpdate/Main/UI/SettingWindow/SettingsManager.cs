using UnityEngine;
using System.IO;
using YooAsset;
using System;
using System.Drawing.Printing;

public class SettingsManager: Singleton<SettingsManager>
{
    private GameSettings _currentSettings;
    public GameSettings CurrentSettings => _currentSettings;
    public GameSettings DefSetting = new GameSettings();
    private string settingsPath;
    public void Init()
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
        _currentSettings = DefSetting;
        SaveSettings();
    }
    public void ApplyAllSettings()
    {
        GraphicsManager.Inst.ApplySettings();
        SaveSettings();
    }
}

[System.Serializable]
public class GameSettings
{
    public string serverAddress ;

    public float masterVolume = 0.75f;

    public GraphicsSetting graphicsSettings;
}
public interface ISettingsPanel
{
    void ApplySettings();
    void ResetToDefault();
}