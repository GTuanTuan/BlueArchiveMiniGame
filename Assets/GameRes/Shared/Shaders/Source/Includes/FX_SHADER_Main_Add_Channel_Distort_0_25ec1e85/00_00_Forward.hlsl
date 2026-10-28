// Exact names and types from the original compiled parameter metadata.
float4 _Add_Color;
float _Add_Speed_X;
float _Add_Speed_Y;
float _Add_Tex_Dithering;
float _Add_Tex_Multiply;
float _Custom_Data_Add_Tex_Dithering_use;
float _Custom_Data_Main_OffsetUse;
float _Custom_Data_Mask_OffsetUse;
float _Custom_Data_Step_Tex_Dithering_use;
float _GDistort_Power_X;
float _GDistort_Power_Y;
float _GDistort_Speed_X;
float _GDistort_Speed_Y;
float4 _G_Tilingxy_Offsetzw;
float4 _Main_Color;
float _Main_Multiply;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Main_Tex_Alpha_use;
float _RDistort_Power_X;
float _RDistort_Power_Y;
float _RDistort_Speed_X;
float _RDistort_Speed_Y;
float _RGBRGBA;
float4 _R_Tilingxy_Offsetzw;
float _Step_Tex_Dithering;
float _Step_Tex_Multiply;
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

#if !defined(_ADD_TEX_CHANNEL_R) && defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && !defined(_STEP_TEX_CHANNEL_G) && !defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R)
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
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
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
  o1.xyz = v2.xyz;
  o1.w = 0;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ADD_TEX_CHANNEL_R) && defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && !defined(_STEP_TEX_CHANNEL_G) && defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R)
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
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
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
  o1.xyz = v2.xyz;
  o1.w = 0;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ADD_TEX_CHANNEL_R) && defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && defined(_STEP_TEX_CHANNEL_G) && !defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R)
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
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
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
  o1.xyz = v2.xyz;
  o1.w = 0;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif defined(_ADD_TEX_CHANNEL_R) && !defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && !defined(_STEP_TEX_CHANNEL_G) && defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R)
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
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
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
  o1.xyz = v2.xyz;
  o1.w = 0;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif defined(_ADD_TEX_CHANNEL_R) && !defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && !defined(_STEP_TEX_CHANNEL_G) && !defined(_STEP_TEX_CHANNEL_OFF) && defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R)
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
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
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
  o1.xyz = v2.xyz;
  o1.w = 0;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif defined(_ADD_TEX_CHANNEL_R) && !defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && !defined(_STEP_TEX_CHANNEL_G) && defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R)
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
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
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
  o1.xyz = v2.xyz;
  o1.w = 0;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif defined(_ADD_TEX_CHANNEL_R) && !defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && !defined(_STEP_TEX_CHANNEL_G) && defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R)
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
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
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
  o1.xyz = v2.xyz;
  o1.w = 0;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif defined(_ADD_TEX_CHANNEL_R) && !defined(_ADD_TEX_CHANNEL_RGB) && defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && defined(_STEP_TEX_CHANNEL_G) && !defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R)
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
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
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
  o1.xyz = v2.xyz;
  o1.w = 0;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif defined(_ADD_TEX_CHANNEL_R) && !defined(_ADD_TEX_CHANNEL_RGB) && defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && defined(_STEP_TEX_CHANNEL_G) && !defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R)
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
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
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
  o1.xyz = v2.xyz;
  o1.w = 0;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Vert(float4 position : POSITION, out float4 clip : SV_POSITION) { clip = TransformObjectToHClip(position.xyz); }
#endif

#if !defined(_ADD_TEX_CHANNEL_R) && defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && !defined(_STEP_TEX_CHANNEL_G) && !defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R)
float4 BA_Fragment_13_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Add_Color.x, _Add_Color.y, _Add_Color.z, _Add_Color.w);
  if (i == 3u) value = float4(_R_Tilingxy_Offsetzw.x, _R_Tilingxy_Offsetzw.y, _R_Tilingxy_Offsetzw.z, _R_Tilingxy_Offsetzw.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 6u) value = float4(_Custom_Data_Add_Tex_Dithering_use, _Main_Tex_Alpha_use, _Step_Tex_Multiply, _Step_Tex_Dithering);
  if (i == 7u) value = float4(_Custom_Data_Step_Tex_Dithering_use, _Custom_Data_Mask_OffsetUse, _Add_Speed_Y, _Add_Speed_X);
  if (i == 8u) value = float4(_RGBRGBA, _Main_Speed_X, _Add_Tex_Dithering, 0.0);
  if (i == 9u) value = float4(0.0, 0.0, 0.0, _RDistort_Speed_Y);
  if (i == 10u) value = float4(_RDistort_Speed_X, _RDistort_Power_Y, _RDistort_Power_X, _Custom_Data_Main_OffsetUse);
  if (i == 11u) value = float4(_Main_Speed_Y, _Main_Multiply, _Add_Tex_Multiply, 0.0);
  return value;
}

