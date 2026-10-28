// Exact names and types from the original compiled parameter metadata.
float _Alphaclip_Value;
float4 _Color;
float4 _ColorG;
float _ColorG_Glow_Value;
float _ColorG_Value;
float4 _CustomData_DistortOffset_CD1XYXY;
float4 _CustomData_DistortOffset_CD2XYXY;
float4 _CustomData_DistortPower_CD2XYXY;
float4 _CustomData_DistortTiling_CD1XYXY;
float4 _CustomData_DistortTiling_CD2XYXY;
float4 _CustomData_MainOffset_CD1XYXY;
float4 _CustomData_MainOffset_CD2XYXY;
float4 _CustomData_MainTiling_CD1XYXY;
float4 _CustomData_MainTiling_CD2XYXY;
float4 _CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY;
float4 _CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY;
float4 _CustomData_StepValue_CD1_GStepBStepXYXY;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Distortion_Power_X;
float _Distortion_Power_Y;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Multiply;
float _Shadow_Color_Value;
float _Shadow_Glow_Value;
float _Shadow_Offset_Value;
float _StepB_Glow_Value;
float4 _StepB_ScaleOffset1XYScaleOffset2ZW;
float _StepB_Value;
float4 _Tex_Distort_ST;
float4 _Tex_Main_ST;
Texture2D<float4> _Tex_Distort;
Texture2D<float4> _Tex_Main;
SamplerState sampler_Tex_Distort;
SamplerState sampler_Tex_Main;
#ifndef cmp
#define cmp -
#endif

