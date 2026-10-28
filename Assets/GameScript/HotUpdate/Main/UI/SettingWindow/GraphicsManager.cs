using System;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

public class GraphicsManager : Singleton<GraphicsManager>
{
    private UniversalRenderPipelineAsset _urpAsset;
    private RenderPipelineAsset _originalQualityPipeline;
    private bool _initialized;
    private bool _hasAppliedSettings;
    private int _originalVSyncCount;

    public void Init()
    {
        Shutdown();
        _initialized = true;
        _originalVSyncCount = QualitySettings.vSyncCount;

        var settings = SettingsManager.Inst.CurrentSettings?.graphicsSettings;
        if (settings == null)
        {
            Debug.LogWarning("GraphicsManager needs initialized game settings.");
            return;
        }

        if (settings.isCustom)
            ApplySettingsInternal(settings);
        else
            ReadCurrentSettings(settings);
    }

    public void ApplySettings()
    {
        var settings = SettingsManager.Inst.CurrentSettings?.graphicsSettings;
        if (!_initialized || settings == null)
        {
            Debug.LogWarning("Initialize game settings and GraphicsManager before applying graphics settings.");
            return;
        }

        // Only an explicit user Apply turns the current values into an override.
        settings.isCustom = true;
        ApplySettingsInternal(settings);
    }

    private void ReadCurrentSettings(GraphicsSetting settings)
    {
        var source = GraphicsSettings.currentRenderPipeline as UniversalRenderPipelineAsset;
        if (source != null)
        {
            settings.shadowDistance = source.shadowDistance;
            settings.renderScale = source.renderScale;
            settings.qualityLevel = Mathf.Clamp(Mathf.RoundToInt(Mathf.Log(Mathf.Max(1, source.msaaSampleCount), 2)), 0, 3);
            settings.antiAliasing = settings.qualityLevel;
        }
        settings.vsyncEnabled = QualitySettings.vSyncCount > 0;
        settings.fullscreen = Screen.fullScreen;
        settings.borderless = Screen.fullScreenMode == FullScreenMode.FullScreenWindow;
        settings.resolutionIndex = -1;
        var resolutions = Screen.resolutions;
        if (resolutions != null)
        {
            for (int index = 0; index < resolutions.Length; index++)
            {
                if (resolutions[index].width == Screen.width && resolutions[index].height == Screen.height)
                    settings.resolutionIndex = index;
            }
        }
    }

    private bool EnsureRuntimePipeline()
    {
        if (_urpAsset != null)
            return true;
        var source = GraphicsSettings.currentRenderPipeline as UniversalRenderPipelineAsset;
        if (source == null)
        {
            Debug.LogWarning("The active render pipeline is not URP; URP-specific overrides were skipped.");
            return false;
        }

        _originalQualityPipeline = QualitySettings.renderPipeline;
        _urpAsset = UnityEngine.Object.Instantiate(source);
        _urpAsset.name = source.name + " (Runtime Settings)";
        _urpAsset.hideFlags = HideFlags.DontSave;
        QualitySettings.renderPipeline = _urpAsset;
        return true;
    }

    private void ApplySettingsInternal(GraphicsSetting settings)
    {
        _hasAppliedSettings = true;
        QualitySettings.vSyncCount = settings.vsyncEnabled ? 1 : 0;
        if (EnsureRuntimePipeline())
        {
            _urpAsset.shadowDistance = Mathf.Max(0f, settings.shadowDistance);
            // The quality dropdown supplies a preset; the explicit AA setting wins.
            _urpAsset.msaaSampleCount = 1 << Mathf.Clamp(settings.antiAliasing, 0, 3);
            _urpAsset.renderScale = Mathf.Clamp(settings.renderScale, 0.1f, 2f);
        }
        ApplySetResolution(settings);
        ApplySetDisplay(settings);
    }

    private void ApplySetResolution(GraphicsSetting settings)
    {
        FullScreenMode mode = settings.borderless ? FullScreenMode.FullScreenWindow :
            (settings.fullscreen ? FullScreenMode.ExclusiveFullScreen : FullScreenMode.Windowed);
        var resolutions = Screen.resolutions;
        if (resolutions == null || resolutions.Length == 0)
        {
            Screen.SetResolution(Mathf.Max(1, Screen.width), Mathf.Max(1, Screen.height), mode);
            return;
        }

        if (settings.resolutionIndex < 0 || settings.resolutionIndex >= resolutions.Length)
        {
            // No resolution was chosen: keep the current size instead of jumping
            // to the monitor's maximum whenever another setting is applied.
            Screen.SetResolution(Mathf.Max(1, Screen.width), Mathf.Max(1, Screen.height), mode);
            return;
        }
        var resolution = resolutions[settings.resolutionIndex];
        Screen.SetResolution(resolution.width, resolution.height, mode, resolution.refreshRateRatio);
    }

    private void ApplySetDisplay(GraphicsSetting settings)
    {
        var displays = Display.displays;
        if (displays != null && settings.displayIndex > 0 && settings.displayIndex < displays.Length)
            displays[settings.displayIndex].Activate();
    }

    public void Shutdown()
    {
        if (_urpAsset != null)
        {
            if (QualitySettings.renderPipeline == _urpAsset)
                QualitySettings.renderPipeline = _originalQualityPipeline;
            if (Application.isPlaying)
                UnityEngine.Object.Destroy(_urpAsset);
            else
                UnityEngine.Object.DestroyImmediate(_urpAsset);
            _urpAsset = null;
        }
        if (_hasAppliedSettings)
            QualitySettings.vSyncCount = _originalVSyncCount;
        _originalQualityPipeline = null;
        _hasAppliedSettings = false;
        _initialized = false;
    }
}

[Serializable]
public class GraphicsSetting
{
    public int qualityLevel = 2;
    public bool vsyncEnabled = true;
    public float shadowDistance = 50f;
    public int antiAliasing = 2;
    public bool bloomEnabled = true;
    public float renderScale = 1.0f;
    public bool isCustom = false;
    public int resolutionIndex = -1;
    public bool fullscreen = true;
    public bool borderless = false;
    public int displayIndex = 0;

    public GraphicsSetting() { }

    public GraphicsSetting(int quality, bool vsync, float shadows, int aa, bool bloom, float scale)
    {
        qualityLevel = quality;
        vsyncEnabled = vsync;
        shadowDistance = shadows;
        antiAliasing = aa;
        bloomEnabled = bloom;
        renderScale = scale;
    }
}
