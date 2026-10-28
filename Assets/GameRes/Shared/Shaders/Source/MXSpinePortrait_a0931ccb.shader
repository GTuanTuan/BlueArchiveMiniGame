Shader "BA/Reconstructed/Spine/Skeleton MX Portrait"
{
    Properties
    {
        [HDR] _Color ("Tint (_Color)", Color) = (1, 1, 1, 1)
        _Black ("Black Point (_Black)", Color) = (0, 0, 0, 0)
        [NoScaleOffset] _MainTex ("Main Tex", 2D) = "black" {}
        _ColorFilterR ("GradingColorR", Vector) = (1, 1, 1, 1)
        _ColorFilterG ("GradingColorG", Vector) = (1, 1, 1, 1)
        _ColorFilterB ("GradingColorB", Vector) = (1, 1, 1, 1)
        _ColorIntensity ("ColorIntensity", Float) = 1
        _ThresholdParams ("ThresholdParams", Vector) = (0, 0, 0, 0)
    }
    SubShader
    {
        Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
        Pass
        {
            Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
            Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
            ZWrite Off
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
            Fog
            {
                Mode Off
            }
            Lighting Off
            HLSLPROGRAM
            #pragma multi_compile_local __ _COLOR_FILTER_MODE
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXSpinePortrait_a0931ccb/00_00_.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
