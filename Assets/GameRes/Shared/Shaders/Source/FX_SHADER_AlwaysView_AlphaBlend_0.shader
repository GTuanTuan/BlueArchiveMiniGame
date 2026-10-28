Shader "BA/Reconstructed/DSFX/FX_SHADER_AlwaysView_AlphaBlend_0"
{
    Properties
    {
        [HDR] _Color1 ("Color", Color) = (1, 1, 1, 1)
        _Multiply1 ("Multiply", Float) = 1
        _Texture1 ("Texture", 2D) = "white" {}
        [Toggle] _RGBRGBA1 ("RGB>RGBA", Float) = 1
        [Toggle] _Main_Texture_No1 ("Main_Texture_No", Float) = 0
        [Toggle] _Custom_Data_Offset_Use1 ("Custom_Data_Offset_Use", Float) = 1
        [Toggle] _ZWrite_Mode1 ("ZWrite_Mode", Float) = 0
        [Enum(UnityEngine.Rendering.CullMode)] _Cull_Mode1 ("Cull_Mode", Float) = 2
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
            ZTest Always
            ZWrite [_ZWrite_Mode1]
            Cull [_Cull_Mode1]
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
            #include "Includes/FX_SHADER_AlwaysView_AlphaBlend_0/00_Forward.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
