Shader "BA/Reconstructed/MXPostProcess/MXGlitch"
{
    Properties
    {
    }
    SubShader
    {
        LOD 100
        Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
        Pass
        {
            Name "MXGlitch"
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
            #pragma multi_compile_local __ _MX_POST_GLITCH_CHROMATIC_ABERRATION
            #pragma multi_compile_local __ _MX_POST_GLITCH_VERTICAL
            #pragma multi_compile __ _USE_DRAW_PROCEDURAL
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/mxglitchps/00_MXGlitch.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
