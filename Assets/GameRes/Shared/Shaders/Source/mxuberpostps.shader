Shader "BA/Reconstructed/MXPostProcess/MXUberPost"
{
    Properties
    {
    }
    SubShader
    {
        Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
        Pass
        {
            Name "MXUberPost"
            Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
            Blend One Zero, One Zero
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest Always
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
            #pragma multi_compile_local __ _CHROMATIC_ABERRATION_DIR
            #pragma multi_compile_local __ _USE_CHROMATIC_ABERRATION
            #pragma multi_compile __ _USE_DRAW_PROCEDURAL
            #pragma multi_compile_local __ _USE_INVERSE
            #pragma multi_compile_local __ _USE_THRESHOLD
            #pragma multi_compile_local __ _VIGNETTE_ADDTIVE _VIGNETTE_ALPHABLEND
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/mxuberpostps/00_MXUberPost.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
