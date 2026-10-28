// Exact names and types from the original compiled parameter metadata.
float _Alphaclip_Value;
float4 _Color;
float4 _CustomData_DistortOffsetG_CD1XYXY;
float4 _CustomData_DistortOffsetG_CD2XYXY;
float4 _CustomData_DistortOffsetR_CD1XYXY;
float4 _CustomData_DistortOffsetR_CD2XYXY;
float4 _CustomData_DistortPowerG_CD2XYXY;
float4 _CustomData_DistortPowerR_CD2XYXY;
float4 _CustomData_DistortTilingG_CD1XYXY;
float4 _CustomData_DistortTilingG_CD2XYXY;
float4 _CustomData_DistortTilingR_CD1XYXY;
float4 _CustomData_DistortTilingR_CD2XYXY;
float4 _CustomData_MainOffset_CD1XYXY;
float4 _CustomData_MainOffset_CD2XYXY;
float4 _CustomData_MainTiling_CD1XYXY;
float4 _CustomData_MainTiling_CD2XYXY;
float4 _CustomData_MaskOffset_CD1XYXY;
float4 _CustomData_MaskOffset_CD2XYXY;
float4 _CustomData_MaskTiling_CD1XYXY;
float4 _CustomData_MaskTiling_CD2XYXY;
float _GDistort_Power_X;
float _GDistort_Power_Y;
float _GDistort_Speed_X;
float _GDistort_Speed_Y;
float4 _GTilingxyOffsetzw;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mask_Speed_X;
float _Mask_Speed_Y;
float _Multiply;
float _RDistort_Power_X;
float _RDistort_Power_Y;
float _RDistort_Speed_X;
float _RDistort_Speed_Y;
float4 _RTilingxyOffsetzw;
float _SoftParticleFarFade;
float _SoftParticleNearFade;
float4 _Tex_DistortRG_ST;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
Texture2D<float4> _CameraDepthTexture;
Texture2D<float4> _Tex_DistortRG;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
SamplerState sampler_CameraDepthTexture;
SamplerState sampler_Tex_DistortRG;
SamplerState sampler_Tex_Main;
SamplerState sampler_Tex_Mask;
#ifndef cmp
#define cmp -
#endif

