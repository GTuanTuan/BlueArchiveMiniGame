using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using TMPro;
using System.Collections;

public class GraphicsPanel : UIBasePanel, ISettingsPanel
{
    [Header("UI References")]
    [SerializeField] private TMP_Dropdown qualityDropdown;
    [SerializeField] private Toggle vsyncToggle;
    [SerializeField] private Slider shadowDistanceSlider;
    [SerializeField] private TMP_Dropdown antiAliasingDropdown;
    [SerializeField] private Toggle bloomToggle;
    [SerializeField] private Slider renderScaleSlider;

    public override void OnShow()
    {
        var settings = SettingsManager.Inst.CurrentSettings;
        qualityDropdown.SetValueWithoutNotify(settings.graphicsSettings.qualityLevel);
        vsyncToggle.SetIsOnWithoutNotify(settings.graphicsSettings.vsyncEnabled);
        shadowDistanceSlider.SetValueWithoutNotify(settings.graphicsSettings.shadowDistance);
        antiAliasingDropdown.SetValueWithoutNotify(settings.graphicsSettings.antiAliasing);
        bloomToggle.SetIsOnWithoutNotify(settings.graphicsSettings.bloomEnabled);
        renderScaleSlider.SetValueWithoutNotify(settings.graphicsSettings.renderScale);
    }


    public void OnQualityChanged(int index)
    {
        GameSystem.Inst.Graphics.graphicsSetting.qualityLevel = index;
    }

    public void OnVSyncChanged(bool value)
    {
        GameSystem.Inst.Graphics.graphicsSetting.vsyncEnabled = value;
    }

    public void OnShadowDistanceChanged(float value)
    {
        GameSystem.Inst.Graphics.graphicsSetting.shadowDistance = value;
    }

    public void OnAntiAliasingChanged(int index)
    {
        GameSystem.Inst.Graphics.graphicsSetting.antiAliasing = index;
    }

    public void OnBloomChanged(bool value)
    {
        GameSystem.Inst.Graphics.graphicsSetting.bloomEnabled = value;
    }

    public void OnRenderScaleChanged(float value)
    {
        GameSystem.Inst.Graphics.graphicsSetting.renderScale = value;
    }

    public void ApplySettings()
    {
        GameSystem.Inst.Graphics.ApplySettings();
    }

    public void ResetToDefault()
    {
        throw new System.NotImplementedException();
    }
}