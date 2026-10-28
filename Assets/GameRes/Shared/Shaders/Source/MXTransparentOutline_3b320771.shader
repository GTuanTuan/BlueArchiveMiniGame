Shader "BA/Reconstructed/MX/C-Transparent-Outline"
{
    Properties
    {
        [Header(Diffuse)] [Space(6)] [HDR] _Tint ("Tint", Color) = (1, 1, 1, 1)
        [NoScaleOffset] _MainTex ("Main Texture", 2D) = "white" {}
        [Header(Rim)] [Space(6)] _RimStrength ("Rim Strength", Range(0, 1)) = 1
        _RimArea ("Rim Area", Range(0, 10)) = 1
        _RimSharpness ("Rim Sharpness", Range(0, 0.99)) = 0.6
        [Space(10)] [Header(Line And Dissolve)] [Space(6)] [NoScaleOffset] _InlineDissolveTex ("Texture ( Inline R, Inline(ViewDir) G, Dissolve B )", 2D) = "black" {}
        [HDR] _LineColor ("Line Color", Color) = (1, 1, 1, 1)
        [Header(Inline (View Dir))] [Space(6)] _InlineArea ("Inline Area", Range(0, 10)) = 1
        _InlineSharpness ("Inline Sharpness", Range(0, 0.99)) = 0
        [Header(Dissolve)] [Space(6)] [Enum(UV 1, 0, UV 2, 1)] _DissolveUVChannel ("Dissolve UV Channel", Float) = 1
        _DissolveFactor ("Dissolve Factor", Range(0, 1)) = 0
        _DissolveLineThickness ("Dissolve Line Thickness", Range(0, 0.1)) = 0.05
        [Header(Outline)] [Space(6)] _OutlineAlpha ("Outline Alpha", Range(0, 1)) = 1
        _OutlineThickness ("Outline Thickness", Range(0, 0.01)) = 0.002
        [Header(Depth Draw)] [Space(6)] [Enum(Off, 0, On, 1)] _DepthDrawPassZWrite ("2 Pass Depth Draw", Float) = 1
    }
    SubShader
    {
        Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
        Pass
        {
            Name "DepthDraw"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SRPDEFAULTUNLIT" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
            Blend One Zero, One Zero
            BlendOp Add, Add
            ColorMask 0
            ZClip On
            ZTest LEqual
            ZWrite [_DepthDrawPassZWrite]
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
            Fog
            {
                Mode Off
            }
            Lighting Off
            HLSLPROGRAM
            #pragma multi_compile __ FOG_EXP FOG_LINEAR
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXTransparentOutline_3b320771/00_00_DepthDraw.hlsl"
            ENDHLSL
        }
        Pass
        {
            Name "Forward"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalForward" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
            Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
            ZWrite Off
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
            #include "Includes/MXTransparentOutline_3b320771/00_01_Forward.hlsl"
            ENDHLSL
        }
        Pass
        {
            Name "Outline"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "MXPostUniversalForward" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
            Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
            ZWrite Off
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
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXTransparentOutline_3b320771/00_02_Outline.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
