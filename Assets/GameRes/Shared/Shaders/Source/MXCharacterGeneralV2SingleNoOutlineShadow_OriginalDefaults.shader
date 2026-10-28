Shader "BA/Reconstructed/MX/C-General/Single-NoOutlineNoShadowcast/OriginalDefaults"
{
    Properties
    {
        [HDR] _Tint ("Tint", Color) = (1, 1, 1, 1)
        [NoScaleOffset] _MainTex ("Main Tex", 2D) = "white" {}
        [HDR] _TwoSideTint ("Two Side Tint", Color) = (1, 1, 1, 1)
        [NoScaleOffset] _MaskTex ("Mask Tex", 2D) = "black" {}
        _MaskGSensitivity ("Mask G Sensitivity", Range(0, 3)) = 1
        _BaseBrightness ("Base Brightness", Range(-2, 5)) = 0
        _ShadowTint ("Shadow Tint", Color) = (0.5, 0.5, 0.5, 1)
        _ShadowThreshold ("Shadow Threshold", Range(-5, 5)) = 0.5
        _ViewOffset ("View Light Angle Offset", Range(-8, 8)) = 0
        _ViewPower ("View Light Sharpness", Range(1, 128)) = 1
        _ViewStrength ("View Light Strength", Range(-10, 10)) = 0
        _InvViewPower ("Inv.View Light Sharpness", Range(1, 128)) = 1
        _InvViewStrength ("Inv.View Light Strength", Range(-10, 10)) = 0
        _ViewLightEdge ("View Light Edge", Range(0, 1)) = 0
        _RimAreaMultiplier ("Rim Area Multiplier", Range(1, 7)) = 3
        _RimAreaLeveler ("Rim Area Leveler", Float) = 2
        _RimStrength ("Rim Strength", Range(0, 10)) = 1
        _AdditionalLightStrength ("Additional Light Strength", Range(0, 2)) = 1
        _AdditionalLightSharpness ("Additional Light Sharpness", Range(0, 100)) = 5
        [HDR] _GlowTint ("Glow Tint", Color) = (0, 0, 0, 1)
        _GlowStrength ("Glow Strength", Range(0, 5)) = 0
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
        _MxCharLightDir ("_MxCharLightDir (fixed source scene lighting)", Vector) = (0.078335117, 0.895373949, -0.438371098, 0)
        _MxCharLightTone ("_MxCharLightTone (fixed source scene lighting)", Vector) = (1, 1, 1, 0)
        _MxCharShadowTone ("_MxCharShadowTone (fixed source scene lighting)", Vector) = (1, 1, 1, 0)
        _MxCharLightData ("_MxCharLightData (fixed source scene lighting)", Vector) = (1, 1, 0, 0)
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
            #include "Includes/MXCharacterGeneralV2SingleNoOutlineShadow/00_ForwardLit.hlsl"
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
            #include "Includes/MXCharacterGeneralV2SingleNoOutlineShadow/01_DepthOnly.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
