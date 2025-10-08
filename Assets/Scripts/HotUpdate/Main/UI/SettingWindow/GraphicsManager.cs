using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using YooAsset;

public class GraphicsManager : Singleton<GraphicsManager>
{
    private UniversalRenderPipelineAsset _urpAsset;
    private VolumeProfile urpVolumeProfile;
    public void Init()
    {
        _urpAsset = GraphicsSettings.currentRenderPipeline as UniversalRenderPipelineAsset;

        if (_urpAsset == null)
        {
            Debug.LogError("URP Asset null");
        }
        urpVolumeProfile = YooAssets.LoadAssetSync("SampleSceneProfile").AssetObject as VolumeProfile;
        if (urpVolumeProfile == null)
        {
            Debug.LogError("VolumeProfile null");
        }
        ApplySettings();
    }
    public void ApplySettings()
    {
        GraphicsSetting graphicsSetting = SettingsManager.Inst.CurrentSettings.graphicsSettings;
        SettingsManager.Inst.SaveSettings();
        ApplySetURPAsset(graphicsSetting);
        ApplySetResolution(graphicsSetting);
        ApplySetDisplay(graphicsSetting);
    }
    void ApplySetURPAsset(GraphicsSetting graphicsSetting)
    {
        QualitySettings.vSyncCount = graphicsSetting.vsyncEnabled ? 1 : 0;
        _urpAsset.shadowDistance = graphicsSetting.shadowDistance;
        _urpAsset.msaaSampleCount = (int)Mathf.Pow(2, graphicsSetting.qualityLevel);
        _urpAsset.renderScale = graphicsSetting.renderScale;
    }
    void ApplySetResolution(GraphicsSetting graphicsSetting)
    {
        if (Screen.resolutions == null) return;
        Resolution res = Screen.resolutions[Screen.resolutions.Length - 1];
        if (graphicsSetting.resolutionIndex < Screen.resolutions.Length && graphicsSetting.resolutionIndex >= 0)
        {
            res = Screen.resolutions[graphicsSetting.resolutionIndex];
        }

        FullScreenMode mode = graphicsSetting.borderless ?
            FullScreenMode.FullScreenWindow :
            (graphicsSetting.fullscreen ? FullScreenMode.ExclusiveFullScreen : FullScreenMode.Windowed);

        Screen.SetResolution(
            res.width,
            res.height,
            mode,
            res.refreshRateRatio
        );
    }
    void ApplySetDisplay(GraphicsSetting graphicsSetting)
    {
        if (graphicsSetting.displayIndex > 0 && graphicsSetting.displayIndex < Display.displays.Length)
        {
            Display.displays[graphicsSetting.displayIndex].Activate();
        }
    }
}
[System.Serializable]
public class GraphicsSetting
{
    public int qualityLevel = 2;
    public bool vsyncEnabled = true;
    public float shadowDistance = 50f;
    public int antiAliasing = 2;
    public bool bloomEnabled = true;
    public float renderScale = 1.0f;
    public bool isCustom = false;

    public int resolutionIndex = 0;
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