using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using TMPro;
using System.Collections;
using System.Collections.Generic;

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

    private Resolution[] resolutions;
    bool init = false;

    public override void OnShow()
    {
        var settings =SettingsManager.Inst.CurrentSettings;

        if (!init)
        {
            InitializeResolutionDropdown();
            InitializeDisplayDropdown();
        }

        qualityDropdown.SetValueWithoutNotify(settings.graphicsSettings.qualityLevel);
        vsyncToggle.SetIsOnWithoutNotify(settings.graphicsSettings.vsyncEnabled);
        shadowDistanceSlider.SetValueWithoutNotify(settings.graphicsSettings.shadowDistance);
        antiAliasingDropdown.SetValueWithoutNotify(settings.graphicsSettings.antiAliasing);
        bloomToggle.SetIsOnWithoutNotify(settings.graphicsSettings.bloomEnabled);
        renderScaleSlider.SetValueWithoutNotify(settings.graphicsSettings.renderScale);

        resolutionDropdown.SetValueWithoutNotify(settings.graphicsSettings.resolutionIndex);
        fullscreenToggle.SetIsOnWithoutNotify(settings.graphicsSettings.fullscreen);
        borderlessToggle.SetIsOnWithoutNotify(settings.graphicsSettings.borderless);
        displayDropdown.SetValueWithoutNotify(settings.graphicsSettings.displayIndex);
    }
    private void InitializeResolutionDropdown()
    {
        resolutions = Screen.resolutions;
        resolutionDropdown.ClearOptions();

        var options = new List<string>();
        for (int i = 0; i < resolutions.Length; i++)
        {
            int refreshRate = Mathf.RoundToInt((float)resolutions[i].refreshRateRatio.value);
            options.Add($"{resolutions[i].width}x{resolutions[i].height} {refreshRate}Hz");
        }

        resolutionDropdown.AddOptions(options);
    }

    private void InitializeDisplayDropdown()
    {
        displayDropdown.ClearOptions();
        var options = new List<string>();

        for (int i = 0; i < Display.displays.Length; i++)
        {
            options.Add($"Display {i + 1}");
        }

        displayDropdown.AddOptions(options);
    }

    public void OnQualityChanged(int index)
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings.qualityLevel = index;
    }

    public void OnVSyncChanged(bool value)
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings.vsyncEnabled = value;
    }

    public void OnShadowDistanceChanged(float value)
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings.shadowDistance = value;
    }

    public void OnAntiAliasingChanged(int index)
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings.antiAliasing = index;
    }

    public void OnBloomChanged(bool value)
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings.bloomEnabled = value;
    }

    public void OnRenderScaleChanged(float value)
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings.renderScale = value;
    }
    public void OnResolutionChanged(int index)
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings.resolutionIndex = index;
    }

    public void OnFullscreenChanged(bool value)
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings.fullscreen = value;
        UpdateBorderlessToggleState();
    }

    public void OnBorderlessChanged(bool value)
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings.borderless = value;
    }

    public void OnDisplayChanged(int index)
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings.displayIndex = index;
    }

    private void UpdateBorderlessToggleState()
    {
        borderlessToggle.interactable = fullscreenToggle.isOn;
        if (!fullscreenToggle.isOn)
            borderlessToggle.isOn = false;
    }

    public void ApplySettings()
    {
        GraphicsManager.Inst.ApplySettings();
    }

    public void ResetToDefault()
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings = SettingsManager.Inst.DefSetting.graphicsSettings;
    }
}