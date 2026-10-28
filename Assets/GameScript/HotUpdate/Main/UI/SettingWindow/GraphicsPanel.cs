using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class GraphicsPanel : UIBasePanel, ISettingsPanel
{
    [Header("UI References")]
    [SerializeField] private TMP_Dropdown qualityDropdown;
    [SerializeField] private Toggle vsyncToggle;
    [SerializeField] private Slider shadowDistanceSlider;
    [SerializeField] private TMP_Dropdown antiAliasingDropdown;
    [SerializeField] private Toggle bloomToggle;
    [SerializeField] private Slider renderScaleSlider;
    [SerializeField] private TMP_Dropdown resolutionDropdown;
    [SerializeField] private Toggle fullscreenToggle;
    [SerializeField] private Toggle borderlessToggle;
    [SerializeField] private TMP_Dropdown displayDropdown;

    private Resolution[] _resolutions;
    private GraphicsSetting Settings => SettingsManager.Inst.CurrentSettings.graphicsSettings;

    public override void OnShow() => Refresh();

    public override void Refresh()
    {
        // Rebuild on opening to account for monitors connected since the last visit.
        BuildResolutionOptions();
        BuildDisplayOptions();
        var settings = Settings;
        if (qualityDropdown != null) qualityDropdown.SetValueWithoutNotify(settings.qualityLevel);
        if (vsyncToggle != null) vsyncToggle.SetIsOnWithoutNotify(settings.vsyncEnabled);
        if (shadowDistanceSlider != null) shadowDistanceSlider.SetValueWithoutNotify(settings.shadowDistance);
        if (antiAliasingDropdown != null) antiAliasingDropdown.SetValueWithoutNotify(settings.antiAliasing);
        if (renderScaleSlider != null) renderScaleSlider.SetValueWithoutNotify(settings.renderScale);
        if (fullscreenToggle != null) fullscreenToggle.SetIsOnWithoutNotify(settings.fullscreen);
        if (borderlessToggle != null) borderlessToggle.SetIsOnWithoutNotify(settings.fullscreen && settings.borderless);
        if (displayDropdown != null) displayDropdown.SetValueWithoutNotify(settings.displayIndex);
        if (bloomToggle != null)
        {
            bloomToggle.SetIsOnWithoutNotify(settings.bloomEnabled);
            // Bloom belongs to the active scene's Volume profile. Do not claim this
            // setting works before an explicit runtime profile owner is supplied.
            bloomToggle.interactable = false;
        }
        UpdateBorderlessToggleState();
    }

    private void BuildResolutionOptions()
    {
        if (resolutionDropdown == null) return;
        _resolutions = Screen.resolutions;
        var options = new List<string>();
        int currentIndex = 0;
        for (int index = 0; index < _resolutions.Length; index++)
        {
            var resolution = _resolutions[index];
            options.Add(resolution.width + "x" + resolution.height + " " +
                Mathf.RoundToInt((float)resolution.refreshRateRatio.value) + "Hz");
            if (resolution.width == Screen.width && resolution.height == Screen.height)
                currentIndex = index;
        }
        if (options.Count == 0) options.Add(Screen.width + "x" + Screen.height + "（当前）");
        resolutionDropdown.ClearOptions();
        resolutionDropdown.AddOptions(options);
        resolutionDropdown.interactable = _resolutions.Length > 0;
        int selected = Settings.resolutionIndex;
        if (selected < 0 || selected >= _resolutions.Length) selected = currentIndex;
        resolutionDropdown.SetValueWithoutNotify(selected);
    }

    private void BuildDisplayOptions()
    {
        if (displayDropdown == null) return;
        var options = new List<string>();
        for (int index = 0; index < Display.displays.Length; index++)
            options.Add("Display " + (index + 1));
        if (options.Count == 0) options.Add("Display 1");
        displayDropdown.ClearOptions();
        displayDropdown.AddOptions(options);
        // Display.Activate only enables an output; it does not move the main
        // game window. Keep the serialized control until output routing exists.
        displayDropdown.interactable = false;
    }

    public void OnQualityChanged(int index)
    {
        // Preserve the original project's quality presets, but keep the separate
        // antialiasing control truthful and allow it to override the preset.
        Settings.qualityLevel = Mathf.Clamp(index, 0, 3);
        Settings.antiAliasing = Settings.qualityLevel;
        if (antiAliasingDropdown != null)
            antiAliasingDropdown.SetValueWithoutNotify(Settings.antiAliasing);
    }

    public void OnVSyncChanged(bool value) => Settings.vsyncEnabled = value;
    public void OnShadowDistanceChanged(float value) => Settings.shadowDistance = Mathf.Max(0f, value);
    public void OnAntiAliasingChanged(int index) => Settings.antiAliasing = Mathf.Clamp(index, 0, 3);
    public void OnBloomChanged(bool value) => Settings.bloomEnabled = value;
    public void OnRenderScaleChanged(float value) => Settings.renderScale = Mathf.Clamp(value, 0.1f, 2f);

    public void OnResolutionChanged(int index)
    {
        if (_resolutions == null) _resolutions = Screen.resolutions;
        if (index >= 0 && index < _resolutions.Length) Settings.resolutionIndex = index;
    }

    public void OnFullscreenChanged(bool value)
    {
        Settings.fullscreen = value;
        if (!value) Settings.borderless = false;
        UpdateBorderlessToggleState();
    }

    public void OnBorderlessChanged(bool value) => Settings.borderless = Settings.fullscreen && value;

    public void OnDisplayChanged(int index)
    {
        if (index >= 0 && index < Display.displays.Length) Settings.displayIndex = index;
    }

    private void UpdateBorderlessToggleState()
    {
        if (borderlessToggle == null) return;
        borderlessToggle.interactable = Settings.fullscreen;
        borderlessToggle.SetIsOnWithoutNotify(Settings.fullscreen && Settings.borderless);
    }

    public void ApplySettings() => GraphicsManager.Inst.ApplySettings();

    public void ResetToDefault()
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings = SettingsManager.Inst.CloneGraphicsDefault();
        Refresh();
    }
}
