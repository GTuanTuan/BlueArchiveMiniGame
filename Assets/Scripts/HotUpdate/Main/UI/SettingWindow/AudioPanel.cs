using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Audio;

public class AudioPanel : UIBasePanel, ISettingsPanel
{
    [SerializeField] private Slider masterVolumeSlider;
    [SerializeField] private AudioMixer audioMixer;
    public override void OnShow()
    {
        masterVolumeSlider.value = SettingsManager.Inst.CurrentSettings.masterVolume;
        if (audioMixer == null) audioMixer = FindAnyObjectByType<AudioMixer>();
    }

    public void OnMasterVolumeChanged(float value)
    {
        SettingsManager.Inst.CurrentSettings.masterVolume = value;
        SetVolume(value);
    }

    public void ApplySettings()
    {

    }

    private void SetVolume(float volume)
    {
        if (audioMixer)
            audioMixer.SetFloat("MasterVolume", Mathf.Log10(Mathf.Max(volume, 0.0001f)) * 20);
    }

    public void ResetToDefault()
    {
        SettingsManager.Inst.CurrentSettings.masterVolume =  SettingsManager.Inst.DefSetting.masterVolume;
    }
}