Shader "BA/Reconstructed/DSFX/FX_SHADER_Multiplicative_Distort_0"
{
    Properties
    {
        [HDR] _Color ("Color", Color) = (1, 1, 1, 1)
        _Multiply ("Multiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        [Toggle] _Main_Distortion_Use ("Main_Distortion_Use", Float) = 1
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [Toggle] _Custom_Data_MainMask_Offset_Use ("Custom_Data_Main/Mask_Offset_Use", Float) = 0
        _Tex_Mask ("Tex_Mask", 2D) = "white" {}
        [Toggle] _Mask_Distortion_Use ("Mask_Distortion_Use", Float) = 0
        _Mask_Speed_X ("Mask_Speed_X", Float) = 0
        _Mask_Speed_Y ("Mask_Speed_Y", Float) = 0
        _Tex_Distort ("Tex_Distort", 2D) = "white" {}
        _Dis_Speed_X ("Dis_Speed_X", Float) = 0
        _Dis_Speed_Y ("Dis_Speed_Y", Float) = 0
        _Distortion_Power_X ("Distortion_Power_X", Float) = 0
        _Distortion_Power_Y ("Distortion_Power_Y", Float) = 0
        [Toggle] _Custom_Data_Distort_Power_Use ("Custom_Data_Distort_Power_Use", Float) = 0
        [Toggle] _ZWrite_Mode ("ZWrite_Mode", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest_Mode ("ZTest_Mode", Float) = 4
        [Enum(UnityEngine.Rendering.CullMode)] _Cull_Mode ("Cull_Mode", Float) = 2
    }
    SubShader
    {
        Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
        Pass
        {
            Name "Forward"
            Tags { "LIGHTMODE" = "UniversalForward" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
            Blend DstColor Zero, DstColor Zero
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
            #include "Includes/FX_SHADER_Multiplicative_Distort_0_1f0797c2/00_00_Forward.hlsl"
            ENDHLSL
        }
        Pass
        {
            Name "ShadowCaster"
            Tags { "LIGHTMODE" = "SHADOWCASTER" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
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
            #include "Includes/FX_SHADER_Multiplicative_Distort_0_1f0797c2/00_01_ShadowCaster.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
