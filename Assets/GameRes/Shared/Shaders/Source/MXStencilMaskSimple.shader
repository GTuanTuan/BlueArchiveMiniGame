Shader "BA/Reconstructed/FX/Stencil/Mask Simple"
{
    Properties
    {
        [IntRange] _StencilIndex ("Stencil Index", Range(0, 255)) = 1
        [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Range(0, 2)) = 2
    }
    SubShader
    {
        Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
        Pass
        {
            Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
            Blend Zero One, Zero One
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest Off
            ZWrite Off
            Cull [_Cull]
            Conservative Off
            AlphaToMask Off
            Offset 0, 0
            Stencil
            {
                Ref [_StencilIndex]
                ReadMask 255
                WriteMask 255
                Comp GEqual
                Pass Replace
                Fail Keep
                ZFail Keep
            }
            Lighting Off
            HLSLPROGRAM
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXStencilMaskSimple/00_.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