float4 BA_Fragment_13_CB0(uint i)
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
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_13_CB1((uint)(8)).y * BA_Fragment_13_CB0((uint)(11)).y;
  r0.y = BA_Fragment_13_CB1((uint)(11)).x * BA_Fragment_13_CB0((uint)(11)).y;
  r0.zw = v1.xy * BA_Fragment_13_CB1((uint)(1)).xy + BA_Fragment_13_CB1((uint)(1)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.z = cmp(0 != BA_Fragment_13_CB1((uint)(10)).w);
  r0.zw = r0.zz ? v3.xy : 0;
  r0.xy = r0.xy + r0.zw;
  r0.zw = v1.xy * BA_Fragment_13_CB1((uint)(3)).xy + BA_Fragment_13_CB1((uint)(3)).zw;
  r1.x = BA_Fragment_13_CB1((uint)(10)).x * BA_Fragment_13_CB0((uint)(11)).y;
  r1.y = BA_Fragment_13_CB1((uint)(9)).w * BA_Fragment_13_CB0((uint)(11)).y;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r0.xy = BA_Fragment_13_CB1((uint)(10)).zy * r1.xx + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.yzw = v4.xyz * r0.xyz;
  r1.yzw = BA_Fragment_13_CB1((uint)(0)).xyz * r1.yzw;
  r1.yzw = BA_Fragment_13_CB1((uint)(11)).yyy * r1.yzw;
  r1.yzw = r1.yzw * r0.www;
  r2.x = cmp(0 != BA_Fragment_13_CB1((uint)(8)).x);
  r0.xyz = r2.xxx ? r0.www : r0.xyz;
  r1.yzw = r1.yzw * r0.xyz;
  r0.yz = v1.xy * BA_Fragment_13_CB1((uint)(4)).xy + BA_Fragment_13_CB1((uint)(4)).zw;
  r0.yz = BA_Fragment_13_CB0((uint)(11)).yy * BA_Fragment_13_CB1((uint)(7)).wz + r0.yz;
  r2.xy = cmp(float2(0,0) != BA_Fragment_13_CB1((uint)(7)).yx);
  r2.xz = r2.xx ? v3.zw : 0;
  r2.y = r2.y ? v2.y : BA_Fragment_13_CB1((uint)(6)).w;
  r0.yz = r2.xz + r0.yz;
  r0.yz = BA_Fragment_13_CB1((uint)(10)).zy * r1.xx + r0.yz;
  r3.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r3.xyz = saturate(r3.xyz);
  r2.xyz = r3.xyz + -r2.yyy;
  r2.xyz = saturate(BA_Fragment_13_CB1((uint)(6)).zzz * r2.xyz);
  r4.xyz = r2.xyz * r1.yzw;
  r1.xyz = -r1.yzw * r2.xyz + BA_Fragment_13_CB1((uint)(2)).xyz;
  r0.yz = cmp(float2(0,0) != BA_Fragment_13_CB1((uint)(6)).xy);
  r0.y = r0.y ? v2.x : BA_Fragment_13_CB1((uint)(8)).z;
  r0.z = r0.z ? r0.w : 1;
  r2.yzw = r3.xyz + -r0.yyy;
  r2.yzw = saturate(BA_Fragment_13_CB1((uint)(11)).zzz * r2.yzw);
  r0.yzw = saturate(r2.yzw * r0.zzz);
  o0.xyz = r0.yzw * r1.xyz + r4.xyz;
  r0.y = v4.w * v4.w;
  r0.x = r0.x * r0.y;
  r0.x = BA_Fragment_13_CB1((uint)(0)).w * r0.x;
  r0.x = saturate(BA_Fragment_13_CB1((uint)(11)).y * r0.x);
  o0.w = r0.x * r2.x;
  return;
}
#elif !defined(_ADD_TEX_CHANNEL_R) && defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && !defined(_STEP_TEX_CHANNEL_G) && defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R)
float4 BA_Fragment_14_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Add_Color.x, _Add_Color.y, _Add_Color.z, _Add_Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_G_Tilingxy_Offsetzw.x, _G_Tilingxy_Offsetzw.y, _G_Tilingxy_Offsetzw.z, _G_Tilingxy_Offsetzw.w);
  if (i == 6u) value = float4(_Custom_Data_Add_Tex_Dithering_use, _Main_Tex_Alpha_use, _Step_Tex_Multiply, _Step_Tex_Dithering);
  if (i == 7u) value = float4(_Custom_Data_Step_Tex_Dithering_use, _Custom_Data_Mask_OffsetUse, _Add_Speed_Y, _Add_Speed_X);
  if (i == 8u) value = float4(_RGBRGBA, _Main_Speed_X, _Add_Tex_Dithering, _GDistort_Speed_Y);
  if (i == 9u) value = float4(_GDistort_Speed_X, _GDistort_Power_Y, _GDistort_Power_X, 0.0);
  if (i == 10u) value = float4(0.0, 0.0, 0.0, _Custom_Data_Main_OffsetUse);
  if (i == 11u) value = float4(_Main_Speed_Y, _Main_Multiply, _Add_Tex_Multiply, 0.0);
  return value;
}

float4 BA_Fragment_14_CB0(uint i)
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
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_14_CB1((uint)(5)).xy + BA_Fragment_14_CB1((uint)(5)).zw;
  r1.z = BA_Fragment_14_CB1((uint)(9)).x * BA_Fragment_14_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_14_CB1((uint)(8)).yw * BA_Fragment_14_CB0((uint)(11)).yy;
  r0.xy = r1.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.xz = v1.xy * BA_Fragment_14_CB1((uint)(4)).xy + BA_Fragment_14_CB1((uint)(4)).zw;
  r0.xz = BA_Fragment_14_CB0((uint)(11)).yy * BA_Fragment_14_CB1((uint)(7)).wz + r0.xz;
  r1.zw = cmp(float2(0,0) != BA_Fragment_14_CB1((uint)(7)).yx);
  r2.xy = r1.zz ? v3.zw : 0;
  r0.w = r1.w ? v2.y : BA_Fragment_14_CB1((uint)(6)).w;
  r0.w = 1 + -r0.w;
  r0.w = saturate(BA_Fragment_14_CB1((uint)(6)).z * r0.w);
  r0.xz = r2.xy + r0.xz;
  r0.xy = BA_Fragment_14_CB1((uint)(9)).zy * r0.yy + r0.xz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r2.xyz = saturate(r2.xyz);
  r0.xy = cmp(float2(0,0) != BA_Fragment_14_CB1((uint)(6)).xy);
  r0.x = r0.x ? v2.x : BA_Fragment_14_CB1((uint)(8)).z;
  r2.xyz = r2.xyz + -r0.xxx;
  r2.xyz = saturate(BA_Fragment_14_CB1((uint)(11)).zzz * r2.xyz);
  r1.y = BA_Fragment_14_CB1((uint)(11)).x * BA_Fragment_14_CB0((uint)(11)).y;
  r0.xz = v1.xy * BA_Fragment_14_CB1((uint)(1)).xy + BA_Fragment_14_CB1((uint)(1)).zw;
  r0.xz = r1.xy + r0.xz;
  r1.x = cmp(0 != BA_Fragment_14_CB1((uint)(10)).w);
  r1.xy = r1.xx ? v3.xy : 0;
  r0.xz = r1.xy + r0.xz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xz).xyzw;
  r0.x = r0.y ? r1.w : 1;
  r0.xyz = saturate(r0.xxx * r2.xyz);
  r2.xyz = v4.xyz * r1.xyz;
  r2.xyz = BA_Fragment_14_CB1((uint)(0)).xyz * r2.xyz;
  r2.xyz = BA_Fragment_14_CB1((uint)(11)).yyy * r2.xyz;
  r2.xyz = r2.xyz * r1.www;
  r2.w = cmp(0 != BA_Fragment_14_CB1((uint)(8)).x);
  r1.xyz = r2.www ? r1.www : r1.xyz;
  r1.yzw = r2.xyz * r1.xyz;
  r2.xyz = r1.yzw * r0.www;
  r1.yzw = -r1.yzw * r0.www + BA_Fragment_14_CB1((uint)(2)).xyz;
  o0.xyz = r0.xyz * r1.yzw + r2.xyz;
  r0.x = v4.w * v4.w;
  r0.x = r1.x * r0.x;
  r0.x = BA_Fragment_14_CB1((uint)(0)).w * r0.x;
  r0.x = saturate(BA_Fragment_14_CB1((uint)(11)).y * r0.x);
  o0.w = r0.x * r0.w;
  return;
}
#elif !defined(_ADD_TEX_CHANNEL_R) && defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && defined(_STEP_TEX_CHANNEL_G) && !defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MASK_DISTORT_G) && defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R)
float4 BA_Fragment_15_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Add_Color.x, _Add_Color.y, _Add_Color.z, _Add_Color.w);
  if (i == 3u) value = float4(_R_Tilingxy_Offsetzw.x, _R_Tilingxy_Offsetzw.y, _R_Tilingxy_Offsetzw.z, _R_Tilingxy_Offsetzw.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 6u) value = float4(_Custom_Data_Add_Tex_Dithering_use, _Main_Tex_Alpha_use, _Step_Tex_Multiply, _Step_Tex_Dithering);
  if (i == 7u) value = float4(_Custom_Data_Step_Tex_Dithering_use, _Custom_Data_Mask_OffsetUse, _Add_Speed_Y, _Add_Speed_X);
  if (i == 8u) value = float4(_RGBRGBA, _Main_Speed_X, _Add_Tex_Dithering, 0.0);
  if (i == 9u) value = float4(0.0, 0.0, 0.0, _RDistort_Speed_Y);
  if (i == 10u) value = float4(_RDistort_Speed_X, _RDistort_Power_Y, _RDistort_Power_X, _Custom_Data_Main_OffsetUse);
  if (i == 11u) value = float4(_Main_Speed_Y, _Main_Multiply, _Add_Tex_Multiply, 0.0);
  return value;
}

