using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using YooAsset;

public class GraphicsManager : Singleton<GraphicsManager>
{
    public GraphicsSetting graphicsSetting;
    private UniversalRenderPipelineAsset _urpAsset;
    private VolumeProfile urpVolumeProfile;
    public GraphicsManager()
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
        graphicsSetting = SettingsManager.Inst.CurrentSettings.graphicsSettings;
        ApplySettings();
    }
    public void ApplySettings()
    {
        SettingsManager.Inst.CurrentSettings.graphicsSettings = graphicsSetting;
        QualitySettings.vSyncCount = graphicsSetting.vsyncEnabled ? 1 : 0;
        _urpAsset.shadowDistance = graphicsSetting.shadowDistance;
        _urpAsset.msaaSampleCount = (int)Mathf.Pow(2, graphicsSetting.qualityLevel);
        _urpAsset.renderScale = graphicsSetting.renderScale;
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