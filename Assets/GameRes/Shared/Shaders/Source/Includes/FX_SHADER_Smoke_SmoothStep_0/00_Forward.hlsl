// Exact names and types from the original compiled parameter metadata.
float _Alpha;
float _Alphaclip_Value;
float4 _Color;
float _GDissolve_Speed_X;
float _GDissolve_Speed_Y;
float _GDissolve_Str;
float4 _GTillingxyOffsetzw;
float _Gra_Lerp;
float4 _Gra_TillingxyOffsetzw;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mask_Speed_X;
float _Mask_Speed_Y;
float _RDistort_Speed_X;
float _RDistort_Speed_Y;
float _RDistortion_Power_X;
float _RDistortion_Power_Y;
float4 _RTillingxyOffsetzw;
float _Smooth;
float _Subtract;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
Texture2D<float4> _Tex_RDistortGDissolve;
SamplerState sampler_Tex_Main;
SamplerState sampler_Tex_Mask;
SamplerState sampler_Tex_RDistortGDissolve;
#ifndef cmp
#define cmp -
#endif

#if !defined(_ALPHAPREMULTIPLY_ON) && !defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
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
  o1.xyzw = v2.xyzw;
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
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
  o1.xyzw = v2.xyzw;
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
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
  o1.xyzw = v2.xyzw;
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
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
  o1.xyzw = v2.xyzw;
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
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
  o1.xyzw = v2.xyzw;
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
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
  o1.xyzw = v2.xyzw;
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
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
  o1.xyzw = v2.xyzw;
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
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
  o1.xyzw = v2.xyzw;
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
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
  o1.xyzw = v2.xyzw;
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
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
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && !defined(_GRA_WRAP_CLAMP) && defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
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
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
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
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Vert(float4 position : POSITION, out float4 clip : SV_POSITION) { clip = TransformObjectToHClip(position.xyz); }
#endif

#if !defined(_ALPHAPREMULTIPLY_ON) && !defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Fragment_15_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 5u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 6u) value = float4(_Mask_Speed_X, _Alpha, _Gra_Lerp, _GDissolve_Str);
  if (i == 7u) value = float4(_GDissolve_Speed_Y, _GDissolve_Speed_X, _Smooth, _Subtract);
  if (i == 8u) value = float4(_Main_Speed_Y, _Main_Speed_X, 0.0, 0.0);
  if (i == 9u) value = float4(0.0, 0.0, _Mask_Speed_Y, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_15_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_15_CB1((uint)(5)).xy + BA_Fragment_15_CB1((uint)(5)).zw;
  r0.xy = BA_Fragment_15_CB1((uint)(7)).yx * BA_Fragment_15_CB0((uint)(11)).yy + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.x = v2.x * BA_Fragment_15_CB1((uint)(4)).x + BA_Fragment_15_CB1((uint)(4)).z;
  r0.x = -r0.y * BA_Fragment_15_CB1((uint)(6)).w + r0.x;
  r0.y = BA_Fragment_15_CB1((uint)(6)).w * r0.y;
  r0.x = BA_Fragment_15_CB1((uint)(6)).z * r0.x + r0.y;
  r0.x = -BA_Fragment_15_CB1((uint)(7)).w + r0.x;
  r0.y = 1 / BA_Fragment_15_CB1((uint)(7)).z;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_15_CB1((uint)(1)).xy + BA_Fragment_15_CB1((uint)(1)).zw;
  r0.yz = BA_Fragment_15_CB1((uint)(8)).yx * BA_Fragment_15_CB0((uint)(11)).yy + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = r1.x * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_15_CB1((uint)(6)).y * r0.x;
  r0.y = BA_Fragment_15_CB1((uint)(0)).w * r1.w;
  r1.xyz = v1.xyz * r1.xyz;
  o0.xyz = BA_Fragment_15_CB1((uint)(0)).xyz * r1.xyz;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_15_CB1((uint)(2)).xy + BA_Fragment_15_CB1((uint)(2)).zw;
  r1.x = BA_Fragment_15_CB1((uint)(6)).x * BA_Fragment_15_CB0((uint)(11)).y;
  r1.y = BA_Fragment_15_CB1((uint)(9)).z * BA_Fragment_15_CB0((uint)(11)).y;
  r0.yz = r1.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_15_CB1((uint)(9)).w + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Fragment_16_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 5u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 6u) value = float4(_Mask_Speed_X, _Alpha, _Gra_Lerp, _GDissolve_Str);
  if (i == 7u) value = float4(_GDissolve_Speed_Y, _GDissolve_Speed_X, _Smooth, _Subtract);
  if (i == 8u) value = float4(_Main_Speed_Y, _Main_Speed_X, 0.0, 0.0);
  if (i == 9u) value = float4(0.0, 0.0, _Mask_Speed_Y, _Alphaclip_Value);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_16_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_16_CB1((uint)(5)).xy + BA_Fragment_16_CB1((uint)(5)).zw;
  r0.xy = BA_Fragment_16_CB1((uint)(7)).yx * BA_Fragment_16_CB0((uint)(11)).yy + r0.xy;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.x = v2.x * BA_Fragment_16_CB1((uint)(4)).x + BA_Fragment_16_CB1((uint)(4)).z;
  r0.x = -r0.y * BA_Fragment_16_CB1((uint)(6)).w + r0.x;
  r0.y = BA_Fragment_16_CB1((uint)(6)).w * r0.y;
  r0.x = BA_Fragment_16_CB1((uint)(6)).z * r0.x + r0.y;
  r0.yz = BA_Fragment_16_CB1((uint)(7)).wz + v3.xy;
  r0.x = r0.x + -r0.y;
  r0.y = 1 / r0.z;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_16_CB1((uint)(1)).xy + BA_Fragment_16_CB1((uint)(1)).zw;
  r0.yz = BA_Fragment_16_CB1((uint)(8)).yx * BA_Fragment_16_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = r1.x * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_16_CB1((uint)(6)).y * r0.x;
  r0.y = BA_Fragment_16_CB1((uint)(0)).w * r1.w;
  r1.xyz = v1.xyz * r1.xyz;
  o0.xyz = BA_Fragment_16_CB1((uint)(0)).xyz * r1.xyz;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_16_CB1((uint)(2)).xy + BA_Fragment_16_CB1((uint)(2)).zw;
  r1.x = BA_Fragment_16_CB1((uint)(6)).x * BA_Fragment_16_CB0((uint)(11)).y;
  r1.y = BA_Fragment_16_CB1((uint)(9)).z * BA_Fragment_16_CB0((uint)(11)).y;
  r0.yz = r1.xy + r0.yz;
  r0.yz = v4.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_16_CB1((uint)(9)).w + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
