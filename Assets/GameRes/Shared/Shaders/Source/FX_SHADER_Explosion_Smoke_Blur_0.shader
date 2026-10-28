Shader "BA/Reconstructed/DSFX/FX_SHADER_Explosion_Smoke_Blur_0"
{
    Properties
    {
        [HDR] _RColor ("[R]Color", Color) = (1, 1, 1, 1)
        _Mutiply ("Mutiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [Toggle] _Custom_Data_Main_Offset_Use ("Custom_Data_Main_Offset_Use", Float) = 0
        [Toggle] _Color_Custom_Data_Use ("Color_Custom_Data_Use", Float) = 1
        [HDR] _GColor ("[G]Color", Color) = (1, 0.2989459, 0, 0)
        [Toggle] _GCustom_Data_Use ("[G]Custom_Data_Use", Float) = 1
        _GColor_Glow_Value ("[G]Color_Glow_Value", Float) = 20
        _GDisappear_Offset ("[G]Disappear_Offset", Range(0, 1)) = 0
        [Toggle] _BCustom_Data_Use ("[B]Custom_Data_Use", Float) = 1
        _BStep_Glow_Value ("[B]Step_Glow_Value", Float) = 20
        _BDisappear_Offset ("[B]Disappear_Offset", Range(0, 1)) = 0
        [Toggle] _Vertex_Alpha_Use ("Vertex_Alpha_Use", Float) = 0
        [Toggle] _Step_Custom_DataVertex_color_Use ("Step_Custom_Data/Vertex_color_Use", Float) = 0
        _Shadow_Color_Multiply ("Shadow_Color_Multiply", Range(0, 1)) = 0.5
        _Shadow_Value ("Shadow_Value", Range(-0.3, 0)) = 0
        _Shadow_Glow_Value ("Shadow_Glow_Value", Float) = 20
        [Toggle] _ZWrite_Mode ("ZWrite_Mode", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest_Mode ("ZTest_Mode", Float) = 4
        [Enum(UnityEngine.Rendering.CullMode)] _Cull_Mode ("Cull_Mode", Float) = 2
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
            #include "Includes/FX_SHADER_Explosion_Smoke_Blur_0/00_Forward.hlsl"
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
            #include "Includes/FX_SHADER_Explosion_Smoke_Blur_0/01_ShadowCaster.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
