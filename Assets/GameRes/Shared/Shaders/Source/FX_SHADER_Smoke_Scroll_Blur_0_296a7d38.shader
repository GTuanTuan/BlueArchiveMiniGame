Shader "BA/Reconstructed/DSFX/FX_SHADER_Smoke_Scroll_Blur_0"
{
    Properties
    {
        [HDR] _Color ("Color", Color) = (1, 0.7971698, 0.7971698, 1)
        _Multiply ("Multiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        _Shadow_Color_Value ("Shadow_Color_Value", Float) = 0.5
        _Shadow_Value ("Shadow_Value", Float) = 0
        [HDR] _Color2 ("Color2", Color) = (1, 1, 1, 0)
        [Toggle] _Color2_Scroll_Use ("Color2_Scroll_Use", Float) = 0
        _Color2_Offset ("Color2_Offset", Range(-1, 1)) = -0.7120125
        [Toggle] _Step_Scroll_Use ("Step_Scroll_Use", Float) = 0
        _Step_Power ("Step_Power", Range(0, 2)) = 0.1484019
        _Step_Scale ("Step_Scale", Float) = 0
        _Step_Offset ("Step_Offset", Float) = 0
        _Step_Glow_Value ("Step_Glow_Value", Float) = 1
        _Tex_Mask ("Tex_Mask", 2D) = "white" {}
        [Toggle] _ZWrite_Mode ("ZWrite_Mode", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest_Mode ("ZTest_Mode", Float) = 4
        [Enum(UnityEngine.Rendering.CullMode)] _Cull_Mode ("Cull_Mode", Float) = 2
        _Alphaclip_Value ("Alphaclip_Value", Float) = 0
    }
    SubShader
    {
        Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
        Pass
        {
            Name "Forward"
            Tags { "LIGHTMODE" = "UniversalForward" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest [_ZTest_Mode]
            ZWrite [_ZWrite_Mode]
            Cull [_Cull_Mode]
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
            #include "Includes/FX_SHADER_Smoke_Scroll_Blur_0_296a7d38/00_00_Forward.hlsl"
            ENDHLSL
        }
        Pass
        {
            Name "ShadowCaster"
            Tags { "LIGHTMODE" = "SHADOWCASTER" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend One Zero, One Zero
            BlendOp Add, Add
            ColorMask 0
            ZClip On
            ZTest LEqual
            ZWrite On
            Cull [_Cull_Mode]
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
            #include "Includes/FX_SHADER_Smoke_Scroll_Blur_0_296a7d38/00_01_ShadowCaster.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
