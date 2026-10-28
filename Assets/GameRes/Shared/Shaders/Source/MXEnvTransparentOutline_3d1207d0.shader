Shader "BA/Reconstructed/MX/E-Transparent-Outline"
{
    Properties
    {
        [Header(Diffuse)] [Space(6)] _MainTex ("Texture", 2D) = "white" {}
        [HDR] _Tint ("Tint", Color) = (1, 1, 1, 1)
        [Header(Specular (View Direction))] [Space(6)] _SpecularArea ("Specular Area", Range(0, 1)) = 0.1
        _SpecularStrength ("Specular Strength", Range(0, 1)) = 0.9
        _SpecularSharpness ("Specular Sharpness", Range(0, 1)) = 0.99
        [Header(Rim)] [Space(6)] _RimColor ("Rim Color", Color) = (1, 1, 1, 1)
        _RimArea ("Rim Area", Range(0, 1)) = 1
        _RimStrength ("Rim Strength", Range(0, 1)) = 0.5
        _RimSharpness ("Rim Sharpness", Range(0, 1)) = 0.6
        [Header(Outline)] [Space(6)] [HDR] _OutlineTint ("Outline Tint", Color) = (1, 1, 1, 1)
        _OutlineThickness ("Outline Thickness", Range(0, 0.1)) = 0.005
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
            #include "Includes/MXEnvTransparentOutline_3d1207d0/00_00_DepthDraw.hlsl"
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
            #include "Includes/MXEnvTransparentOutline_3d1207d0/00_01_Forward.hlsl"
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
            #include "Includes/MXEnvTransparentOutline_3d1207d0/00_02_Outline.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
