Shader "BA/Reconstructed/ProjectMX/WeaponTest1Damage"
{
    Properties
    {
        [Toggle(_DAMAGE_0)] _DamageON ("Damage Check", Range(0, 1)) = 0
        _Color ("Color", Color) = (1, 1, 1, 1)
        _mainTex ("Main Tex", 2D) = "white" {}
        _sourceTex ("Source Tex", 2D) = "white" {}
        _NoiseTex ("Noise Texture", 2D) = "white" {}
        [Header(Damage and Fire)] [Space(6)] _CrushScale ("CrushNoiseScale", Range(0, 1)) = 0
        _NoiseDir ("Noise Direction", Vector) = (0, 0, 0, 0)
        _DmgCol ("Damage Color", Color) = (0.57, 0.56, 0.56, 0)
        _NoiseColStrong ("Damage ColorPow", Float) = 2
        _Damage ("Damage", Range(0, 1)) = 0
        [HDR] _FireCol ("Fire Color", Color) = (0.91, 0.74, 0, 0)
        _FireBackCol_Str ("Fire BackColor Strength", Range(0, 0.2)) = 0.1
        _FireValue ("Fire Light Threshold", Range(0, 2)) = 1
        _Fire ("Fire", Range(0, 1)) = 0
        [Header (Base Option)] [Space(6)] _ShadowThreshold ("Shadow Threshold", Range(0, 1)) = 0.5
        _ShadowStrong ("Shadow Strength", Float) = 30
        _LightValue ("Light Threshold", Range(0, 1)) = 0.5
        _LightStrong ("Light Strength", Float) = 20
        _SpecStrong ("Spec Color Strength", Range(0, 1)) = 0.1
        _ShadowTint ("Shadow Tint", Color) = (0, 0, 0, 0)
        _SpecColor ("Spec Tint", Color) = (0, 0, 0, 0)
        _FakeLightDir ("Light Direction", Vector) = (0.1, 0.65, 0, 0)
        [Header(Additional Light)] [Space(6)] _AdditionalLightStrength ("Additional Light Strength", Range(0, 2)) = 1
        _AdditionalLightSharpness ("Additional Light Sharpness", Range(0, 100)) = 5
        [Header(Glow Option)] [Space(6)] [Toggle(_GLOW_0)] _UseGlow ("use glow?", Float) = 0
        _GlowMaskColor0 ("Glow Mask Color", Color) = (1, 1, 1, 1)
        _GlowStrictness0 ("Glow Mask Tolerance", Range(30, 0.34)) = 3
        [HDR] _GlowTint0 ("Glow Tint", Color) = (0, 0, 0, 1)
        _GlowStrength0 ("Glow Strength", Range(0, 10)) = 0
        [Header(OUTLINE)] [Space(6)] _OutlineTint ("Outline Tint", Color) = (0.5, 0.5, 0.5, 1)
        [Header(Solid Color Outline Option)] [Space(6)] [HDR] _OutlineSolidColorTint ("Solid Color Tint", Color) = (0.7, 0, 0, 1)
        [HideInInspector] _CodeAddColor ("_CodeAddColor", Color) = (0, 0, 0, 0)
        [HideInInspector] _CodeMultiplyColor ("_CodeMultiplyColor", Color) = (1, 1, 1, 1)
        [HideInInspector] _CodeAddRimColor ("_CodeAddRimColor", Color) = (0, 0, 0, 0)
        [HideInInspector] _GrayBrightness ("_GrayBrightness", Float) = 1
        [Space(10)] [Toggle(_DITHER_HORIZONTAL_LINES)] _IsDither ("_DITHER_HORIZONTAL_LINES", Float) = 0
        _DitherThreshold ("_DitherThreshold", Range(0, 1)) = 0
    }
    SubShader
    {
        Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
        Pass
        {
            Name "ForwardLit"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalForward" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend One Zero, One Zero
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
            #pragma multi_compile __ _ADDITIONAL_LIGHTS
            #pragma multi_compile_local __ _DAMAGE_0
            #pragma multi_compile_local __ _DITHER_HORIZONTAL_LINES
            #pragma multi_compile_local __ _GLOW_0
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXWeapon1Damage_0b304ea4/00_00_ForwardLit.hlsl"
            ENDHLSL
        }
        Pass
        {
            Name "Outline"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Outline" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend One Zero, One Zero
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
            ZWrite On
            Cull Front
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
            #pragma multi_compile __ OUTLINE_RIM_LIGHT_POINT OUTLINE_RIM_LIGHT_SPOT
            #pragma multi_compile_local __ _DAMAGE_0
            #pragma multi_compile_local __ _DITHER_HORIZONTAL_LINES
            #pragma multi_compile_local __ _GRAYSCALE_MODE
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXWeapon1Damage_0b304ea4/00_01_Outline.hlsl"
            ENDHLSL
        }
        Pass
        {
            Name "Solid Color Outline"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "OutlineSolidColor" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend One Zero, One Zero
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
            ZWrite On
            Cull Front
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
            #pragma multi_compile_local __ _DITHER_HORIZONTAL_LINES
            #pragma multi_compile_local __ _GRAYSCALE_MODE
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXWeapon1Damage_0b304ea4/00_02_Solid_Color_Outline.hlsl"
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
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXWeapon1Damage_0b304ea4/00_03_ShadowCaster.hlsl"
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
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXWeapon1Damage_0b304ea4/00_04_DepthOnly.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