float4 BA_Fragment_17_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 5u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 6u) value = float4(_Mask_Speed_X, _Alpha, _Gra_Lerp, _GDissolve_Str);
  if (i == 7u) value = float4(_GDissolve_Speed_Y, _GDissolve_Speed_X, _Smooth, _Subtract);
  if (i == 8u) value = float4(_Main_Speed_Y, _Main_Speed_X, 0.0, 0.0);
  if (i == 9u) value = float4(0.0, 0.0, _Mask_Speed_Y, _Alphaclip_Value);
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
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_17_CB1((uint)(5)).xy + BA_Fragment_17_CB1((uint)(5)).zw;
  r0.xy = BA_Fragment_17_CB1((uint)(7)).yx * BA_Fragment_17_CB0((uint)(11)).yy + r0.xy;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.x = v2.x * BA_Fragment_17_CB1((uint)(4)).x + BA_Fragment_17_CB1((uint)(4)).z;
  r0.x = -r0.y * BA_Fragment_17_CB1((uint)(6)).w + r0.x;
  r0.y = BA_Fragment_17_CB1((uint)(6)).w * r0.y;
  r0.x = BA_Fragment_17_CB1((uint)(6)).z * r0.x + r0.y;
  r0.yz = BA_Fragment_17_CB1((uint)(7)).wz + v3.xy;
  r0.x = r0.x + -r0.y;
  r0.y = 1 / r0.z;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_17_CB1((uint)(1)).xy + BA_Fragment_17_CB1((uint)(1)).zw;
  r0.yz = BA_Fragment_17_CB1((uint)(8)).yx * BA_Fragment_17_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = r1.w * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_17_CB1((uint)(6)).y * r0.x;
  r0.y = BA_Fragment_17_CB1((uint)(0)).w * r1.w;
  r1.xyz = v1.xyz * r1.xyz;
  o0.xyz = BA_Fragment_17_CB1((uint)(0)).xyz * r1.xyz;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_17_CB1((uint)(2)).xy + BA_Fragment_17_CB1((uint)(2)).zw;
  r1.x = BA_Fragment_17_CB1((uint)(6)).x * BA_Fragment_17_CB0((uint)(11)).y;
  r1.y = BA_Fragment_17_CB1((uint)(9)).z * BA_Fragment_17_CB0((uint)(11)).y;
  r0.yz = r1.xy + r0.yz;
  r0.yz = v4.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_17_CB1((uint)(9)).w + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
