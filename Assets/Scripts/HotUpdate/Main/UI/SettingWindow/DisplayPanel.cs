using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;
using TMPro;
using System.Collections;

public class DisplayPanel : UIBasePanel, ISettingsPanel
{
    [Header("UI References")]
    [SerializeField] private TMP_Dropdown resolutionDropdown;
    [SerializeField] private Toggle fullscreenToggle;
    [SerializeField] private Toggle borderlessToggle;
    [SerializeField] private TMP_Dropdown displayDropdown;

    private Resolution[] resolutions;

    private void Awake()
    {
        InitializeResolutionDropdown();
        InitializeDisplayDropdown();
    }

    private void OnEnable()
    {
        StartCoroutine(InitializeDelayed());
    }
    IEnumerator InitializeDelayed()
    {
        yield return null;
        var settings = SettingsManager.Inst.CurrentSettings;

        resolutionDropdown.SetValueWithoutNotify(settings.resolutionIndex);
        fullscreenToggle.SetIsOnWithoutNotify(settings.fullscreen);
        borderlessToggle.SetIsOnWithoutNotify(settings.borderless);
        displayDropdown.SetValueWithoutNotify(settings.displayIndex);

        UpdateBorderlessToggleState();
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

    public void OnResolutionChanged(int index)
    {
        SettingsManager.Inst.CurrentSettings.resolutionIndex = index;
        ApplySetResolution();
    }

    public void OnFullscreenChanged(bool value)
    {
        SettingsManager.Inst.CurrentSettings.fullscreen = value;
        UpdateBorderlessToggleState();
        ApplySetResolution();
    }

    public void OnBorderlessChanged(bool value)
    {
        SettingsManager.Inst.CurrentSettings.borderless = value;
        ApplySetResolution();
    }

    public void OnDisplayChanged(int index)
    {
        SettingsManager.Inst.CurrentSettings.displayIndex = index;
        ApplySetDisplay();
    }

    private void UpdateBorderlessToggleState()
    {
        borderlessToggle.interactable = fullscreenToggle.isOn;
        if (!fullscreenToggle.isOn)
            borderlessToggle.isOn = false;
        ApplySetResolution();
    }

    public void ApplySettings()
    {
        ApplySetResolution();

        ApplySetDisplay();
    }
    void ApplySetResolution()
    {
        if (resolutions == null) return;
        var settings = SettingsManager.Inst.CurrentSettings;
        Resolution res = resolutions[resolutions.Length-1];
        if (settings.resolutionIndex < resolutions.Length && settings.resolutionIndex>=0)
        {
            res = resolutions[settings.resolutionIndex];
        }

        FullScreenMode mode = settings.borderless ?
            FullScreenMode.FullScreenWindow :
            (settings.fullscreen ? FullScreenMode.ExclusiveFullScreen : FullScreenMode.Windowed);

        Screen.SetResolution(
            res.width,
            res.height,
            mode,
            res.refreshRateRatio
        );
    }
    void ApplySetDisplay()
    {
        var settings = SettingsManager.Inst.CurrentSettings;
        if (settings.displayIndex > 0 && settings.displayIndex < Display.displays.Length)
        {
            Display.displays[settings.displayIndex].Activate();
        }
    }

    public void ResetToDefault()
    {
        throw new System.NotImplementedException();
    }
}