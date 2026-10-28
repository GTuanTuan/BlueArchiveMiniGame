Shader "BA/Reconstructed/DSFX/FX_SHADER_AlphaBlend_0"
{
    Properties
    {
        [HDR] _Color ("Color", Color) = (1, 1, 1, 1)
        _Multiply ("Multiply", Float) = 1
        _Texture ("Texture", 2D) = "white" {}
        [Toggle] _RGBRGBA ("RGB>RGBA", Float) = 1
        [Toggle] _Main_Texture_No ("Main_Texture_No", Float) = 0
        [Toggle] _Custom_Data_Offset_Use ("Custom_Data_Offset_Use", Float) = 0
        [Toggle] _ZWrite_Mode ("ZWrite_Mode", Float) = 0
        [Enum(UnityEngine.Rendering.CullMode)] _Cull_Mode ("Cull_Mode", Float) = 2
        [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest_Mode ("ZTest_Mode", Float) = 4
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
            Tags { "LIGHTMODE" = "UniversalForward" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
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
            #pragma multi_compile_instancing
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_AlphaBlend_0/00_Forward.hlsl"
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
            #pragma multi_compile_instancing
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_AlphaBlend_0/01_ShadowCaster.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