float4 BA_Fragment_15_CB0(uint i)
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
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_15_CB1((uint)(8)).y * BA_Fragment_15_CB0((uint)(11)).y;
  r0.y = BA_Fragment_15_CB1((uint)(11)).x * BA_Fragment_15_CB0((uint)(11)).y;
  r0.zw = v1.xy * BA_Fragment_15_CB1((uint)(1)).xy + BA_Fragment_15_CB1((uint)(1)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.z = cmp(0 != BA_Fragment_15_CB1((uint)(10)).w);
  r0.zw = r0.zz ? v3.xy : 0;
  r0.xy = r0.xy + r0.zw;
  r0.zw = v1.xy * BA_Fragment_15_CB1((uint)(3)).xy + BA_Fragment_15_CB1((uint)(3)).zw;
  r1.x = BA_Fragment_15_CB1((uint)(10)).x * BA_Fragment_15_CB0((uint)(11)).y;
  r1.y = BA_Fragment_15_CB1((uint)(9)).w * BA_Fragment_15_CB0((uint)(11)).y;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r0.xy = BA_Fragment_15_CB1((uint)(10)).zy * r1.xx + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.xyz = v4.xyz * r0.xyz;
  r1.xyz = BA_Fragment_15_CB1((uint)(0)).xyz * r1.xyz;
  r1.xyz = BA_Fragment_15_CB1((uint)(11)).yyy * r1.xyz;
  r1.xyz = r1.xyz * r0.www;
  r1.w = cmp(0 != BA_Fragment_15_CB1((uint)(8)).x);
  r0.xyz = r1.www ? r0.www : r0.xyz;
  r1.xyz = r1.xyz * r0.xyz;
  r0.yz = v1.xy * BA_Fragment_15_CB1((uint)(4)).xy + BA_Fragment_15_CB1((uint)(4)).zw;
  r0.yz = BA_Fragment_15_CB0((uint)(11)).yy * BA_Fragment_15_CB1((uint)(7)).wz + r0.yz;
  r2.xy = cmp(float2(0,0) != BA_Fragment_15_CB1((uint)(7)).yx);
  r2.xz = r2.xx ? v3.zw : 0;
  r1.w = r2.y ? v2.y : BA_Fragment_15_CB1((uint)(6)).w;
  r0.yz = r2.xz + r0.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r2.xyzw = saturate(r2.yxyz);
  r0.y = r2.x + -r1.w;
  r0.y = saturate(BA_Fragment_15_CB1((uint)(6)).z * r0.y);
  r3.xyz = r1.xyz * r0.yyy;
  r1.xyz = -r1.xyz * r0.yyy + BA_Fragment_15_CB1((uint)(2)).xyz;
  r4.xy = cmp(float2(0,0) != BA_Fragment_15_CB1((uint)(6)).xy);
  r0.z = r4.y ? r0.w : 1;
  r0.w = r4.x ? v2.x : BA_Fragment_15_CB1((uint)(8)).z;
  r2.xyz = r2.yzw + -r0.www;
  r2.xyz = saturate(BA_Fragment_15_CB1((uint)(11)).zzz * r2.xyz);
  r2.xyz = saturate(r2.xyz * r0.zzz);
  o0.xyz = r2.xyz * r1.xyz + r3.xyz;
  r0.z = v4.w * v4.w;
  r0.x = r0.x * r0.z;
  r0.x = BA_Fragment_15_CB1((uint)(0)).w * r0.x;
  r0.x = saturate(BA_Fragment_15_CB1((uint)(11)).y * r0.x);
  o0.w = r0.x * r0.y;
  return;
}
#elif defined(_ADD_TEX_CHANNEL_R) && !defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && !defined(_STEP_TEX_CHANNEL_G) && defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R)
float4 BA_Fragment_16_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Add_Color.x, _Add_Color.y, _Add_Color.z, _Add_Color.w);
  if (i == 3u) value = float4(_R_Tilingxy_Offsetzw.x, _R_Tilingxy_Offsetzw.y, _R_Tilingxy_Offsetzw.z, _R_Tilingxy_Offsetzw.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_G_Tilingxy_Offsetzw.x, _G_Tilingxy_Offsetzw.y, _G_Tilingxy_Offsetzw.z, _G_Tilingxy_Offsetzw.w);
  if (i == 6u) value = float4(_Custom_Data_Add_Tex_Dithering_use, _Main_Tex_Alpha_use, _Step_Tex_Multiply, _Step_Tex_Dithering);
  if (i == 7u) value = float4(_Custom_Data_Step_Tex_Dithering_use, _Custom_Data_Mask_OffsetUse, _Add_Speed_Y, _Add_Speed_X);
  if (i == 8u) value = float4(_RGBRGBA, _Main_Speed_X, _Add_Tex_Dithering, _GDistort_Speed_Y);
  if (i == 9u) value = float4(_GDistort_Speed_X, _GDistort_Power_Y, _GDistort_Power_X, _RDistort_Speed_Y);
  if (i == 10u) value = float4(_RDistort_Speed_X, _RDistort_Power_Y, _RDistort_Power_X, _Custom_Data_Main_OffsetUse);
  if (i == 11u) value = float4(_Main_Speed_Y, _Main_Multiply, _Add_Tex_Multiply, 0.0);
  return value;
}

