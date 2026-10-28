Shader "BA/Reconstructed/MX/C-General/Layer4-Inline"
{
    Properties
    {
        [HDR] _Tint ("Tint", Color) = (1, 1, 1, 1)
        [NoScaleOffset] _MainTex ("Main Tex", 2D) = "white" {}
        _Cutoff ("Cutoff", Range(0, 1)) = 0.2
        [HDR] _TwoSideTint ("Two Side Tint", Color) = (1, 1, 1, 1)
        [NoScaleOffset] _MaskTex ("Layer / Mask Tex", 2D) = "gray" {}
        _MaskGSensitivity ("Mask G Sensitivity", Range(0, 3)) = 1
        _BaseBrightness4 ("Base Brightness", Vector) = (0, 0, 0, 0)
        _ShadowTintR4 ("Shadow Tint R", Vector) = (1, 1, 1, 1)
        _ShadowTintG4 ("Shadow Tint G", Vector) = (1, 1, 1, 1)
        _ShadowTintB4 ("Shadow Tint B", Vector) = (1, 1, 1, 1)
        _ShadowThreshold4 ("Shadow Threshold", Vector) = (0, 0, 0, 0)
        _ViewOffset4 ("View Light Angle Offset", Vector) = (0, 0, 0, 0)
        _ViewPower4 ("View Light Sharpness", Vector) = (1, 1, 1, 1)
        _ViewStrength4 ("View Light Strength", Vector) = (0, 0, 0, 0)
        _InvViewPower4 ("Inv.View Light Sharpness", Vector) = (1, 1, 1, 1)
        _InvViewStrength4 ("Inv.View Light Strength", Vector) = (0, 0, 0, 0)
        _ViewLightEdge4 ("View Light Edge", Vector) = (0, 0, 0, 0)
        _RimAreaMultiplier4 ("Rim Sharpness", Vector) = (3, 3, 3, 3)
        _RimStrength4 ("Rim Strength", Vector) = (1, 1, 1, 1)
        _AdditionalLightStrength ("Additional Light Strength", Range(0, 2)) = 1
        _AdditionalLightSharpness ("Additional Light Sharpness", Range(0, 100)) = 5
        [HDR] _GlowTint ("Glow Tint", Color) = (0, 0, 0, 1)
        _GlowStrength ("Glow Strength", Range(0, 5)) = 0
        [HDR] _InlineTint ("Inline Tint", Color) = (0.5, 0.5, 0.5, 1)
        _InlineAmount ("Inline Amount", Range(0, 1)) = 1
        [HDR] _OutlineTint ("Outline Tint", Color) = (0.5, 0.5, 0.5, 1)
        _OutlineZCorrection ("Outline Correction (world z)", Range(-0.0005, 0.0005)) = 0
        [HDR] _OutlineSolidColorTint ("Solid Color Tint", Color) = (0.7, 0, 0, 1)
        [HideInInspector] _CodeAddColor ("_CodeAddColor", Color) = (0, 0, 0, 0)
        [HideInInspector] _CodeMultiplyColor ("_CodeMultiplyColor", Color) = (1, 1, 1, 1)
        [HideInInspector] _CodeAddRimColor ("_CodeAddRimColor", Color) = (0, 0, 0, 0)
        [HideInInspector] _DitherThreshold ("_DitherThreshold", Range(0, 1)) = 0
        [HideInInspector] _GrayBrightness ("_GrayBrightness", Float) = 1
        [Enum(UnityEngine.Rendering.CullMode)] [HideInInspector] _Cull ("Cull", Float) = 2
        [Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("Src Blend", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("Dst Blend", Float) = 0
        [Enum(UnityEngine.Rendering.BlendMode)] _SrcBlendAlpha ("Src Blend Alpha", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] _DstBlendAlpha ("Dst Blend Alpha", Float) = 0
        [Enum(Off,0, On,1)] _ZWrite ("Z Write", Float) = 1
    }
    SubShader
    {
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
            #pragma multi_compile_local __ _DITHER_HORIZONTAL_LINES
            #pragma multi_compile_local __ _GRAYSCALE_MODE
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXCharacterGeneralV2Inline_a65c55e3/00_00_ForwardLit.hlsl"
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
            #pragma multi_compile_local __ _DITHER_HORIZONTAL_LINES
            #pragma multi_compile_local __ _GRAYSCALE_MODE
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXCharacterGeneralV2Inline_a65c55e3/00_01_Outline.hlsl"
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
            #include "Includes/MXCharacterGeneralV2Inline_a65c55e3/00_02_Solid_Color_Outline.hlsl"
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
            #pragma multi_compile_local __ _DITHER_HORIZONTAL_LINES
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXCharacterGeneralV2Inline_a65c55e3/00_03_ShadowCaster.hlsl"
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
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXCharacterGeneralV2Inline_a65c55e3/00_04_DepthOnly.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