#if !defined(_ALPHAPREMULTIPLY_ON) && defined(_VERTEX_ALPHA_COLOR_OFF) && !defined(_VERTEX_ALPHA_COLOR_ON) && defined(_VERTEX_ALPHA_USE_OFF) && !defined(_VERTEX_ALPHA_USE_ON)
float4 BA_Vertex_1_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 9u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 12u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 14u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 16u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
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
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
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
  r0.xyzw = BA_Vertex_1_CB2((uint)(0)).xyzw * v2.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_1_CB2((uint)(11)).xyxy + BA_Vertex_1_CB2((uint)(11)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_1_CB2((uint)(13)).xyzw * v4.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_1_CB2((uint)(14)).xy + r0.xy;
  r0.xy = v2.zw * BA_Vertex_1_CB2((uint)(14)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_1_CB2((uint)(15)).xy + r0.xy;
  o1.xy = v4.zw * BA_Vertex_1_CB2((uint)(15)).zw + r0.xy;
  o1.zw = v3.xy;
  r0.xyzw = BA_Vertex_1_CB2((uint)(10)).xyzw * v4.xyzw;
  r1.xy = BA_Vertex_1_CB2((uint)(8)).zw * v2.zw;
  r2.xyzw = BA_Vertex_1_CB2((uint)(9)).xyzw * v2.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_1_CB2((uint)(16)).xyxy + BA_Vertex_1_CB2((uint)(16)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v4.zw * BA_Vertex_1_CB2((uint)(7)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_1_CB2((uint)(8)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v4.xy * BA_Vertex_1_CB2((uint)(7)).xy + r0.xy;
  r0.xyzw = BA_Vertex_1_CB2((uint)(12)).xyzw * v4.xyzw;
  o2.xy = r0.xy + r0.zw;
  o3.xyzw = v2.xyzw;
  o4.xyzw = v5.xyzw;
  o5.xyzw = v4.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_VERTEX_ALPHA_COLOR_OFF) && !defined(_VERTEX_ALPHA_COLOR_ON) && !defined(_VERTEX_ALPHA_USE_OFF) && defined(_VERTEX_ALPHA_USE_ON)
float4 BA_Vertex_2_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 9u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 12u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 14u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 16u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
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
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
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
  r0.xyzw = BA_Vertex_2_CB2((uint)(0)).xyzw * v2.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_2_CB2((uint)(11)).xyxy + BA_Vertex_2_CB2((uint)(11)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_2_CB2((uint)(13)).xyzw * v4.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_2_CB2((uint)(14)).xy + r0.xy;
  r0.xy = v2.zw * BA_Vertex_2_CB2((uint)(14)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_2_CB2((uint)(15)).xy + r0.xy;
  o1.xy = v4.zw * BA_Vertex_2_CB2((uint)(15)).zw + r0.xy;
  o1.zw = v3.xy;
  r0.xyzw = BA_Vertex_2_CB2((uint)(10)).xyzw * v4.xyzw;
  r1.xy = BA_Vertex_2_CB2((uint)(8)).zw * v2.zw;
  r2.xyzw = BA_Vertex_2_CB2((uint)(9)).xyzw * v2.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_2_CB2((uint)(16)).xyxy + BA_Vertex_2_CB2((uint)(16)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v4.zw * BA_Vertex_2_CB2((uint)(7)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_2_CB2((uint)(8)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v4.xy * BA_Vertex_2_CB2((uint)(7)).xy + r0.xy;
  r0.xyzw = BA_Vertex_2_CB2((uint)(12)).xyzw * v4.xyzw;
  o2.xy = r0.xy + r0.zw;
  o3.xyzw = v2.xyzw;
  o4.xyzw = v5.xyzw;
  o5.xyzw = v4.xyzw;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_VERTEX_ALPHA_COLOR_OFF) && defined(_VERTEX_ALPHA_COLOR_ON) && defined(_VERTEX_ALPHA_USE_OFF) && !defined(_VERTEX_ALPHA_USE_ON)
float4 BA_Vertex_3_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 7u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
  if (i == 8u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 9u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 10u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 11u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 12u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 13u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 14u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 15u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 16u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
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
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
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
  r0.xyzw = BA_Vertex_3_CB2((uint)(0)).xyzw * v2.xyzw;
  r1.xyzw = v3.xyxy * BA_Vertex_3_CB2((uint)(11)).xyxy + BA_Vertex_3_CB2((uint)(11)).zwzw;
  r0.xyzw = r1.xyzw * r0.xyzw;
  r0.xy = r0.xy + r0.zw;
  r2.xyzw = BA_Vertex_3_CB2((uint)(13)).xyzw * v4.xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.xy = r2.zw * r1.zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_3_CB2((uint)(14)).xy + r0.xy;
  r0.xy = v2.zw * BA_Vertex_3_CB2((uint)(14)).zw + r0.xy;
  r0.xy = v4.xy * BA_Vertex_3_CB2((uint)(15)).xy + r0.xy;
  o1.xy = v4.zw * BA_Vertex_3_CB2((uint)(15)).zw + r0.xy;
  o1.zw = v3.xy;
  r0.xyzw = BA_Vertex_3_CB2((uint)(10)).xyzw * v4.xyzw;
  r1.xy = BA_Vertex_3_CB2((uint)(8)).zw * v2.zw;
  r2.xyzw = BA_Vertex_3_CB2((uint)(9)).xyzw * v2.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_3_CB2((uint)(16)).xyxy + BA_Vertex_3_CB2((uint)(16)).zwzw;
  r1.xy = r2.xy * r3.xy + r1.xy;
  r0.xy = r0.xy * r3.xy + r1.xy;
  r0.xy = v4.zw * BA_Vertex_3_CB2((uint)(7)).zw + r0.xy;
  r0.xy = r2.zw * r3.zw + r0.xy;
  r0.xy = v2.xy * BA_Vertex_3_CB2((uint)(8)).xy + r0.xy;
  r0.xy = r0.zw * r3.zw + r0.xy;
  o2.zw = v4.xy * BA_Vertex_3_CB2((uint)(7)).xy + r0.xy;
  r0.xyzw = BA_Vertex_3_CB2((uint)(12)).xyzw * v4.xyzw;
  o2.xy = r0.xy + r0.zw;
  o3.xyzw = v2.xyzw;
  o4.xyzw = v5.xyzw;
  o5.xyzw = v4.xyzw;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Vert(float4 position : POSITION, out float4 clip : SV_POSITION) { clip = TransformObjectToHClip(position.xyz); }
#endif

#if !defined(_ALPHAPREMULTIPLY_ON) && defined(_VERTEX_ALPHA_COLOR_OFF) && !defined(_VERTEX_ALPHA_COLOR_ON) && defined(_VERTEX_ALPHA_USE_OFF) && !defined(_VERTEX_ALPHA_USE_ON)
float4 BA_Fragment_6_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_ColorG.x, _ColorG.y, _ColorG.z, _ColorG.w);
  if (i == 3u) value = float4(_CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY.x, _CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY.y, _CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY.z, _CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY.w);
  if (i == 4u) value = float4(_CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY.x, _CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY.y, _CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY.z, _CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY.w);
  if (i == 5u) value = float4(_StepB_ScaleOffset1XYScaleOffset2ZW.x, _StepB_ScaleOffset1XYScaleOffset2ZW.y, _StepB_ScaleOffset1XYScaleOffset2ZW.z, _StepB_ScaleOffset1XYScaleOffset2ZW.w);
  if (i == 6u) value = float4(_CustomData_StepValue_CD1_GStepBStepXYXY.x, _CustomData_StepValue_CD1_GStepBStepXYXY.y, _CustomData_StepValue_CD1_GStepBStepXYXY.z, _CustomData_StepValue_CD1_GStepBStepXYXY.w);
  if (i == 11u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 16u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 17u) value = float4(_Dis_Speed_X, _StepB_Glow_Value, _ColorG_Glow_Value, _Shadow_Glow_Value);
  if (i == 18u) value = float4(_Main_Speed_X, _Shadow_Offset_Value, _StepB_Value, _ColorG_Value);
  if (i == 19u) value = float4(_Shadow_Color_Value, _Distortion_Power_X, _Multiply, _Distortion_Power_Y);
  if (i == 20u) value = float4(_Dis_Speed_Y, _Main_Speed_Y, _Alphaclip_Value, 0.0);
  return value;
}

float4 BA_Fragment_6_CB0(uint i)
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

  r0.xy = v1.zw * BA_Fragment_6_CB1((uint)(16)).xy + BA_Fragment_6_CB1((uint)(16)).zw;
  r1.x = BA_Fragment_6_CB1((uint)(17)).x * BA_Fragment_6_CB0((uint)(11)).y;
  r1.yw = BA_Fragment_6_CB1((uint)(20)).xy * BA_Fragment_6_CB0((uint)(11)).yy;
  r0.zw = frac(r1.xy);
  r0.xy = r0.xy + r0.zw;
  r0.xy = v2.zw + r0.xy;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r1.z = BA_Fragment_6_CB1((uint)(18)).x * BA_Fragment_6_CB0((uint)(11)).y;
  r0.zw = frac(r1.zw);
  r0.zw = v1.xy + r0.zw;
  r1.xy = v1.zw * BA_Fragment_6_CB1((uint)(11)).xy + BA_Fragment_6_CB1((uint)(11)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xy = BA_Fragment_6_CB1((uint)(19)).yw + v2.xy;
  r0.xy = r1.xy * r0.xy + r0.zw;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.xyzw = v5.xyzw * BA_Fragment_6_CB1((uint)(4)).xyzw + BA_Fragment_6_CB1((uint)(5)).xyzw;
  r1.xyzw = v5.zwxy * BA_Fragment_6_CB1((uint)(3)).zwxy + r1.xyzw;
  r1.xy = v1.zz * r1.xz + r1.yw;
  r1.yz = r1.xy + r0.zz;
  r1.yz = float2(1,1) + -r1.yz;
  r1.yz = saturate(-r1.yz);
  r1.y = r1.y * r1.z;
  r1.y = saturate(BA_Fragment_6_CB1((uint)(17)).y * r1.y);
  r1.z = BA_Fragment_6_CB1((uint)(1)).w * r1.y;
  r1.z = BA_Fragment_6_CB1((uint)(19)).z * r1.z;
  r1.z = r1.z * r0.w;
  r2.xyzw = BA_Fragment_6_CB1((uint)(6)).xyzw * v3.xyzw;
  r2.xy = r2.xy + r2.zw;
  r2.xy = BA_Fragment_6_CB1((uint)(18)).wz + r2.xy;
  r1.w = saturate(r2.y + -r0.z);
  r1.w = 1 + -r1.w;
  r1.w = saturate(BA_Fragment_6_CB1((uint)(17)).y * r1.w);
  r1.z = r1.z * r1.w;
  r1.z = saturate(v4.w * r1.z);
  r1.w = -BA_Fragment_6_CB1((uint)(20)).z + r1.z;
  o0.w = r1.z;
  r1.z = cmp(r1.w < 0);
  if (r1.z != 0) discard;
  r0.z = BA_Fragment_6_CB1((uint)(18)).y + r0.z;
  r0.z = r1.x * r0.w + r0.z;
  r0.y = r1.x * r0.w + r0.y;
  r0.y = 1 + -r0.y;
  r0.y = saturate(r0.y + -r2.x);
  r0.z = r2.y + -r0.z;
  r0.z = saturate(BA_Fragment_6_CB1((uint)(17)).w * r0.z);
  r0.y = -r0.y * BA_Fragment_6_CB1((uint)(17)).z + 1;
  r0.y = saturate(r0.y * r1.y);
  r1.x = BA_Fragment_6_CB1((uint)(19)).x + -r0.x;
  r0.x = r0.z * r1.x + r0.x;
  r0.x = r0.x * r0.w;
  r1.xzw = v4.xyz * r0.xxx;
  r0.xzw = -r0.xxx * v4.xyz + BA_Fragment_6_CB1((uint)(2)).xyz;
  r0.xyz = r0.yyy * r0.xzw + r1.xzw;
  r0.xyz = BA_Fragment_6_CB1((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_6_CB1((uint)(19)).zzz * r0.xyz;
  o0.xyz = r0.xyz * r1.yyy;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_VERTEX_ALPHA_COLOR_OFF) && !defined(_VERTEX_ALPHA_COLOR_ON) && !defined(_VERTEX_ALPHA_USE_OFF) && defined(_VERTEX_ALPHA_USE_ON)
float4 BA_Fragment_7_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_ColorG.x, _ColorG.y, _ColorG.z, _ColorG.w);
  if (i == 3u) value = float4(_CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY.x, _CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY.y, _CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY.z, _CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY.w);
  if (i == 4u) value = float4(_CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY.x, _CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY.y, _CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY.z, _CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY.w);
  if (i == 5u) value = float4(_StepB_ScaleOffset1XYScaleOffset2ZW.x, _StepB_ScaleOffset1XYScaleOffset2ZW.y, _StepB_ScaleOffset1XYScaleOffset2ZW.z, _StepB_ScaleOffset1XYScaleOffset2ZW.w);
  if (i == 6u) value = float4(_CustomData_StepValue_CD1_GStepBStepXYXY.x, _CustomData_StepValue_CD1_GStepBStepXYXY.y, _CustomData_StepValue_CD1_GStepBStepXYXY.z, _CustomData_StepValue_CD1_GStepBStepXYXY.w);
  if (i == 11u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 16u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 17u) value = float4(_Dis_Speed_X, _StepB_Glow_Value, _ColorG_Glow_Value, _Shadow_Glow_Value);
  if (i == 18u) value = float4(_Main_Speed_X, _Shadow_Offset_Value, 0.0, _ColorG_Value);
  if (i == 19u) value = float4(_Shadow_Color_Value, _Distortion_Power_X, _Multiply, _Distortion_Power_Y);
  if (i == 20u) value = float4(_Dis_Speed_Y, _Main_Speed_Y, _Alphaclip_Value, 0.0);
  return value;
}

float4 BA_Fragment_7_CB0(uint i)
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

  r0.xy = v1.zw * BA_Fragment_7_CB1((uint)(16)).xy + BA_Fragment_7_CB1((uint)(16)).zw;
  r1.x = BA_Fragment_7_CB1((uint)(17)).x * BA_Fragment_7_CB0((uint)(11)).y;
  r1.yw = BA_Fragment_7_CB1((uint)(20)).xy * BA_Fragment_7_CB0((uint)(11)).yy;
  r0.zw = frac(r1.xy);
  r0.xy = r0.xy + r0.zw;
  r0.xy = v2.zw + r0.xy;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r1.z = BA_Fragment_7_CB1((uint)(18)).x * BA_Fragment_7_CB0((uint)(11)).y;
  r0.zw = frac(r1.zw);
  r0.zw = v1.xy + r0.zw;
  r1.xy = v1.zw * BA_Fragment_7_CB1((uint)(11)).xy + BA_Fragment_7_CB1((uint)(11)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xy = BA_Fragment_7_CB1((uint)(19)).yw + v2.xy;
  r0.xy = r1.xy * r0.xy + r0.zw;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.xyzw = v5.xyzw * BA_Fragment_7_CB1((uint)(4)).xyzw + BA_Fragment_7_CB1((uint)(5)).xyzw;
  r1.xyzw = v5.zwxy * BA_Fragment_7_CB1((uint)(3)).zwxy + r1.xyzw;
  r1.xy = v1.zz * r1.xz + r1.yw;
  r1.yz = r1.xy + r0.zz;
  r1.yz = float2(1,1) + -r1.yz;
  r1.yz = saturate(-r1.yz);
  r1.y = r1.y * r1.z;
  r1.y = saturate(BA_Fragment_7_CB1((uint)(17)).y * r1.y);
  r1.z = BA_Fragment_7_CB1((uint)(1)).w * r1.y;
  r1.z = BA_Fragment_7_CB1((uint)(19)).z * r1.z;
  r1.z = r1.z * r0.w;
  r1.w = 1 + -v4.w;
  r2.x = saturate(r1.w + -r0.z);
  r2.x = 1 + -r2.x;
  r2.x = saturate(BA_Fragment_7_CB1((uint)(17)).y * r2.x);
  r1.z = r2.x * r1.z;
  r1.z = saturate(v4.w * r1.z);
  r2.x = -BA_Fragment_7_CB1((uint)(20)).z + r1.z;
  o0.w = r1.z;
  r1.z = cmp(r2.x < 0);
  if (r1.z != 0) discard;
  r0.z = BA_Fragment_7_CB1((uint)(18)).y + r0.z;
  r0.z = r1.x * r0.w + r0.z;
  r0.y = r1.x * r0.w + r0.y;
  r0.y = 1 + -r0.y;
  r0.z = r1.w + -r0.z;
  r0.z = saturate(BA_Fragment_7_CB1((uint)(17)).w * r0.z);
  r1.x = BA_Fragment_7_CB1((uint)(19)).x + -r0.x;
  r0.x = r0.z * r1.x + r0.x;
  r0.x = r0.x * r0.w;
  r1.xzw = v4.xyz * r0.xxx;
  r0.xzw = -r0.xxx * v4.xyz + BA_Fragment_7_CB1((uint)(2)).xyz;
  r2.x = dot(v3.xz, BA_Fragment_7_CB1((uint)(6)).xz);
  r2.x = BA_Fragment_7_CB1((uint)(18)).w + r2.x;
  r0.y = saturate(-r2.x + r0.y);
  r0.y = -r0.y * BA_Fragment_7_CB1((uint)(17)).z + 1;
  r0.y = saturate(r0.y * r1.y);
  r0.xyz = r0.yyy * r0.xzw + r1.xzw;
  r0.xyz = BA_Fragment_7_CB1((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_7_CB1((uint)(19)).zzz * r0.xyz;
  o0.xyz = r0.xyz * r1.yyy;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && !defined(_VERTEX_ALPHA_COLOR_OFF) && defined(_VERTEX_ALPHA_COLOR_ON) && defined(_VERTEX_ALPHA_USE_OFF) && !defined(_VERTEX_ALPHA_USE_ON)
float4 BA_Fragment_8_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_ColorG.x, _ColorG.y, _ColorG.z, _ColorG.w);
  if (i == 3u) value = float4(_CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY.x, _CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY.y, _CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY.z, _CustomData_StepScale_CD2_ScaleOffset2XYScaleOffset1XY.w);
  if (i == 4u) value = float4(_CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY.x, _CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY.y, _CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY.z, _CustomData_StepScale_CD2_ScaleOffset1XYScaleOffset2XY.w);
  if (i == 5u) value = float4(_StepB_ScaleOffset1XYScaleOffset2ZW.x, _StepB_ScaleOffset1XYScaleOffset2ZW.y, _StepB_ScaleOffset1XYScaleOffset2ZW.z, _StepB_ScaleOffset1XYScaleOffset2ZW.w);
  if (i == 6u) value = float4(_CustomData_StepValue_CD1_GStepBStepXYXY.x, _CustomData_StepValue_CD1_GStepBStepXYXY.y, _CustomData_StepValue_CD1_GStepBStepXYXY.z, _CustomData_StepValue_CD1_GStepBStepXYXY.w);
  if (i == 11u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 16u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 17u) value = float4(_Dis_Speed_X, _StepB_Glow_Value, _ColorG_Glow_Value, _Shadow_Glow_Value);
  if (i == 18u) value = float4(_Main_Speed_X, _Shadow_Offset_Value, _StepB_Value, _ColorG_Value);
  if (i == 19u) value = float4(_Shadow_Color_Value, _Distortion_Power_X, _Multiply, _Distortion_Power_Y);
  if (i == 20u) value = float4(_Dis_Speed_Y, _Main_Speed_Y, _Alphaclip_Value, 0.0);
  return value;
}

float4 BA_Fragment_8_CB0(uint i)
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

  r0.xy = v1.zw * BA_Fragment_8_CB1((uint)(16)).xy + BA_Fragment_8_CB1((uint)(16)).zw;
  r1.x = BA_Fragment_8_CB1((uint)(17)).x * BA_Fragment_8_CB0((uint)(11)).y;
  r1.yw = BA_Fragment_8_CB1((uint)(20)).xy * BA_Fragment_8_CB0((uint)(11)).yy;
  r0.zw = frac(r1.xy);
  r0.xy = r0.xy + r0.zw;
  r0.xy = v2.zw + r0.xy;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r1.z = BA_Fragment_8_CB1((uint)(18)).x * BA_Fragment_8_CB0((uint)(11)).y;
  r0.zw = frac(r1.zw);
  r0.zw = v1.xy + r0.zw;
  r1.xy = v1.zw * BA_Fragment_8_CB1((uint)(11)).xy + BA_Fragment_8_CB1((uint)(11)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xy = BA_Fragment_8_CB1((uint)(19)).yw + v2.xy;
  r0.xy = r1.xy * r0.xy + r0.zw;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.xyzw = v5.xyzw * BA_Fragment_8_CB1((uint)(4)).xyzw + BA_Fragment_8_CB1((uint)(5)).xyzw;
  r1.xyzw = v5.zwxy * BA_Fragment_8_CB1((uint)(3)).zwxy + r1.xyzw;
  r1.xy = v1.zz * r1.xz + r1.yw;
  r1.yz = r1.xy + r0.zz;
  r1.yz = float2(1,1) + -r1.yz;
  r1.yz = saturate(-r1.yz);
  r1.y = r1.y * r1.z;
  r1.y = saturate(BA_Fragment_8_CB1((uint)(17)).y * r1.y);
  r1.z = BA_Fragment_8_CB1((uint)(1)).w * r1.y;
  r1.z = BA_Fragment_8_CB1((uint)(19)).z * r1.z;
  r1.z = r1.z * r0.w;
  r2.xyzw = BA_Fragment_8_CB1((uint)(6)).xyzw * v3.xyzw;
  r2.xy = r2.xy + r2.zw;
  r2.xy = BA_Fragment_8_CB1((uint)(18)).wz + r2.xy;
  r1.w = saturate(r2.y + -r0.z);
  r1.w = 1 + -r1.w;
  r1.w = saturate(BA_Fragment_8_CB1((uint)(17)).y * r1.w);
  r1.z = saturate(r1.z * r1.w);
  r1.w = -BA_Fragment_8_CB1((uint)(20)).z + r1.z;
  r1.w = cmp(r1.w < 0);
  if (r1.w != 0) discard;
  r0.z = BA_Fragment_8_CB1((uint)(18)).y + r0.z;
  r0.z = r1.x * r0.w + r0.z;
  r0.y = r1.x * r0.w + r0.y;
  r0.y = 1 + -r0.y;
  r0.y = saturate(r0.y + -r2.x);
  r0.z = r2.y + -r0.z;
  r0.z = saturate(BA_Fragment_8_CB1((uint)(17)).w * r0.z);
  r0.y = -r0.y * BA_Fragment_8_CB1((uint)(17)).z + 1;
  r0.y = saturate(r0.y * r1.y);
  r1.x = BA_Fragment_8_CB1((uint)(19)).x + -r0.x;
  r0.x = r0.z * r1.x + r0.x;
  r0.x = r0.x * r0.w;
  r2.xyz = v4.xyz * r0.xxx;
  r0.xzw = -r0.xxx * v4.xyz + BA_Fragment_8_CB1((uint)(2)).xyz;
  r0.xyz = r0.yyy * r0.xzw + r2.xyz;
  r0.xyz = BA_Fragment_8_CB1((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_8_CB1((uint)(19)).zzz * r0.xyz;
  r0.xyz = r0.xyz * r1.yyy;
  o0.xyz = r0.xyz * r1.zzz;
  o0.w = r1.z;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Frag(out float4 color : SV_TARGET0) { color = float4(1,0,1,1); }
#endif
