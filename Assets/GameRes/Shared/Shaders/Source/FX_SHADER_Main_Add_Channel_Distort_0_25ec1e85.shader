// Requires Editor/BAOriginalVariantGuard.cs and BAOriginalVariantCoverage.json.
Shader "BA/Reconstructed/DSFX/FX_SHADER_Main_Add_Channel_Distort_0"
{
    Properties
    {
        [HDR] _Main_Color ("Main_Color", Color) = (1, 1, 1, 1)
        _Main_Multiply ("Main_Multiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        [Toggle] _RGBRGBA ("RGB>RGBA", Float) = 0
        [Toggle] _Custom_Data_Main_OffsetUse ("Custom_Data_Main_OffsetUse", Float) = 0
        [KeywordEnum(UV1,UV2,UV3)] _Main_UV_Channel ("Main_UV_Channel", Float) = 0
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [HDR] _Add_Color ("Add_Color", Color) = (1, 1, 1, 1)
        [KeywordEnum(R,G,OFF)] _Tex_Main_Distort ("Tex_Main_Distort", Float) = 2
        _Tex_Mask ("Tex_Mask", 2D) = "white" {}
        [Toggle] _Custom_Data_Mask_OffsetUse ("Custom_Data_Mask_OffsetUse", Float) = 0
        _Add_Speed_X ("Add_Speed_X", Float) = 0
        _Add_Speed_Y ("Add_Speed_Y", Float) = 0
        [KeywordEnum(RGB,R,G,B)] _Add_Tex_Channel ("Add_Tex_Channel", Float) = 0
        _Add_Tex_Multiply ("Add_Tex_Multiply", Float) = 20
        _Add_Tex_Dithering ("Add_Tex_Dithering", Range(0, 1)) = 0
        [Toggle] _Custom_Data_Add_Tex_Dithering_use ("Custom_Data_Add_Tex_Dithering_use", Float) = 0
        [KeywordEnum(RGB,R,G,B,OFF)] _Step_Tex_Channel ("Step_Tex_Channel", Float) = 0
        _Step_Tex_Multiply ("Step_Tex_Multiply", Float) = 20
        _Step_Tex_Dithering ("Step_Tex_Dithering", Range(0, 1)) = 0
        [KeywordEnum(R,G,OFF)] _Tex_Mask_Distort ("Tex_Mask_Distort", Float) = 2
        [Toggle] _Custom_Data_Step_Tex_Dithering_use ("Custom_Data_Step_Tex_Dithering_use", Float) = 0
        [Toggle] _Main_Tex_Alpha_use ("Main_Tex_Alpha_use", Float) = 0
        _Tex_DistortRG ("Tex_Distort[R,G]", 2D) = "white" {}
        [KeywordEnum(UV1,UV2,UV3)] _Mask_UV_Channel ("Mask_UV_Channel", Float) = 0
        _R_Tilingxy_Offsetzw ("[R]_Tiling(x,y)_Offset(z,w)", Vector) = (1, 1, 0, 0)
        _RDistort_Speed_X ("[R]Distort_Speed_X", Float) = 0
        _RDistort_Speed_Y ("[R]Distort_Speed_Y", Float) = 0
        _RDistort_Power_X ("[R]Distort_Power_X", Float) = 0
        _RDistort_Power_Y ("[R]Distort_Power_Y", Float) = 0
        _G_Tilingxy_Offsetzw ("[G]_Tiling(x,y)_Offset(z,w)", Vector) = (1, 1, 0, 0)
        _GDistort_Speed_X ("[G]Distort_Speed_X", Float) = 0
        _GDistort_Speed_Y ("[G]Distort_Speed_Y", Float) = 0
        _GDistort_Power_X ("[G]Distort_Power_X", Float) = 0
        [ASEEnd] _GDistort_Power_Y ("[G]Distort_Power_Y", Float) = 0
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
            #pragma multi_compile_local _ADD_TEX_CHANNEL_R _ADD_TEX_CHANNEL_RGB
            #pragma multi_compile_local __ _ALPHAPREMULTIPLY_ON _TEX_MASK_DISTORT_G _TEX_MASK_DISTORT_OFF
            #pragma multi_compile_local _MAIN_UV_CHANNEL_UV1
            #pragma multi_compile_local _MASK_UV_CHANNEL_UV1
            #pragma multi_compile_local _STEP_TEX_CHANNEL_G _STEP_TEX_CHANNEL_OFF _STEP_TEX_CHANNEL_R _STEP_TEX_CHANNEL_RGB
            #pragma multi_compile_local _TEX_MAIN_DISTORT_G _TEX_MAIN_DISTORT_OFF _TEX_MAIN_DISTORT_R
            #pragma multi_compile_local __ _TEX_MASK_DISTORT_R
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_Main_Add_Channel_Distort_0_25ec1e85/00_00_Forward.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
