// Exact names and types from the original compiled parameter metadata.
float _AdditionalLightSharpness;
float _AdditionalLightStrength;
float4 _CodeAddColor;
float4 _CodeAddRimColor;
float4 _CodeMultiplyColor;
float _DitherThreshold;
float _GrayBrightness;
float4 _MxCharLightData;
float4 _MxCharLightTone;
float4 _Tint;
float _ZCorrection;
Texture2D<float4> _MainTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_3_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_3_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_3_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float2 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_3_CB1((uint)(5)).xyz * BA_Vertex_3_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_3_CB1((uint)(4)).xyz * BA_Vertex_3_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_3_CB1((uint)(6)).xyz * BA_Vertex_3_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_3_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_3_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_3_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  r0.xyz = BA_Vertex_3_CB0((uint)(129)).xxx * BA_Vertex_3_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_3_CB2((uint)(3)).xyz * r0.xyz;
  o1.w = 0;
  o2.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_4_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_4_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_4_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float2 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_4_CB1((uint)(5)).xyz * BA_Vertex_4_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_4_CB1((uint)(4)).xyz * BA_Vertex_4_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_4_CB1((uint)(6)).xyz * BA_Vertex_4_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_4_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_4_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_4_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  r0.xyz = BA_Vertex_4_CB0((uint)(129)).xxx * BA_Vertex_4_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_4_CB2((uint)(3)).xyz * r0.xyz;
  o1.w = 0;
  o2.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_5_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_5_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_5_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float3 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_5_CB1((uint)(5)).xyz * BA_Vertex_5_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_5_CB1((uint)(4)).xyz * BA_Vertex_5_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(6)).xyz * BA_Vertex_5_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_5_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_5_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r1.xyz = BA_Vertex_5_CB0((uint)(129)).xxx * BA_Vertex_5_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_5_CB2((uint)(3)).xyz * r1.xyz;
  o1.w = 0;
  r0.x = BA_Vertex_5_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o2.z = 0.5 + r0.x;
  o2.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_6_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_6_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_6_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float3 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_6_CB1((uint)(5)).xyz * BA_Vertex_6_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_6_CB1((uint)(4)).xyz * BA_Vertex_6_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_6_CB1((uint)(6)).xyz * BA_Vertex_6_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_6_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_6_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_6_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_6_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_6_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_6_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_6_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r1.xyz = BA_Vertex_6_CB0((uint)(129)).xxx * BA_Vertex_6_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_6_CB2((uint)(3)).xyz * r1.xyz;
  o1.w = 0;
  r0.x = BA_Vertex_6_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o2.z = 0.5 + r0.x;
  o2.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_7_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_7_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_7_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float2 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_7_CB1((uint)(5)).xyz * BA_Vertex_7_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_7_CB1((uint)(4)).xyz * BA_Vertex_7_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_7_CB1((uint)(6)).xyz * BA_Vertex_7_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_7_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_7_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_7_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_7_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_7_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
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
  o1.w = saturate(r0.x * BA_Vertex_7_CB0((uint)(55)).z + BA_Vertex_7_CB0((uint)(55)).w);
  r0.xyz = BA_Vertex_7_CB0((uint)(129)).xxx * BA_Vertex_7_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_7_CB2((uint)(3)).xyz * r0.xyz;
  o2.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_8_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_8_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_8_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float2 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_8_CB1((uint)(5)).xyz * BA_Vertex_8_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_8_CB1((uint)(4)).xyz * BA_Vertex_8_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_8_CB1((uint)(6)).xyz * BA_Vertex_8_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_8_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_8_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_8_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_8_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_8_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
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
  o1.w = saturate(r0.x * BA_Vertex_8_CB0((uint)(55)).z + BA_Vertex_8_CB0((uint)(55)).w);
  r0.xyz = BA_Vertex_8_CB0((uint)(129)).xxx * BA_Vertex_8_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_8_CB2((uint)(3)).xyz * r0.xyz;
  o2.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_9_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_9_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_9_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float3 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_9_CB1((uint)(5)).xyz * BA_Vertex_9_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_9_CB1((uint)(4)).xyz * BA_Vertex_9_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(6)).xyz * BA_Vertex_9_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_9_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_9_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_9_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_9_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_9_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_9_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_9_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_9_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.w = saturate(r0.x * BA_Vertex_9_CB0((uint)(55)).z + BA_Vertex_9_CB0((uint)(55)).w);
  r1.xyz = BA_Vertex_9_CB0((uint)(129)).xxx * BA_Vertex_9_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_9_CB2((uint)(3)).xyz * r1.xyz;
  r0.x = BA_Vertex_9_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o2.z = 0.5 + r0.x;
  o2.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_10_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_10_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_10_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float3 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_10_CB1((uint)(5)).xyz * BA_Vertex_10_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_10_CB1((uint)(4)).xyz * BA_Vertex_10_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_10_CB1((uint)(6)).xyz * BA_Vertex_10_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_10_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_10_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_10_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_10_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_10_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
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
  o1.w = saturate(r0.x * BA_Vertex_10_CB0((uint)(55)).z + BA_Vertex_10_CB0((uint)(55)).w);
  r1.xyz = BA_Vertex_10_CB0((uint)(129)).xxx * BA_Vertex_10_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_10_CB2((uint)(3)).xyz * r1.xyz;
  r0.x = BA_Vertex_10_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o2.z = 0.5 + r0.x;
  o2.xy = v1.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_11_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_11_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_11_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float2 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_11_CB1((uint)(5)).xyz * BA_Vertex_11_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_11_CB1((uint)(4)).xyz * BA_Vertex_11_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_11_CB1((uint)(6)).xyz * BA_Vertex_11_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_11_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_11_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_11_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_11_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_11_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
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
  o1.w = BA_Vertex_11_CB0((uint)(55)).x * r0.x;
  r0.xyz = BA_Vertex_11_CB0((uint)(129)).xxx * BA_Vertex_11_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_11_CB2((uint)(3)).xyz * r0.xyz;
  o2.xy = v1.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_12_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_12_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_12_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float2 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_12_CB1((uint)(5)).xyz * BA_Vertex_12_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_12_CB1((uint)(4)).xyz * BA_Vertex_12_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_12_CB1((uint)(6)).xyz * BA_Vertex_12_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_12_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_12_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_12_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_12_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_12_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
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
  o1.w = BA_Vertex_12_CB0((uint)(55)).x * r0.x;
  r0.xyz = BA_Vertex_12_CB0((uint)(129)).xxx * BA_Vertex_12_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_12_CB2((uint)(3)).xyz * r0.xyz;
  o2.xy = v1.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_13_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_13_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_13_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float3 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_13_CB1((uint)(5)).xyz * BA_Vertex_13_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_13_CB1((uint)(4)).xyz * BA_Vertex_13_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_13_CB1((uint)(6)).xyz * BA_Vertex_13_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_13_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_13_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_13_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_13_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_13_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_13_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_13_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_13_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_13_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_13_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_13_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_13_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.w = BA_Vertex_13_CB0((uint)(55)).x * r0.x;
  r1.xyz = BA_Vertex_13_CB0((uint)(129)).xxx * BA_Vertex_13_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_13_CB2((uint)(3)).xyz * r1.xyz;
  r0.x = BA_Vertex_13_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o2.z = 0.5 + r0.x;
  o2.xy = v1.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_14_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_14_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_14_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float3 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_14_CB1((uint)(5)).xyz * BA_Vertex_14_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_14_CB1((uint)(4)).xyz * BA_Vertex_14_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_14_CB1((uint)(6)).xyz * BA_Vertex_14_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_14_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_14_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_14_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_14_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_14_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
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
  o1.w = BA_Vertex_14_CB0((uint)(55)).x * r0.x;
  r1.xyz = BA_Vertex_14_CB0((uint)(129)).xxx * BA_Vertex_14_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_14_CB2((uint)(3)).xyz * r1.xyz;
  r0.x = BA_Vertex_14_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o2.z = 0.5 + r0.x;
  o2.xy = v1.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_15_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_15_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_15_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_15_CB1((uint)(5)).xyz * BA_Vertex_15_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_15_CB1((uint)(4)).xyz * BA_Vertex_15_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(6)).xyz * BA_Vertex_15_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_15_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_15_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_15_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_15_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_15_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_15_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_15_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_15_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_15_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  r0.xyz = BA_Vertex_15_CB0((uint)(129)).xxx * BA_Vertex_15_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_15_CB2((uint)(3)).xyz * r0.xyz;
  o1.w = 0;
  o2.xy = v1.xy;
  r0.xyz = BA_Vertex_15_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_15_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_15_CB1((uint)(3)).xyz + r0.xyz;
  r0.x = dot(v2.xyz, BA_Vertex_15_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_15_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_15_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_16_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_16_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_16_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_16_CB1((uint)(5)).xyz * BA_Vertex_16_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_16_CB1((uint)(4)).xyz * BA_Vertex_16_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_16_CB1((uint)(6)).xyz * BA_Vertex_16_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_16_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_16_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_16_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_16_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_16_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_16_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_16_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_16_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_16_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_16_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  r0.xyz = BA_Vertex_16_CB0((uint)(129)).xxx * BA_Vertex_16_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_16_CB2((uint)(3)).xyz * r0.xyz;
  o1.w = 0;
  o2.xy = v1.xy;
  r0.xyz = BA_Vertex_16_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_16_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_16_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_16_CB1((uint)(3)).xyz + r0.xyz;
  r0.x = dot(v2.xyz, BA_Vertex_16_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_16_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_16_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_17_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_17_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_17_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_17_CB1((uint)(5)).xyz * BA_Vertex_17_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_17_CB1((uint)(4)).xyz * BA_Vertex_17_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_17_CB1((uint)(6)).xyz * BA_Vertex_17_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_17_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_17_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_17_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_17_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_17_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_17_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_17_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_17_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_17_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_17_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r1.xyz = BA_Vertex_17_CB0((uint)(129)).xxx * BA_Vertex_17_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_17_CB2((uint)(3)).xyz * r1.xyz;
  o1.w = 0;
  r0.x = BA_Vertex_17_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o2.z = 0.5 + r0.x;
  o2.xy = v1.xy;
  r0.xyz = BA_Vertex_17_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_17_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_17_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_17_CB1((uint)(3)).xyz + r0.xyz;
  r0.x = dot(v2.xyz, BA_Vertex_17_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_17_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_17_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_18_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_18_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_18_CB1((uint)(5)).xyz * BA_Vertex_18_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_18_CB1((uint)(4)).xyz * BA_Vertex_18_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_18_CB1((uint)(6)).xyz * BA_Vertex_18_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_18_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_18_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_18_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_18_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_18_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_18_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_18_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_18_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_18_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_18_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r1.xyz = BA_Vertex_18_CB0((uint)(129)).xxx * BA_Vertex_18_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_18_CB2((uint)(3)).xyz * r1.xyz;
  o1.w = 0;
  r0.x = BA_Vertex_18_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o2.z = 0.5 + r0.x;
  o2.xy = v1.xy;
  r0.xyz = BA_Vertex_18_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_18_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_18_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_18_CB1((uint)(3)).xyz + r0.xyz;
  r0.x = dot(v2.xyz, BA_Vertex_18_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_18_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_18_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_19_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_19_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_19_CB1((uint)(5)).xyz * BA_Vertex_19_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_19_CB1((uint)(4)).xyz * BA_Vertex_19_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_19_CB1((uint)(6)).xyz * BA_Vertex_19_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_19_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_19_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_19_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_19_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_19_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
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
  o1.w = saturate(r0.x * BA_Vertex_19_CB0((uint)(55)).z + BA_Vertex_19_CB0((uint)(55)).w);
  r0.xyz = BA_Vertex_19_CB0((uint)(129)).xxx * BA_Vertex_19_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_19_CB2((uint)(3)).xyz * r0.xyz;
  o2.xy = v1.xy;
  r0.xyz = BA_Vertex_19_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_19_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_19_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_19_CB1((uint)(3)).xyz + r0.xyz;
  r0.x = dot(v2.xyz, BA_Vertex_19_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_19_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_19_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_20_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_20_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_20_CB1((uint)(5)).xyz * BA_Vertex_20_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_20_CB1((uint)(4)).xyz * BA_Vertex_20_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_20_CB1((uint)(6)).xyz * BA_Vertex_20_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_20_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_20_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_20_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_20_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_20_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
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
  o1.w = saturate(r0.x * BA_Vertex_20_CB0((uint)(55)).z + BA_Vertex_20_CB0((uint)(55)).w);
  r0.xyz = BA_Vertex_20_CB0((uint)(129)).xxx * BA_Vertex_20_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_20_CB2((uint)(3)).xyz * r0.xyz;
  o2.xy = v1.xy;
  r0.xyz = BA_Vertex_20_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_20_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_20_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_20_CB1((uint)(3)).xyz + r0.xyz;
  r0.x = dot(v2.xyz, BA_Vertex_20_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_20_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_20_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_21_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_21_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_21_CB1((uint)(5)).xyz * BA_Vertex_21_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_21_CB1((uint)(4)).xyz * BA_Vertex_21_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_21_CB1((uint)(6)).xyz * BA_Vertex_21_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_21_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_21_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_21_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_21_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_21_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_21_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_21_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_21_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_21_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_21_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.w = saturate(r0.x * BA_Vertex_21_CB0((uint)(55)).z + BA_Vertex_21_CB0((uint)(55)).w);
  r1.xyz = BA_Vertex_21_CB0((uint)(129)).xxx * BA_Vertex_21_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_21_CB2((uint)(3)).xyz * r1.xyz;
  r0.x = BA_Vertex_21_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o2.z = 0.5 + r0.x;
  o2.xy = v1.xy;
  r0.xyz = BA_Vertex_21_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_21_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_21_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_21_CB1((uint)(3)).xyz + r0.xyz;
  r0.x = dot(v2.xyz, BA_Vertex_21_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_21_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_21_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_22_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_22_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_22_CB1((uint)(5)).xyz * BA_Vertex_22_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_22_CB1((uint)(4)).xyz * BA_Vertex_22_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_22_CB1((uint)(6)).xyz * BA_Vertex_22_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_22_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_22_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_22_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_22_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_22_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
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
  o1.w = saturate(r0.x * BA_Vertex_22_CB0((uint)(55)).z + BA_Vertex_22_CB0((uint)(55)).w);
  r1.xyz = BA_Vertex_22_CB0((uint)(129)).xxx * BA_Vertex_22_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_22_CB2((uint)(3)).xyz * r1.xyz;
  r0.x = BA_Vertex_22_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o2.z = 0.5 + r0.x;
  o2.xy = v1.xy;
  r0.xyz = BA_Vertex_22_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_22_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_22_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_22_CB1((uint)(3)).xyz + r0.xyz;
  r0.x = dot(v2.xyz, BA_Vertex_22_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_22_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_22_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_23_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_23_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_23_CB1((uint)(5)).xyz * BA_Vertex_23_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_23_CB1((uint)(4)).xyz * BA_Vertex_23_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_23_CB1((uint)(6)).xyz * BA_Vertex_23_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_23_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_23_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_23_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_23_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_23_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
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
  o1.w = BA_Vertex_23_CB0((uint)(55)).x * r0.x;
  r0.xyz = BA_Vertex_23_CB0((uint)(129)).xxx * BA_Vertex_23_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_23_CB2((uint)(3)).xyz * r0.xyz;
  o2.xy = v1.xy;
  r0.xyz = BA_Vertex_23_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_23_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_23_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_23_CB1((uint)(3)).xyz + r0.xyz;
  r0.x = dot(v2.xyz, BA_Vertex_23_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_23_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_23_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_24_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_24_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_24_CB1((uint)(5)).xyz * BA_Vertex_24_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_24_CB1((uint)(4)).xyz * BA_Vertex_24_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_24_CB1((uint)(6)).xyz * BA_Vertex_24_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_24_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_24_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_24_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_24_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_24_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
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
  o1.w = BA_Vertex_24_CB0((uint)(55)).x * r0.x;
  r0.xyz = BA_Vertex_24_CB0((uint)(129)).xxx * BA_Vertex_24_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_24_CB2((uint)(3)).xyz * r0.xyz;
  o2.xy = v1.xy;
  r0.xyz = BA_Vertex_24_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_24_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_24_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_24_CB1((uint)(3)).xyz + r0.xyz;
  r0.x = dot(v2.xyz, BA_Vertex_24_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_24_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_24_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_25_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_25_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_25_CB1((uint)(5)).xyz * BA_Vertex_25_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_25_CB1((uint)(4)).xyz * BA_Vertex_25_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_25_CB1((uint)(6)).xyz * BA_Vertex_25_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_25_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_25_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_25_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_25_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_25_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_25_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_25_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_25_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_25_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_25_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_25_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_25_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.w = BA_Vertex_25_CB0((uint)(55)).x * r0.x;
  r1.xyz = BA_Vertex_25_CB0((uint)(129)).xxx * BA_Vertex_25_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_25_CB2((uint)(3)).xyz * r1.xyz;
  r0.x = BA_Vertex_25_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o2.z = 0.5 + r0.x;
  o2.xy = v1.xy;
  r0.xyz = BA_Vertex_25_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_25_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_25_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_25_CB1((uint)(3)).xyz + r0.xyz;
  r0.x = dot(v2.xyz, BA_Vertex_25_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_25_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_25_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_26_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 5u) value = float4(_ZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_26_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_26_CB1((uint)(5)).xyz * BA_Vertex_26_CB0((uint)(16)).yyy;
  r0.xyz = BA_Vertex_26_CB1((uint)(4)).xyz * BA_Vertex_26_CB0((uint)(16)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_26_CB1((uint)(6)).xyz * BA_Vertex_26_CB0((uint)(16)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_26_CB1((uint)(7)).xyz + r0.xyz;
  r0.xyz = -v0.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r0.xyz * BA_Vertex_26_CB2((uint)(5)).xxx + v0.xyz;
  r1.xyzw = BA_Vertex_26_CB1((uint)(1)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_26_CB1((uint)(0)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_26_CB1((uint)(2)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_26_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_26_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_26_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_26_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_26_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = r0.z / BA_Vertex_26_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_26_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.w = BA_Vertex_26_CB0((uint)(55)).x * r0.x;
  r1.xyz = BA_Vertex_26_CB0((uint)(129)).xxx * BA_Vertex_26_CB0((uint)(127)).xyz;
  o1.xyz = BA_Vertex_26_CB2((uint)(3)).xyz * r1.xyz;
  r0.x = BA_Vertex_26_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o2.z = 0.5 + r0.x;
  o2.xy = v1.xy;
  r0.xyz = BA_Vertex_26_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_26_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_26_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_26_CB1((uint)(3)).xyz + r0.xyz;
  r0.x = dot(v2.xyz, BA_Vertex_26_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_26_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_26_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_43_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
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
  float4 v1 : TEXCOORD0,
  float2 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_43_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  o0.w = r0.w;
  r0.xyz = r0.xyz * BA_Fragment_43_CB1((uint)(8)).xyz + BA_Fragment_43_CB1((uint)(7)).xyz;
  o0.xyz = BA_Fragment_43_CB1((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_44_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
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
  float4 v1 : TEXCOORD0,
  float2 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_44_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  o0.w = r0.w;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_44_CB1((uint)(9)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_44_CB1((uint)(8)).xyz + BA_Fragment_44_CB1((uint)(7)).xyz;
  o0.xyz = BA_Fragment_44_CB1((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_45_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 10u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
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
  float3 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_45_CB1((uint)(10)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_45_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  o0.w = r0.w;
  r0.xyz = r0.xyz * BA_Fragment_45_CB1((uint)(8)).xyz + BA_Fragment_45_CB1((uint)(7)).xyz;
  o0.xyz = BA_Fragment_45_CB1((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_46_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 10u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
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
  float3 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_46_CB1((uint)(10)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_46_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  o0.w = r0.w;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_46_CB1((uint)(9)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_46_CB1((uint)(8)).xyz + BA_Fragment_46_CB1((uint)(7)).xyz;
  o0.xyz = BA_Fragment_46_CB1((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_47_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
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
  float4 v1 : TEXCOORD0,
  float2 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_47_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  o0.w = r0.w;
  r0.xyz = r0.xyz * BA_Fragment_47_CB1((uint)(8)).xyz + BA_Fragment_47_CB1((uint)(7)).xyz;
  r0.xyz = BA_Fragment_47_CB1((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_47_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_47_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_48_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
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
  float4 v1 : TEXCOORD0,
  float2 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_48_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  o0.w = r0.w;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_48_CB1((uint)(9)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_48_CB1((uint)(8)).xyz + BA_Fragment_48_CB1((uint)(7)).xyz;
  r0.xyz = BA_Fragment_48_CB1((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_48_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_48_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_49_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 10u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
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
  float3 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_49_CB1((uint)(10)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_49_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  o0.w = r0.w;
  r0.xyz = r0.xyz * BA_Fragment_49_CB1((uint)(8)).xyz + BA_Fragment_49_CB1((uint)(7)).xyz;
  r0.xyz = BA_Fragment_49_CB1((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_49_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_49_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_50_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 10u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
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
  float3 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_50_CB1((uint)(10)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_50_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  o0.w = r0.w;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_50_CB1((uint)(9)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_50_CB1((uint)(8)).xyz + BA_Fragment_50_CB1((uint)(7)).xyz;
  r0.xyz = BA_Fragment_50_CB1((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_50_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_50_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_51_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
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
  float2 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v1.w);
  r0.x = min(1, r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_51_CB0((uint)(19)).x).xyzw;
  r0.yzw = v1.xyz * r1.xyz;
  o0.w = r1.w;
  r0.yzw = r0.yzw * BA_Fragment_51_CB1((uint)(8)).xyz + BA_Fragment_51_CB1((uint)(7)).xyz;
  r0.yzw = BA_Fragment_51_CB1((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.yzw;
  r0.yzw = -BA_Fragment_51_CB0((uint)(56)).xyz + r0.yzw;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_51_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_52_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
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
  float2 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_52_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  o0.w = r0.w;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_52_CB1((uint)(9)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_52_CB1((uint)(8)).xyz + BA_Fragment_52_CB1((uint)(7)).xyz;
  r0.xyz = BA_Fragment_52_CB1((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_52_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_52_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_53_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 10u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
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
  float3 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_53_CB1((uint)(10)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v1.w);
  r0.x = min(1, r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_53_CB0((uint)(19)).x).xyzw;
  r0.yzw = v1.xyz * r1.xyz;
  o0.w = r1.w;
  r0.yzw = r0.yzw * BA_Fragment_53_CB1((uint)(8)).xyz + BA_Fragment_53_CB1((uint)(7)).xyz;
  r0.yzw = BA_Fragment_53_CB1((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.yzw;
  r0.yzw = -BA_Fragment_53_CB0((uint)(56)).xyz + r0.yzw;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_53_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_54_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 10u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
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
  float3 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_54_CB1((uint)(10)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_54_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  o0.w = r0.w;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_54_CB1((uint)(9)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_54_CB1((uint)(8)).xyz + BA_Fragment_54_CB1((uint)(7)).xyz;
  r0.xyz = BA_Fragment_54_CB1((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_54_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_54_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_55_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 10u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_55_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_55_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_55_CB0(uint i)
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
  float3 v4 : TEXCOORD3,
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_55_CB0((uint)(19)).x).xyzw;
  r1.x = min(BA_Fragment_55_CB2((uint)(11)).y, BA_Fragment_55_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_55_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v3.xyz * BA_Fragment_55_CB1((uint)(r2.y+0)).www + BA_Fragment_55_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_55_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_55_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_55_CB1((uint)(r2.y+512)).z + BA_Fragment_55_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_55_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v4.xyz);
    r3.x = saturate(r3.x * BA_Fragment_55_CB3((uint)(10)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r1.xyz = BA_Fragment_55_CB3((uint)(10)).zzz * r1.yzw;
  r0.xyz = r0.xyz * v1.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_55_CB3((uint)(8)).xyz + BA_Fragment_55_CB3((uint)(7)).xyz;
  o0.xyz = BA_Fragment_55_CB3((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_56_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 10u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_56_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_56_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_56_CB0(uint i)
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
  float3 v4 : TEXCOORD3,
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_56_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = min(BA_Fragment_56_CB2((uint)(11)).y, BA_Fragment_56_CB0((uint)(10)).x);
  r0.y = (int)r0.y;
  r1.xyz = float3(0,0,0);
  r0.z = 0;
  while (true) {
    r1.w = cmp((int)r0.z >= (int)r0.y);
    if (r1.w != 0) break;
    r1.w = (uint)r0.z >> 2;
    r2.x = (int)r0.z & 3;
    r1.w = dot(BA_Fragment_56_CB2((uint)(r1.w+12)).xyzw, icb[r2.x+0].xyzw);
    r1.w = (int)r1.w;
    r2.xyz = -v3.xyz * BA_Fragment_56_CB1((uint)(r1.w+0)).www + BA_Fragment_56_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r2.xyz, r2.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.x = rsqrt(r2.w);
    r2.xyz = r3.xxx * r2.xyz;
    r3.x = 1 / r2.w;
    r2.w = BA_Fragment_56_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.x * r2.w;
    r3.x = dot(BA_Fragment_56_CB1((uint)(r1.w+768)).xyz, r2.xyz);
    r3.x = saturate(r3.x * BA_Fragment_56_CB1((uint)(r1.w+512)).z + BA_Fragment_56_CB1((uint)(r1.w+512)).w);
    r3.x = r3.x * r3.x;
    r2.w = r3.x * r2.w;
    r3.xyz = BA_Fragment_56_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r2.xyz, v4.xyz);
    r1.w = saturate(r1.w * BA_Fragment_56_CB3((uint)(10)).y + r1.w);
    r1.xyz = r1.www * r3.xyz + r1.xyz;
    r0.z = (int)r0.z + 1;
  }
  r1.xyz = BA_Fragment_56_CB3((uint)(10)).zzz * r1.xyz;
  r0.xyz = r0.xxx * BA_Fragment_56_CB3((uint)(9)).www + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_56_CB3((uint)(8)).xyz + BA_Fragment_56_CB3((uint)(7)).xyz;
  o0.xyz = BA_Fragment_56_CB3((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_57_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 10u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_57_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_57_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_57_CB0(uint i)
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
  float3 v4 : TEXCOORD3,
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

  r0.x = 333.333344 * v2.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_57_CB3((uint)(10)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_57_CB0((uint)(19)).x).xyzw;
  r1.x = min(BA_Fragment_57_CB2((uint)(11)).y, BA_Fragment_57_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r1.yzw = float3(0,0,0);
  r2.x = 0;
  while (true) {
    r2.y = cmp((int)r2.x >= (int)r1.x);
    if (r2.y != 0) break;
    r2.y = (uint)r2.x >> 2;
    r2.z = (int)r2.x & 3;
    r2.y = dot(BA_Fragment_57_CB2((uint)(r2.y+12)).xyzw, icb[r2.z+0].xyzw);
    r2.y = (int)r2.y;
    r3.xyz = -v3.xyz * BA_Fragment_57_CB1((uint)(r2.y+0)).www + BA_Fragment_57_CB1((uint)(r2.y+0)).xyz;
    r2.z = dot(r3.xyz, r3.xyz);
    r2.z = max(6.10351563e-005, r2.z);
    r2.w = rsqrt(r2.z);
    r3.xyz = r3.xyz * r2.www;
    r2.w = 1 / r2.z;
    r2.z = BA_Fragment_57_CB1((uint)(r2.y+512)).x * r2.z;
    r2.z = -r2.z * r2.z + 1;
    r2.z = max(0, r2.z);
    r2.z = r2.z * r2.z;
    r2.z = r2.w * r2.z;
    r2.w = dot(BA_Fragment_57_CB1((uint)(r2.y+768)).xyz, r3.xyz);
    r2.w = saturate(r2.w * BA_Fragment_57_CB1((uint)(r2.y+512)).z + BA_Fragment_57_CB1((uint)(r2.y+512)).w);
    r2.w = r2.w * r2.w;
    r2.z = r2.z * r2.w;
    r2.yzw = BA_Fragment_57_CB1((uint)(r2.y+256)).xyz * r2.zzz;
    r3.x = dot(r3.xyz, v4.xyz);
    r3.x = saturate(r3.x * BA_Fragment_57_CB3((uint)(10)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r1.xyz = BA_Fragment_57_CB3((uint)(10)).zzz * r1.yzw;
  r0.xyz = r0.xyz * v1.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_57_CB3((uint)(8)).xyz + BA_Fragment_57_CB3((uint)(7)).xyz;
  o0.xyz = BA_Fragment_57_CB3((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_58_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 10u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
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
  float3 v4 : TEXCOORD3,
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

  r0.x = 333.333344 * v2.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_58_CB3((uint)(10)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_58_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = min(BA_Fragment_58_CB2((uint)(11)).y, BA_Fragment_58_CB0((uint)(10)).x);
  r0.y = (int)r0.y;
  r1.xyz = float3(0,0,0);
  r0.z = 0;
  while (true) {
    r1.w = cmp((int)r0.z >= (int)r0.y);
    if (r1.w != 0) break;
    r1.w = (uint)r0.z >> 2;
    r2.x = (int)r0.z & 3;
    r1.w = dot(BA_Fragment_58_CB2((uint)(r1.w+12)).xyzw, icb[r2.x+0].xyzw);
    r1.w = (int)r1.w;
    r2.xyz = -v3.xyz * BA_Fragment_58_CB1((uint)(r1.w+0)).www + BA_Fragment_58_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r2.xyz, r2.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.x = rsqrt(r2.w);
    r2.xyz = r3.xxx * r2.xyz;
    r3.x = 1 / r2.w;
    r2.w = BA_Fragment_58_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.x * r2.w;
    r3.x = dot(BA_Fragment_58_CB1((uint)(r1.w+768)).xyz, r2.xyz);
    r3.x = saturate(r3.x * BA_Fragment_58_CB1((uint)(r1.w+512)).z + BA_Fragment_58_CB1((uint)(r1.w+512)).w);
    r3.x = r3.x * r3.x;
    r2.w = r3.x * r2.w;
    r3.xyz = BA_Fragment_58_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r2.xyz, v4.xyz);
    r1.w = saturate(r1.w * BA_Fragment_58_CB3((uint)(10)).y + r1.w);
    r1.xyz = r1.www * r3.xyz + r1.xyz;
    r0.z = (int)r0.z + 1;
  }
  r1.xyz = BA_Fragment_58_CB3((uint)(10)).zzz * r1.xyz;
  r0.xyz = r0.xxx * BA_Fragment_58_CB3((uint)(9)).www + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_58_CB3((uint)(8)).xyz + BA_Fragment_58_CB3((uint)(7)).xyz;
  o0.xyz = BA_Fragment_58_CB3((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_59_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 10u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
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
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float3 v4 : TEXCOORD3,
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_59_CB0((uint)(19)).x).xyzw;
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
    r3.xyz = -v3.xyz * BA_Fragment_59_CB1((uint)(r2.y+0)).www + BA_Fragment_59_CB1((uint)(r2.y+0)).xyz;
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
    r3.x = dot(r3.xyz, v4.xyz);
    r3.x = saturate(r3.x * BA_Fragment_59_CB3((uint)(10)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r1.xyz = BA_Fragment_59_CB3((uint)(10)).zzz * r1.yzw;
  r0.xyz = r0.xyz * v1.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_59_CB3((uint)(8)).xyz + BA_Fragment_59_CB3((uint)(7)).xyz;
  r0.xyz = BA_Fragment_59_CB3((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_59_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_59_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_60_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 10u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
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
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float3 v4 : TEXCOORD3,
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_60_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = min(BA_Fragment_60_CB2((uint)(11)).y, BA_Fragment_60_CB0((uint)(10)).x);
  r0.y = (int)r0.y;
  r1.xyz = float3(0,0,0);
  r0.z = 0;
  while (true) {
    r1.w = cmp((int)r0.z >= (int)r0.y);
    if (r1.w != 0) break;
    r1.w = (uint)r0.z >> 2;
    r2.x = (int)r0.z & 3;
    r1.w = dot(BA_Fragment_60_CB2((uint)(r1.w+12)).xyzw, icb[r2.x+0].xyzw);
    r1.w = (int)r1.w;
    r2.xyz = -v3.xyz * BA_Fragment_60_CB1((uint)(r1.w+0)).www + BA_Fragment_60_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r2.xyz, r2.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.x = rsqrt(r2.w);
    r2.xyz = r3.xxx * r2.xyz;
    r3.x = 1 / r2.w;
    r2.w = BA_Fragment_60_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.x * r2.w;
    r3.x = dot(BA_Fragment_60_CB1((uint)(r1.w+768)).xyz, r2.xyz);
    r3.x = saturate(r3.x * BA_Fragment_60_CB1((uint)(r1.w+512)).z + BA_Fragment_60_CB1((uint)(r1.w+512)).w);
    r3.x = r3.x * r3.x;
    r2.w = r3.x * r2.w;
    r3.xyz = BA_Fragment_60_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r2.xyz, v4.xyz);
    r1.w = saturate(r1.w * BA_Fragment_60_CB3((uint)(10)).y + r1.w);
    r1.xyz = r1.www * r3.xyz + r1.xyz;
    r0.z = (int)r0.z + 1;
  }
  r1.xyz = BA_Fragment_60_CB3((uint)(10)).zzz * r1.xyz;
  r0.xyz = r0.xxx * BA_Fragment_60_CB3((uint)(9)).www + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_60_CB3((uint)(8)).xyz + BA_Fragment_60_CB3((uint)(7)).xyz;
  r0.xyz = BA_Fragment_60_CB3((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_60_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_60_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_61_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 10u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
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
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float3 v4 : TEXCOORD3,
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

  r0.x = 333.333344 * v2.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_61_CB3((uint)(10)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_61_CB0((uint)(19)).x).xyzw;
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
    r3.xyz = -v3.xyz * BA_Fragment_61_CB1((uint)(r2.y+0)).www + BA_Fragment_61_CB1((uint)(r2.y+0)).xyz;
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
    r3.x = dot(r3.xyz, v4.xyz);
    r3.x = saturate(r3.x * BA_Fragment_61_CB3((uint)(10)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r1.xyz = BA_Fragment_61_CB3((uint)(10)).zzz * r1.yzw;
  r0.xyz = r0.xyz * v1.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_61_CB3((uint)(8)).xyz + BA_Fragment_61_CB3((uint)(7)).xyz;
  r0.xyz = BA_Fragment_61_CB3((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_61_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_61_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_62_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 10u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
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
  float3 v4 : TEXCOORD3,
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

  r0.x = 333.333344 * v2.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_62_CB3((uint)(10)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_62_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = min(BA_Fragment_62_CB2((uint)(11)).y, BA_Fragment_62_CB0((uint)(10)).x);
  r0.y = (int)r0.y;
  r1.xyz = float3(0,0,0);
  r0.z = 0;
  while (true) {
    r1.w = cmp((int)r0.z >= (int)r0.y);
    if (r1.w != 0) break;
    r1.w = (uint)r0.z >> 2;
    r2.x = (int)r0.z & 3;
    r1.w = dot(BA_Fragment_62_CB2((uint)(r1.w+12)).xyzw, icb[r2.x+0].xyzw);
    r1.w = (int)r1.w;
    r2.xyz = -v3.xyz * BA_Fragment_62_CB1((uint)(r1.w+0)).www + BA_Fragment_62_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r2.xyz, r2.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.x = rsqrt(r2.w);
    r2.xyz = r3.xxx * r2.xyz;
    r3.x = 1 / r2.w;
    r2.w = BA_Fragment_62_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.x * r2.w;
    r3.x = dot(BA_Fragment_62_CB1((uint)(r1.w+768)).xyz, r2.xyz);
    r3.x = saturate(r3.x * BA_Fragment_62_CB1((uint)(r1.w+512)).z + BA_Fragment_62_CB1((uint)(r1.w+512)).w);
    r3.x = r3.x * r3.x;
    r2.w = r3.x * r2.w;
    r3.xyz = BA_Fragment_62_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r2.xyz, v4.xyz);
    r1.w = saturate(r1.w * BA_Fragment_62_CB3((uint)(10)).y + r1.w);
    r1.xyz = r1.www * r3.xyz + r1.xyz;
    r0.z = (int)r0.z + 1;
  }
  r1.xyz = BA_Fragment_62_CB3((uint)(10)).zzz * r1.xyz;
  r0.xyz = r0.xxx * BA_Fragment_62_CB3((uint)(9)).www + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_62_CB3((uint)(8)).xyz + BA_Fragment_62_CB3((uint)(7)).xyz;
  r0.xyz = BA_Fragment_62_CB3((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_62_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_62_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_63_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 10u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
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
  float3 v4 : TEXCOORD3,
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_63_CB0((uint)(19)).x).xyzw;
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
    r3.xyz = -v3.xyz * BA_Fragment_63_CB1((uint)(r2.y+0)).www + BA_Fragment_63_CB1((uint)(r2.y+0)).xyz;
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
    r3.x = dot(r3.xyz, v4.xyz);
    r3.x = saturate(r3.x * BA_Fragment_63_CB3((uint)(10)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r1.xyz = BA_Fragment_63_CB3((uint)(10)).zzz * r1.yzw;
  r0.xyz = r0.xyz * v1.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_63_CB3((uint)(8)).xyz + BA_Fragment_63_CB3((uint)(7)).xyz;
  r0.xyz = BA_Fragment_63_CB3((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r1.x = exp2(-v1.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_63_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_63_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_64_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 10u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
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
  float3 v4 : TEXCOORD3,
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_64_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = min(BA_Fragment_64_CB2((uint)(11)).y, BA_Fragment_64_CB0((uint)(10)).x);
  r0.y = (int)r0.y;
  r1.xyz = float3(0,0,0);
  r0.z = 0;
  while (true) {
    r1.w = cmp((int)r0.z >= (int)r0.y);
    if (r1.w != 0) break;
    r1.w = (uint)r0.z >> 2;
    r2.x = (int)r0.z & 3;
    r1.w = dot(BA_Fragment_64_CB2((uint)(r1.w+12)).xyzw, icb[r2.x+0].xyzw);
    r1.w = (int)r1.w;
    r2.xyz = -v3.xyz * BA_Fragment_64_CB1((uint)(r1.w+0)).www + BA_Fragment_64_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r2.xyz, r2.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.x = rsqrt(r2.w);
    r2.xyz = r3.xxx * r2.xyz;
    r3.x = 1 / r2.w;
    r2.w = BA_Fragment_64_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.x * r2.w;
    r3.x = dot(BA_Fragment_64_CB1((uint)(r1.w+768)).xyz, r2.xyz);
    r3.x = saturate(r3.x * BA_Fragment_64_CB1((uint)(r1.w+512)).z + BA_Fragment_64_CB1((uint)(r1.w+512)).w);
    r3.x = r3.x * r3.x;
    r2.w = r3.x * r2.w;
    r3.xyz = BA_Fragment_64_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r2.xyz, v4.xyz);
    r1.w = saturate(r1.w * BA_Fragment_64_CB3((uint)(10)).y + r1.w);
    r1.xyz = r1.www * r3.xyz + r1.xyz;
    r0.z = (int)r0.z + 1;
  }
  r1.xyz = BA_Fragment_64_CB3((uint)(10)).zzz * r1.xyz;
  r0.xyz = r0.xxx * BA_Fragment_64_CB3((uint)(9)).www + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_64_CB3((uint)(8)).xyz + BA_Fragment_64_CB3((uint)(7)).xyz;
  r0.xyz = BA_Fragment_64_CB3((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r1.x = exp2(-v1.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_64_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_64_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_65_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 10u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
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
  float3 v4 : TEXCOORD3,
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

  r0.x = 333.333344 * v2.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_65_CB3((uint)(10)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_65_CB0((uint)(19)).x).xyzw;
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
    r3.xyz = -v3.xyz * BA_Fragment_65_CB1((uint)(r2.y+0)).www + BA_Fragment_65_CB1((uint)(r2.y+0)).xyz;
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
    r3.x = dot(r3.xyz, v4.xyz);
    r3.x = saturate(r3.x * BA_Fragment_65_CB3((uint)(10)).y + r3.x);
    r1.yzw = r3.xxx * r2.yzw + r1.yzw;
    r2.x = (int)r2.x + 1;
  }
  r1.xyz = BA_Fragment_65_CB3((uint)(10)).zzz * r1.yzw;
  r0.xyz = r0.xyz * v1.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_65_CB3((uint)(8)).xyz + BA_Fragment_65_CB3((uint)(7)).xyz;
  r0.xyz = BA_Fragment_65_CB3((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r1.x = exp2(-v1.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_65_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_65_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_66_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 10u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
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
  float3 v4 : TEXCOORD3,
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

  r0.x = 333.333344 * v2.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_66_CB3((uint)(10)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v2.xy, BA_Fragment_66_CB0((uint)(19)).x).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = min(BA_Fragment_66_CB2((uint)(11)).y, BA_Fragment_66_CB0((uint)(10)).x);
  r0.y = (int)r0.y;
  r1.xyz = float3(0,0,0);
  r0.z = 0;
  while (true) {
    r1.w = cmp((int)r0.z >= (int)r0.y);
    if (r1.w != 0) break;
    r1.w = (uint)r0.z >> 2;
    r2.x = (int)r0.z & 3;
    r1.w = dot(BA_Fragment_66_CB2((uint)(r1.w+12)).xyzw, icb[r2.x+0].xyzw);
    r1.w = (int)r1.w;
    r2.xyz = -v3.xyz * BA_Fragment_66_CB1((uint)(r1.w+0)).www + BA_Fragment_66_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r2.xyz, r2.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.x = rsqrt(r2.w);
    r2.xyz = r3.xxx * r2.xyz;
    r3.x = 1 / r2.w;
    r2.w = BA_Fragment_66_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.x * r2.w;
    r3.x = dot(BA_Fragment_66_CB1((uint)(r1.w+768)).xyz, r2.xyz);
    r3.x = saturate(r3.x * BA_Fragment_66_CB1((uint)(r1.w+512)).z + BA_Fragment_66_CB1((uint)(r1.w+512)).w);
    r3.x = r3.x * r3.x;
    r2.w = r3.x * r2.w;
    r3.xyz = BA_Fragment_66_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r2.xyz, v4.xyz);
    r1.w = saturate(r1.w * BA_Fragment_66_CB3((uint)(10)).y + r1.w);
    r1.xyz = r1.www * r3.xyz + r1.xyz;
    r0.z = (int)r0.z + 1;
  }
  r1.xyz = BA_Fragment_66_CB3((uint)(10)).zzz * r1.xyz;
  r0.xyz = r0.xxx * BA_Fragment_66_CB3((uint)(9)).www + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_66_CB3((uint)(8)).xyz + BA_Fragment_66_CB3((uint)(7)).xyz;
  r0.xyz = BA_Fragment_66_CB3((uint)(9)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r1.x = exp2(-v1.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_66_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_66_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
