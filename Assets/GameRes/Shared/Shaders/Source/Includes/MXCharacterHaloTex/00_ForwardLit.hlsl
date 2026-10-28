// Exact names and types from the original compiled parameter metadata.
float _DitherThreshold;
float4 _GlowMaskColor0;
float _GlowStrength0;
float _GlowStrictness0;
float4 _GlowTint0;
float _GrayBrightness;
float4 _Tint;
Texture2D<float4> _MainTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_3_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_3_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  o1.z = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_4_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_4_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  o1.z = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_5_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_5_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_5_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_5_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_5_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.w = r0.x / r0.w;
  o1.xy = v1.xy;
  o1.z = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_6_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_6_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_6_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_6_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_6_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_6_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.w = r0.x / r0.w;
  o1.xy = v1.xy;
  o1.z = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_7_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_7_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_7_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_7_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_7_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_7_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_7_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_7_CB0((uint)(55)).z + BA_Vertex_7_CB0((uint)(55)).w);
  o1.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_8_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_8_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_8_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_8_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_8_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_8_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_8_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_8_CB0((uint)(55)).z + BA_Vertex_8_CB0((uint)(55)).w);
  o1.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_9_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_9_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_9_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_9_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_9_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_9_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.w = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_9_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_9_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_9_CB0((uint)(55)).z + BA_Vertex_9_CB0((uint)(55)).w);
  o1.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_10_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_10_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_10_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_10_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_10_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_10_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.w = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_10_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_10_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_10_CB0((uint)(55)).z + BA_Vertex_10_CB0((uint)(55)).w);
  o1.xy = v1.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_11_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_11_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_11_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_11_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_11_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_11_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_11_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = BA_Vertex_11_CB0((uint)(55)).x * r0.x;
  o1.xy = v1.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_12_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_12_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_12_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_12_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_12_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_12_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_12_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_12_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_12_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_12_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = BA_Vertex_12_CB0((uint)(55)).x * r0.x;
  o1.xy = v1.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_13_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_13_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_13_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_13_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_13_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_13_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_13_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_13_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_13_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.w = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_13_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_13_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = BA_Vertex_13_CB0((uint)(55)).x * r0.x;
  o1.xy = v1.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_14_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_14_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_14_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_14_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_14_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_14_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_14_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_14_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_14_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.w = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_14_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_14_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = BA_Vertex_14_CB0((uint)(55)).x * r0.x;
  o1.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_15_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_15_CB0(uint i)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_15_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_15_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_15_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_15_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_15_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_15_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_15_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_15_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  o1.z = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_16_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_16_CB0(uint i)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_16_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_16_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_16_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_16_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_16_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_16_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_16_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_16_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  o1.z = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_17_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_17_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_17_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_17_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_17_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_17_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_17_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_17_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_17_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_17_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_17_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.w = r0.x / r0.w;
  o1.xy = v1.xy;
  o1.z = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_18_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_18_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_18_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_18_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_18_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_18_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_18_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_18_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_18_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_18_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_18_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.w = r0.x / r0.w;
  o1.xy = v1.xy;
  o1.z = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_19_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_19_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_19_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_19_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_19_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_19_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_19_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_19_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_19_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_19_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_19_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_19_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_19_CB0((uint)(55)).z + BA_Vertex_19_CB0((uint)(55)).w);
  o1.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_20_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_20_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_20_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_20_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_20_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_20_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_20_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_20_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_20_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_20_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_20_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_20_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_20_CB0((uint)(55)).z + BA_Vertex_20_CB0((uint)(55)).w);
  o1.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_21_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_21_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_21_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_21_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_21_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_21_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_21_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_21_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_21_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.w = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_21_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_21_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_21_CB0((uint)(55)).z + BA_Vertex_21_CB0((uint)(55)).w);
  o1.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_22_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_22_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_22_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_22_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_22_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_22_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_22_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_22_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_22_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_22_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_22_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.w = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_22_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_22_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_22_CB0((uint)(55)).z + BA_Vertex_22_CB0((uint)(55)).w);
  o1.xy = v1.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_23_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_23_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_23_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_23_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_23_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_23_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_23_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_23_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_23_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_23_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_23_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_23_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = BA_Vertex_23_CB0((uint)(55)).x * r0.x;
  o1.xy = v1.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_24_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_24_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_24_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_24_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_24_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_24_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_24_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_24_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_24_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_24_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_24_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_24_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = BA_Vertex_24_CB0((uint)(55)).x * r0.x;
  o1.xy = v1.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_25_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_25_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_25_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_25_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_25_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_25_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_25_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_25_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_25_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_25_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_25_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.w = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_25_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_25_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = BA_Vertex_25_CB0((uint)(55)).x * r0.x;
  o1.xy = v1.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_26_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_26_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_26_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_26_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_26_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_26_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_26_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_26_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_26_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_26_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_26_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.w = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_26_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_26_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = BA_Vertex_26_CB0((uint)(55)).x * r0.x;
  o1.xy = v1.xy;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_43_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_43_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_43_CB0((uint)(19)).x).xyzw;
  o0.xyzw = BA_Fragment_43_CB1((uint)(1)).xyzw * r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_44_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_44_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_44_CB0((uint)(19)).x).xyzw;
  r0.xyzw = BA_Fragment_44_CB1((uint)(1)).xyzw * r0.xyzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.w = r0.w;
  o0.xyz = BA_Fragment_44_CB1((uint)(0)).yyy * r0.xxx;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_45_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_45_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_45_CB1((uint)(0)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_45_CB0((uint)(19)).x).xyzw;
  o0.xyzw = BA_Fragment_45_CB1((uint)(1)).xyzw * r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_46_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_DitherThreshold, _GrayBrightness, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_46_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_46_CB1((uint)(0)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_46_CB0((uint)(19)).x).xyzw;
  r0.xyzw = BA_Fragment_46_CB1((uint)(1)).xyzw * r0.xyzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.w = r0.w;
  o0.xyz = BA_Fragment_46_CB1((uint)(0)).yyy * r0.xxx;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_47_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_47_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_47_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * BA_Fragment_47_CB1((uint)(1)).xyz + -BA_Fragment_47_CB0((uint)(56)).xyz;
  r0.w = BA_Fragment_47_CB1((uint)(1)).w * r0.w;
  o0.w = r0.w;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_47_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_48_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_48_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_48_CB0((uint)(19)).x).xyzw;
  r0.xyzw = BA_Fragment_48_CB1((uint)(1)).xyzw * r0.xyzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.w = r0.w;
  r0.xyz = r0.xxx * BA_Fragment_48_CB1((uint)(0)).yyy + -BA_Fragment_48_CB0((uint)(56)).xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_48_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_49_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_49_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_49_CB1((uint)(0)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_49_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * BA_Fragment_49_CB1((uint)(1)).xyz + -BA_Fragment_49_CB0((uint)(56)).xyz;
  r0.w = BA_Fragment_49_CB1((uint)(1)).w * r0.w;
  o0.w = r0.w;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_49_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_50_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_DitherThreshold, _GrayBrightness, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_50_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_50_CB1((uint)(0)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_50_CB0((uint)(19)).x).xyzw;
  r0.xyzw = BA_Fragment_50_CB1((uint)(1)).xyzw * r0.xyzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.w = r0.w;
  r0.xyz = r0.xxx * BA_Fragment_50_CB1((uint)(0)).yyy + -BA_Fragment_50_CB0((uint)(56)).xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_50_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_51_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_51_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v1.z);
  r0.x = min(1, r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_51_CB0((uint)(19)).x).xyzw;
  r0.yzw = r1.xyz * BA_Fragment_51_CB1((uint)(1)).xyz + -BA_Fragment_51_CB0((uint)(56)).xyz;
  r1.x = BA_Fragment_51_CB1((uint)(1)).w * r1.w;
  o0.w = r1.x;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_51_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_52_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_52_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v1.z);
  r0.x = min(1, r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_52_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_52_CB1((uint)(1)).xyzw * r1.xyzw;
  r0.y = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.w = r1.w;
  r0.yzw = r0.yyy * BA_Fragment_52_CB1((uint)(0)).yyy + -BA_Fragment_52_CB0((uint)(56)).xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_52_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_53_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_53_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_53_CB1((uint)(0)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v1.z);
  r0.x = min(1, r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_53_CB0((uint)(19)).x).xyzw;
  r0.yzw = r1.xyz * BA_Fragment_53_CB1((uint)(1)).xyz + -BA_Fragment_53_CB0((uint)(56)).xyz;
  r1.x = BA_Fragment_53_CB1((uint)(1)).w * r1.w;
  o0.w = r1.x;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_53_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_54_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_DitherThreshold, _GrayBrightness, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_54_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_54_CB1((uint)(0)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v1.z);
  r0.x = min(1, r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_54_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_54_CB1((uint)(1)).xyzw * r1.xyzw;
  r0.y = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.w = r1.w;
  r0.yzw = r0.yyy * BA_Fragment_54_CB1((uint)(0)).yyy + -BA_Fragment_54_CB0((uint)(56)).xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_54_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_55_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 3u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_55_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_55_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_55_CB1((uint)(2)).xyz + -r0.xyz;
  r0.xyzw = BA_Fragment_55_CB1((uint)(1)).xyzw * r0.xyzw;
  r1.x = dot(r1.xyz, r1.xyz);
  r1.x = saturate(BA_Fragment_55_CB1((uint)(2)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_55_CB1((uint)(3)).w * r1.x;
  o0.xyz = r1.xxx * BA_Fragment_55_CB1((uint)(3)).xyz + r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_56_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 3u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_56_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_56_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_56_CB1((uint)(2)).xyz + -r0.xyz;
  r0.xyzw = BA_Fragment_56_CB1((uint)(1)).xyzw * r0.xyzw;
  r1.x = dot(r1.xyz, r1.xyz);
  r1.x = saturate(BA_Fragment_56_CB1((uint)(2)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_56_CB1((uint)(3)).w * r1.x;
  r0.xyz = r1.xxx * BA_Fragment_56_CB1((uint)(3)).xyz + r0.xyz;
  o0.w = r0.w;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.xyz = BA_Fragment_56_CB1((uint)(0)).yyy * r0.xxx;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_57_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 3u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_57_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_57_CB1((uint)(0)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_57_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_57_CB1((uint)(2)).xyz + -r0.xyz;
  r0.xyzw = BA_Fragment_57_CB1((uint)(1)).xyzw * r0.xyzw;
  r1.x = dot(r1.xyz, r1.xyz);
  r1.x = saturate(BA_Fragment_57_CB1((uint)(2)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_57_CB1((uint)(3)).w * r1.x;
  o0.xyz = r1.xxx * BA_Fragment_57_CB1((uint)(3)).xyz + r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_58_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_DitherThreshold, _GrayBrightness, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 3u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_58_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_58_CB1((uint)(0)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_58_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_58_CB1((uint)(2)).xyz + -r0.xyz;
  r0.xyzw = BA_Fragment_58_CB1((uint)(1)).xyzw * r0.xyzw;
  r1.x = dot(r1.xyz, r1.xyz);
  r1.x = saturate(BA_Fragment_58_CB1((uint)(2)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_58_CB1((uint)(3)).w * r1.x;
  r0.xyz = r1.xxx * BA_Fragment_58_CB1((uint)(3)).xyz + r0.xyz;
  o0.w = r0.w;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.xyz = BA_Fragment_58_CB1((uint)(0)).yyy * r0.xxx;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_59_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 3u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_59_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_59_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_59_CB1((uint)(2)).xyz + -r0.xyz;
  r0.xyzw = BA_Fragment_59_CB1((uint)(1)).xyzw * r0.xyzw;
  r1.x = dot(r1.xyz, r1.xyz);
  r1.x = saturate(BA_Fragment_59_CB1((uint)(2)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_59_CB1((uint)(3)).w * r1.x;
  r0.xyz = r1.xxx * BA_Fragment_59_CB1((uint)(3)).xyz + r0.xyz;
  o0.w = r0.w;
  r0.xyz = -BA_Fragment_59_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_59_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_60_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 3u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_60_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_60_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_60_CB1((uint)(2)).xyz + -r0.xyz;
  r0.xyzw = BA_Fragment_60_CB1((uint)(1)).xyzw * r0.xyzw;
  r1.x = dot(r1.xyz, r1.xyz);
  r1.x = saturate(BA_Fragment_60_CB1((uint)(2)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_60_CB1((uint)(3)).w * r1.x;
  r0.xyz = r1.xxx * BA_Fragment_60_CB1((uint)(3)).xyz + r0.xyz;
  o0.w = r0.w;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.xyz = r0.xxx * BA_Fragment_60_CB1((uint)(0)).yyy + -BA_Fragment_60_CB0((uint)(56)).xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_60_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_61_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 3u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_61_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_61_CB1((uint)(0)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_61_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_61_CB1((uint)(2)).xyz + -r0.xyz;
  r0.xyzw = BA_Fragment_61_CB1((uint)(1)).xyzw * r0.xyzw;
  r1.x = dot(r1.xyz, r1.xyz);
  r1.x = saturate(BA_Fragment_61_CB1((uint)(2)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_61_CB1((uint)(3)).w * r1.x;
  r0.xyz = r1.xxx * BA_Fragment_61_CB1((uint)(3)).xyz + r0.xyz;
  o0.w = r0.w;
  r0.xyz = -BA_Fragment_61_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_61_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_62_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_DitherThreshold, _GrayBrightness, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 3u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_62_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_62_CB1((uint)(0)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_62_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_62_CB1((uint)(2)).xyz + -r0.xyz;
  r0.xyzw = BA_Fragment_62_CB1((uint)(1)).xyzw * r0.xyzw;
  r1.x = dot(r1.xyz, r1.xyz);
  r1.x = saturate(BA_Fragment_62_CB1((uint)(2)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_62_CB1((uint)(3)).w * r1.x;
  r0.xyz = r1.xxx * BA_Fragment_62_CB1((uint)(3)).xyz + r0.xyz;
  o0.w = r0.w;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.xyz = r0.xxx * BA_Fragment_62_CB1((uint)(0)).yyy + -BA_Fragment_62_CB0((uint)(56)).xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_62_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_63_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 3u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_63_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_63_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_63_CB1((uint)(2)).xyz + -r0.xyz;
  r0.xyzw = BA_Fragment_63_CB1((uint)(1)).xyzw * r0.xyzw;
  r1.x = dot(r1.xyz, r1.xyz);
  r1.x = saturate(BA_Fragment_63_CB1((uint)(2)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_63_CB1((uint)(3)).w * r1.x;
  r0.xyz = r1.xxx * BA_Fragment_63_CB1((uint)(3)).xyz + r0.xyz;
  o0.w = r0.w;
  r0.xyz = -BA_Fragment_63_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_63_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_64_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 3u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_64_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_64_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_64_CB1((uint)(2)).xyz + -r0.xyz;
  r0.xyzw = BA_Fragment_64_CB1((uint)(1)).xyzw * r0.xyzw;
  r1.x = dot(r1.xyz, r1.xyz);
  r1.x = saturate(BA_Fragment_64_CB1((uint)(2)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_64_CB1((uint)(3)).w * r1.x;
  r0.xyz = r1.xxx * BA_Fragment_64_CB1((uint)(3)).xyz + r0.xyz;
  o0.w = r0.w;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.xyz = r0.xxx * BA_Fragment_64_CB1((uint)(0)).yyy + -BA_Fragment_64_CB0((uint)(56)).xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_64_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_65_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 3u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_65_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_65_CB1((uint)(0)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_65_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_65_CB1((uint)(2)).xyz + -r0.xyz;
  r0.xyzw = BA_Fragment_65_CB1((uint)(1)).xyzw * r0.xyzw;
  r1.x = dot(r1.xyz, r1.xyz);
  r1.x = saturate(BA_Fragment_65_CB1((uint)(2)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_65_CB1((uint)(3)).w * r1.x;
  r0.xyz = r1.xxx * BA_Fragment_65_CB1((uint)(3)).xyz + r0.xyz;
  o0.w = r0.w;
  r0.xyz = -BA_Fragment_65_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_65_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_66_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_DitherThreshold, _GrayBrightness, 0.0, 0.0);
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 3u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_66_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_66_CB1((uint)(0)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_66_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_66_CB1((uint)(2)).xyz + -r0.xyz;
  r0.xyzw = BA_Fragment_66_CB1((uint)(1)).xyzw * r0.xyzw;
  r1.x = dot(r1.xyz, r1.xyz);
  r1.x = saturate(BA_Fragment_66_CB1((uint)(2)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_66_CB1((uint)(3)).w * r1.x;
  r0.xyz = r1.xxx * BA_Fragment_66_CB1((uint)(3)).xyz + r0.xyz;
  o0.w = r0.w;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.xyz = r0.xxx * BA_Fragment_66_CB1((uint)(0)).yyy + -BA_Fragment_66_CB0((uint)(56)).xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_66_CB0((uint)(56)).xyz;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