float4 BA_Fragment_16_CB0(uint i)
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
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_16_CB1((uint)(3)).xy + BA_Fragment_16_CB1((uint)(3)).zw;
  r1.x = BA_Fragment_16_CB1((uint)(10)).x * BA_Fragment_16_CB0((uint)(11)).y;
  r1.y = BA_Fragment_16_CB1((uint)(9)).w * BA_Fragment_16_CB0((uint)(11)).y;
  r0.xy = r1.xy + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.yz = v1.xy * BA_Fragment_16_CB1((uint)(4)).xy + BA_Fragment_16_CB1((uint)(4)).zw;
  r0.yz = BA_Fragment_16_CB0((uint)(11)).yy * BA_Fragment_16_CB1((uint)(7)).wz + r0.yz;
  r1.xy = cmp(float2(0,0) != BA_Fragment_16_CB1((uint)(7)).yx);
  r1.xz = r1.xx ? v3.zw : 0;
  r0.w = r1.y ? v2.y : BA_Fragment_16_CB1((uint)(6)).w;
  r0.w = 1 + -r0.w;
  r0.w = saturate(BA_Fragment_16_CB1((uint)(6)).z * r0.w);
  r0.yz = r1.xz + r0.yz;
  r0.xy = BA_Fragment_16_CB1((uint)(10)).zy * r0.xx + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r1.x = saturate(r1.x);
  r0.xy = cmp(float2(0,0) != BA_Fragment_16_CB1((uint)(6)).xy);
  r0.x = r0.x ? v2.x : BA_Fragment_16_CB1((uint)(8)).z;
  r0.x = r1.x + -r0.x;
  r0.x = saturate(BA_Fragment_16_CB1((uint)(11)).z * r0.x);
  r0.z = cmp(0 != BA_Fragment_16_CB1((uint)(10)).w);
  r1.xy = r0.zz ? v3.xy : 0;
  r2.y = BA_Fragment_16_CB1((uint)(11)).x * BA_Fragment_16_CB0((uint)(11)).y;
  r1.zw = v1.xy * BA_Fragment_16_CB1((uint)(1)).xy + BA_Fragment_16_CB1((uint)(1)).zw;
  r2.xw = BA_Fragment_16_CB1((uint)(8)).yw * BA_Fragment_16_CB0((uint)(11)).yy;
  r1.zw = r2.xy + r1.zw;
  r1.xy = r1.zw + r1.xy;
  r1.zw = v1.xy * BA_Fragment_16_CB1((uint)(5)).xy + BA_Fragment_16_CB1((uint)(5)).zw;
  r2.z = BA_Fragment_16_CB1((uint)(9)).x * BA_Fragment_16_CB0((uint)(11)).y;
  r1.zw = r1.zw + r2.zw;
  r2.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r1.zw).xyzw;
  r1.xy = BA_Fragment_16_CB1((uint)(9)).zy * r2.yy + r1.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = r0.y ? r1.w : 1;
  r0.x = saturate(r0.y * r0.x);
  r2.xyz = v4.xyz * r1.xyz;
  r2.xyz = BA_Fragment_16_CB1((uint)(0)).xyz * r2.xyz;
  r2.xyz = BA_Fragment_16_CB1((uint)(11)).yyy * r2.xyz;
  r2.xyz = r2.xyz * r1.www;
  r0.y = cmp(0 != BA_Fragment_16_CB1((uint)(8)).x);
  r1.xyz = r0.yyy ? r1.www : r1.xyz;
  r1.yzw = r2.xyz * r1.xyz;
  r2.xyz = r1.yzw * r0.www;
  r1.yzw = -r1.yzw * r0.www + BA_Fragment_16_CB1((uint)(2)).xyz;
  o0.xyz = r0.xxx * r1.yzw + r2.xyz;
  r0.x = v4.w * v4.w;
  r0.x = r1.x * r0.x;
  r0.x = BA_Fragment_16_CB1((uint)(0)).w * r0.x;
  r0.x = saturate(BA_Fragment_16_CB1((uint)(11)).y * r0.x);
  o0.w = r0.x * r0.w;
  return;
}
#elif defined(_ADD_TEX_CHANNEL_R) && !defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && !defined(_STEP_TEX_CHANNEL_G) && !defined(_STEP_TEX_CHANNEL_OFF) && defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R)
float4 BA_Fragment_17_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Add_Color.x, _Add_Color.y, _Add_Color.z, _Add_Color.w);
  if (i == 3u) value = float4(_R_Tilingxy_Offsetzw.x, _R_Tilingxy_Offsetzw.y, _R_Tilingxy_Offsetzw.z, _R_Tilingxy_Offsetzw.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_G_Tilingxy_Offsetzw.x, _G_Tilingxy_Offsetzw.y, _G_Tilingxy_Offsetzw.z, _G_Tilingxy_Offsetzw.w);
  if (i == 6u) value = float4(_Custom_Data_Add_Tex_Dithering_use, _Main_Tex_Alpha_use, _Step_Tex_Multiply, _Step_Tex_Dithering);
  if (i == 7u) value = float4(_Custom_Data_Step_Tex_Dithering_use, _Custom_Data_Mask_OffsetUse, _Add_Speed_Y, _Add_Speed_X);
  if (i == 8u) value = float4(_RGBRGBA, _Main_Speed_X, _Add_Tex_Dithering, _GDistort_Speed_Y);
  if (i == 9u) value = float4(_GDistort_Speed_X, _GDistort_Power_Y, _GDistort_Power_X, _RDistort_Speed_Y);
  if (i == 10u) value = float4(_RDistort_Speed_X, _RDistort_Power_Y, _RDistort_Power_X, _Custom_Data_Main_OffsetUse);
  if (i == 11u) value = float4(_Main_Speed_Y, _Main_Multiply, _Add_Tex_Multiply, 0.0);
  return value;
}

