// Requires Editor/BAOriginalVariantGuard.cs + BAOriginalVariantCoverage.json for exact sparse build coverage.
Shader "BA/Reconstructed/DSFX/FX_SHADER_AlphaBlend_Add_Double_Distort_Sp_1a"
{
    Properties
    {
        [HDR] _Color ("Color", Color) = (1, 1, 1, 1)
        _Multiply ("Multiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        [KeywordEnum(RGB,RGBA)] _RGBRGBA ("RGB>RGBA", Float) = 0
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [KeywordEnum(Off,R,G,RG)] _Tex_Main_Distort ("Tex_Main_Distort", Float) = 0
        _Tex_Mask ("Tex_Mask", 2D) = "white" {}
        _Mask_Speed_X ("Mask_Speed_X", Float) = 0
        _Mask_Speed_Y ("Mask_Speed_Y", Float) = 0
        [KeywordEnum(Off,R,G,RG)] _Tex_Mask_Distort ("Tex_Mask_Distort", Float) = 0
        _Tex_DistortRG ("Tex_Distort[R,G]", 2D) = "white" {}
        _RTilingxyOffsetzw ("[R]Tiling[x,y]Offset[z,w]", Vector) = (1, 1, 0, 0)
        _RDistort_Speed_X ("[R]Distort_Speed_X", Float) = 0
        _RDistort_Speed_Y ("[R]Distort_Speed_Y", Float) = 0
        _RDistort_Power_X ("[R]Distort_Power_X", Float) = 0
        _RDistort_Power_Y ("[R]Distort_Power_Y", Float) = 0
        _GTilingxyOffsetzw ("[G]Tiling[x,y]Offset[z,w]", Vector) = (1, 1, 0, 0)
        _GDistort_Speed_X ("[G]Distort_Speed_X", Float) = 0
        _GDistort_Speed_Y ("[G]Distort_Speed_Y", Float) = 0
        _GDistort_Power_X ("[G]Distort_Power_X", Float) = 0
        _GDistort_Power_Y ("[G]Distort_Power_Y", Float) = 0
        _Alphaclip_Value ("Alphaclip_Value", Float) = 0
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
        _SoftParticleNearFade ("SoftParticleNearFade", Range(0, 5)) = 0
        [ASEEnd] _SoftParticleFarFade ("SoftParticleFarFade", Range(0.001, 5)) = 0.5
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
            #pragma multi_compile_local __ _ALPHAPREMULTIPLY_ON _TEX_MAIN_DISTORT_G _TEX_MAIN_DISTORT_OFF
            #pragma multi_compile_local _RGBRGBA_RGB _RGBRGBA_RGBA
            #pragma multi_compile_local __ _TEX_MAIN_DISTORT_R _TEX_MAIN_DISTORT_RG
            #pragma multi_compile_local _TEX_MASK_DISTORT_G _TEX_MASK_DISTORT_OFF _TEX_MASK_DISTORT_R _TEX_MASK_DISTORT_RG
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_AlphaBlend_Add_Double_Distort_Sp_1a/00_Forward.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