float4 BA_Fragment_18_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 5u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 6u) value = float4(_Mask_Speed_X, _Alpha, _Gra_Lerp, _GDissolve_Str);
  if (i == 7u) value = float4(_GDissolve_Speed_Y, _GDissolve_Speed_X, _Smooth, _Subtract);
  if (i == 8u) value = float4(_Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y, _RDistort_Speed_X);
  if (i == 9u) value = float4(_RDistortion_Power_Y, _RDistortion_Power_X, _Mask_Speed_Y, _Alphaclip_Value);
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
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_18_CB1((uint)(5)).xy + BA_Fragment_18_CB1((uint)(5)).zw;
  r0.xy = BA_Fragment_18_CB1((uint)(7)).yx * BA_Fragment_18_CB0((uint)(11)).yy + r0.xy;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.x = v2.x * BA_Fragment_18_CB1((uint)(4)).x + BA_Fragment_18_CB1((uint)(4)).z;
  r0.x = -r0.y * BA_Fragment_18_CB1((uint)(6)).w + r0.x;
  r0.y = BA_Fragment_18_CB1((uint)(6)).w * r0.y;
  r0.x = BA_Fragment_18_CB1((uint)(6)).z * r0.x + r0.y;
  r0.yz = BA_Fragment_18_CB1((uint)(7)).wz + v3.xy;
  r0.x = r0.x + -r0.y;
  r0.y = 1 / r0.z;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r0.yz = BA_Fragment_18_CB1((uint)(8)).wz * BA_Fragment_18_CB0((uint)(11)).yy;
  r0.yz = frac(r0.yz);
  r1.xy = v2.xy * BA_Fragment_18_CB1((uint)(3)).xy + BA_Fragment_18_CB1((uint)(3)).zw;
  r0.yz = r1.xy + r0.yz;
  r1.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.yz = v2.xy * BA_Fragment_18_CB1((uint)(1)).xy + BA_Fragment_18_CB1((uint)(1)).zw;
  r0.yz = BA_Fragment_18_CB1((uint)(9)).yx * r1.xx + r0.yz;
  r0.yz = BA_Fragment_18_CB1((uint)(8)).yx * BA_Fragment_18_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = r1.w * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_18_CB1((uint)(6)).y * r0.x;
  r0.y = BA_Fragment_18_CB1((uint)(0)).w * r1.w;
  r1.xyz = v1.xyz * r1.xyz;
  o0.xyz = BA_Fragment_18_CB1((uint)(0)).xyz * r1.xyz;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_18_CB1((uint)(2)).xy + BA_Fragment_18_CB1((uint)(2)).zw;
  r1.x = BA_Fragment_18_CB1((uint)(6)).x * BA_Fragment_18_CB0((uint)(11)).y;
  r1.y = BA_Fragment_18_CB1((uint)(9)).z * BA_Fragment_18_CB0((uint)(11)).y;
  r0.yz = r1.xy + r0.yz;
  r0.yz = v4.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_18_CB1((uint)(9)).w + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Fragment_19_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 5u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 6u) value = float4(_Mask_Speed_X, _Alpha, _Gra_Lerp, _GDissolve_Str);
  if (i == 7u) value = float4(_GDissolve_Speed_Y, _GDissolve_Speed_X, _Smooth, _Subtract);
  if (i == 8u) value = float4(_Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y, _RDistort_Speed_X);
  if (i == 9u) value = float4(_RDistortion_Power_Y, _RDistortion_Power_X, _Mask_Speed_Y, _Alphaclip_Value);
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
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_19_CB1((uint)(8)).wz * BA_Fragment_19_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v2.xy * BA_Fragment_19_CB1((uint)(3)).xy + BA_Fragment_19_CB1((uint)(3)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.yz = v2.xy * BA_Fragment_19_CB1((uint)(5)).xy + BA_Fragment_19_CB1((uint)(5)).zw;
  r0.xy = BA_Fragment_19_CB1((uint)(9)).yx * r0.xx + r0.yz;
  r0.xy = BA_Fragment_19_CB1((uint)(7)).yx * BA_Fragment_19_CB0((uint)(11)).yy + r0.xy;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.x = v2.x * BA_Fragment_19_CB1((uint)(4)).x + BA_Fragment_19_CB1((uint)(4)).z;
  r0.x = -r0.y * BA_Fragment_19_CB1((uint)(6)).w + r0.x;
  r0.y = BA_Fragment_19_CB1((uint)(6)).w * r0.y;
  r0.x = BA_Fragment_19_CB1((uint)(6)).z * r0.x + r0.y;
  r0.yz = BA_Fragment_19_CB1((uint)(7)).wz + v3.xy;
  r0.x = r0.x + -r0.y;
  r0.y = 1 / r0.z;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_19_CB1((uint)(1)).xy + BA_Fragment_19_CB1((uint)(1)).zw;
  r0.yz = BA_Fragment_19_CB1((uint)(8)).yx * BA_Fragment_19_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = r1.x * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_19_CB1((uint)(6)).y * r0.x;
  r0.y = BA_Fragment_19_CB1((uint)(0)).w * r1.w;
  r1.xyz = v1.xyz * r1.xyz;
  o0.xyz = BA_Fragment_19_CB1((uint)(0)).xyz * r1.xyz;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_19_CB1((uint)(2)).xy + BA_Fragment_19_CB1((uint)(2)).zw;
  r1.x = BA_Fragment_19_CB1((uint)(6)).x * BA_Fragment_19_CB0((uint)(11)).y;
  r1.y = BA_Fragment_19_CB1((uint)(9)).z * BA_Fragment_19_CB0((uint)(11)).y;
  r0.yz = r1.xy + r0.yz;
  r0.yz = v4.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_19_CB1((uint)(9)).w + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
float4 BA_Fragment_20_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 5u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 6u) value = float4(_Mask_Speed_X, _Alpha, _Gra_Lerp, _GDissolve_Str);
  if (i == 7u) value = float4(_GDissolve_Speed_Y, _GDissolve_Speed_X, _Smooth, _Subtract);
  if (i == 8u) value = float4(_Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y, _RDistort_Speed_X);
  if (i == 9u) value = float4(_RDistortion_Power_Y, _RDistortion_Power_X, _Mask_Speed_Y, _Alphaclip_Value);
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
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_20_CB1((uint)(8)).wz * BA_Fragment_20_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v2.xy * BA_Fragment_20_CB1((uint)(3)).xy + BA_Fragment_20_CB1((uint)(3)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.yz = v2.xy * BA_Fragment_20_CB1((uint)(5)).xy + BA_Fragment_20_CB1((uint)(5)).zw;
  r0.xy = BA_Fragment_20_CB1((uint)(9)).yx * r0.xx + r0.yz;
  r0.xy = BA_Fragment_20_CB1((uint)(7)).yx * BA_Fragment_20_CB0((uint)(11)).yy + r0.xy;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.x = v2.x * BA_Fragment_20_CB1((uint)(4)).x + BA_Fragment_20_CB1((uint)(4)).z;
  r0.x = -r0.y * BA_Fragment_20_CB1((uint)(6)).w + r0.x;
  r0.y = BA_Fragment_20_CB1((uint)(6)).w * r0.y;
  r0.x = BA_Fragment_20_CB1((uint)(6)).z * r0.x + r0.y;
  r0.yz = BA_Fragment_20_CB1((uint)(7)).wz + v3.xy;
  r0.x = r0.x + -r0.y;
  r0.y = 1 / r0.z;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_20_CB1((uint)(1)).xy + BA_Fragment_20_CB1((uint)(1)).zw;
  r0.yz = BA_Fragment_20_CB1((uint)(8)).yx * BA_Fragment_20_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = r1.w * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_20_CB1((uint)(6)).y * r0.x;
  r0.y = BA_Fragment_20_CB1((uint)(0)).w * r1.w;
  r1.xyz = v1.xyz * r1.xyz;
  o0.xyz = BA_Fragment_20_CB1((uint)(0)).xyz * r1.xyz;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_20_CB1((uint)(2)).xy + BA_Fragment_20_CB1((uint)(2)).zw;
  r1.x = BA_Fragment_20_CB1((uint)(6)).x * BA_Fragment_20_CB0((uint)(11)).y;
  r1.y = BA_Fragment_20_CB1((uint)(9)).z * BA_Fragment_20_CB0((uint)(11)).y;
  r0.yz = r1.xy + r0.yz;
  r0.yz = v4.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_20_CB1((uint)(9)).w + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
float4 BA_Fragment_21_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 5u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 6u) value = float4(_Mask_Speed_X, _Alpha, _Gra_Lerp, _GDissolve_Str);
  if (i == 7u) value = float4(_GDissolve_Speed_Y, _GDissolve_Speed_X, _Smooth, _Subtract);
  if (i == 8u) value = float4(_Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y, _RDistort_Speed_X);
  if (i == 9u) value = float4(_RDistortion_Power_Y, _RDistortion_Power_X, _Mask_Speed_Y, _Alphaclip_Value);
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
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_21_CB1((uint)(8)).wz * BA_Fragment_21_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v2.xy * BA_Fragment_21_CB1((uint)(3)).xy + BA_Fragment_21_CB1((uint)(3)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.yz = v2.xy * BA_Fragment_21_CB1((uint)(5)).xy + BA_Fragment_21_CB1((uint)(5)).zw;
  r0.yz = BA_Fragment_21_CB1((uint)(9)).yx * r0.xx + r0.yz;
  r0.yz = BA_Fragment_21_CB1((uint)(7)).yx * BA_Fragment_21_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v4.zw + r0.yz;
  r1.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.y = v2.x * BA_Fragment_21_CB1((uint)(4)).x + BA_Fragment_21_CB1((uint)(4)).z;
  r0.y = -r1.y * BA_Fragment_21_CB1((uint)(6)).w + r0.y;
  r0.z = BA_Fragment_21_CB1((uint)(6)).w * r1.y;
  r0.y = BA_Fragment_21_CB1((uint)(6)).z * r0.y + r0.z;
  r0.zw = BA_Fragment_21_CB1((uint)(7)).wz + v3.xy;
  r0.y = r0.y + -r0.z;
  r0.z = 1 / r0.w;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.y * -2 + 3;
  r0.y = r0.y * r0.y;
  r0.y = r0.z * r0.y;
  r0.zw = v2.xy * BA_Fragment_21_CB1((uint)(1)).xy + BA_Fragment_21_CB1((uint)(1)).zw;
  r0.xz = BA_Fragment_21_CB1((uint)(9)).yx * r0.xx + r0.zw;
  r0.xz = BA_Fragment_21_CB1((uint)(8)).yx * BA_Fragment_21_CB0((uint)(11)).yy + r0.xz;
  r0.xz = v3.zw + r0.xz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xz).xyzw;
  r0.x = r1.w * r0.y;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_21_CB1((uint)(6)).y * r0.x;
  r0.y = BA_Fragment_21_CB1((uint)(0)).w * r1.w;
  r1.xyz = v1.xyz * r1.xyz;
  o0.xyz = BA_Fragment_21_CB1((uint)(0)).xyz * r1.xyz;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_21_CB1((uint)(2)).xy + BA_Fragment_21_CB1((uint)(2)).zw;
  r1.x = BA_Fragment_21_CB1((uint)(6)).x * BA_Fragment_21_CB0((uint)(11)).y;
  r1.y = BA_Fragment_21_CB1((uint)(9)).z * BA_Fragment_21_CB0((uint)(11)).y;
  r0.yz = r1.xy + r0.yz;
  r0.yz = v4.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_21_CB1((uint)(9)).w + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
