using System;
using System.IO;
using UnityEngine;

public class SettingsManager : Singleton<SettingsManager>
{
    private GameSettings _currentSettings;
    private GameSettings _editSnapshot;
    private string _settingsPath;
    private bool _initialized;

    public GameSettings CurrentSettings => _currentSettings ?? (_currentSettings = CloneDefaults());
    public GameSettings DefSetting = new GameSettings();
    public bool IsEditing => _editSnapshot != null;

    public void Init()
    {
        if (_initialized) return;
        LoadSettings();
        _initialized = true;
    }

    public void LoadSettings()
    {
        EnsurePath();
        _editSnapshot = null;
        _currentSettings = CloneDefaults();
        string legacyPath = Path.Combine(Application.persistentDataPath, "settings.json");
        string readPath = File.Exists(_settingsPath) ? _settingsPath : legacyPath;
        if (!File.Exists(readPath)) return;
        try
        {
            _currentSettings = JsonUtility.FromJson<GameSettings>(File.ReadAllText(readPath)) ?? CloneDefaults();
            Normalize(_currentSettings);
        }
        catch (Exception exception)
        {
            // Keep the bad file for diagnosis; opening the game must not overwrite it.
            _currentSettings = CloneDefaults();
            Debug.LogWarning("无法读取游戏设置，使用默认值：" + exception.Message);
        }
    }

    public void BeginEdit()
    {
        Init();
        if (_editSnapshot == null) _editSnapshot = Clone(CurrentSettings);
    }

    public void CancelEdit()
    {
        if (_editSnapshot == null) return;
        _currentSettings = _editSnapshot;
        _editSnapshot = null;
        AudioManager.Inst.ApplySettings();
    }

    public void ResetDraftToDefaults()
    {
        BeginEdit();
        _currentSettings = CloneDefaults();
        AudioManager.Inst.ApplySettings();
    }

    public GraphicsSetting CloneGraphicsDefault() => CloneDefaults().graphicsSettings;

    public void SaveSettings()
    {
        EnsurePath();
        Normalize(CurrentSettings);
        Directory.CreateDirectory(Path.GetDirectoryName(_settingsPath));
        string temporaryPath = _settingsPath + ".tmp";
        try
        {
            File.WriteAllText(temporaryPath, JsonUtility.ToJson(CurrentSettings, true));
            if (File.Exists(_settingsPath))
                File.Replace(temporaryPath, _settingsPath, null);
            else
                File.Move(temporaryPath, _settingsPath);
        }
        finally
        {
            if (File.Exists(temporaryPath)) File.Delete(temporaryPath);
        }
        // Errors intentionally propagate so the window can stay open and offer retry.
    }

    public void ResetToDefaultSettings()
    {
        _currentSettings = CloneDefaults();
        SaveSettings();
        _editSnapshot = null;
    }

    public void ApplyAllSettings()
    {
        Normalize(CurrentSettings);
        string server = CurrentSettings.serverAddress.Trim();
        if (!string.IsNullOrEmpty(server) &&
            (!Uri.TryCreate(server, UriKind.Absolute, out var uri) ||
             (uri.Scheme != Uri.UriSchemeHttp && uri.Scheme != Uri.UriSchemeHttps)))
            throw new InvalidDataException("服务地址必须是完整的 HTTP 或 HTTPS 地址，留空可使用默认地址。");
        CurrentSettings.serverAddress = server;
        // Save first: a failed write leaves the draft open and renderer unchanged.
        bool wasCustom = CurrentSettings.graphicsSettings.isCustom;
        CurrentSettings.graphicsSettings.isCustom = true;
        try { SaveSettings(); }
        catch
        {
            CurrentSettings.graphicsSettings.isCustom = wasCustom;
            throw;
        }
        _editSnapshot = null;
        GraphicsManager.Inst.ApplySettings();
        AudioManager.Inst.ApplySettings();
    }

    private void EnsurePath()
    {
        if (string.IsNullOrEmpty(_settingsPath))
            _settingsPath = Path.Combine(Application.persistentDataPath, "game-settings.json");
    }

    private GameSettings CloneDefaults() => Clone(DefSetting ?? new GameSettings());

    private static GameSettings Clone(GameSettings source)
    {
        var copy = JsonUtility.FromJson<GameSettings>(JsonUtility.ToJson(source)) ?? new GameSettings();
        Normalize(copy);
        return copy;
    }

    private static void Normalize(GameSettings settings)
    {
        if (settings.graphicsSettings == null) settings.graphicsSettings = new GraphicsSetting();
        settings.masterVolume = Mathf.Clamp01(settings.masterVolume);
        settings.serverAddress = settings.serverAddress ?? string.Empty;
        var graphics = settings.graphicsSettings;
        graphics.qualityLevel = Mathf.Clamp(graphics.qualityLevel, 0, 3);
        graphics.antiAliasing = Mathf.Clamp(graphics.antiAliasing, 0, 3);
        graphics.shadowDistance = Mathf.Max(0f, graphics.shadowDistance);
        graphics.renderScale = Mathf.Clamp(graphics.renderScale, 0.1f, 2f);
        if (!graphics.fullscreen) graphics.borderless = false;
    }
}

[Serializable]
public class GameSettings
{
    public string serverAddress;
    public float masterVolume = 0.75f;
    public GraphicsSetting graphicsSettings = new GraphicsSetting();
}

public interface ISettingsPanel
{
    void ApplySettings();
    void ResetToDefault();
}
