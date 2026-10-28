Shader "BA/Reconstructed/DSFX/FX_SHADER_AlphaBlend_Add_Double_Distort_0"
{
    Properties
    {
        [HDR] _Color ("Color", Color) = (1, 1, 1, 1)
        _Multiply ("Multiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        [Toggle] _RGBRGBA ("RGB>RGBA", Float) = 0
        [Toggle] _Main_Distort_Use ("Main_Distort_Use", Float) = 0
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [Toggle] _Custom_Data_MainMask_Offset_Use ("Custom_Data_Main/Mask_Offset_Use", Float) = 0
        _Tex_Mask ("Tex_Mask", 2D) = "white" {}
        [Toggle] _Mask_RDistort_Use ("Mask_[R]Distort_Use", Float) = 0
        [Toggle] _Mask_GDistort_Use ("Mask_[G]Distort_Use", Float) = 0
        _Mask_Speed_X ("Mask_Speed_X", Float) = 0
        _Mask_Speed_Y ("Mask_Speed_Y", Float) = 0
        _Tex_DistortRG ("Tex_Distort[R,G]", 2D) = "white" {}
        _R_Tilingxy_Offsetzw ("[R]_Tiling(x,y)_Offset(z,w)", Vector) = (1, 1, 0, 0)
        _RDistort_Speed_X ("[R]Distort_Speed_X", Float) = 0
        _RDistort_Speed_Y ("[R]Distort_Speed_Y", Float) = 0
        _RDistort_Power_X ("[R]Distort_Power_X", Float) = 0
        _RDistort_Power_Y ("[R]Distort_Power_Y", Float) = 0
        [Toggle] _Custom_Data_RDistort_Power_Use ("Custom_Data_[R]Distort_Power_Use", Float) = 0
        _G_Tilingxy_Offsetzw ("[G]_Tiling(x,y)_Offset(z,w)", Vector) = (1, 1, 0, 0)
        _GDistort_Speed_X ("[G]Distort_Speed_X", Float) = 0
        _GDistort_Speed_Y ("[G]Distort_Speed_Y", Float) = 0
        _GDistort_Power_X ("[G]Distort_Power_X", Float) = 0
        _GDistort_Power_Y ("[G]Distort_Power_Y", Float) = 0
        [Toggle] _GDistort_invert ("[G]Distort_invert", Float) = 0
        [Toggle] _Custom_Data_GDistort_Power_Use ("Custom_Data_[G]Distort_Power_Use", Float) = 0
        [Enum(UnityEngine.Rendering.CullMode)] _Cull_Mode ("Cull_Mode", Float) = 2
        [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest_Mode ("ZTest_Mode", Float) = 4
        [Toggle] _ZWrite_Mode ("ZWrite_Mode", Float) = 0
        _ZOffsetFactor ("ZOffsetFactor", Float) = 0
        _ZOffsetUnits ("ZOffsetUnits", Float) = 0
    }
    SubShader
    {
        Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
        Pass
        {
            Name "Forward"
            Tags { "LIGHTMODE" = "UniversalForward" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
            Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest [_ZTest_Mode]
            ZWrite [_ZWrite_Mode]
            Cull [_Cull_Mode]
            Conservative Off
            AlphaToMask Off
            Offset [_ZOffsetFactor], [_ZOffsetUnits]
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
            #include "Includes/FX_SHADER_AlphaBlend_Add_Double_Distort_0_e5ef2844/00_00_Forward.hlsl"
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
            #include "Includes/FX_SHADER_AlphaBlend_Add_Double_Distort_0_e5ef2844/00_01_ShadowCaster.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
