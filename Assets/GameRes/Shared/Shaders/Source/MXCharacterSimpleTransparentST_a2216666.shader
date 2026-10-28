Shader "BA/Reconstructed/MX/C-Transparent-ST"
{
    Properties
    {
        [Header(Render Option)] [Space(6)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2
        [MaterialToggle] _ZWrite ("Z-Write", Float) = 1
        [Space(10)] [Header(Diffuse)] [Space(6)] [HDR] _Tint ("Tint", Color) = (1, 1, 1, 1)
        [NoScaleOffset] _MainTex ("Main Tex", 2D) = "white" {}
        [Space(10)] [Header(Mask and See Through Tex)] [Space(6)] [NoScaleOffset] _MaskTex ("Mask Tex(R,G) / See Through(B)", 2D) = "gray" {}
        [Space(6)] [Header(Mask)] [Space(6)] _MaskGSensitivity ("Mask G Sensitivity", Range(0, 3)) = 1
        _MaskRtoG ("Mask R to G", Range(0, 1)) = 0
        [Space(6)] [Header(See Through)] [Space(6)] _SeeThroughMinValue ("See-Through Min Value", Range(0, 1)) = 0.6
        _SeeThroughTransparency ("See-Through Transparency", Range(0, 1)) = 1
        _SeeThroughSmoothness ("See-Through Smoothness", Range(0.1, 1)) = 1
        [Space(10)] [Header(Shadow)] [Space(5)] [HDR] _ShadowTint ("Shadow Tint", Color) = (0.5, 0.5, 0.5, 1)
        _ShadowThreshold ("Shadow Threshold", Range(-5, 5)) = 0.5
        [Space(10)] [Header(Rim)] [Space(6)] _RimAreaMultiplier ("Rim Area Multiplier", Range(1, 7)) = 3
        _RimStrength ("Rim Strength", Range(0, 10)) = 1
        [Header(Additional Light)] [Space(6)] _AdditionalLightStrength ("Additional Light Strength", Range(0, 2)) = 1
        _AdditionalLightSharpness ("Additional Light Sharpness", Range(0, 100)) = 5
        [HideInInspector] _CodeAddColor ("_CodeAddColor", Color) = (0, 0, 0, 0)
        [HideInInspector] _CodeMultiplyColor ("_CodeMultiplyColor", Color) = (1, 1, 1, 1)
        [HideInInspector] _CodeAddRimColor ("_CodeAddRimColor", Color) = (0, 0, 0, 0)
        [HideInInspector] _DitherThreshold ("_DitherThreshold", Range(0, 1)) = 0
        [HideInInspector] _GrayBrightness ("_GrayBrightness", Float) = 1
    }
    SubShader
    {
        LOD 300
        Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
        Pass
        {
            Name "ForwardLit"
            Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
            Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
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
            #include "Includes/MXCharacterSimpleTransparentST_a2216666/00_00_ForwardLit.hlsl"
            ENDHLSL
        }
        Pass
        {
            Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
            Blend One Zero, One Zero
            BlendOp Add, Add
            ColorMask 0
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
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXCharacterSimpleTransparentST_a2216666/00_01_.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
