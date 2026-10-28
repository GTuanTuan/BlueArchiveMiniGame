// Requires Editor/BAOriginalVariantGuard.cs + BAOriginalVariantCoverage.json for exact sparse build coverage.
Shader "BA/Reconstructed/DSFX/FX_SHADER_Step_Distort_1a"
{
    Properties
    {
        [HDR] _Color ("Color", Color) = (1, 1, 1, 1)
        _Multiply ("Multiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        [KeywordEnum(RGB,RGBA)] _RGBRGBA ("RGB>RGBA", Float) = 0
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [KeywordEnum(Off,Use)] _Main_Distort_Use ("Main_Distort_Use", Float) = 0
        _Tex_Mask ("Tex_Mask", 2D) = "white" {}
        _Mask_Speed_X ("Mask_Speed_X", Float) = 0
        _Mask_Speed_Y ("Mask_Speed_Y", Float) = 0
        [KeywordEnum(Off,Use)] _Mask_Distort_Use ("Mask_Distort_Use", Float) = 0
        _Tex_Distort ("Tex_Distort", 2D) = "white" {}
        _Dis_Speed_X ("Dis_Speed_X", Float) = 0
        _Dis_Speed_Y ("Dis_Speed_Y", Float) = 0
        _Distortion_Power_X ("Distortion_Power_X", Float) = 0
        _Distortion_Power_Y ("Distortion_Power_Y", Float) = 0
        _Step_Power ("Step_Power", Range(0, 1)) = 0
        [KeywordEnum(Step_CustomData,Vertex_Color)] _Step_Vertex_Color_Use ("Step_Vertex_Color_Use", Float) = 0
        [Toggle] _Step_Vertex_Alpha_Use ("Step_Vertex_Alpha_Use", Float) = 0
        [Toggle] _UV_Add_Use ("UV_Add_Use", Float) = 1
        _UV_Add_TilingOffset ("UV_Add_Tiling/Offset", Vector) = (0, 0, 0, 0)
        [ASEEnd] _Alphaclip_Value ("Alphaclip_Value", Float) = 0
        [HideInInspector] _CustomData_MainTiling_CD1XYXY ("CustomData_MainTiling_CD1[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MainTiling_CD2XYXY ("CustomData_MainTiling_CD2[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MainOffset_CD1XYXY ("CustomData_MainOffset_CD1[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MainOffset_CD2XYXY ("CustomData_MainOffset_CD2[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MaskTiling_CD1XYXY ("CustomData_MaskTiling_CD1[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MaskTiling_CD2XYXY ("CustomData_MaskTiling_CD2[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MaskOffset_CD1XYXY ("CustomData_MaskOffset_CD1[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MaskOffset_CD2XYXY ("CustomData_MaskOffset_CD2[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortTiling_CD1XYXY ("CustomData_DistortTiling_CD1[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortTiling_CD2XYXY ("CustomData_DistortTiling_CD2[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortOffset_CD1XYXY ("CustomData_DistortOffset_CD1[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortOffset_CD2XYXY ("CustomData_DistortOffset_CD2[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortPower_CD2XYXY ("CustomData_DistortPower_CD2[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_StepValue_CD1XYXY ("CustomData_StepValue_CD1[X.Y][X.Y]", Vector) = (0, 0, 0, 0)
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
            #pragma multi_compile_local __ _ALPHAPREMULTIPLY_ON
            #pragma multi_compile_local _MAIN_DISTORT_USE_OFF _MAIN_DISTORT_USE_USE
            #pragma multi_compile_local _MASK_DISTORT_USE_OFF _MASK_DISTORT_USE_USE
            #pragma multi_compile_local _RGBRGBA_RGB _RGBRGBA_RGBA
            #pragma multi_compile_local _STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_Step_Distort_1a/00_Forward.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