#if !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_1_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 21u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_1_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_1_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6,
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_1_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_1_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_1_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_1_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_1_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r2.xyzw = BA_Vertex_1_CB2((uint)(21)).xyzw * v5.xyzw;
  r3.xyzw = BA_Vertex_1_CB2((uint)(17)).xyzw * v4.xyzw;
  r4.xy = BA_Vertex_1_CB2((uint)(18)).zw * v5.zw;
  r5.xyzw = v3.xyxy * BA_Vertex_1_CB2((uint)(19)).xyxy + BA_Vertex_1_CB2((uint)(19)).zwzw;
  r2.xy = r2.xy * r5.xy + r4.xy;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_1_CB2((uint)(22)).zw + r2.xy;
  r2.xy = r2.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_1_CB2((uint)(18)).xy + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  o2.zw = v4.xy * BA_Vertex_1_CB2((uint)(22)).xy + r2.xy;
  o2.xy = v3.xy;
  o3.xyzw = v4.xyzw;
  r2.xy = BA_Vertex_1_CB2((uint)(15)).zw * v5.zw;
  r3.xyzw = BA_Vertex_1_CB2((uint)(13)).xyzw * v5.xyzw;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r4.xyzw = BA_Vertex_1_CB2((uint)(12)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_1_CB2((uint)(11)).zw + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_1_CB2((uint)(15)).xy + r2.xy;
  r2.xy = r4.zw * r5.zw + r2.xy;
  o4.xy = v4.xy * BA_Vertex_1_CB2((uint)(11)).xy + r2.xy;
  r2.xyzw = BA_Vertex_1_CB2((uint)(9)).xyzw * v5.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_1_CB2((uint)(20)).xyxy + BA_Vertex_1_CB2((uint)(20)).zwzw;
  r2.xyzw = r3.xyzw * r2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r4.xyzw = BA_Vertex_1_CB2((uint)(8)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r3.xy + r2.xy;
  r2.xy = r4.zw * r3.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_1_CB2((uint)(7)).xy + r2.xy;
  r2.xy = v5.zw * BA_Vertex_1_CB2((uint)(7)).zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_1_CB2((uint)(6)).xy + r2.xy;
  o4.zw = v4.zw * BA_Vertex_1_CB2((uint)(6)).zw + r2.xy;
  r0.y = BA_Vertex_1_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_1_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_1_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_1_CB0((uint)(64)).z + r0.x;
  o5.z = -r0.x;
  r0.xyzw = BA_Vertex_1_CB2((uint)(5)).xyzw * v5.xyzw;
  r2.xyzw = v3.xyxy * BA_Vertex_1_CB2((uint)(4)).xyxy + BA_Vertex_1_CB2((uint)(4)).zwzw;
  r0.xyzw = r2.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r3.xyzw = BA_Vertex_1_CB2((uint)(3)).xyzw * v4.xyzw;
  r0.xy = r3.xy * r2.xy + r0.xy;
  r0.xy = r3.zw * r2.zw + r0.xy;
  r0.xy = v5.xy * BA_Vertex_1_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v5.zw * BA_Vertex_1_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_1_CB2((uint)(1)).xy + r0.xy;
  o5.xy = v4.zw * BA_Vertex_1_CB2((uint)(1)).zw + r0.xy;
  o5.w = 0;
  r0.x = BA_Vertex_1_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o6.zw = r1.zw;
  o6.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_2_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 21u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_2_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_2_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6,
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_2_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_2_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r2.xyzw = BA_Vertex_2_CB2((uint)(21)).xyzw * v5.xyzw;
  r3.xyzw = BA_Vertex_2_CB2((uint)(17)).xyzw * v4.xyzw;
  r4.xy = BA_Vertex_2_CB2((uint)(18)).zw * v5.zw;
  r5.xyzw = v3.xyxy * BA_Vertex_2_CB2((uint)(19)).xyxy + BA_Vertex_2_CB2((uint)(19)).zwzw;
  r2.xy = r2.xy * r5.xy + r4.xy;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_2_CB2((uint)(22)).zw + r2.xy;
  r2.xy = r2.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_2_CB2((uint)(18)).xy + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  o2.zw = v4.xy * BA_Vertex_2_CB2((uint)(22)).xy + r2.xy;
  o2.xy = v3.xy;
  o3.xyzw = v4.xyzw;
  r2.xy = BA_Vertex_2_CB2((uint)(15)).zw * v5.zw;
  r3.xyzw = BA_Vertex_2_CB2((uint)(13)).xyzw * v5.xyzw;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r4.xyzw = BA_Vertex_2_CB2((uint)(12)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_2_CB2((uint)(11)).zw + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_2_CB2((uint)(15)).xy + r2.xy;
  r2.xy = r4.zw * r5.zw + r2.xy;
  o4.xy = v4.xy * BA_Vertex_2_CB2((uint)(11)).xy + r2.xy;
  r2.xyzw = BA_Vertex_2_CB2((uint)(9)).xyzw * v5.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_2_CB2((uint)(20)).xyxy + BA_Vertex_2_CB2((uint)(20)).zwzw;
  r2.xyzw = r3.xyzw * r2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r4.xyzw = BA_Vertex_2_CB2((uint)(8)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r3.xy + r2.xy;
  r2.xy = r4.zw * r3.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_2_CB2((uint)(7)).xy + r2.xy;
  r2.xy = v5.zw * BA_Vertex_2_CB2((uint)(7)).zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_2_CB2((uint)(6)).xy + r2.xy;
  o4.zw = v4.zw * BA_Vertex_2_CB2((uint)(6)).zw + r2.xy;
  r0.y = BA_Vertex_2_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_2_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_2_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_2_CB0((uint)(64)).z + r0.x;
  o5.z = -r0.x;
  r0.xyzw = BA_Vertex_2_CB2((uint)(5)).xyzw * v5.xyzw;
  r2.xyzw = v3.xyxy * BA_Vertex_2_CB2((uint)(4)).xyxy + BA_Vertex_2_CB2((uint)(4)).zwzw;
  r0.xyzw = r2.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r3.xyzw = BA_Vertex_2_CB2((uint)(3)).xyzw * v4.xyzw;
  r0.xy = r3.xy * r2.xy + r0.xy;
  r0.xy = r3.zw * r2.zw + r0.xy;
  r0.xy = v5.xy * BA_Vertex_2_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v5.zw * BA_Vertex_2_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_2_CB2((uint)(1)).xy + r0.xy;
  o5.xy = v4.zw * BA_Vertex_2_CB2((uint)(1)).zw + r0.xy;
  o5.w = 0;
  r0.x = BA_Vertex_2_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o6.zw = r1.zw;
  o6.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_3_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 21u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_3_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_3_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6,
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_3_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_3_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r2.xyzw = BA_Vertex_3_CB2((uint)(21)).xyzw * v5.xyzw;
  r3.xyzw = BA_Vertex_3_CB2((uint)(17)).xyzw * v4.xyzw;
  r4.xy = BA_Vertex_3_CB2((uint)(18)).zw * v5.zw;
  r5.xyzw = v3.xyxy * BA_Vertex_3_CB2((uint)(19)).xyxy + BA_Vertex_3_CB2((uint)(19)).zwzw;
  r2.xy = r2.xy * r5.xy + r4.xy;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_3_CB2((uint)(22)).zw + r2.xy;
  r2.xy = r2.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_3_CB2((uint)(18)).xy + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  o2.zw = v4.xy * BA_Vertex_3_CB2((uint)(22)).xy + r2.xy;
  o2.xy = v3.xy;
  o3.xyzw = v4.xyzw;
  r2.xy = BA_Vertex_3_CB2((uint)(15)).zw * v5.zw;
  r3.xyzw = BA_Vertex_3_CB2((uint)(13)).xyzw * v5.xyzw;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r4.xyzw = BA_Vertex_3_CB2((uint)(12)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_3_CB2((uint)(11)).zw + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_3_CB2((uint)(15)).xy + r2.xy;
  r2.xy = r4.zw * r5.zw + r2.xy;
  o4.xy = v4.xy * BA_Vertex_3_CB2((uint)(11)).xy + r2.xy;
  r2.xyzw = BA_Vertex_3_CB2((uint)(9)).xyzw * v5.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_3_CB2((uint)(20)).xyxy + BA_Vertex_3_CB2((uint)(20)).zwzw;
  r2.xyzw = r3.xyzw * r2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r4.xyzw = BA_Vertex_3_CB2((uint)(8)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r3.xy + r2.xy;
  r2.xy = r4.zw * r3.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_3_CB2((uint)(7)).xy + r2.xy;
  r2.xy = v5.zw * BA_Vertex_3_CB2((uint)(7)).zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_3_CB2((uint)(6)).xy + r2.xy;
  o4.zw = v4.zw * BA_Vertex_3_CB2((uint)(6)).zw + r2.xy;
  r0.y = BA_Vertex_3_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_3_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_3_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_3_CB0((uint)(64)).z + r0.x;
  o5.z = -r0.x;
  r0.xyzw = BA_Vertex_3_CB2((uint)(5)).xyzw * v5.xyzw;
  r2.xyzw = v3.xyxy * BA_Vertex_3_CB2((uint)(4)).xyxy + BA_Vertex_3_CB2((uint)(4)).zwzw;
  r0.xyzw = r2.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r3.xyzw = BA_Vertex_3_CB2((uint)(3)).xyzw * v4.xyzw;
  r0.xy = r3.xy * r2.xy + r0.xy;
  r0.xy = r3.zw * r2.zw + r0.xy;
  r0.xy = v5.xy * BA_Vertex_3_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v5.zw * BA_Vertex_3_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_3_CB2((uint)(1)).xy + r0.xy;
  o5.xy = v4.zw * BA_Vertex_3_CB2((uint)(1)).zw + r0.xy;
  o5.w = 0;
  r0.x = BA_Vertex_3_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o6.zw = r1.zw;
  o6.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_4_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 21u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_4_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_4_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6,
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_4_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_4_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r2.xyzw = BA_Vertex_4_CB2((uint)(21)).xyzw * v5.xyzw;
  r3.xyzw = BA_Vertex_4_CB2((uint)(17)).xyzw * v4.xyzw;
  r4.xy = BA_Vertex_4_CB2((uint)(18)).zw * v5.zw;
  r5.xyzw = v3.xyxy * BA_Vertex_4_CB2((uint)(19)).xyxy + BA_Vertex_4_CB2((uint)(19)).zwzw;
  r2.xy = r2.xy * r5.xy + r4.xy;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_4_CB2((uint)(22)).zw + r2.xy;
  r2.xy = r2.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_4_CB2((uint)(18)).xy + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  o2.zw = v4.xy * BA_Vertex_4_CB2((uint)(22)).xy + r2.xy;
  o2.xy = v3.xy;
  o3.xyzw = v4.xyzw;
  r2.xy = BA_Vertex_4_CB2((uint)(15)).zw * v5.zw;
  r3.xyzw = BA_Vertex_4_CB2((uint)(13)).xyzw * v5.xyzw;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r4.xyzw = BA_Vertex_4_CB2((uint)(12)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_4_CB2((uint)(11)).zw + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_4_CB2((uint)(15)).xy + r2.xy;
  r2.xy = r4.zw * r5.zw + r2.xy;
  o4.xy = v4.xy * BA_Vertex_4_CB2((uint)(11)).xy + r2.xy;
  r2.xyzw = BA_Vertex_4_CB2((uint)(9)).xyzw * v5.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_4_CB2((uint)(20)).xyxy + BA_Vertex_4_CB2((uint)(20)).zwzw;
  r2.xyzw = r3.xyzw * r2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r4.xyzw = BA_Vertex_4_CB2((uint)(8)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r3.xy + r2.xy;
  r2.xy = r4.zw * r3.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_4_CB2((uint)(7)).xy + r2.xy;
  r2.xy = v5.zw * BA_Vertex_4_CB2((uint)(7)).zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_4_CB2((uint)(6)).xy + r2.xy;
  o4.zw = v4.zw * BA_Vertex_4_CB2((uint)(6)).zw + r2.xy;
  r0.y = BA_Vertex_4_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_4_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_4_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_4_CB0((uint)(64)).z + r0.x;
  o5.z = -r0.x;
  r0.xyzw = BA_Vertex_4_CB2((uint)(5)).xyzw * v5.xyzw;
  r2.xyzw = v3.xyxy * BA_Vertex_4_CB2((uint)(4)).xyxy + BA_Vertex_4_CB2((uint)(4)).zwzw;
  r0.xyzw = r2.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r3.xyzw = BA_Vertex_4_CB2((uint)(3)).xyzw * v4.xyzw;
  r0.xy = r3.xy * r2.xy + r0.xy;
  r0.xy = r3.zw * r2.zw + r0.xy;
  r0.xy = v5.xy * BA_Vertex_4_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v5.zw * BA_Vertex_4_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_4_CB2((uint)(1)).xy + r0.xy;
  o5.xy = v4.zw * BA_Vertex_4_CB2((uint)(1)).zw + r0.xy;
  o5.w = 0;
  r0.x = BA_Vertex_4_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o6.zw = r1.zw;
  o6.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_5_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 21u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_5_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_5_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6,
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_5_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_5_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_5_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_5_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r2.xyzw = BA_Vertex_5_CB2((uint)(21)).xyzw * v5.xyzw;
  r3.xyzw = BA_Vertex_5_CB2((uint)(17)).xyzw * v4.xyzw;
  r4.xy = BA_Vertex_5_CB2((uint)(18)).zw * v5.zw;
  r5.xyzw = v3.xyxy * BA_Vertex_5_CB2((uint)(19)).xyxy + BA_Vertex_5_CB2((uint)(19)).zwzw;
  r2.xy = r2.xy * r5.xy + r4.xy;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_5_CB2((uint)(22)).zw + r2.xy;
  r2.xy = r2.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_5_CB2((uint)(18)).xy + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  o2.zw = v4.xy * BA_Vertex_5_CB2((uint)(22)).xy + r2.xy;
  o2.xy = v3.xy;
  o3.xyzw = v4.xyzw;
  r2.xy = BA_Vertex_5_CB2((uint)(15)).zw * v5.zw;
  r3.xyzw = BA_Vertex_5_CB2((uint)(13)).xyzw * v5.xyzw;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r4.xyzw = BA_Vertex_5_CB2((uint)(12)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_5_CB2((uint)(11)).zw + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_5_CB2((uint)(15)).xy + r2.xy;
  r2.xy = r4.zw * r5.zw + r2.xy;
  o4.xy = v4.xy * BA_Vertex_5_CB2((uint)(11)).xy + r2.xy;
  r2.xyzw = BA_Vertex_5_CB2((uint)(9)).xyzw * v5.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_5_CB2((uint)(20)).xyxy + BA_Vertex_5_CB2((uint)(20)).zwzw;
  r2.xyzw = r3.xyzw * r2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r4.xyzw = BA_Vertex_5_CB2((uint)(8)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r3.xy + r2.xy;
  r2.xy = r4.zw * r3.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_5_CB2((uint)(7)).xy + r2.xy;
  r2.xy = v5.zw * BA_Vertex_5_CB2((uint)(7)).zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_5_CB2((uint)(6)).xy + r2.xy;
  o4.zw = v4.zw * BA_Vertex_5_CB2((uint)(6)).zw + r2.xy;
  r0.y = BA_Vertex_5_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_5_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_5_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_5_CB0((uint)(64)).z + r0.x;
  o5.z = -r0.x;
  r0.xyzw = BA_Vertex_5_CB2((uint)(5)).xyzw * v5.xyzw;
  r2.xyzw = v3.xyxy * BA_Vertex_5_CB2((uint)(4)).xyxy + BA_Vertex_5_CB2((uint)(4)).zwzw;
  r0.xyzw = r2.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r3.xyzw = BA_Vertex_5_CB2((uint)(3)).xyzw * v4.xyzw;
  r0.xy = r3.xy * r2.xy + r0.xy;
  r0.xy = r3.zw * r2.zw + r0.xy;
  r0.xy = v5.xy * BA_Vertex_5_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v5.zw * BA_Vertex_5_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_5_CB2((uint)(1)).xy + r0.xy;
  o5.xy = v4.zw * BA_Vertex_5_CB2((uint)(1)).zw + r0.xy;
  o5.w = 0;
  r0.x = BA_Vertex_5_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o6.zw = r1.zw;
  o6.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_6_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 21u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_6_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_6_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6,
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_6_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_6_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_6_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_6_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_6_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r2.xyzw = BA_Vertex_6_CB2((uint)(21)).xyzw * v5.xyzw;
  r3.xyzw = BA_Vertex_6_CB2((uint)(17)).xyzw * v4.xyzw;
  r4.xy = BA_Vertex_6_CB2((uint)(18)).zw * v5.zw;
  r5.xyzw = v3.xyxy * BA_Vertex_6_CB2((uint)(19)).xyxy + BA_Vertex_6_CB2((uint)(19)).zwzw;
  r2.xy = r2.xy * r5.xy + r4.xy;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_6_CB2((uint)(22)).zw + r2.xy;
  r2.xy = r2.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_6_CB2((uint)(18)).xy + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  o2.zw = v4.xy * BA_Vertex_6_CB2((uint)(22)).xy + r2.xy;
  o2.xy = v3.xy;
  o3.xyzw = v4.xyzw;
  r2.xy = BA_Vertex_6_CB2((uint)(15)).zw * v5.zw;
  r3.xyzw = BA_Vertex_6_CB2((uint)(13)).xyzw * v5.xyzw;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r4.xyzw = BA_Vertex_6_CB2((uint)(12)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_6_CB2((uint)(11)).zw + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_6_CB2((uint)(15)).xy + r2.xy;
  r2.xy = r4.zw * r5.zw + r2.xy;
  o4.xy = v4.xy * BA_Vertex_6_CB2((uint)(11)).xy + r2.xy;
  r2.xyzw = BA_Vertex_6_CB2((uint)(9)).xyzw * v5.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_6_CB2((uint)(20)).xyxy + BA_Vertex_6_CB2((uint)(20)).zwzw;
  r2.xyzw = r3.xyzw * r2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r4.xyzw = BA_Vertex_6_CB2((uint)(8)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r3.xy + r2.xy;
  r2.xy = r4.zw * r3.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_6_CB2((uint)(7)).xy + r2.xy;
  r2.xy = v5.zw * BA_Vertex_6_CB2((uint)(7)).zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_6_CB2((uint)(6)).xy + r2.xy;
  o4.zw = v4.zw * BA_Vertex_6_CB2((uint)(6)).zw + r2.xy;
  r0.y = BA_Vertex_6_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_6_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_6_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_6_CB0((uint)(64)).z + r0.x;
  o5.z = -r0.x;
  r0.xyzw = BA_Vertex_6_CB2((uint)(5)).xyzw * v5.xyzw;
  r2.xyzw = v3.xyxy * BA_Vertex_6_CB2((uint)(4)).xyxy + BA_Vertex_6_CB2((uint)(4)).zwzw;
  r0.xyzw = r2.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r3.xyzw = BA_Vertex_6_CB2((uint)(3)).xyzw * v4.xyzw;
  r0.xy = r3.xy * r2.xy + r0.xy;
  r0.xy = r3.zw * r2.zw + r0.xy;
  r0.xy = v5.xy * BA_Vertex_6_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v5.zw * BA_Vertex_6_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_6_CB2((uint)(1)).xy + r0.xy;
  o5.xy = v4.zw * BA_Vertex_6_CB2((uint)(1)).zw + r0.xy;
  o5.w = 0;
  r0.x = BA_Vertex_6_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o6.zw = r1.zw;
  o6.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_7_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 21u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_7_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_7_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6,
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_7_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_7_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_7_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_7_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_7_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r2.xyzw = BA_Vertex_7_CB2((uint)(21)).xyzw * v5.xyzw;
  r3.xyzw = BA_Vertex_7_CB2((uint)(17)).xyzw * v4.xyzw;
  r4.xy = BA_Vertex_7_CB2((uint)(18)).zw * v5.zw;
  r5.xyzw = v3.xyxy * BA_Vertex_7_CB2((uint)(19)).xyxy + BA_Vertex_7_CB2((uint)(19)).zwzw;
  r2.xy = r2.xy * r5.xy + r4.xy;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_7_CB2((uint)(22)).zw + r2.xy;
  r2.xy = r2.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_7_CB2((uint)(18)).xy + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  o2.zw = v4.xy * BA_Vertex_7_CB2((uint)(22)).xy + r2.xy;
  o2.xy = v3.xy;
  o3.xyzw = v4.xyzw;
  r2.xy = BA_Vertex_7_CB2((uint)(15)).zw * v5.zw;
  r3.xyzw = BA_Vertex_7_CB2((uint)(13)).xyzw * v5.xyzw;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r4.xyzw = BA_Vertex_7_CB2((uint)(12)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_7_CB2((uint)(11)).zw + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_7_CB2((uint)(15)).xy + r2.xy;
  r2.xy = r4.zw * r5.zw + r2.xy;
  o4.xy = v4.xy * BA_Vertex_7_CB2((uint)(11)).xy + r2.xy;
  r2.xyzw = BA_Vertex_7_CB2((uint)(9)).xyzw * v5.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_7_CB2((uint)(20)).xyxy + BA_Vertex_7_CB2((uint)(20)).zwzw;
  r2.xyzw = r3.xyzw * r2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r4.xyzw = BA_Vertex_7_CB2((uint)(8)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r3.xy + r2.xy;
  r2.xy = r4.zw * r3.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_7_CB2((uint)(7)).xy + r2.xy;
  r2.xy = v5.zw * BA_Vertex_7_CB2((uint)(7)).zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_7_CB2((uint)(6)).xy + r2.xy;
  o4.zw = v4.zw * BA_Vertex_7_CB2((uint)(6)).zw + r2.xy;
  r0.y = BA_Vertex_7_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_7_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_7_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_7_CB0((uint)(64)).z + r0.x;
  o5.z = -r0.x;
  r0.xyzw = BA_Vertex_7_CB2((uint)(5)).xyzw * v5.xyzw;
  r2.xyzw = v3.xyxy * BA_Vertex_7_CB2((uint)(4)).xyxy + BA_Vertex_7_CB2((uint)(4)).zwzw;
  r0.xyzw = r2.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r3.xyzw = BA_Vertex_7_CB2((uint)(3)).xyzw * v4.xyzw;
  r0.xy = r3.xy * r2.xy + r0.xy;
  r0.xy = r3.zw * r2.zw + r0.xy;
  r0.xy = v5.xy * BA_Vertex_7_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v5.zw * BA_Vertex_7_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_7_CB2((uint)(1)).xy + r0.xy;
  o5.xy = v4.zw * BA_Vertex_7_CB2((uint)(1)).zw + r0.xy;
  o5.w = 0;
  r0.x = BA_Vertex_7_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o6.zw = r1.zw;
  o6.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_8_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 21u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_8_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_8_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6,
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_8_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_8_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_8_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_8_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_8_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r2.xyzw = BA_Vertex_8_CB2((uint)(21)).xyzw * v5.xyzw;
  r3.xyzw = BA_Vertex_8_CB2((uint)(17)).xyzw * v4.xyzw;
  r4.xy = BA_Vertex_8_CB2((uint)(18)).zw * v5.zw;
  r5.xyzw = v3.xyxy * BA_Vertex_8_CB2((uint)(19)).xyxy + BA_Vertex_8_CB2((uint)(19)).zwzw;
  r2.xy = r2.xy * r5.xy + r4.xy;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_8_CB2((uint)(22)).zw + r2.xy;
  r2.xy = r2.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_8_CB2((uint)(18)).xy + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  o2.zw = v4.xy * BA_Vertex_8_CB2((uint)(22)).xy + r2.xy;
  o2.xy = v3.xy;
  o3.xyzw = v4.xyzw;
  r2.xy = BA_Vertex_8_CB2((uint)(15)).zw * v5.zw;
  r3.xyzw = BA_Vertex_8_CB2((uint)(13)).xyzw * v5.xyzw;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r4.xyzw = BA_Vertex_8_CB2((uint)(12)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_8_CB2((uint)(11)).zw + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_8_CB2((uint)(15)).xy + r2.xy;
  r2.xy = r4.zw * r5.zw + r2.xy;
  o4.xy = v4.xy * BA_Vertex_8_CB2((uint)(11)).xy + r2.xy;
  r2.xyzw = BA_Vertex_8_CB2((uint)(9)).xyzw * v5.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_8_CB2((uint)(20)).xyxy + BA_Vertex_8_CB2((uint)(20)).zwzw;
  r2.xyzw = r3.xyzw * r2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r4.xyzw = BA_Vertex_8_CB2((uint)(8)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r3.xy + r2.xy;
  r2.xy = r4.zw * r3.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_8_CB2((uint)(7)).xy + r2.xy;
  r2.xy = v5.zw * BA_Vertex_8_CB2((uint)(7)).zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_8_CB2((uint)(6)).xy + r2.xy;
  o4.zw = v4.zw * BA_Vertex_8_CB2((uint)(6)).zw + r2.xy;
  r0.y = BA_Vertex_8_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_8_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_8_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_8_CB0((uint)(64)).z + r0.x;
  o5.z = -r0.x;
  r0.xyzw = BA_Vertex_8_CB2((uint)(5)).xyzw * v5.xyzw;
  r2.xyzw = v3.xyxy * BA_Vertex_8_CB2((uint)(4)).xyxy + BA_Vertex_8_CB2((uint)(4)).zwzw;
  r0.xyzw = r2.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r3.xyzw = BA_Vertex_8_CB2((uint)(3)).xyzw * v4.xyzw;
  r0.xy = r3.xy * r2.xy + r0.xy;
  r0.xy = r3.zw * r2.zw + r0.xy;
  r0.xy = v5.xy * BA_Vertex_8_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v5.zw * BA_Vertex_8_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_8_CB2((uint)(1)).xy + r0.xy;
  o5.xy = v4.zw * BA_Vertex_8_CB2((uint)(1)).zw + r0.xy;
  o5.w = 0;
  r0.x = BA_Vertex_8_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o6.zw = r1.zw;
  o6.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_9_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 21u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_9_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_9_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6,
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_9_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_9_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_9_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_9_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_9_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r2.xyzw = BA_Vertex_9_CB2((uint)(21)).xyzw * v5.xyzw;
  r3.xyzw = BA_Vertex_9_CB2((uint)(17)).xyzw * v4.xyzw;
  r4.xy = BA_Vertex_9_CB2((uint)(18)).zw * v5.zw;
  r5.xyzw = v3.xyxy * BA_Vertex_9_CB2((uint)(19)).xyxy + BA_Vertex_9_CB2((uint)(19)).zwzw;
  r2.xy = r2.xy * r5.xy + r4.xy;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_9_CB2((uint)(22)).zw + r2.xy;
  r2.xy = r2.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_9_CB2((uint)(18)).xy + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  o2.zw = v4.xy * BA_Vertex_9_CB2((uint)(22)).xy + r2.xy;
  o2.xy = v3.xy;
  o3.xyzw = v4.xyzw;
  r2.xy = BA_Vertex_9_CB2((uint)(15)).zw * v5.zw;
  r3.xyzw = BA_Vertex_9_CB2((uint)(13)).xyzw * v5.xyzw;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r4.xyzw = BA_Vertex_9_CB2((uint)(12)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_9_CB2((uint)(11)).zw + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_9_CB2((uint)(15)).xy + r2.xy;
  r2.xy = r4.zw * r5.zw + r2.xy;
  o4.xy = v4.xy * BA_Vertex_9_CB2((uint)(11)).xy + r2.xy;
  r2.xyzw = BA_Vertex_9_CB2((uint)(9)).xyzw * v5.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_9_CB2((uint)(20)).xyxy + BA_Vertex_9_CB2((uint)(20)).zwzw;
  r2.xyzw = r3.xyzw * r2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r4.xyzw = BA_Vertex_9_CB2((uint)(8)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r3.xy + r2.xy;
  r2.xy = r4.zw * r3.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_9_CB2((uint)(7)).xy + r2.xy;
  r2.xy = v5.zw * BA_Vertex_9_CB2((uint)(7)).zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_9_CB2((uint)(6)).xy + r2.xy;
  o4.zw = v4.zw * BA_Vertex_9_CB2((uint)(6)).zw + r2.xy;
  r0.y = BA_Vertex_9_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_9_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_9_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_9_CB0((uint)(64)).z + r0.x;
  o5.z = -r0.x;
  r0.xyzw = BA_Vertex_9_CB2((uint)(5)).xyzw * v5.xyzw;
  r2.xyzw = v3.xyxy * BA_Vertex_9_CB2((uint)(4)).xyxy + BA_Vertex_9_CB2((uint)(4)).zwzw;
  r0.xyzw = r2.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r3.xyzw = BA_Vertex_9_CB2((uint)(3)).xyzw * v4.xyzw;
  r0.xy = r3.xy * r2.xy + r0.xy;
  r0.xy = r3.zw * r2.zw + r0.xy;
  r0.xy = v5.xy * BA_Vertex_9_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v5.zw * BA_Vertex_9_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_9_CB2((uint)(1)).xy + r0.xy;
  o5.xy = v4.zw * BA_Vertex_9_CB2((uint)(1)).zw + r0.xy;
  o5.w = 0;
  r0.x = BA_Vertex_9_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o6.zw = r1.zw;
  o6.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_10_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 21u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_10_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_10_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6,
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_10_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_10_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_10_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_10_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_10_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r2.xyzw = BA_Vertex_10_CB2((uint)(21)).xyzw * v5.xyzw;
  r3.xyzw = BA_Vertex_10_CB2((uint)(17)).xyzw * v4.xyzw;
  r4.xy = BA_Vertex_10_CB2((uint)(18)).zw * v5.zw;
  r5.xyzw = v3.xyxy * BA_Vertex_10_CB2((uint)(19)).xyxy + BA_Vertex_10_CB2((uint)(19)).zwzw;
  r2.xy = r2.xy * r5.xy + r4.xy;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_10_CB2((uint)(22)).zw + r2.xy;
  r2.xy = r2.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_10_CB2((uint)(18)).xy + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  o2.zw = v4.xy * BA_Vertex_10_CB2((uint)(22)).xy + r2.xy;
  o2.xy = v3.xy;
  o3.xyzw = v4.xyzw;
  r2.xy = BA_Vertex_10_CB2((uint)(15)).zw * v5.zw;
  r3.xyzw = BA_Vertex_10_CB2((uint)(13)).xyzw * v5.xyzw;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r4.xyzw = BA_Vertex_10_CB2((uint)(12)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_10_CB2((uint)(11)).zw + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_10_CB2((uint)(15)).xy + r2.xy;
  r2.xy = r4.zw * r5.zw + r2.xy;
  o4.xy = v4.xy * BA_Vertex_10_CB2((uint)(11)).xy + r2.xy;
  r2.xyzw = BA_Vertex_10_CB2((uint)(9)).xyzw * v5.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_10_CB2((uint)(20)).xyxy + BA_Vertex_10_CB2((uint)(20)).zwzw;
  r2.xyzw = r3.xyzw * r2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r4.xyzw = BA_Vertex_10_CB2((uint)(8)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r3.xy + r2.xy;
  r2.xy = r4.zw * r3.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_10_CB2((uint)(7)).xy + r2.xy;
  r2.xy = v5.zw * BA_Vertex_10_CB2((uint)(7)).zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_10_CB2((uint)(6)).xy + r2.xy;
  o4.zw = v4.zw * BA_Vertex_10_CB2((uint)(6)).zw + r2.xy;
  r0.y = BA_Vertex_10_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_10_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_10_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_10_CB0((uint)(64)).z + r0.x;
  o5.z = -r0.x;
  r0.xyzw = BA_Vertex_10_CB2((uint)(5)).xyzw * v5.xyzw;
  r2.xyzw = v3.xyxy * BA_Vertex_10_CB2((uint)(4)).xyxy + BA_Vertex_10_CB2((uint)(4)).zwzw;
  r0.xyzw = r2.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r3.xyzw = BA_Vertex_10_CB2((uint)(3)).xyzw * v4.xyzw;
  r0.xy = r3.xy * r2.xy + r0.xy;
  r0.xy = r3.zw * r2.zw + r0.xy;
  r0.xy = v5.xy * BA_Vertex_10_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v5.zw * BA_Vertex_10_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_10_CB2((uint)(1)).xy + r0.xy;
  o5.xy = v4.zw * BA_Vertex_10_CB2((uint)(1)).zw + r0.xy;
  o5.w = 0;
  r0.x = BA_Vertex_10_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o6.zw = r1.zw;
  o6.xy = r0.xw + r0.zz;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_11_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 21u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_11_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_11_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6,
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_11_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_11_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_11_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_11_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_11_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r2.xyzw = BA_Vertex_11_CB2((uint)(21)).xyzw * v5.xyzw;
  r3.xyzw = BA_Vertex_11_CB2((uint)(17)).xyzw * v4.xyzw;
  r4.xy = BA_Vertex_11_CB2((uint)(18)).zw * v5.zw;
  r5.xyzw = v3.xyxy * BA_Vertex_11_CB2((uint)(19)).xyxy + BA_Vertex_11_CB2((uint)(19)).zwzw;
  r2.xy = r2.xy * r5.xy + r4.xy;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_11_CB2((uint)(22)).zw + r2.xy;
  r2.xy = r2.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_11_CB2((uint)(18)).xy + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  o2.zw = v4.xy * BA_Vertex_11_CB2((uint)(22)).xy + r2.xy;
  o2.xy = v3.xy;
  o3.xyzw = v4.xyzw;
  r2.xy = BA_Vertex_11_CB2((uint)(15)).zw * v5.zw;
  r3.xyzw = BA_Vertex_11_CB2((uint)(13)).xyzw * v5.xyzw;
  r2.xy = r3.xy * r5.xy + r2.xy;
  r4.xyzw = BA_Vertex_11_CB2((uint)(12)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r5.xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_11_CB2((uint)(11)).zw + r2.xy;
  r2.xy = r3.zw * r5.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_11_CB2((uint)(15)).xy + r2.xy;
  r2.xy = r4.zw * r5.zw + r2.xy;
  o4.xy = v4.xy * BA_Vertex_11_CB2((uint)(11)).xy + r2.xy;
  r2.xyzw = BA_Vertex_11_CB2((uint)(9)).xyzw * v5.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_11_CB2((uint)(20)).xyxy + BA_Vertex_11_CB2((uint)(20)).zwzw;
  r2.xyzw = r3.xyzw * r2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r4.xyzw = BA_Vertex_11_CB2((uint)(8)).xyzw * v4.xyzw;
  r2.xy = r4.xy * r3.xy + r2.xy;
  r2.xy = r4.zw * r3.zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_11_CB2((uint)(7)).xy + r2.xy;
  r2.xy = v5.zw * BA_Vertex_11_CB2((uint)(7)).zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_11_CB2((uint)(6)).xy + r2.xy;
  o4.zw = v4.zw * BA_Vertex_11_CB2((uint)(6)).zw + r2.xy;
  r0.y = BA_Vertex_11_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_11_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_11_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_11_CB0((uint)(64)).z + r0.x;
  o5.z = -r0.x;
  r0.xyzw = BA_Vertex_11_CB2((uint)(5)).xyzw * v5.xyzw;
  r2.xyzw = v3.xyxy * BA_Vertex_11_CB2((uint)(4)).xyxy + BA_Vertex_11_CB2((uint)(4)).zwzw;
  r0.xyzw = r2.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r3.xyzw = BA_Vertex_11_CB2((uint)(3)).xyzw * v4.xyzw;
  r0.xy = r3.xy * r2.xy + r0.xy;
  r0.xy = r3.zw * r2.zw + r0.xy;
  r0.xy = v5.xy * BA_Vertex_11_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v5.zw * BA_Vertex_11_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_11_CB2((uint)(1)).xy + r0.xy;
  o5.xy = v4.zw * BA_Vertex_11_CB2((uint)(1)).zw + r0.xy;
  o5.w = 0;
  r0.x = BA_Vertex_11_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o6.zw = r1.zw;
  o6.xy = r0.xw + r0.zz;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Vert(float4 position : POSITION, out float4 clip : SV_POSITION) { clip = TransformObjectToHClip(position.xyz); }
#endif

#if !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_16_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 24u) value = float4(_SoftParticleNearFade, _Main_Speed_X, _Main_Speed_Y, 0.0);
  if (i == 25u) value = float4(0.0, _Mask_Speed_Y, 0.0, _Multiply);
  if (i == 27u) value = float4(_SoftParticleFarFade, 0.0, _Mask_Speed_X, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_16_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_16_CB1((uint)(27)).z * BA_Fragment_16_CB0((uint)(11)).y;
  r0.y = BA_Fragment_16_CB1((uint)(25)).y * BA_Fragment_16_CB0((uint)(11)).y;
  r0.xy = v5.xy + r0.xy;
  r0.zw = v2.xy * BA_Fragment_16_CB1((uint)(4)).xy + BA_Fragment_16_CB1((uint)(4)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.yz = v2.xy * BA_Fragment_16_CB1((uint)(20)).xy + BA_Fragment_16_CB1((uint)(20)).zw;
  r0.yz = BA_Fragment_16_CB1((uint)(24)).yz * BA_Fragment_16_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v4.zw + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.y = v1.w * r1.x;
  r1.xyz = BA_Fragment_16_CB1((uint)(0)).xyz * r1.xyz;
  r1.xyz = BA_Fragment_16_CB1((uint)(25)).www * r1.xyz;
  o0.xyz = v1.xyz * r1.xyz;
  r0.y = BA_Fragment_16_CB1((uint)(0)).w * r0.y;
  r0.y = BA_Fragment_16_CB1((uint)(25)).w * r0.y;
  r0.x = saturate(r0.y * r0.x);
  r0.yz = v6.xy / v6.ww;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_16_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_16_CB0((uint)(20)).z * r1.x + BA_Fragment_16_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_16_CB1((uint)(24)).x + r0.y;
  r0.y = -v5.z + r0.y;
  r0.z = BA_Fragment_16_CB1((uint)(27)).x + -BA_Fragment_16_CB1((uint)(24)).x;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.x * r0.y + -BA_Fragment_16_CB1((uint)(27)).w;
  r0.x = r0.x * r0.y;
  o0.w = r0.x;
  r0.x = cmp(r0.z < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_17_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_SoftParticleNearFade, _Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X);
  if (i == 25u) value = float4(_RDistort_Power_Y, _Mask_Speed_Y, 0.0, _Multiply);
  if (i == 26u) value = float4(_RDistort_Speed_X, _RDistort_Speed_Y, 0.0, 0.0);
  if (i == 27u) value = float4(_SoftParticleFarFade, 0.0, _Mask_Speed_X, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_17_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_17_CB1((uint)(26)).xy * BA_Fragment_17_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v2.xy * BA_Fragment_17_CB1((uint)(16)).xy + BA_Fragment_17_CB1((uint)(16)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v2.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.yz = v2.xy * BA_Fragment_17_CB1((uint)(20)).xy + BA_Fragment_17_CB1((uint)(20)).zw;
  r0.yz = BA_Fragment_17_CB1((uint)(24)).yz * BA_Fragment_17_CB0((uint)(11)).yy + r0.yz;
  r1.xyzw = BA_Fragment_17_CB1((uint)(23)).xyzw * v3.xyzw;
  r1.xy = r1.xy + r1.zw;
  r2.x = BA_Fragment_17_CB1((uint)(24)).w + r1.x;
  r2.y = BA_Fragment_17_CB1((uint)(25)).x + r1.y;
  r0.xy = r2.xy * r0.xx + r0.yz;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r0.w = v1.w * r0.x;
  r0.xyz = BA_Fragment_17_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_17_CB1((uint)(25)).www * r0.xyz;
  o0.xyz = v1.xyz * r0.xyz;
  r0.x = BA_Fragment_17_CB1((uint)(0)).w * r0.w;
  r0.x = BA_Fragment_17_CB1((uint)(25)).w * r0.x;
  r1.x = BA_Fragment_17_CB1((uint)(27)).z * BA_Fragment_17_CB0((uint)(11)).y;
  r1.y = BA_Fragment_17_CB1((uint)(25)).y * BA_Fragment_17_CB0((uint)(11)).y;
  r0.yz = v5.xy + r1.xy;
  r1.xy = v2.xy * BA_Fragment_17_CB1((uint)(4)).xy + BA_Fragment_17_CB1((uint)(4)).zw;
  r0.yz = r1.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.x * r0.x);
  r0.yz = v6.xy / v6.ww;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_17_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_17_CB0((uint)(20)).z * r1.x + BA_Fragment_17_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_17_CB1((uint)(24)).x + r0.y;
  r0.y = -v5.z + r0.y;
  r0.z = BA_Fragment_17_CB1((uint)(27)).x + -BA_Fragment_17_CB1((uint)(24)).x;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.x * r0.y + -BA_Fragment_17_CB1((uint)(27)).w;
  r0.x = r0.x * r0.y;
  o0.w = r0.x;
  r0.x = cmp(r0.z < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_18_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 10u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 24u) value = float4(_SoftParticleNearFade, _Main_Speed_X, _Main_Speed_Y, 0.0);
  if (i == 25u) value = float4(0.0, _Mask_Speed_Y, _GDistort_Speed_X, _Multiply);
  if (i == 26u) value = float4(0.0, 0.0, _GDistort_Power_Y, _GDistort_Power_X);
  if (i == 27u) value = float4(_SoftParticleFarFade, _GDistort_Speed_Y, _Mask_Speed_X, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_18_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Fragment_18_CB1((uint)(10)).xyzw * v3.xyzw;
  r0.xy = r0.xy + r0.zw;
  r0.xy = BA_Fragment_18_CB1((uint)(26)).wz + r0.xy;
  r0.zw = v2.xy * BA_Fragment_18_CB1((uint)(20)).xy + BA_Fragment_18_CB1((uint)(20)).zw;
  r0.zw = BA_Fragment_18_CB1((uint)(24)).yz * BA_Fragment_18_CB0((uint)(11)).yy + r0.zw;
  r1.xy = v2.xy * BA_Fragment_18_CB1((uint)(14)).xy + BA_Fragment_18_CB1((uint)(14)).zw;
  r2.xw = BA_Fragment_18_CB1((uint)(25)).zy * BA_Fragment_18_CB0((uint)(11)).yy;
  r2.yz = BA_Fragment_18_CB1((uint)(27)).yz * BA_Fragment_18_CB0((uint)(11)).yy;
  r1.zw = frac(r2.xy);
  r2.xy = v5.xy + r2.zw;
  r1.xy = r1.xy + r1.zw;
  r1.xy = v4.xy + r1.xy;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r1.xy).xyzw;
  r0.xy = r1.yy * r0.xy + r0.zw;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r0.w = v1.w * r0.x;
  r0.xyz = BA_Fragment_18_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_18_CB1((uint)(25)).www * r0.xyz;
  o0.xyz = v1.xyz * r0.xyz;
  r0.x = BA_Fragment_18_CB1((uint)(0)).w * r0.w;
  r0.x = BA_Fragment_18_CB1((uint)(25)).w * r0.x;
  r0.yz = v2.xy * BA_Fragment_18_CB1((uint)(4)).xy + BA_Fragment_18_CB1((uint)(4)).zw;
  r0.yz = r2.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.x * r0.x);
  r0.yz = v6.xy / v6.ww;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_18_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_18_CB0((uint)(20)).z * r1.x + BA_Fragment_18_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_18_CB1((uint)(24)).x + r0.y;
  r0.y = -v5.z + r0.y;
  r0.z = BA_Fragment_18_CB1((uint)(27)).x + -BA_Fragment_18_CB1((uint)(24)).x;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.x * r0.y + -BA_Fragment_18_CB1((uint)(27)).w;
  r0.x = r0.x * r0.y;
  o0.w = r0.x;
  r0.x = cmp(r0.z < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_19_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 24u) value = float4(_SoftParticleNearFade, _Main_Speed_X, _Main_Speed_Y, 0.0);
  if (i == 25u) value = float4(0.0, _Mask_Speed_Y, 0.0, _Multiply);
  if (i == 27u) value = float4(_SoftParticleFarFade, 0.0, _Mask_Speed_X, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_19_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_19_CB1((uint)(27)).z * BA_Fragment_19_CB0((uint)(11)).y;
  r0.y = BA_Fragment_19_CB1((uint)(25)).y * BA_Fragment_19_CB0((uint)(11)).y;
  r0.xy = v5.xy + r0.xy;
  r0.zw = v2.xy * BA_Fragment_19_CB1((uint)(4)).xy + BA_Fragment_19_CB1((uint)(4)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.yz = v2.xy * BA_Fragment_19_CB1((uint)(20)).xy + BA_Fragment_19_CB1((uint)(20)).zw;
  r0.yz = BA_Fragment_19_CB1((uint)(24)).yz * BA_Fragment_19_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v4.zw + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.y = v1.w * r1.w;
  r1.xyz = BA_Fragment_19_CB1((uint)(0)).xyz * r1.xyz;
  r1.xyz = BA_Fragment_19_CB1((uint)(25)).www * r1.xyz;
  o0.xyz = v1.xyz * r1.xyz;
  r0.y = BA_Fragment_19_CB1((uint)(0)).w * r0.y;
  r0.y = BA_Fragment_19_CB1((uint)(25)).w * r0.y;
  r0.x = saturate(r0.y * r0.x);
  r0.yz = v6.xy / v6.ww;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_19_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_19_CB0((uint)(20)).z * r1.x + BA_Fragment_19_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_19_CB1((uint)(24)).x + r0.y;
  r0.y = -v5.z + r0.y;
  r0.z = BA_Fragment_19_CB1((uint)(27)).x + -BA_Fragment_19_CB1((uint)(24)).x;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.x * r0.y + -BA_Fragment_19_CB1((uint)(27)).w;
  r0.x = r0.x * r0.y;
  o0.w = r0.x;
  r0.x = cmp(r0.z < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_20_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_SoftParticleNearFade, _Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X);
  if (i == 25u) value = float4(_RDistort_Power_Y, _Mask_Speed_Y, 0.0, _Multiply);
  if (i == 26u) value = float4(_RDistort_Speed_X, _RDistort_Speed_Y, 0.0, 0.0);
  if (i == 27u) value = float4(_SoftParticleFarFade, 0.0, _Mask_Speed_X, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_20_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_20_CB1((uint)(26)).xy * BA_Fragment_20_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v2.xy * BA_Fragment_20_CB1((uint)(16)).xy + BA_Fragment_20_CB1((uint)(16)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v2.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.yz = v2.xy * BA_Fragment_20_CB1((uint)(20)).xy + BA_Fragment_20_CB1((uint)(20)).zw;
  r0.yz = BA_Fragment_20_CB1((uint)(24)).yz * BA_Fragment_20_CB0((uint)(11)).yy + r0.yz;
  r1.xyzw = BA_Fragment_20_CB1((uint)(23)).xyzw * v3.xyzw;
  r1.xy = r1.xy + r1.zw;
  r2.x = BA_Fragment_20_CB1((uint)(24)).w + r1.x;
  r2.y = BA_Fragment_20_CB1((uint)(25)).x + r1.y;
  r0.xy = r2.xy * r0.xx + r0.yz;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r0.w = v1.w * r0.w;
  r0.xyz = BA_Fragment_20_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_20_CB1((uint)(25)).www * r0.xyz;
  o0.xyz = v1.xyz * r0.xyz;
  r0.x = BA_Fragment_20_CB1((uint)(0)).w * r0.w;
  r0.x = BA_Fragment_20_CB1((uint)(25)).w * r0.x;
  r1.x = BA_Fragment_20_CB1((uint)(27)).z * BA_Fragment_20_CB0((uint)(11)).y;
  r1.y = BA_Fragment_20_CB1((uint)(25)).y * BA_Fragment_20_CB0((uint)(11)).y;
  r0.yz = v5.xy + r1.xy;
  r1.xy = v2.xy * BA_Fragment_20_CB1((uint)(4)).xy + BA_Fragment_20_CB1((uint)(4)).zw;
  r0.yz = r1.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.x * r0.x);
  r0.yz = v6.xy / v6.ww;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_20_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_20_CB0((uint)(20)).z * r1.x + BA_Fragment_20_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_20_CB1((uint)(24)).x + r0.y;
  r0.y = -v5.z + r0.y;
  r0.z = BA_Fragment_20_CB1((uint)(27)).x + -BA_Fragment_20_CB1((uint)(24)).x;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.x * r0.y + -BA_Fragment_20_CB1((uint)(27)).w;
  r0.x = r0.x * r0.y;
  o0.w = r0.x;
  r0.x = cmp(r0.z < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_21_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_SoftParticleNearFade, _Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X);
  if (i == 25u) value = float4(_RDistort_Power_Y, _Mask_Speed_Y, 0.0, _Multiply);
  if (i == 26u) value = float4(_RDistort_Speed_X, _RDistort_Speed_Y, 0.0, 0.0);
  if (i == 27u) value = float4(_SoftParticleFarFade, 0.0, _Mask_Speed_X, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_21_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_21_CB1((uint)(26)).xy * BA_Fragment_21_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v2.xy * BA_Fragment_21_CB1((uint)(16)).xy + BA_Fragment_21_CB1((uint)(16)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v2.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r1.x = BA_Fragment_21_CB1((uint)(27)).z * BA_Fragment_21_CB0((uint)(11)).y;
  r1.y = BA_Fragment_21_CB1((uint)(25)).y * BA_Fragment_21_CB0((uint)(11)).y;
  r2.xyzw = BA_Fragment_21_CB1((uint)(23)).xyzw * v3.xyzw;
  r0.yz = r2.xy + r2.zw;
  r2.x = BA_Fragment_21_CB1((uint)(24)).w + r0.y;
  r2.y = BA_Fragment_21_CB1((uint)(25)).x + r0.z;
  r0.yz = r2.xy * r0.xx + r1.xy;
  r0.yz = v5.xy + r0.yz;
  r1.xy = v2.xy * BA_Fragment_21_CB1((uint)(4)).xy + BA_Fragment_21_CB1((uint)(4)).zw;
  r0.yz = r1.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.yz = v2.xy * BA_Fragment_21_CB1((uint)(20)).xy + BA_Fragment_21_CB1((uint)(20)).zw;
  r0.yz = BA_Fragment_21_CB1((uint)(24)).yz * BA_Fragment_21_CB0((uint)(11)).yy + r0.yz;
  r0.xy = r2.xy * r0.xx + r0.yz;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r0.w = v1.w * r0.x;
  r0.xyz = BA_Fragment_21_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_21_CB1((uint)(25)).www * r0.xyz;
  o0.xyz = v1.xyz * r0.xyz;
  r0.x = BA_Fragment_21_CB1((uint)(0)).w * r0.w;
  r0.x = BA_Fragment_21_CB1((uint)(25)).w * r0.x;
  r0.x = saturate(r0.x * r1.x);
  r0.yz = v6.xy / v6.ww;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_21_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_21_CB0((uint)(20)).z * r1.x + BA_Fragment_21_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_21_CB1((uint)(24)).x + r0.y;
  r0.y = -v5.z + r0.y;
  r0.z = BA_Fragment_21_CB1((uint)(27)).x + -BA_Fragment_21_CB1((uint)(24)).x;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.x * r0.y + -BA_Fragment_21_CB1((uint)(27)).w;
  r0.x = r0.x * r0.y;
  o0.w = r0.x;
  r0.x = cmp(r0.z < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_22_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_SoftParticleNearFade, _Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X);
  if (i == 25u) value = float4(_RDistort_Power_Y, _Mask_Speed_Y, 0.0, _Multiply);
  if (i == 26u) value = float4(_RDistort_Speed_X, _RDistort_Speed_Y, 0.0, 0.0);
  if (i == 27u) value = float4(_SoftParticleFarFade, 0.0, _Mask_Speed_X, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_22_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_22_CB1((uint)(26)).xy * BA_Fragment_22_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v2.xy * BA_Fragment_22_CB1((uint)(16)).xy + BA_Fragment_22_CB1((uint)(16)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v2.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r1.x = BA_Fragment_22_CB1((uint)(27)).z * BA_Fragment_22_CB0((uint)(11)).y;
  r1.y = BA_Fragment_22_CB1((uint)(25)).y * BA_Fragment_22_CB0((uint)(11)).y;
  r2.xyzw = BA_Fragment_22_CB1((uint)(23)).xyzw * v3.xyzw;
  r0.yz = r2.xy + r2.zw;
  r2.x = BA_Fragment_22_CB1((uint)(24)).w + r0.y;
  r2.y = BA_Fragment_22_CB1((uint)(25)).x + r0.z;
  r0.yz = r2.xy * r0.xx + r1.xy;
  r0.yz = v5.xy + r0.yz;
  r1.xy = v2.xy * BA_Fragment_22_CB1((uint)(4)).xy + BA_Fragment_22_CB1((uint)(4)).zw;
  r0.yz = r1.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.yz = v2.xy * BA_Fragment_22_CB1((uint)(20)).xy + BA_Fragment_22_CB1((uint)(20)).zw;
  r0.yz = BA_Fragment_22_CB1((uint)(24)).yz * BA_Fragment_22_CB0((uint)(11)).yy + r0.yz;
  r0.xy = r2.xy * r0.xx + r0.yz;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r0.w = v1.w * r0.w;
  r0.xyz = BA_Fragment_22_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_22_CB1((uint)(25)).www * r0.xyz;
  o0.xyz = v1.xyz * r0.xyz;
  r0.x = BA_Fragment_22_CB1((uint)(0)).w * r0.w;
  r0.x = BA_Fragment_22_CB1((uint)(25)).w * r0.x;
  r0.x = saturate(r0.x * r1.x);
  r0.yz = v6.xy / v6.ww;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_22_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_22_CB0((uint)(20)).z * r1.x + BA_Fragment_22_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_22_CB1((uint)(24)).x + r0.y;
  r0.y = -v5.z + r0.y;
  r0.z = BA_Fragment_22_CB1((uint)(27)).x + -BA_Fragment_22_CB1((uint)(24)).x;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.x * r0.y + -BA_Fragment_22_CB1((uint)(27)).w;
  r0.x = r0.x * r0.y;
  o0.w = r0.x;
  r0.x = cmp(r0.z < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_23_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 10u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_SoftParticleNearFade, _Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X);
  if (i == 25u) value = float4(_RDistort_Power_Y, _Mask_Speed_Y, _GDistort_Speed_X, _Multiply);
  if (i == 26u) value = float4(_RDistort_Speed_X, _RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X);
  if (i == 27u) value = float4(_SoftParticleFarFade, _GDistort_Speed_Y, _Mask_Speed_X, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_23_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_23_CB1((uint)(14)).xy + BA_Fragment_23_CB1((uint)(14)).zw;
  r1.xw = BA_Fragment_23_CB1((uint)(25)).zy * BA_Fragment_23_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_23_CB1((uint)(27)).yz * BA_Fragment_23_CB0((uint)(11)).yy;
  r0.zw = frac(r1.xy);
  r0.xy = r0.xy + r0.zw;
  r0.xy = v4.xy + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r2.xyzw = BA_Fragment_23_CB1((uint)(10)).xyzw * v3.xyzw;
  r0.xz = r2.xy + r2.zw;
  r0.xz = BA_Fragment_23_CB1((uint)(26)).wz + r0.xz;
  r1.xy = r0.yy * r0.xz + r1.zw;
  r0.xy = r0.yy * r0.xz;
  r0.zw = v5.xy + r1.xy;
  r1.xy = v2.xy * BA_Fragment_23_CB1((uint)(4)).xy + BA_Fragment_23_CB1((uint)(4)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.zw = BA_Fragment_23_CB1((uint)(26)).xy * BA_Fragment_23_CB0((uint)(11)).yy;
  r0.zw = frac(r0.zw);
  r1.yz = v2.xy * BA_Fragment_23_CB1((uint)(16)).xy + BA_Fragment_23_CB1((uint)(16)).zw;
  r0.zw = r1.yz + r0.zw;
  r0.zw = v2.zw + r0.zw;
  r2.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r3.xyzw = BA_Fragment_23_CB1((uint)(23)).xyzw * v3.xyzw;
  r0.zw = r3.xy + r3.zw;
  r3.x = BA_Fragment_23_CB1((uint)(24)).w + r0.z;
  r3.y = BA_Fragment_23_CB1((uint)(25)).x + r0.w;
  r0.xy = r3.xy * r2.xx + r0.xy;
  r0.zw = v2.xy * BA_Fragment_23_CB1((uint)(20)).xy + BA_Fragment_23_CB1((uint)(20)).zw;
  r0.zw = BA_Fragment_23_CB1((uint)(24)).yz * BA_Fragment_23_CB0((uint)(11)).yy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r0.w = v1.w * r0.x;
  r0.xyz = BA_Fragment_23_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_23_CB1((uint)(25)).www * r0.xyz;
  o0.xyz = v1.xyz * r0.xyz;
  r0.x = BA_Fragment_23_CB1((uint)(0)).w * r0.w;
  r0.x = BA_Fragment_23_CB1((uint)(25)).w * r0.x;
  r0.x = saturate(r0.x * r1.x);
  r0.yz = v6.xy / v6.ww;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_23_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_23_CB0((uint)(20)).z * r1.x + BA_Fragment_23_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_23_CB1((uint)(24)).x + r0.y;
  r0.y = -v5.z + r0.y;
  r0.z = BA_Fragment_23_CB1((uint)(27)).x + -BA_Fragment_23_CB1((uint)(24)).x;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.x * r0.y + -BA_Fragment_23_CB1((uint)(27)).w;
  r0.x = r0.x * r0.y;
  o0.w = r0.x;
  r0.x = cmp(r0.z < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_24_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 10u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_SoftParticleNearFade, _Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X);
  if (i == 25u) value = float4(_RDistort_Power_Y, _Mask_Speed_Y, _GDistort_Speed_X, _Multiply);
  if (i == 26u) value = float4(_RDistort_Speed_X, _RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X);
  if (i == 27u) value = float4(_SoftParticleFarFade, _GDistort_Speed_Y, _Mask_Speed_X, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_24_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_24_CB1((uint)(14)).xy + BA_Fragment_24_CB1((uint)(14)).zw;
  r1.xw = BA_Fragment_24_CB1((uint)(25)).zy * BA_Fragment_24_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_24_CB1((uint)(27)).yz * BA_Fragment_24_CB0((uint)(11)).yy;
  r0.zw = frac(r1.xy);
  r0.xy = r0.xy + r0.zw;
  r0.xy = v4.xy + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r2.xyzw = BA_Fragment_24_CB1((uint)(10)).xyzw * v3.xyzw;
  r0.xz = r2.xy + r2.zw;
  r0.xz = BA_Fragment_24_CB1((uint)(26)).wz + r0.xz;
  r1.xy = r0.yy * r0.xz + r1.zw;
  r0.xy = r0.yy * r0.xz;
  r0.zw = v5.xy + r1.xy;
  r1.xy = v2.xy * BA_Fragment_24_CB1((uint)(4)).xy + BA_Fragment_24_CB1((uint)(4)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.zw = BA_Fragment_24_CB1((uint)(26)).xy * BA_Fragment_24_CB0((uint)(11)).yy;
  r0.zw = frac(r0.zw);
  r1.yz = v2.xy * BA_Fragment_24_CB1((uint)(16)).xy + BA_Fragment_24_CB1((uint)(16)).zw;
  r0.zw = r1.yz + r0.zw;
  r0.zw = v2.zw + r0.zw;
  r2.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r3.xyzw = BA_Fragment_24_CB1((uint)(23)).xyzw * v3.xyzw;
  r0.zw = r3.xy + r3.zw;
  r3.x = BA_Fragment_24_CB1((uint)(24)).w + r0.z;
  r3.y = BA_Fragment_24_CB1((uint)(25)).x + r0.w;
  r0.xy = r3.xy * r2.xx + r0.xy;
  r0.zw = v2.xy * BA_Fragment_24_CB1((uint)(20)).xy + BA_Fragment_24_CB1((uint)(20)).zw;
  r0.zw = BA_Fragment_24_CB1((uint)(24)).yz * BA_Fragment_24_CB0((uint)(11)).yy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r0.w = v1.w * r0.w;
  r0.xyz = BA_Fragment_24_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_24_CB1((uint)(25)).www * r0.xyz;
  o0.xyz = v1.xyz * r0.xyz;
  r0.x = BA_Fragment_24_CB1((uint)(0)).w * r0.w;
  r0.x = BA_Fragment_24_CB1((uint)(25)).w * r0.x;
  r0.x = saturate(r0.x * r1.x);
  r0.yz = v6.xy / v6.ww;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_24_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_24_CB0((uint)(20)).z * r1.x + BA_Fragment_24_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_24_CB1((uint)(24)).x + r0.y;
  r0.y = -v5.z + r0.y;
  r0.z = BA_Fragment_24_CB1((uint)(27)).x + -BA_Fragment_24_CB1((uint)(24)).x;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.x * r0.y + -BA_Fragment_24_CB1((uint)(27)).w;
  r0.x = r0.x * r0.y;
  o0.w = r0.x;
  r0.x = cmp(r0.z < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_25_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 10u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_SoftParticleNearFade, _Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X);
  if (i == 25u) value = float4(_RDistort_Power_Y, _Mask_Speed_Y, _GDistort_Speed_X, _Multiply);
  if (i == 26u) value = float4(_RDistort_Speed_X, _RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X);
  if (i == 27u) value = float4(_SoftParticleFarFade, _GDistort_Speed_Y, _Mask_Speed_X, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_25_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_25_CB1((uint)(26)).xy * BA_Fragment_25_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v2.xy * BA_Fragment_25_CB1((uint)(16)).xy + BA_Fragment_25_CB1((uint)(16)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v2.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r1.xyzw = BA_Fragment_25_CB1((uint)(10)).xyzw * v3.xyzw;
  r0.yz = r1.xy + r1.zw;
  r0.yz = BA_Fragment_25_CB1((uint)(26)).wz + r0.yz;
  r1.xy = v2.xy * BA_Fragment_25_CB1((uint)(14)).xy + BA_Fragment_25_CB1((uint)(14)).zw;
  r2.xw = BA_Fragment_25_CB1((uint)(25)).zy * BA_Fragment_25_CB0((uint)(11)).yy;
  r2.yz = BA_Fragment_25_CB1((uint)(27)).yz * BA_Fragment_25_CB0((uint)(11)).yy;
  r1.zw = frac(r2.xy);
  r1.xy = r1.xy + r1.zw;
  r1.xy = v4.xy + r1.xy;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r1.xy).xyzw;
  r0.yz = r1.yy * r0.yz;
  r1.xyzw = BA_Fragment_25_CB1((uint)(23)).xyzw * v3.xyzw;
  r1.xy = r1.xy + r1.zw;
  r2.x = BA_Fragment_25_CB1((uint)(24)).w + r1.x;
  r2.y = BA_Fragment_25_CB1((uint)(25)).x + r1.y;
  r0.xy = r2.xy * r0.xx + r0.yz;
  r0.zw = r0.xy + r2.zw;
  r0.zw = v5.xy + r0.zw;
  r1.xy = v2.xy * BA_Fragment_25_CB1((uint)(4)).xy + BA_Fragment_25_CB1((uint)(4)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.zw = v2.xy * BA_Fragment_25_CB1((uint)(20)).xy + BA_Fragment_25_CB1((uint)(20)).zw;
  r0.zw = BA_Fragment_25_CB1((uint)(24)).yz * BA_Fragment_25_CB0((uint)(11)).yy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r0.w = v1.w * r0.w;
  r0.xyz = BA_Fragment_25_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_25_CB1((uint)(25)).www * r0.xyz;
  o0.xyz = v1.xyz * r0.xyz;
  r0.x = BA_Fragment_25_CB1((uint)(0)).w * r0.w;
  r0.x = BA_Fragment_25_CB1((uint)(25)).w * r0.x;
  r0.x = saturate(r0.x * r1.x);
  r0.yz = v6.xy / v6.ww;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_25_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_25_CB0((uint)(20)).z * r1.x + BA_Fragment_25_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_25_CB1((uint)(24)).x + r0.y;
  r0.y = -v5.z + r0.y;
  r0.z = BA_Fragment_25_CB1((uint)(27)).x + -BA_Fragment_25_CB1((uint)(24)).x;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.x * r0.y + -BA_Fragment_25_CB1((uint)(27)).w;
  r0.x = r0.x * r0.y;
  o0.w = r0.x;
  r0.x = cmp(r0.z < 0);
  if (r0.x != 0) discard;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_26_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 10u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 20u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_SoftParticleNearFade, _Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X);
  if (i == 25u) value = float4(_RDistort_Power_Y, _Mask_Speed_Y, _GDistort_Speed_X, _Multiply);
  if (i == 26u) value = float4(_RDistort_Speed_X, _RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X);
  if (i == 27u) value = float4(_SoftParticleFarFade, _GDistort_Speed_Y, _Mask_Speed_X, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_26_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Fragment_26_CB1((uint)(10)).xyzw * v3.xyzw;
  r0.xy = r0.xy + r0.zw;
  r0.xy = BA_Fragment_26_CB1((uint)(26)).wz + r0.xy;
  r0.zw = v2.xy * BA_Fragment_26_CB1((uint)(14)).xy + BA_Fragment_26_CB1((uint)(14)).zw;
  r1.xw = BA_Fragment_26_CB1((uint)(25)).zy * BA_Fragment_26_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_26_CB1((uint)(27)).yz * BA_Fragment_26_CB0((uint)(11)).yy;
  r1.xy = frac(r1.xy);
  r0.zw = r1.xy + r0.zw;
  r0.zw = v4.xy + r0.zw;
  r2.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r0.xy = r2.yy * r0.xy + r1.zw;
  r0.xy = v5.xy + r0.xy;
  r0.zw = v2.xy * BA_Fragment_26_CB1((uint)(4)).xy + BA_Fragment_26_CB1((uint)(4)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.yz = BA_Fragment_26_CB1((uint)(26)).xy * BA_Fragment_26_CB0((uint)(11)).yy;
  r0.yz = frac(r0.yz);
  r1.xy = v2.xy * BA_Fragment_26_CB1((uint)(16)).xy + BA_Fragment_26_CB1((uint)(16)).zw;
  r0.yz = r1.xy + r0.yz;
  r0.yz = v2.zw + r0.yz;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.yz).xyzw;
  r0.yz = v2.xy * BA_Fragment_26_CB1((uint)(20)).xy + BA_Fragment_26_CB1((uint)(20)).zw;
  r0.yz = BA_Fragment_26_CB1((uint)(24)).yz * BA_Fragment_26_CB0((uint)(11)).yy + r0.yz;
  r2.xyzw = BA_Fragment_26_CB1((uint)(23)).xyzw * v3.xyzw;
  r1.yz = r2.xy + r2.zw;
  r2.x = BA_Fragment_26_CB1((uint)(24)).w + r1.y;
  r2.y = BA_Fragment_26_CB1((uint)(25)).x + r1.z;
  r0.yz = r2.xy * r1.xx + r0.yz;
  r0.yz = v4.zw + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.y = v1.w * r1.x;
  r1.xyz = BA_Fragment_26_CB1((uint)(0)).xyz * r1.xyz;
  r1.xyz = BA_Fragment_26_CB1((uint)(25)).www * r1.xyz;
  r1.xyz = v1.xyz * r1.xyz;
  r0.y = BA_Fragment_26_CB1((uint)(0)).w * r0.y;
  r0.y = BA_Fragment_26_CB1((uint)(25)).w * r0.y;
  r0.x = saturate(r0.y * r0.x);
  r0.yz = v6.xy / v6.ww;
  r2.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_26_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_26_CB0((uint)(20)).z * r2.x + BA_Fragment_26_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_26_CB1((uint)(24)).x + r0.y;
  r0.y = -v5.z + r0.y;
  r0.z = BA_Fragment_26_CB1((uint)(27)).x + -BA_Fragment_26_CB1((uint)(24)).x;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.x * r0.y + -BA_Fragment_26_CB1((uint)(27)).w;
  r0.x = r0.x * r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  o0.xyz = r1.xyz * r0.xxx;
  o0.w = r0.x;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Frag(out float4 color : SV_TARGET0) { color = float4(1,0,1,1); }
#endif
