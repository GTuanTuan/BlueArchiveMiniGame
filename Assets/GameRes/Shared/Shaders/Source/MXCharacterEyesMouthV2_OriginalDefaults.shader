Shader "BA/Reconstructed/MX/C-EyesMouth/OriginalDefaults"
{
    Properties
    {
        [NoScaleOffset] _MainTex ("Main Tex", 2D) = "white" {}
        [HDR] _EyeTint ("Eye Tint", Color) = (1, 1, 1, 1)
        [HDR] _MouthTint ("Mouth Tint", Color) = (1, 1, 1, 1)
        _MouthTileRows ("Mouth Tile Rows", Float) = 8
        _MouthTileCols ("Mouth Tile Cols", Float) = 8
        _MouthTileTex ("Mouth Tile Tex", 2D) = "white" {}
        [Space(5)] [Header(Additional Light)] [Space(6)] _AdditionalLightStrength ("Additional Light Strength", Range(0, 2)) = 0.15
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
        Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry+1" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
        Pass
        {
            Name "ForwardLit"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalForward" "QUEUE" = "Geometry+1" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
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
            #pragma multi_compile_local __ _DITHER_HORIZONTAL_LINES
            #pragma multi_compile_local __ _GRAYSCALE_MODE
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXCharacterEyesMouthV2/00_ForwardLit.hlsl"
            ENDHLSL
        }
        Pass
        {
            Name "DepthOnly"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthOnly" "QUEUE" = "Geometry+1" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
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
            #include "Includes/MXCharacterEyesMouthV2/01_DepthOnly.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