float4 BA_Fragment_17_CB0(uint i)
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
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_17_CB1((uint)(5)).xy + BA_Fragment_17_CB1((uint)(5)).zw;
  r1.z = BA_Fragment_17_CB1((uint)(9)).x * BA_Fragment_17_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_17_CB1((uint)(8)).yw * BA_Fragment_17_CB0((uint)(11)).yy;
  r0.xy = r1.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.xz = v1.xy * BA_Fragment_17_CB1((uint)(4)).xy + BA_Fragment_17_CB1((uint)(4)).zw;
  r0.xz = BA_Fragment_17_CB0((uint)(11)).yy * BA_Fragment_17_CB1((uint)(7)).wz + r0.xz;
  r1.zw = cmp(float2(0,0) != BA_Fragment_17_CB1((uint)(7)).yx);
  r2.xy = r1.zz ? v3.zw : 0;
  r0.w = r1.w ? v2.y : BA_Fragment_17_CB1((uint)(6)).w;
  r0.xz = r2.xy + r0.xz;
  r0.xy = BA_Fragment_17_CB1((uint)(9)).zy * r0.yy + r0.xz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r2.x = saturate(r2.x);
  r0.xy = cmp(float2(0,0) != BA_Fragment_17_CB1((uint)(6)).xy);
  r0.x = r0.x ? v2.x : BA_Fragment_17_CB1((uint)(8)).z;
  r0.xz = r2.xx + -r0.xw;
  r0.z = saturate(BA_Fragment_17_CB1((uint)(6)).z * r0.z);
  r0.x = saturate(BA_Fragment_17_CB1((uint)(11)).z * r0.x);
  r1.y = BA_Fragment_17_CB1((uint)(11)).x * BA_Fragment_17_CB0((uint)(11)).y;
  r1.zw = v1.xy * BA_Fragment_17_CB1((uint)(1)).xy + BA_Fragment_17_CB1((uint)(1)).zw;
  r1.xy = r1.xy + r1.zw;
  r0.w = cmp(0 != BA_Fragment_17_CB1((uint)(10)).w);
  r1.zw = r0.ww ? v3.xy : 0;
  r1.xy = r1.xy + r1.zw;
  r1.zw = v1.xy * BA_Fragment_17_CB1((uint)(3)).xy + BA_Fragment_17_CB1((uint)(3)).zw;
  r2.x = BA_Fragment_17_CB1((uint)(10)).x * BA_Fragment_17_CB0((uint)(11)).y;
  r2.y = BA_Fragment_17_CB1((uint)(9)).w * BA_Fragment_17_CB0((uint)(11)).y;
  r1.zw = r2.xy + r1.zw;
  r2.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r1.zw).xyzw;
  r1.xy = BA_Fragment_17_CB1((uint)(10)).zy * r2.xx + r1.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = r0.y ? r1.w : 1;
  r0.x = saturate(r0.y * r0.x);
  r2.xyz = v4.xyz * r1.xyz;
  r2.xyz = BA_Fragment_17_CB1((uint)(0)).xyz * r2.xyz;
  r2.xyz = BA_Fragment_17_CB1((uint)(11)).yyy * r2.xyz;
  r2.xyz = r2.xyz * r1.www;
  r0.y = cmp(0 != BA_Fragment_17_CB1((uint)(8)).x);
  r1.xyz = r0.yyy ? r1.www : r1.xyz;
  r1.yzw = r2.xyz * r1.xyz;
  r2.xyz = r1.yzw * r0.zzz;
  r1.yzw = -r1.yzw * r0.zzz + BA_Fragment_17_CB1((uint)(2)).xyz;
  o0.xyz = r0.xxx * r1.yzw + r2.xyz;
  r0.x = v4.w * v4.w;
  r0.x = r1.x * r0.x;
  r0.x = BA_Fragment_17_CB1((uint)(0)).w * r0.x;
  r0.x = saturate(BA_Fragment_17_CB1((uint)(11)).y * r0.x);
  o0.w = r0.x * r0.z;
  return;
}
#elif defined(_ADD_TEX_CHANNEL_R) && !defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && !defined(_STEP_TEX_CHANNEL_G) && defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R)
float4 BA_Fragment_18_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Add_Color.x, _Add_Color.y, _Add_Color.z, _Add_Color.w);
  if (i == 3u) value = float4(_R_Tilingxy_Offsetzw.x, _R_Tilingxy_Offsetzw.y, _R_Tilingxy_Offsetzw.z, _R_Tilingxy_Offsetzw.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_G_Tilingxy_Offsetzw.x, _G_Tilingxy_Offsetzw.y, _G_Tilingxy_Offsetzw.z, _G_Tilingxy_Offsetzw.w);
  if (i == 6u) value = float4(_Custom_Data_Add_Tex_Dithering_use, _Main_Tex_Alpha_use, _Step_Tex_Multiply, _Step_Tex_Dithering);
  if (i == 7u) value = float4(_Custom_Data_Step_Tex_Dithering_use, _Custom_Data_Mask_OffsetUse, _Add_Speed_Y, _Add_Speed_X);
  if (i == 8u) value = float4(_RGBRGBA, _Main_Speed_X, _Add_Tex_Dithering, _GDistort_Speed_Y);
  if (i == 9u) value = float4(_GDistort_Speed_X, _GDistort_Power_Y, _GDistort_Power_X, _RDistort_Speed_Y);
  if (i == 10u) value = float4(_RDistort_Speed_X, _RDistort_Power_Y, _RDistort_Power_X, _Custom_Data_Main_OffsetUse);
  if (i == 11u) value = float4(_Main_Speed_Y, _Main_Multiply, _Add_Tex_Multiply, 0.0);
  return value;
}

