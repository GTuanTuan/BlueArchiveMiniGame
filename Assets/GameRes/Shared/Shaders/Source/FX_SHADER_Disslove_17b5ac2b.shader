Shader "BA/Reconstructed/FX_SHADER_Disslove"
{
    Properties
    {
        _Maintex ("Maintex", 2D) = "white" {}
        _Mask ("Mask", 2D) = "white" {}
        [HDR] _Maincolor ("Maincolor", Color) = (0.9433962, 0.06674972, 0.5951934, 0)
        [HideInInspector] _texcoord ("", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "PreviewType" = "Plane" "QUEUE" = "Geometry" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
        Pass
        {
            Name "Forward"
            Tags { "LIGHTMODE" = "UniversalForwardOnly" "PreviewType" = "Plane" "QUEUE" = "Geometry" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend One Zero, One Zero
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest LEqual
            ZWrite On
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
            #include "Includes/FX_SHADER_Disslove_17b5ac2b/00_00_Forward.hlsl"
            ENDHLSL
        }
        Pass
        {
            Name "ShadowCaster"
            Tags { "LIGHTMODE" = "SHADOWCASTER" "PreviewType" = "Plane" "QUEUE" = "Geometry" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend One Zero, One Zero
            BlendOp Add, Add
            ColorMask 0
            ZClip On
            ZTest LEqual
            ZWrite On
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
            #include "Includes/FX_SHADER_Disslove_17b5ac2b/00_01_ShadowCaster.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
