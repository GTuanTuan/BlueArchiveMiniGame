// Exact names and types from the original compiled parameter metadata.
float _Alphaclip_Value;
float4 _Color;
float4 _CustomData_DistortOffset_CD1XYXY;
float4 _CustomData_DistortOffset_CD2XYXY;
float4 _CustomData_DistortPower_CD2XYXY;
float4 _CustomData_DistortTiling_CD1XYXY;
float4 _CustomData_DistortTiling_CD2XYXY;
float4 _CustomData_MainOffset_CD1XYXY;
float4 _CustomData_MainOffset_CD2XYXY;
float4 _CustomData_MainTiling_CD1XYXY;
float4 _CustomData_MainTiling_CD2XYXY;
float4 _CustomData_MaskOffset_CD1XYXY;
float4 _CustomData_MaskOffset_CD2XYXY;
float4 _CustomData_MaskTiling_CD1XYXY;
float4 _CustomData_MaskTiling_CD2XYXY;
float4 _CustomData_StepValue_CD1XYXY;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Distortion_Power_X;
float _Distortion_Power_Y;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mask_Speed_X;
float _Mask_Speed_Y;
float _Multiply;
float _Step_Power;
float _Step_Vertex_Alpha_Use;
float4 _Tex_Distort_ST;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
float4 _UV_Add_TilingOffset;
float _UV_Add_Use;
Texture2D<float4> _Tex_Distort;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
SamplerState sampler_Tex_Distort;
SamplerState sampler_Tex_Main;
SamplerState sampler_Tex_Mask;
#ifndef cmp
#define cmp -
#endif