float4 BA_Fragment_22_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 5u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 6u) value = float4(_Mask_Speed_X, _Alpha, _Gra_Lerp, _GDissolve_Str);
  if (i == 7u) value = float4(_GDissolve_Speed_Y, _GDissolve_Speed_X, _Smooth, _Subtract);
  if (i == 8u) value = float4(_Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y, _RDistort_Speed_X);
  if (i == 9u) value = float4(_RDistortion_Power_Y, _RDistortion_Power_X, _Mask_Speed_Y, _Alphaclip_Value);
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
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_22_CB1((uint)(8)).wz * BA_Fragment_22_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v2.xy * BA_Fragment_22_CB1((uint)(3)).xy + BA_Fragment_22_CB1((uint)(3)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.yz = v2.xy * BA_Fragment_22_CB1((uint)(2)).xy + BA_Fragment_22_CB1((uint)(2)).zw;
  r0.xy = BA_Fragment_22_CB1((uint)(9)).yx * r0.xx + r0.yz;
  r1.x = BA_Fragment_22_CB1((uint)(6)).x * BA_Fragment_22_CB0((uint)(11)).y;
  r1.y = BA_Fragment_22_CB1((uint)(9)).z * BA_Fragment_22_CB0((uint)(11)).y;
  r0.xy = r1.xy + r0.xy;
  r0.xy = v4.xy + r0.xy;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.xz = v2.xy * BA_Fragment_22_CB1((uint)(5)).xy + BA_Fragment_22_CB1((uint)(5)).zw;
  r0.xz = BA_Fragment_22_CB1((uint)(7)).yx * BA_Fragment_22_CB0((uint)(11)).yy + r0.xz;
  r0.xz = v4.zw + r0.xz;
  r1.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xz).xyzw;
  r0.x = v2.x * BA_Fragment_22_CB1((uint)(4)).x + BA_Fragment_22_CB1((uint)(4)).z;
  r0.x = -r1.y * BA_Fragment_22_CB1((uint)(6)).w + r0.x;
  r0.z = BA_Fragment_22_CB1((uint)(6)).w * r1.y;
  r0.x = BA_Fragment_22_CB1((uint)(6)).z * r0.x + r0.z;
  r0.zw = BA_Fragment_22_CB1((uint)(7)).wz + v3.xy;
  r0.x = r0.x + -r0.z;
  r0.z = 1 / r0.w;
  r0.x = saturate(r0.x * r0.z);
  r0.z = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.z * r0.x;
  r0.zw = v2.xy * BA_Fragment_22_CB1((uint)(1)).xy + BA_Fragment_22_CB1((uint)(1)).zw;
  r0.zw = BA_Fragment_22_CB1((uint)(8)).yx * BA_Fragment_22_CB0((uint)(11)).yy + r0.zw;
  r0.zw = v3.zw + r0.zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.x = r1.w * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_22_CB1((uint)(6)).y * r0.x;
  r0.z = BA_Fragment_22_CB1((uint)(0)).w * r1.w;
  r1.xyz = v1.xyz * r1.xyz;
  o0.xyz = BA_Fragment_22_CB1((uint)(0)).xyz * r1.xyz;
  r0.x = r0.z * r0.x;
  r0.x = saturate(r0.x * r0.y);
  r0.y = -BA_Fragment_22_CB1((uint)(9)).w + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
