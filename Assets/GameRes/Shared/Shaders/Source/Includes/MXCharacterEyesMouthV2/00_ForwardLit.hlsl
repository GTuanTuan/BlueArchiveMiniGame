// Exact names and types from the original compiled parameter metadata.
float _AdditionalLightSharpness;
float _AdditionalLightStrength;
float4 _CodeAddColor;
float4 _CodeMultiplyColor;
float _DitherThreshold;
float4 _EyeTint;
float _GrayBrightness;
float4 _MouthTileTex_ST;
float4 _MouthTint;
float4 _MxCharLightData;
float4 _MxCharLightTone;
Texture2D<float4> _MainTex;
Texture2D<float4> _MouthTileTex;
SamplerState sampler_MainTex;
SamplerState sampler_MouthTileTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_6_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  o1.xy = v2.xy;
  o1.z = 0;
  o2.w = BA_Vertex_6_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_6_CB0((uint)(127)).xxx * BA_Vertex_6_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_6_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_6_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_6_CB2((uint)(6)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_7_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  o1.xy = v2.xy;
  o1.z = 0;
  o2.w = BA_Vertex_7_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_7_CB0((uint)(127)).xxx * BA_Vertex_7_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_7_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_7_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_7_CB2((uint)(6)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_8_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o1.w = 0.5 + r0.x;
  o1.xy = v2.xy;
  o1.z = 0;
  o2.w = BA_Vertex_8_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_8_CB0((uint)(127)).xxx * BA_Vertex_8_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_8_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_8_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_8_CB2((uint)(6)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_9_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o1.w = 0.5 + r0.x;
  o1.xy = v2.xy;
  o1.z = 0;
  o2.w = BA_Vertex_9_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_9_CB0((uint)(127)).xxx * BA_Vertex_9_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_9_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_9_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_9_CB2((uint)(6)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_10_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  r0.x = r0.z / BA_Vertex_10_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_10_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_10_CB0((uint)(55)).z + BA_Vertex_10_CB0((uint)(55)).w);
  o1.xy = v2.xy;
  o2.w = BA_Vertex_10_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_10_CB0((uint)(127)).xxx * BA_Vertex_10_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_10_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_10_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_10_CB2((uint)(6)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_11_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  o1.z = saturate(r0.x * BA_Vertex_11_CB0((uint)(55)).z + BA_Vertex_11_CB0((uint)(55)).w);
  o1.xy = v2.xy;
  o2.w = BA_Vertex_11_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_11_CB0((uint)(127)).xxx * BA_Vertex_11_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_11_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_11_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_11_CB2((uint)(6)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_12_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  r0.x = BA_Vertex_12_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  r0.y = r0.z / BA_Vertex_12_CB0((uint)(17)).y;
  r0.y = 1 + -r0.y;
  r0.y = BA_Vertex_12_CB0((uint)(17)).z * r0.y;
  r0.y = max(0, r0.y);
  o1.z = saturate(r0.y * BA_Vertex_12_CB0((uint)(55)).z + BA_Vertex_12_CB0((uint)(55)).w);
  o1.w = 0.5 + r0.x;
  o1.xy = v2.xy;
  o2.w = BA_Vertex_12_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_12_CB0((uint)(127)).xxx * BA_Vertex_12_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_12_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_12_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_12_CB2((uint)(6)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_13_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  r0.y = r0.z / BA_Vertex_13_CB0((uint)(17)).y;
  r0.y = 1 + -r0.y;
  r0.y = BA_Vertex_13_CB0((uint)(17)).z * r0.y;
  r0.y = max(0, r0.y);
  o1.z = saturate(r0.y * BA_Vertex_13_CB0((uint)(55)).z + BA_Vertex_13_CB0((uint)(55)).w);
  o1.w = 0.5 + r0.x;
  o1.xy = v2.xy;
  o2.w = BA_Vertex_13_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_13_CB0((uint)(127)).xxx * BA_Vertex_13_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_13_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_13_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_13_CB2((uint)(6)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_14_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  o1.z = BA_Vertex_14_CB0((uint)(55)).x * r0.x;
  o1.xy = v2.xy;
  o2.w = BA_Vertex_14_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_14_CB0((uint)(127)).xxx * BA_Vertex_14_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_14_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_14_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_14_CB2((uint)(6)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_15_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  o1.z = BA_Vertex_15_CB0((uint)(55)).x * r0.x;
  o1.xy = v2.xy;
  o2.w = BA_Vertex_15_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_15_CB0((uint)(127)).xxx * BA_Vertex_15_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_15_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_15_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_15_CB2((uint)(6)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_16_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  r0.y = r0.z / BA_Vertex_16_CB0((uint)(17)).y;
  r0.y = 1 + -r0.y;
  r0.y = BA_Vertex_16_CB0((uint)(17)).z * r0.y;
  r0.y = max(0, r0.y);
  o1.z = BA_Vertex_16_CB0((uint)(55)).x * r0.y;
  o1.w = 0.5 + r0.x;
  o1.xy = v2.xy;
  o2.w = BA_Vertex_16_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_16_CB0((uint)(127)).xxx * BA_Vertex_16_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_16_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_16_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_16_CB2((uint)(6)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_17_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  r0.y = r0.z / BA_Vertex_17_CB0((uint)(17)).y;
  r0.y = 1 + -r0.y;
  r0.y = BA_Vertex_17_CB0((uint)(17)).z * r0.y;
  r0.y = max(0, r0.y);
  o1.z = BA_Vertex_17_CB0((uint)(55)).x * r0.y;
  o1.w = 0.5 + r0.x;
  o1.xy = v2.xy;
  o2.w = BA_Vertex_17_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_17_CB0((uint)(127)).xxx * BA_Vertex_17_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_17_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_17_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_17_CB2((uint)(6)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_18_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_18_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_18_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_18_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_18_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_18_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_18_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_18_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_18_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_18_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = r0.xyz;
  o0.xyzw = BA_Vertex_18_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v2.xy;
  o1.z = 0;
  o2.w = BA_Vertex_18_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_18_CB0((uint)(127)).xxx * BA_Vertex_18_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_18_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_18_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_18_CB2((uint)(6)).w;
  r0.x = dot(v1.xyz, BA_Vertex_18_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_18_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_18_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o5.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_19_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_19_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_19_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_19_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_19_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_19_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_19_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_19_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_19_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_19_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = r0.xyz;
  o0.xyzw = BA_Vertex_19_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v2.xy;
  o1.z = 0;
  o2.w = BA_Vertex_19_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_19_CB0((uint)(127)).xxx * BA_Vertex_19_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_19_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_19_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_19_CB2((uint)(6)).w;
  r0.x = dot(v1.xyz, BA_Vertex_19_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_19_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_19_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o5.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_20_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_20_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_20_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_20_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_20_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_20_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_20_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_20_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_20_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_20_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = r0.xyz;
  r0.xyzw = BA_Vertex_20_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_20_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o1.w = 0.5 + r0.x;
  o1.xy = v2.xy;
  o1.z = 0;
  o2.w = BA_Vertex_20_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_20_CB0((uint)(127)).xxx * BA_Vertex_20_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_20_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_20_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_20_CB2((uint)(6)).w;
  r0.x = dot(v1.xyz, BA_Vertex_20_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_20_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_20_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o5.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_21_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_21_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_21_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_21_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_21_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_21_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_21_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_21_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_21_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = r0.xyz;
  r0.xyzw = BA_Vertex_21_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_21_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o1.w = 0.5 + r0.x;
  o1.xy = v2.xy;
  o1.z = 0;
  o2.w = BA_Vertex_21_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_21_CB0((uint)(127)).xxx * BA_Vertex_21_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_21_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_21_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_21_CB2((uint)(6)).w;
  r0.x = dot(v1.xyz, BA_Vertex_21_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_21_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_21_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o5.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_22_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_22_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_22_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_22_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_22_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_22_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_22_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_22_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_22_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = r0.xyz;
  r0.xyzw = BA_Vertex_22_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_22_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_22_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_22_CB0((uint)(55)).z + BA_Vertex_22_CB0((uint)(55)).w);
  o1.xy = v2.xy;
  o2.w = BA_Vertex_22_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_22_CB0((uint)(127)).xxx * BA_Vertex_22_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_22_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_22_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_22_CB2((uint)(6)).w;
  r0.x = dot(v1.xyz, BA_Vertex_22_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_22_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_22_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o5.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_23_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_23_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_23_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_23_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_23_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_23_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_23_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_23_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_23_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = r0.xyz;
  r0.xyzw = BA_Vertex_23_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_23_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_23_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_23_CB0((uint)(55)).z + BA_Vertex_23_CB0((uint)(55)).w);
  o1.xy = v2.xy;
  o2.w = BA_Vertex_23_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_23_CB0((uint)(127)).xxx * BA_Vertex_23_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_23_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_23_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_23_CB2((uint)(6)).w;
  r0.x = dot(v1.xyz, BA_Vertex_23_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_23_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_23_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o5.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_24_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_24_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_24_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_24_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_24_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_24_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_24_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_24_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_24_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = r0.xyz;
  r0.xyzw = BA_Vertex_24_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_24_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  r0.y = r0.z / BA_Vertex_24_CB0((uint)(17)).y;
  r0.y = 1 + -r0.y;
  r0.y = BA_Vertex_24_CB0((uint)(17)).z * r0.y;
  r0.y = max(0, r0.y);
  o1.z = saturate(r0.y * BA_Vertex_24_CB0((uint)(55)).z + BA_Vertex_24_CB0((uint)(55)).w);
  o1.w = 0.5 + r0.x;
  o1.xy = v2.xy;
  o2.w = BA_Vertex_24_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_24_CB0((uint)(127)).xxx * BA_Vertex_24_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_24_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_24_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_24_CB2((uint)(6)).w;
  r0.x = dot(v1.xyz, BA_Vertex_24_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_24_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_24_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o5.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_25_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_25_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_25_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_25_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_25_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_25_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_25_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_25_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_25_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = r0.xyz;
  r0.xyzw = BA_Vertex_25_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_25_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  r0.y = r0.z / BA_Vertex_25_CB0((uint)(17)).y;
  r0.y = 1 + -r0.y;
  r0.y = BA_Vertex_25_CB0((uint)(17)).z * r0.y;
  r0.y = max(0, r0.y);
  o1.z = saturate(r0.y * BA_Vertex_25_CB0((uint)(55)).z + BA_Vertex_25_CB0((uint)(55)).w);
  o1.w = 0.5 + r0.x;
  o1.xy = v2.xy;
  o2.w = BA_Vertex_25_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_25_CB0((uint)(127)).xxx * BA_Vertex_25_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_25_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_25_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_25_CB2((uint)(6)).w;
  r0.x = dot(v1.xyz, BA_Vertex_25_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_25_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_25_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o5.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_26_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_26_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_26_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_26_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_26_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_26_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_26_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_26_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_26_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = r0.xyz;
  r0.xyzw = BA_Vertex_26_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_26_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_26_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = BA_Vertex_26_CB0((uint)(55)).x * r0.x;
  o1.xy = v2.xy;
  o2.w = BA_Vertex_26_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_26_CB0((uint)(127)).xxx * BA_Vertex_26_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_26_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_26_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_26_CB2((uint)(6)).w;
  r0.x = dot(v1.xyz, BA_Vertex_26_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_26_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_26_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o5.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_27_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_27_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_27_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_27_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_27_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_27_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_27_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_27_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_27_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = r0.xyz;
  r0.xyzw = BA_Vertex_27_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_27_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_27_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = BA_Vertex_27_CB0((uint)(55)).x * r0.x;
  o1.xy = v2.xy;
  o2.w = BA_Vertex_27_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_27_CB0((uint)(127)).xxx * BA_Vertex_27_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_27_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_27_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_27_CB2((uint)(6)).w;
  r0.x = dot(v1.xyz, BA_Vertex_27_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_27_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_27_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o5.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_28_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_28_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_28_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_28_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_28_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_28_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_28_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_28_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_28_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = r0.xyz;
  r0.xyzw = BA_Vertex_28_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_28_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  r0.y = r0.z / BA_Vertex_28_CB0((uint)(17)).y;
  r0.y = 1 + -r0.y;
  r0.y = BA_Vertex_28_CB0((uint)(17)).z * r0.y;
  r0.y = max(0, r0.y);
  o1.z = BA_Vertex_28_CB0((uint)(55)).x * r0.y;
  o1.w = 0.5 + r0.x;
  o1.xy = v2.xy;
  o2.w = BA_Vertex_28_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_28_CB0((uint)(127)).xxx * BA_Vertex_28_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_28_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_28_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_28_CB2((uint)(6)).w;
  r0.x = dot(v1.xyz, BA_Vertex_28_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_28_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_28_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o5.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_29_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_EyeTint.x, _EyeTint.y, _EyeTint.z, _EyeTint.w);
  if (i == 6u) value = float4(_MouthTint.x, _MouthTint.y, _MouthTint.z, _MouthTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_29_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
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
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_29_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_29_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_29_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_29_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_29_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_29_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_29_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = r0.xyz;
  r0.xyzw = BA_Vertex_29_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_29_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  r0.y = r0.z / BA_Vertex_29_CB0((uint)(17)).y;
  r0.y = 1 + -r0.y;
  r0.y = BA_Vertex_29_CB0((uint)(17)).z * r0.y;
  r0.y = max(0, r0.y);
  o1.z = BA_Vertex_29_CB0((uint)(55)).x * r0.y;
  o1.w = 0.5 + r0.x;
  o1.xy = v2.xy;
  o2.w = BA_Vertex_29_CB2((uint)(5)).w;
  r0.xyz = BA_Vertex_29_CB0((uint)(127)).xxx * BA_Vertex_29_CB0((uint)(125)).xyz;
  o2.xyz = BA_Vertex_29_CB2((uint)(5)).xyz * r0.xyz;
  o3.xyz = BA_Vertex_29_CB2((uint)(6)).xyz * r0.xyz;
  o3.w = BA_Vertex_29_CB2((uint)(6)).w;
  r0.x = dot(v1.xyz, BA_Vertex_29_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_29_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_29_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o5.xyz = r0.xyz * r0.www;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_46_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
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
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_46_CB1((uint)(7)).xy + BA_Fragment_46_CB1((uint)(7)).zw;
  r0.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r0.xy, BA_Fragment_46_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v3.xyzw * r0.xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_46_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v2.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = -r2.x * r2.y + 1;
  r2.x = r2.x * r2.y;
  r1.xyzw = r2.zzzz * r1.xyzw;
  r0.xyzw = r0.xyzw * r2.xxxx + r1.xyzw;
  o0.xyz = r0.xyz * BA_Fragment_46_CB1((uint)(10)).xyz + BA_Fragment_46_CB1((uint)(9)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_47_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, 0.0, _GrayBrightness);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_47_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_47_CB1((uint)(7)).xy + BA_Fragment_47_CB1((uint)(7)).zw;
  r0.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r0.xy, BA_Fragment_47_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v3.xyzw * r0.xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_47_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v2.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = -r2.x * r2.y + 1;
  r2.x = r2.x * r2.y;
  r1.xyzw = r2.zzzz * r1.xyzw;
  r0.xyzw = r0.xyzw * r2.xxxx + r1.xyzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.w = r0.w;
  r0.x = BA_Fragment_47_CB1((uint)(11)).w * r0.x;
  o0.xyz = r0.xxx * BA_Fragment_47_CB1((uint)(10)).xyz + BA_Fragment_47_CB1((uint)(9)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_48_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_48_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_48_CB1((uint)(12)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xy = v1.xy * BA_Fragment_48_CB1((uint)(7)).xy + BA_Fragment_48_CB1((uint)(7)).zw;
  r0.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r0.xy, BA_Fragment_48_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v3.xyzw * r0.xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_48_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v2.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = -r2.x * r2.y + 1;
  r2.x = r2.x * r2.y;
  r1.xyzw = r2.zzzz * r1.xyzw;
  r0.xyzw = r0.xyzw * r2.xxxx + r1.xyzw;
  o0.xyz = r0.xyz * BA_Fragment_48_CB1((uint)(10)).xyz + BA_Fragment_48_CB1((uint)(9)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_49_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, 0.0, _GrayBrightness);
  if (i == 12u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_49_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_49_CB1((uint)(12)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xy = v1.xy * BA_Fragment_49_CB1((uint)(7)).xy + BA_Fragment_49_CB1((uint)(7)).zw;
  r0.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r0.xy, BA_Fragment_49_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v3.xyzw * r0.xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_49_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v2.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = -r2.x * r2.y + 1;
  r2.x = r2.x * r2.y;
  r1.xyzw = r2.zzzz * r1.xyzw;
  r0.xyzw = r0.xyzw * r2.xxxx + r1.xyzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.w = r0.w;
  r0.x = BA_Fragment_49_CB1((uint)(11)).w * r0.x;
  o0.xyz = r0.xxx * BA_Fragment_49_CB1((uint)(10)).xyz + BA_Fragment_49_CB1((uint)(9)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_50_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
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
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_50_CB1((uint)(7)).xy + BA_Fragment_50_CB1((uint)(7)).zw;
  r0.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r0.xy, BA_Fragment_50_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v3.xyzw * r0.xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_50_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v2.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = -r2.x * r2.y + 1;
  r2.x = r2.x * r2.y;
  r1.xyzw = r2.zzzz * r1.xyzw;
  r0.xyzw = r0.xyzw * r2.xxxx + r1.xyzw;
  r0.xyz = r0.xyz * BA_Fragment_50_CB1((uint)(10)).xyz + BA_Fragment_50_CB1((uint)(9)).xyz;
  o0.w = r0.w;
  r0.xyz = -BA_Fragment_50_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_50_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_51_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, 0.0, _GrayBrightness);
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
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_51_CB1((uint)(7)).xy + BA_Fragment_51_CB1((uint)(7)).zw;
  r0.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r0.xy, BA_Fragment_51_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v3.xyzw * r0.xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_51_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v2.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = -r2.x * r2.y + 1;
  r2.x = r2.x * r2.y;
  r1.xyzw = r2.zzzz * r1.xyzw;
  r0.xyzw = r0.xyzw * r2.xxxx + r1.xyzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.w = r0.w;
  r0.x = BA_Fragment_51_CB1((uint)(11)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_51_CB1((uint)(10)).xyz + BA_Fragment_51_CB1((uint)(9)).xyz;
  r0.xyz = -BA_Fragment_51_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_51_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_52_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
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
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_52_CB1((uint)(12)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xy = v1.xy * BA_Fragment_52_CB1((uint)(7)).xy + BA_Fragment_52_CB1((uint)(7)).zw;
  r0.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r0.xy, BA_Fragment_52_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v3.xyzw * r0.xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_52_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v2.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = -r2.x * r2.y + 1;
  r2.x = r2.x * r2.y;
  r1.xyzw = r2.zzzz * r1.xyzw;
  r0.xyzw = r0.xyzw * r2.xxxx + r1.xyzw;
  r0.xyz = r0.xyz * BA_Fragment_52_CB1((uint)(10)).xyz + BA_Fragment_52_CB1((uint)(9)).xyz;
  o0.w = r0.w;
  r0.xyz = -BA_Fragment_52_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_52_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_53_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, 0.0, _GrayBrightness);
  if (i == 12u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
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
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_53_CB1((uint)(12)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xy = v1.xy * BA_Fragment_53_CB1((uint)(7)).xy + BA_Fragment_53_CB1((uint)(7)).zw;
  r0.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r0.xy, BA_Fragment_53_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v3.xyzw * r0.xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_53_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v2.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = -r2.x * r2.y + 1;
  r2.x = r2.x * r2.y;
  r1.xyzw = r2.zzzz * r1.xyzw;
  r0.xyzw = r0.xyzw * r2.xxxx + r1.xyzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.w = r0.w;
  r0.x = BA_Fragment_53_CB1((uint)(11)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_53_CB1((uint)(10)).xyz + BA_Fragment_53_CB1((uint)(9)).xyz;
  r0.xyz = -BA_Fragment_53_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_53_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_54_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
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
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_54_CB1((uint)(7)).xy + BA_Fragment_54_CB1((uint)(7)).zw;
  r0.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r0.xy, BA_Fragment_54_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v3.xyzw * r0.xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_54_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v2.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = -r2.x * r2.y + 1;
  r2.x = r2.x * r2.y;
  r1.xyzw = r2.zzzz * r1.xyzw;
  r0.xyzw = r0.xyzw * r2.xxxx + r1.xyzw;
  r0.xyz = r0.xyz * BA_Fragment_54_CB1((uint)(10)).xyz + BA_Fragment_54_CB1((uint)(9)).xyz;
  o0.w = r0.w;
  r0.xyz = -BA_Fragment_54_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_54_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_55_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, 0.0, _GrayBrightness);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_55_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_55_CB1((uint)(7)).xy + BA_Fragment_55_CB1((uint)(7)).zw;
  r0.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r0.xy, BA_Fragment_55_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v3.xyzw * r0.xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_55_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v2.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = -r2.x * r2.y + 1;
  r2.x = r2.x * r2.y;
  r1.xyzw = r2.zzzz * r1.xyzw;
  r0.xyzw = r0.xyzw * r2.xxxx + r1.xyzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.w = r0.w;
  r0.x = BA_Fragment_55_CB1((uint)(11)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_55_CB1((uint)(10)).xyz + BA_Fragment_55_CB1((uint)(9)).xyz;
  r0.xyz = -BA_Fragment_55_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_55_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_56_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_56_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_56_CB1((uint)(12)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xy = v1.xy * BA_Fragment_56_CB1((uint)(7)).xy + BA_Fragment_56_CB1((uint)(7)).zw;
  r0.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r0.xy, BA_Fragment_56_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v3.xyzw * r0.xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_56_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v2.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = -r2.x * r2.y + 1;
  r2.x = r2.x * r2.y;
  r1.xyzw = r2.zzzz * r1.xyzw;
  r0.xyzw = r0.xyzw * r2.xxxx + r1.xyzw;
  r0.xyz = r0.xyz * BA_Fragment_56_CB1((uint)(10)).xyz + BA_Fragment_56_CB1((uint)(9)).xyz;
  o0.w = r0.w;
  r0.xyz = -BA_Fragment_56_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_56_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_57_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, 0.0, _GrayBrightness);
  if (i == 12u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_57_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_57_CB1((uint)(12)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xy = v1.xy * BA_Fragment_57_CB1((uint)(7)).xy + BA_Fragment_57_CB1((uint)(7)).zw;
  r0.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r0.xy, BA_Fragment_57_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v3.xyzw * r0.xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_57_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v2.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = -r2.x * r2.y + 1;
  r2.x = r2.x * r2.y;
  r1.xyzw = r2.zzzz * r1.xyzw;
  r0.xyzw = r0.xyzw * r2.xxxx + r1.xyzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o0.w = r0.w;
  r0.x = BA_Fragment_57_CB1((uint)(11)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_57_CB1((uint)(10)).xyz + BA_Fragment_57_CB1((uint)(9)).xyz;
  r0.xyz = -BA_Fragment_57_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_57_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_58_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_58_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_58_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_58_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_58_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v2.xyzw * r0.xyzw;
  r1.xy = v1.xy * BA_Fragment_58_CB3((uint)(7)).xy + BA_Fragment_58_CB3((uint)(7)).zw;
  r1.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r1.xy, BA_Fragment_58_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v3.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = r2.x * r2.y;
  r2.x = -r2.x * r2.y + 1;
  r0.xyzw = r2.xxxx * r0.xyzw;
  r0.xyzw = r1.xyzw * r2.zzzz + r0.xyzw;
  r1.x = min(BA_Fragment_58_CB2((uint)(11)).y, BA_Fragment_58_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_58_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v4.xyz * BA_Fragment_58_CB1((uint)(r2.y+0)).www + BA_Fragment_58_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_58_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_58_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_58_CB1((uint)(r2.y+512)).z + BA_Fragment_58_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_58_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v5.xyz);
    r3.x = saturate(r3.x * BA_Fragment_58_CB3((uint)(12)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r0.xyz = r1.yzw * BA_Fragment_58_CB3((uint)(12)).zzz + r0.xyz;
  o0.xyz = r0.xyz * BA_Fragment_58_CB3((uint)(10)).xyz + BA_Fragment_58_CB3((uint)(9)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_59_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, 0.0, _GrayBrightness);
  if (i == 12u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_59_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_59_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_59_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_59_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v2.xyzw * r0.xyzw;
  r1.xy = v1.xy * BA_Fragment_59_CB3((uint)(7)).xy + BA_Fragment_59_CB3((uint)(7)).zw;
  r1.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r1.xy, BA_Fragment_59_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v3.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = r2.x * r2.y;
  r2.x = -r2.x * r2.y + 1;
  r0.xyzw = r2.xxxx * r0.xyzw;
  r0.xyzw = r1.xyzw * r2.zzzz + r0.xyzw;
  r1.x = min(BA_Fragment_59_CB2((uint)(11)).y, BA_Fragment_59_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_59_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v4.xyz * BA_Fragment_59_CB1((uint)(r2.y+0)).www + BA_Fragment_59_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_59_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_59_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_59_CB1((uint)(r2.y+512)).z + BA_Fragment_59_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_59_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v5.xyz);
    r3.x = saturate(r3.x * BA_Fragment_59_CB3((uint)(12)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r0.xyz = r1.yzw * BA_Fragment_59_CB3((uint)(12)).zzz + r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_59_CB3((uint)(11)).w * r0.x;
  o0.xyz = r0.xxx * BA_Fragment_59_CB3((uint)(10)).xyz + BA_Fragment_59_CB3((uint)(9)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_60_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_60_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_60_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_60_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_60_CB3((uint)(12)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_60_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v2.xyzw * r0.xyzw;
  r1.xy = v1.xy * BA_Fragment_60_CB3((uint)(7)).xy + BA_Fragment_60_CB3((uint)(7)).zw;
  r1.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r1.xy, BA_Fragment_60_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v3.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = r2.x * r2.y;
  r2.x = -r2.x * r2.y + 1;
  r0.xyzw = r2.xxxx * r0.xyzw;
  r0.xyzw = r1.xyzw * r2.zzzz + r0.xyzw;
  r1.x = min(BA_Fragment_60_CB2((uint)(11)).y, BA_Fragment_60_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_60_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v4.xyz * BA_Fragment_60_CB1((uint)(r2.y+0)).www + BA_Fragment_60_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_60_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_60_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_60_CB1((uint)(r2.y+512)).z + BA_Fragment_60_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_60_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v5.xyz);
    r3.x = saturate(r3.x * BA_Fragment_60_CB3((uint)(12)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r0.xyz = r1.yzw * BA_Fragment_60_CB3((uint)(12)).zzz + r0.xyz;
  o0.xyz = r0.xyz * BA_Fragment_60_CB3((uint)(10)).xyz + BA_Fragment_60_CB3((uint)(9)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_61_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, 0.0, _GrayBrightness);
  if (i == 12u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_61_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_61_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_61_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_61_CB3((uint)(12)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_61_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v2.xyzw * r0.xyzw;
  r1.xy = v1.xy * BA_Fragment_61_CB3((uint)(7)).xy + BA_Fragment_61_CB3((uint)(7)).zw;
  r1.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r1.xy, BA_Fragment_61_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v3.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = r2.x * r2.y;
  r2.x = -r2.x * r2.y + 1;
  r0.xyzw = r2.xxxx * r0.xyzw;
  r0.xyzw = r1.xyzw * r2.zzzz + r0.xyzw;
  r1.x = min(BA_Fragment_61_CB2((uint)(11)).y, BA_Fragment_61_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_61_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v4.xyz * BA_Fragment_61_CB1((uint)(r2.y+0)).www + BA_Fragment_61_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_61_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_61_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_61_CB1((uint)(r2.y+512)).z + BA_Fragment_61_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_61_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v5.xyz);
    r3.x = saturate(r3.x * BA_Fragment_61_CB3((uint)(12)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r0.xyz = r1.yzw * BA_Fragment_61_CB3((uint)(12)).zzz + r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_61_CB3((uint)(11)).w * r0.x;
  o0.xyz = r0.xxx * BA_Fragment_61_CB3((uint)(10)).xyz + BA_Fragment_61_CB3((uint)(9)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_62_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_62_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_62_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_62_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_62_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v2.xyzw * r0.xyzw;
  r1.xy = v1.xy * BA_Fragment_62_CB3((uint)(7)).xy + BA_Fragment_62_CB3((uint)(7)).zw;
  r1.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r1.xy, BA_Fragment_62_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v3.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = r2.x * r2.y;
  r2.x = -r2.x * r2.y + 1;
  r0.xyzw = r2.xxxx * r0.xyzw;
  r0.xyzw = r1.xyzw * r2.zzzz + r0.xyzw;
  r1.x = min(BA_Fragment_62_CB2((uint)(11)).y, BA_Fragment_62_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_62_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v4.xyz * BA_Fragment_62_CB1((uint)(r2.y+0)).www + BA_Fragment_62_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_62_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_62_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_62_CB1((uint)(r2.y+512)).z + BA_Fragment_62_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_62_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v5.xyz);
    r3.x = saturate(r3.x * BA_Fragment_62_CB3((uint)(12)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r0.xyz = r1.yzw * BA_Fragment_62_CB3((uint)(12)).zzz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_62_CB3((uint)(10)).xyz + BA_Fragment_62_CB3((uint)(9)).xyz;
  r0.xyz = -BA_Fragment_62_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_62_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_63_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, 0.0, _GrayBrightness);
  if (i == 12u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_63_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_63_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_63_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_63_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v2.xyzw * r0.xyzw;
  r1.xy = v1.xy * BA_Fragment_63_CB3((uint)(7)).xy + BA_Fragment_63_CB3((uint)(7)).zw;
  r1.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r1.xy, BA_Fragment_63_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v3.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = r2.x * r2.y;
  r2.x = -r2.x * r2.y + 1;
  r0.xyzw = r2.xxxx * r0.xyzw;
  r0.xyzw = r1.xyzw * r2.zzzz + r0.xyzw;
  r1.x = min(BA_Fragment_63_CB2((uint)(11)).y, BA_Fragment_63_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_63_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v4.xyz * BA_Fragment_63_CB1((uint)(r2.y+0)).www + BA_Fragment_63_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_63_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_63_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_63_CB1((uint)(r2.y+512)).z + BA_Fragment_63_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_63_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v5.xyz);
    r3.x = saturate(r3.x * BA_Fragment_63_CB3((uint)(12)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r0.xyz = r1.yzw * BA_Fragment_63_CB3((uint)(12)).zzz + r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_63_CB3((uint)(11)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_63_CB3((uint)(10)).xyz + BA_Fragment_63_CB3((uint)(9)).xyz;
  r0.xyz = -BA_Fragment_63_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_63_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_64_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_64_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_64_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_64_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_64_CB3((uint)(12)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_64_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v2.xyzw * r0.xyzw;
  r1.xy = v1.xy * BA_Fragment_64_CB3((uint)(7)).xy + BA_Fragment_64_CB3((uint)(7)).zw;
  r1.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r1.xy, BA_Fragment_64_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v3.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = r2.x * r2.y;
  r2.x = -r2.x * r2.y + 1;
  r0.xyzw = r2.xxxx * r0.xyzw;
  r0.xyzw = r1.xyzw * r2.zzzz + r0.xyzw;
  r1.x = min(BA_Fragment_64_CB2((uint)(11)).y, BA_Fragment_64_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_64_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v4.xyz * BA_Fragment_64_CB1((uint)(r2.y+0)).www + BA_Fragment_64_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_64_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_64_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_64_CB1((uint)(r2.y+512)).z + BA_Fragment_64_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_64_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v5.xyz);
    r3.x = saturate(r3.x * BA_Fragment_64_CB3((uint)(12)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r0.xyz = r1.yzw * BA_Fragment_64_CB3((uint)(12)).zzz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_64_CB3((uint)(10)).xyz + BA_Fragment_64_CB3((uint)(9)).xyz;
  r0.xyz = -BA_Fragment_64_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_64_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_65_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, 0.0, _GrayBrightness);
  if (i == 12u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_65_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_65_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_65_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_65_CB3((uint)(12)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_65_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v2.xyzw * r0.xyzw;
  r1.xy = v1.xy * BA_Fragment_65_CB3((uint)(7)).xy + BA_Fragment_65_CB3((uint)(7)).zw;
  r1.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r1.xy, BA_Fragment_65_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v3.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = r2.x * r2.y;
  r2.x = -r2.x * r2.y + 1;
  r0.xyzw = r2.xxxx * r0.xyzw;
  r0.xyzw = r1.xyzw * r2.zzzz + r0.xyzw;
  r1.x = min(BA_Fragment_65_CB2((uint)(11)).y, BA_Fragment_65_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_65_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v4.xyz * BA_Fragment_65_CB1((uint)(r2.y+0)).www + BA_Fragment_65_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_65_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_65_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_65_CB1((uint)(r2.y+512)).z + BA_Fragment_65_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_65_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v5.xyz);
    r3.x = saturate(r3.x * BA_Fragment_65_CB3((uint)(12)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r0.xyz = r1.yzw * BA_Fragment_65_CB3((uint)(12)).zzz + r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_65_CB3((uint)(11)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_65_CB3((uint)(10)).xyz + BA_Fragment_65_CB3((uint)(9)).xyz;
  r0.xyz = -BA_Fragment_65_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_65_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_66_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_66_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_66_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_66_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_66_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v2.xyzw * r0.xyzw;
  r1.xy = v1.xy * BA_Fragment_66_CB3((uint)(7)).xy + BA_Fragment_66_CB3((uint)(7)).zw;
  r1.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r1.xy, BA_Fragment_66_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v3.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = r2.x * r2.y;
  r2.x = -r2.x * r2.y + 1;
  r0.xyzw = r2.xxxx * r0.xyzw;
  r0.xyzw = r1.xyzw * r2.zzzz + r0.xyzw;
  r1.x = min(BA_Fragment_66_CB2((uint)(11)).y, BA_Fragment_66_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_66_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v4.xyz * BA_Fragment_66_CB1((uint)(r2.y+0)).www + BA_Fragment_66_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_66_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_66_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_66_CB1((uint)(r2.y+512)).z + BA_Fragment_66_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_66_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v5.xyz);
    r3.x = saturate(r3.x * BA_Fragment_66_CB3((uint)(12)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r0.xyz = r1.yzw * BA_Fragment_66_CB3((uint)(12)).zzz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_66_CB3((uint)(10)).xyz + BA_Fragment_66_CB3((uint)(9)).xyz;
  r1.x = exp2(-v1.z);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_66_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_66_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_67_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, 0.0, _GrayBrightness);
  if (i == 12u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_67_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_67_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_67_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_67_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v2.xyzw * r0.xyzw;
  r1.xy = v1.xy * BA_Fragment_67_CB3((uint)(7)).xy + BA_Fragment_67_CB3((uint)(7)).zw;
  r1.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r1.xy, BA_Fragment_67_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v3.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = r2.x * r2.y;
  r2.x = -r2.x * r2.y + 1;
  r0.xyzw = r2.xxxx * r0.xyzw;
  r0.xyzw = r1.xyzw * r2.zzzz + r0.xyzw;
  r1.x = min(BA_Fragment_67_CB2((uint)(11)).y, BA_Fragment_67_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_67_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v4.xyz * BA_Fragment_67_CB1((uint)(r2.y+0)).www + BA_Fragment_67_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_67_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_67_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_67_CB1((uint)(r2.y+512)).z + BA_Fragment_67_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_67_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v5.xyz);
    r3.x = saturate(r3.x * BA_Fragment_67_CB3((uint)(12)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r0.xyz = r1.yzw * BA_Fragment_67_CB3((uint)(12)).zzz + r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_67_CB3((uint)(11)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_67_CB3((uint)(10)).xyz + BA_Fragment_67_CB3((uint)(9)).xyz;
  r1.x = exp2(-v1.z);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_67_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_67_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_68_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_68_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_68_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_68_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_68_CB3((uint)(12)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_68_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v2.xyzw * r0.xyzw;
  r1.xy = v1.xy * BA_Fragment_68_CB3((uint)(7)).xy + BA_Fragment_68_CB3((uint)(7)).zw;
  r1.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r1.xy, BA_Fragment_68_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v3.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = r2.x * r2.y;
  r2.x = -r2.x * r2.y + 1;
  r0.xyzw = r2.xxxx * r0.xyzw;
  r0.xyzw = r1.xyzw * r2.zzzz + r0.xyzw;
  r1.x = min(BA_Fragment_68_CB2((uint)(11)).y, BA_Fragment_68_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_68_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v4.xyz * BA_Fragment_68_CB1((uint)(r2.y+0)).www + BA_Fragment_68_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_68_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_68_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_68_CB1((uint)(r2.y+512)).z + BA_Fragment_68_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_68_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v5.xyz);
    r3.x = saturate(r3.x * BA_Fragment_68_CB3((uint)(12)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r0.xyz = r1.yzw * BA_Fragment_68_CB3((uint)(12)).zzz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_68_CB3((uint)(10)).xyz + BA_Fragment_68_CB3((uint)(9)).xyz;
  r1.x = exp2(-v1.z);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_68_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_68_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_69_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_MouthTileTex_ST.x, _MouthTileTex_ST.y, _MouthTileTex_ST.z, _MouthTileTex_ST.w);
  if (i == 9u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 10u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, 0.0, _GrayBrightness);
  if (i == 12u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_69_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_69_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_69_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_69_CB3((uint)(12)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_69_CB0((uint)(19)).x).xyzw;
  r0.xyzw = v2.xyzw * r0.xyzw;
  r1.xy = v1.xy * BA_Fragment_69_CB3((uint)(7)).xy + BA_Fragment_69_CB3((uint)(7)).zw;
  r1.xyzw = _MouthTileTex.SampleBias(sampler_MouthTileTex, r1.xy, BA_Fragment_69_CB0((uint)(19)).x).xyzw;
  r1.xyzw = v3.xyzw * r1.xyzw;
  r2.xy = cmp(float2(0.25,0.25) >= v1.xy);
  r2.xy = r2.xy ? float2(1,1) : 0;
  r2.z = r2.x * r2.y;
  r2.x = -r2.x * r2.y + 1;
  r0.xyzw = r2.xxxx * r0.xyzw;
  r0.xyzw = r1.xyzw * r2.zzzz + r0.xyzw;
  r1.x = min(BA_Fragment_69_CB2((uint)(11)).y, BA_Fragment_69_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_69_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v4.xyz * BA_Fragment_69_CB1((uint)(r2.y+0)).www + BA_Fragment_69_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_69_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_69_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_69_CB1((uint)(r2.y+512)).z + BA_Fragment_69_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_69_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v5.xyz);
    r3.x = saturate(r3.x * BA_Fragment_69_CB3((uint)(12)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r0.xyz = r1.yzw * BA_Fragment_69_CB3((uint)(12)).zzz + r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_69_CB3((uint)(11)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_69_CB3((uint)(10)).xyz + BA_Fragment_69_CB3((uint)(9)).xyz;
  r1.x = exp2(-v1.z);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_69_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_69_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
