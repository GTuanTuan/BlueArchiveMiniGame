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

    [Header("Graphics References")]
    [SerializeField] private VolumeProfile urpVolumeProfile;

    [Header("Quality Presets")]
    [SerializeField]
    private QualityPreset[] qualityPresets = new QualityPreset[4]
    {
        new QualityPreset("Low", 0, false, 20f, 0, false, 0.8f),
        new QualityPreset("Medium", 1, false, 40f, 1, true, 1.0f),
        new QualityPreset("High", 2, true, 60f, 2, true, 1.2f),
        new QualityPreset("Ultra", 3, true, 100f, 2, true, 1.5f)
    };

    [System.Serializable]
    public class QualityPreset
    {
        public string name;
        public int qualityLevel;
        public bool vsyncEnabled;
        public float shadowDistance;
        public int antiAliasing;
        public bool bloomEnabled;
        public float renderScale;

        public QualityPreset(string name, int qualityLevel, bool vsyncEnabled, float shadowDistance,
                            int antiAliasing, bool bloomEnabled, float renderScale)
        {
            this.name = name;
            this.qualityLevel = qualityLevel;
            this.vsyncEnabled = vsyncEnabled;
            this.shadowDistance = shadowDistance;
            this.antiAliasing = antiAliasing;
            this.bloomEnabled = bloomEnabled;
            this.renderScale = renderScale;
        }
    }

    private UniversalRenderPipelineAsset _urpAsset;
    private Bloom _bloom;
    private void OnEnable()
    {
        StartCoroutine(InitializeDelayed());
    }

    private IEnumerator InitializeDelayed()
    {
        yield return null; 

        _urpAsset = GraphicsSettings.currentRenderPipeline as UniversalRenderPipelineAsset;

        if (_urpAsset == null)
        {
            Debug.LogError("URP Asset null");
            yield break;
        }

        if (urpVolumeProfile != null && !urpVolumeProfile.TryGet(out _bloom))
        {
            Debug.LogWarning("Volume Profile Bloom null");
        }

        //InitializeQualityDropdown();
        var settings = SettingsManager.Inst.CurrentSettings;
        qualityDropdown.SetValueWithoutNotify(settings.qualityLevel);
        vsyncToggle.SetIsOnWithoutNotify(settings.vsyncEnabled);
        shadowDistanceSlider.SetValueWithoutNotify(settings.shadowDistance);
        antiAliasingDropdown.SetValueWithoutNotify(settings.antiAliasing);
        bloomToggle.SetIsOnWithoutNotify(settings.bloomEnabled);
        renderScaleSlider.SetValueWithoutNotify(settings.renderScale);
        ApplySettings();
    }

    //private void InitializeQualityDropdown()
    //{
    //    qualityDropdown.ClearOptions();
    //    foreach (var preset in qualityPresets)
    //    {
    //        qualityDropdown.options.Add(new TMP_Dropdown.OptionData(preset.name));
    //    }
    //}

    public void OnQualityChanged(int index)
    {

        SettingsManager.Inst.CurrentSettings.qualityLevel = index;
        var settings = SettingsManager.Inst.CurrentSettings;

        if (index >= 0 && index < qualityPresets.Length)
        {
            var preset = qualityPresets[index];
            // Ӧ��Ԥ�����������
            vsyncToggle.SetIsOnWithoutNotify(preset.vsyncEnabled);
            shadowDistanceSlider.SetValueWithoutNotify(preset.shadowDistance);
            antiAliasingDropdown.SetValueWithoutNotify(preset.antiAliasing);
            bloomToggle.SetIsOnWithoutNotify(preset.bloomEnabled);
            renderScaleSlider.SetValueWithoutNotify(preset.renderScale);
        }

        // ����Ӧ������
        OnVSyncChanged(settings.vsyncEnabled);
        OnShadowDistanceChanged(settings.shadowDistance);
        OnAntiAliasingChanged(settings.antiAliasing);
        OnBloomChanged(settings.bloomEnabled);
        OnRenderScaleChanged(settings.renderScale);
    }

    public void OnVSyncChanged(bool value)
    {
        SettingsManager.Inst.CurrentSettings.vsyncEnabled = value;
        QualitySettings.vSyncCount = value ? 1 : 0;
    }

    public void OnShadowDistanceChanged(float value)
    {
        SettingsManager.Inst.CurrentSettings.shadowDistance = value;
        if (_urpAsset != null)
            _urpAsset.shadowDistance = value;
    }

    public void OnAntiAliasingChanged(int index)
    {
        SettingsManager.Inst.CurrentSettings.antiAliasing = index;
        if (_urpAsset != null)
            _urpAsset.msaaSampleCount = (int)Mathf.Pow(2, index);
    }

    public void OnBloomChanged(bool value)
    {
        SettingsManager.Inst.CurrentSettings.bloomEnabled = value;
        if (_bloom != null)
            _bloom.active = value;
    }

    public void OnRenderScaleChanged(float value)
    {
        SettingsManager.Inst.CurrentSettings.renderScale = value;
        if (_urpAsset != null)
            _urpAsset.renderScale = value;
    }

    public void ApplySettings()
    {
        if (_urpAsset == null) return;

        var settings = SettingsManager.Inst.CurrentSettings;
        if (settings.qualityLevel != 4)
            QualitySettings.SetQualityLevel(settings.qualityLevel);
        QualitySettings.vSyncCount = settings.vsyncEnabled ? 1 : 0;

        _urpAsset.shadowDistance = settings.shadowDistance;
        _urpAsset.msaaSampleCount = (int)Mathf.Pow(2, settings.antiAliasing);
        _urpAsset.renderScale = settings.renderScale;

        if (_bloom != null) _bloom.active = settings.bloomEnabled;
    }

    public void ResetToDefault()
    {
        throw new System.NotImplementedException();
    }
}