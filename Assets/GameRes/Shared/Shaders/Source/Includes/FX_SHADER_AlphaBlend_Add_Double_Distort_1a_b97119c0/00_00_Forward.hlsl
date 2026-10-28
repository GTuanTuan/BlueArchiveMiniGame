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
float4 _Tex_DistortRG_ST;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
Texture2D<float4> _Tex_DistortRG;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
SamplerState sampler_Tex_DistortRG;
SamplerState sampler_Tex_Main;
SamplerState sampler_Tex_Mask;
#ifndef cmp
#define cmp -
#endif

#if !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_1_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_1_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_1_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_1_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_1_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_1_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_1_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_1_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_1_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_1_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_1_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_1_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_1_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_1_CB2((uint)(19)).xyxy + BA_Vertex_1_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_1_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_1_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_1_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_1_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_1_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_1_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_1_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_1_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_1_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_1_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_1_CB2((uint)(21)).xyxy + BA_Vertex_1_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_1_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_1_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_1_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_1_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_1_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_1_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_1_CB2((uint)(3)).xyxy + BA_Vertex_1_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_1_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_1_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_1_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_1_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_1_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_2_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_2_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_2_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_2_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_2_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_2_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_2_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_2_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_2_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_2_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_2_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_2_CB2((uint)(19)).xyxy + BA_Vertex_2_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_2_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_2_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_2_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_2_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_2_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_2_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_2_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_2_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_2_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_2_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_2_CB2((uint)(21)).xyxy + BA_Vertex_2_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_2_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_2_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_2_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_2_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_2_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_2_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_2_CB2((uint)(3)).xyxy + BA_Vertex_2_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_2_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_2_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_2_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_2_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_2_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_3_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_3_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_3_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_3_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_3_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_3_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_3_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_3_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_3_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_3_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_3_CB2((uint)(19)).xyxy + BA_Vertex_3_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_3_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_3_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_3_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_3_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_3_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_3_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_3_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_3_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_3_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_3_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_3_CB2((uint)(21)).xyxy + BA_Vertex_3_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_3_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_3_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_3_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_3_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_3_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_3_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_3_CB2((uint)(3)).xyxy + BA_Vertex_3_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_3_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_3_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_3_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_3_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_3_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_4_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_4_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_4_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_4_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_4_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_4_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_4_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_4_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_4_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_4_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_4_CB2((uint)(19)).xyxy + BA_Vertex_4_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_4_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_4_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_4_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_4_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_4_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_4_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_4_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_4_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_4_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_4_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_4_CB2((uint)(21)).xyxy + BA_Vertex_4_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_4_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_4_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_4_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_4_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_4_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_4_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_4_CB2((uint)(3)).xyxy + BA_Vertex_4_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_4_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_4_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_4_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_4_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_4_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_5_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_5_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_5_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_5_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_5_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_5_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_5_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_5_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_5_CB2((uint)(19)).xyxy + BA_Vertex_5_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_5_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_5_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_5_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_5_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_5_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_5_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_5_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_5_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_5_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_5_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_5_CB2((uint)(21)).xyxy + BA_Vertex_5_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_5_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_5_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_5_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_5_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_5_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_5_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_5_CB2((uint)(3)).xyxy + BA_Vertex_5_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_5_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_5_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_5_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_5_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_5_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_6_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_6_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_6_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_6_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_6_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_6_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_6_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_6_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_6_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_6_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_6_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_6_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_6_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_6_CB2((uint)(19)).xyxy + BA_Vertex_6_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_6_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_6_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_6_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_6_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_6_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_6_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_6_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_6_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_6_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_6_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_6_CB2((uint)(21)).xyxy + BA_Vertex_6_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_6_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_6_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_6_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_6_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_6_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_6_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_6_CB2((uint)(3)).xyxy + BA_Vertex_6_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_6_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_6_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_6_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_6_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_6_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_7_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_7_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_7_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_7_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_7_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_7_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_7_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_7_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_7_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_7_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_7_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_7_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_7_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_7_CB2((uint)(19)).xyxy + BA_Vertex_7_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_7_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_7_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_7_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_7_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_7_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_7_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_7_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_7_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_7_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_7_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_7_CB2((uint)(21)).xyxy + BA_Vertex_7_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_7_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_7_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_7_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_7_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_7_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_7_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_7_CB2((uint)(3)).xyxy + BA_Vertex_7_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_7_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_7_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_7_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_7_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_7_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_8_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_8_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_8_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_8_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_8_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_8_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_8_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_8_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_8_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_8_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_8_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_8_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_8_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_8_CB2((uint)(19)).xyxy + BA_Vertex_8_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_8_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_8_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_8_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_8_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_8_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_8_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_8_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_8_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_8_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_8_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_8_CB2((uint)(21)).xyxy + BA_Vertex_8_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_8_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_8_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_8_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_8_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_8_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_8_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_8_CB2((uint)(3)).xyxy + BA_Vertex_8_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_8_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_8_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_8_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_8_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_8_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_9_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_9_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_9_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_9_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_9_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_9_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_9_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_9_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_9_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_9_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_9_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_9_CB2((uint)(19)).xyxy + BA_Vertex_9_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_9_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_9_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_9_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_9_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_9_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_9_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_9_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_9_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_9_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_9_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_9_CB2((uint)(21)).xyxy + BA_Vertex_9_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_9_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_9_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_9_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_9_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_9_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_9_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_9_CB2((uint)(3)).xyxy + BA_Vertex_9_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_9_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_9_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_9_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_9_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_9_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_10_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_10_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_10_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_10_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_10_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_10_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_10_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_10_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_10_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_10_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_10_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_10_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_10_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_10_CB2((uint)(19)).xyxy + BA_Vertex_10_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_10_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_10_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_10_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_10_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_10_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_10_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_10_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_10_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_10_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_10_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_10_CB2((uint)(21)).xyxy + BA_Vertex_10_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_10_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_10_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_10_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_10_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_10_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_10_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_10_CB2((uint)(3)).xyxy + BA_Vertex_10_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_10_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_10_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_10_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_10_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_10_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_11_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_11_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_11_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_11_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_11_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_11_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_11_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_11_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_11_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_11_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_11_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_11_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_11_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_11_CB2((uint)(19)).xyxy + BA_Vertex_11_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_11_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_11_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_11_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_11_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_11_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_11_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_11_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_11_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_11_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_11_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_11_CB2((uint)(21)).xyxy + BA_Vertex_11_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_11_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_11_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_11_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_11_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_11_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_11_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_11_CB2((uint)(3)).xyxy + BA_Vertex_11_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_11_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_11_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_11_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_11_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_11_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_12_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_12_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_12_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_12_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_12_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_12_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_12_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_12_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_12_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_12_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_12_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_12_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_12_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_12_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_12_CB2((uint)(19)).xyxy + BA_Vertex_12_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_12_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_12_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_12_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_12_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_12_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_12_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_12_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_12_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_12_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_12_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_12_CB2((uint)(21)).xyxy + BA_Vertex_12_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_12_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_12_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_12_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_12_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_12_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_12_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_12_CB2((uint)(3)).xyxy + BA_Vertex_12_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_12_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_12_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_12_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_12_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_12_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_13_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_13_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_13_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_13_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_13_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_13_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_13_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_13_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_13_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_13_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_13_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_13_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_13_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_13_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_13_CB2((uint)(19)).xyxy + BA_Vertex_13_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_13_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_13_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_13_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_13_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_13_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_13_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_13_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_13_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_13_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_13_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_13_CB2((uint)(21)).xyxy + BA_Vertex_13_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_13_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_13_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_13_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_13_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_13_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_13_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_13_CB2((uint)(3)).xyxy + BA_Vertex_13_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_13_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_13_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_13_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_13_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_13_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_14_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_14_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_14_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_14_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_14_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_14_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_14_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_14_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_14_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_14_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_14_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_14_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_14_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_14_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_14_CB2((uint)(19)).xyxy + BA_Vertex_14_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_14_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_14_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_14_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_14_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_14_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_14_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_14_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_14_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_14_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_14_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_14_CB2((uint)(21)).xyxy + BA_Vertex_14_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_14_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_14_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_14_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_14_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_14_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_14_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_14_CB2((uint)(3)).xyxy + BA_Vertex_14_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_14_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_14_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_14_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_14_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_14_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_15_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_15_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_15_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_15_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_15_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_15_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_15_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_15_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_15_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_15_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_15_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_15_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_15_CB2((uint)(19)).xyxy + BA_Vertex_15_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_15_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_15_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_15_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_15_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_15_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_15_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_15_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_15_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_15_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_15_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_15_CB2((uint)(21)).xyxy + BA_Vertex_15_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_15_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_15_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_15_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_15_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_15_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_15_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_15_CB2((uint)(3)).xyxy + BA_Vertex_15_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_15_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_15_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_15_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_15_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_15_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_16_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_16_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_16_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_16_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_16_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_16_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_16_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_16_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_16_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_16_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_16_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_16_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_16_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_16_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_16_CB2((uint)(19)).xyxy + BA_Vertex_16_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_16_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_16_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_16_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_16_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_16_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_16_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_16_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_16_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_16_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_16_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_16_CB2((uint)(21)).xyxy + BA_Vertex_16_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_16_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_16_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_16_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_16_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_16_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_16_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_16_CB2((uint)(3)).xyxy + BA_Vertex_16_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_16_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_16_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_16_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_16_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_16_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_17_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_17_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_17_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_17_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_17_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_17_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_17_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_17_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_17_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_17_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_17_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_17_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_17_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_17_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_17_CB2((uint)(19)).xyxy + BA_Vertex_17_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_17_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_17_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_17_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_17_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_17_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_17_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_17_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_17_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_17_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_17_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_17_CB2((uint)(21)).xyxy + BA_Vertex_17_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_17_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_17_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_17_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_17_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_17_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_17_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_17_CB2((uint)(3)).xyxy + BA_Vertex_17_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_17_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_17_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_17_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_17_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_17_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_18_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_18_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_18_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_18_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_18_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_18_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_18_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_18_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_18_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_18_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_18_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_18_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_18_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_18_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_18_CB2((uint)(19)).xyxy + BA_Vertex_18_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_18_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_18_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_18_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_18_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_18_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_18_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_18_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_18_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_18_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_18_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_18_CB2((uint)(21)).xyxy + BA_Vertex_18_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_18_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_18_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_18_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_18_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_18_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_18_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_18_CB2((uint)(3)).xyxy + BA_Vertex_18_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_18_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_18_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_18_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_18_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_18_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_19_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_19_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_19_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_19_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_19_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_19_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_19_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_19_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_19_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_19_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_19_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_19_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_19_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_19_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_19_CB2((uint)(19)).xyxy + BA_Vertex_19_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_19_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_19_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_19_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_19_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_19_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_19_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_19_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_19_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_19_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_19_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_19_CB2((uint)(21)).xyxy + BA_Vertex_19_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_19_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_19_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_19_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_19_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_19_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_19_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_19_CB2((uint)(3)).xyxy + BA_Vertex_19_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_19_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_19_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_19_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_19_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_19_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_20_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_20_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_20_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_20_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_20_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_20_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_20_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_20_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_20_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_20_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_20_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_20_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_20_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_20_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_20_CB2((uint)(19)).xyxy + BA_Vertex_20_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_20_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_20_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_20_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_20_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_20_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_20_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_20_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_20_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_20_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_20_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_20_CB2((uint)(21)).xyxy + BA_Vertex_20_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_20_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_20_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_20_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_20_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_20_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_20_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_20_CB2((uint)(3)).xyxy + BA_Vertex_20_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_20_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_20_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_20_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_20_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_20_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Vertex_21_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 2u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 5u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 6u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortOffsetG_CD2XYXY.x, _CustomData_DistortOffsetG_CD2XYXY.y, _CustomData_DistortOffsetG_CD2XYXY.z, _CustomData_DistortOffsetG_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortTilingG_CD2XYXY.x, _CustomData_DistortTilingG_CD2XYXY.y, _CustomData_DistortTilingG_CD2XYXY.z, _CustomData_DistortTilingG_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortOffsetG_CD1XYXY.x, _CustomData_DistortOffsetG_CD1XYXY.y, _CustomData_DistortOffsetG_CD1XYXY.z, _CustomData_DistortOffsetG_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 15u) value = float4(_CustomData_DistortTilingG_CD1XYXY.x, _CustomData_DistortTilingG_CD1XYXY.y, _CustomData_DistortTilingG_CD1XYXY.z, _CustomData_DistortTilingG_CD1XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortTilingR_CD2XYXY.x, _CustomData_DistortTilingR_CD2XYXY.y, _CustomData_DistortTilingR_CD2XYXY.z, _CustomData_DistortTilingR_CD2XYXY.w);
  if (i == 18u) value = float4(_CustomData_DistortOffsetR_CD1XYXY.x, _CustomData_DistortOffsetR_CD1XYXY.y, _CustomData_DistortOffsetR_CD1XYXY.z, _CustomData_DistortOffsetR_CD1XYXY.w);
  if (i == 19u) value = float4(_Tex_DistortRG_ST.x, _Tex_DistortRG_ST.y, _Tex_DistortRG_ST.z, _Tex_DistortRG_ST.w);
  if (i == 20u) value = float4(_CustomData_DistortTilingR_CD1XYXY.x, _CustomData_DistortTilingR_CD1XYXY.y, _CustomData_DistortTilingR_CD1XYXY.z, _CustomData_DistortTilingR_CD1XYXY.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 22u) value = float4(_CustomData_DistortOffsetR_CD2XYXY.x, _CustomData_DistortOffsetR_CD2XYXY.y, _CustomData_DistortOffsetR_CD2XYXY.z, _CustomData_DistortOffsetR_CD2XYXY.w);
  return value;
}

