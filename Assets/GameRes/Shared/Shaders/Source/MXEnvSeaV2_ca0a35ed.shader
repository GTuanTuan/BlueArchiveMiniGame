Shader "BA/Reconstructed/MX/E-Sea-V2"
{
    Properties
    {
        [Header(Depth)] [Space(6)] _DepthLimit ("Depth Limit", Range(0, 1)) = 0.3
        _DepthTransparentAlpha ("Depth Transparent Alpha", Range(0, 1)) = 0.7
        [Space(20)] [Header(Total Alpha)] [Space(6)] _TotalAlphaLimitFactor ("Gradient Limit", Range(0, 1)) = 0.2
        _TotalAlphaGradientCentroid ("Gradient Centroid", Range(0, 1)) = 0.5
        [Space(20)] [Header(Gradient Water Colors)] [Space(6)] [Header(Sand)] [Space(6)] _SandLineColor ("Sand Line Color", Color) = (1, 1, 1, 1)
        [Header(Swallow Water)] [Space(6)] _SwallowWaterColor ("Swallow Water Color", Color) = (1, 1, 1, 1)
        _SwallowWaterGradientLimitFactor ("Swallow Water Gradient Point", Range(0, 1)) = 0.95
        _SwallowWaterGradientCentroid ("Swallow Water Gradient Centroid", Range(0, 1)) = 0.5
        [Header(Deep Water)] [Space(6)] _DeepWaterColor ("Deep Water Deep Water Color", Color) = (1, 1, 1, 1)
        _DeepWaterGradientLimitFactor ("Deep Water Gradient Point", Range(0, 1)) = 0.95
        _DeepWaterGradientCentroid ("Deep Water Gradient Centroid", Range(0, 1)) = 0.5
        [Space(20)] [Header(Foam and Wave)] [Space(6)] _FoamTint ("Foam Tint", Color) = (1, 1, 1, 1)
        [Header(Patterns. World Space Mapping)] [Space(6)] _PatternTex ("Patterns Texture", 2D) = "black" {}
        [Header(Wave Pattern. R Ch)] [Space(6)] _WavePatternAlpha ("Wave Pattern Alpha", Range(0, 1)) = 0.6
        _WavePatternFlowSpeed ("Wave Pattern Flow Speed", Float) = 0.2
        _WavePatternDistortionStrength ("Wave Pattern Distortion Strength", Float) = 0.02
        [Header(Distortion. G Ch)] [Space(6)] _DistortionScale ("Distortion Scale", Float) = 1
        [Header(Ruffle Pattern. B Ch)] [Space(6)] _RufflePatternAlpha ("Ruffle Pattern Alpha", Range(0, 1)) = 0.2
        _RufflePatternFlowSpeed ("Ruffle Pattern Flow Speed", Float) = -0.2
        _RufflePatternDistortionStrength ("Ruffle Pattern Distortion Strength", Float) = 0.02
        _RufflePatternCutOff ("Ruffle Pattern Cut Off", Range(0, 1)) = 0.2
        [Space(10)] [Header(Wave. Mesh UV Mapping)] [Space(6)] _WaveTex ("Wave Texture", 2D) = "black" {}
        _WaveFlowSpeed ("Wave Flow Speed", Float) = 1
        _WaveDistortionStrength ("Wave Distortion Strength", Float) = 0.02
        _WaveVertexHeight ("Wave Vertex Height", Float) = 0.15
    }
    SubShader
    {
        Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
        Pass
        {
            Name "E-Sea V2"
            Tags { "LIGHTMODE" = "UniversalForward" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
            Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
            ZWrite On
            Cull Back
            Conservative Off
            AlphaToMask Off
            Offset 0, 0
            Stencil
            {
                Ref 0
                ReadMask 255
                WriteMask 255
                Comp Always
                Pass Keep
                Fail Keep
                ZFail Keep
            }
            Lighting Off
            HLSLPROGRAM
            #pragma multi_compile __ FOG_EXP FOG_LINEAR
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXEnvSeaV2_ca0a35ed/00_00_E_Sea_V2.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
