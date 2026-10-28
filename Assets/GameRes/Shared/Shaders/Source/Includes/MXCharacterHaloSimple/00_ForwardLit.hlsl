// Exact names and types from the original compiled parameter metadata.
float _DitherThreshold;
float _GrayBrightness;
float4 _SimpleBaseColor;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
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
  out float4 o0 : SV_POSITION0,
  out float o1 : TEXCOORD0)
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
  o1.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
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
  out float4 o0 : SV_POSITION0,
  out float o1 : TEXCOORD0)
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
  o1.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
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
  r0.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_8_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.y = r0.x / r0.w;
  o1.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
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
  r0.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_9_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.y = r0.x / r0.w;
  o1.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_10_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_10_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float o1 : TEXCOORD0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_10_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_10_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_10_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_10_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_10_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.x = 0;
  o2.x = v1.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_11_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_11_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float o1 : TEXCOORD0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_11_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_11_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_11_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_11_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_11_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.x = 0;
  o2.x = v1.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_12_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_12_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_12_CB0(uint i)
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_12_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_12_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_12_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_12_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_12_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_12_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_12_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_12_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_12_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_12_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.y = r0.x / r0.w;
  o1.x = 0;
  o2.x = v1.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_13_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_13_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_13_CB0(uint i)
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_13_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_13_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_13_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_13_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_13_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_13_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_13_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_13_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_13_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_13_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.y = r0.x / r0.w;
  o1.x = 0;
  o2.x = v1.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
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
  out float4 o0 : SV_POSITION0,
  out float o1 : TEXCOORD0)
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
  r0.x = r0.z / BA_Vertex_14_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_14_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = saturate(r0.x * BA_Vertex_14_CB0((uint)(55)).z + BA_Vertex_14_CB0((uint)(55)).w);
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
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
  out float4 o0 : SV_POSITION0,
  out float o1 : TEXCOORD0)
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
  r0.xyzw = BA_Vertex_15_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_15_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_15_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = saturate(r0.x * BA_Vertex_15_CB0((uint)(55)).z + BA_Vertex_15_CB0((uint)(55)).w);
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
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
  r0.xyzw = BA_Vertex_16_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_16_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.y = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_16_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_16_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = saturate(r0.x * BA_Vertex_16_CB0((uint)(55)).z + BA_Vertex_16_CB0((uint)(55)).w);
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
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
  r0.xyzw = BA_Vertex_17_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_17_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.y = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_17_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_17_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = saturate(r0.x * BA_Vertex_17_CB0((uint)(55)).z + BA_Vertex_17_CB0((uint)(55)).w);
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_18_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_18_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_18_CB0(uint i)
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float o1 : TEXCOORD0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_18_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_18_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_18_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_18_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_18_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_18_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_18_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_18_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_18_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_18_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_18_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = saturate(r0.x * BA_Vertex_18_CB0((uint)(55)).z + BA_Vertex_18_CB0((uint)(55)).w);
  o2.x = v1.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_19_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_19_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float o1 : TEXCOORD0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_19_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_19_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_19_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_19_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_19_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_19_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_19_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_19_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_19_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_19_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_19_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = saturate(r0.x * BA_Vertex_19_CB0((uint)(55)).z + BA_Vertex_19_CB0((uint)(55)).w);
  o2.x = v1.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_20_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_20_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_20_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_20_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_20_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_20_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_20_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_20_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_20_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_20_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_20_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_20_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.y = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_20_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_20_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = saturate(r0.x * BA_Vertex_20_CB0((uint)(55)).z + BA_Vertex_20_CB0((uint)(55)).w);
  o2.x = v1.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_21_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_21_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_21_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_21_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_21_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_21_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_21_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_21_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_21_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_21_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.y = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_21_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_21_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = saturate(r0.x * BA_Vertex_21_CB0((uint)(55)).z + BA_Vertex_21_CB0((uint)(55)).w);
  o2.x = v1.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
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
  out float4 o0 : SV_POSITION0,
  out float o1 : TEXCOORD0)
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
  r0.x = r0.z / BA_Vertex_22_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_22_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = BA_Vertex_22_CB0((uint)(55)).x * r0.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
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
  out float4 o0 : SV_POSITION0,
  out float o1 : TEXCOORD0)
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
  o1.x = BA_Vertex_23_CB0((uint)(55)).x * r0.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
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
  r0.xyzw = BA_Vertex_24_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_24_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.y = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_24_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_24_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = BA_Vertex_24_CB0((uint)(55)).x * r0.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
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
  r0.xyzw = BA_Vertex_25_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_25_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.y = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_25_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_25_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = BA_Vertex_25_CB0((uint)(55)).x * r0.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_26_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_26_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float o1 : TEXCOORD0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_26_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_26_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_26_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_26_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_26_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_26_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_26_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_26_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_26_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_26_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_26_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = BA_Vertex_26_CB0((uint)(55)).x * r0.x;
  o2.x = v1.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_27_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_27_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_27_CB0(uint i)
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float o1 : TEXCOORD0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_27_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_27_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_27_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_27_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_27_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_27_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_27_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_27_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_27_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_27_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_27_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = BA_Vertex_27_CB0((uint)(55)).x * r0.x;
  o2.x = v1.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_28_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_28_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_28_CB0(uint i)
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_28_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_28_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_28_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_28_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_28_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_28_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_28_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_28_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_28_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_28_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.y = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_28_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_28_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = BA_Vertex_28_CB0((uint)(55)).x * r0.x;
  o2.x = v1.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_29_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_29_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_29_CB0(uint i)
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_29_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_29_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_29_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_29_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_29_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_29_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_29_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_29_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_29_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_29_CB0((uint)(17)).x * r0.y;
  r0.y = 0.5 * r0.w;
  r0.x = r0.x * 0.5 + r0.y;
  o1.y = r0.x / r0.w;
  r0.x = r0.z / BA_Vertex_29_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_29_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.x = BA_Vertex_29_CB0((uint)(55)).x * r0.x;
  o2.x = v1.x;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_38_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = BA_Fragment_38_CB0((uint)(0)).xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_39_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(BA_Fragment_39_CB0((uint)(0)).xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.xyz = BA_Fragment_39_CB0((uint)(1)).yyy * r0.xxx;
  o0.w = BA_Fragment_39_CB0((uint)(0)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_40_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_40_CB0((uint)(1)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = BA_Fragment_40_CB0((uint)(0)).xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_41_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(_DitherThreshold, _GrayBrightness, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_41_CB0((uint)(1)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(BA_Fragment_41_CB0((uint)(0)).xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.xyz = BA_Fragment_41_CB0((uint)(1)).yyy * r0.xxx;
  o0.w = BA_Fragment_41_CB0((uint)(0)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_42_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  o0.xyzw = BA_Fragment_42_CB0((uint)(0)).xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_43_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(BA_Fragment_43_CB0((uint)(0)).xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.xyz = BA_Fragment_43_CB0((uint)(1)).yyy * r0.xxx;
  o0.w = BA_Fragment_43_CB0((uint)(0)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_44_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_44_CB0((uint)(1)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = BA_Fragment_44_CB0((uint)(0)).xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_45_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(_DitherThreshold, _GrayBrightness, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_45_CB0((uint)(1)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(BA_Fragment_45_CB0((uint)(0)).xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.xyz = BA_Fragment_45_CB0((uint)(1)).yyy * r0.xxx;
  o0.w = BA_Fragment_45_CB0((uint)(0)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_46_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_46_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_46_CB1((uint)(0)).xyz + -BA_Fragment_46_CB0((uint)(56)).xyz;
  o0.xyz = v1.xxx * r0.xyz + BA_Fragment_46_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_46_CB1((uint)(0)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_47_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_47_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(BA_Fragment_47_CB1((uint)(0)).xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.xyz = r0.xxx * BA_Fragment_47_CB1((uint)(1)).yyy + -BA_Fragment_47_CB0((uint)(56)).xyz;
  o0.xyz = v1.xxx * r0.xyz + BA_Fragment_47_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_47_CB1((uint)(0)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_48_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_48_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_48_CB1((uint)(1)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_48_CB1((uint)(0)).xyz + -BA_Fragment_48_CB0((uint)(56)).xyz;
  o0.xyz = v1.xxx * r0.xyz + BA_Fragment_48_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_48_CB1((uint)(0)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_49_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(_DitherThreshold, _GrayBrightness, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_49_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_49_CB1((uint)(1)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(BA_Fragment_49_CB1((uint)(0)).xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.xyz = r0.xxx * BA_Fragment_49_CB1((uint)(1)).yyy + -BA_Fragment_49_CB0((uint)(56)).xyz;
  o0.xyz = v1.xxx * r0.xyz + BA_Fragment_49_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_49_CB1((uint)(0)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_50_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_50_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_50_CB1((uint)(0)).xyz + -BA_Fragment_50_CB0((uint)(56)).xyz;
  o0.xyz = v1.xxx * r0.xyz + BA_Fragment_50_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_50_CB1((uint)(0)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_51_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_51_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(BA_Fragment_51_CB1((uint)(0)).xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.xyz = r0.xxx * BA_Fragment_51_CB1((uint)(1)).yyy + -BA_Fragment_51_CB0((uint)(56)).xyz;
  o0.xyz = v1.xxx * r0.xyz + BA_Fragment_51_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_51_CB1((uint)(0)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_52_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_52_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_52_CB1((uint)(1)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_52_CB1((uint)(0)).xyz + -BA_Fragment_52_CB0((uint)(56)).xyz;
  o0.xyz = v1.xxx * r0.xyz + BA_Fragment_52_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_52_CB1((uint)(0)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_53_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(_DitherThreshold, _GrayBrightness, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_53_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_53_CB1((uint)(1)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(BA_Fragment_53_CB1((uint)(0)).xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.xyz = r0.xxx * BA_Fragment_53_CB1((uint)(1)).yyy + -BA_Fragment_53_CB0((uint)(56)).xyz;
  o0.xyz = v1.xxx * r0.xyz + BA_Fragment_53_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_53_CB1((uint)(0)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_54_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_54_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v1.x);
  r0.x = min(1, r0.x);
  r0.yzw = BA_Fragment_54_CB1((uint)(0)).xyz + -BA_Fragment_54_CB0((uint)(56)).xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_54_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_54_CB1((uint)(0)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_55_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_55_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v1.x);
  r0.x = min(1, r0.x);
  r0.y = dot(BA_Fragment_55_CB1((uint)(0)).xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.yzw = r0.yyy * BA_Fragment_55_CB1((uint)(1)).yyy + -BA_Fragment_55_CB0((uint)(56)).xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_55_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_55_CB1((uint)(0)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_56_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_56_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_56_CB1((uint)(1)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v1.x);
  r0.x = min(1, r0.x);
  r0.yzw = BA_Fragment_56_CB1((uint)(0)).xyz + -BA_Fragment_56_CB0((uint)(56)).xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_56_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_56_CB1((uint)(0)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_57_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(_DitherThreshold, _GrayBrightness, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_57_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_57_CB1((uint)(1)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v1.x);
  r0.x = min(1, r0.x);
  r0.y = dot(BA_Fragment_57_CB1((uint)(0)).xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.yzw = r0.yyy * BA_Fragment_57_CB1((uint)(1)).yyy + -BA_Fragment_57_CB0((uint)(56)).xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_57_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_57_CB1((uint)(0)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_58_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_58_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v1.x);
  r0.x = min(1, r0.x);
  r0.yzw = BA_Fragment_58_CB1((uint)(0)).xyz + -BA_Fragment_58_CB0((uint)(56)).xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_58_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_58_CB1((uint)(0)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_59_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_59_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v1.x);
  r0.x = min(1, r0.x);
  r0.y = dot(BA_Fragment_59_CB1((uint)(0)).xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.yzw = r0.yyy * BA_Fragment_59_CB1((uint)(1)).yyy + -BA_Fragment_59_CB0((uint)(56)).xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_59_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_59_CB1((uint)(0)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_60_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_60_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_60_CB1((uint)(1)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v1.x);
  r0.x = min(1, r0.x);
  r0.yzw = BA_Fragment_60_CB1((uint)(0)).xyz + -BA_Fragment_60_CB0((uint)(56)).xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_60_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_60_CB1((uint)(0)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_61_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_SimpleBaseColor.x, _SimpleBaseColor.y, _SimpleBaseColor.z, _SimpleBaseColor.w);
  if (i == 1u) value = float4(_DitherThreshold, _GrayBrightness, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_61_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_61_CB1((uint)(1)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v1.x);
  r0.x = min(1, r0.x);
  r0.y = dot(BA_Fragment_61_CB1((uint)(0)).xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.yzw = r0.yyy * BA_Fragment_61_CB1((uint)(1)).yyy + -BA_Fragment_61_CB0((uint)(56)).xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_61_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_61_CB1((uint)(0)).w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
