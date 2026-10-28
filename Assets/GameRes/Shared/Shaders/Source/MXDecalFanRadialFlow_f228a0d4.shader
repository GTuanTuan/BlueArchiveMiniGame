Shader "BA/Reconstructed/Decal/Fan Radial Flow"
{
    Properties
    {
        [Header(add script. ScreenSpaceDecal)] [Space(10)] [HDR] _Tint ("Tint", Color) = (1, 1, 1, 1)
        [NoScaleOffset] _MainTex ("Main Tex (90˚ fan, A: flow mask)", 2D) = "white" {}
        [Space(10)] _FanAngle ("_FanAngle (rad)", Float) = 3.141592
        _FanBorderUVWeight ("Border UV Weight", Range(0, 0.2)) = 0
        [Space(10)] [NoScaleOffset] _FlowTex ("Flow Tex (vertical strip)", 2D) = "black" {}
        _FlowSpeed ("Flow Speed", Float) = 0.5
        [Header(Fade)] [Space(3)] _FadeStartHeight ("Fade Start Height", Range(0, 1)) = 0.3
        [HideInInspector] _invMatrixMVP0 ("_invMatrixMVP0", Vector) = (1, 0, 0, 0)
        [HideInInspector] _invMatrixMVP1 ("_invMatrixMVP1", Vector) = (0, 1, 0, 0)
        [HideInInspector] _invMatrixMVP2 ("_invMatrixMVP2", Vector) = (0, 0, 1, 0)
        [HideInInspector] _invMatrixMVP3 ("_invMatrixMVP3", Vector) = (0, 0, 0, 1)
    }
    SubShader
    {
        Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
        Pass
        {
            Name "ForwardLit"
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalForward" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
            Blend One One, One OneMinusSrcAlpha
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
            #pragma multi_compile __ FOG_EXP FOG_LINEAR
            #pragma multi_compile_instancing
            #pragma target 4.5
            #pragma vertex BA_Vert
            #pragma fragment BA_Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Includes/MXDecalFanRadialFlow_f228a0d4/00_00_ForwardLit.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
