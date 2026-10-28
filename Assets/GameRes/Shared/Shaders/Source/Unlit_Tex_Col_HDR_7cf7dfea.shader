Shader "BA/Reconstructed/Unlit/TexColorHDR"
{
    Properties
    {
        [HDR] _Color ("Main Color", Color) = (1, 1, 1, 1)
        _MainTex ("Main Tex", 2D) = "white" {}
    }
    SubShader
    {
        LOD 100
        Tags { "RenderType" = "Opaque" }
        Pass
        {
            Tags { "RenderType" = "Opaque" }
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
            #pragma multi_compile __ FOG_EXP FOG_LINEAR
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/Unlit_Tex_Col_HDR_7cf7dfea/00_00_.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
