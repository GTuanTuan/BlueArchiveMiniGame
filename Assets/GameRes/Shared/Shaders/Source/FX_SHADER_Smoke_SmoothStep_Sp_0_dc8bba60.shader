// Requires Editor/BAOriginalVariantGuard.cs and BAOriginalVariantCoverage.json.
Shader "BA/Reconstructed/DSFX/FX_SHADER_Smoke_SmoothStep_Sp_0"
{
    Properties
    {
        [HDR] _Color ("Color", Color) = (1, 1, 1, 0)
        _Alpha ("Alpha", Float) = 1
        [Toggle(_RGBA_ON)] _RGBA ("RGBA", Float) = 0
        [Toggle(_CUSTOMDATA_USE_ON)] _Customdata_Use ("Customdata_Use", Float) = 0
        _Subtract ("Subtract", Float) = 0.01
        _Smooth ("Smooth", Float) = 0
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        [Toggle(_MAIN_DISTORTION_USE_ON)] _Main_Distortion_Use ("Main_Distortion_Use", Float) = 0
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        _Gra_TillingxyOffsetzw ("Gra_Tilling[x,y]Offset[z,w]", Vector) = (1, 1, 0, 0)
        [KeywordEnum(U,V)] _Gra_Channel ("Gra_Channel", Float) = 0
        [KeywordEnum(Clamp,Repeat)] _Gra_Wrap ("Gra_Wrap", Float) = 0
        _Gra_Lerp ("Gra_Lerp", Range(0, 1)) = 0
        _Tex_Mask ("Tex_Mask", 2D) = "white" {}
        [Toggle(_MASK_DISTORTION_USE_ON)] _Mask_Distortion_Use ("Mask_Distortion_Use", Float) = 0
        _Mask_Speed_X ("Mask_Speed_X", Float) = 0
        _Mask_Speed_Y ("Mask_Speed_Y", Float) = 0
        _Tex_RDistortGDissolve ("Tex_[R]Distort[G]Dissolve", 2D) = "white" {}
        _RTillingxyOffsetzw ("[R]Tilling[x,y]Offset[z,w]", Vector) = (1, 1, 0, 0)
        _RDistort_Speed_X ("[R]Distort_Speed_X", Float) = 0
        _RDistort_Speed_Y ("[R]Distort_Speed_Y", Float) = 0
        _RDistortion_Power_X ("[R]Distortion_Power_X", Float) = 0
        _RDistortion_Power_Y ("[R]Distortion_Power_Y", Float) = 0
        _GTillingxyOffsetzw ("[G]Tilling[x,y]Offset[z,w]", Vector) = (1, 1, 0, 0)
        [Toggle(_GDISSOLVE_DISTORTION_USE_ON)] _GDissolve_Distortion_Use ("[G]Dissolve_Distortion_Use", Float) = 0
        _GDissolve_Str ("[G]Dissolve_Str", Float) = 1
        _GDissolve_Speed_X ("[G]Dissolve_Speed_X", Float) = 0
        _GDissolve_Speed_Y ("[G]Dissolve_Speed_Y", Float) = 0
        _Alphaclip_Value ("Alphaclip_Value", Float) = 0
        _SoftParticleNearFade ("SoftParticleNearFade", Range(0, 5)) = 0
        [ASEEnd] _SoftParticleFarFade ("SoftParticleFarFade", Range(0.001, 5)) = 0.001
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
            #pragma multi_compile_local __ _CUSTOMDATA_USE_ON _MASK_DISTORTION_USE_ON
            #pragma multi_compile_local _GRA_CHANNEL_U
            #pragma multi_compile_local _GRA_WRAP_CLAMP _GRA_WRAP_REPEAT
            #pragma multi_compile __ _RGBA_ON
            #pragma multi_compile_local __ _MAIN_DISTORTION_USE_ON
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_Smoke_SmoothStep_Sp_0_dc8bba60/00_00_Forward.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
