// Requires Editor/BAOriginalVariantGuard.cs and BAOriginalVariantCoverage.json.
Shader "BA/Reconstructed/MX/E-Standard-FX"
{
    Properties
    {
        _Cutoff ("Alpha Clipping", Range(0, 1)) = 0.5
        _PrefabLightmapTex ("_PrefabLightmapTex", 2D) = "gray" {}
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _SrcBlend ("Src Blend", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _DstBlend ("Dst Blend", Float) = 0
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _SrcBlendAlpha ("Src Blend Alpha", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _DstBlendAlpha ("Dst Blend Alpha", Float) = 0
        [Enum(Off,0, On,1)] [HideInInspector] _ZWrite ("Z Write", Float) = 1
        [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2
        _ZOffsetFactor ("Z Offset Factor", Range(-1, 1)) = 0
        _ZOffsetUnits ("Z Offset Units", Range(-1, 1)) = 0
        _BaseSpecColor ("Base Spec Color (RGB)", Color) = (0.2, 0.2, 0.2, 1)
        _BaseSmoothness ("Base Smoothness", Range(0, 1)) = 0.5
        _SpecMapStrength ("Spec Map Strength", Range(0, 5)) = 1
        _SpecTexRGBRatio ("Spec Tex Color Amount", Range(0, 1)) = 1
        _SpecMapARatio ("Spec Map Smoothness Amount", Range(0, 1)) = 1
        _ReflectMapStrength ("Reflect Map Strength", Range(0, 5)) = 1
        _ReflectMapARatio ("Reflect Map Smoothness Amount", Range(0, 1)) = 1
        [HDR] _Color ("Tint", Color) = (1, 1, 1, 1)
        _MainTex ("MainTex (RGB) / ?? (A)", 2D) = "white" {}
        _ReflectTex ("Fake Reflection (RGB)", 2D) = "white" {}
        _ReflectBaseAmount ("Reflect Base Amount", Range(0, 1)) = 0
        _ReflectAnglePower ("Reflect Angle", Range(1, 8)) = 2
        _ShadowAttenRefl ("Apply Shadows", Range(0, 1)) = 0
        _ReflectStrength ("Reflect Strength", Range(0, 10)) = 0
        [NoScaleOffset] _EmissionTex ("Emission Color (RGB)", 2D) = "white" {}
        _EmissionStrength ("Emission Strength", Range(0, 50)) = 0
        [NoScaleOffset] _SpecTex ("Spec Color (RGB)", 2D) = "white" {}
        _SpecLightDir ("Spec Light Dir", Vector) = (0, 0.94, 0.342, 0)
        [HDR] _SpecLightColor ("Spec Light Color", Color) = (1, 1, 1, 1)
        _SpecPower ("Spec Power", Range(1, 512)) = 1
        _ShadowAttenSpec ("Apply Shadows", Range(0, 0.5)) = 0.2
        _LightmapStrength ("Lightmap Strength", Range(0, 1)) = 1
        _DistortTex ("DistortTex (R)", 2D) = "defaulttexture" {}
        _DistortSpeedU ("Distort Speed U", Float) = 0
        _DistortSpeedV ("Distort Speed V", Float) = 0
        _DistortStrengthU ("Distort Strength U", Float) = 0
        _DistortStrengthV ("Distort Strength V", Float) = 0
        [HideInInspector] _CodeAddColor ("_CodeAddColor", Color) = (0, 0, 0, 0)
        [HideInInspector] _CodeMultiplyColor ("_CodeMultiplyColor", Color) = (1, 1, 1, 1)
        [HideInInspector] _CodeAddRimColor ("_CodeAddRimColor", Color) = (0, 0, 0, 0)
    }
    SubShader
    {
        LOD 300
        Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
        Pass
        {
            Name "ForwardLit"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalForward" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend [_SrcBlend] [_DstBlend], [_SrcBlendAlpha] [_DstBlendAlpha]
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
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
            #pragma multi_compile __ FOG_EXP FOG_LINEAR
            #pragma multi_compile_instancing
            #pragma multi_compile __ LIGHTMAP_ON _ADDITIONAL_LIGHTS _BAKED_PREFAB
            #pragma multi_compile_local __ _DYNAMIC_LIGHTS _ENV_CUTOUT_MODE
            #pragma multi_compile __ _MAIN_LIGHT_SHADOWS
            #pragma multi_compile __ _RECEIVE_SHADOWS_OFF
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXEnvStandardFX_02c80804/00_00_ForwardLit.hlsl"
            ENDHLSL
        }
        Pass
        {
            Name "ShadowCaster"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend One Zero, One Zero
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
            ZWrite On
            Cull [_Cull]
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
            #pragma multi_compile_instancing
            #pragma multi_compile_local __ _ENV_CUTOUT_MODE
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXEnvStandardFX_02c80804/00_01_ShadowCaster.hlsl"
            ENDHLSL
        }
        Pass
        {
            Name "DepthOnly"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthOnly" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend One Zero, One Zero
            BlendOp Add, Add
            ColorMask 0
            ZClip On
            ZTest LEqual
            ZWrite On
            Cull [_Cull]
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
            #pragma multi_compile_instancing
            #pragma multi_compile_local __ _ENV_CUTOUT_MODE
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXEnvStandardFX_02c80804/00_02_DepthOnly.hlsl"
            ENDHLSL
        }
        Pass
        {
            Name "Meta"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend One Zero, One Zero
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
            ZWrite On
            Cull Off
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
            #pragma multi_compile_local __ _ENV_CUTOUT_MODE
            #pragma multi_compile __ _SPECULAR_SETUP
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXEnvStandardFX_02c80804/00_03_Meta.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
