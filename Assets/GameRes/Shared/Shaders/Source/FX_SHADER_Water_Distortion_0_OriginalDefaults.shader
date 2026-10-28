Shader "BA/Reconstructed/DSFX/FX_SHADER_Water_Distortion_0/OriginalDefaults"
{
    Properties
    {
        [HDR] _MainColor ("MainColor", Color) = (1, 1, 1, 1)
        _Mutiply ("Mutiply", Float) = 1
        _Main_TexRGBA ("Main_Tex (RGBA)", 2D) = "white" {}
        [Toggle] _Custom_Data_MainRB_Offset_Use ("Custom_Data_Main[R,B]_Offset_Use", Float) = 0
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [HDR] _SubColor ("SubColor", Color) = (2, 2, 2, 1)
        _Sub_Tex ("Sub_Tex", 2D) = "white" {}
        _Sub_Speed_X ("Sub_Speed_X", Float) = 0
        _Sub_Speed_Y ("Sub_Speed_Y", Float) = 0
        [Toggle] _GCustom_Data_Use ("[G]Custom_Data_Use", Float) = 1
        _GColor_Sharpness ("[G]Color_Sharpness", Float) = 20
        _GDisappear_Offset ("[G]Disappear_Offset", Range(0, 1)) = 0
        [Toggle] _BCustom_Data_Use ("[B]Custom_Data_Use", Float) = 1
        _BDisappear_Offset ("[B]Disappear_Offset", Range(0, 1)) = 0
        [Toggle] _Custom_Data_Shadow_Value_Use ("Custom_Data_Shadow_Value_Use", Float) = 1
        _Shadow_Value ("Shadow_Value", Float) = -0.55
        _Tex_Distort ("Tex_Distort", 2D) = "white" {}
        _Dis_Speed_X ("Dis_Speed_X", Float) = 0
        _Dis_Speed_Y ("Dis_Speed_Y", Float) = 0
        _Distortion_Power_X ("Distortion_Power_X", Float) = 0
        _Distortion_Power_Y ("Distortion_Power_Y", Float) = 0
        [Toggle] _Custom_Data_Distort_Power_Offset_Use ("Custom_Data_Distort_Power_Offset_Use", Float) = 0
        [Toggle] _UV_Add_Use ("UV_Add_Use", Float) = 0
        _UV_Add_TilingOffset ("UV_Add_Tiling/Offset", Vector) = (0, 0, 0, 0)
        _AlphaClip_Value ("AlphaClip_Value", Float) = 0
        [Toggle] _ZWrite_Mode ("ZWrite_Mode", Float) = 0
        [Enum(UnityEngine.Rendering.CullMode)] _Cull_Mode ("Cull_Mode", Float) = 2
        _ZOffsetFactor ("ZOffsetFactor", Float) = 0
        _ZOffsetUnits ("ZOffsetUnits", Float) = 0
        _ShadowCoordModifier ("_ShadowCoordModifier (original neutral material override)", Vector) = (0, 0, 0, 0)
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
            #include "Includes/FX_SHADER_Water_Distortion_0/00_Forward.hlsl"
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
            #include "Includes/FX_SHADER_Water_Distortion_0/01_ShadowCaster.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
