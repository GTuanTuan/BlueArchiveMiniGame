Shader "BA/Reconstructed/MX/E-Water-V2"
{
    Properties
    {
        [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2
        _ZOffsetFactor ("Z Offset Factor", Range(-1, 1)) = 0
        _ZOffsetUnits ("Z Offset Units", Range(-1, 1)) = 0
        [Space(14)] [Toggle(_RECEIVE_SHADOWS_OFF)] _ReceiveShadowsOff ("Receive Shadows Off", Float) = 0
        [Header(Perspective Camera ONLY)] [Space(14)] [NoScaleOffset] _DataTex ("Data Tex (R:Ripples, G:Distort, B:VertexAni)", 2D) = "defaulttexture" {}
        _RippleST ("Ripple Scale-Offset", Vector) = (1, 1, 0, 0)
        _DistortST ("Distort Scale-Offset", Vector) = (1, 1, 0, 0)
        [Space] [Toggle(_VERTEX_ANIMATED_SURFACE)] _PosOffsetEnabled ("Surface VertexAni", Float) = 0
        [Space] _PosOffsetST ("VertexAni Scale-Offset", Vector) = (1, 1, 0, 0)
        _PosOffsetHeight ("VertexAni Height", Range(0, 4)) = 1
        _PosOffsetSpeedU ("VertexAni Speed U", Float) = 0.01
        _PosOffsetSpeedV ("VertexAni Speed V", Float) = 0.01
        [Space(14)] [HDR] _RippleColor ("Ripple Color", Color) = (0.6, 0.8, 1, 0.9)
        _RippleSpeedU ("Ripple Speed U", Float) = 0.05
        _RippleSpeedV ("Ripple Speed V", Float) = 0.05
        [Space(14)] _DistortSpeedU ("(Ripple) Distort Speed U", Float) = 0.05
        _DistortSpeedV ("(Ripple) Distort Speed V", Float) = 0.05
        _DistortStrengthU ("(Ripple) Distort Strength U", Float) = 0.05
        _DistortStrengthV ("(Ripple) Distort Strength V", Float) = 0.05
        [Space(14)] _SurfaceColor ("Surface Color", Color) = (0.1, 0.6, 1, 0.3)
        _SurfaceFadeDistance ("Surface Fade Distance", Range(0.0001, 2)) = 1
        _DepthColor ("Depth Color", Color) = (0, 0.4, 0.8, 0.9)
        _DepthGradDistance ("Depth Grad Distance", Range(0.0001, 20)) = 10
    }
    SubShader
    {
        Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Skybox" "QUEUE" = "Transparent-100" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
        Pass
        {
            Name "ForwardLit"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalForward" "PreviewType" = "Skybox" "QUEUE" = "Transparent-100" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
            Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
            ZWrite Off
            Cull [_Cull]
            Conservative Off
            AlphaToMask Off
            Offset [_ZOffsetFactor], [_ZOffsetUnits]
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
            #pragma multi_compile __ _MAIN_LIGHT_SHADOWS
            #pragma multi_compile __ _RECEIVE_SHADOWS_OFF
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXEnvWaterV2_e08ea702/00_00_ForwardLit.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
