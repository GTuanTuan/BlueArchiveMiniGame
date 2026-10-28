// Requires Editor/BAOriginalVariantGuard.cs and BAOriginalVariantCoverage.json.
Shader "BA/Reconstructed/DSFX/FX_SHADER_Smoke_Scroll_1a"
{
    Properties
    {
        [HDR] _Color ("Color", Color) = (1, 1, 1, 1)
        _Multiply ("Multiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [HDR] _ColorG ("Color[G]", Color) = (1, 1, 1, 1)
        _ColorG_Value ("Color[G]_Value", Range(-5, 5)) = 0
        _ColorG_Glow_Value ("Color[G]_Glow_Value", Float) = 1
        _StepB_Value ("Step[B]_Value", Range(-5, 5)) = 0
        _StepB_Glow_Value ("Step[B]_Glow_Value", Float) = 1
        _StepB_ScaleOffset1XYScaleOffset2ZW ("Step[B]_Scale/Offset1[XY]Scale/Offset2[ZW]", Vector) = (1, 0, -1, 1)
        _Tex_Distort ("Tex_Distort", 2D) = "white" {}
        _Dis_Speed_X ("Dis_Speed_X", Float) = 0
        _Dis_Speed_Y ("Dis_Speed_Y", Float) = 0
        _Distortion_Power_X ("Distortion_Power_X", Float) = 0
        _Distortion_Power_Y ("Distortion_Power_Y", Float) = 0
        _Shadow_Color_Value ("Shadow_Color_Value", Range(0, 1)) = 0.5
        _Shadow_Offset_Value ("Shadow_Offset_Value", Float) = 1
        _Shadow_Glow_Value ("Shadow_Glow_Value", Float) = 1
        [KeywordEnum(Off,On)] _Vertex_Alpha_Use ("Vertex_Alpha_Use", Float) = 0
        [KeywordEnum(Off,On)] _Vertex_Alpha_Color ("Vertex_Alpha_Color", Float) = 0
        [ASEEnd] _Alphaclip_Value ("Alphaclip_Value", Float) = 0
        [HideInInspector] _CustomData_MainTiling_CD1XYXY ("CustomData_MainTiling_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MainTiling_CD2XYXY ("CustomData_MainTiling_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MainOffset_CD1XYXY ("CustomData_MainOffset_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MainOffset_CD2XYXY ("CustomData_MainOffset_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_StepValue_CD1_GStepBStepXYXY ("CustomData_StepValue_CD1_[G]Step/[B]Step[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortTiling_CD1XYXY ("CustomData_DistortTiling_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortTiling_CD2XYXY ("CustomData_DistortTiling_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortOffset_CD1XYXY ("CustomData_DistortOffset_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortOffset_CD2XYXY ("CustomData_DistortOffset_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortPower_CD2XYXY ("CustomData_DistortPower_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY ("CustomData_StepScale_CD2_Scale/Offset1[X,Y]Scale/Offset2[X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY ("CustomData_StepScale_CD2_Scale/Offset2[X,Y]Scale/Offset1[X,Y]", Vector) = (0, 0, 0, 0)
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _SrcBlend ("Src Blend", Float) = 5
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _DstBlend ("Dst Blend", Float) = 10
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _SrcBlendAlpha ("Src Blend Alpha", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _DstBlendAlpha ("Dst Blend Alpha", Float) = 10
        [Toggle(_ALPHAPREMULTIPLY_ON)] [HideInInspector] _AlphaPremultiplyOn ("Alpha Premultiply On", Float) = 0
        [Enum(Off,0, On,1)] [HideInInspector] _ZWrite ("Z Write", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] [HideInInspector] _ZTest ("Z Test", Float) = 4
        [Enum(UnityEngine.Rendering.CullMode)] [HideInInspector] _Cull ("Cull", Float) = 2
        [HideInInspector] _ZOffsetFactor ("Z Offset Factor", Range(-1, 1)) = 0
        [HideInInspector] _ZOffsetUnits ("Z Offset Units", Range(-1, 1)) = 0
    }
    SubShader
    {
        Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
        Pass
        {
            Name "Forward"
            Tags { "LIGHTMODE" = "UniversalForward" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
            Blend [_SrcBlend] [_DstBlend], [_SrcBlendAlpha] [_DstBlendAlpha]
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest [_ZTest]
            ZWrite [_ZWrite]
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
            #pragma multi_compile_local _ALPHAPREMULTIPLY_ON _VERTEX_ALPHA_COLOR_OFF
            #pragma multi_compile_local __ _VERTEX_ALPHA_COLOR_ON
            #pragma multi_compile_local _VERTEX_ALPHA_USE_OFF _VERTEX_ALPHA_USE_ON
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_Smoke_Scroll_Blur_1a_cb40a260/00_00_Forward.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
