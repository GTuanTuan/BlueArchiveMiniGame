Shader "BA/Reconstructed/DSFX/FX_SHADER_AddTexRGB_Distort_0"
{
    Properties
    {
        [HDR] _Color ("Color", Color) = (1, 1, 1, 1)
        _Main_Multiply ("Main_Multiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        [Toggle] _Main_Distortion_Use ("Main_Distortion_Use", Float) = 1
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [Toggle] _Custom_Data_MainMask_Offset_Use ("Custom_Data_Main/Mask_Offset_Use", Float) = 0
        [HDR] _Add_Color ("Add_Color", Color) = (1, 0, 0, 1)
        _Add_Multiply ("Add_Multiply", Float) = 0.39
        _Tex_AddRGB ("Tex_Add[RGB]", 2D) = "white" {}
        [Toggle] _RAdd_Distortion_Use ("[R]Add_Distortion_Use", Float) = 1
        [Toggle] _GAdd_Distortion_Use ("[G]Add_Distortion_Use", Float) = 0
        [Toggle] _BAdd_Distortion_Use ("[B]Add_Distortion_Use", Float) = 0
        [Toggle] _Add_Distortion_Use ("Add_Distortion_Use", Float) = 1
        _Add_Speed_X ("Add_Speed_X", Float) = -1
        _Add_Speed_Y ("Add_Speed_Y", Float) = 0
        _Tex_Distort ("Tex_Distort", 2D) = "white" {}
        _Dis_Speed_X ("Dis_Speed_X", Float) = 0
        _Dis_Speed_Y ("Dis_Speed_Y", Float) = 0
        _Distortion_Power_X ("Distortion_Power_X", Float) = 0
        _Distortion_Power_Y ("Distortion_Power_Y", Float) = 0
        [Toggle] _UV_Add_Use ("UV_Add_Use", Float) = 0
        [Toggle] _Custom_Data_Distort_Power_Use ("Custom_Data_Distort_Power_Use", Float) = 0
        _UV_Add_TilingOffset ("UV_Add_Tiling/Offset", Vector) = (0, 0, 0, 0)
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
            Lighting Off
            HLSLPROGRAM
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_AddTexRGB_Distort_0_0c8eaeba/00_00_Forward.hlsl"
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
            Lighting Off
            HLSLPROGRAM
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_AddTexRGB_Distort_0_0c8eaeba/00_01_ShadowCaster.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