#if !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_1_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_1_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_1_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_1_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_1_CB2((uint)(13)).xyxy + BA_Vertex_1_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_1_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_1_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_1_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_1_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_1_CB2((uint)(5)).xyxy + BA_Vertex_1_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_1_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_1_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_1_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_1_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_1_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_1_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_1_CB2((uint)(4)).xyxy + BA_Vertex_1_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_1_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_1_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_1_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_1_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_1_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_2_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_2_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_2_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_2_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_2_CB2((uint)(13)).xyxy + BA_Vertex_2_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_2_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_2_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_2_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_2_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_2_CB2((uint)(5)).xyxy + BA_Vertex_2_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_2_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_2_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_2_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_2_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_2_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_2_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_2_CB2((uint)(4)).xyxy + BA_Vertex_2_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_2_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_2_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_2_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_2_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_2_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_3_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_3_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_3_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_3_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_3_CB2((uint)(13)).xyxy + BA_Vertex_3_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_3_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_3_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_3_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_3_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_3_CB2((uint)(5)).xyxy + BA_Vertex_3_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_3_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_3_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_3_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_3_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_3_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_3_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_3_CB2((uint)(4)).xyxy + BA_Vertex_3_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_3_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_3_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_3_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_3_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_3_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_4_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_4_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_4_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_4_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_4_CB2((uint)(13)).xyxy + BA_Vertex_4_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_4_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_4_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_4_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_4_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_4_CB2((uint)(5)).xyxy + BA_Vertex_4_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_4_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_4_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_4_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_4_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_4_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_4_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_4_CB2((uint)(4)).xyxy + BA_Vertex_4_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_4_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_4_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_4_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_4_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_4_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_5_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_5_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_5_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_5_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_5_CB2((uint)(13)).xyxy + BA_Vertex_5_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_5_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_5_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_5_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_5_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_5_CB2((uint)(5)).xyxy + BA_Vertex_5_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_5_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_5_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_5_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_5_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_5_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_5_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_5_CB2((uint)(4)).xyxy + BA_Vertex_5_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_5_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_5_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_5_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_5_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_5_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_6_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_6_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_6_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_6_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_6_CB2((uint)(13)).xyxy + BA_Vertex_6_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_6_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_6_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_6_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_6_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_6_CB2((uint)(5)).xyxy + BA_Vertex_6_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_6_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_6_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_6_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_6_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_6_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_6_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_6_CB2((uint)(4)).xyxy + BA_Vertex_6_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_6_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_6_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_6_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_6_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_6_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_7_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_7_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_7_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_7_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_7_CB2((uint)(13)).xyxy + BA_Vertex_7_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_7_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_7_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_7_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_7_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_7_CB2((uint)(5)).xyxy + BA_Vertex_7_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_7_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_7_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_7_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_7_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_7_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_7_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_7_CB2((uint)(4)).xyxy + BA_Vertex_7_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_7_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_7_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_7_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_7_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_7_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_8_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_8_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_8_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_8_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_8_CB2((uint)(13)).xyxy + BA_Vertex_8_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_8_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_8_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_8_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_8_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_8_CB2((uint)(5)).xyxy + BA_Vertex_8_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_8_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_8_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_8_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_8_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_8_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_8_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_8_CB2((uint)(4)).xyxy + BA_Vertex_8_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_8_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_8_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_8_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_8_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_8_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_9_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_9_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_9_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_9_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_9_CB2((uint)(13)).xyxy + BA_Vertex_9_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_9_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_9_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_9_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_9_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_9_CB2((uint)(5)).xyxy + BA_Vertex_9_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_9_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_9_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_9_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_9_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_9_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_9_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_9_CB2((uint)(4)).xyxy + BA_Vertex_9_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_9_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_9_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_9_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_9_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_9_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_10_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_10_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_10_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_10_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_10_CB2((uint)(13)).xyxy + BA_Vertex_10_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_10_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_10_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_10_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_10_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_10_CB2((uint)(5)).xyxy + BA_Vertex_10_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_10_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_10_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_10_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_10_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_10_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_10_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_10_CB2((uint)(4)).xyxy + BA_Vertex_10_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_10_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_10_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_10_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_10_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_10_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_11_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_11_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_11_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_11_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_11_CB2((uint)(13)).xyxy + BA_Vertex_11_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_11_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_11_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_11_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_11_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_11_CB2((uint)(5)).xyxy + BA_Vertex_11_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_11_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_11_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_11_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_11_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_11_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_11_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_11_CB2((uint)(4)).xyxy + BA_Vertex_11_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_11_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_11_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_11_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_11_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_11_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_12_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_12_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_12_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_12_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_12_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_12_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_12_CB2((uint)(13)).xyxy + BA_Vertex_12_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_12_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_12_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_12_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_12_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_12_CB2((uint)(5)).xyxy + BA_Vertex_12_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_12_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_12_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_12_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_12_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_12_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_12_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_12_CB2((uint)(4)).xyxy + BA_Vertex_12_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_12_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_12_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_12_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_12_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_12_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_13_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_13_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_13_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_13_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_13_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_13_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_13_CB2((uint)(13)).xyxy + BA_Vertex_13_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_13_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_13_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_13_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_13_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_13_CB2((uint)(5)).xyxy + BA_Vertex_13_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_13_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_13_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_13_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_13_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_13_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_13_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_13_CB2((uint)(4)).xyxy + BA_Vertex_13_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_13_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_13_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_13_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_13_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_13_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Vertex_14_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 1u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 3u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 7u) value = float4(_CustomData_MaskTiling_CD1XYXY.x, _CustomData_MaskTiling_CD1XYXY.y, _CustomData_MaskTiling_CD1XYXY.z, _CustomData_MaskTiling_CD1XYXY.w);
  if (i == 8u) value = float4(_CustomData_MaskTiling_CD2XYXY.x, _CustomData_MaskTiling_CD2XYXY.y, _CustomData_MaskTiling_CD2XYXY.z, _CustomData_MaskTiling_CD2XYXY.w);
  if (i == 9u) value = float4(_CustomData_MaskOffset_CD1XYXY.x, _CustomData_MaskOffset_CD1XYXY.y, _CustomData_MaskOffset_CD1XYXY.z, _CustomData_MaskOffset_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 12u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 15u) value = float4(_CustomData_MaskOffset_CD2XYXY.x, _CustomData_MaskOffset_CD2XYXY.y, _CustomData_MaskOffset_CD2XYXY.z, _CustomData_MaskOffset_CD2XYXY.w);
  if (i == 17u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_14_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_14_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
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
  o1.xyzw = v2.xyzw;
  r0.xyzw = BA_Vertex_14_CB2((uint)(10)).xyzw * v2.xyzw;
  r1.xy = BA_Vertex_14_CB2((uint)(11)).zw * v4.zw;
  r2.xyzw = BA_Vertex_14_CB2((uint)(12)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_14_CB2((uint)(13)).xyxy + BA_Vertex_14_CB2((uint)(13)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v2.zw * BA_Vertex_14_CB2((uint)(17)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_14_CB2((uint)(11)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v2.xy * BA_Vertex_14_CB2((uint)(17)).xy + r0.xy;
  o2.xy = v3.xy;
  r0.xyzw = BA_Vertex_14_CB2((uint)(0)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_14_CB2((uint)(5)).xyxy + BA_Vertex_14_CB2((uint)(5)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_14_CB2((uint)(3)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_14_CB2((uint)(2)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_14_CB2((uint)(2)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_14_CB2((uint)(1)).xy + r0.xy;
  o3.xy = v2.zw * BA_Vertex_14_CB2((uint)(1)).zw + r0.xy;
  r0.xyzw = BA_Vertex_14_CB2((uint)(7)).xyzw * v4.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_14_CB2((uint)(4)).xyxy + BA_Vertex_14_CB2((uint)(4)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_14_CB2((uint)(8)).xyzw * v2.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_14_CB2((uint)(9)).xy + r0.xy;
  r0.xy = v4.zw * BA_Vertex_14_CB2((uint)(9)).zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_14_CB2((uint)(15)).xy + r0.xy;
  o3.zw = v2.zw * BA_Vertex_14_CB2((uint)(15)).zw + r0.xy;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Vert(float4 position : POSITION, out float4 clip : SV_POSITION) { clip = TransformObjectToHClip(position.xyz); }
#endif

#if !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_17_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, 0.0, 0.0, 0.0);
  if (i == 21u) value = float4(0.0, 0.0, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_17_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = v4.x * BA_Fragment_17_CB1((uint)(18)).x + BA_Fragment_17_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_17_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_17_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_17_CB1((uint)(18)).w + r0.x;
  r0.yz = v2.xy * BA_Fragment_17_CB1((uint)(4)).xy + BA_Fragment_17_CB1((uint)(4)).zw;
  r1.xw = BA_Fragment_17_CB1((uint)(19)).zx * BA_Fragment_17_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_17_CB1((uint)(21)).zw * BA_Fragment_17_CB0((uint)(11)).yy;
  r0.yz = r1.zw + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_17_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_17_CB1((uint)(19)).y * r0.y;
  r0.zw = v2.xy * BA_Fragment_17_CB1((uint)(5)).xy + BA_Fragment_17_CB1((uint)(5)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r1.x * r0.y;
  r0.z = cmp(0 != BA_Fragment_17_CB1((uint)(20)).x);
  r0.z = r0.z ? 1 : v5.w;
  r0.y = saturate(r0.y * r0.z);
  r0.z = -BA_Fragment_17_CB1((uint)(22)).x + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.xyz = r1.xyz * r0.xxx;
  r0.xyz = BA_Fragment_17_CB1((uint)(19)).yyy * r0.xyz;
  r0.xyz = r0.xyz * r1.www;
  r1.xyz = BA_Fragment_17_CB1((uint)(16)).xyz * v5.xyz;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_18_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 14u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, _UV_Add_Use, _Dis_Speed_Y, _Dis_Speed_X);
  if (i == 21u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_18_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = v4.x * BA_Fragment_18_CB1((uint)(18)).x + BA_Fragment_18_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_18_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_18_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_18_CB1((uint)(18)).w + r0.x;
  r0.yz = v2.xy * BA_Fragment_18_CB1((uint)(4)).xy + BA_Fragment_18_CB1((uint)(4)).zw;
  r1.xw = BA_Fragment_18_CB1((uint)(19)).zx * BA_Fragment_18_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_18_CB1((uint)(21)).zw * BA_Fragment_18_CB0((uint)(11)).yy;
  r0.yz = r1.zw + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_18_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_18_CB1((uint)(19)).y * r0.y;
  r0.zw = v2.xy * BA_Fragment_18_CB1((uint)(13)).xy + BA_Fragment_18_CB1((uint)(13)).zw;
  r0.zw = v2.zw + r0.zw;
  r1.zw = BA_Fragment_18_CB1((uint)(20)).wz * BA_Fragment_18_CB0((uint)(11)).yy;
  r1.zw = frac(r1.zw);
  r0.zw = r1.zw + r0.zw;
  r2.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.zw).xyzw;
  r3.xyzw = BA_Fragment_18_CB1((uint)(14)).xyzw * v1.xyzw;
  r0.zw = r3.xy + r3.zw;
  r0.zw = BA_Fragment_18_CB1((uint)(21)).yx + r0.zw;
  r0.zw = r0.zw * r2.xy;
  r1.zw = v2.xy * BA_Fragment_18_CB1((uint)(6)).xy + BA_Fragment_18_CB1((uint)(6)).zw;
  r1.z = r1.z + r1.w;
  r2.xy = cmp(float2(0,0) != BA_Fragment_18_CB1((uint)(20)).yx);
  r1.z = r2.x ? r1.z : 1;
  r1.w = r2.y ? 1 : v5.w;
  r0.zw = r0.zw * r1.zz + r1.xy;
  r1.xy = v2.xy * BA_Fragment_18_CB1((uint)(5)).xy + BA_Fragment_18_CB1((uint)(5)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r2.x * r0.y;
  r0.y = saturate(r0.y * r1.w);
  r0.z = -BA_Fragment_18_CB1((uint)(22)).x + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.xyz = r2.xyz * r0.xxx;
  r0.xyz = BA_Fragment_18_CB1((uint)(19)).yyy * r0.xyz;
  r0.xyz = r0.xyz * r2.www;
  r1.xyz = BA_Fragment_18_CB1((uint)(16)).xyz * v5.xyz;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_19_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 14u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, _UV_Add_Use, _Dis_Speed_Y, _Dis_Speed_X);
  if (i == 21u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_19_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_19_CB1((uint)(13)).xy + BA_Fragment_19_CB1((uint)(13)).zw;
  r0.xy = v2.zw + r0.xy;
  r0.zw = BA_Fragment_19_CB1((uint)(20)).wz * BA_Fragment_19_CB0((uint)(11)).yy;
  r0.zw = frac(r0.zw);
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r1.xyzw = BA_Fragment_19_CB1((uint)(14)).xyzw * v1.xyzw;
  r0.zw = r1.xy + r1.zw;
  r0.zw = BA_Fragment_19_CB1((uint)(21)).yx + r0.zw;
  r0.xy = r0.zw * r0.xy;
  r0.zw = v2.xy * BA_Fragment_19_CB1((uint)(6)).xy + BA_Fragment_19_CB1((uint)(6)).zw;
  r0.z = r0.z + r0.w;
  r1.xy = cmp(float2(0,0) != BA_Fragment_19_CB1((uint)(20)).yx);
  r0.z = r1.x ? r0.z : 1;
  r0.w = r1.y ? 1 : v5.w;
  r1.xw = BA_Fragment_19_CB1((uint)(19)).zx * BA_Fragment_19_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_19_CB1((uint)(21)).zw * BA_Fragment_19_CB0((uint)(11)).yy;
  r0.xy = r0.xy * r0.zz + r1.zw;
  r1.zw = v2.xy * BA_Fragment_19_CB1((uint)(4)).xy + BA_Fragment_19_CB1((uint)(4)).zw;
  r0.xy = r1.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.x = v4.x * BA_Fragment_19_CB1((uint)(18)).x + BA_Fragment_19_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_19_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_19_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_19_CB1((uint)(18)).w + r0.x;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_19_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_19_CB1((uint)(19)).y * r0.y;
  r1.zw = v2.xy * BA_Fragment_19_CB1((uint)(5)).xy + BA_Fragment_19_CB1((uint)(5)).zw;
  r1.xy = r1.xy + r1.zw;
  r1.xy = v3.xy + r1.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = r1.x * r0.y;
  r0.y = saturate(r0.y * r0.w);
  r0.z = -BA_Fragment_19_CB1((uint)(22)).x + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.xyz = r1.xyz * r0.xxx;
  r0.xyz = BA_Fragment_19_CB1((uint)(19)).yyy * r0.xyz;
  r0.xyz = r0.xyz * r1.www;
  r1.xyz = BA_Fragment_19_CB1((uint)(16)).xyz * v5.xyz;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_20_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 14u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, _UV_Add_Use, _Dis_Speed_Y, _Dis_Speed_X);
  if (i == 21u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_20_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_20_CB1((uint)(13)).xy + BA_Fragment_20_CB1((uint)(13)).zw;
  r0.xy = v2.zw + r0.xy;
  r0.zw = BA_Fragment_20_CB1((uint)(20)).wz * BA_Fragment_20_CB0((uint)(11)).yy;
  r0.zw = frac(r0.zw);
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r1.xyzw = BA_Fragment_20_CB1((uint)(14)).xyzw * v1.xyzw;
  r0.zw = r1.xy + r1.zw;
  r0.zw = BA_Fragment_20_CB1((uint)(21)).yx + r0.zw;
  r0.xy = r0.zw * r0.xy;
  r0.zw = v2.xy * BA_Fragment_20_CB1((uint)(6)).xy + BA_Fragment_20_CB1((uint)(6)).zw;
  r0.z = r0.z + r0.w;
  r1.xy = cmp(float2(0,0) != BA_Fragment_20_CB1((uint)(20)).yx);
  r0.z = r1.x ? r0.z : 1;
  r0.w = r1.y ? 1 : v5.w;
  r1.xw = BA_Fragment_20_CB1((uint)(19)).zx * BA_Fragment_20_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_20_CB1((uint)(21)).zw * BA_Fragment_20_CB0((uint)(11)).yy;
  r1.xyzw = r0.xyxy * r0.zzzz + r1.xyzw;
  r0.xy = v2.xy * BA_Fragment_20_CB1((uint)(4)).xy + BA_Fragment_20_CB1((uint)(4)).zw;
  r0.xy = r1.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.x = v4.x * BA_Fragment_20_CB1((uint)(18)).x + BA_Fragment_20_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_20_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_20_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_20_CB1((uint)(18)).w + r0.x;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_20_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_20_CB1((uint)(19)).y * r0.y;
  r1.zw = v2.xy * BA_Fragment_20_CB1((uint)(5)).xy + BA_Fragment_20_CB1((uint)(5)).zw;
  r1.xy = r1.xy + r1.zw;
  r1.xy = v3.xy + r1.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = r1.x * r0.y;
  r0.y = saturate(r0.y * r0.w);
  r0.z = -BA_Fragment_20_CB1((uint)(22)).x + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.xyz = r1.xyz * r0.xxx;
  r0.xyz = BA_Fragment_20_CB1((uint)(19)).yyy * r0.xyz;
  r0.xyz = r0.xyz * r1.www;
  r1.xyz = BA_Fragment_20_CB1((uint)(16)).xyz * v5.xyz;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_21_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, 0.0, 0.0, 0.0);
  if (i == 21u) value = float4(0.0, 0.0, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_21_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = v4.x * BA_Fragment_21_CB1((uint)(18)).x + BA_Fragment_21_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_21_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_21_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_21_CB1((uint)(18)).w + r0.x;
  r0.yz = v2.xy * BA_Fragment_21_CB1((uint)(4)).xy + BA_Fragment_21_CB1((uint)(4)).zw;
  r1.xw = BA_Fragment_21_CB1((uint)(19)).zx * BA_Fragment_21_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_21_CB1((uint)(21)).zw * BA_Fragment_21_CB0((uint)(11)).yy;
  r0.yz = r1.zw + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_21_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_21_CB1((uint)(19)).y * r0.y;
  r0.zw = v2.xy * BA_Fragment_21_CB1((uint)(5)).xy + BA_Fragment_21_CB1((uint)(5)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r1.w * r0.y;
  r0.z = cmp(0 != BA_Fragment_21_CB1((uint)(20)).x);
  r0.z = r0.z ? 1 : v5.w;
  r0.y = saturate(r0.y * r0.z);
  r0.z = -BA_Fragment_21_CB1((uint)(22)).x + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.xyz = r1.xyz * r0.xxx;
  r0.xyz = BA_Fragment_21_CB1((uint)(19)).yyy * r0.xyz;
  r0.xyz = r0.xyz * r1.www;
  r1.xyz = BA_Fragment_21_CB1((uint)(16)).xyz * v5.xyz;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_22_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 14u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, _UV_Add_Use, _Dis_Speed_Y, _Dis_Speed_X);
  if (i == 21u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_22_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = v4.x * BA_Fragment_22_CB1((uint)(18)).x + BA_Fragment_22_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_22_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_22_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_22_CB1((uint)(18)).w + r0.x;
  r0.yz = v2.xy * BA_Fragment_22_CB1((uint)(4)).xy + BA_Fragment_22_CB1((uint)(4)).zw;
  r1.xw = BA_Fragment_22_CB1((uint)(19)).zx * BA_Fragment_22_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_22_CB1((uint)(21)).zw * BA_Fragment_22_CB0((uint)(11)).yy;
  r0.yz = r1.zw + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_22_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_22_CB1((uint)(19)).y * r0.y;
  r0.zw = v2.xy * BA_Fragment_22_CB1((uint)(13)).xy + BA_Fragment_22_CB1((uint)(13)).zw;
  r0.zw = v2.zw + r0.zw;
  r1.zw = BA_Fragment_22_CB1((uint)(20)).wz * BA_Fragment_22_CB0((uint)(11)).yy;
  r1.zw = frac(r1.zw);
  r0.zw = r1.zw + r0.zw;
  r2.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.zw).xyzw;
  r3.xyzw = BA_Fragment_22_CB1((uint)(14)).xyzw * v1.xyzw;
  r0.zw = r3.xy + r3.zw;
  r0.zw = BA_Fragment_22_CB1((uint)(21)).yx + r0.zw;
  r0.zw = r0.zw * r2.xy;
  r1.zw = v2.xy * BA_Fragment_22_CB1((uint)(6)).xy + BA_Fragment_22_CB1((uint)(6)).zw;
  r1.z = r1.z + r1.w;
  r2.xy = cmp(float2(0,0) != BA_Fragment_22_CB1((uint)(20)).yx);
  r1.z = r2.x ? r1.z : 1;
  r1.w = r2.y ? 1 : v5.w;
  r0.zw = r0.zw * r1.zz + r1.xy;
  r1.xy = v2.xy * BA_Fragment_22_CB1((uint)(5)).xy + BA_Fragment_22_CB1((uint)(5)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r2.w * r0.y;
  r0.y = saturate(r0.y * r1.w);
  r0.z = -BA_Fragment_22_CB1((uint)(22)).x + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.xyz = r2.xyz * r0.xxx;
  r0.xyz = BA_Fragment_22_CB1((uint)(19)).yyy * r0.xyz;
  r0.xyz = r0.xyz * r2.www;
  r1.xyz = BA_Fragment_22_CB1((uint)(16)).xyz * v5.xyz;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_23_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 14u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, _UV_Add_Use, _Dis_Speed_Y, _Dis_Speed_X);
  if (i == 21u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_23_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_23_CB1((uint)(13)).xy + BA_Fragment_23_CB1((uint)(13)).zw;
  r0.xy = v2.zw + r0.xy;
  r0.zw = BA_Fragment_23_CB1((uint)(20)).wz * BA_Fragment_23_CB0((uint)(11)).yy;
  r0.zw = frac(r0.zw);
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r1.xyzw = BA_Fragment_23_CB1((uint)(14)).xyzw * v1.xyzw;
  r0.zw = r1.xy + r1.zw;
  r0.zw = BA_Fragment_23_CB1((uint)(21)).yx + r0.zw;
  r0.xy = r0.zw * r0.xy;
  r0.zw = v2.xy * BA_Fragment_23_CB1((uint)(6)).xy + BA_Fragment_23_CB1((uint)(6)).zw;
  r0.z = r0.z + r0.w;
  r1.xy = cmp(float2(0,0) != BA_Fragment_23_CB1((uint)(20)).yx);
  r0.z = r1.x ? r0.z : 1;
  r0.w = r1.y ? 1 : v5.w;
  r1.xw = BA_Fragment_23_CB1((uint)(19)).zx * BA_Fragment_23_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_23_CB1((uint)(21)).zw * BA_Fragment_23_CB0((uint)(11)).yy;
  r0.xy = r0.xy * r0.zz + r1.zw;
  r1.zw = v2.xy * BA_Fragment_23_CB1((uint)(4)).xy + BA_Fragment_23_CB1((uint)(4)).zw;
  r0.xy = r1.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.x = v4.x * BA_Fragment_23_CB1((uint)(18)).x + BA_Fragment_23_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_23_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_23_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_23_CB1((uint)(18)).w + r0.x;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_23_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_23_CB1((uint)(19)).y * r0.y;
  r1.zw = v2.xy * BA_Fragment_23_CB1((uint)(5)).xy + BA_Fragment_23_CB1((uint)(5)).zw;
  r1.xy = r1.xy + r1.zw;
  r1.xy = v3.xy + r1.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = r1.w * r0.y;
  r0.y = saturate(r0.y * r0.w);
  r0.z = -BA_Fragment_23_CB1((uint)(22)).x + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.xyz = r1.xyz * r0.xxx;
  r0.xyz = BA_Fragment_23_CB1((uint)(19)).yyy * r0.xyz;
  r0.xyz = r0.xyz * r1.www;
  r1.xyz = BA_Fragment_23_CB1((uint)(16)).xyz * v5.xyz;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_24_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 14u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, _UV_Add_Use, _Dis_Speed_Y, _Dis_Speed_X);
  if (i == 21u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_24_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_24_CB1((uint)(13)).xy + BA_Fragment_24_CB1((uint)(13)).zw;
  r0.xy = v2.zw + r0.xy;
  r0.zw = BA_Fragment_24_CB1((uint)(20)).wz * BA_Fragment_24_CB0((uint)(11)).yy;
  r0.zw = frac(r0.zw);
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r1.xyzw = BA_Fragment_24_CB1((uint)(14)).xyzw * v1.xyzw;
  r0.zw = r1.xy + r1.zw;
  r0.zw = BA_Fragment_24_CB1((uint)(21)).yx + r0.zw;
  r0.xy = r0.zw * r0.xy;
  r0.zw = v2.xy * BA_Fragment_24_CB1((uint)(6)).xy + BA_Fragment_24_CB1((uint)(6)).zw;
  r0.z = r0.z + r0.w;
  r1.xy = cmp(float2(0,0) != BA_Fragment_24_CB1((uint)(20)).yx);
  r0.z = r1.x ? r0.z : 1;
  r0.w = r1.y ? 1 : v5.w;
  r1.xw = BA_Fragment_24_CB1((uint)(19)).zx * BA_Fragment_24_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_24_CB1((uint)(21)).zw * BA_Fragment_24_CB0((uint)(11)).yy;
  r1.xyzw = r0.xyxy * r0.zzzz + r1.xyzw;
  r0.xy = v2.xy * BA_Fragment_24_CB1((uint)(4)).xy + BA_Fragment_24_CB1((uint)(4)).zw;
  r0.xy = r1.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.x = v4.x * BA_Fragment_24_CB1((uint)(18)).x + BA_Fragment_24_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_24_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_24_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_24_CB1((uint)(18)).w + r0.x;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_24_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_24_CB1((uint)(19)).y * r0.y;
  r1.zw = v2.xy * BA_Fragment_24_CB1((uint)(5)).xy + BA_Fragment_24_CB1((uint)(5)).zw;
  r1.xy = r1.xy + r1.zw;
  r1.xy = v3.xy + r1.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = r1.w * r0.y;
  r0.y = saturate(r0.y * r0.w);
  r0.z = -BA_Fragment_24_CB1((uint)(22)).x + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.z < 0);
  if (r0.y != 0) discard;
  r0.xyz = r1.xyz * r0.xxx;
  r0.xyz = BA_Fragment_24_CB1((uint)(19)).yyy * r0.xyz;
  r0.xyz = r0.xyz * r1.www;
  r1.xyz = BA_Fragment_24_CB1((uint)(16)).xyz * v5.xyz;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_25_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, 0.0, 0.0, 0.0);
  if (i == 21u) value = float4(0.0, 0.0, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_25_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = v4.x * BA_Fragment_25_CB1((uint)(18)).x + BA_Fragment_25_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_25_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_25_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_25_CB1((uint)(18)).w + r0.x;
  r0.yz = v2.xy * BA_Fragment_25_CB1((uint)(4)).xy + BA_Fragment_25_CB1((uint)(4)).zw;
  r1.xw = BA_Fragment_25_CB1((uint)(19)).zx * BA_Fragment_25_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_25_CB1((uint)(21)).zw * BA_Fragment_25_CB0((uint)(11)).yy;
  r0.yz = r1.zw + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_25_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_25_CB1((uint)(19)).y * r0.y;
  r0.zw = v2.xy * BA_Fragment_25_CB1((uint)(5)).xy + BA_Fragment_25_CB1((uint)(5)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r1.x * r0.y;
  r0.z = cmp(0 != BA_Fragment_25_CB1((uint)(20)).x);
  r0.z = r0.z ? 1 : v5.w;
  r0.y = saturate(r0.y * r0.z);
  r0.z = -BA_Fragment_25_CB1((uint)(22)).x + r0.y;
  r0.z = cmp(r0.z < 0);
  if (r0.z != 0) discard;
  r0.xzw = r1.xyz * r0.xxx;
  r0.xzw = BA_Fragment_25_CB1((uint)(19)).yyy * r0.xzw;
  r0.xzw = r0.xzw * r1.www;
  r1.xyz = BA_Fragment_25_CB1((uint)(16)).xyz * v5.xyz;
  r0.xzw = r1.xyz * r0.xzw;
  o0.xyz = r0.xzw * r0.yyy;
  o0.w = r0.y;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_26_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 14u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, _UV_Add_Use, _Dis_Speed_Y, _Dis_Speed_X);
  if (i == 21u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_26_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = v4.x * BA_Fragment_26_CB1((uint)(18)).x + BA_Fragment_26_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_26_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_26_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_26_CB1((uint)(18)).w + r0.x;
  r0.yz = v2.xy * BA_Fragment_26_CB1((uint)(4)).xy + BA_Fragment_26_CB1((uint)(4)).zw;
  r1.xw = BA_Fragment_26_CB1((uint)(19)).zx * BA_Fragment_26_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_26_CB1((uint)(21)).zw * BA_Fragment_26_CB0((uint)(11)).yy;
  r0.yz = r1.zw + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_26_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_26_CB1((uint)(19)).y * r0.y;
  r0.zw = v2.xy * BA_Fragment_26_CB1((uint)(13)).xy + BA_Fragment_26_CB1((uint)(13)).zw;
  r0.zw = v2.zw + r0.zw;
  r1.zw = BA_Fragment_26_CB1((uint)(20)).wz * BA_Fragment_26_CB0((uint)(11)).yy;
  r1.zw = frac(r1.zw);
  r0.zw = r1.zw + r0.zw;
  r2.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.zw).xyzw;
  r3.xyzw = BA_Fragment_26_CB1((uint)(14)).xyzw * v1.xyzw;
  r0.zw = r3.xy + r3.zw;
  r0.zw = BA_Fragment_26_CB1((uint)(21)).yx + r0.zw;
  r0.zw = r0.zw * r2.xy;
  r1.zw = v2.xy * BA_Fragment_26_CB1((uint)(6)).xy + BA_Fragment_26_CB1((uint)(6)).zw;
  r1.z = r1.z + r1.w;
  r2.xy = cmp(float2(0,0) != BA_Fragment_26_CB1((uint)(20)).yx);
  r1.z = r2.x ? r1.z : 1;
  r1.w = r2.y ? 1 : v5.w;
  r0.zw = r0.zw * r1.zz + r1.xy;
  r1.xy = v2.xy * BA_Fragment_26_CB1((uint)(5)).xy + BA_Fragment_26_CB1((uint)(5)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r2.x * r0.y;
  r0.y = saturate(r0.y * r1.w);
  r0.z = -BA_Fragment_26_CB1((uint)(22)).x + r0.y;
  r0.z = cmp(r0.z < 0);
  if (r0.z != 0) discard;
  r0.xzw = r2.xyz * r0.xxx;
  r0.xzw = BA_Fragment_26_CB1((uint)(19)).yyy * r0.xzw;
  r0.xzw = r0.xzw * r2.www;
  r1.xyz = BA_Fragment_26_CB1((uint)(16)).xyz * v5.xyz;
  r0.xzw = r1.xyz * r0.xzw;
  o0.xyz = r0.xzw * r0.yyy;
  o0.w = r0.y;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_27_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 14u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, _UV_Add_Use, _Dis_Speed_Y, _Dis_Speed_X);
  if (i == 21u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_27_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_27_CB1((uint)(13)).xy + BA_Fragment_27_CB1((uint)(13)).zw;
  r0.xy = v2.zw + r0.xy;
  r0.zw = BA_Fragment_27_CB1((uint)(20)).wz * BA_Fragment_27_CB0((uint)(11)).yy;
  r0.zw = frac(r0.zw);
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r1.xyzw = BA_Fragment_27_CB1((uint)(14)).xyzw * v1.xyzw;
  r0.zw = r1.xy + r1.zw;
  r0.zw = BA_Fragment_27_CB1((uint)(21)).yx + r0.zw;
  r0.xy = r0.zw * r0.xy;
  r0.zw = v2.xy * BA_Fragment_27_CB1((uint)(6)).xy + BA_Fragment_27_CB1((uint)(6)).zw;
  r0.z = r0.z + r0.w;
  r1.xy = cmp(float2(0,0) != BA_Fragment_27_CB1((uint)(20)).yx);
  r0.z = r1.x ? r0.z : 1;
  r0.w = r1.y ? 1 : v5.w;
  r1.xw = BA_Fragment_27_CB1((uint)(19)).zx * BA_Fragment_27_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_27_CB1((uint)(21)).zw * BA_Fragment_27_CB0((uint)(11)).yy;
  r0.xy = r0.xy * r0.zz + r1.zw;
  r1.zw = v2.xy * BA_Fragment_27_CB1((uint)(4)).xy + BA_Fragment_27_CB1((uint)(4)).zw;
  r0.xy = r1.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.x = v4.x * BA_Fragment_27_CB1((uint)(18)).x + BA_Fragment_27_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_27_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_27_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_27_CB1((uint)(18)).w + r0.x;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_27_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_27_CB1((uint)(19)).y * r0.y;
  r1.zw = v2.xy * BA_Fragment_27_CB1((uint)(5)).xy + BA_Fragment_27_CB1((uint)(5)).zw;
  r1.xy = r1.xy + r1.zw;
  r1.xy = v3.xy + r1.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = r1.x * r0.y;
  r0.y = saturate(r0.y * r0.w);
  r0.z = -BA_Fragment_27_CB1((uint)(22)).x + r0.y;
  r0.z = cmp(r0.z < 0);
  if (r0.z != 0) discard;
  r0.xzw = r1.xyz * r0.xxx;
  r0.xzw = BA_Fragment_27_CB1((uint)(19)).yyy * r0.xzw;
  r0.xzw = r0.xzw * r1.www;
  r1.xyz = BA_Fragment_27_CB1((uint)(16)).xyz * v5.xyz;
  r0.xzw = r1.xyz * r0.xzw;
  o0.xyz = r0.xzw * r0.yyy;
  o0.w = r0.y;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && defined(_RGBRGBA_RGB) && !defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_28_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 14u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, _UV_Add_Use, _Dis_Speed_Y, _Dis_Speed_X);
  if (i == 21u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_28_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_28_CB1((uint)(13)).xy + BA_Fragment_28_CB1((uint)(13)).zw;
  r0.xy = v2.zw + r0.xy;
  r0.zw = BA_Fragment_28_CB1((uint)(20)).wz * BA_Fragment_28_CB0((uint)(11)).yy;
  r0.zw = frac(r0.zw);
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r1.xyzw = BA_Fragment_28_CB1((uint)(14)).xyzw * v1.xyzw;
  r0.zw = r1.xy + r1.zw;
  r0.zw = BA_Fragment_28_CB1((uint)(21)).yx + r0.zw;
  r0.xy = r0.zw * r0.xy;
  r0.zw = v2.xy * BA_Fragment_28_CB1((uint)(6)).xy + BA_Fragment_28_CB1((uint)(6)).zw;
  r0.z = r0.z + r0.w;
  r1.xy = cmp(float2(0,0) != BA_Fragment_28_CB1((uint)(20)).yx);
  r0.z = r1.x ? r0.z : 1;
  r0.w = r1.y ? 1 : v5.w;
  r1.xw = BA_Fragment_28_CB1((uint)(19)).zx * BA_Fragment_28_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_28_CB1((uint)(21)).zw * BA_Fragment_28_CB0((uint)(11)).yy;
  r1.xyzw = r0.xyxy * r0.zzzz + r1.xyzw;
  r0.xy = v2.xy * BA_Fragment_28_CB1((uint)(4)).xy + BA_Fragment_28_CB1((uint)(4)).zw;
  r0.xy = r1.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.x = v4.x * BA_Fragment_28_CB1((uint)(18)).x + BA_Fragment_28_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_28_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_28_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_28_CB1((uint)(18)).w + r0.x;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_28_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_28_CB1((uint)(19)).y * r0.y;
  r1.zw = v2.xy * BA_Fragment_28_CB1((uint)(5)).xy + BA_Fragment_28_CB1((uint)(5)).zw;
  r1.xy = r1.xy + r1.zw;
  r1.xy = v3.xy + r1.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = r1.x * r0.y;
  r0.y = saturate(r0.y * r0.w);
  r0.z = -BA_Fragment_28_CB1((uint)(22)).x + r0.y;
  r0.z = cmp(r0.z < 0);
  if (r0.z != 0) discard;
  r0.xzw = r1.xyz * r0.xxx;
  r0.xzw = BA_Fragment_28_CB1((uint)(19)).yyy * r0.xzw;
  r0.xzw = r0.xzw * r1.www;
  r1.xyz = BA_Fragment_28_CB1((uint)(16)).xyz * v5.xyz;
  r0.xzw = r1.xyz * r0.xzw;
  o0.xyz = r0.xzw * r0.yyy;
  o0.w = r0.y;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_DISTORT_USE_OFF) && !defined(_MAIN_DISTORT_USE_USE) && defined(_MASK_DISTORT_USE_OFF) && !defined(_MASK_DISTORT_USE_USE) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_29_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, 0.0, 0.0, 0.0);
  if (i == 21u) value = float4(0.0, 0.0, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_29_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = v4.x * BA_Fragment_29_CB1((uint)(18)).x + BA_Fragment_29_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_29_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_29_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_29_CB1((uint)(18)).w + r0.x;
  r0.yz = v2.xy * BA_Fragment_29_CB1((uint)(4)).xy + BA_Fragment_29_CB1((uint)(4)).zw;
  r1.xw = BA_Fragment_29_CB1((uint)(19)).zx * BA_Fragment_29_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_29_CB1((uint)(21)).zw * BA_Fragment_29_CB0((uint)(11)).yy;
  r0.yz = r1.zw + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_29_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_29_CB1((uint)(19)).y * r0.y;
  r0.zw = v2.xy * BA_Fragment_29_CB1((uint)(5)).xy + BA_Fragment_29_CB1((uint)(5)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v3.xy + r0.zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r1.w * r0.y;
  r0.z = cmp(0 != BA_Fragment_29_CB1((uint)(20)).x);
  r0.z = r0.z ? 1 : v5.w;
  r0.y = saturate(r0.y * r0.z);
  r0.z = -BA_Fragment_29_CB1((uint)(22)).x + r0.y;
  r0.z = cmp(r0.z < 0);
  if (r0.z != 0) discard;
  r0.xzw = r1.xyz * r0.xxx;
  r0.xzw = BA_Fragment_29_CB1((uint)(19)).yyy * r0.xzw;
  r0.xzw = r0.xzw * r1.www;
  r1.xyz = BA_Fragment_29_CB1((uint)(16)).xyz * v5.xyz;
  r0.xzw = r1.xyz * r0.xzw;
  o0.xyz = r0.xzw * r0.yyy;
  o0.w = r0.y;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_MAIN_DISTORT_USE_OFF) && defined(_MAIN_DISTORT_USE_USE) && !defined(_MASK_DISTORT_USE_OFF) && defined(_MASK_DISTORT_USE_USE) && !defined(_RGBRGBA_RGB) && defined(_RGBRGBA_RGBA) && defined(_STEP_VERTEX_COLOR_USE_STEP_CUSTOMDATA)
float4 BA_Fragment_30_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 13u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 14u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 16u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 18u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 19u) value = float4(_Mask_Speed_Y, _Multiply, _Main_Speed_X, _Step_Power);
  if (i == 20u) value = float4(_Step_Vertex_Alpha_Use, _UV_Add_Use, _Dis_Speed_Y, _Dis_Speed_X);
  if (i == 21u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Main_Speed_Y, _Mask_Speed_X);
  if (i == 22u) value = float4(_Alphaclip_Value, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_30_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_30_CB1((uint)(13)).xy + BA_Fragment_30_CB1((uint)(13)).zw;
  r0.xy = v2.zw + r0.xy;
  r0.zw = BA_Fragment_30_CB1((uint)(20)).wz * BA_Fragment_30_CB0((uint)(11)).yy;
  r0.zw = frac(r0.zw);
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r1.xyzw = BA_Fragment_30_CB1((uint)(14)).xyzw * v1.xyzw;
  r0.zw = r1.xy + r1.zw;
  r0.zw = BA_Fragment_30_CB1((uint)(21)).yx + r0.zw;
  r0.xy = r0.zw * r0.xy;
  r0.zw = v2.xy * BA_Fragment_30_CB1((uint)(6)).xy + BA_Fragment_30_CB1((uint)(6)).zw;
  r0.z = r0.z + r0.w;
  r1.xy = cmp(float2(0,0) != BA_Fragment_30_CB1((uint)(20)).yx);
  r0.z = r1.x ? r0.z : 1;
  r0.w = r1.y ? 1 : v5.w;
  r1.xw = BA_Fragment_30_CB1((uint)(19)).zx * BA_Fragment_30_CB0((uint)(11)).yy;
  r1.yz = BA_Fragment_30_CB1((uint)(21)).zw * BA_Fragment_30_CB0((uint)(11)).yy;
  r1.xyzw = r0.xyxy * r0.zzzz + r1.xyzw;
  r0.xy = v2.xy * BA_Fragment_30_CB1((uint)(4)).xy + BA_Fragment_30_CB1((uint)(4)).zw;
  r0.xy = r1.zw + r0.xy;
  r0.xy = v3.zw + r0.xy;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.x = v4.x * BA_Fragment_30_CB1((uint)(18)).x + BA_Fragment_30_CB1((uint)(19)).w;
  r0.x = v4.y * BA_Fragment_30_CB1((uint)(18)).y + r0.x;
  r0.x = v4.z * BA_Fragment_30_CB1((uint)(18)).z + r0.x;
  r0.x = v4.w * BA_Fragment_30_CB1((uint)(18)).w + r0.x;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_30_CB1((uint)(16)).w * r0.x;
  r0.y = BA_Fragment_30_CB1((uint)(19)).y * r0.y;
  r1.zw = v2.xy * BA_Fragment_30_CB1((uint)(5)).xy + BA_Fragment_30_CB1((uint)(5)).zw;
  r1.xy = r1.xy + r1.zw;
  r1.xy = v3.xy + r1.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = r1.w * r0.y;
  r0.y = saturate(r0.y * r0.w);
  r0.z = -BA_Fragment_30_CB1((uint)(22)).x + r0.y;
  r0.z = cmp(r0.z < 0);
  if (r0.z != 0) discard;
  r0.xzw = r1.xyz * r0.xxx;
  r0.xzw = BA_Fragment_30_CB1((uint)(19)).yyy * r0.xzw;
  r0.xzw = r0.xzw * r1.www;
  r1.xyz = BA_Fragment_30_CB1((uint)(16)).xyz * v5.xyz;
  r0.xzw = r1.xyz * r0.xzw;
  o0.xyz = r0.xzw * r0.yyy;
  o0.w = r0.y;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Frag(out float4 color : SV_TARGET0) { color = float4(1,0,1,1); }
#endif
