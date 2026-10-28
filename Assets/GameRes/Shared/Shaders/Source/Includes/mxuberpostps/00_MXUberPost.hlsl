// Exact names and types from the original compiled parameter metadata.
float4 _ChromaticAberrationParams;
float4 _ThresholColorA;
float4 _ThresholColorB;
float4 _ThresholdParams;
float4 _VignetteColor;
float4 _VignetteParamsA;
float _VignetteParamsB;
Texture2D<float4> _SourceTex;
SamplerState sampler_SourceTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_2_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_2_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_12_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_13_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_14_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_17_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_18_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_19_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_20_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_21_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_22_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_23_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_24_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_25_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
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
  out float2 o1 : TEXCOORD0)
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
  o0.xyzw = BA_Vertex_26_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_27_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_27_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_27_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_27_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_27_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_27_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_27_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_27_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_27_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_27_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_28_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_28_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_28_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_28_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_28_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_28_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_28_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_28_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_28_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_28_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_29_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_29_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_29_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_29_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_29_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_29_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_29_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_29_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_29_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_29_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_30_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_30_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_30_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_30_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_30_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_30_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_30_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_30_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_30_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_30_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_31_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_31_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_31_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_31_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_31_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_31_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_31_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_31_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_31_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_31_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_32_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_32_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_32_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_32_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_32_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_32_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_32_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_32_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_32_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_32_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_33_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_33_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_33_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_33_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_33_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_33_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_33_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_33_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_33_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_33_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_34_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_34_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_34_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_34_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_34_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_34_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_34_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_34_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_34_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_34_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_35_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_35_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_35_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_35_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_35_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_35_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_35_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_35_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_35_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_35_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_36_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_36_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_36_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_36_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_36_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_36_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_36_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_36_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_36_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_36_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_37_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_37_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_37_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_37_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_37_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_37_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_37_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_37_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_37_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_37_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_38_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_38_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_38_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_38_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_38_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_38_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_38_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_38_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_38_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_38_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_39_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_39_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_39_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_39_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_39_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_39_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_39_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_39_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_39_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_39_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_40_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_40_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_40_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_40_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_40_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_40_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_40_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_40_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_40_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_40_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_41_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_41_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_41_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_41_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_41_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_41_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_41_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_41_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_41_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_41_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_42_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_42_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_42_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_42_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_42_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_42_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_42_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_42_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_42_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_42_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_43_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_43_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_43_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_43_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_43_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_43_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_43_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_43_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_43_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_43_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_44_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_44_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_44_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_44_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_44_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_44_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_44_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_44_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_44_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_44_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_45_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_45_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_45_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_45_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_45_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_45_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_45_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_45_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_45_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_45_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_46_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_46_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_46_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_46_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_46_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_46_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_46_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_46_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_46_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_46_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_47_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_47_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_47_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_47_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_47_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_47_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_47_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_47_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_47_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_47_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_48_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_48_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_48_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_48_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_48_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_48_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_48_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_48_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_48_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_48_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_49_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_49_CB0(uint i)
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
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_49_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_49_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_49_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_49_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_49_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_49_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_49_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_49_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_50_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_50_CB0((uint)(22)).xy + BA_Vertex_50_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_51_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_51_CB0((uint)(22)).xy + BA_Vertex_51_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_52_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_52_CB0((uint)(22)).xy + BA_Vertex_52_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_53_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_53_CB0((uint)(22)).xy + BA_Vertex_53_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_54_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_54_CB0((uint)(22)).xy + BA_Vertex_54_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_55_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_55_CB0((uint)(22)).xy + BA_Vertex_55_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_56_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_56_CB0((uint)(22)).xy + BA_Vertex_56_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_57_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_57_CB0((uint)(22)).xy + BA_Vertex_57_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_58_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_58_CB0((uint)(22)).xy + BA_Vertex_58_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_59_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_59_CB0((uint)(22)).xy + BA_Vertex_59_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_60_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_60_CB0((uint)(22)).xy + BA_Vertex_60_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_61_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_61_CB0((uint)(22)).xy + BA_Vertex_61_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_62_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_62_CB0((uint)(22)).xy + BA_Vertex_62_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_63_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_63_CB0((uint)(22)).xy + BA_Vertex_63_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_64_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_64_CB0((uint)(22)).xy + BA_Vertex_64_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_65_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_65_CB0((uint)(22)).xy + BA_Vertex_65_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_66_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_66_CB0((uint)(22)).xy + BA_Vertex_66_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_67_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_67_CB0((uint)(22)).xy + BA_Vertex_67_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_68_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_68_CB0((uint)(22)).xy + BA_Vertex_68_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_69_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_69_CB0((uint)(22)).xy + BA_Vertex_69_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_70_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_70_CB0((uint)(22)).xy + BA_Vertex_70_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_71_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_71_CB0((uint)(22)).xy + BA_Vertex_71_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_72_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_72_CB0((uint)(22)).xy + BA_Vertex_72_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_73_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_73_CB0((uint)(22)).xy + BA_Vertex_73_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_74_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_74_CB0((uint)(22)).xy + BA_Vertex_74_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_75_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_75_CB0((uint)(22)).xy + BA_Vertex_75_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_76_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_76_CB0((uint)(22)).xy + BA_Vertex_76_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_77_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_77_CB0((uint)(22)).xy + BA_Vertex_77_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_78_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_78_CB0((uint)(22)).xy + BA_Vertex_78_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_79_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_79_CB0((uint)(22)).xy + BA_Vertex_79_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_80_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_80_CB0((uint)(22)).xy + BA_Vertex_80_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_81_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_81_CB0((uint)(22)).xy + BA_Vertex_81_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_82_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_82_CB0((uint)(22)).xy + BA_Vertex_82_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_83_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_83_CB0((uint)(22)).xy + BA_Vertex_83_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_84_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_84_CB0((uint)(22)).xy + BA_Vertex_84_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_85_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_85_CB0((uint)(22)).xy + BA_Vertex_85_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_86_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_86_CB0((uint)(22)).xy + BA_Vertex_86_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_87_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_87_CB0((uint)(22)).xy + BA_Vertex_87_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_88_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_88_CB0((uint)(22)).xy + BA_Vertex_88_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_89_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_89_CB0((uint)(22)).xy + BA_Vertex_89_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_90_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_90_CB0((uint)(22)).xy + BA_Vertex_90_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_91_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_91_CB0((uint)(22)).xy + BA_Vertex_91_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_92_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_92_CB0((uint)(22)).xy + BA_Vertex_92_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_93_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_93_CB0((uint)(22)).xy + BA_Vertex_93_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_94_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_94_CB0((uint)(22)).xy + BA_Vertex_94_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_95_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_95_CB0((uint)(22)).xy + BA_Vertex_95_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_96_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_96_CB0((uint)(22)).xy + BA_Vertex_96_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Vertex_97_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_97_CB0((uint)(22)).xy + BA_Vertex_97_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_102_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_102_CB0((uint)(19)).x).xyz;
  r0.w = cmp(0 < BA_Fragment_102_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_102_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_102_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_102_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_102_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_102_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_102_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_103_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_103_CB0((uint)(19)).x).xyz;
  r0.w = cmp(0 < BA_Fragment_103_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_103_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_103_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_103_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_103_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_103_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_104_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_104_CB0((uint)(19)).x).xyz;
  r0.w = cmp(0 < BA_Fragment_104_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_104_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_104_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_104_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_104_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_104_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_104_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_105_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_105_CB0((uint)(19)).x).xyz;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_105_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_105_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_105_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_105_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_105_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_105_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_105_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_106_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_106_CB0((uint)(19)).x).xyz;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_106_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_106_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_106_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_106_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_106_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_106_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_107_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_107_CB0((uint)(19)).x).xyz;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_107_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_107_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_107_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_107_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_107_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_107_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_107_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_108_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_108_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_108_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_108_CB0((uint)(130)).y + -BA_Fragment_108_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_108_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_108_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_108_CB0((uint)(132)).xyz * BA_Fragment_108_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_108_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_108_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_108_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_108_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_108_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_108_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_108_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_108_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_109_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_109_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_109_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_109_CB0((uint)(130)).y + -BA_Fragment_109_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_109_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_109_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_109_CB0((uint)(132)).xyz * BA_Fragment_109_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_109_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_109_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_109_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_109_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_109_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_109_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_109_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_110_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_110_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_110_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_110_CB0((uint)(130)).y + -BA_Fragment_110_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_110_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_110_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_110_CB0((uint)(132)).xyz * BA_Fragment_110_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_110_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_110_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_110_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_110_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_110_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_110_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_110_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_110_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_111_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_111_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_111_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_111_CB0((uint)(130)).y + -BA_Fragment_111_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_111_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_111_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_111_CB0((uint)(132)).xyz * BA_Fragment_111_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_111_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_111_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_111_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_111_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_111_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_111_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_111_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_111_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_112_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_112_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_112_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_112_CB0((uint)(130)).y + -BA_Fragment_112_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_112_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_112_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_112_CB0((uint)(132)).xyz * BA_Fragment_112_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_112_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_112_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_112_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_112_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_112_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_112_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_112_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_113_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_113_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_113_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_113_CB0((uint)(130)).y + -BA_Fragment_113_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_113_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_113_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_113_CB0((uint)(132)).xyz * BA_Fragment_113_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_113_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_113_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_113_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_113_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_113_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_113_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_113_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_113_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_114_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_114_CB0((uint)(19)).x).xyz;
  r0.w = cmp(0 < BA_Fragment_114_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_114_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_114_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_114_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_114_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_114_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_114_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_115_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_115_CB0((uint)(19)).x).xyz;
  r0.w = cmp(0 < BA_Fragment_115_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_115_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_115_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_115_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_115_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_115_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_116_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_116_CB0((uint)(19)).x).xyz;
  r0.w = cmp(0 < BA_Fragment_116_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_116_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_116_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_116_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_116_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_116_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_116_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_117_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_117_CB0((uint)(19)).x).xyz;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_117_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_117_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_117_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_117_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_117_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_117_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_117_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_118_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_118_CB0((uint)(19)).x).xyz;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_118_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_118_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_118_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_118_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_118_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_118_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_119_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_119_CB0((uint)(19)).x).xyz;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_119_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_119_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_119_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_119_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_119_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_119_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_119_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_120_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_120_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_120_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_120_CB0((uint)(130)).y + -BA_Fragment_120_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_120_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_120_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_120_CB0((uint)(132)).xyz * BA_Fragment_120_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_120_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_120_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_120_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_120_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_120_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_120_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_120_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_120_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_121_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_121_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_121_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_121_CB0((uint)(130)).y + -BA_Fragment_121_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_121_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_121_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_121_CB0((uint)(132)).xyz * BA_Fragment_121_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_121_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_121_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_121_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_121_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_121_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_121_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_121_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_122_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_122_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_122_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_122_CB0((uint)(130)).y + -BA_Fragment_122_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_122_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_122_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_122_CB0((uint)(132)).xyz * BA_Fragment_122_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_122_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_122_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_122_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_122_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_122_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_122_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_122_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_122_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_123_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_123_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_123_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_123_CB0((uint)(130)).y + -BA_Fragment_123_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_123_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_123_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_123_CB0((uint)(132)).xyz * BA_Fragment_123_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_123_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_123_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_123_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_123_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_123_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_123_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_123_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_123_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_124_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_124_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_124_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_124_CB0((uint)(130)).y + -BA_Fragment_124_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_124_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_124_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_124_CB0((uint)(132)).xyz * BA_Fragment_124_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_124_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_124_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_124_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_124_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_124_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_124_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_124_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_125_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_125_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_125_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_125_CB0((uint)(130)).y + -BA_Fragment_125_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_125_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_125_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_125_CB0((uint)(132)).xyz * BA_Fragment_125_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_125_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_125_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_125_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_125_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_125_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_125_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_125_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_125_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_126_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_126_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_126_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_126_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_126_CB0((uint)(19)).x).z;
  r0.x = cmp(0 < BA_Fragment_126_CB0((uint)(134)).z);
  if (r0.x != 0) {
    r0.xy = -BA_Fragment_126_CB0((uint)(134)).xy + v1.xy;
    r0.yz = BA_Fragment_126_CB0((uint)(134)).zz * abs(r0.xy);
    r0.x = BA_Fragment_126_CB0((uint)(135)).x * r0.y;
    r0.x = dot(r0.xz, r0.xz);
    r0.x = 1 + -r0.x;
    r0.x = max(0, r0.x);
    r0.x = log2(r0.x);
    r0.x = BA_Fragment_126_CB0((uint)(134)).w * r0.x;
    r0.x = exp2(r0.x);
    r0.yzw = float3(1,1,1) + -BA_Fragment_126_CB0((uint)(133)).xyz;
    r0.xyz = r0.xxx * r0.yzw + BA_Fragment_126_CB0((uint)(133)).xyz;
    r1.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r1.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_127_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_127_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_127_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_127_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_127_CB0((uint)(19)).x).z;
  r0.x = cmp(0 < BA_Fragment_127_CB0((uint)(134)).z);
  if (r0.x != 0) {
    r0.xy = -BA_Fragment_127_CB0((uint)(134)).xy + v1.xy;
    r0.yz = BA_Fragment_127_CB0((uint)(134)).zz * abs(r0.xy);
    r0.x = BA_Fragment_127_CB0((uint)(135)).x * r0.y;
    r0.x = dot(r0.xz, r0.xz);
    r0.x = 1 + -r0.x;
    r0.x = max(0, r0.x);
    r0.x = log2(r0.x);
    r0.x = BA_Fragment_127_CB0((uint)(134)).w * r0.x;
    r0.x = exp2(r0.x);
    r0.x = 1 + -r0.x;
    r1.xyz = BA_Fragment_127_CB0((uint)(133)).xyz * r0.xxx + r1.xyz;
  }
  o0.xyz = r1.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_128_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_128_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_128_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_128_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_128_CB0((uint)(19)).x).z;
  r0.x = cmp(0 < BA_Fragment_128_CB0((uint)(134)).z);
  if (r0.x != 0) {
    r0.xy = -BA_Fragment_128_CB0((uint)(134)).xy + v1.xy;
    r0.yz = BA_Fragment_128_CB0((uint)(134)).zz * abs(r0.xy);
    r0.x = BA_Fragment_128_CB0((uint)(135)).x * r0.y;
    r0.x = dot(r0.xz, r0.xz);
    r0.x = 1 + -r0.x;
    r0.x = max(0, r0.x);
    r0.x = log2(r0.x);
    r0.x = BA_Fragment_128_CB0((uint)(134)).w * r0.x;
    r0.x = exp2(r0.x);
    r0.yzw = -BA_Fragment_128_CB0((uint)(133)).xyz + r1.xyz;
    r1.xyz = r0.xxx * r0.yzw + BA_Fragment_128_CB0((uint)(133)).xyz;
  }
  o0.xyz = r1.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_129_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_129_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_129_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_129_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_129_CB0((uint)(19)).x).z;
  r0.xyz = float3(1,1,1) + -r1.xyz;
  r0.w = cmp(0 < BA_Fragment_129_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_129_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_129_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_129_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_129_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_129_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_129_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_130_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_130_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_130_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_130_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_130_CB0((uint)(19)).x).z;
  r0.xyz = float3(1,1,1) + -r1.xyz;
  r0.w = cmp(0 < BA_Fragment_130_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_130_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_130_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_130_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_130_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_130_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_131_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_131_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_131_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_131_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_131_CB0((uint)(19)).x).z;
  r0.xyz = float3(1,1,1) + -r1.xyz;
  r0.w = cmp(0 < BA_Fragment_131_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_131_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_131_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_131_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_131_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_131_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_131_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_132_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_132_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_132_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_132_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_132_CB0((uint)(19)).x).z;
  r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = -BA_Fragment_132_CB0((uint)(130)).x + r0.x;
  r0.y = BA_Fragment_132_CB0((uint)(130)).y + -BA_Fragment_132_CB0((uint)(130)).x;
  r0.x = r0.x / r0.y;
  r0.x = saturate(BA_Fragment_132_CB0((uint)(130)).z * r0.x);
  r0.y = 1 + -BA_Fragment_132_CB0((uint)(130)).z;
  r2.xyz = BA_Fragment_132_CB0((uint)(132)).xyz * BA_Fragment_132_CB0((uint)(130)).zzz;
  r0.yzw = r1.xyz * r0.yyy + r2.xyz;
  r1.x = 1 + -r0.x;
  r1.yzw = BA_Fragment_132_CB0((uint)(131)).xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_132_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_132_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_132_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_132_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_132_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_132_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_132_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_133_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_133_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_133_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_133_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_133_CB0((uint)(19)).x).z;
  r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = -BA_Fragment_133_CB0((uint)(130)).x + r0.x;
  r0.y = BA_Fragment_133_CB0((uint)(130)).y + -BA_Fragment_133_CB0((uint)(130)).x;
  r0.x = r0.x / r0.y;
  r0.x = saturate(BA_Fragment_133_CB0((uint)(130)).z * r0.x);
  r0.y = 1 + -BA_Fragment_133_CB0((uint)(130)).z;
  r2.xyz = BA_Fragment_133_CB0((uint)(132)).xyz * BA_Fragment_133_CB0((uint)(130)).zzz;
  r0.yzw = r1.xyz * r0.yyy + r2.xyz;
  r1.x = 1 + -r0.x;
  r1.yzw = BA_Fragment_133_CB0((uint)(131)).xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_133_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_133_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_133_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_133_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_133_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_133_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_134_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_134_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_134_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_134_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_134_CB0((uint)(19)).x).z;
  r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = -BA_Fragment_134_CB0((uint)(130)).x + r0.x;
  r0.y = BA_Fragment_134_CB0((uint)(130)).y + -BA_Fragment_134_CB0((uint)(130)).x;
  r0.x = r0.x / r0.y;
  r0.x = saturate(BA_Fragment_134_CB0((uint)(130)).z * r0.x);
  r0.y = 1 + -BA_Fragment_134_CB0((uint)(130)).z;
  r2.xyz = BA_Fragment_134_CB0((uint)(132)).xyz * BA_Fragment_134_CB0((uint)(130)).zzz;
  r0.yzw = r1.xyz * r0.yyy + r2.xyz;
  r1.x = 1 + -r0.x;
  r1.yzw = BA_Fragment_134_CB0((uint)(131)).xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_134_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_134_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_134_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_134_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_134_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_134_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_134_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_135_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_135_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_135_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_135_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_135_CB0((uint)(19)).x).z;
  r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = -BA_Fragment_135_CB0((uint)(130)).x + r0.x;
  r0.y = BA_Fragment_135_CB0((uint)(130)).y + -BA_Fragment_135_CB0((uint)(130)).x;
  r0.x = r0.x / r0.y;
  r0.x = saturate(BA_Fragment_135_CB0((uint)(130)).z * r0.x);
  r0.y = 1 + -BA_Fragment_135_CB0((uint)(130)).z;
  r2.xyz = BA_Fragment_135_CB0((uint)(132)).xyz * BA_Fragment_135_CB0((uint)(130)).zzz;
  r0.yzw = r1.xyz * r0.yyy + r2.xyz;
  r1.x = 1 + -r0.x;
  r1.yzw = BA_Fragment_135_CB0((uint)(131)).xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_135_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_135_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_135_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_135_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_135_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_135_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_135_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_136_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_136_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_136_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_136_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_136_CB0((uint)(19)).x).z;
  r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = -BA_Fragment_136_CB0((uint)(130)).x + r0.x;
  r0.y = BA_Fragment_136_CB0((uint)(130)).y + -BA_Fragment_136_CB0((uint)(130)).x;
  r0.x = r0.x / r0.y;
  r0.x = saturate(BA_Fragment_136_CB0((uint)(130)).z * r0.x);
  r0.y = 1 + -BA_Fragment_136_CB0((uint)(130)).z;
  r2.xyz = BA_Fragment_136_CB0((uint)(132)).xyz * BA_Fragment_136_CB0((uint)(130)).zzz;
  r0.yzw = r1.xyz * r0.yyy + r2.xyz;
  r1.x = 1 + -r0.x;
  r1.yzw = BA_Fragment_136_CB0((uint)(131)).xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_136_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_136_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_136_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_136_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_136_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_136_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_137_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_137_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_137_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_137_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_137_CB0((uint)(19)).x).z;
  r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = -BA_Fragment_137_CB0((uint)(130)).x + r0.x;
  r0.y = BA_Fragment_137_CB0((uint)(130)).y + -BA_Fragment_137_CB0((uint)(130)).x;
  r0.x = r0.x / r0.y;
  r0.x = saturate(BA_Fragment_137_CB0((uint)(130)).z * r0.x);
  r0.y = 1 + -BA_Fragment_137_CB0((uint)(130)).z;
  r2.xyz = BA_Fragment_137_CB0((uint)(132)).xyz * BA_Fragment_137_CB0((uint)(130)).zzz;
  r0.yzw = r1.xyz * r0.yyy + r2.xyz;
  r1.x = 1 + -r0.x;
  r1.yzw = BA_Fragment_137_CB0((uint)(131)).xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_137_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_137_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_137_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_137_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_137_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_137_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_137_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_138_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_138_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_138_CB0((uint)(129)).xy * BA_Fragment_138_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_138_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_138_CB0((uint)(129)).xy * BA_Fragment_138_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_138_CB0((uint)(19)).x).z;
  r0.w = cmp(0 < BA_Fragment_138_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_138_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_138_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_138_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_138_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_138_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_138_CB0((uint)(133)).xyz;
    r0.xyz = r0.xyz * r1.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_139_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_139_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_139_CB0((uint)(129)).xy * BA_Fragment_139_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_139_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_139_CB0((uint)(129)).xy * BA_Fragment_139_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_139_CB0((uint)(19)).x).z;
  r0.w = cmp(0 < BA_Fragment_139_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_139_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_139_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_139_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_139_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_139_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_140_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_140_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_140_CB0((uint)(129)).xy * BA_Fragment_140_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_140_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_140_CB0((uint)(129)).xy * BA_Fragment_140_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_140_CB0((uint)(19)).x).z;
  r0.w = cmp(0 < BA_Fragment_140_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_140_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_140_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_140_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_140_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_140_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_140_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_141_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_141_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_141_CB0((uint)(129)).xy * BA_Fragment_141_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_141_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_141_CB0((uint)(129)).xy * BA_Fragment_141_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_141_CB0((uint)(19)).x).z;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_141_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_141_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_141_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_141_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_141_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_141_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_141_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_142_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_142_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_142_CB0((uint)(129)).xy * BA_Fragment_142_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_142_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_142_CB0((uint)(129)).xy * BA_Fragment_142_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_142_CB0((uint)(19)).x).z;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_142_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_142_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_142_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_142_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_142_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_142_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_143_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_143_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_143_CB0((uint)(129)).xy * BA_Fragment_143_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_143_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_143_CB0((uint)(129)).xy * BA_Fragment_143_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_143_CB0((uint)(19)).x).z;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_143_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_143_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_143_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_143_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_143_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_143_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_143_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_144_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_144_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_144_CB0((uint)(129)).xy * BA_Fragment_144_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_144_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_144_CB0((uint)(129)).xy * BA_Fragment_144_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_144_CB0((uint)(19)).x).z;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_144_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_144_CB0((uint)(130)).y + -BA_Fragment_144_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_144_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_144_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_144_CB0((uint)(132)).xyz * BA_Fragment_144_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_144_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_144_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_144_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_144_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_144_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_144_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_144_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_144_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_145_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_145_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_145_CB0((uint)(129)).xy * BA_Fragment_145_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_145_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_145_CB0((uint)(129)).xy * BA_Fragment_145_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_145_CB0((uint)(19)).x).z;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_145_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_145_CB0((uint)(130)).y + -BA_Fragment_145_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_145_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_145_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_145_CB0((uint)(132)).xyz * BA_Fragment_145_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_145_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_145_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_145_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_145_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_145_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_145_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_145_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_146_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_146_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_146_CB0((uint)(129)).xy * BA_Fragment_146_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_146_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_146_CB0((uint)(129)).xy * BA_Fragment_146_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_146_CB0((uint)(19)).x).z;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_146_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_146_CB0((uint)(130)).y + -BA_Fragment_146_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_146_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_146_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_146_CB0((uint)(132)).xyz * BA_Fragment_146_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_146_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_146_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_146_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_146_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_146_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_146_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_146_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_146_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_147_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_147_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_147_CB0((uint)(129)).xy * BA_Fragment_147_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_147_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_147_CB0((uint)(129)).xy * BA_Fragment_147_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_147_CB0((uint)(19)).x).z;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_147_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_147_CB0((uint)(130)).y + -BA_Fragment_147_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_147_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_147_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_147_CB0((uint)(132)).xyz * BA_Fragment_147_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_147_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_147_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_147_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_147_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_147_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_147_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_147_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_147_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_148_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_148_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_148_CB0((uint)(129)).xy * BA_Fragment_148_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_148_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_148_CB0((uint)(129)).xy * BA_Fragment_148_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_148_CB0((uint)(19)).x).z;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_148_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_148_CB0((uint)(130)).y + -BA_Fragment_148_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_148_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_148_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_148_CB0((uint)(132)).xyz * BA_Fragment_148_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_148_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_148_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_148_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_148_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_148_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_148_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_148_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && !defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_149_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_149_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_149_CB0((uint)(129)).xy * BA_Fragment_149_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_149_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_149_CB0((uint)(129)).xy * BA_Fragment_149_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_149_CB0((uint)(19)).x).z;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_149_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_149_CB0((uint)(130)).y + -BA_Fragment_149_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_149_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_149_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_149_CB0((uint)(132)).xyz * BA_Fragment_149_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_149_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_149_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_149_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_149_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_149_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_149_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_149_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_149_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_150_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_150_CB0((uint)(19)).x).xyz;
  r0.w = cmp(0 < BA_Fragment_150_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_150_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_150_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_150_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_150_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_150_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_150_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_151_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_151_CB0((uint)(19)).x).xyz;
  r0.w = cmp(0 < BA_Fragment_151_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_151_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_151_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_151_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_151_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_151_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_152_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_152_CB0((uint)(19)).x).xyz;
  r0.w = cmp(0 < BA_Fragment_152_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_152_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_152_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_152_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_152_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_152_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_152_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_153_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_153_CB0((uint)(19)).x).xyz;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_153_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_153_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_153_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_153_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_153_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_153_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_153_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_154_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_154_CB0((uint)(19)).x).xyz;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_154_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_154_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_154_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_154_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_154_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_154_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_155_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_155_CB0((uint)(19)).x).xyz;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_155_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_155_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_155_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_155_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_155_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_155_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_155_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_156_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_156_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_156_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_156_CB0((uint)(130)).y + -BA_Fragment_156_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_156_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_156_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_156_CB0((uint)(132)).xyz * BA_Fragment_156_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_156_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_156_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_156_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_156_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_156_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_156_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_156_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_156_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_157_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_157_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_157_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_157_CB0((uint)(130)).y + -BA_Fragment_157_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_157_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_157_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_157_CB0((uint)(132)).xyz * BA_Fragment_157_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_157_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_157_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_157_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_157_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_157_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_157_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_157_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_158_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_158_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_158_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_158_CB0((uint)(130)).y + -BA_Fragment_158_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_158_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_158_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_158_CB0((uint)(132)).xyz * BA_Fragment_158_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_158_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_158_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_158_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_158_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_158_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_158_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_158_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_158_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_159_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_159_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_159_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_159_CB0((uint)(130)).y + -BA_Fragment_159_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_159_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_159_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_159_CB0((uint)(132)).xyz * BA_Fragment_159_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_159_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_159_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_159_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_159_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_159_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_159_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_159_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_159_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_160_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_160_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_160_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_160_CB0((uint)(130)).y + -BA_Fragment_160_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_160_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_160_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_160_CB0((uint)(132)).xyz * BA_Fragment_160_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_160_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_160_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_160_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_160_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_160_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_160_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_160_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_161_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_161_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_161_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_161_CB0((uint)(130)).y + -BA_Fragment_161_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_161_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_161_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_161_CB0((uint)(132)).xyz * BA_Fragment_161_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_161_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_161_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_161_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_161_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_161_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_161_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_161_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_161_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_162_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_162_CB0((uint)(19)).x).xyz;
  r0.w = cmp(0 < BA_Fragment_162_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_162_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_162_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_162_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_162_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_162_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_162_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_163_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_163_CB0((uint)(19)).x).xyz;
  r0.w = cmp(0 < BA_Fragment_163_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_163_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_163_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_163_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_163_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_163_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_164_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_164_CB0((uint)(19)).x).xyz;
  r0.w = cmp(0 < BA_Fragment_164_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_164_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_164_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_164_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_164_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_164_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_164_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_165_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_165_CB0((uint)(19)).x).xyz;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_165_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_165_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_165_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_165_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_165_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_165_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_165_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_166_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_166_CB0((uint)(19)).x).xyz;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_166_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_166_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_166_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_166_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_166_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_166_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_167_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_167_CB0((uint)(19)).x).xyz;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_167_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_167_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_167_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_167_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_167_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_167_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_167_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_168_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_168_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_168_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_168_CB0((uint)(130)).y + -BA_Fragment_168_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_168_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_168_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_168_CB0((uint)(132)).xyz * BA_Fragment_168_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_168_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_168_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_168_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_168_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_168_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_168_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_168_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_168_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_169_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_169_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_169_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_169_CB0((uint)(130)).y + -BA_Fragment_169_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_169_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_169_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_169_CB0((uint)(132)).xyz * BA_Fragment_169_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_169_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_169_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_169_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_169_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_169_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_169_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_169_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_170_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_170_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_170_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_170_CB0((uint)(130)).y + -BA_Fragment_170_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_170_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_170_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_170_CB0((uint)(132)).xyz * BA_Fragment_170_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_170_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_170_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_170_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_170_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_170_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_170_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_170_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_170_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_171_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_171_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_171_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_171_CB0((uint)(130)).y + -BA_Fragment_171_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_171_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_171_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_171_CB0((uint)(132)).xyz * BA_Fragment_171_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_171_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_171_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_171_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_171_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_171_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_171_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_171_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_171_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_172_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_172_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_172_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_172_CB0((uint)(130)).y + -BA_Fragment_172_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_172_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_172_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_172_CB0((uint)(132)).xyz * BA_Fragment_172_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_172_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_172_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_172_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_172_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_172_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_172_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_172_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && !defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_173_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_173_CB0((uint)(19)).x).xyz;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_173_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_173_CB0((uint)(130)).y + -BA_Fragment_173_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_173_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_173_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_173_CB0((uint)(132)).xyz * BA_Fragment_173_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_173_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_173_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_173_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_173_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_173_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_173_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_173_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_173_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_174_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_174_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_174_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_174_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_174_CB0((uint)(19)).x).z;
  r0.x = cmp(0 < BA_Fragment_174_CB0((uint)(134)).z);
  if (r0.x != 0) {
    r0.xy = -BA_Fragment_174_CB0((uint)(134)).xy + v1.xy;
    r0.yz = BA_Fragment_174_CB0((uint)(134)).zz * abs(r0.xy);
    r0.x = BA_Fragment_174_CB0((uint)(135)).x * r0.y;
    r0.x = dot(r0.xz, r0.xz);
    r0.x = 1 + -r0.x;
    r0.x = max(0, r0.x);
    r0.x = log2(r0.x);
    r0.x = BA_Fragment_174_CB0((uint)(134)).w * r0.x;
    r0.x = exp2(r0.x);
    r0.yzw = float3(1,1,1) + -BA_Fragment_174_CB0((uint)(133)).xyz;
    r0.xyz = r0.xxx * r0.yzw + BA_Fragment_174_CB0((uint)(133)).xyz;
    r1.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r1.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_175_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_175_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_175_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_175_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_175_CB0((uint)(19)).x).z;
  r0.x = cmp(0 < BA_Fragment_175_CB0((uint)(134)).z);
  if (r0.x != 0) {
    r0.xy = -BA_Fragment_175_CB0((uint)(134)).xy + v1.xy;
    r0.yz = BA_Fragment_175_CB0((uint)(134)).zz * abs(r0.xy);
    r0.x = BA_Fragment_175_CB0((uint)(135)).x * r0.y;
    r0.x = dot(r0.xz, r0.xz);
    r0.x = 1 + -r0.x;
    r0.x = max(0, r0.x);
    r0.x = log2(r0.x);
    r0.x = BA_Fragment_175_CB0((uint)(134)).w * r0.x;
    r0.x = exp2(r0.x);
    r0.x = 1 + -r0.x;
    r1.xyz = BA_Fragment_175_CB0((uint)(133)).xyz * r0.xxx + r1.xyz;
  }
  o0.xyz = r1.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_176_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_176_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_176_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_176_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_176_CB0((uint)(19)).x).z;
  r0.x = cmp(0 < BA_Fragment_176_CB0((uint)(134)).z);
  if (r0.x != 0) {
    r0.xy = -BA_Fragment_176_CB0((uint)(134)).xy + v1.xy;
    r0.yz = BA_Fragment_176_CB0((uint)(134)).zz * abs(r0.xy);
    r0.x = BA_Fragment_176_CB0((uint)(135)).x * r0.y;
    r0.x = dot(r0.xz, r0.xz);
    r0.x = 1 + -r0.x;
    r0.x = max(0, r0.x);
    r0.x = log2(r0.x);
    r0.x = BA_Fragment_176_CB0((uint)(134)).w * r0.x;
    r0.x = exp2(r0.x);
    r0.yzw = -BA_Fragment_176_CB0((uint)(133)).xyz + r1.xyz;
    r1.xyz = r0.xxx * r0.yzw + BA_Fragment_176_CB0((uint)(133)).xyz;
  }
  o0.xyz = r1.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_177_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_177_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_177_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_177_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_177_CB0((uint)(19)).x).z;
  r0.xyz = float3(1,1,1) + -r1.xyz;
  r0.w = cmp(0 < BA_Fragment_177_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_177_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_177_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_177_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_177_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_177_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_177_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_178_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_178_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_178_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_178_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_178_CB0((uint)(19)).x).z;
  r0.xyz = float3(1,1,1) + -r1.xyz;
  r0.w = cmp(0 < BA_Fragment_178_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_178_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_178_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_178_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_178_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_178_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_179_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_179_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_179_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_179_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_179_CB0((uint)(19)).x).z;
  r0.xyz = float3(1,1,1) + -r1.xyz;
  r0.w = cmp(0 < BA_Fragment_179_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_179_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_179_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_179_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_179_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_179_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_179_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_180_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_180_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_180_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_180_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_180_CB0((uint)(19)).x).z;
  r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = -BA_Fragment_180_CB0((uint)(130)).x + r0.x;
  r0.y = BA_Fragment_180_CB0((uint)(130)).y + -BA_Fragment_180_CB0((uint)(130)).x;
  r0.x = r0.x / r0.y;
  r0.x = saturate(BA_Fragment_180_CB0((uint)(130)).z * r0.x);
  r0.y = 1 + -BA_Fragment_180_CB0((uint)(130)).z;
  r2.xyz = BA_Fragment_180_CB0((uint)(132)).xyz * BA_Fragment_180_CB0((uint)(130)).zzz;
  r0.yzw = r1.xyz * r0.yyy + r2.xyz;
  r1.x = 1 + -r0.x;
  r1.yzw = BA_Fragment_180_CB0((uint)(131)).xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_180_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_180_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_180_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_180_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_180_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_180_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_180_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_181_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_181_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_181_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_181_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_181_CB0((uint)(19)).x).z;
  r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = -BA_Fragment_181_CB0((uint)(130)).x + r0.x;
  r0.y = BA_Fragment_181_CB0((uint)(130)).y + -BA_Fragment_181_CB0((uint)(130)).x;
  r0.x = r0.x / r0.y;
  r0.x = saturate(BA_Fragment_181_CB0((uint)(130)).z * r0.x);
  r0.y = 1 + -BA_Fragment_181_CB0((uint)(130)).z;
  r2.xyz = BA_Fragment_181_CB0((uint)(132)).xyz * BA_Fragment_181_CB0((uint)(130)).zzz;
  r0.yzw = r1.xyz * r0.yyy + r2.xyz;
  r1.x = 1 + -r0.x;
  r1.yzw = BA_Fragment_181_CB0((uint)(131)).xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_181_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_181_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_181_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_181_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_181_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_181_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_182_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_182_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_182_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_182_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_182_CB0((uint)(19)).x).z;
  r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = -BA_Fragment_182_CB0((uint)(130)).x + r0.x;
  r0.y = BA_Fragment_182_CB0((uint)(130)).y + -BA_Fragment_182_CB0((uint)(130)).x;
  r0.x = r0.x / r0.y;
  r0.x = saturate(BA_Fragment_182_CB0((uint)(130)).z * r0.x);
  r0.y = 1 + -BA_Fragment_182_CB0((uint)(130)).z;
  r2.xyz = BA_Fragment_182_CB0((uint)(132)).xyz * BA_Fragment_182_CB0((uint)(130)).zzz;
  r0.yzw = r1.xyz * r0.yyy + r2.xyz;
  r1.x = 1 + -r0.x;
  r1.yzw = BA_Fragment_182_CB0((uint)(131)).xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_182_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_182_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_182_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_182_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_182_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_182_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_182_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_183_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_183_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_183_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_183_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_183_CB0((uint)(19)).x).z;
  r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = -BA_Fragment_183_CB0((uint)(130)).x + r0.x;
  r0.y = BA_Fragment_183_CB0((uint)(130)).y + -BA_Fragment_183_CB0((uint)(130)).x;
  r0.x = r0.x / r0.y;
  r0.x = saturate(BA_Fragment_183_CB0((uint)(130)).z * r0.x);
  r0.y = 1 + -BA_Fragment_183_CB0((uint)(130)).z;
  r2.xyz = BA_Fragment_183_CB0((uint)(132)).xyz * BA_Fragment_183_CB0((uint)(130)).zzz;
  r0.yzw = r1.xyz * r0.yyy + r2.xyz;
  r1.x = 1 + -r0.x;
  r1.yzw = BA_Fragment_183_CB0((uint)(131)).xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_183_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_183_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_183_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_183_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_183_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_183_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_183_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_184_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_184_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_184_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_184_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_184_CB0((uint)(19)).x).z;
  r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = -BA_Fragment_184_CB0((uint)(130)).x + r0.x;
  r0.y = BA_Fragment_184_CB0((uint)(130)).y + -BA_Fragment_184_CB0((uint)(130)).x;
  r0.x = r0.x / r0.y;
  r0.x = saturate(BA_Fragment_184_CB0((uint)(130)).z * r0.x);
  r0.y = 1 + -BA_Fragment_184_CB0((uint)(130)).z;
  r2.xyz = BA_Fragment_184_CB0((uint)(132)).xyz * BA_Fragment_184_CB0((uint)(130)).zzz;
  r0.yzw = r1.xyz * r0.yyy + r2.xyz;
  r1.x = 1 + -r0.x;
  r1.yzw = BA_Fragment_184_CB0((uint)(131)).xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_184_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_184_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_184_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_184_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_184_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_184_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_185_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);
  r1.x = dot(r0.zw, r0.zw);
  r0.xyzw = r1.xxxx * r0.xyzw;
  r0.xyzw = BA_Fragment_185_CB0((uint)(129)).zzzz * r0.xyzw;
  r1.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_185_CB0((uint)(19)).x).x;
  r0.xyzw = r0.xyzw * float4(-0.333333343,-0.333333343,-0.666666687,-0.666666687) + v1.xyxy;
  r1.y = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_185_CB0((uint)(19)).x).y;
  r1.z = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_185_CB0((uint)(19)).x).z;
  r0.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.x = -BA_Fragment_185_CB0((uint)(130)).x + r0.x;
  r0.y = BA_Fragment_185_CB0((uint)(130)).y + -BA_Fragment_185_CB0((uint)(130)).x;
  r0.x = r0.x / r0.y;
  r0.x = saturate(BA_Fragment_185_CB0((uint)(130)).z * r0.x);
  r0.y = 1 + -BA_Fragment_185_CB0((uint)(130)).z;
  r2.xyz = BA_Fragment_185_CB0((uint)(132)).xyz * BA_Fragment_185_CB0((uint)(130)).zzz;
  r0.yzw = r1.xyz * r0.yyy + r2.xyz;
  r1.x = 1 + -r0.x;
  r1.yzw = BA_Fragment_185_CB0((uint)(131)).xyz * r0.xxx;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_185_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_185_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_185_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_185_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_185_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_185_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_185_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_186_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_186_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_186_CB0((uint)(129)).xy * BA_Fragment_186_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_186_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_186_CB0((uint)(129)).xy * BA_Fragment_186_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_186_CB0((uint)(19)).x).z;
  r0.w = cmp(0 < BA_Fragment_186_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_186_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_186_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_186_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_186_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_186_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_186_CB0((uint)(133)).xyz;
    r0.xyz = r0.xyz * r1.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_187_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_187_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_187_CB0((uint)(129)).xy * BA_Fragment_187_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_187_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_187_CB0((uint)(129)).xy * BA_Fragment_187_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_187_CB0((uint)(19)).x).z;
  r0.w = cmp(0 < BA_Fragment_187_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_187_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_187_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_187_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_187_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_187_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_188_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_188_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_188_CB0((uint)(129)).xy * BA_Fragment_188_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_188_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_188_CB0((uint)(129)).xy * BA_Fragment_188_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_188_CB0((uint)(19)).x).z;
  r0.w = cmp(0 < BA_Fragment_188_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_188_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_188_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_188_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_188_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_188_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_188_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_189_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_189_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_189_CB0((uint)(129)).xy * BA_Fragment_189_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_189_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_189_CB0((uint)(129)).xy * BA_Fragment_189_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_189_CB0((uint)(19)).x).z;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_189_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_189_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_189_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_189_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_189_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_189_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_189_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_190_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_190_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_190_CB0((uint)(129)).xy * BA_Fragment_190_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_190_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_190_CB0((uint)(129)).xy * BA_Fragment_190_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_190_CB0((uint)(19)).x).z;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_190_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_190_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_190_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_190_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_190_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_190_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && !defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_191_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_191_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_191_CB0((uint)(129)).xy * BA_Fragment_191_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_191_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_191_CB0((uint)(129)).xy * BA_Fragment_191_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_191_CB0((uint)(19)).x).z;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_191_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_191_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_191_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_191_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_191_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_191_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_191_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_192_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_192_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_192_CB0((uint)(129)).xy * BA_Fragment_192_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_192_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_192_CB0((uint)(129)).xy * BA_Fragment_192_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_192_CB0((uint)(19)).x).z;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_192_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_192_CB0((uint)(130)).y + -BA_Fragment_192_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_192_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_192_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_192_CB0((uint)(132)).xyz * BA_Fragment_192_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_192_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_192_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_192_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_192_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_192_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_192_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_192_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_192_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_193_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_193_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_193_CB0((uint)(129)).xy * BA_Fragment_193_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_193_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_193_CB0((uint)(129)).xy * BA_Fragment_193_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_193_CB0((uint)(19)).x).z;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_193_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_193_CB0((uint)(130)).y + -BA_Fragment_193_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_193_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_193_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_193_CB0((uint)(132)).xyz * BA_Fragment_193_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_193_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_193_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_193_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_193_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_193_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_193_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_193_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && !defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_194_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_194_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_194_CB0((uint)(129)).xy * BA_Fragment_194_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_194_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_194_CB0((uint)(129)).xy * BA_Fragment_194_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_194_CB0((uint)(19)).x).z;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_194_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_194_CB0((uint)(130)).y + -BA_Fragment_194_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_194_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_194_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_194_CB0((uint)(132)).xyz * BA_Fragment_194_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_194_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.w = cmp(0 < BA_Fragment_194_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_194_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_194_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_194_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_194_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_194_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_194_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_195_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_195_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_195_CB0((uint)(129)).xy * BA_Fragment_195_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_195_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_195_CB0((uint)(129)).xy * BA_Fragment_195_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_195_CB0((uint)(19)).x).z;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_195_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_195_CB0((uint)(130)).y + -BA_Fragment_195_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_195_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_195_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_195_CB0((uint)(132)).xyz * BA_Fragment_195_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_195_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_195_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_195_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_195_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_195_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_195_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -BA_Fragment_195_CB0((uint)(133)).xyz;
    r1.xyz = r0.www * r1.xyz + BA_Fragment_195_CB0((uint)(133)).xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && defined(_VIGNETTE_ADDTIVE) && !defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_196_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_196_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_196_CB0((uint)(129)).xy * BA_Fragment_196_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_196_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_196_CB0((uint)(129)).xy * BA_Fragment_196_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_196_CB0((uint)(19)).x).z;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_196_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_196_CB0((uint)(130)).y + -BA_Fragment_196_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_196_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_196_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_196_CB0((uint)(132)).xyz * BA_Fragment_196_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_196_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_196_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_196_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_196_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_196_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_196_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r0.w = 1 + -r0.w;
    r0.xyz = BA_Fragment_196_CB0((uint)(133)).xyz * r0.www + r0.xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(_CHROMATIC_ABERRATION_DIR) && defined(_USE_CHROMATIC_ABERRATION) && defined(_USE_DRAW_PROCEDURAL) && defined(_USE_INVERSE) && defined(_USE_THRESHOLD) && !defined(_VIGNETTE_ADDTIVE) && defined(_VIGNETTE_ALPHABLEND)
