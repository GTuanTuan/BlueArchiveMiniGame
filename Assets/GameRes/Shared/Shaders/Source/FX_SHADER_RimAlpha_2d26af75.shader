Shader "BA/Reconstructed/FX/FX_SHADER_RimAlpha"
{
    Properties
    {
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _SrcBlend ("Src Blend", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _DstBlend ("Dst Blend", Float) = 0
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _SrcBlendAlpha ("Src Blend Alpha", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] [HideInInspector] _DstBlendAlpha ("Dst Blend Alpha", Float) = 0
        [Enum(Off,0, On,1)] [HideInInspector] _ZWrite ("Z Write", Float) = 1
        [Enum(UnityEngine.Rendering.CompareFunction)] [HideInInspector] _ZTest ("ZTest", Float) = 4
        [Enum(UnityEngine.Rendering.CullMode)] [HideInInspector] _Cull ("Cull", Float) = 2
        [Header(Blend Mode Option)] [Space(5)] [Toggle(_IS_MULTIPLY)] _IsMultiply ("Is Multiply", Float) = 0
        [Toggle(_IS_PMA)] _IsPMA ("Is PMA", Float) = 0
        [Header(Main)] [Space(5)] [HDR] _Color ("Color", Color) = (1, 1, 1, 1)
        _MainTex ("Texture", 2D) = "white" {}
        _Multiply ("Multiply", Float) = 1
        [Header(Rim)] [Space(5)] [Toggle] _RimFlip ("Rim Flip", Float) = 0
        _RimStrength ("Rim Strength", Float) = 1
        _RimSharpness ("Rim Sharpness", Float) = 1
        [Header(Options)] [Space(5)] [Toggle] _RGBRGBA ("RGB > RGBA", Float) = 0
        [Toggle] _Custom_Data_MainMask_Offset_Use ("Custom_Data_Main/Mask_Offset_Use", Float) = 0
    }
    SubShader
    {
        Tags { "PreviewType" = "Sphere" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
        Pass
        {
            Tags { "PreviewType" = "Sphere" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
            Blend [_SrcBlend] [_DstBlend], [_SrcBlendAlpha] [_DstBlendAlpha]
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest [_ZTest]
            ZWrite [_ZWrite]
            Cull [_Cull]
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
            #pragma multi_compile __ FOG_EXP FOG_LINEAR
            #pragma multi_compile_local __ _IS_MULTIPLY _IS_PMA
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_RimAlpha_2d26af75/00_00_.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
