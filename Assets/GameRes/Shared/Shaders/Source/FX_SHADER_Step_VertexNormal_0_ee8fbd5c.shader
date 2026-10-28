Shader "BA/Reconstructed/DSFX/FX_SHADER_Step_VertexNormal_0"
{
    Properties
    {
        [HDR] _Color ("Color", Color) = (1, 0, 0, 0)
        _Multiply ("Multiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        _Tex_Mask ("Tex_Mask", 2D) = "white" {}
        [HDR] _RChannel_Color ("[R]Channel_Color", Color) = (1, 0.2989459, 0, 0)
        _RMultiply ("[R]Multiply", Range(-1, 0)) = -0.69
        [HDR] _GChannel_Color ("[G]Channel_Color", Color) = (1, 0.2989459, 0, 0)
        [Toggle] _GCustom_Data_Use ("[G]Custom_Data_Use", Float) = 0
        _GChannel_Step_Power ("[G]Channel_Step_Power", Range(0, 1)) = 0.95
        [Toggle] _BCustom_Data_Use ("[B]Custom_Data_Use", Float) = 0
        [Toggle] _Custom_VertexNormal_Offset_Use ("Custom_VertexNormal_Offset_Use", Float) = 0
        _BChannel_Step_Power ("[B]Channel_Step_Power", Range(0, 1)) = 1
        _Tex_VertexNormal ("Tex_VertexNormal", 2D) = "white" {}
        _VertexNormal_Offset ("VertexNormal_Offset", Vector) = (0, 0, 0, 0)
        [Toggle] _ZWrite_Mode ("ZWrite_Mode", Float) = 1
        [Enum(UnityEngine.Rendering.CullMode)] _Cull_Mode ("Cull_Mode", Float) = 2
        [HideInInspector] _texcoord ("", 2D) = "white" {}
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
            #include "Includes/FX_SHADER_Step_VertexNormal_0_ee8fbd5c/00_00_Forward.hlsl"
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
            #include "Includes/FX_SHADER_Step_VertexNormal_0_ee8fbd5c/00_01_ShadowCaster.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
