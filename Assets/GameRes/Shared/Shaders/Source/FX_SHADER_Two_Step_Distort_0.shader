Shader "BA/Reconstructed/DSFX/FX_SHADER_Two_Step_Distort_0"
{
    Properties
    {
        [HDR] _Color ("Color", Color) = (1, 0.9456895, 0, 0)
        _Multiply ("Multiply", Float) = 1
        _Multiply_G ("Multiply_[G]", Float) = 1
        _Tex_MainRGB ("Tex_Main[R,G,B]", 2D) = "white" {}
        [Toggle] _Custom_Data_Main_Offset_Use ("Custom_Data_Main_Offset_Use", Float) = 1
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [Toggle] _Step_Scroll_Use ("Step_Scroll_Use", Float) = 1
        _Step_Value ("Step_Value", Range(0, 1)) = 0.6019696
        _Tex_Distort ("Tex_Distort", 2D) = "white" {}
        _Dis_Speed_X ("Dis_Speed_X", Float) = 0
        _Dis_Speed_Y ("Dis_Speed_Y", Float) = 0
        _Dis_Power_X ("Dis_Power_X", Float) = 0
        _Dis_Power_Y ("Dis_Power_Y", Float) = 0
        [Toggle] _Custom_Data_Distort_Power_Use ("Custom_Data_Distort_Power_Use", Float) = 1
        [Toggle] _ZWrite_Mode ("ZWrite_Mode", Float) = 1
        [Enum(UnityEngine.Rendering.CullMode)] _Cull_Mode ("Cull_Mode", Float) = 0
    }
    SubShader
    {
        Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
        Pass
        {
            Name "Forward"
            Tags { "LIGHTMODE" = "UniversalForwardOnly" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
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
            #include "Includes/FX_SHADER_Two_Step_Distort_0/00_Forward.hlsl"
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
            #include "Includes/FX_SHADER_Two_Step_Distort_0/01_ShadowCaster.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
