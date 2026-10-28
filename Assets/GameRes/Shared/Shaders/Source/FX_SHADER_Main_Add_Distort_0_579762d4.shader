Shader "BA/Reconstructed/DSFX/FX_SHADER_Main_Add_Distort_0"
{
    Properties
    {
        [HDR] _Main_Color ("Main_Color", Color) = (1, 1, 1, 1)
        _Main_Multiply ("Main_Multiply", Float) = 1
        _Tex_Main ("Tex_Main", 2D) = "white" {}
        [Toggle] _RGBRGBA ("RGB>RGBA", Float) = 0
        [Toggle] _Tex_Main_Distort_UseR_or_G ("Tex_Main_Distort_Use[R_or_G]", Float) = 0
        [Toggle] _Custom_Data_Main_OffsetUse ("Custom_Data_Main_OffsetUse", Float) = 0
        _Main_Speed_X ("Main_Speed_X", Float) = 0
        _Main_Speed_Y ("Main_Speed_Y", Float) = 0
        [HDR] _Add_Color ("Add_Color", Color) = (1, 1, 1, 1)
        _Tex_AddRGB ("Tex_Add[R,G,B]", 2D) = "white" {}
        _Add_Speed_X ("Add_Speed_X", Float) = 0
        _Add_Speed_Y ("Add_Speed_Y", Float) = 0
        [Toggle] _Add_Tex_useG ("Add_Tex_use[G]", Float) = 0
        [Toggle] _Add_Tex_useB ("Add_Tex_use[B]", Float) = 1
        _Add_Tex_SharpnessR_G ("Add_Tex_Sharpness[R_G]", Float) = 20
        _Add_Tex_StepR_G ("Add_Tex_Step[R_G]", Range(0, 1)) = 0
        _Main_Tex_StepB ("Main_Tex_Step[B]", Range(0, 1)) = 0
        [Toggle] _Custom_Data_Target_OffsetUse ("Custom_Data_Target_OffsetUse", Float) = 0
        [Toggle] _Tex_Add_Distort_UseR_or_G ("Tex_Add_Distort_Use[R_or_G]", Float) = 0
        _Tex_DistortRG ("Tex_Distort[R,G]", 2D) = "white" {}
        _R_Tilingxy_Offsetzw ("[R]_Tiling(x,y)_Offset(z,w)", Vector) = (1, 1, 0, 0)
        _RDistort_Speed_X ("[R]Distort_Speed_X", Float) = 0
        _RDistort_Speed_Y ("[R]Distort_Speed_Y", Float) = 0
        _RDistort_Power_X ("[R]Distort_Power_X", Float) = 0
        _RDistort_Power_Y ("[R]Distort_Power_Y", Float) = 0
        _G_Tilingxy_Offsetzw ("[G]_Tiling(x,y)_Offset(z,w)", Vector) = (1, 1, 0, 0)
        _GDistort_Speed_X ("[G]Distort_Speed_X", Float) = 0
        _GDistort_Speed_Y ("[G]Distort_Speed_Y", Float) = 0
        _GDistort_Power_X ("[G]Distort_Power_X", Float) = 0
        _GDistort_Power_Y ("[G]Distort_Power_Y", Float) = 0
        [Toggle] _Main_Tex_Alpha_use ("Main_Tex_Alpha_use", Float) = 0
        [Toggle] _Custom_Data_Add_Tex_Step_use ("Custom_Data_Add_Tex_Step_use", Float) = 0
        [ASEEnd] [Toggle] _Custom_Data_Main_Tex_Step_use ("Custom_Data_Main_Tex_Step_use", Float) = 0
        [HideInInspector] _texcoord ("", 2D) = "white" {}
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
            #pragma multi_compile_local __ _ALPHAPREMULTIPLY_ON
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_Main_Add_Distort_0_579762d4/00_00_Forward.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
