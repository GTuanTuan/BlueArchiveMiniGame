// Requires Editor/BAOriginalVariantGuard.cs and BAOriginalVariantCoverage.json.
Shader "BA/Reconstructed/DSFX/FX_SHADER_GrabPassDistortion"
{
    Properties
    {
        [MainTexture] _MainTex ("Distortion Texture", 2D) = "white" {}
        _DistPowSpeed ("DistPow(xy),Speed(zw)", Vector) = (0.08, 0.08, -0.02, -0.03)
        _MaskTex ("Mask Texture(R)", 2D) = "white" {}
        _MaskSpeedX ("Mask Speed X", Float) = -0.02
        _MaskSpeedY ("Mask Speed Y", Float) = -0.03
    }
    SubShader
    {
        Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
        Pass
        {
            Name "GrabPass"
            Tags { "LIGHTMODE" = "GRABPASS" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
            Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
            BlendOp Add, Add
            ColorMask RGBA
            ZClip On
            ZTest Always
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
            #pragma multi_compile __ _USECUSTOMDATA_ON
            #pragma multi_compile __ _USEMASKDIST_ON
            #pragma multi_compile _USEOUTSIDEMASK_FRESNEL _USEOUTSIDEMASK_NONE _USEOUTSIDEMASK_UV
            #pragma multi_compile __ _USESCREENUV_ON
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/FX_SHADER_GrabpassDistortion_e9fc9a7a/00_00_GrabPass.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
