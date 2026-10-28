Shader "BA/Reconstructed/DSFX/FX_SHADER_Hologram"
{
    Properties
    {
        _Main ("Main", 2D) = "white" {}
        [HDR] _Color0 ("Color 0", Color) = (1, 1, 1, 0)
        _Float0 ("Float 0", Float) = 0.2
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
            Cull Off
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
            #include "Includes/FX_SHADER_Hologram_d41c6929/00_00_Forward.hlsl"
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
            Cull Off
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
            #include "Includes/FX_SHADER_Hologram_d41c6929/00_01_ShadowCaster.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