float4 BA_Fragment_18_CB0(uint i)
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
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_18_CB1((uint)(5)).xy + BA_Fragment_18_CB1((uint)(5)).zw;
  r1.z = BA_Fragment_18_CB1((uint)(9)).x * BA_Fragment_18_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_18_CB1((uint)(8)).yw * BA_Fragment_18_CB0((uint)(11)).yy;
  r0.xy = r1.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.xz = v1.xy * BA_Fragment_18_CB1((uint)(4)).xy + BA_Fragment_18_CB1((uint)(4)).zw;
  r0.xz = BA_Fragment_18_CB0((uint)(11)).yy * BA_Fragment_18_CB1((uint)(7)).wz + r0.xz;
  r1.zw = cmp(float2(0,0) != BA_Fragment_18_CB1((uint)(7)).yx);
  r2.xy = r1.zz ? v3.zw : 0;
  r0.w = r1.w ? v2.y : BA_Fragment_18_CB1((uint)(6)).w;
  r0.w = 1 + -r0.w;
  r0.w = saturate(BA_Fragment_18_CB1((uint)(6)).z * r0.w);
  r0.xz = r2.xy + r0.xz;
  r0.xy = BA_Fragment_18_CB1((uint)(9)).zy * r0.yy + r0.xz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r2.x = saturate(r2.x);
  r0.xy = cmp(float2(0,0) != BA_Fragment_18_CB1((uint)(6)).xy);
  r0.x = r0.x ? v2.x : BA_Fragment_18_CB1((uint)(8)).z;
  r0.x = r2.x + -r0.x;
  r0.x = saturate(BA_Fragment_18_CB1((uint)(11)).z * r0.x);
  r1.y = BA_Fragment_18_CB1((uint)(11)).x * BA_Fragment_18_CB0((uint)(11)).y;
  r1.zw = v1.xy * BA_Fragment_18_CB1((uint)(1)).xy + BA_Fragment_18_CB1((uint)(1)).zw;
  r1.xy = r1.xy + r1.zw;
  r0.z = cmp(0 != BA_Fragment_18_CB1((uint)(10)).w);
  r1.zw = r0.zz ? v3.xy : 0;
  r1.xy = r1.xy + r1.zw;
  r1.zw = v1.xy * BA_Fragment_18_CB1((uint)(3)).xy + BA_Fragment_18_CB1((uint)(3)).zw;
  r2.x = BA_Fragment_18_CB1((uint)(10)).x * BA_Fragment_18_CB0((uint)(11)).y;
  r2.y = BA_Fragment_18_CB1((uint)(9)).w * BA_Fragment_18_CB0((uint)(11)).y;
  r1.zw = r2.xy + r1.zw;
  r2.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r1.zw).xyzw;
  r1.xy = BA_Fragment_18_CB1((uint)(10)).zy * r2.xx + r1.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = r0.y ? r1.w : 1;
  r0.x = saturate(r0.y * r0.x);
  r2.xyz = v4.xyz * r1.xyz;
  r2.xyz = BA_Fragment_18_CB1((uint)(0)).xyz * r2.xyz;
  r2.xyz = BA_Fragment_18_CB1((uint)(11)).yyy * r2.xyz;
  r2.xyz = r2.xyz * r1.www;
  r0.y = cmp(0 != BA_Fragment_18_CB1((uint)(8)).x);
  r1.xyz = r0.yyy ? r1.www : r1.xyz;
  r1.yzw = r2.xyz * r1.xyz;
  r2.xyz = r1.yzw * r0.www;
  r1.yzw = -r1.yzw * r0.www + BA_Fragment_18_CB1((uint)(2)).xyz;
  o0.xyz = r0.xxx * r1.yzw + r2.xyz;
  r0.x = v4.w * v4.w;
  r0.x = r1.x * r0.x;
  r0.x = BA_Fragment_18_CB1((uint)(0)).w * r0.x;
  r0.x = saturate(BA_Fragment_18_CB1((uint)(11)).y * r0.x);
  o0.w = r0.x * r0.w;
  return;
}
#elif defined(_ADD_TEX_CHANNEL_R) && !defined(_ADD_TEX_CHANNEL_RGB) && !defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && !defined(_STEP_TEX_CHANNEL_G) && defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && !defined(_TEX_MASK_DISTORT_R)
float4 BA_Fragment_19_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Add_Color.x, _Add_Color.y, _Add_Color.z, _Add_Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_G_Tilingxy_Offsetzw.x, _G_Tilingxy_Offsetzw.y, _G_Tilingxy_Offsetzw.z, _G_Tilingxy_Offsetzw.w);
  if (i == 6u) value = float4(_Custom_Data_Add_Tex_Dithering_use, _Main_Tex_Alpha_use, _Step_Tex_Multiply, _Step_Tex_Dithering);
  if (i == 7u) value = float4(_Custom_Data_Step_Tex_Dithering_use, _Custom_Data_Mask_OffsetUse, _Add_Speed_Y, _Add_Speed_X);
  if (i == 8u) value = float4(_RGBRGBA, _Main_Speed_X, _Add_Tex_Dithering, _GDistort_Speed_Y);
  if (i == 9u) value = float4(_GDistort_Speed_X, _GDistort_Power_Y, _GDistort_Power_X, 0.0);
  if (i == 10u) value = float4(0.0, 0.0, 0.0, _Custom_Data_Main_OffsetUse);
  if (i == 11u) value = float4(_Main_Speed_Y, _Main_Multiply, _Add_Tex_Multiply, 0.0);
  return value;
}