float4 BA_Vertex_21_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_21_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_21_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_21_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_21_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_21_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_21_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_21_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_21_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_21_CB0((uint)(76)).xyzw + r0.xyzw;
  r0.xyzw = BA_Vertex_21_CB2((uint)(20)).xyzw * v4.xyzw;
  r1.xyzw = BA_Vertex_21_CB2((uint)(17)).xyzw * v3.xyzw;
  r2.xy = BA_Vertex_21_CB2((uint)(18)).zw * v4.zw;
  r3.xyzw = v2.xyxy * BA_Vertex_21_CB2((uint)(19)).xyxy + BA_Vertex_21_CB2((uint)(19)).zwzw;
  r0.xy = r0.xy * r3.xy + r2.xy;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_21_CB2((uint)(22)).zw + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_21_CB2((uint)(18)).xy + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  o1.zw = v3.xy * BA_Vertex_21_CB2((uint)(22)).xy + r0.xy;
  o1.xy = v2.xy;
  o2.xyzw = v3.xyzw;
  r0.xy = BA_Vertex_21_CB2((uint)(12)).zw * v4.zw;
  r1.xyzw = BA_Vertex_21_CB2((uint)(15)).xyzw * v4.xyzw;
  r0.xy = r1.xy * r3.xy + r0.xy;
  r2.xyzw = BA_Vertex_21_CB2((uint)(11)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r3.xy + r0.xy;
  r0.xy = v3.zw * BA_Vertex_21_CB2((uint)(10)).zw + r0.xy;
  r0.xy = r1.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_21_CB2((uint)(12)).xy + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  o3.xy = v3.xy * BA_Vertex_21_CB2((uint)(10)).xy + r0.xy;
  r0.xyzw = BA_Vertex_21_CB2((uint)(8)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_21_CB2((uint)(21)).xyxy + BA_Vertex_21_CB2((uint)(21)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_21_CB2((uint)(7)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_21_CB2((uint)(6)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_21_CB2((uint)(6)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_21_CB2((uint)(5)).xy + r0.xy;
  o3.zw = v3.zw * BA_Vertex_21_CB2((uint)(5)).zw + r0.xy;
  o4.xyzw = v5.xyzw;
  r0.xyzw = BA_Vertex_21_CB2((uint)(4)).xyzw * v4.xyzw;
  r1.xyzw = v2.xyxy * BA_Vertex_21_CB2((uint)(3)).xyxy + BA_Vertex_21_CB2((uint)(3)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_21_CB2((uint)(2)).xyzw * v3.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_21_CB2((uint)(1)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_21_CB2((uint)(1)).zw + r0.xy;
  r0.xy = v3.xy * BA_Vertex_21_CB2((uint)(13)).xy + r0.xy;
  o5.xy = v3.zw * BA_Vertex_21_CB2((uint)(13)).zw + r0.xy;
  o5.zw = float2(0,0);
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Vert(float4 position : POSITION, out float4 clip : SV_POSITION) { clip = TransformObjectToHClip(position.xyz); }
#endif

#if !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_25_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, 0.0, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, 0.0, 0.0, 0.0);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_25_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.w = BA_Fragment_25_CB1((uint)(24)).w * BA_Fragment_25_CB0((uint)(11)).y;
  r0.z = BA_Fragment_25_CB1((uint)(25)).x * BA_Fragment_25_CB0((uint)(11)).y;
  r0.xy = v5.xy + r0.zw;
  r0.zw = v1.xy * BA_Fragment_25_CB1((uint)(3)).xy + BA_Fragment_25_CB1((uint)(3)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.y = v4.w * v4.w;
  r0.zw = v1.xy * BA_Fragment_25_CB1((uint)(21)).xy + BA_Fragment_25_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_25_CB1((uint)(24)).xy * BA_Fragment_25_CB0((uint)(11)).yy + r0.zw;
  r0.zw = v3.zw + r0.zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r1.x * r0.y;
  r0.y = BA_Fragment_25_CB1((uint)(0)).w * r0.y;
  r0.y = BA_Fragment_25_CB1((uint)(27)).x * r0.y;
  r0.y = saturate(r0.y * r0.x);
  r0.z = -BA_Fragment_25_CB1((uint)(27)).y + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.yzw = v4.xyz * r1.xyz;
  r0.yzw = BA_Fragment_25_CB1((uint)(0)).xyz * r0.yzw;
  r0.yzw = BA_Fragment_25_CB1((uint)(27)).xxx * r0.yzw;
  r0.yzw = r0.yzw * r1.www;
  o0.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_26_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_26_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_26_CB1((uint)(25)).wy * BA_Fragment_26_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_26_CB1((uint)(26)).xw * BA_Fragment_26_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_26_CB1((uint)(14)).xy + BA_Fragment_26_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_26_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_26_CB1((uint)(26)).zy + r0.zw;
  r0.zw = r1.yy * r0.zw;
  r1.xy = v1.xy * BA_Fragment_26_CB1((uint)(16)).xy + BA_Fragment_26_CB1((uint)(16)).zw;
  r0.xy = r1.xy + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r2.xyzw = BA_Fragment_26_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r2.xy + r2.zw;
  r2.x = BA_Fragment_26_CB1((uint)(24)).z + r0.x;
  r2.y = BA_Fragment_26_CB1((uint)(25)).z + r0.y;
  r0.xy = r2.xy * r1.xx + r0.zw;
  r0.zw = v1.xy * BA_Fragment_26_CB1((uint)(21)).xy + BA_Fragment_26_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_26_CB1((uint)(24)).xy * BA_Fragment_26_CB0((uint)(11)).yy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.x = v4.w * v4.w;
  r1.x = r1.x * r0.x;
  r1.x = BA_Fragment_26_CB1((uint)(0)).w * r1.x;
  r1.x = BA_Fragment_26_CB1((uint)(27)).x * r1.x;
  r1.w = BA_Fragment_26_CB1((uint)(24)).w * BA_Fragment_26_CB0((uint)(11)).y;
  r1.z = BA_Fragment_26_CB1((uint)(25)).x * BA_Fragment_26_CB0((uint)(11)).y;
  r1.yz = v5.xy + r1.zw;
  r2.xy = v1.xy * BA_Fragment_26_CB1((uint)(3)).xy + BA_Fragment_26_CB1((uint)(3)).zw;
  r1.yz = r2.xy + r1.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r1.yz).xyzw;
  r1.x = saturate(r2.x * r1.x);
  r1.y = -BA_Fragment_26_CB1((uint)(27)).y + r1.x;
  o0.w = r1.x;
  r1.x = cmp(r1.y < 0);
  if (r1.x != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_26_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_26_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  o0.xyz = r0.xyz * r2.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_27_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, 0.0, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, 0.0, 0.0, 0.0);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_27_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_27_CB1((uint)(16)).xy + BA_Fragment_27_CB1((uint)(16)).zw;
  r1.y = BA_Fragment_27_CB1((uint)(26)).x * BA_Fragment_27_CB0((uint)(11)).y;
  r1.xz = BA_Fragment_27_CB1((uint)(25)).wx * BA_Fragment_27_CB0((uint)(11)).yy;
  r0.zw = frac(r1.xy);
  r0.xy = r0.xy + r0.zw;
  r0.xy = v1.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r2.xyzw = BA_Fragment_27_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.yz = r2.xy + r2.zw;
  r1.x = BA_Fragment_27_CB1((uint)(24)).z + r0.y;
  r1.y = BA_Fragment_27_CB1((uint)(25)).z + r0.z;
  r1.w = BA_Fragment_27_CB1((uint)(24)).w * BA_Fragment_27_CB0((uint)(11)).y;
  r0.xy = r1.xy * r0.xx + r1.zw;
  r0.xy = v5.xy + r0.xy;
  r0.zw = v1.xy * BA_Fragment_27_CB1((uint)(3)).xy + BA_Fragment_27_CB1((uint)(3)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.y = v4.w * v4.w;
  r0.zw = v1.xy * BA_Fragment_27_CB1((uint)(21)).xy + BA_Fragment_27_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_27_CB1((uint)(24)).xy * BA_Fragment_27_CB0((uint)(11)).yy + r0.zw;
  r0.zw = v3.zw + r0.zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r1.x * r0.y;
  r0.y = BA_Fragment_27_CB1((uint)(0)).w * r0.y;
  r0.y = BA_Fragment_27_CB1((uint)(27)).x * r0.y;
  r0.y = saturate(r0.y * r0.x);
  r0.z = -BA_Fragment_27_CB1((uint)(27)).y + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.yzw = v4.xyz * r1.xyz;
  r0.yzw = BA_Fragment_27_CB1((uint)(0)).xyz * r0.yzw;
  r0.yzw = BA_Fragment_27_CB1((uint)(27)).xxx * r0.yzw;
  r0.yzw = r0.yzw * r1.www;
  o0.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_28_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_28_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_28_CB1((uint)(25)).wy * BA_Fragment_28_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_28_CB1((uint)(26)).xw * BA_Fragment_28_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_28_CB1((uint)(14)).xy + BA_Fragment_28_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_28_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_28_CB1((uint)(26)).zy + r0.zw;
  r1.xz = v1.xy * BA_Fragment_28_CB1((uint)(16)).xy + BA_Fragment_28_CB1((uint)(16)).zw;
  r0.xy = r1.xz + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r2.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r3.xyzw = BA_Fragment_28_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r3.xy + r3.zw;
  r3.x = BA_Fragment_28_CB1((uint)(24)).z + r0.x;
  r3.y = BA_Fragment_28_CB1((uint)(25)).z + r0.y;
  r0.xy = r3.xy * r2.xx;
  r0.xy = r1.yy * r0.zw + r0.xy;
  r0.zw = v1.xy * BA_Fragment_28_CB1((uint)(21)).xy + BA_Fragment_28_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_28_CB1((uint)(24)).xy * BA_Fragment_28_CB0((uint)(11)).yy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.x = v4.w * v4.w;
  r1.x = r1.x * r0.x;
  r1.x = BA_Fragment_28_CB1((uint)(0)).w * r1.x;
  r1.x = BA_Fragment_28_CB1((uint)(27)).x * r1.x;
  r1.w = BA_Fragment_28_CB1((uint)(24)).w * BA_Fragment_28_CB0((uint)(11)).y;
  r1.z = BA_Fragment_28_CB1((uint)(25)).x * BA_Fragment_28_CB0((uint)(11)).y;
  r1.yz = r3.xy * r2.xx + r1.zw;
  r1.yz = v5.xy + r1.yz;
  r2.xy = v1.xy * BA_Fragment_28_CB1((uint)(3)).xy + BA_Fragment_28_CB1((uint)(3)).zw;
  r1.yz = r2.xy + r1.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r1.yz).xyzw;
  r1.x = saturate(r2.x * r1.x);
  r1.y = -BA_Fragment_28_CB1((uint)(27)).y + r1.x;
  o0.w = r1.x;
  r1.x = cmp(r1.y < 0);
  if (r1.x != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_28_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_28_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  o0.xyz = r0.xyz * r2.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_29_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_29_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_29_CB1((uint)(25)).wy * BA_Fragment_29_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_29_CB1((uint)(26)).xw * BA_Fragment_29_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_29_CB1((uint)(14)).xy + BA_Fragment_29_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_29_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_29_CB1((uint)(26)).zy + r0.zw;
  r1.w = BA_Fragment_29_CB1((uint)(24)).w * BA_Fragment_29_CB0((uint)(11)).y;
  r1.z = BA_Fragment_29_CB1((uint)(25)).x * BA_Fragment_29_CB0((uint)(11)).y;
  r0.zw = r1.yy * r0.zw + r1.zw;
  r0.zw = v5.xy + r0.zw;
  r1.xy = v1.xy * BA_Fragment_29_CB1((uint)(3)).xy + BA_Fragment_29_CB1((uint)(3)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.zw = v1.xy * BA_Fragment_29_CB1((uint)(16)).xy + BA_Fragment_29_CB1((uint)(16)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.yz = v1.xy * BA_Fragment_29_CB1((uint)(21)).xy + BA_Fragment_29_CB1((uint)(21)).zw;
  r0.yz = BA_Fragment_29_CB1((uint)(24)).xy * BA_Fragment_29_CB0((uint)(11)).yy + r0.yz;
  r2.xyzw = BA_Fragment_29_CB1((uint)(23)).xyzw * v2.xyzw;
  r1.yz = r2.xy + r2.zw;
  r2.x = BA_Fragment_29_CB1((uint)(24)).z + r1.y;
  r2.y = BA_Fragment_29_CB1((uint)(25)).z + r1.z;
  r0.xy = r2.xy * r0.xx + r0.yz;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.y = v4.w * v4.w;
  r1.y = r1.y * r0.x;
  r1.y = BA_Fragment_29_CB1((uint)(0)).w * r1.y;
  r1.y = BA_Fragment_29_CB1((uint)(27)).x * r1.y;
  r1.y = saturate(r1.y * r1.x);
  r1.z = -BA_Fragment_29_CB1((uint)(27)).y + r1.y;
  o0.w = r1.y;
  r1.y = cmp(r1.z < 0);
  if (r1.y != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_29_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_29_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  o0.xyz = r0.xyz * r1.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_30_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_30_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_30_CB1((uint)(16)).xy + BA_Fragment_30_CB1((uint)(16)).zw;
  r1.xz = BA_Fragment_30_CB1((uint)(25)).wy * BA_Fragment_30_CB0((uint)(11)).yy;
  r1.yw = BA_Fragment_30_CB1((uint)(26)).xw * BA_Fragment_30_CB0((uint)(11)).yy;
  r1.xyzw = frac(r1.xyzw);
  r0.xy = r1.xy + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.yz = v1.xy * BA_Fragment_30_CB1((uint)(14)).xy + BA_Fragment_30_CB1((uint)(14)).zw;
  r0.yz = r0.yz + r1.zw;
  r0.yz = v3.xy + r0.yz;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.yz).xyzw;
  r2.xyzw = BA_Fragment_30_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.yz = r2.xy + r2.zw;
  r0.yz = BA_Fragment_30_CB1((uint)(26)).zy + r0.yz;
  r1.xz = r1.yy * r0.yz;
  r2.xyzw = BA_Fragment_30_CB1((uint)(23)).xyzw * v2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r3.x = BA_Fragment_30_CB1((uint)(24)).z + r2.x;
  r3.y = BA_Fragment_30_CB1((uint)(25)).z + r2.y;
  r0.xw = r3.xy * r0.xx + r1.xz;
  r1.xz = v1.xy * BA_Fragment_30_CB1((uint)(21)).xy + BA_Fragment_30_CB1((uint)(21)).zw;
  r1.xz = BA_Fragment_30_CB1((uint)(24)).xy * BA_Fragment_30_CB0((uint)(11)).yy + r1.xz;
  r0.xw = r1.xz + r0.xw;
  r0.xw = v3.zw + r0.xw;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xw).xyzw;
  r0.x = v4.w * v4.w;
  r0.x = r2.x * r0.x;
  r0.x = BA_Fragment_30_CB1((uint)(0)).w * r0.x;
  r0.x = BA_Fragment_30_CB1((uint)(27)).x * r0.x;
  r1.w = BA_Fragment_30_CB1((uint)(24)).w * BA_Fragment_30_CB0((uint)(11)).y;
  r1.z = BA_Fragment_30_CB1((uint)(25)).x * BA_Fragment_30_CB0((uint)(11)).y;
  r0.yz = r1.yy * r0.yz + r1.zw;
  r0.yz = v5.xy + r0.yz;
  r1.xy = v1.xy * BA_Fragment_30_CB1((uint)(3)).xy + BA_Fragment_30_CB1((uint)(3)).zw;
  r0.yz = r1.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.x * r0.x);
  r0.y = -BA_Fragment_30_CB1((uint)(27)).y + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  r0.xyz = v4.xyz * r2.xyz;
  r0.xyz = BA_Fragment_30_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_30_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r2.www;
  o0.xyz = r0.xyz * r1.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_31_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_31_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_31_CB1((uint)(25)).wy * BA_Fragment_31_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_31_CB1((uint)(26)).xw * BA_Fragment_31_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_31_CB1((uint)(14)).xy + BA_Fragment_31_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_31_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_31_CB1((uint)(26)).zy + r0.zw;
  r0.zw = r1.yy * r0.zw;
  r1.xy = v1.xy * BA_Fragment_31_CB1((uint)(16)).xy + BA_Fragment_31_CB1((uint)(16)).zw;
  r0.xy = r1.xy + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r2.xyzw = BA_Fragment_31_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r2.xy + r2.zw;
  r2.x = BA_Fragment_31_CB1((uint)(24)).z + r0.x;
  r2.y = BA_Fragment_31_CB1((uint)(25)).z + r0.y;
  r0.xy = r2.xy * r1.xx + r0.zw;
  r0.w = BA_Fragment_31_CB1((uint)(24)).w * BA_Fragment_31_CB0((uint)(11)).y;
  r0.z = BA_Fragment_31_CB1((uint)(25)).x * BA_Fragment_31_CB0((uint)(11)).y;
  r0.xy = r0.xy + r0.zw;
  r0.xy = v5.xy + r0.xy;
  r0.zw = v1.xy * BA_Fragment_31_CB1((uint)(3)).xy + BA_Fragment_31_CB1((uint)(3)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.y = v4.w * v4.w;
  r0.zw = v1.xy * BA_Fragment_31_CB1((uint)(21)).xy + BA_Fragment_31_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_31_CB1((uint)(24)).xy * BA_Fragment_31_CB0((uint)(11)).yy + r0.zw;
  r0.zw = v3.zw + r0.zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r1.x * r0.y;
  r0.y = BA_Fragment_31_CB1((uint)(0)).w * r0.y;
  r0.y = BA_Fragment_31_CB1((uint)(27)).x * r0.y;
  r0.y = saturate(r0.y * r0.x);
  r0.z = -BA_Fragment_31_CB1((uint)(27)).y + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.yzw = v4.xyz * r1.xyz;
  r0.yzw = BA_Fragment_31_CB1((uint)(0)).xyz * r0.yzw;
  r0.yzw = BA_Fragment_31_CB1((uint)(27)).xxx * r0.yzw;
  r0.yzw = r0.yzw * r1.www;
  o0.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_32_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_32_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_32_CB1((uint)(25)).wy * BA_Fragment_32_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_32_CB1((uint)(26)).xw * BA_Fragment_32_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_32_CB1((uint)(14)).xy + BA_Fragment_32_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_32_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_32_CB1((uint)(26)).zy + r0.zw;
  r1.xz = v1.xy * BA_Fragment_32_CB1((uint)(16)).xy + BA_Fragment_32_CB1((uint)(16)).zw;
  r0.xy = r1.xz + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r2.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r3.xyzw = BA_Fragment_32_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r3.xy + r3.zw;
  r3.x = BA_Fragment_32_CB1((uint)(24)).z + r0.x;
  r3.y = BA_Fragment_32_CB1((uint)(25)).z + r0.y;
  r0.xy = r3.xy * r2.xx;
  r0.xy = r1.yy * r0.zw + r0.xy;
  r0.w = BA_Fragment_32_CB1((uint)(24)).w * BA_Fragment_32_CB0((uint)(11)).y;
  r0.z = BA_Fragment_32_CB1((uint)(25)).x * BA_Fragment_32_CB0((uint)(11)).y;
  r0.xy = r0.xy + r0.zw;
  r0.xy = v5.xy + r0.xy;
  r0.zw = v1.xy * BA_Fragment_32_CB1((uint)(3)).xy + BA_Fragment_32_CB1((uint)(3)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.yz = v1.xy * BA_Fragment_32_CB1((uint)(21)).xy + BA_Fragment_32_CB1((uint)(21)).zw;
  r0.yz = BA_Fragment_32_CB1((uint)(24)).xy * BA_Fragment_32_CB0((uint)(11)).yy + r0.yz;
  r0.yz = r3.xy * r2.xx + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.y = v4.w * v4.w;
  r0.y = r1.x * r0.y;
  r0.y = BA_Fragment_32_CB1((uint)(0)).w * r0.y;
  r0.y = BA_Fragment_32_CB1((uint)(27)).x * r0.y;
  r0.y = saturate(r0.y * r0.x);
  r0.z = -BA_Fragment_32_CB1((uint)(27)).y + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.yzw = v4.xyz * r1.xyz;
  r0.yzw = BA_Fragment_32_CB1((uint)(0)).xyz * r0.yzw;
  r0.yzw = BA_Fragment_32_CB1((uint)(27)).xxx * r0.yzw;
  r0.yzw = r0.yzw * r1.www;
  o0.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_33_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_33_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_33_CB1((uint)(16)).xy + BA_Fragment_33_CB1((uint)(16)).zw;
  r1.xz = BA_Fragment_33_CB1((uint)(25)).wy * BA_Fragment_33_CB0((uint)(11)).yy;
  r1.yw = BA_Fragment_33_CB1((uint)(26)).xw * BA_Fragment_33_CB0((uint)(11)).yy;
  r1.xyzw = frac(r1.xyzw);
  r0.xy = r1.xy + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.yz = v1.xy * BA_Fragment_33_CB1((uint)(14)).xy + BA_Fragment_33_CB1((uint)(14)).zw;
  r0.yz = r0.yz + r1.zw;
  r0.yz = v3.xy + r0.yz;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.yz).xyzw;
  r2.xyzw = BA_Fragment_33_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.yz = r2.xy + r2.zw;
  r0.yz = BA_Fragment_33_CB1((uint)(26)).zy + r0.yz;
  r1.xz = r1.yy * r0.yz;
  r2.xyzw = BA_Fragment_33_CB1((uint)(23)).xyzw * v2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r3.x = BA_Fragment_33_CB1((uint)(24)).z + r2.x;
  r3.y = BA_Fragment_33_CB1((uint)(25)).z + r2.y;
  r0.xw = r3.xy * r0.xx + r1.xz;
  r1.w = BA_Fragment_33_CB1((uint)(24)).w * BA_Fragment_33_CB0((uint)(11)).y;
  r1.z = BA_Fragment_33_CB1((uint)(25)).x * BA_Fragment_33_CB0((uint)(11)).y;
  r0.xw = r1.zw + r0.xw;
  r0.xw = v5.xy + r0.xw;
  r1.xz = v1.xy * BA_Fragment_33_CB1((uint)(3)).xy + BA_Fragment_33_CB1((uint)(3)).zw;
  r0.xw = r1.xz + r0.xw;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xw).xyzw;
  r0.xw = v1.xy * BA_Fragment_33_CB1((uint)(21)).xy + BA_Fragment_33_CB1((uint)(21)).zw;
  r0.xw = BA_Fragment_33_CB1((uint)(24)).xy * BA_Fragment_33_CB0((uint)(11)).yy + r0.xw;
  r0.xy = r1.yy * r0.yz + r0.xw;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.x = v4.w * v4.w;
  r1.x = r1.x * r0.x;
  r1.x = BA_Fragment_33_CB1((uint)(0)).w * r1.x;
  r1.x = BA_Fragment_33_CB1((uint)(27)).x * r1.x;
  r1.x = saturate(r1.x * r2.x);
  r1.y = -BA_Fragment_33_CB1((uint)(27)).y + r1.x;
  o0.w = r1.x;
  r1.x = cmp(r1.y < 0);
  if (r1.x != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_33_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_33_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  o0.xyz = r0.xyz * r2.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_34_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_34_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_34_CB1((uint)(25)).wy * BA_Fragment_34_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_34_CB1((uint)(26)).xw * BA_Fragment_34_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_34_CB1((uint)(14)).xy + BA_Fragment_34_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_34_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_34_CB1((uint)(26)).zy + r0.zw;
  r0.zw = r1.yy * r0.zw;
  r1.xy = v1.xy * BA_Fragment_34_CB1((uint)(16)).xy + BA_Fragment_34_CB1((uint)(16)).zw;
  r0.xy = r1.xy + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r2.xyzw = BA_Fragment_34_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r2.xy + r2.zw;
  r2.x = BA_Fragment_34_CB1((uint)(24)).z + r0.x;
  r2.y = BA_Fragment_34_CB1((uint)(25)).z + r0.y;
  r0.xy = r2.xy * r1.xx + r0.zw;
  r0.w = BA_Fragment_34_CB1((uint)(24)).w * BA_Fragment_34_CB0((uint)(11)).y;
  r0.z = BA_Fragment_34_CB1((uint)(25)).x * BA_Fragment_34_CB0((uint)(11)).y;
  r0.zw = r0.xy + r0.zw;
  r0.zw = v5.xy + r0.zw;
  r1.xy = v1.xy * BA_Fragment_34_CB1((uint)(3)).xy + BA_Fragment_34_CB1((uint)(3)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.zw = v1.xy * BA_Fragment_34_CB1((uint)(21)).xy + BA_Fragment_34_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_34_CB1((uint)(24)).xy * BA_Fragment_34_CB0((uint)(11)).yy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.y = v4.w * v4.w;
  r1.y = r1.y * r0.x;
  r1.y = BA_Fragment_34_CB1((uint)(0)).w * r1.y;
  r1.y = BA_Fragment_34_CB1((uint)(27)).x * r1.y;
  r1.y = saturate(r1.y * r1.x);
  r1.z = -BA_Fragment_34_CB1((uint)(27)).y + r1.y;
  o0.w = r1.y;
  r1.y = cmp(r1.z < 0);
  if (r1.y != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_34_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_34_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  o0.xyz = r0.xyz * r1.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_35_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_35_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_35_CB1((uint)(25)).wy * BA_Fragment_35_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_35_CB1((uint)(26)).xw * BA_Fragment_35_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_35_CB1((uint)(14)).xy + BA_Fragment_35_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_35_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_35_CB1((uint)(26)).zy + r0.zw;
  r0.zw = r1.yy * r0.zw;
  r1.xy = v1.xy * BA_Fragment_35_CB1((uint)(16)).xy + BA_Fragment_35_CB1((uint)(16)).zw;
  r0.xy = r1.xy + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r2.xyzw = BA_Fragment_35_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r2.xy + r2.zw;
  r2.x = BA_Fragment_35_CB1((uint)(24)).z + r0.x;
  r2.y = BA_Fragment_35_CB1((uint)(25)).z + r0.y;
  r0.xy = r2.xy * r1.xx + r0.zw;
  r0.zw = v1.xy * BA_Fragment_35_CB1((uint)(21)).xy + BA_Fragment_35_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_35_CB1((uint)(24)).xy * BA_Fragment_35_CB0((uint)(11)).yy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.x = v4.w * v4.w;
  r1.x = r1.x * r0.w;
  r1.x = BA_Fragment_35_CB1((uint)(0)).w * r1.x;
  r1.x = BA_Fragment_35_CB1((uint)(27)).x * r1.x;
  r1.w = BA_Fragment_35_CB1((uint)(24)).w * BA_Fragment_35_CB0((uint)(11)).y;
  r1.z = BA_Fragment_35_CB1((uint)(25)).x * BA_Fragment_35_CB0((uint)(11)).y;
  r1.yz = v5.xy + r1.zw;
  r2.xy = v1.xy * BA_Fragment_35_CB1((uint)(3)).xy + BA_Fragment_35_CB1((uint)(3)).zw;
  r1.yz = r2.xy + r1.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r1.yz).xyzw;
  r1.x = saturate(r2.x * r1.x);
  r1.y = -BA_Fragment_35_CB1((uint)(27)).y + r1.x;
  o0.w = r1.x;
  r1.x = cmp(r1.y < 0);
  if (r1.x != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_35_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_35_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  o0.xyz = r0.xyz * r2.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_36_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, 0.0, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, 0.0, 0.0, 0.0);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_36_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_36_CB1((uint)(16)).xy + BA_Fragment_36_CB1((uint)(16)).zw;
  r1.y = BA_Fragment_36_CB1((uint)(26)).x * BA_Fragment_36_CB0((uint)(11)).y;
  r1.xz = BA_Fragment_36_CB1((uint)(25)).wx * BA_Fragment_36_CB0((uint)(11)).yy;
  r0.zw = frac(r1.xy);
  r0.xy = r0.xy + r0.zw;
  r0.xy = v1.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r1.w = BA_Fragment_36_CB1((uint)(24)).w * BA_Fragment_36_CB0((uint)(11)).y;
  r2.xyzw = BA_Fragment_36_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.yz = r2.xy + r2.zw;
  r1.x = BA_Fragment_36_CB1((uint)(24)).z + r0.y;
  r1.y = BA_Fragment_36_CB1((uint)(25)).z + r0.z;
  r0.yz = r1.xy * r0.xx + r1.zw;
  r0.yz = v5.xy + r0.yz;
  r1.zw = v1.xy * BA_Fragment_36_CB1((uint)(3)).xy + BA_Fragment_36_CB1((uint)(3)).zw;
  r0.yz = r1.zw + r0.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.yz = v1.xy * BA_Fragment_36_CB1((uint)(21)).xy + BA_Fragment_36_CB1((uint)(21)).zw;
  r0.yz = BA_Fragment_36_CB1((uint)(24)).xy * BA_Fragment_36_CB0((uint)(11)).yy + r0.yz;
  r0.xy = r1.xy * r0.xx + r0.yz;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.x = v4.w * v4.w;
  r1.x = r1.x * r0.w;
  r1.x = BA_Fragment_36_CB1((uint)(0)).w * r1.x;
  r1.x = BA_Fragment_36_CB1((uint)(27)).x * r1.x;
  r1.x = saturate(r1.x * r2.x);
  r1.y = -BA_Fragment_36_CB1((uint)(27)).y + r1.x;
  o0.w = r1.x;
  r1.x = cmp(r1.y < 0);
  if (r1.x != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_36_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_36_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  o0.xyz = r0.xyz * r2.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_37_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_37_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_37_CB1((uint)(25)).wy * BA_Fragment_37_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_37_CB1((uint)(26)).xw * BA_Fragment_37_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_37_CB1((uint)(14)).xy + BA_Fragment_37_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_37_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_37_CB1((uint)(26)).zy + r0.zw;
  r1.xz = v1.xy * BA_Fragment_37_CB1((uint)(16)).xy + BA_Fragment_37_CB1((uint)(16)).zw;
  r0.xy = r1.xz + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r2.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r3.xyzw = BA_Fragment_37_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r3.xy + r3.zw;
  r3.x = BA_Fragment_37_CB1((uint)(24)).z + r0.x;
  r3.y = BA_Fragment_37_CB1((uint)(25)).z + r0.y;
  r0.xy = r3.xy * r2.xx;
  r0.xy = r1.yy * r0.zw + r0.xy;
  r0.zw = v1.xy * BA_Fragment_37_CB1((uint)(21)).xy + BA_Fragment_37_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_37_CB1((uint)(24)).xy * BA_Fragment_37_CB0((uint)(11)).yy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.x = v4.w * v4.w;
  r1.x = r1.x * r0.w;
  r1.x = BA_Fragment_37_CB1((uint)(0)).w * r1.x;
  r1.x = BA_Fragment_37_CB1((uint)(27)).x * r1.x;
  r1.w = BA_Fragment_37_CB1((uint)(24)).w * BA_Fragment_37_CB0((uint)(11)).y;
  r1.z = BA_Fragment_37_CB1((uint)(25)).x * BA_Fragment_37_CB0((uint)(11)).y;
  r1.yz = r3.xy * r2.xx + r1.zw;
  r1.yz = v5.xy + r1.yz;
  r2.xy = v1.xy * BA_Fragment_37_CB1((uint)(3)).xy + BA_Fragment_37_CB1((uint)(3)).zw;
  r1.yz = r2.xy + r1.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r1.yz).xyzw;
  r1.x = saturate(r2.x * r1.x);
  r1.y = -BA_Fragment_37_CB1((uint)(27)).y + r1.x;
  o0.w = r1.x;
  r1.x = cmp(r1.y < 0);
  if (r1.x != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_37_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_37_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  o0.xyz = r0.xyz * r2.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_38_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_38_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_38_CB1((uint)(25)).wy * BA_Fragment_38_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_38_CB1((uint)(26)).xw * BA_Fragment_38_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_38_CB1((uint)(14)).xy + BA_Fragment_38_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_38_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_38_CB1((uint)(26)).zy + r0.zw;
  r0.zw = r1.yy * r0.zw;
  r1.xy = v1.xy * BA_Fragment_38_CB1((uint)(16)).xy + BA_Fragment_38_CB1((uint)(16)).zw;
  r0.xy = r1.xy + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r2.xyzw = BA_Fragment_38_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r2.xy + r2.zw;
  r2.x = BA_Fragment_38_CB1((uint)(24)).z + r0.x;
  r2.y = BA_Fragment_38_CB1((uint)(25)).z + r0.y;
  r0.xy = r2.xy * r1.xx + r0.zw;
  r0.w = BA_Fragment_38_CB1((uint)(24)).w * BA_Fragment_38_CB0((uint)(11)).y;
  r0.z = BA_Fragment_38_CB1((uint)(25)).x * BA_Fragment_38_CB0((uint)(11)).y;
  r0.xy = r0.xy + r0.zw;
  r0.xy = v5.xy + r0.xy;
  r0.zw = v1.xy * BA_Fragment_38_CB1((uint)(3)).xy + BA_Fragment_38_CB1((uint)(3)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.y = v4.w * v4.w;
  r0.zw = v1.xy * BA_Fragment_38_CB1((uint)(21)).xy + BA_Fragment_38_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_38_CB1((uint)(24)).xy * BA_Fragment_38_CB0((uint)(11)).yy + r0.zw;
  r0.zw = v3.zw + r0.zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r1.w * r0.y;
  r0.y = BA_Fragment_38_CB1((uint)(0)).w * r0.y;
  r0.y = BA_Fragment_38_CB1((uint)(27)).x * r0.y;
  r0.y = saturate(r0.y * r0.x);
  r0.z = -BA_Fragment_38_CB1((uint)(27)).y + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.yzw = v4.xyz * r1.xyz;
  r0.yzw = BA_Fragment_38_CB1((uint)(0)).xyz * r0.yzw;
  r0.yzw = BA_Fragment_38_CB1((uint)(27)).xxx * r0.yzw;
  r0.yzw = r0.yzw * r1.www;
  o0.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_39_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_39_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_39_CB1((uint)(25)).wy * BA_Fragment_39_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_39_CB1((uint)(26)).xw * BA_Fragment_39_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_39_CB1((uint)(14)).xy + BA_Fragment_39_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_39_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_39_CB1((uint)(26)).zy + r0.zw;
  r0.zw = r1.yy * r0.zw;
  r1.xy = v1.xy * BA_Fragment_39_CB1((uint)(16)).xy + BA_Fragment_39_CB1((uint)(16)).zw;
  r0.xy = r1.xy + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r2.xyzw = BA_Fragment_39_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r2.xy + r2.zw;
  r2.x = BA_Fragment_39_CB1((uint)(24)).z + r0.x;
  r2.y = BA_Fragment_39_CB1((uint)(25)).z + r0.y;
  r0.xy = r2.xy * r1.xx + r0.zw;
  r0.w = BA_Fragment_39_CB1((uint)(24)).w * BA_Fragment_39_CB0((uint)(11)).y;
  r0.z = BA_Fragment_39_CB1((uint)(25)).x * BA_Fragment_39_CB0((uint)(11)).y;
  r0.zw = r0.xy + r0.zw;
  r0.zw = v5.xy + r0.zw;
  r1.xy = v1.xy * BA_Fragment_39_CB1((uint)(3)).xy + BA_Fragment_39_CB1((uint)(3)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.zw = v1.xy * BA_Fragment_39_CB1((uint)(21)).xy + BA_Fragment_39_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_39_CB1((uint)(24)).xy * BA_Fragment_39_CB0((uint)(11)).yy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.y = v4.w * v4.w;
  r1.y = r1.y * r0.w;
  r1.y = BA_Fragment_39_CB1((uint)(0)).w * r1.y;
  r1.y = BA_Fragment_39_CB1((uint)(27)).x * r1.y;
  r1.y = saturate(r1.y * r1.x);
  r1.z = -BA_Fragment_39_CB1((uint)(27)).y + r1.y;
  o0.w = r1.y;
  r1.y = cmp(r1.z < 0);
  if (r1.y != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_39_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_39_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  o0.xyz = r0.xyz * r1.xxx;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_40_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_40_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_40_CB1((uint)(25)).wy * BA_Fragment_40_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_40_CB1((uint)(26)).xw * BA_Fragment_40_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_40_CB1((uint)(14)).xy + BA_Fragment_40_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_40_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_40_CB1((uint)(26)).zy + r0.zw;
  r1.w = BA_Fragment_40_CB1((uint)(24)).w * BA_Fragment_40_CB0((uint)(11)).y;
  r1.z = BA_Fragment_40_CB1((uint)(25)).x * BA_Fragment_40_CB0((uint)(11)).y;
  r0.zw = r1.yy * r0.zw + r1.zw;
  r0.zw = v5.xy + r0.zw;
  r1.xy = v1.xy * BA_Fragment_40_CB1((uint)(3)).xy + BA_Fragment_40_CB1((uint)(3)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.zw = v1.xy * BA_Fragment_40_CB1((uint)(16)).xy + BA_Fragment_40_CB1((uint)(16)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.yz = v1.xy * BA_Fragment_40_CB1((uint)(21)).xy + BA_Fragment_40_CB1((uint)(21)).zw;
  r0.yz = BA_Fragment_40_CB1((uint)(24)).xy * BA_Fragment_40_CB0((uint)(11)).yy + r0.yz;
  r2.xyzw = BA_Fragment_40_CB1((uint)(23)).xyzw * v2.xyzw;
  r1.yz = r2.xy + r2.zw;
  r2.x = BA_Fragment_40_CB1((uint)(24)).z + r1.y;
  r2.y = BA_Fragment_40_CB1((uint)(25)).z + r1.z;
  r0.xy = r2.xy * r0.xx + r0.yz;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.y = v4.w * v4.w;
  r1.y = r1.y * r0.x;
  r1.y = BA_Fragment_40_CB1((uint)(0)).w * r1.y;
  r1.y = BA_Fragment_40_CB1((uint)(27)).x * r1.y;
  r1.y = saturate(r1.y * r1.x);
  r1.z = -BA_Fragment_40_CB1((uint)(27)).y + r1.y;
  r1.z = cmp(r1.z < 0);
  if (r1.z != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_40_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_40_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx;
  o0.xyz = r0.xyz * r1.yyy;
  o0.w = r1.y;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_41_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_41_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_41_CB1((uint)(25)).wy * BA_Fragment_41_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_41_CB1((uint)(26)).xw * BA_Fragment_41_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_41_CB1((uint)(14)).xy + BA_Fragment_41_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_41_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_41_CB1((uint)(26)).zy + r0.zw;
  r0.zw = r1.yy * r0.zw;
  r1.xy = v1.xy * BA_Fragment_41_CB1((uint)(16)).xy + BA_Fragment_41_CB1((uint)(16)).zw;
  r0.xy = r1.xy + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r2.xyzw = BA_Fragment_41_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r2.xy + r2.zw;
  r2.x = BA_Fragment_41_CB1((uint)(24)).z + r0.x;
  r2.y = BA_Fragment_41_CB1((uint)(25)).z + r0.y;
  r0.xy = r2.xy * r1.xx + r0.zw;
  r0.w = BA_Fragment_41_CB1((uint)(24)).w * BA_Fragment_41_CB0((uint)(11)).y;
  r0.z = BA_Fragment_41_CB1((uint)(25)).x * BA_Fragment_41_CB0((uint)(11)).y;
  r0.zw = r0.xy + r0.zw;
  r0.zw = v5.xy + r0.zw;
  r1.xy = v1.xy * BA_Fragment_41_CB1((uint)(3)).xy + BA_Fragment_41_CB1((uint)(3)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.zw = v1.xy * BA_Fragment_41_CB1((uint)(21)).xy + BA_Fragment_41_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_41_CB1((uint)(24)).xy * BA_Fragment_41_CB0((uint)(11)).yy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.y = v4.w * v4.w;
  r1.y = r1.y * r0.x;
  r1.y = BA_Fragment_41_CB1((uint)(0)).w * r1.y;
  r1.y = BA_Fragment_41_CB1((uint)(27)).x * r1.y;
  r1.y = saturate(r1.y * r1.x);
  r1.z = -BA_Fragment_41_CB1((uint)(27)).y + r1.y;
  r1.z = cmp(r1.z < 0);
  if (r1.z != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_41_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_41_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx;
  o0.xyz = r0.xyz * r1.yyy;
  o0.w = r1.y;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_42_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_42_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_42_CB1((uint)(25)).wy * BA_Fragment_42_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_42_CB1((uint)(26)).xw * BA_Fragment_42_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_42_CB1((uint)(14)).xy + BA_Fragment_42_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_42_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_42_CB1((uint)(26)).zy + r0.zw;
  r1.xz = v1.xy * BA_Fragment_42_CB1((uint)(16)).xy + BA_Fragment_42_CB1((uint)(16)).zw;
  r0.xy = r1.xz + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r2.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r3.xyzw = BA_Fragment_42_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r3.xy + r3.zw;
  r3.x = BA_Fragment_42_CB1((uint)(24)).z + r0.x;
  r3.y = BA_Fragment_42_CB1((uint)(25)).z + r0.y;
  r0.xy = r3.xy * r2.xx;
  r0.xy = r1.yy * r0.zw + r0.xy;
  r0.zw = v1.xy * BA_Fragment_42_CB1((uint)(21)).xy + BA_Fragment_42_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_42_CB1((uint)(24)).xy * BA_Fragment_42_CB0((uint)(11)).yy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.x = v4.w * v4.w;
  r1.x = r1.x * r0.w;
  r1.x = BA_Fragment_42_CB1((uint)(0)).w * r1.x;
  r1.x = BA_Fragment_42_CB1((uint)(27)).x * r1.x;
  r1.w = BA_Fragment_42_CB1((uint)(24)).w * BA_Fragment_42_CB0((uint)(11)).y;
  r1.z = BA_Fragment_42_CB1((uint)(25)).x * BA_Fragment_42_CB0((uint)(11)).y;
  r1.yz = r3.xy * r2.xx + r1.zw;
  r1.yz = v5.xy + r1.yz;
  r2.xy = v1.xy * BA_Fragment_42_CB1((uint)(3)).xy + BA_Fragment_42_CB1((uint)(3)).zw;
  r1.yz = r2.xy + r1.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r1.yz).xyzw;
  r1.x = saturate(r2.x * r1.x);
  r1.y = -BA_Fragment_42_CB1((uint)(27)).y + r1.x;
  r1.y = cmp(r1.y < 0);
  if (r1.y != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_42_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_42_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * r2.xxx;
  o0.xyz = r0.xyz * r1.xxx;
  o0.w = r1.x;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && !defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_43_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_43_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_43_CB1((uint)(25)).wy * BA_Fragment_43_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_43_CB1((uint)(26)).xw * BA_Fragment_43_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_43_CB1((uint)(14)).xy + BA_Fragment_43_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_43_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_43_CB1((uint)(26)).zy + r0.zw;
  r1.w = BA_Fragment_43_CB1((uint)(24)).w * BA_Fragment_43_CB0((uint)(11)).y;
  r1.z = BA_Fragment_43_CB1((uint)(25)).x * BA_Fragment_43_CB0((uint)(11)).y;
  r0.zw = r1.yy * r0.zw + r1.zw;
  r0.zw = v5.xy + r0.zw;
  r1.xy = v1.xy * BA_Fragment_43_CB1((uint)(3)).xy + BA_Fragment_43_CB1((uint)(3)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.zw = v1.xy * BA_Fragment_43_CB1((uint)(16)).xy + BA_Fragment_43_CB1((uint)(16)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.yz = v1.xy * BA_Fragment_43_CB1((uint)(21)).xy + BA_Fragment_43_CB1((uint)(21)).zw;
  r0.yz = BA_Fragment_43_CB1((uint)(24)).xy * BA_Fragment_43_CB0((uint)(11)).yy + r0.yz;
  r2.xyzw = BA_Fragment_43_CB1((uint)(23)).xyzw * v2.xyzw;
  r1.yz = r2.xy + r2.zw;
  r2.x = BA_Fragment_43_CB1((uint)(24)).z + r1.y;
  r2.y = BA_Fragment_43_CB1((uint)(25)).z + r1.z;
  r0.xy = r2.xy * r0.xx + r0.yz;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.y = v4.w * v4.w;
  r1.y = r1.y * r0.w;
  r1.y = BA_Fragment_43_CB1((uint)(0)).w * r1.y;
  r1.y = BA_Fragment_43_CB1((uint)(27)).x * r1.y;
  r1.y = saturate(r1.y * r1.x);
  r1.z = -BA_Fragment_43_CB1((uint)(27)).y + r1.y;
  r1.z = cmp(r1.z < 0);
  if (r1.z != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_43_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_43_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx;
  o0.xyz = r0.xyz * r1.yyy;
  o0.w = r1.y;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_44_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_44_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_44_CB1((uint)(25)).wy * BA_Fragment_44_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_44_CB1((uint)(26)).xw * BA_Fragment_44_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_44_CB1((uint)(14)).xy + BA_Fragment_44_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_44_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_44_CB1((uint)(26)).zy + r0.zw;
  r0.zw = r1.yy * r0.zw;
  r1.xy = v1.xy * BA_Fragment_44_CB1((uint)(16)).xy + BA_Fragment_44_CB1((uint)(16)).zw;
  r0.xy = r1.xy + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r2.xyzw = BA_Fragment_44_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r2.xy + r2.zw;
  r2.x = BA_Fragment_44_CB1((uint)(24)).z + r0.x;
  r2.y = BA_Fragment_44_CB1((uint)(25)).z + r0.y;
  r0.xy = r2.xy * r1.xx + r0.zw;
  r0.w = BA_Fragment_44_CB1((uint)(24)).w * BA_Fragment_44_CB0((uint)(11)).y;
  r0.z = BA_Fragment_44_CB1((uint)(25)).x * BA_Fragment_44_CB0((uint)(11)).y;
  r0.xy = r0.xy + r0.zw;
  r0.xy = v5.xy + r0.xy;
  r0.zw = v1.xy * BA_Fragment_44_CB1((uint)(3)).xy + BA_Fragment_44_CB1((uint)(3)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.y = v4.w * v4.w;
  r0.zw = v1.xy * BA_Fragment_44_CB1((uint)(21)).xy + BA_Fragment_44_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_44_CB1((uint)(24)).xy * BA_Fragment_44_CB0((uint)(11)).yy + r0.zw;
  r0.zw = v3.zw + r0.zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r1.w * r0.y;
  r0.y = BA_Fragment_44_CB1((uint)(0)).w * r0.y;
  r0.y = BA_Fragment_44_CB1((uint)(27)).x * r0.y;
  r0.y = saturate(r0.y * r0.x);
  r0.z = -BA_Fragment_44_CB1((uint)(27)).y + r0.y;
  r0.z = cmp(r0.z < 0);
  if (r0.z != 0) discard;
  r1.xyz = v4.xyz * r1.xyz;
  r1.xyz = BA_Fragment_44_CB1((uint)(0)).xyz * r1.xyz;
  r1.xyz = BA_Fragment_44_CB1((uint)(27)).xxx * r1.xyz;
  r1.xyz = r1.xyz * r1.www;
  r0.xzw = r1.xyz * r0.xxx;
  o0.xyz = r0.xzw * r0.yyy;
  o0.w = r0.y;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MAIN_DISTORT_RG) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R) && defined(_TEX_MASK_DISTORT_RG)
float4 BA_Fragment_45_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 9u) value = float4(_CustomData_DistortPowerG_CD2XYXY.x, _CustomData_DistortPowerG_CD2XYXY.y, _CustomData_DistortPowerG_CD2XYXY.z, _CustomData_DistortPowerG_CD2XYXY.w);
  if (i == 14u) value = float4(_GTilingxyOffsetzw.x, _GTilingxyOffsetzw.y, _GTilingxyOffsetzw.z, _GTilingxyOffsetzw.w);
  if (i == 16u) value = float4(_RTilingxyOffsetzw.x, _RTilingxyOffsetzw.y, _RTilingxyOffsetzw.z, _RTilingxyOffsetzw.w);
  if (i == 21u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 23u) value = float4(_CustomData_DistortPowerR_CD2XYXY.x, _CustomData_DistortPowerR_CD2XYXY.y, _CustomData_DistortPowerR_CD2XYXY.z, _CustomData_DistortPowerR_CD2XYXY.w);
  if (i == 24u) value = float4(_Main_Speed_X, _Main_Speed_Y, _RDistort_Power_X, _Mask_Speed_Y);
  if (i == 25u) value = float4(_Mask_Speed_X, _GDistort_Speed_X, _RDistort_Power_Y, _RDistort_Speed_X);
  if (i == 26u) value = float4(_RDistort_Speed_Y, _GDistort_Power_Y, _GDistort_Power_X, _GDistort_Speed_Y);
  if (i == 27u) value = float4(_Multiply, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_45_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xz = BA_Fragment_45_CB1((uint)(25)).wy * BA_Fragment_45_CB0((uint)(11)).yy;
  r0.yw = BA_Fragment_45_CB1((uint)(26)).xw * BA_Fragment_45_CB0((uint)(11)).yy;
  r0.xyzw = frac(r0.xyzw);
  r1.xy = v1.xy * BA_Fragment_45_CB1((uint)(14)).xy + BA_Fragment_45_CB1((uint)(14)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r2.xyzw = BA_Fragment_45_CB1((uint)(9)).xyzw * v2.xyzw;
  r0.zw = r2.xy + r2.zw;
  r0.zw = BA_Fragment_45_CB1((uint)(26)).zy + r0.zw;
  r0.zw = r1.yy * r0.zw;
  r1.xy = v1.xy * BA_Fragment_45_CB1((uint)(16)).xy + BA_Fragment_45_CB1((uint)(16)).zw;
  r0.xy = r1.xy + r0.xy;
  r0.xy = v1.zw + r0.xy;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r2.xyzw = BA_Fragment_45_CB1((uint)(23)).xyzw * v2.xyzw;
  r0.xy = r2.xy + r2.zw;
  r2.x = BA_Fragment_45_CB1((uint)(24)).z + r0.x;
  r2.y = BA_Fragment_45_CB1((uint)(25)).z + r0.y;
  r0.xy = r2.xy * r1.xx + r0.zw;
  r0.w = BA_Fragment_45_CB1((uint)(24)).w * BA_Fragment_45_CB0((uint)(11)).y;
  r0.z = BA_Fragment_45_CB1((uint)(25)).x * BA_Fragment_45_CB0((uint)(11)).y;
  r0.zw = r0.xy + r0.zw;
  r0.zw = v5.xy + r0.zw;
  r1.xy = v1.xy * BA_Fragment_45_CB1((uint)(3)).xy + BA_Fragment_45_CB1((uint)(3)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.zw = v1.xy * BA_Fragment_45_CB1((uint)(21)).xy + BA_Fragment_45_CB1((uint)(21)).zw;
  r0.zw = BA_Fragment_45_CB1((uint)(24)).xy * BA_Fragment_45_CB0((uint)(11)).yy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.y = v4.w * v4.w;
  r1.y = r1.y * r0.w;
  r1.y = BA_Fragment_45_CB1((uint)(0)).w * r1.y;
  r1.y = BA_Fragment_45_CB1((uint)(27)).x * r1.y;
  r1.y = saturate(r1.y * r1.x);
  r1.z = -BA_Fragment_45_CB1((uint)(27)).y + r1.y;
  r1.z = cmp(r1.z < 0);
  if (r1.z != 0) discard;
  r0.xyz = v4.xyz * r0.xyz;
  r0.xyz = BA_Fragment_45_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_45_CB1((uint)(27)).xxx * r0.xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx;
  o0.xyz = r0.xyz * r1.yyy;
  o0.w = r1.y;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Frag(out float4 color : SV_TARGET0) { color = float4(1,0,1,1); }
#endif
