Shader "BA/Reconstructed/DSFX/FX_SHADER_Explosion_Smoke_Blur_Sp_1a"
{
    Properties
    {
        [HDR] _RColor ("[R]Color", Color) = (1, 1, 1, 1)
        _Mutiply ("Mutiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [HDR] _GColor ("[G]Color", Color) = (1, 1, 1, 1)
        _GColor_Glow_Value ("[G]Color_Glow_Value", Float) = 20
        _GStep_Value ("[G]Step_Value", Range(0, 1)) = 0
        _GColor_Power ("[G]Color_Power", Range(-1, 1)) = 0
        _GColor_Offset_X ("[G]Color_Offset_X", Float) = 0
        _GColor_Offset_Y ("[G]Color_Offset_Y", Float) = 0
        _BStep_Glow_Value ("[B]Step_Glow_Value", Float) = 20
        _BStep_Value ("[B]Step_Value", Range(0, 1)) = 0
        _Shadow_Color_Multiply ("Shadow_Color_Multiply", Range(0, 1)) = 1
        _Shadow_Power ("Shadow_Power", Range(-1, 1)) = 0
        _Shadow_Offset_X ("Shadow_Offset_X", Float) = 0
        _Shadow_Offset_Y ("Shadow_Offset_Y", Float) = 0
        _Shadow_Glow_Value ("Shadow_Glow_Value", Float) = 20
        _Tex_Distort ("Tex_Distort", 2D) = "white" {}
        _Dis_Speed_X ("Dis_Speed_X", Float) = 0
        _Dis_Speed_Y ("Dis_Speed_Y", Float) = 0
        _Distortion_Power_X ("Distortion_Power_X", Float) = 0
        _Distortion_Power_Y ("Distortion_Power_Y", Float) = 0
        [KeywordEnum(Off,On)] _Vertex_Alpha_Color ("Vertex_Alpha_Color", Float) = 0
        [KeywordEnum(Off,On)] _Vertex_Alpha_Use ("Vertex_Alpha_Use", Float) = 0
        _Alphaclip_Value ("Alphaclip_Value", Float) = 0
        [HideInInspector] _CustomData_MainTiling_CD1XYXY ("CustomData_MainTiling_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MainTiling_CD2XYXY ("CustomData_MainTiling_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MainOffset_CD1XYXY ("CustomData_MainOffset_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_MainOffset_CD2XYXY ("CustomData_MainOffset_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_StepValue_CD1XYXY ("CustomData_StepValue_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortTiling_CD1XYXY ("CustomData_DistortTiling_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortTiling_CD2XYXY ("CustomData_DistortTiling_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortOffset_CD1XYXY ("CustomData_DistortOffset_CD1[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortOffset_CD2XYXY ("CustomData_DistortOffset_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_DistortPower_CD2XYXY ("CustomData_DistortPower_CD2[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_ShadingPower_CD1_GColorShadowXYXY ("CustomData_ShadingPower_CD1_[G]Color/Shadow[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_ShadingOffset_CD2_GColorOffsetXYXY ("CustomData_ShadingOffset_CD2_[G]ColorOffset[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        [HideInInspector] _CustomData_ShadingOffset_CD2_ShadowOffsetXYXY ("CustomData_ShadingOffset_CD2_ShadowOffset[X,Y][X,Y]", Vector) = (0, 0, 0, 0)
        _SoftParticleNearFade ("SoftParticleNearFade", Float) = 0
        [ASEEnd] _SoftParticleFarFade ("SoftParticleFarFade", Float) = 0
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _SrcBlend ("Src Blend", Float) = 5
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _DstBlend ("Dst Blend", Float) = 10
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _SrcBlendAlpha ("Src Blend Alpha", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _DstBlendAlpha ("Dst Blend Alpha", Float) = 10
        [Toggle(_ALPHAPREMULTIPLY_ON)] [HideInInspector] _AlphaPremultiplyOn ("Alpha Premultiply On", Float) = 0
        [Enum(Off,0, On,1)] [HideInInspector] _ZWrite ("Z Write", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] [HideInInspector] _ZTest ("Z Test", Float) = 4
        [Enum(UnityEngine.Rendering.CullMode)] [HideInInspector] _Cull ("Cull", Float) = 2
        [HideInInspector] _ZOffsetFactor ("Z Offset Factor", Range(-1, 1)) = 0
        [HideInInspector] _ZOffsetUnits ("Z Offset Units", Range(-1, 1)) = 0
    }
    SubShader
    {
        Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
        Pass
        {
            Name "Forward"
            Tags { "LIGHTMODE" = "UniversalForward" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
            Blend [_SrcBlend] [_DstBlend], [_SrcBlendAlpha] [_DstBlendAlpha]
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest [_ZTest]
            ZWrite [_ZWrite]
            Cull [_Cull]
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
            #pragma multi_compile_local _VERTEX_ALPHA_COLOR_OFF
            #pragma multi_compile_local _VERTEX_ALPHA_USE_OFF
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_Explosion_Smoke_Blur_Sp_1a/00_Forward.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