float4 BA_Fragment_19_CB0(uint i)
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
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_19_CB1((uint)(5)).xy + BA_Fragment_19_CB1((uint)(5)).zw;
  r1.z = BA_Fragment_19_CB1((uint)(9)).x * BA_Fragment_19_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_19_CB1((uint)(8)).yw * BA_Fragment_19_CB0((uint)(11)).yy;
  r0.xy = r1.zw + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.xz = v1.xy * BA_Fragment_19_CB1((uint)(4)).xy + BA_Fragment_19_CB1((uint)(4)).zw;
  r0.xz = BA_Fragment_19_CB0((uint)(11)).yy * BA_Fragment_19_CB1((uint)(7)).wz + r0.xz;
  r1.zw = cmp(float2(0,0) != BA_Fragment_19_CB1((uint)(7)).yx);
  r2.xy = r1.zz ? v3.zw : 0;
  r0.w = r1.w ? v2.y : BA_Fragment_19_CB1((uint)(6)).w;
  r0.w = 1 + -r0.w;
  r0.w = saturate(BA_Fragment_19_CB1((uint)(6)).z * r0.w);
  r0.xz = r2.xy + r0.xz;
  r0.xy = BA_Fragment_19_CB1((uint)(9)).zy * r0.yy + r0.xz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r2.x = saturate(r2.x);
  r0.xy = cmp(float2(0,0) != BA_Fragment_19_CB1((uint)(6)).xy);
  r0.x = r0.x ? v2.x : BA_Fragment_19_CB1((uint)(8)).z;
  r0.x = r2.x + -r0.x;
  r0.x = saturate(BA_Fragment_19_CB1((uint)(11)).z * r0.x);
  r1.y = BA_Fragment_19_CB1((uint)(11)).x * BA_Fragment_19_CB0((uint)(11)).y;
  r1.zw = v1.xy * BA_Fragment_19_CB1((uint)(1)).xy + BA_Fragment_19_CB1((uint)(1)).zw;
  r1.xy = r1.xy + r1.zw;
  r0.z = cmp(0 != BA_Fragment_19_CB1((uint)(10)).w);
  r1.zw = r0.zz ? v3.xy : 0;
  r1.xy = r1.xy + r1.zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = r0.y ? r1.w : 1;
  r0.x = saturate(r0.y * r0.x);
  r2.xyz = v4.xyz * r1.xyz;
  r2.xyz = BA_Fragment_19_CB1((uint)(0)).xyz * r2.xyz;
  r2.xyz = BA_Fragment_19_CB1((uint)(11)).yyy * r2.xyz;
  r2.xyz = r2.xyz * r1.www;
  r0.y = cmp(0 != BA_Fragment_19_CB1((uint)(8)).x);
  r1.xyz = r0.yyy ? r1.www : r1.xyz;
  r1.yzw = r2.xyz * r1.xyz;
  r2.xyz = r1.yzw * r0.www;
  r1.yzw = -r1.yzw * r0.www + BA_Fragment_19_CB1((uint)(2)).xyz;
  o0.xyz = r0.xxx * r1.yzw + r2.xyz;
  r0.x = v4.w * v4.w;
  r0.x = r1.x * r0.x;
  r0.x = BA_Fragment_19_CB1((uint)(0)).w * r0.x;
  r0.x = saturate(BA_Fragment_19_CB1((uint)(11)).y * r0.x);
  o0.w = r0.x * r0.w;
  return;
}
#elif defined(_ADD_TEX_CHANNEL_R) && !defined(_ADD_TEX_CHANNEL_RGB) && defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && defined(_STEP_TEX_CHANNEL_G) && !defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && !defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R)
float4 BA_Fragment_20_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Add_Color.x, _Add_Color.y, _Add_Color.z, _Add_Color.w);
  if (i == 3u) value = float4(_R_Tilingxy_Offsetzw.x, _R_Tilingxy_Offsetzw.y, _R_Tilingxy_Offsetzw.z, _R_Tilingxy_Offsetzw.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 6u) value = float4(_Custom_Data_Add_Tex_Dithering_use, _Main_Tex_Alpha_use, _Step_Tex_Multiply, _Step_Tex_Dithering);
  if (i == 7u) value = float4(_Custom_Data_Step_Tex_Dithering_use, _Custom_Data_Mask_OffsetUse, _Add_Speed_Y, _Add_Speed_X);
  if (i == 8u) value = float4(_RGBRGBA, _Main_Speed_X, _Add_Tex_Dithering, 0.0);
  if (i == 9u) value = float4(0.0, 0.0, 0.0, _RDistort_Speed_Y);
  if (i == 10u) value = float4(_RDistort_Speed_X, _RDistort_Power_Y, _RDistort_Power_X, _Custom_Data_Main_OffsetUse);
  if (i == 11u) value = float4(_Main_Speed_Y, _Main_Multiply, _Add_Tex_Multiply, 0.0);
  return value;
}

float4 BA_Fragment_20_CB0(uint i)
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
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_20_CB1((uint)(8)).y * BA_Fragment_20_CB0((uint)(11)).y;
  r0.y = BA_Fragment_20_CB1((uint)(11)).x * BA_Fragment_20_CB0((uint)(11)).y;
  r0.zw = v1.xy * BA_Fragment_20_CB1((uint)(1)).xy + BA_Fragment_20_CB1((uint)(1)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.z = cmp(0 != BA_Fragment_20_CB1((uint)(10)).w);
  r0.zw = r0.zz ? v3.xy : 0;
  r0.xy = r0.xy + r0.zw;
  r0.zw = v1.xy * BA_Fragment_20_CB1((uint)(3)).xy + BA_Fragment_20_CB1((uint)(3)).zw;
  r1.x = BA_Fragment_20_CB1((uint)(10)).x * BA_Fragment_20_CB0((uint)(11)).y;
  r1.y = BA_Fragment_20_CB1((uint)(9)).w * BA_Fragment_20_CB0((uint)(11)).y;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r0.xy = BA_Fragment_20_CB1((uint)(10)).zy * r1.xx + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r1.yzw = v4.xyz * r0.xyz;
  r1.yzw = BA_Fragment_20_CB1((uint)(0)).xyz * r1.yzw;
  r1.yzw = BA_Fragment_20_CB1((uint)(11)).yyy * r1.yzw;
  r1.yzw = r1.yzw * r0.www;
  r2.x = cmp(0 != BA_Fragment_20_CB1((uint)(8)).x);
  r0.xyz = r2.xxx ? r0.www : r0.xyz;
  r1.yzw = r1.yzw * r0.xyz;
  r0.yz = v1.xy * BA_Fragment_20_CB1((uint)(4)).xy + BA_Fragment_20_CB1((uint)(4)).zw;
  r0.yz = BA_Fragment_20_CB0((uint)(11)).yy * BA_Fragment_20_CB1((uint)(7)).wz + r0.yz;
  r2.xy = cmp(float2(0,0) != BA_Fragment_20_CB1((uint)(7)).yx);
  r2.xz = r2.xx ? v3.zw : 0;
  r2.y = r2.y ? v2.y : BA_Fragment_20_CB1((uint)(6)).w;
  r0.yz = r2.xz + r0.yz;
  r0.yz = BA_Fragment_20_CB1((uint)(10)).zy * r1.xx + r0.yz;
  r3.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).yxzw;
  r3.xy = saturate(r3.xy);
  r0.y = r3.x + -r2.y;
  r0.y = saturate(BA_Fragment_20_CB1((uint)(6)).z * r0.y);
  r2.xyz = r1.yzw * r0.yyy;
  r1.xyz = -r1.yzw * r0.yyy + BA_Fragment_20_CB1((uint)(2)).xyz;
  r3.xz = cmp(float2(0,0) != BA_Fragment_20_CB1((uint)(6)).xy);
  r0.z = r3.x ? v2.x : BA_Fragment_20_CB1((uint)(8)).z;
  r0.w = r3.z ? r0.w : 1;
  r0.z = r3.y + -r0.z;
  r0.z = saturate(BA_Fragment_20_CB1((uint)(11)).z * r0.z);
  r0.z = saturate(r0.w * r0.z);
  r1.xyz = r0.zzz * r1.xyz + r2.xyz;
  r0.z = v4.w * v4.w;
  r0.x = r0.x * r0.z;
  r0.x = BA_Fragment_20_CB1((uint)(0)).w * r0.x;
  r0.x = saturate(BA_Fragment_20_CB1((uint)(11)).y * r0.x);
  r0.x = r0.x * r0.y;
  o0.xyz = r1.xyz * r0.xxx;
  o0.w = r0.x;
  return;
}
#elif defined(_ADD_TEX_CHANNEL_R) && !defined(_ADD_TEX_CHANNEL_RGB) && defined(_ALPHAPREMULTIPLY_ON) && defined(_MAIN_UV_CHANNEL_UV1) && defined(_MASK_UV_CHANNEL_UV1) && defined(_STEP_TEX_CHANNEL_G) && !defined(_STEP_TEX_CHANNEL_OFF) && !defined(_STEP_TEX_CHANNEL_R) && !defined(_STEP_TEX_CHANNEL_RGB) && defined(_TEX_MAIN_DISTORT_G) && !defined(_TEX_MAIN_DISTORT_OFF) && !defined(_TEX_MAIN_DISTORT_R) && !defined(_TEX_MASK_DISTORT_G) && !defined(_TEX_MASK_DISTORT_OFF) && defined(_TEX_MASK_DISTORT_R)
float4 BA_Fragment_21_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Add_Color.x, _Add_Color.y, _Add_Color.z, _Add_Color.w);
  if (i == 3u) value = float4(_R_Tilingxy_Offsetzw.x, _R_Tilingxy_Offsetzw.y, _R_Tilingxy_Offsetzw.z, _R_Tilingxy_Offsetzw.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_G_Tilingxy_Offsetzw.x, _G_Tilingxy_Offsetzw.y, _G_Tilingxy_Offsetzw.z, _G_Tilingxy_Offsetzw.w);
  if (i == 6u) value = float4(_Custom_Data_Add_Tex_Dithering_use, _Main_Tex_Alpha_use, _Step_Tex_Multiply, _Step_Tex_Dithering);
  if (i == 7u) value = float4(_Custom_Data_Step_Tex_Dithering_use, _Custom_Data_Mask_OffsetUse, _Add_Speed_Y, _Add_Speed_X);
  if (i == 8u) value = float4(_RGBRGBA, _Main_Speed_X, _Add_Tex_Dithering, _GDistort_Speed_Y);
  if (i == 9u) value = float4(_GDistort_Speed_X, _GDistort_Power_Y, _GDistort_Power_X, _RDistort_Speed_Y);
  if (i == 10u) value = float4(_RDistort_Speed_X, _RDistort_Power_Y, _RDistort_Power_X, _Custom_Data_Main_OffsetUse);
  if (i == 11u) value = float4(_Main_Speed_Y, _Main_Multiply, _Add_Tex_Multiply, 0.0);
  return value;
}

