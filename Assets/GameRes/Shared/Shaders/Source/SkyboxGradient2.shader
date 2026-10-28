Shader "BA/Reconstructed/Skybox/MX Gradient 2"
{
    Properties
    {
        [HDR] _SkyColor ("Sky Color", Color) = (0.1022, 0.1682, 0.3185, 1)
        _SkyGradient ("Sky Gradient", Range(1, 128)) = 8
        [HDR] _EquatorColor ("Equator Color", Color) = (0.6239, 0.7835, 0.8069, 1)
        _EquatorOffset ("Equator Offset", Range(-1, 1)) = 0
    }
    SubShader
    {
        Tags { "PreviewType" = "Skybox" "QUEUE" = "Background" "RenderType" = "Background" }
        Pass
        {
            Tags { "PreviewType" = "Skybox" "QUEUE" = "Background" "RenderType" = "Background" }
            Blend One Zero, One Zero
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
            #include "Includes/SkyboxGradient2/00_.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
