Shader "BA/Reconstructed/Decal/Cube Center Flow"
{
    Properties
    {
        [Header(add script. ScreenSpaceDecal)] [Space(10)] [HDR] _Tint ("Tint", Color) = (1, 1, 1, 1)
        _MainTex ("Main Tex", 2D) = "white" {}
        [Space(10)] _FlowTex ("Flow Tex", 2D) = "black" {}
        _FlowSpeed ("Flow Speed", Float) = 0.5
        _FlowScale ("Flow Scale", Float) = 4
        _FlowIntroBlendSpeed ("Flow Intro Blend Speed", Range(1.1, 11)) = 1.1
        [Header(Fade)] [Space(3)] _FadeStartHeight ("Fade Start Height", Range(0, 1)) = 0.3
        [HideInInspector] _invMatrixMVP0 ("_invMatrixMVP0", Vector) = (1, 0, 0, 0)
        [HideInInspector] _invMatrixMVP1 ("_invMatrixMVP1", Vector) = (0, 1, 0, 0)
        [HideInInspector] _invMatrixMVP2 ("_invMatrixMVP2", Vector) = (0, 0, 1, 0)
        [HideInInspector] _invMatrixMVP3 ("_invMatrixMVP3", Vector) = (0, 0, 0, 1)
    }
    SubShader
    {
        Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
        Pass
        {
            Name "ForwardLit"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalForward" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
            Blend One One, One OneMinusSrcAlpha
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
            #pragma multi_compile __ FOG_EXP FOG_LINEAR
            #pragma multi_compile_instancing
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXDecalCubeCenterFlow_f11206a8/00_00_ForwardLit.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
