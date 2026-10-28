// Requires Editor/BAOriginalVariantGuard.cs + BAOriginalVariantCoverage.json for exact sparse build coverage.
Shader "BA/Reconstructed/DSFX/FX_SHADER_Main_Add_Channel_Distort_1a"
{
    Properties
    {
        [HDR] _Main_Color ("Main_Color", Color) = (1, 1, 1, 1)
        _Main_Multiply ("Main_Multiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        [Toggle] _RGBRGBA ("RGB>RGBA", Float) = 1
        [KeywordEnum(UV1,UV2)] _Main_UV_Channel ("Main_UV_Channel", Float) = 0
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [KeywordEnum(Off,R,G,RG)] _Tex_Main_Distort ("Tex_Main_Distort", Float) = 0
        [HDR] _Add_Color ("Add_Color", Color) = (1, 1, 1, 1)
        _Tex_Mask ("Tex_Mask", 2D) = "white" {}
        [KeywordEnum(Off,R,G)] _Tex_Mask_Distort ("Tex_Mask_Distort", Float) = 0
        [KeywordEnum(UV1,UV2)] _Mask_UV_Channel ("Mask_UV_Channel", Float) = 0
        _Add_Speed_X ("Add_Speed_X", Float) = 0
        _Add_Speed_Y ("Add_Speed_Y", Float) = 0
        [KeywordEnum(RGB,R,G,B)] _Add_Tex_Channel ("Add_Tex_Channel", Float) = 0
        _Add_Tex_Multiply ("Add_Tex_Multiply", Float) = 20
        _Add_Tex_Dithering ("Add_Tex_Dithering", Range(0, 1)) = 0
        [KeywordEnum(RGB,R,G,B,OFF)] _Step_Tex_Channel ("Step_Tex_Channel", Float) = 0
        _Step_Tex_Multiply ("Step_Tex_Multiply", Float) = 20
        _Step_Tex_Dithering ("Step_Tex_Dithering", Range(0, 1)) = 0
        [Toggle] _Main_Tex_Alpha_use ("Main_Tex_Alpha_use", Float) = 1
        _Tex_DistortRG ("Tex_Distort[R,G]", 2D) = "white" {}
        _R_Tilingxy_Offsetzw ("[R]_Tiling(x,y)_Offset(z,w)", Vector) = (1, 1, 0, 0)
        [KeywordEnum(UV1,UV2)] _RDistort_UV_Channel ("[R]Distort_UV_Channel", Float) = 0
        _RDistort_Speed_X ("[R]Distort_Speed_X", Float) = 0
        _RDistort_Speed_Y ("[R]Distort_Speed_Y", Float) = 0
        [HideInInspector] _CustomData_StepValue_CD1_GStepBStepXYXY ("CustomData_StepValue_CD1_[G]Step/[B]Step[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        _RDistort_Power_X ("[R]Distort_Power_X", Float) = 0
        _RDistort_Power_Y ("[R]Distort_Power_Y", Float) = 0
        _G_Tilingxy_Offsetzw ("[G]_Tiling(x,y)_Offset(z,w)", Vector) = (1, 1, 0, 0)
        [KeywordEnum(UV1,UV2)] _GDistort_UV_Channel ("[G]Distort_UV_Channel", Float) = 0
        _GDistort_Speed_X ("[G]Distort_Speed_X", Float) = 0
        _GDistort_Speed_Y ("[G]Distort_Speed_Y", Float) = 0
        _GDistort_Power_X ("[G]Distort_Power_X", Float) = 0
        [ASEEnd] _GDistort_Power_Y ("[G]Distort_Power_Y", Float) = 0
        [HideInInspector] _CustomData_MainTiling_CD1XYXY ("CustomData_MainTiling_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MainTiling_CD2XYXY ("CustomData_MainTiling_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MainOffset_CD1XYXY ("CustomData_MainOffset_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MainOffset_CD2XYXY ("CustomData_MainOffset_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MaskTiling_CD1XYXY ("CustomData_MaskTiling_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MaskTiling_CD2XYXY ("CustomData_MaskTiling_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MaskOffset_CD1XYXY ("CustomData_MaskOffset_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MaskOffset_CD2XYXY ("CustomData_MaskOffset_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortTilingR_CD1XYXY ("CustomData_DistortTiling[R]_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortTilingR_CD2XYXY ("CustomData_DistortTiling[R]_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortOffsetR_CD1XYXY ("CustomData_DistortOffset[R]_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortOffsetR_CD2XYXY ("CustomData_DistortOffset[R]_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortPowerR_CD2XYXY ("CustomData_DistortPower[R]_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortTilingG_CD1XYXY ("CustomData_DistortTiling[G]_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortTilingG_CD2XYXY ("CustomData_DistortTiling[G]_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortOffsetG_CD1XYXY ("CustomData_DistortOffset[G]_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortOffsetG_CD2XYXY ("CustomData_DistortOffset[G]_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortPowerG_CD2XYXY ("CustomData_DistortPower[G]_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
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
            #pragma multi_compile_instancing
            #pragma multi_compile_local _ADD_TEX_CHANNEL_B _ADD_TEX_CHANNEL_G _ADD_TEX_CHANNEL_R _ADD_TEX_CHANNEL_RGB
            #pragma multi_compile_local __ _ALPHAPREMULTIPLY_ON _STEP_TEX_CHANNEL_B _STEP_TEX_CHANNEL_G
            #pragma multi_compile_local _GDISTORT_UV_CHANNEL_UV1 _GDISTORT_UV_CHANNEL_UV2
            #pragma multi_compile_local _MAIN_UV_CHANNEL_UV1 _MAIN_UV_CHANNEL_UV2
            #pragma multi_compile_local _MASK_UV_CHANNEL_UV1 _MASK_UV_CHANNEL_UV2
            #pragma multi_compile_local _RDISTORT_UV_CHANNEL_UV1 _RDISTORT_UV_CHANNEL_UV2
            #pragma multi_compile_local __ _STEP_TEX_CHANNEL_OFF _STEP_TEX_CHANNEL_R _STEP_TEX_CHANNEL_RGB
            #pragma multi_compile_local _TEX_MAIN_DISTORT_G _TEX_MAIN_DISTORT_OFF _TEX_MAIN_DISTORT_R _TEX_MAIN_DISTORT_RG
            #pragma multi_compile_local _TEX_MASK_DISTORT_G _TEX_MASK_DISTORT_OFF _TEX_MASK_DISTORT_R
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_Main_Add_Channel_Distort_1a/00_Forward.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