float4 BA_Fragment_23_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 5u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 6u) value = float4(_Mask_Speed_X, _Alpha, _Gra_Lerp, _GDissolve_Str);
  if (i == 7u) value = float4(_GDissolve_Speed_Y, _GDissolve_Speed_X, _Smooth, _Subtract);
  if (i == 8u) value = float4(_Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y, _RDistort_Speed_X);
  if (i == 9u) value = float4(_RDistortion_Power_Y, _RDistortion_Power_X, _Mask_Speed_Y, _Alphaclip_Value);
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
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_23_CB1((uint)(5)).xy + BA_Fragment_23_CB1((uint)(5)).zw;
  r0.xy = BA_Fragment_23_CB1((uint)(7)).yx * BA_Fragment_23_CB0((uint)(11)).yy + r0.xy;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.x = v2.x * BA_Fragment_23_CB1((uint)(4)).x + BA_Fragment_23_CB1((uint)(4)).z;
  r0.x = -r0.y * BA_Fragment_23_CB1((uint)(6)).w + r0.x;
  r0.y = BA_Fragment_23_CB1((uint)(6)).w * r0.y;
  r0.x = BA_Fragment_23_CB1((uint)(6)).z * r0.x + r0.y;
  r0.yz = BA_Fragment_23_CB1((uint)(7)).wz + v3.xy;
  r0.x = r0.x + -r0.y;
  r0.y = 1 / r0.z;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r0.yz = BA_Fragment_23_CB1((uint)(8)).wz * BA_Fragment_23_CB0((uint)(11)).yy;
  r0.yz = frac(r0.yz);
  r1.xy = v2.xy * BA_Fragment_23_CB1((uint)(3)).xy + BA_Fragment_23_CB1((uint)(3)).zw;
  r0.yz = r1.xy + r0.yz;
  r1.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.yz = v2.xy * BA_Fragment_23_CB1((uint)(1)).xy + BA_Fragment_23_CB1((uint)(1)).zw;
  r0.yz = BA_Fragment_23_CB1((uint)(9)).yx * r1.xx + r0.yz;
  r0.yz = BA_Fragment_23_CB1((uint)(8)).yx * BA_Fragment_23_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = r2.w * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_23_CB1((uint)(6)).y * r0.x;
  r0.y = BA_Fragment_23_CB1((uint)(0)).w * r2.w;
  r1.yzw = v1.xyz * r2.xyz;
  o0.xyz = BA_Fragment_23_CB1((uint)(0)).xyz * r1.yzw;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_23_CB1((uint)(2)).xy + BA_Fragment_23_CB1((uint)(2)).zw;
  r0.yz = BA_Fragment_23_CB1((uint)(9)).yx * r1.xx + r0.yz;
  r1.x = BA_Fragment_23_CB1((uint)(6)).x * BA_Fragment_23_CB0((uint)(11)).y;
  r1.y = BA_Fragment_23_CB1((uint)(9)).z * BA_Fragment_23_CB0((uint)(11)).y;
  r0.yz = r1.xy + r0.yz;
  r0.yz = v4.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_23_CB1((uint)(9)).w + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Fragment_24_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 5u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 6u) value = float4(_Mask_Speed_X, _Alpha, _Gra_Lerp, _GDissolve_Str);
  if (i == 7u) value = float4(_GDissolve_Speed_Y, _GDissolve_Speed_X, _Smooth, _Subtract);
  if (i == 8u) value = float4(_Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y, _RDistort_Speed_X);
  if (i == 9u) value = float4(_RDistortion_Power_Y, _RDistortion_Power_X, _Mask_Speed_Y, _Alphaclip_Value);
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
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_24_CB1((uint)(8)).wz * BA_Fragment_24_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v2.xy * BA_Fragment_24_CB1((uint)(3)).xy + BA_Fragment_24_CB1((uint)(3)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.yz = v2.xy * BA_Fragment_24_CB1((uint)(5)).xy + BA_Fragment_24_CB1((uint)(5)).zw;
  r0.yz = BA_Fragment_24_CB1((uint)(9)).yx * r0.xx + r0.yz;
  r0.yz = BA_Fragment_24_CB1((uint)(7)).yx * BA_Fragment_24_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v4.zw + r0.yz;
  r1.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.y = v2.x * BA_Fragment_24_CB1((uint)(4)).x + BA_Fragment_24_CB1((uint)(4)).z;
  r0.y = -r1.y * BA_Fragment_24_CB1((uint)(6)).w + r0.y;
  r0.z = BA_Fragment_24_CB1((uint)(6)).w * r1.y;
  r0.y = BA_Fragment_24_CB1((uint)(6)).z * r0.y + r0.z;
  r0.zw = BA_Fragment_24_CB1((uint)(7)).wz + v3.xy;
  r0.y = r0.y + -r0.z;
  r0.z = 1 / r0.w;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.y * -2 + 3;
  r0.y = r0.y * r0.y;
  r0.y = r0.z * r0.y;
  r0.zw = v2.xy * BA_Fragment_24_CB1((uint)(1)).xy + BA_Fragment_24_CB1((uint)(1)).zw;
  r0.zw = BA_Fragment_24_CB1((uint)(8)).yx * BA_Fragment_24_CB0((uint)(11)).yy + r0.zw;
  r0.zw = v3.zw + r0.zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r1.x * r0.y;
  r0.y = v1.w * r0.y;
  r0.y = BA_Fragment_24_CB1((uint)(6)).y * r0.y;
  r0.z = BA_Fragment_24_CB1((uint)(0)).w * r1.w;
  r1.xyz = v1.xyz * r1.xyz;
  o0.xyz = BA_Fragment_24_CB1((uint)(0)).xyz * r1.xyz;
  r0.y = r0.z * r0.y;
  r0.zw = v2.xy * BA_Fragment_24_CB1((uint)(2)).xy + BA_Fragment_24_CB1((uint)(2)).zw;
  r0.xz = BA_Fragment_24_CB1((uint)(9)).yx * r0.xx + r0.zw;
  r1.x = BA_Fragment_24_CB1((uint)(6)).x * BA_Fragment_24_CB0((uint)(11)).y;
  r1.y = BA_Fragment_24_CB1((uint)(9)).z * BA_Fragment_24_CB0((uint)(11)).y;
  r0.xz = r1.xy + r0.xz;
  r0.xz = v4.xy + r0.xz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xz).xyzw;
  r0.x = saturate(r1.y * r0.y);
  r0.y = -BA_Fragment_24_CB1((uint)(9)).w + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && !defined(_GRA_WRAP_CLAMP) && defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Fragment_25_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 5u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 6u) value = float4(_Mask_Speed_X, _Alpha, _Gra_Lerp, _GDissolve_Str);
  if (i == 7u) value = float4(_GDissolve_Speed_Y, _GDissolve_Speed_X, _Smooth, _Subtract);
  if (i == 8u) value = float4(_Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y, _RDistort_Speed_X);
  if (i == 9u) value = float4(_RDistortion_Power_Y, _RDistortion_Power_X, _Mask_Speed_Y, _Alphaclip_Value);
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
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = v2.x * BA_Fragment_25_CB1((uint)(4)).x + BA_Fragment_25_CB1((uint)(4)).z;
  r0.yz = BA_Fragment_25_CB1((uint)(8)).wz * BA_Fragment_25_CB0((uint)(11)).yy;
  r0.xyz = frac(r0.xyz);
  r1.xy = v2.xy * BA_Fragment_25_CB1((uint)(3)).xy + BA_Fragment_25_CB1((uint)(3)).zw;
  r0.yz = r1.xy + r0.yz;
  r1.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.yz = v2.xy * BA_Fragment_25_CB1((uint)(5)).xy + BA_Fragment_25_CB1((uint)(5)).zw;
  r0.yz = BA_Fragment_25_CB1((uint)(9)).yx * r1.xx + r0.yz;
  r0.yz = BA_Fragment_25_CB1((uint)(7)).yx * BA_Fragment_25_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v4.zw + r0.yz;
  r2.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.x = -r2.y * BA_Fragment_25_CB1((uint)(6)).w + r0.x;
  r0.y = BA_Fragment_25_CB1((uint)(6)).w * r2.y;
  r0.x = BA_Fragment_25_CB1((uint)(6)).z * r0.x + r0.y;
  r0.yz = BA_Fragment_25_CB1((uint)(7)).wz + v3.xy;
  r0.x = r0.x + -r0.y;
  r0.y = 1 / r0.z;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_25_CB1((uint)(1)).xy + BA_Fragment_25_CB1((uint)(1)).zw;
  r0.yz = BA_Fragment_25_CB1((uint)(9)).yx * r1.xx + r0.yz;
  r0.yz = BA_Fragment_25_CB1((uint)(8)).yx * BA_Fragment_25_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = r2.x * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_25_CB1((uint)(6)).y * r0.x;
  r0.y = BA_Fragment_25_CB1((uint)(0)).w * r2.w;
  r1.yzw = v1.xyz * r2.xyz;
  o0.xyz = BA_Fragment_25_CB1((uint)(0)).xyz * r1.yzw;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_25_CB1((uint)(2)).xy + BA_Fragment_25_CB1((uint)(2)).zw;
  r0.yz = BA_Fragment_25_CB1((uint)(9)).yx * r1.xx + r0.yz;
  r1.x = BA_Fragment_25_CB1((uint)(6)).x * BA_Fragment_25_CB0((uint)(11)).y;
  r1.y = BA_Fragment_25_CB1((uint)(9)).z * BA_Fragment_25_CB0((uint)(11)).y;
  r0.yz = r1.xy + r0.yz;
  r0.yz = v4.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_25_CB1((uint)(9)).w + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON) && defined(_CUSTOMDATA_USE_ON) && !defined(_GDISSOLVE_DISTORTION_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Fragment_26_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 5u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 6u) value = float4(_Mask_Speed_X, _Alpha, _Gra_Lerp, _GDissolve_Str);
  if (i == 7u) value = float4(_GDissolve_Speed_Y, _GDissolve_Speed_X, _Smooth, _Subtract);
  if (i == 8u) value = float4(_Main_Speed_Y, _Main_Speed_X, 0.0, 0.0);
  if (i == 9u) value = float4(0.0, 0.0, _Mask_Speed_Y, _Alphaclip_Value);
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
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_26_CB1((uint)(5)).xy + BA_Fragment_26_CB1((uint)(5)).zw;
  r0.xy = BA_Fragment_26_CB1((uint)(7)).yx * BA_Fragment_26_CB0((uint)(11)).yy + r0.xy;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.x = v2.x * BA_Fragment_26_CB1((uint)(4)).x + BA_Fragment_26_CB1((uint)(4)).z;
  r0.x = -r0.y * BA_Fragment_26_CB1((uint)(6)).w + r0.x;
  r0.y = BA_Fragment_26_CB1((uint)(6)).w * r0.y;
  r0.x = BA_Fragment_26_CB1((uint)(6)).z * r0.x + r0.y;
  r0.yz = BA_Fragment_26_CB1((uint)(7)).wz + v3.xy;
  r0.x = r0.x + -r0.y;
  r0.y = 1 / r0.z;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_26_CB1((uint)(1)).xy + BA_Fragment_26_CB1((uint)(1)).zw;
  r0.yz = BA_Fragment_26_CB1((uint)(8)).yx * BA_Fragment_26_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = r1.x * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_26_CB1((uint)(6)).y * r0.x;
  r0.y = BA_Fragment_26_CB1((uint)(0)).w * r1.w;
  r1.xyz = v1.xyz * r1.xyz;
  r1.xyz = BA_Fragment_26_CB1((uint)(0)).xyz * r1.xyz;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_26_CB1((uint)(2)).xy + BA_Fragment_26_CB1((uint)(2)).zw;
  r2.x = BA_Fragment_26_CB1((uint)(6)).x * BA_Fragment_26_CB0((uint)(11)).y;
  r2.y = BA_Fragment_26_CB1((uint)(9)).z * BA_Fragment_26_CB0((uint)(11)).y;
  r0.yz = r2.xy + r0.yz;
  r0.yz = v4.xy + r0.yz;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r2.y * r0.x);
  r0.y = -BA_Fragment_26_CB1((uint)(9)).w + r0.x;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  o0.xyz = r1.xyz * r0.xxx;
  o0.w = r0.x;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Frag(out float4 color : SV_TARGET0) { color = float4(1,0,1,1); }
#endif