float4 BA_Fragment_21_CB0(uint i)
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
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_21_CB1((uint)(3)).xy + BA_Fragment_21_CB1((uint)(3)).zw;
  r1.x = BA_Fragment_21_CB1((uint)(10)).x * BA_Fragment_21_CB0((uint)(11)).y;
  r1.y = BA_Fragment_21_CB1((uint)(9)).w * BA_Fragment_21_CB0((uint)(11)).y;
  r0.xy = r1.xy + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.yz = v1.xy * BA_Fragment_21_CB1((uint)(4)).xy + BA_Fragment_21_CB1((uint)(4)).zw;
  r0.yz = BA_Fragment_21_CB0((uint)(11)).yy * BA_Fragment_21_CB1((uint)(7)).wz + r0.yz;
  r1.xy = cmp(float2(0,0) != BA_Fragment_21_CB1((uint)(7)).yx);
  r1.xz = r1.xx ? v3.zw : 0;
  r0.w = r1.y ? v2.y : BA_Fragment_21_CB1((uint)(6)).w;
  r0.yz = r1.xz + r0.yz;
  r0.xy = BA_Fragment_21_CB1((uint)(10)).zy * r0.xx + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).yxzw;
  r1.xy = saturate(r1.xy);
  r0.xy = cmp(float2(0,0) != BA_Fragment_21_CB1((uint)(6)).xy);
  r0.x = r0.x ? v2.x : BA_Fragment_21_CB1((uint)(8)).z;
  r0.xz = r1.yx + -r0.xw;
  r0.z = saturate(BA_Fragment_21_CB1((uint)(6)).z * r0.z);
  r0.x = saturate(BA_Fragment_21_CB1((uint)(11)).z * r0.x);
  r0.w = cmp(0 != BA_Fragment_21_CB1((uint)(10)).w);
  r1.xy = r0.ww ? v3.xy : 0;
  r2.y = BA_Fragment_21_CB1((uint)(11)).x * BA_Fragment_21_CB0((uint)(11)).y;
  r1.zw = v1.xy * BA_Fragment_21_CB1((uint)(1)).xy + BA_Fragment_21_CB1((uint)(1)).zw;
  r2.xw = BA_Fragment_21_CB1((uint)(8)).yw * BA_Fragment_21_CB0((uint)(11)).yy;
  r1.zw = r2.xy + r1.zw;
  r1.xy = r1.zw + r1.xy;
  r1.zw = v1.xy * BA_Fragment_21_CB1((uint)(5)).xy + BA_Fragment_21_CB1((uint)(5)).zw;
  r2.z = BA_Fragment_21_CB1((uint)(9)).x * BA_Fragment_21_CB0((uint)(11)).y;
  r1.zw = r1.zw + r2.zw;
  r2.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r1.zw).xyzw;
  r1.xy = BA_Fragment_21_CB1((uint)(9)).zy * r2.yy + r1.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = r0.y ? r1.w : 1;
  r0.x = saturate(r0.y * r0.x);
  r2.xyz = v4.xyz * r1.xyz;
  r2.xyz = BA_Fragment_21_CB1((uint)(0)).xyz * r2.xyz;
  r2.xyz = BA_Fragment_21_CB1((uint)(11)).yyy * r2.xyz;
  r2.xyz = r2.xyz * r1.www;
  r0.y = cmp(0 != BA_Fragment_21_CB1((uint)(8)).x);
  r1.xyz = r0.yyy ? r1.www : r1.xyz;
  r1.yzw = r2.xyz * r1.xyz;
  r2.xyz = r1.yzw * r0.zzz;
  r1.yzw = -r1.yzw * r0.zzz + BA_Fragment_21_CB1((uint)(2)).xyz;
  r0.xyw = r0.xxx * r1.yzw + r2.xyz;
  r1.y = v4.w * v4.w;
  r1.x = r1.x * r1.y;
  r1.x = BA_Fragment_21_CB1((uint)(0)).w * r1.x;
  r1.x = saturate(BA_Fragment_21_CB1((uint)(11)).y * r1.x);
  r0.z = r1.x * r0.z;
  o0.xyz = r0.xyw * r0.zzz;
  o0.w = r0.z;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Frag(out float4 color : SV_TARGET0) { color = float4(1,0,1,1); }
#endif