float4 BA_Fragment_197_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_ChromaticAberrationParams.x, _ChromaticAberrationParams.y, _ChromaticAberrationParams.z, _ChromaticAberrationParams.w);
  if (i == 130u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  if (i == 131u) value = float4(_ThresholColorA.x, _ThresholColorA.y, _ThresholColorA.z, _ThresholColorA.w);
  if (i == 132u) value = float4(_ThresholColorB.x, _ThresholColorB.y, _ThresholColorB.z, _ThresholColorB.w);
  if (i == 133u) value = float4(_VignetteColor.x, _VignetteColor.y, _VignetteColor.z, _VignetteColor.w);
  if (i == 134u) value = float4(_VignetteParamsA.x, _VignetteParamsA.y, _VignetteParamsA.z, _VignetteParamsA.w);
  if (i == 135u) value = float4(_VignetteParamsB, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = _SourceTex.SampleBias(sampler_SourceTex, v1.xy, BA_Fragment_197_CB0((uint)(19)).x).x;
  r1.xy = BA_Fragment_197_CB0((uint)(129)).xy * BA_Fragment_197_CB0((uint)(129)).zz + v1.xy;
  r0.y = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_197_CB0((uint)(19)).x).y;
  r1.xy = -BA_Fragment_197_CB0((uint)(129)).xy * BA_Fragment_197_CB0((uint)(129)).zz + v1.xy;
  r0.z = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_197_CB0((uint)(19)).x).z;
  r0.w = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = -BA_Fragment_197_CB0((uint)(130)).x + r0.w;
  r1.x = BA_Fragment_197_CB0((uint)(130)).y + -BA_Fragment_197_CB0((uint)(130)).x;
  r0.w = r0.w / r1.x;
  r0.w = saturate(BA_Fragment_197_CB0((uint)(130)).z * r0.w);
  r1.x = 1 + -BA_Fragment_197_CB0((uint)(130)).z;
  r1.yzw = BA_Fragment_197_CB0((uint)(132)).xyz * BA_Fragment_197_CB0((uint)(130)).zzz;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r1.x = 1 + -r0.w;
  r1.yzw = BA_Fragment_197_CB0((uint)(131)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.w = cmp(0 < BA_Fragment_197_CB0((uint)(134)).z);
  if (r0.w != 0) {
    r1.xy = -BA_Fragment_197_CB0((uint)(134)).xy + v1.xy;
    r1.yz = BA_Fragment_197_CB0((uint)(134)).zz * abs(r1.xy);
    r1.x = BA_Fragment_197_CB0((uint)(135)).x * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = BA_Fragment_197_CB0((uint)(134)).w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = -BA_Fragment_197_CB0((uint)(133)).xyz + r0.xyz;
    r0.xyz = r0.www * r1.xyz + BA_Fragment_197_CB0((uint)(133)).xyz;
  }
  o0.xyz = r0.xyz;
  o0.w = 1;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
