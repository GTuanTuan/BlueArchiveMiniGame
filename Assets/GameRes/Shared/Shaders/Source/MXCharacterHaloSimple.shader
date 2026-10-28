Shader "BA/Reconstructed/MX/C-Halo/Simple"
{
    Properties
    {
        [HDR] _SimpleBaseColor ("Base Color", Color) = (0.5, 0.5, 0.5, 1)
        [HideInInspector] _DitherThreshold ("_DitherThreshold", Range(0, 1)) = 0
        [HideInInspector] _GrayBrightness ("_GrayBrightness", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _SrcBlend ("Src Blend", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _DstBlend ("Dst Blend", Float) = 0
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _SrcBlendAlpha ("Src Blend Alpha", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _DstBlendAlpha ("Dst Blend Alpha", Float) = 0
        [Enum(Off,0, On,1)] [HideInInspector] _ZWrite ("Z Write", Float) = 1
        [Enum(UnityEngine.Rendering.CullMode)] [HideInInspector] _Cull ("Cull", Float) = 0
    }
    SubShader
    {
        LOD 300
        Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
        Pass
        {
            Name "ForwardLit"
            Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
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
            #pragma multi_compile_instancing
            #pragma multi_compile_local __ _DITHER_HORIZONTAL_LINES
            #pragma multi_compile_local __ _GRAYSCALE_MODE
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXCharacterHaloSimple/00_ForwardLit.hlsl"
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
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXCharacterHaloSimple/01_DepthOnly.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
