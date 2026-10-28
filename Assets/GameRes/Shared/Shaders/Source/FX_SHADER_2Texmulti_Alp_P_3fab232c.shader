Shader "BA/Reconstructed/FX/FX_SHADER_2Texmulti_Alp_P"
{
    Properties
    {
        _FX_TEX_Ring3 ("FX_TEX_Ring3", 2D) = "white" {}
        _ShFX_Circle_Crisp ("ShFX_Circle_Crisp", 2D) = "white" {}
        [HDR] _Color0 ("Color 0", Color) = (0.6603774, 0.6603774, 0.6603774, 0)
        [HideInInspector] _texcoord ("", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
        Pass
        {
            Name "Forward"
            Tags { "LIGHTMODE" = "UniversalForwardOnly" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
            Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
            ZWrite Off
            Cull Back
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
            #include "Includes/FX_SHADER_2Texmulti_Alp_P_3fab232c/00_00_Forward.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
