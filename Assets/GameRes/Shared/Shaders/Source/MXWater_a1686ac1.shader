Shader "BA/Reconstructed/MX/Water"
{
    Properties
    {
        _BaseColor ("Main Color", Color) = (1, 1, 1, 1)
        _FoamMaskTex ("Foam Mask Texture", 2D) = "white" {}
        [HDR] _FoamColor ("Foam Color", Color) = (1, 1, 1, 1)
        _FoamSpeed ("Foam Speed", Float) = 1
        _FoamTex ("Foam Texture", 2D) = "white" {}
        _FoamValue ("Foam Intensity", Range(0.5, 10)) = 1
        _WaveTex ("Water Mask Texture", 2D) = "white" {}
        [HDR] _WaveColor ("HighLight Color", Color) = (1, 1, 1, 1)
        _WaveSpeed_A ("HighLight X Speed", Float) = 1
        _WaveSpeed_B ("HighLight Y Speed", Float) = 1
        [HDR] _DeepWaveColor ("Wave Color", Color) = (1, 1, 1, 1)
        _WaveInt ("Wave Intensity", Float) = 1
        _MasterColor ("Master Color", Color) = (1, 1, 1, 1)
    }
    SubShader
    {
        Tags { "QUEUE" = "Transparent" "RenderType" = "Opaque" }
        Pass
        {
            Tags { "QUEUE" = "Transparent" "RenderType" = "Opaque" }
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
            #include "Includes/MXWater_a1686ac1/00_00_.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
