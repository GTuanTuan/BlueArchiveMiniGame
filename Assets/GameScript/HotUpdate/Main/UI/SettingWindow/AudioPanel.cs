using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Audio;

public class AudioPanel : UIBasePanel, ISettingsPanel
{
    [SerializeField] private Slider masterVolumeSlider;
    [SerializeField] private AudioMixer audioMixer;

    public override void OnShow() => Refresh();

    public override void Refresh()
    {
        AudioManager.Inst.RegisterMixer(audioMixer);
        if (masterVolumeSlider != null)
            masterVolumeSlider.SetValueWithoutNotify(SettingsManager.Inst.CurrentSettings.masterVolume);
    }

    public void OnMasterVolumeChanged(float value)
    {
        SettingsManager.Inst.CurrentSettings.masterVolume = Mathf.Clamp01(value);
        AudioManager.Inst.PreviewVolume(value);
    }

    public void ApplySettings() => AudioManager.Inst.ApplySettings();

    public void ResetToDefault()
    {
        SettingsManager.Inst.CurrentSettings.masterVolume = SettingsManager.Inst.DefSetting.masterVolume;
        Refresh();
    }
}