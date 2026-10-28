// Exact names and types from the original compiled parameter metadata.
float _AdditionalLightSharpness;
float _AdditionalLightStrength;
float4 _CodeAddColor;
float4 _CodeAddRimColor;
float4 _CodeMultiplyColor;
float _Cutoff;
float _DitherThreshold;
float _GrayBrightness;
float4 _MxCharLightData;
float3 _MxCharLightDir;
float3 _MxCharLightTone;
float3 _MxCharShadowTone;
float _RimAreaMultiplier;
float _RimStrength;
float _ShadowThreshold;
float4 _ShadowTint;
float4 _Tint;
Texture2D<float4> _MainTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_3_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
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
  r1.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_3_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_3_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_3_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_3_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_3_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_3_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_3_CB2((uint)(2)).xyz * BA_Vertex_3_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_4_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
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
  r1.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_4_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_4_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_4_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_4_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_4_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_4_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_4_CB2((uint)(2)).xyz * BA_Vertex_4_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_5_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_5_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
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
  r1.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_5_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_5_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_5_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_5_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_5_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_5_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_5_CB2((uint)(2)).xyz * BA_Vertex_5_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_6_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_6_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
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
  r1.xyzw = BA_Vertex_6_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_6_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_6_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_6_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_6_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_6_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_6_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_6_CB2((uint)(2)).xyz * BA_Vertex_6_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_7_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_7_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
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
  r1.xyzw = BA_Vertex_7_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_7_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_7_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_7_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_7_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_7_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_7_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_7_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_7_CB2((uint)(2)).xyz * BA_Vertex_7_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_8_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_8_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
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
  r1.xyzw = BA_Vertex_8_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_8_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_8_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_8_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_8_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_8_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_8_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_8_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_8_CB2((uint)(2)).xyz * BA_Vertex_8_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_9_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_9_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
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
  r1.xyzw = BA_Vertex_9_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_9_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_9_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_9_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_9_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_9_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_9_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_9_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_9_CB2((uint)(2)).xyz * BA_Vertex_9_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_10_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_10_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
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
  r1.xyzw = BA_Vertex_10_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_10_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_10_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_10_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_10_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_10_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_10_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_10_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_10_CB2((uint)(2)).xyz * BA_Vertex_10_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_11_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
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
  r1.xyzw = BA_Vertex_11_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_11_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_11_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_11_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_11_CB0((uint)(55)).z + BA_Vertex_11_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_11_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_11_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_11_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_11_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_11_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_11_CB2((uint)(2)).xyz * BA_Vertex_11_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_12_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
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
  r1.xyzw = BA_Vertex_12_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_12_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_12_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_12_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_12_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_12_CB0((uint)(55)).z + BA_Vertex_12_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_12_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_12_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_12_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_12_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_12_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_12_CB2((uint)(2)).xyz * BA_Vertex_12_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_13_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_13_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_13_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_13_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_13_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_13_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_13_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_13_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_13_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_13_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_13_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_13_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_13_CB0((uint)(55)).z + BA_Vertex_13_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_13_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_13_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_13_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_13_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_13_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_13_CB2((uint)(2)).xyz * BA_Vertex_13_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_14_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_14_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_14_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_14_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_14_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_14_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_14_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_14_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_14_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_14_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_14_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_14_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_14_CB0((uint)(55)).z + BA_Vertex_14_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_14_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_14_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_14_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_14_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_14_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_14_CB2((uint)(2)).xyz * BA_Vertex_14_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_15_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_15_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_15_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_15_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_15_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_15_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_15_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_15_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_15_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_15_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_15_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_15_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_15_CB0((uint)(55)).z + BA_Vertex_15_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_15_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_15_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_15_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_15_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_15_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_15_CB2((uint)(2)).xyz * BA_Vertex_15_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_16_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_16_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_16_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_16_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_16_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_16_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_16_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_16_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_16_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_16_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_16_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_16_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_16_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_16_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_16_CB0((uint)(55)).z + BA_Vertex_16_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_16_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_16_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_16_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_16_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_16_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_16_CB2((uint)(2)).xyz * BA_Vertex_16_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_17_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_17_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_17_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_17_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_17_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_17_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_17_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_17_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_17_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_17_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_17_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_17_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_17_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_17_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_17_CB0((uint)(55)).z + BA_Vertex_17_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_17_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_17_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_17_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_17_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_17_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_17_CB2((uint)(2)).xyz * BA_Vertex_17_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_18_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

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
  r0.xyz = BA_Vertex_18_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_18_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_18_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_18_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_18_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_18_CB0((uint)(55)).z + BA_Vertex_18_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_18_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_18_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_18_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_18_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_18_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_18_CB2((uint)(2)).xyz * BA_Vertex_18_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_19_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

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
  r0.xyz = BA_Vertex_19_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_19_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_19_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_19_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_19_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_19_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_19_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_19_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_19_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_19_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_19_CB2((uint)(2)).xyz * BA_Vertex_19_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_20_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

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
  r0.xyz = BA_Vertex_20_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_20_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_20_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_20_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_20_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_20_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_20_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_20_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_20_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_20_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_20_CB2((uint)(2)).xyz * BA_Vertex_20_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_21_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

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
  r0.xyz = BA_Vertex_21_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_21_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_21_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_21_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_21_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_21_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_21_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_21_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_21_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_21_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_21_CB2((uint)(2)).xyz * BA_Vertex_21_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_22_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

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
  r0.xyz = BA_Vertex_22_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_22_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_22_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_22_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_22_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_22_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_22_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_22_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_22_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_22_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_22_CB2((uint)(2)).xyz * BA_Vertex_22_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_23_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

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
  r0.xyz = BA_Vertex_23_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_23_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_23_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_23_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_23_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_23_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_23_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_23_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_23_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_23_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_23_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_23_CB2((uint)(2)).xyz * BA_Vertex_23_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_24_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

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
  r0.xyz = BA_Vertex_24_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_24_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_24_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_24_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_24_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_24_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_24_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_24_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_24_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_24_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_24_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_24_CB2((uint)(2)).xyz * BA_Vertex_24_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_25_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

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
  r0.xyz = BA_Vertex_25_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_25_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_25_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_25_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_25_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_25_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_25_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_25_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_25_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_25_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_25_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_25_CB2((uint)(2)).xyz * BA_Vertex_25_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_26_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

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
  r0.xyz = BA_Vertex_26_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_26_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_26_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_26_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_26_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_26_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_26_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_26_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_26_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_26_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_26_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_26_CB2((uint)(2)).xyz * BA_Vertex_26_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_27_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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
  o0.xyzw = BA_Vertex_27_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_27_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_27_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_27_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_27_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_27_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_27_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_27_CB2((uint)(2)).xyz * BA_Vertex_27_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_28_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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
  o0.xyzw = BA_Vertex_28_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_28_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_28_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_28_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_28_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_28_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_28_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_28_CB2((uint)(2)).xyz * BA_Vertex_28_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_29_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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
  o0.xyzw = BA_Vertex_29_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_29_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_29_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_29_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_29_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_29_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_29_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_29_CB2((uint)(2)).xyz * BA_Vertex_29_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_30_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_30_CB1(uint i)
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

float4 BA_Vertex_30_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_30_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_30_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_30_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_30_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_30_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_30_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_30_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_30_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_30_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_30_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_30_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_30_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_30_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_30_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_30_CB2((uint)(2)).xyz * BA_Vertex_30_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_31_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_31_CB1(uint i)
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

float4 BA_Vertex_31_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_31_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_31_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_31_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_31_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_31_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_31_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_31_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_31_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_31_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_31_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_31_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_31_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_31_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_31_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_31_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_31_CB2((uint)(2)).xyz * BA_Vertex_31_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_32_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_32_CB1(uint i)
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

float4 BA_Vertex_32_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_32_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_32_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_32_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_32_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_32_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_32_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_32_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_32_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_32_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_32_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_32_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_32_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_32_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_32_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_32_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_32_CB2((uint)(2)).xyz * BA_Vertex_32_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_33_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_33_CB1(uint i)
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

float4 BA_Vertex_33_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_33_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_33_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_33_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_33_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_33_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_33_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_33_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_33_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_33_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_33_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_33_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_33_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_33_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_33_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_33_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_33_CB2((uint)(2)).xyz * BA_Vertex_33_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_34_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_34_CB1(uint i)
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

float4 BA_Vertex_34_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_34_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_34_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_34_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_34_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_34_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_34_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_34_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_34_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_34_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_34_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_34_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_34_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_34_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_34_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_34_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_34_CB2((uint)(2)).xyz * BA_Vertex_34_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_35_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_35_CB1(uint i)
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

float4 BA_Vertex_35_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_35_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_35_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_35_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_35_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_35_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_35_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_35_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_35_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_35_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_35_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_35_CB0((uint)(55)).z + BA_Vertex_35_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_35_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_35_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_35_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_35_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_35_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_35_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_35_CB2((uint)(2)).xyz * BA_Vertex_35_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_36_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_36_CB1(uint i)
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

float4 BA_Vertex_36_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_36_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_36_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_36_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_36_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_36_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_36_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_36_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_36_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_36_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_36_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_36_CB0((uint)(55)).z + BA_Vertex_36_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_36_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_36_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_36_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_36_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_36_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_36_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_36_CB2((uint)(2)).xyz * BA_Vertex_36_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_37_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_37_CB1(uint i)
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

float4 BA_Vertex_37_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_37_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_37_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_37_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_37_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_37_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_37_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_37_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_37_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_37_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_37_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_37_CB0((uint)(55)).z + BA_Vertex_37_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_37_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_37_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_37_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_37_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_37_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_37_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_37_CB2((uint)(2)).xyz * BA_Vertex_37_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_38_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_38_CB1(uint i)
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

float4 BA_Vertex_38_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_38_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_38_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_38_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_38_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_38_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_38_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_38_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_38_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_38_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_38_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_38_CB0((uint)(55)).z + BA_Vertex_38_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_38_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_38_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_38_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_38_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_38_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_38_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_38_CB2((uint)(2)).xyz * BA_Vertex_38_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_39_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_39_CB1(uint i)
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

float4 BA_Vertex_39_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_39_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_39_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_39_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_39_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_39_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_39_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_39_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_39_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_39_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_39_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_39_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_39_CB0((uint)(55)).z + BA_Vertex_39_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_39_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_39_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_39_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_39_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_39_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_39_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_39_CB2((uint)(2)).xyz * BA_Vertex_39_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_40_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_40_CB1(uint i)
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

float4 BA_Vertex_40_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_40_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_40_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_40_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_40_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_40_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_40_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_40_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_40_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_40_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_40_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_40_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_40_CB0((uint)(55)).z + BA_Vertex_40_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_40_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_40_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_40_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_40_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_40_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_40_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_40_CB2((uint)(2)).xyz * BA_Vertex_40_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_41_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_41_CB1(uint i)
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

float4 BA_Vertex_41_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_41_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_41_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_41_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_41_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_41_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_41_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_41_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_41_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_41_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_41_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_41_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_41_CB0((uint)(55)).z + BA_Vertex_41_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_41_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_41_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_41_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_41_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_41_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_41_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_41_CB2((uint)(2)).xyz * BA_Vertex_41_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_42_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_42_CB1(uint i)
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

float4 BA_Vertex_42_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_42_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_42_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_42_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_42_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_42_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_42_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_42_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_42_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_42_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_42_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_42_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_42_CB0((uint)(55)).z + BA_Vertex_42_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_42_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_42_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_42_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_42_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_42_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_42_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_42_CB2((uint)(2)).xyz * BA_Vertex_42_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_43_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_43_CB1(uint i)
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

float4 BA_Vertex_43_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_43_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_43_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_43_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_43_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_43_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_43_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_43_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_43_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_43_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_43_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_43_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_43_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_43_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_43_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_43_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_43_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_43_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_43_CB2((uint)(2)).xyz * BA_Vertex_43_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_44_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_44_CB1(uint i)
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

float4 BA_Vertex_44_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_44_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_44_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_44_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_44_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_44_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_44_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_44_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_44_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_44_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_44_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_44_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_44_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_44_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_44_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_44_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_44_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_44_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_44_CB2((uint)(2)).xyz * BA_Vertex_44_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_45_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_45_CB1(uint i)
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

float4 BA_Vertex_45_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_45_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_45_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_45_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_45_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_45_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_45_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_45_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_45_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_45_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_45_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_45_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_45_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_45_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_45_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_45_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_45_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_45_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_45_CB2((uint)(2)).xyz * BA_Vertex_45_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_46_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_46_CB1(uint i)
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

float4 BA_Vertex_46_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_46_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_46_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_46_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_46_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_46_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_46_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_46_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_46_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_46_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_46_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_46_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_46_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_46_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_46_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_46_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_46_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_46_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_46_CB2((uint)(2)).xyz * BA_Vertex_46_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_47_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_47_CB1(uint i)
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

float4 BA_Vertex_47_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_47_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_47_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_47_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_47_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_47_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_47_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_47_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_47_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_47_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_47_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_47_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_47_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_47_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_47_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_47_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_47_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_47_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_47_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_47_CB2((uint)(2)).xyz * BA_Vertex_47_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_48_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_48_CB1(uint i)
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

float4 BA_Vertex_48_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_48_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_48_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_48_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_48_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_48_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_48_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_48_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_48_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_48_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_48_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_48_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_48_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_48_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_48_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_48_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_48_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_48_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_48_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_48_CB2((uint)(2)).xyz * BA_Vertex_48_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_49_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_49_CB1(uint i)
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

float4 BA_Vertex_49_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_49_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_49_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_49_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_49_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_49_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_49_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_49_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_49_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_49_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_49_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_49_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_49_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_49_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_49_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_49_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_49_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_49_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_49_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_49_CB2((uint)(2)).xyz * BA_Vertex_49_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_50_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_50_CB1(uint i)
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

float4 BA_Vertex_50_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_50_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_50_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_50_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_50_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_50_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_50_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_50_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_50_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_50_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_50_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_50_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_50_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_50_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_50_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_50_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_50_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_50_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_50_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_50_CB2((uint)(2)).xyz * BA_Vertex_50_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_51_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_51_CB1(uint i)
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

float4 BA_Vertex_51_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_51_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_51_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_51_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_51_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_51_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_51_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_51_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_51_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_51_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_51_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_51_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_51_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_51_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_51_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_51_CB2((uint)(2)).xyz * BA_Vertex_51_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_52_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_52_CB1(uint i)
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

float4 BA_Vertex_52_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_52_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_52_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_52_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_52_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_52_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_52_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_52_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_52_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_52_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_52_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_52_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_52_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_52_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_52_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_52_CB2((uint)(2)).xyz * BA_Vertex_52_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_53_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_53_CB1(uint i)
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

float4 BA_Vertex_53_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_53_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_53_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_53_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_53_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_53_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_53_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_53_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_53_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_53_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_53_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_53_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_53_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_53_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_53_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_53_CB2((uint)(2)).xyz * BA_Vertex_53_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_54_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_54_CB1(uint i)
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

float4 BA_Vertex_54_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_54_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_54_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_54_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_54_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_54_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_54_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_54_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_54_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_54_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_54_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_54_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_54_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_54_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_54_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_54_CB2((uint)(2)).xyz * BA_Vertex_54_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_55_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_55_CB1(uint i)
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

float4 BA_Vertex_55_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_55_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_55_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_55_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_55_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_55_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_55_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_55_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_55_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_55_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_55_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_55_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_55_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_55_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_55_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_55_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_55_CB2((uint)(2)).xyz * BA_Vertex_55_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_56_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_56_CB1(uint i)
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

float4 BA_Vertex_56_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_56_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_56_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_56_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_56_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_56_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_56_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_56_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_56_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_56_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_56_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_56_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_56_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_56_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_56_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_56_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_56_CB2((uint)(2)).xyz * BA_Vertex_56_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_57_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_57_CB1(uint i)
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

float4 BA_Vertex_57_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_57_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_57_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_57_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_57_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_57_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_57_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_57_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_57_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_57_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_57_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_57_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_57_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_57_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_57_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_57_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_57_CB2((uint)(2)).xyz * BA_Vertex_57_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_58_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_58_CB1(uint i)
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

float4 BA_Vertex_58_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_58_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_58_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_58_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_58_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_58_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_58_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_58_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_58_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_58_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_58_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_58_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_58_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_58_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_58_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_58_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_58_CB2((uint)(2)).xyz * BA_Vertex_58_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_59_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_59_CB1(uint i)
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

float4 BA_Vertex_59_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_59_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_59_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_59_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_59_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_59_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_59_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_59_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_59_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_59_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_59_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_59_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_59_CB0((uint)(55)).z + BA_Vertex_59_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_59_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_59_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_59_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_59_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_59_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_59_CB2((uint)(2)).xyz * BA_Vertex_59_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_60_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_60_CB1(uint i)
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

float4 BA_Vertex_60_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_60_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_60_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_60_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_60_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_60_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_60_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_60_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_60_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_60_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_60_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_60_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_60_CB0((uint)(55)).z + BA_Vertex_60_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_60_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_60_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_60_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_60_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_60_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_60_CB2((uint)(2)).xyz * BA_Vertex_60_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_61_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_61_CB1(uint i)
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

float4 BA_Vertex_61_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_61_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_61_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_61_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_61_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_61_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_61_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_61_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_61_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_61_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_61_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_61_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_61_CB0((uint)(55)).z + BA_Vertex_61_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_61_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_61_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_61_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_61_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_61_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_61_CB2((uint)(2)).xyz * BA_Vertex_61_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_62_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_62_CB1(uint i)
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

float4 BA_Vertex_62_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_62_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_62_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_62_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_62_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_62_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_62_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_62_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_62_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_62_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_62_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_62_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_62_CB0((uint)(55)).z + BA_Vertex_62_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_62_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_62_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_62_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_62_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_62_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_62_CB2((uint)(2)).xyz * BA_Vertex_62_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_63_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_63_CB1(uint i)
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

float4 BA_Vertex_63_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_63_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_63_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_63_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_63_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_63_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_63_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_63_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_63_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_63_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_63_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_63_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_63_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_63_CB0((uint)(55)).z + BA_Vertex_63_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_63_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_63_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_63_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_63_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_63_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_63_CB2((uint)(2)).xyz * BA_Vertex_63_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_64_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_64_CB1(uint i)
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

float4 BA_Vertex_64_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_64_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_64_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_64_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_64_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_64_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_64_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_64_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_64_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_64_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_64_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_64_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_64_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_64_CB0((uint)(55)).z + BA_Vertex_64_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_64_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_64_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_64_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_64_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_64_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_64_CB2((uint)(2)).xyz * BA_Vertex_64_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_65_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_65_CB1(uint i)
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

float4 BA_Vertex_65_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_65_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_65_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_65_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_65_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_65_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_65_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_65_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_65_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_65_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_65_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_65_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_65_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_65_CB0((uint)(55)).z + BA_Vertex_65_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_65_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_65_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_65_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_65_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_65_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_65_CB2((uint)(2)).xyz * BA_Vertex_65_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_66_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_66_CB1(uint i)
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

float4 BA_Vertex_66_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_66_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_66_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_66_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_66_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_66_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_66_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_66_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_66_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_66_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_66_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_66_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_66_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_66_CB0((uint)(55)).z + BA_Vertex_66_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_66_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_66_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_66_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_66_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_66_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_66_CB2((uint)(2)).xyz * BA_Vertex_66_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_67_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_67_CB1(uint i)
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

float4 BA_Vertex_67_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_67_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_67_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_67_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_67_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_67_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_67_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_67_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_67_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_67_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_67_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_67_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_67_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_67_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_67_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_67_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_67_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_67_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_67_CB2((uint)(2)).xyz * BA_Vertex_67_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_68_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_68_CB1(uint i)
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

float4 BA_Vertex_68_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_68_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_68_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_68_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_68_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_68_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_68_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_68_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_68_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_68_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_68_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_68_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_68_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_68_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_68_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_68_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_68_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_68_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_68_CB2((uint)(2)).xyz * BA_Vertex_68_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_69_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_69_CB1(uint i)
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

float4 BA_Vertex_69_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_69_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_69_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_69_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_69_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_69_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_69_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_69_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_69_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_69_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_69_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_69_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_69_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_69_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_69_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_69_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_69_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_69_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_69_CB2((uint)(2)).xyz * BA_Vertex_69_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_70_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_70_CB1(uint i)
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

float4 BA_Vertex_70_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_70_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_70_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_70_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_70_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_70_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_70_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_70_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_70_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_70_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_70_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_70_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_70_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_70_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_70_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_70_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_70_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_70_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_70_CB2((uint)(2)).xyz * BA_Vertex_70_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_71_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_71_CB1(uint i)
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

float4 BA_Vertex_71_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_71_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_71_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_71_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_71_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_71_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_71_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_71_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_71_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_71_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_71_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_71_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_71_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_71_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_71_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_71_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_71_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_71_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_71_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_71_CB2((uint)(2)).xyz * BA_Vertex_71_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_72_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_72_CB1(uint i)
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

float4 BA_Vertex_72_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_72_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_72_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_72_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_72_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_72_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_72_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_72_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_72_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_72_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_72_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_72_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_72_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_72_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_72_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_72_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_72_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_72_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_72_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_72_CB2((uint)(2)).xyz * BA_Vertex_72_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_73_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_73_CB1(uint i)
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

float4 BA_Vertex_73_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_73_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_73_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_73_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_73_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_73_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_73_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_73_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_73_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_73_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_73_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_73_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_73_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_73_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_73_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_73_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_73_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_73_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_73_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_73_CB2((uint)(2)).xyz * BA_Vertex_73_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_74_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_74_CB1(uint i)
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

float4 BA_Vertex_74_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_74_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_74_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_74_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_74_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_74_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_74_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_74_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_74_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_74_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_74_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_74_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_74_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_74_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_74_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_74_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_74_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_74_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_74_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_74_CB2((uint)(2)).xyz * BA_Vertex_74_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_75_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_75_CB1(uint i)
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

float4 BA_Vertex_75_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_75_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_75_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_75_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_75_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_75_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_75_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_75_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_75_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_75_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_75_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_75_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_75_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_75_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_75_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_75_CB2((uint)(2)).xyz * BA_Vertex_75_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_76_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_76_CB1(uint i)
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

float4 BA_Vertex_76_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_76_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_76_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_76_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_76_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_76_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_76_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_76_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_76_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_76_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_76_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_76_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_76_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_76_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_76_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_76_CB2((uint)(2)).xyz * BA_Vertex_76_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_77_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_77_CB1(uint i)
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

float4 BA_Vertex_77_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_77_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_77_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_77_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_77_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_77_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_77_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_77_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_77_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_77_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_77_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_77_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_77_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_77_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_77_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_77_CB2((uint)(2)).xyz * BA_Vertex_77_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_78_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_78_CB1(uint i)
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

float4 BA_Vertex_78_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_78_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_78_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_78_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_78_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_78_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_78_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_78_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_78_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_78_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_78_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_78_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_78_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_78_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_78_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_78_CB2((uint)(2)).xyz * BA_Vertex_78_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_79_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_79_CB1(uint i)
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

float4 BA_Vertex_79_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_79_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_79_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_79_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_79_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_79_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_79_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_79_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_79_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_79_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_79_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_79_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_79_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_79_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_79_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_79_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_79_CB2((uint)(2)).xyz * BA_Vertex_79_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_80_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_80_CB1(uint i)
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

float4 BA_Vertex_80_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_80_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_80_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_80_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_80_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_80_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_80_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_80_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_80_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_80_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_80_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_80_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_80_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_80_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_80_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_80_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_80_CB2((uint)(2)).xyz * BA_Vertex_80_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_81_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_81_CB1(uint i)
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

float4 BA_Vertex_81_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_81_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_81_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_81_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_81_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_81_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_81_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_81_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_81_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_81_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_81_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_81_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_81_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_81_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_81_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_81_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_81_CB2((uint)(2)).xyz * BA_Vertex_81_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_82_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_82_CB1(uint i)
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

float4 BA_Vertex_82_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_82_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_82_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_82_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_82_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_82_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_82_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_82_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_82_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_82_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_82_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_82_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_82_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_82_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_82_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_82_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_82_CB2((uint)(2)).xyz * BA_Vertex_82_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_83_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_83_CB1(uint i)
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

float4 BA_Vertex_83_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_83_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_83_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_83_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_83_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_83_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_83_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_83_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_83_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_83_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_83_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_83_CB0((uint)(55)).z + BA_Vertex_83_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_83_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_83_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_83_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_83_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_83_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_83_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_83_CB2((uint)(2)).xyz * BA_Vertex_83_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_84_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_84_CB1(uint i)
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

float4 BA_Vertex_84_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_84_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_84_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_84_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_84_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_84_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_84_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_84_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_84_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_84_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_84_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_84_CB0((uint)(55)).z + BA_Vertex_84_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_84_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_84_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_84_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_84_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_84_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_84_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_84_CB2((uint)(2)).xyz * BA_Vertex_84_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_85_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_85_CB1(uint i)
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

float4 BA_Vertex_85_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_85_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_85_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_85_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_85_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_85_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_85_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_85_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_85_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_85_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_85_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_85_CB0((uint)(55)).z + BA_Vertex_85_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_85_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_85_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_85_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_85_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_85_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_85_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_85_CB2((uint)(2)).xyz * BA_Vertex_85_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_86_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_86_CB1(uint i)
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

float4 BA_Vertex_86_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_86_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_86_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_86_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_86_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_86_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_86_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_86_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_86_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_86_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_86_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_86_CB0((uint)(55)).z + BA_Vertex_86_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_86_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_86_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_86_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_86_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_86_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_86_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_86_CB2((uint)(2)).xyz * BA_Vertex_86_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_87_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_87_CB1(uint i)
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

float4 BA_Vertex_87_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_87_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_87_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_87_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_87_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_87_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_87_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_87_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_87_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_87_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_87_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_87_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_87_CB0((uint)(55)).z + BA_Vertex_87_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_87_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_87_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_87_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_87_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_87_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_87_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_87_CB2((uint)(2)).xyz * BA_Vertex_87_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_88_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_88_CB1(uint i)
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

float4 BA_Vertex_88_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_88_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_88_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_88_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_88_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_88_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_88_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_88_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_88_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_88_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_88_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_88_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_88_CB0((uint)(55)).z + BA_Vertex_88_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_88_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_88_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_88_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_88_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_88_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_88_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_88_CB2((uint)(2)).xyz * BA_Vertex_88_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_89_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_89_CB1(uint i)
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

float4 BA_Vertex_89_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_89_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_89_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_89_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_89_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_89_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_89_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_89_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_89_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_89_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_89_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_89_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_89_CB0((uint)(55)).z + BA_Vertex_89_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_89_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_89_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_89_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_89_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_89_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_89_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_89_CB2((uint)(2)).xyz * BA_Vertex_89_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_90_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_90_CB1(uint i)
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

float4 BA_Vertex_90_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_90_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_90_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_90_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_90_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_90_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_90_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_90_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_90_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_90_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_90_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_90_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_90_CB0((uint)(55)).z + BA_Vertex_90_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_90_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_90_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_90_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_90_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_90_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_90_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_90_CB2((uint)(2)).xyz * BA_Vertex_90_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_91_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_91_CB1(uint i)
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

float4 BA_Vertex_91_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_91_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_91_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_91_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_91_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_91_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_91_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_91_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_91_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_91_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_91_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_91_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_91_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_91_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_91_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_91_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_91_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_91_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_91_CB2((uint)(2)).xyz * BA_Vertex_91_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_92_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_92_CB1(uint i)
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

float4 BA_Vertex_92_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_92_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_92_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_92_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_92_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_92_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_92_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_92_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_92_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_92_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_92_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_92_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_92_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_92_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_92_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_92_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_92_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_92_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_92_CB2((uint)(2)).xyz * BA_Vertex_92_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_93_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_93_CB1(uint i)
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

float4 BA_Vertex_93_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_93_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_93_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_93_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_93_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_93_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_93_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_93_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_93_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_93_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_93_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_93_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_93_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_93_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_93_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_93_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_93_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_93_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_93_CB2((uint)(2)).xyz * BA_Vertex_93_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_94_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_94_CB1(uint i)
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

float4 BA_Vertex_94_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_94_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_94_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_94_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_94_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_94_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_94_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_94_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_94_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_94_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_94_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_94_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_94_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_94_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_94_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_94_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_94_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_94_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_94_CB2((uint)(2)).xyz * BA_Vertex_94_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_95_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_95_CB1(uint i)
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

float4 BA_Vertex_95_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_95_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_95_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_95_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_95_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_95_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_95_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_95_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_95_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_95_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_95_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_95_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_95_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_95_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_95_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_95_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_95_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_95_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_95_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_95_CB2((uint)(2)).xyz * BA_Vertex_95_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_96_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_96_CB1(uint i)
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

float4 BA_Vertex_96_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_96_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_96_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_96_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_96_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_96_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_96_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_96_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_96_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_96_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_96_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_96_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_96_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_96_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_96_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_96_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_96_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_96_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_96_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_96_CB2((uint)(2)).xyz * BA_Vertex_96_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_97_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_97_CB1(uint i)
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

float4 BA_Vertex_97_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_97_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_97_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_97_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_97_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_97_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_97_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_97_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_97_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_97_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_97_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_97_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_97_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_97_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_97_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_97_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_97_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_97_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_97_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_97_CB2((uint)(2)).xyz * BA_Vertex_97_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_98_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_98_CB1(uint i)
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

float4 BA_Vertex_98_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_98_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_98_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_98_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_98_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_98_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_98_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_98_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_98_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_98_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_98_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_98_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_98_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_98_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_98_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_98_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_98_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_98_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_98_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_98_CB2((uint)(2)).xyz * BA_Vertex_98_CB0((uint)(128)).xyz;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_131_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_131_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, BA_Fragment_131_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_131_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_131_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_131_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_131_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_131_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_131_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_131_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_131_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_131_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_131_CB1((uint)(7)).xyz + BA_Fragment_131_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_131_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_132_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_132_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_132_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_132_CB1((uint)(3)).x + r0.w;
  r0.xyzw = BA_Fragment_132_CB1((uint)(0)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_132_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = r1.y * 0.769999981 + r1.x;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_132_CB0((uint)(127)).xyz * r1.xxx;
  r1.x = 1 + -r1.y;
  r1.y = -v4.w + r1.z;
  r1.y = saturate(-20 * r1.y);
  r3.xyz = -BA_Fragment_132_CB0((uint)(127)).xyz + v4.xyz;
  r1.yzw = r1.yyy * r3.xyz + BA_Fragment_132_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_132_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.x * BA_Fragment_132_CB1((uint)(3)).y + -r2.w);
  r1.x = r1.x * r1.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_132_CB1((uint)(3)).z * r2.w;
  r1.yzw = r2.www * r2.xyz + r1.yzw;
  r0.xyz = r1.yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = BA_Fragment_132_CB0((uint)(129)).xxx * r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_132_CB1((uint)(7)).xyz + BA_Fragment_132_CB1((uint)(6)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_132_CB1((uint)(8)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_133_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_133_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, BA_Fragment_133_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_133_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_133_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_133_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_133_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_133_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_133_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_133_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_133_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_133_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_133_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_133_CB1((uint)(7)).xyz + BA_Fragment_133_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_133_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_134_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_134_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_134_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_134_CB1((uint)(3)).x + r0.w;
  r0.xyzw = BA_Fragment_134_CB1((uint)(0)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_134_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = r1.y * 0.769999981 + r1.x;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_134_CB0((uint)(127)).xyz * r1.xxx;
  r1.x = 1 + -r1.y;
  r1.y = -v4.w + r1.z;
  r1.y = saturate(-20 * r1.y);
  r3.xyz = -BA_Fragment_134_CB0((uint)(127)).xyz + v4.xyz;
  r1.yzw = r1.yyy * r3.xyz + BA_Fragment_134_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_134_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.x * BA_Fragment_134_CB1((uint)(3)).y + -r2.w);
  r1.x = r1.x * r1.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_134_CB1((uint)(3)).z * r2.w;
  r1.yzw = r2.www * r2.xyz + r1.yzw;
  r0.xyz = r1.yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = BA_Fragment_134_CB0((uint)(129)).xxx * r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_134_CB1((uint)(4)).y * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_134_CB1((uint)(7)).xyz + BA_Fragment_134_CB1((uint)(6)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_134_CB1((uint)(8)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_135_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_135_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_135_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_135_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_135_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_135_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_135_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_135_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_135_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_135_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_135_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_135_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_135_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_135_CB1((uint)(7)).xyz + BA_Fragment_135_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_135_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_136_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_136_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_136_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_136_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_136_CB1((uint)(3)).x + r1.w;
  r1.xyzw = BA_Fragment_136_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_136_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_136_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r3.xyz = -BA_Fragment_136_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r3.xyz + BA_Fragment_136_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_136_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.x * BA_Fragment_136_CB1((uint)(3)).y + -r2.w);
  r0.x = r0.x * r0.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_136_CB1((uint)(3)).z * r2.w;
  r0.yzw = r2.www * r2.xyz + r0.yzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_136_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_136_CB1((uint)(7)).xyz + BA_Fragment_136_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_136_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_137_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_137_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_137_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_137_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_137_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_137_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_137_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_137_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_137_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_137_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_137_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_137_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_137_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_137_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_137_CB1((uint)(7)).xyz + BA_Fragment_137_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_137_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_138_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_138_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_138_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_138_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_138_CB1((uint)(3)).x + r1.w;
  r1.xyzw = BA_Fragment_138_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_138_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_138_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r3.xyz = -BA_Fragment_138_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r3.xyz + BA_Fragment_138_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_138_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.x * BA_Fragment_138_CB1((uint)(3)).y + -r2.w);
  r0.x = r0.x * r0.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_138_CB1((uint)(3)).z * r2.w;
  r0.yzw = r2.www * r2.xyz + r0.yzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_138_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_138_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_138_CB1((uint)(7)).xyz + BA_Fragment_138_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_138_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_139_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_139_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, BA_Fragment_139_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_139_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_139_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_139_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_139_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_139_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_139_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_139_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_139_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_139_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_139_CB1((uint)(7)).xyz + BA_Fragment_139_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_139_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_139_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_139_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_140_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_140_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_140_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_140_CB1((uint)(3)).x + r0.w;
  r0.xyzw = BA_Fragment_140_CB1((uint)(0)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_140_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = r1.y * 0.769999981 + r1.x;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_140_CB0((uint)(127)).xyz * r1.xxx;
  r1.x = 1 + -r1.y;
  r1.y = -v4.w + r1.z;
  r1.y = saturate(-20 * r1.y);
  r3.xyz = -BA_Fragment_140_CB0((uint)(127)).xyz + v4.xyz;
  r1.yzw = r1.yyy * r3.xyz + BA_Fragment_140_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_140_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.x * BA_Fragment_140_CB1((uint)(3)).y + -r2.w);
  r1.x = r1.x * r1.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_140_CB1((uint)(3)).z * r2.w;
  r1.yzw = r2.www * r2.xyz + r1.yzw;
  r0.xyz = r1.yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = BA_Fragment_140_CB0((uint)(129)).xxx * r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_140_CB1((uint)(7)).xyz + BA_Fragment_140_CB1((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_140_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_140_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_140_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_141_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_141_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, BA_Fragment_141_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_141_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_141_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_141_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_141_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_141_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_141_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_141_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_141_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_141_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_141_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_141_CB1((uint)(7)).xyz + BA_Fragment_141_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_141_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_141_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_141_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_142_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_142_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_142_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_142_CB1((uint)(3)).x + r0.w;
  r0.xyzw = BA_Fragment_142_CB1((uint)(0)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_142_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = r1.y * 0.769999981 + r1.x;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_142_CB0((uint)(127)).xyz * r1.xxx;
  r1.x = 1 + -r1.y;
  r1.y = -v4.w + r1.z;
  r1.y = saturate(-20 * r1.y);
  r3.xyz = -BA_Fragment_142_CB0((uint)(127)).xyz + v4.xyz;
  r1.yzw = r1.yyy * r3.xyz + BA_Fragment_142_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_142_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.x * BA_Fragment_142_CB1((uint)(3)).y + -r2.w);
  r1.x = r1.x * r1.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_142_CB1((uint)(3)).z * r2.w;
  r1.yzw = r2.www * r2.xyz + r1.yzw;
  r0.xyz = r1.yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = BA_Fragment_142_CB0((uint)(129)).xxx * r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_142_CB1((uint)(4)).y * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_142_CB1((uint)(7)).xyz + BA_Fragment_142_CB1((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_142_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_142_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_142_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_143_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_143_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_143_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_143_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_143_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_143_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_143_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_143_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_143_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_143_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_143_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_143_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_143_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_143_CB1((uint)(7)).xyz + BA_Fragment_143_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_143_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_143_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_143_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_144_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_144_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_144_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_144_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_144_CB1((uint)(3)).x + r1.w;
  r1.xyzw = BA_Fragment_144_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_144_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_144_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r3.xyz = -BA_Fragment_144_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r3.xyz + BA_Fragment_144_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_144_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.x * BA_Fragment_144_CB1((uint)(3)).y + -r2.w);
  r0.x = r0.x * r0.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_144_CB1((uint)(3)).z * r2.w;
  r0.yzw = r2.www * r2.xyz + r0.yzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_144_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_144_CB1((uint)(7)).xyz + BA_Fragment_144_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_144_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_144_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_144_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_145_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_145_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_145_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_145_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_145_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_145_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_145_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_145_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_145_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_145_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_145_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_145_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_145_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_145_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_145_CB1((uint)(7)).xyz + BA_Fragment_145_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_145_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_145_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_145_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_146_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_146_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_146_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_146_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_146_CB1((uint)(3)).x + r1.w;
  r1.xyzw = BA_Fragment_146_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_146_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_146_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r3.xyz = -BA_Fragment_146_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r3.xyz + BA_Fragment_146_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_146_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.x * BA_Fragment_146_CB1((uint)(3)).y + -r2.w);
  r0.x = r0.x * r0.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_146_CB1((uint)(3)).z * r2.w;
  r0.yzw = r2.www * r2.xyz + r0.yzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_146_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_146_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_146_CB1((uint)(7)).xyz + BA_Fragment_146_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_146_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_146_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_146_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_147_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_147_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, BA_Fragment_147_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_147_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_147_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_147_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_147_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_147_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_147_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_147_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_147_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_147_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_147_CB1((uint)(7)).xyz + BA_Fragment_147_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_147_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_147_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_147_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_148_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_148_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_148_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_148_CB1((uint)(3)).x + r0.w;
  r0.xyzw = BA_Fragment_148_CB1((uint)(0)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_148_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = r1.y * 0.769999981 + r1.x;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_148_CB0((uint)(127)).xyz * r1.xxx;
  r1.x = 1 + -r1.y;
  r1.y = -v4.w + r1.z;
  r1.y = saturate(-20 * r1.y);
  r3.xyz = -BA_Fragment_148_CB0((uint)(127)).xyz + v4.xyz;
  r1.yzw = r1.yyy * r3.xyz + BA_Fragment_148_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_148_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.x * BA_Fragment_148_CB1((uint)(3)).y + -r2.w);
  r1.x = r1.x * r1.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_148_CB1((uint)(3)).z * r2.w;
  r1.yzw = r2.www * r2.xyz + r1.yzw;
  r0.xyz = r1.yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = BA_Fragment_148_CB0((uint)(129)).xxx * r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_148_CB1((uint)(7)).xyz + BA_Fragment_148_CB1((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_148_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_148_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_148_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_149_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_149_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, BA_Fragment_149_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_149_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_149_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_149_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_149_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_149_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_149_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_149_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_149_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_149_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_149_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_149_CB1((uint)(7)).xyz + BA_Fragment_149_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_149_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_149_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_149_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_150_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_150_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_150_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_150_CB1((uint)(3)).x + r0.w;
  r0.xyzw = BA_Fragment_150_CB1((uint)(0)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_150_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = r1.y * 0.769999981 + r1.x;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_150_CB0((uint)(127)).xyz * r1.xxx;
  r1.x = 1 + -r1.y;
  r1.y = -v4.w + r1.z;
  r1.y = saturate(-20 * r1.y);
  r3.xyz = -BA_Fragment_150_CB0((uint)(127)).xyz + v4.xyz;
  r1.yzw = r1.yyy * r3.xyz + BA_Fragment_150_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_150_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.x * BA_Fragment_150_CB1((uint)(3)).y + -r2.w);
  r1.x = r1.x * r1.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_150_CB1((uint)(3)).z * r2.w;
  r1.yzw = r2.www * r2.xyz + r1.yzw;
  r0.xyz = r1.yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = BA_Fragment_150_CB0((uint)(129)).xxx * r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_150_CB1((uint)(4)).y * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_150_CB1((uint)(7)).xyz + BA_Fragment_150_CB1((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_150_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_150_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_150_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_151_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_151_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_151_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_151_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_151_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_151_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_151_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_151_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_151_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_151_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_151_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_151_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_151_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_151_CB1((uint)(7)).xyz + BA_Fragment_151_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_151_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_151_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_151_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_152_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_152_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_152_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_152_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_152_CB1((uint)(3)).x + r1.w;
  r1.xyzw = BA_Fragment_152_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_152_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_152_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r3.xyz = -BA_Fragment_152_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r3.xyz + BA_Fragment_152_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_152_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.x * BA_Fragment_152_CB1((uint)(3)).y + -r2.w);
  r0.x = r0.x * r0.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_152_CB1((uint)(3)).z * r2.w;
  r0.yzw = r2.www * r2.xyz + r0.yzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_152_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_152_CB1((uint)(7)).xyz + BA_Fragment_152_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_152_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_152_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_152_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_153_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_153_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_153_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_153_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_153_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_153_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_153_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_153_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_153_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_153_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_153_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_153_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_153_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_153_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_153_CB1((uint)(7)).xyz + BA_Fragment_153_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_153_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_153_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_153_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_154_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_154_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_154_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_154_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_154_CB1((uint)(3)).x + r1.w;
  r1.xyzw = BA_Fragment_154_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_154_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_154_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r3.xyz = -BA_Fragment_154_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r3.xyz + BA_Fragment_154_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_154_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.x * BA_Fragment_154_CB1((uint)(3)).y + -r2.w);
  r0.x = r0.x * r0.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_154_CB1((uint)(3)).z * r2.w;
  r0.yzw = r2.www * r2.xyz + r0.yzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_154_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_154_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_154_CB1((uint)(7)).xyz + BA_Fragment_154_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_154_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_154_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_154_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_155_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_155_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_155_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_155_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_155_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_155_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_155_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_155_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_155_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_155_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_155_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_155_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_155_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_155_CB2((uint)(11)).y, BA_Fragment_155_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_155_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_155_CB1((uint)(r1.w+0)).www + BA_Fragment_155_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_155_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_155_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_155_CB1((uint)(r1.w+512)).z + BA_Fragment_155_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_155_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_155_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_155_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_155_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_155_CB3((uint)(7)).xyz + BA_Fragment_155_CB3((uint)(6)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_155_CB3((uint)(8)).xyz + r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_156_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_156_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_156_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_156_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_156_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_156_CB3((uint)(3)).x + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_156_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_156_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_156_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_156_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_156_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_156_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_156_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_156_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_156_CB2((uint)(11)).y, BA_Fragment_156_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_156_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_156_CB1((uint)(r1.w+0)).www + BA_Fragment_156_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_156_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_156_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_156_CB1((uint)(r1.w+512)).z + BA_Fragment_156_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_156_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_156_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_156_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_156_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_156_CB3((uint)(7)).xyz + BA_Fragment_156_CB3((uint)(6)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_156_CB3((uint)(8)).xyz + r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_157_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_157_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_157_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_157_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_157_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_157_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_157_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_157_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_157_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_157_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_157_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_157_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_157_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_157_CB2((uint)(11)).y, BA_Fragment_157_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_157_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_157_CB1((uint)(r1.w+0)).www + BA_Fragment_157_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_157_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_157_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_157_CB1((uint)(r1.w+512)).z + BA_Fragment_157_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_157_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_157_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_157_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_157_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_157_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_157_CB3((uint)(7)).xyz + BA_Fragment_157_CB3((uint)(6)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_157_CB3((uint)(8)).xyz + r1.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_158_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_158_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_158_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_158_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_158_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_158_CB3((uint)(3)).x + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_158_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_158_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_158_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_158_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_158_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_158_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_158_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_158_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_158_CB2((uint)(11)).y, BA_Fragment_158_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_158_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_158_CB1((uint)(r1.w+0)).www + BA_Fragment_158_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_158_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_158_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_158_CB1((uint)(r1.w+512)).z + BA_Fragment_158_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_158_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_158_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_158_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_158_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_158_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_158_CB3((uint)(7)).xyz + BA_Fragment_158_CB3((uint)(6)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_158_CB3((uint)(8)).xyz + r1.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_159_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_159_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_159_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_159_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_159_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_159_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_159_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_159_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_159_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_159_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_159_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_159_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_159_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_159_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_159_CB2((uint)(11)).y, BA_Fragment_159_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_159_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_159_CB1((uint)(r1.z+0)).www + BA_Fragment_159_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_159_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_159_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_159_CB1((uint)(r1.z+512)).z + BA_Fragment_159_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_159_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_159_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_159_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_159_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_159_CB3((uint)(7)).xyz + BA_Fragment_159_CB3((uint)(6)).xyz;
  o0.xyz = r0.zzz * BA_Fragment_159_CB3((uint)(8)).xyz + r0.xyw;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_160_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_160_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_160_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_160_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_160_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_160_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_160_CB3((uint)(3)).x + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_160_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_160_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_160_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_160_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_160_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_160_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_160_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_160_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_160_CB2((uint)(11)).y, BA_Fragment_160_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_160_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_160_CB1((uint)(r1.z+0)).www + BA_Fragment_160_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_160_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_160_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_160_CB1((uint)(r1.z+512)).z + BA_Fragment_160_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_160_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_160_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_160_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_160_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_160_CB3((uint)(7)).xyz + BA_Fragment_160_CB3((uint)(6)).xyz;
  o0.xyz = r0.zzz * BA_Fragment_160_CB3((uint)(8)).xyz + r0.xyw;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_161_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_161_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_161_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_161_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_161_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_161_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_161_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_161_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_161_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_161_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_161_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_161_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_161_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_161_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_161_CB2((uint)(11)).y, BA_Fragment_161_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_161_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_161_CB1((uint)(r1.z+0)).www + BA_Fragment_161_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_161_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_161_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_161_CB1((uint)(r1.z+512)).z + BA_Fragment_161_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_161_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_161_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_161_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_161_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_161_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_161_CB3((uint)(7)).xyz + BA_Fragment_161_CB3((uint)(6)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_161_CB3((uint)(8)).xyz + r0.xzw;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_162_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_162_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_162_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_162_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_162_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_162_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_162_CB3((uint)(3)).x + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_162_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_162_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_162_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_162_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_162_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_162_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_162_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_162_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_162_CB2((uint)(11)).y, BA_Fragment_162_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_162_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_162_CB1((uint)(r1.z+0)).www + BA_Fragment_162_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_162_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_162_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_162_CB1((uint)(r1.z+512)).z + BA_Fragment_162_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_162_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_162_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_162_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_162_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_162_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_162_CB3((uint)(7)).xyz + BA_Fragment_162_CB3((uint)(6)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_162_CB3((uint)(8)).xyz + r0.xzw;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_163_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_163_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_163_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_163_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_163_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_163_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_163_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_163_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_163_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_163_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_163_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_163_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_163_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_163_CB2((uint)(11)).y, BA_Fragment_163_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_163_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_163_CB1((uint)(r1.w+0)).www + BA_Fragment_163_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_163_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_163_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_163_CB1((uint)(r1.w+512)).z + BA_Fragment_163_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_163_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_163_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_163_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_163_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_163_CB3((uint)(7)).xyz + BA_Fragment_163_CB3((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_163_CB3((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_163_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_163_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_164_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_164_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_164_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_164_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_164_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_164_CB3((uint)(3)).x + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_164_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_164_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_164_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_164_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_164_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_164_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_164_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_164_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_164_CB2((uint)(11)).y, BA_Fragment_164_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_164_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_164_CB1((uint)(r1.w+0)).www + BA_Fragment_164_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_164_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_164_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_164_CB1((uint)(r1.w+512)).z + BA_Fragment_164_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_164_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_164_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_164_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_164_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_164_CB3((uint)(7)).xyz + BA_Fragment_164_CB3((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_164_CB3((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_164_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_164_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_165_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_165_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_165_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_165_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_165_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_165_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_165_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_165_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_165_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_165_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_165_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_165_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_165_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_165_CB2((uint)(11)).y, BA_Fragment_165_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_165_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_165_CB1((uint)(r1.w+0)).www + BA_Fragment_165_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_165_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_165_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_165_CB1((uint)(r1.w+512)).z + BA_Fragment_165_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_165_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_165_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_165_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_165_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_165_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_165_CB3((uint)(7)).xyz + BA_Fragment_165_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_165_CB3((uint)(8)).xyz + r1.xyz;
  r0.xyz = -BA_Fragment_165_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_165_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_166_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_166_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_166_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_166_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_166_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_166_CB3((uint)(3)).x + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_166_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_166_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_166_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_166_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_166_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_166_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_166_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_166_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_166_CB2((uint)(11)).y, BA_Fragment_166_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_166_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_166_CB1((uint)(r1.w+0)).www + BA_Fragment_166_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_166_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_166_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_166_CB1((uint)(r1.w+512)).z + BA_Fragment_166_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_166_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_166_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_166_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_166_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_166_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_166_CB3((uint)(7)).xyz + BA_Fragment_166_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_166_CB3((uint)(8)).xyz + r1.xyz;
  r0.xyz = -BA_Fragment_166_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_166_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_167_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_167_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_167_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_167_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_167_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_167_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_167_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_167_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_167_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_167_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_167_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_167_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_167_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_167_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_167_CB2((uint)(11)).y, BA_Fragment_167_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_167_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_167_CB1((uint)(r1.z+0)).www + BA_Fragment_167_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_167_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_167_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_167_CB1((uint)(r1.z+512)).z + BA_Fragment_167_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_167_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_167_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_167_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_167_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_167_CB3((uint)(7)).xyz + BA_Fragment_167_CB3((uint)(6)).xyz;
  r0.xyz = r0.zzz * BA_Fragment_167_CB3((uint)(8)).xyz + r0.xyw;
  r0.xyz = -BA_Fragment_167_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_167_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_168_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_168_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_168_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_168_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_168_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_168_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_168_CB3((uint)(3)).x + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_168_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_168_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_168_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_168_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_168_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_168_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_168_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_168_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_168_CB2((uint)(11)).y, BA_Fragment_168_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_168_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_168_CB1((uint)(r1.z+0)).www + BA_Fragment_168_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_168_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_168_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_168_CB1((uint)(r1.z+512)).z + BA_Fragment_168_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_168_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_168_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_168_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_168_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_168_CB3((uint)(7)).xyz + BA_Fragment_168_CB3((uint)(6)).xyz;
  r0.xyz = r0.zzz * BA_Fragment_168_CB3((uint)(8)).xyz + r0.xyw;
  r0.xyz = -BA_Fragment_168_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_168_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_169_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_169_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_169_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_169_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_169_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_169_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_169_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_169_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_169_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_169_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_169_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_169_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_169_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_169_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_169_CB2((uint)(11)).y, BA_Fragment_169_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_169_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_169_CB1((uint)(r1.z+0)).www + BA_Fragment_169_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_169_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_169_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_169_CB1((uint)(r1.z+512)).z + BA_Fragment_169_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_169_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_169_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_169_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_169_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_169_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_169_CB3((uint)(7)).xyz + BA_Fragment_169_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_169_CB3((uint)(8)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_169_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_169_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_170_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_170_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_170_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_170_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_170_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_170_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_170_CB3((uint)(3)).x + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_170_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_170_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_170_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_170_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_170_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_170_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_170_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_170_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_170_CB2((uint)(11)).y, BA_Fragment_170_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_170_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_170_CB1((uint)(r1.z+0)).www + BA_Fragment_170_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_170_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_170_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_170_CB1((uint)(r1.z+512)).z + BA_Fragment_170_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_170_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_170_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_170_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_170_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_170_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_170_CB3((uint)(7)).xyz + BA_Fragment_170_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_170_CB3((uint)(8)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_170_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_170_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_171_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_171_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_171_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_171_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_171_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_171_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_171_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_171_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_171_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_171_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_171_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_171_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_171_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_171_CB2((uint)(11)).y, BA_Fragment_171_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_171_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_171_CB1((uint)(r1.w+0)).www + BA_Fragment_171_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_171_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_171_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_171_CB1((uint)(r1.w+512)).z + BA_Fragment_171_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_171_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_171_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_171_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_171_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_171_CB3((uint)(7)).xyz + BA_Fragment_171_CB3((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_171_CB3((uint)(8)).xyz + r0.xyz;
  r1.x = exp2(-v3.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_171_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_171_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_172_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_172_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_172_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_172_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_172_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_172_CB3((uint)(3)).x + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_172_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_172_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_172_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_172_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_172_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_172_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_172_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_172_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_172_CB2((uint)(11)).y, BA_Fragment_172_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_172_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_172_CB1((uint)(r1.w+0)).www + BA_Fragment_172_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_172_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_172_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_172_CB1((uint)(r1.w+512)).z + BA_Fragment_172_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_172_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_172_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_172_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_172_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_172_CB3((uint)(7)).xyz + BA_Fragment_172_CB3((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_172_CB3((uint)(8)).xyz + r0.xyz;
  r1.x = exp2(-v3.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_172_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_172_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_173_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_173_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_173_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_173_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_173_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_173_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_173_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_173_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_173_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_173_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_173_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_173_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_173_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_173_CB2((uint)(11)).y, BA_Fragment_173_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_173_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_173_CB1((uint)(r1.w+0)).www + BA_Fragment_173_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_173_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_173_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_173_CB1((uint)(r1.w+512)).z + BA_Fragment_173_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_173_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_173_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_173_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_173_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_173_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_173_CB3((uint)(7)).xyz + BA_Fragment_173_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_173_CB3((uint)(8)).xyz + r1.xyz;
  r1.x = exp2(-v3.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_173_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_173_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_174_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_174_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_174_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_174_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_174_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_174_CB3((uint)(3)).x + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_174_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_174_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_174_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_174_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_174_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_174_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_174_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_174_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_174_CB2((uint)(11)).y, BA_Fragment_174_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_174_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_174_CB1((uint)(r1.w+0)).www + BA_Fragment_174_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_174_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_174_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_174_CB1((uint)(r1.w+512)).z + BA_Fragment_174_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_174_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_174_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_174_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_174_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_174_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_174_CB3((uint)(7)).xyz + BA_Fragment_174_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_174_CB3((uint)(8)).xyz + r1.xyz;
  r1.x = exp2(-v3.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_174_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_174_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_175_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_175_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_175_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_175_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_175_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_175_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_175_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_175_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_175_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_175_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_175_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_175_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_175_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_175_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_175_CB2((uint)(11)).y, BA_Fragment_175_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_175_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_175_CB1((uint)(r1.z+0)).www + BA_Fragment_175_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_175_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_175_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_175_CB1((uint)(r1.z+512)).z + BA_Fragment_175_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_175_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_175_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_175_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_175_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_175_CB3((uint)(7)).xyz + BA_Fragment_175_CB3((uint)(6)).xyz;
  r0.xyz = r0.zzz * BA_Fragment_175_CB3((uint)(8)).xyz + r0.xyw;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_175_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_175_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_176_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_176_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_176_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_176_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_176_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_176_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_176_CB3((uint)(3)).x + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_176_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_176_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_176_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_176_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_176_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_176_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_176_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_176_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_176_CB2((uint)(11)).y, BA_Fragment_176_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_176_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_176_CB1((uint)(r1.z+0)).www + BA_Fragment_176_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_176_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_176_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_176_CB1((uint)(r1.z+512)).z + BA_Fragment_176_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_176_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_176_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_176_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_176_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_176_CB3((uint)(7)).xyz + BA_Fragment_176_CB3((uint)(6)).xyz;
  r0.xyz = r0.zzz * BA_Fragment_176_CB3((uint)(8)).xyz + r0.xyw;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_176_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_176_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_177_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_177_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_177_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_177_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_177_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_177_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_177_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_177_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_177_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_177_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_177_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_177_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_177_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_177_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_177_CB2((uint)(11)).y, BA_Fragment_177_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_177_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_177_CB1((uint)(r1.z+0)).www + BA_Fragment_177_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_177_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_177_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_177_CB1((uint)(r1.z+512)).z + BA_Fragment_177_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_177_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_177_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_177_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_177_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_177_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_177_CB3((uint)(7)).xyz + BA_Fragment_177_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_177_CB3((uint)(8)).xyz + r0.xzw;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_177_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_177_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_178_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_178_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_178_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_178_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_178_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_178_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_178_CB3((uint)(3)).x + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_178_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_178_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_178_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_178_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_178_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_178_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_178_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_178_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_178_CB2((uint)(11)).y, BA_Fragment_178_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_178_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_178_CB1((uint)(r1.z+0)).www + BA_Fragment_178_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_178_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_178_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_178_CB1((uint)(r1.z+512)).z + BA_Fragment_178_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_178_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_178_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_178_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_178_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_178_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_178_CB3((uint)(7)).xyz + BA_Fragment_178_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_178_CB3((uint)(8)).xyz + r0.xzw;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_178_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_178_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_179_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_179_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, BA_Fragment_179_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_179_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_179_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_179_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_179_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_179_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_179_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_179_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_179_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_179_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_179_CB1((uint)(7)).xyz + BA_Fragment_179_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_179_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_180_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_180_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_180_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_180_CB1((uint)(3)).x + r0.w;
  r0.xyzw = BA_Fragment_180_CB1((uint)(0)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_180_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = r1.y * 0.769999981 + r1.x;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_180_CB0((uint)(127)).xyz * r1.xxx;
  r1.x = 1 + -r1.y;
  r1.y = -v4.w + r1.z;
  r1.y = saturate(-20 * r1.y);
  r3.xyz = -BA_Fragment_180_CB0((uint)(127)).xyz + v4.xyz;
  r1.yzw = r1.yyy * r3.xyz + BA_Fragment_180_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_180_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.x * BA_Fragment_180_CB1((uint)(3)).y + -r2.w);
  r1.x = r1.x * r1.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_180_CB1((uint)(3)).z * r2.w;
  r1.yzw = r2.www * r2.xyz + r1.yzw;
  r0.xyz = r1.yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = BA_Fragment_180_CB0((uint)(129)).xxx * r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_180_CB1((uint)(7)).xyz + BA_Fragment_180_CB1((uint)(6)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_180_CB1((uint)(8)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_181_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_181_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, BA_Fragment_181_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_181_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_181_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_181_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_181_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_181_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_181_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_181_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_181_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_181_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_181_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_181_CB1((uint)(7)).xyz + BA_Fragment_181_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_181_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_182_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_182_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_182_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_182_CB1((uint)(3)).x + r0.w;
  r0.xyzw = BA_Fragment_182_CB1((uint)(0)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_182_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = r1.y * 0.769999981 + r1.x;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_182_CB0((uint)(127)).xyz * r1.xxx;
  r1.x = 1 + -r1.y;
  r1.y = -v4.w + r1.z;
  r1.y = saturate(-20 * r1.y);
  r3.xyz = -BA_Fragment_182_CB0((uint)(127)).xyz + v4.xyz;
  r1.yzw = r1.yyy * r3.xyz + BA_Fragment_182_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_182_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.x * BA_Fragment_182_CB1((uint)(3)).y + -r2.w);
  r1.x = r1.x * r1.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_182_CB1((uint)(3)).z * r2.w;
  r1.yzw = r2.www * r2.xyz + r1.yzw;
  r0.xyz = r1.yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = BA_Fragment_182_CB0((uint)(129)).xxx * r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_182_CB1((uint)(4)).y * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_182_CB1((uint)(7)).xyz + BA_Fragment_182_CB1((uint)(6)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_182_CB1((uint)(8)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_183_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_183_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_183_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_183_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_183_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_183_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_183_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_183_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_183_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_183_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_183_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_183_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_183_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_183_CB1((uint)(7)).xyz + BA_Fragment_183_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_183_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_184_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_184_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_184_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_184_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_184_CB1((uint)(3)).x + r1.w;
  r1.xyzw = BA_Fragment_184_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_184_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_184_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r3.xyz = -BA_Fragment_184_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r3.xyz + BA_Fragment_184_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_184_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.x * BA_Fragment_184_CB1((uint)(3)).y + -r2.w);
  r0.x = r0.x * r0.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_184_CB1((uint)(3)).z * r2.w;
  r0.yzw = r2.www * r2.xyz + r0.yzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_184_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_184_CB1((uint)(7)).xyz + BA_Fragment_184_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_184_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_185_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_185_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_185_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_185_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_185_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_185_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_185_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_185_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_185_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_185_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_185_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_185_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_185_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_185_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_185_CB1((uint)(7)).xyz + BA_Fragment_185_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_185_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_186_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_186_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_186_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_186_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_186_CB1((uint)(3)).x + r1.w;
  r1.xyzw = BA_Fragment_186_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_186_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_186_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r3.xyz = -BA_Fragment_186_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r3.xyz + BA_Fragment_186_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_186_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.x * BA_Fragment_186_CB1((uint)(3)).y + -r2.w);
  r0.x = r0.x * r0.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_186_CB1((uint)(3)).z * r2.w;
  r0.yzw = r2.www * r2.xyz + r0.yzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_186_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_186_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_186_CB1((uint)(7)).xyz + BA_Fragment_186_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_186_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_187_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_187_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, BA_Fragment_187_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_187_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_187_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_187_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_187_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_187_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_187_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_187_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_187_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_187_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_187_CB1((uint)(7)).xyz + BA_Fragment_187_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_187_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_187_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_187_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_188_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_188_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_188_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_188_CB1((uint)(3)).x + r0.w;
  r0.xyzw = BA_Fragment_188_CB1((uint)(0)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_188_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = r1.y * 0.769999981 + r1.x;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_188_CB0((uint)(127)).xyz * r1.xxx;
  r1.x = 1 + -r1.y;
  r1.y = -v4.w + r1.z;
  r1.y = saturate(-20 * r1.y);
  r3.xyz = -BA_Fragment_188_CB0((uint)(127)).xyz + v4.xyz;
  r1.yzw = r1.yyy * r3.xyz + BA_Fragment_188_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_188_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.x * BA_Fragment_188_CB1((uint)(3)).y + -r2.w);
  r1.x = r1.x * r1.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_188_CB1((uint)(3)).z * r2.w;
  r1.yzw = r2.www * r2.xyz + r1.yzw;
  r0.xyz = r1.yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = BA_Fragment_188_CB0((uint)(129)).xxx * r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_188_CB1((uint)(7)).xyz + BA_Fragment_188_CB1((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_188_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_188_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_188_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_189_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_189_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, BA_Fragment_189_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_189_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_189_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_189_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_189_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_189_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_189_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_189_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_189_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_189_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_189_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_189_CB1((uint)(7)).xyz + BA_Fragment_189_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_189_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_189_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_189_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_190_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_190_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_190_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_190_CB1((uint)(3)).x + r0.w;
  r0.xyzw = BA_Fragment_190_CB1((uint)(0)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_190_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = r1.y * 0.769999981 + r1.x;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_190_CB0((uint)(127)).xyz * r1.xxx;
  r1.x = 1 + -r1.y;
  r1.y = -v4.w + r1.z;
  r1.y = saturate(-20 * r1.y);
  r3.xyz = -BA_Fragment_190_CB0((uint)(127)).xyz + v4.xyz;
  r1.yzw = r1.yyy * r3.xyz + BA_Fragment_190_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_190_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.x * BA_Fragment_190_CB1((uint)(3)).y + -r2.w);
  r1.x = r1.x * r1.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_190_CB1((uint)(3)).z * r2.w;
  r1.yzw = r2.www * r2.xyz + r1.yzw;
  r0.xyz = r1.yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = BA_Fragment_190_CB0((uint)(129)).xxx * r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_190_CB1((uint)(4)).y * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_190_CB1((uint)(7)).xyz + BA_Fragment_190_CB1((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_190_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_190_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_190_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_191_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_191_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_191_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_191_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_191_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_191_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_191_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_191_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_191_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_191_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_191_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_191_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_191_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_191_CB1((uint)(7)).xyz + BA_Fragment_191_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_191_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_191_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_191_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_192_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_192_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_192_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_192_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_192_CB1((uint)(3)).x + r1.w;
  r1.xyzw = BA_Fragment_192_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_192_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_192_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r3.xyz = -BA_Fragment_192_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r3.xyz + BA_Fragment_192_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_192_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.x * BA_Fragment_192_CB1((uint)(3)).y + -r2.w);
  r0.x = r0.x * r0.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_192_CB1((uint)(3)).z * r2.w;
  r0.yzw = r2.www * r2.xyz + r0.yzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_192_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_192_CB1((uint)(7)).xyz + BA_Fragment_192_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_192_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_192_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_192_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_193_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_193_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_193_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_193_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_193_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_193_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_193_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_193_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_193_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_193_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_193_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_193_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_193_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_193_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_193_CB1((uint)(7)).xyz + BA_Fragment_193_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_193_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_193_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_193_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_194_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_194_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_194_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_194_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_194_CB1((uint)(3)).x + r1.w;
  r1.xyzw = BA_Fragment_194_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_194_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_194_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r3.xyz = -BA_Fragment_194_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r3.xyz + BA_Fragment_194_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_194_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.x * BA_Fragment_194_CB1((uint)(3)).y + -r2.w);
  r0.x = r0.x * r0.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_194_CB1((uint)(3)).z * r2.w;
  r0.yzw = r2.www * r2.xyz + r0.yzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_194_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_194_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_194_CB1((uint)(7)).xyz + BA_Fragment_194_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_194_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_194_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_194_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_195_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_195_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, BA_Fragment_195_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_195_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_195_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_195_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_195_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_195_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_195_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_195_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_195_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_195_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_195_CB1((uint)(7)).xyz + BA_Fragment_195_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_195_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_195_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_195_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_196_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_196_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_196_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_196_CB1((uint)(3)).x + r0.w;
  r0.xyzw = BA_Fragment_196_CB1((uint)(0)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_196_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = r1.y * 0.769999981 + r1.x;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_196_CB0((uint)(127)).xyz * r1.xxx;
  r1.x = 1 + -r1.y;
  r1.y = -v4.w + r1.z;
  r1.y = saturate(-20 * r1.y);
  r3.xyz = -BA_Fragment_196_CB0((uint)(127)).xyz + v4.xyz;
  r1.yzw = r1.yyy * r3.xyz + BA_Fragment_196_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_196_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.x * BA_Fragment_196_CB1((uint)(3)).y + -r2.w);
  r1.x = r1.x * r1.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_196_CB1((uint)(3)).z * r2.w;
  r1.yzw = r2.www * r2.xyz + r1.yzw;
  r0.xyz = r1.yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = BA_Fragment_196_CB0((uint)(129)).xxx * r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_196_CB1((uint)(7)).xyz + BA_Fragment_196_CB1((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_196_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_196_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_196_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_197_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_197_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, BA_Fragment_197_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_197_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_197_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_197_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_197_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_197_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_197_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_197_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_197_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_197_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_197_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_197_CB1((uint)(7)).xyz + BA_Fragment_197_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_197_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_197_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_197_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_198_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_198_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_198_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_198_CB1((uint)(3)).x + r0.w;
  r0.xyzw = BA_Fragment_198_CB1((uint)(0)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_198_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = r1.y * 0.769999981 + r1.x;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_198_CB0((uint)(127)).xyz * r1.xxx;
  r1.x = 1 + -r1.y;
  r1.y = -v4.w + r1.z;
  r1.y = saturate(-20 * r1.y);
  r3.xyz = -BA_Fragment_198_CB0((uint)(127)).xyz + v4.xyz;
  r1.yzw = r1.yyy * r3.xyz + BA_Fragment_198_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_198_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.x * BA_Fragment_198_CB1((uint)(3)).y + -r2.w);
  r1.x = r1.x * r1.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_198_CB1((uint)(3)).z * r2.w;
  r1.yzw = r2.www * r2.xyz + r1.yzw;
  r0.xyz = r1.yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = BA_Fragment_198_CB0((uint)(129)).xxx * r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_198_CB1((uint)(4)).y * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_198_CB1((uint)(7)).xyz + BA_Fragment_198_CB1((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_198_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_198_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_198_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_199_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_199_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_199_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_199_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_199_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_199_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_199_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_199_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_199_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_199_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_199_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_199_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_199_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_199_CB1((uint)(7)).xyz + BA_Fragment_199_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_199_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_199_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_199_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_200_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_200_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_200_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_200_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_200_CB1((uint)(3)).x + r1.w;
  r1.xyzw = BA_Fragment_200_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_200_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_200_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r3.xyz = -BA_Fragment_200_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r3.xyz + BA_Fragment_200_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_200_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.x * BA_Fragment_200_CB1((uint)(3)).y + -r2.w);
  r0.x = r0.x * r0.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_200_CB1((uint)(3)).z * r2.w;
  r0.yzw = r2.www * r2.xyz + r0.yzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_200_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_200_CB1((uint)(7)).xyz + BA_Fragment_200_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_200_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_200_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_200_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_201_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_201_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_201_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_201_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_201_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_201_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_201_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_201_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_201_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_201_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_201_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_201_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_201_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_201_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_201_CB1((uint)(7)).xyz + BA_Fragment_201_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_201_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_201_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_201_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_202_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_202_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_202_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_202_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_202_CB1((uint)(3)).x + r1.w;
  r1.xyzw = BA_Fragment_202_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_202_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r2.xyz = BA_Fragment_202_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r3.xyz = -BA_Fragment_202_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r3.xyz + BA_Fragment_202_CB0((uint)(127)).xyz;
  r2.w = -1 + BA_Fragment_202_CB1((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.x * BA_Fragment_202_CB1((uint)(3)).y + -r2.w);
  r0.x = r0.x * r0.x;
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_202_CB1((uint)(3)).z * r2.w;
  r0.yzw = r2.www * r2.xyz + r0.yzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_202_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_202_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_202_CB1((uint)(7)).xyz + BA_Fragment_202_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_202_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_202_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_202_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_203_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_203_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_203_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_203_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_203_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_203_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_203_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_203_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_203_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_203_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_203_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_203_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_203_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_203_CB2((uint)(11)).y, BA_Fragment_203_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_203_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_203_CB1((uint)(r1.w+0)).www + BA_Fragment_203_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_203_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_203_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_203_CB1((uint)(r1.w+512)).z + BA_Fragment_203_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_203_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_203_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_203_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_203_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_203_CB3((uint)(7)).xyz + BA_Fragment_203_CB3((uint)(6)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_203_CB3((uint)(8)).xyz + r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_204_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_204_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_204_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_204_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_204_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_204_CB3((uint)(3)).x + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_204_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_204_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_204_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_204_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_204_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_204_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_204_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_204_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_204_CB2((uint)(11)).y, BA_Fragment_204_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_204_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_204_CB1((uint)(r1.w+0)).www + BA_Fragment_204_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_204_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_204_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_204_CB1((uint)(r1.w+512)).z + BA_Fragment_204_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_204_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_204_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_204_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_204_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_204_CB3((uint)(7)).xyz + BA_Fragment_204_CB3((uint)(6)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_204_CB3((uint)(8)).xyz + r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_205_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_205_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_205_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_205_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_205_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_205_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_205_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_205_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_205_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_205_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_205_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_205_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_205_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_205_CB2((uint)(11)).y, BA_Fragment_205_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_205_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_205_CB1((uint)(r1.w+0)).www + BA_Fragment_205_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_205_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_205_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_205_CB1((uint)(r1.w+512)).z + BA_Fragment_205_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_205_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_205_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_205_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_205_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_205_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_205_CB3((uint)(7)).xyz + BA_Fragment_205_CB3((uint)(6)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_205_CB3((uint)(8)).xyz + r1.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_206_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_206_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_206_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_206_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_206_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_206_CB3((uint)(3)).x + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_206_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_206_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_206_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_206_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_206_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_206_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_206_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_206_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_206_CB2((uint)(11)).y, BA_Fragment_206_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_206_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_206_CB1((uint)(r1.w+0)).www + BA_Fragment_206_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_206_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_206_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_206_CB1((uint)(r1.w+512)).z + BA_Fragment_206_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_206_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_206_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_206_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_206_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_206_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_206_CB3((uint)(7)).xyz + BA_Fragment_206_CB3((uint)(6)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_206_CB3((uint)(8)).xyz + r1.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_207_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_207_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_207_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_207_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_207_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_207_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_207_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_207_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_207_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_207_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_207_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_207_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_207_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_207_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_207_CB2((uint)(11)).y, BA_Fragment_207_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_207_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_207_CB1((uint)(r1.z+0)).www + BA_Fragment_207_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_207_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_207_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_207_CB1((uint)(r1.z+512)).z + BA_Fragment_207_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_207_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_207_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_207_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_207_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_207_CB3((uint)(7)).xyz + BA_Fragment_207_CB3((uint)(6)).xyz;
  o0.xyz = r0.zzz * BA_Fragment_207_CB3((uint)(8)).xyz + r0.xyw;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_208_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_208_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_208_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_208_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_208_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_208_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_208_CB3((uint)(3)).x + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_208_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_208_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_208_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_208_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_208_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_208_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_208_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_208_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_208_CB2((uint)(11)).y, BA_Fragment_208_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_208_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_208_CB1((uint)(r1.z+0)).www + BA_Fragment_208_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_208_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_208_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_208_CB1((uint)(r1.z+512)).z + BA_Fragment_208_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_208_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_208_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_208_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_208_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_208_CB3((uint)(7)).xyz + BA_Fragment_208_CB3((uint)(6)).xyz;
  o0.xyz = r0.zzz * BA_Fragment_208_CB3((uint)(8)).xyz + r0.xyw;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_209_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_209_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_209_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_209_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_209_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_209_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_209_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_209_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_209_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_209_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_209_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_209_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_209_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_209_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_209_CB2((uint)(11)).y, BA_Fragment_209_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_209_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_209_CB1((uint)(r1.z+0)).www + BA_Fragment_209_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_209_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_209_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_209_CB1((uint)(r1.z+512)).z + BA_Fragment_209_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_209_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_209_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_209_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_209_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_209_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_209_CB3((uint)(7)).xyz + BA_Fragment_209_CB3((uint)(6)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_209_CB3((uint)(8)).xyz + r0.xzw;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_210_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_210_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_210_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_210_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_210_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_210_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_210_CB3((uint)(3)).x + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_210_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_210_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_210_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_210_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_210_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_210_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_210_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_210_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_210_CB2((uint)(11)).y, BA_Fragment_210_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_210_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_210_CB1((uint)(r1.z+0)).www + BA_Fragment_210_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_210_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_210_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_210_CB1((uint)(r1.z+512)).z + BA_Fragment_210_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_210_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_210_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_210_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_210_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_210_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_210_CB3((uint)(7)).xyz + BA_Fragment_210_CB3((uint)(6)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_210_CB3((uint)(8)).xyz + r0.xzw;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_211_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_211_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_211_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_211_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_211_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_211_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_211_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_211_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_211_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_211_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_211_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_211_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_211_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_211_CB2((uint)(11)).y, BA_Fragment_211_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_211_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_211_CB1((uint)(r1.w+0)).www + BA_Fragment_211_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_211_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_211_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_211_CB1((uint)(r1.w+512)).z + BA_Fragment_211_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_211_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_211_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_211_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_211_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_211_CB3((uint)(7)).xyz + BA_Fragment_211_CB3((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_211_CB3((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_211_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_211_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_212_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_212_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_212_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_212_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_212_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_212_CB3((uint)(3)).x + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_212_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_212_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_212_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_212_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_212_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_212_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_212_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_212_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_212_CB2((uint)(11)).y, BA_Fragment_212_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_212_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_212_CB1((uint)(r1.w+0)).www + BA_Fragment_212_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_212_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_212_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_212_CB1((uint)(r1.w+512)).z + BA_Fragment_212_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_212_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_212_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_212_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_212_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_212_CB3((uint)(7)).xyz + BA_Fragment_212_CB3((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_212_CB3((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_212_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_212_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_213_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_213_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_213_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_213_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_213_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_213_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_213_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_213_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_213_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_213_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_213_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_213_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_213_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_213_CB2((uint)(11)).y, BA_Fragment_213_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_213_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_213_CB1((uint)(r1.w+0)).www + BA_Fragment_213_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_213_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_213_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_213_CB1((uint)(r1.w+512)).z + BA_Fragment_213_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_213_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_213_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_213_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_213_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_213_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_213_CB3((uint)(7)).xyz + BA_Fragment_213_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_213_CB3((uint)(8)).xyz + r1.xyz;
  r0.xyz = -BA_Fragment_213_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_213_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_214_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_214_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_214_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_214_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_214_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_214_CB3((uint)(3)).x + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_214_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_214_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_214_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_214_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_214_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_214_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_214_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_214_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_214_CB2((uint)(11)).y, BA_Fragment_214_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_214_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_214_CB1((uint)(r1.w+0)).www + BA_Fragment_214_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_214_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_214_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_214_CB1((uint)(r1.w+512)).z + BA_Fragment_214_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_214_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_214_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_214_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_214_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_214_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_214_CB3((uint)(7)).xyz + BA_Fragment_214_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_214_CB3((uint)(8)).xyz + r1.xyz;
  r0.xyz = -BA_Fragment_214_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_214_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_215_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_215_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_215_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_215_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_215_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_215_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_215_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_215_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_215_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_215_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_215_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_215_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_215_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_215_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_215_CB2((uint)(11)).y, BA_Fragment_215_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_215_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_215_CB1((uint)(r1.z+0)).www + BA_Fragment_215_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_215_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_215_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_215_CB1((uint)(r1.z+512)).z + BA_Fragment_215_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_215_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_215_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_215_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_215_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_215_CB3((uint)(7)).xyz + BA_Fragment_215_CB3((uint)(6)).xyz;
  r0.xyz = r0.zzz * BA_Fragment_215_CB3((uint)(8)).xyz + r0.xyw;
  r0.xyz = -BA_Fragment_215_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_215_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_216_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_216_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_216_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_216_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_216_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_216_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_216_CB3((uint)(3)).x + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_216_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_216_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_216_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_216_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_216_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_216_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_216_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_216_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_216_CB2((uint)(11)).y, BA_Fragment_216_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_216_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_216_CB1((uint)(r1.z+0)).www + BA_Fragment_216_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_216_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_216_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_216_CB1((uint)(r1.z+512)).z + BA_Fragment_216_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_216_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_216_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_216_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_216_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_216_CB3((uint)(7)).xyz + BA_Fragment_216_CB3((uint)(6)).xyz;
  r0.xyz = r0.zzz * BA_Fragment_216_CB3((uint)(8)).xyz + r0.xyw;
  r0.xyz = -BA_Fragment_216_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_216_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_217_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_217_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_217_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_217_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_217_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_217_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_217_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_217_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_217_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_217_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_217_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_217_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_217_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_217_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_217_CB2((uint)(11)).y, BA_Fragment_217_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_217_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_217_CB1((uint)(r1.z+0)).www + BA_Fragment_217_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_217_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_217_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_217_CB1((uint)(r1.z+512)).z + BA_Fragment_217_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_217_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_217_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_217_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_217_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_217_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_217_CB3((uint)(7)).xyz + BA_Fragment_217_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_217_CB3((uint)(8)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_217_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_217_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_218_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_218_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_218_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_218_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_218_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_218_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_218_CB3((uint)(3)).x + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_218_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_218_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_218_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_218_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_218_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_218_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_218_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_218_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_218_CB2((uint)(11)).y, BA_Fragment_218_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_218_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_218_CB1((uint)(r1.z+0)).www + BA_Fragment_218_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_218_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_218_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_218_CB1((uint)(r1.z+512)).z + BA_Fragment_218_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_218_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_218_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_218_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_218_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_218_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_218_CB3((uint)(7)).xyz + BA_Fragment_218_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_218_CB3((uint)(8)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_218_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_218_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_219_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_219_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_219_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_219_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_219_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_219_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_219_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_219_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_219_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_219_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_219_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_219_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_219_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_219_CB2((uint)(11)).y, BA_Fragment_219_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_219_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_219_CB1((uint)(r1.w+0)).www + BA_Fragment_219_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_219_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_219_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_219_CB1((uint)(r1.w+512)).z + BA_Fragment_219_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_219_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_219_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_219_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_219_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_219_CB3((uint)(7)).xyz + BA_Fragment_219_CB3((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_219_CB3((uint)(8)).xyz + r0.xyz;
  r1.x = exp2(-v3.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_219_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_219_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_220_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_220_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_220_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_220_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_220_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_220_CB3((uint)(3)).x + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_220_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_220_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_220_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_220_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_220_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_220_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_220_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_220_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_220_CB2((uint)(11)).y, BA_Fragment_220_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_220_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_220_CB1((uint)(r1.w+0)).www + BA_Fragment_220_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_220_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_220_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_220_CB1((uint)(r1.w+512)).z + BA_Fragment_220_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_220_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_220_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_220_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_220_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_220_CB3((uint)(7)).xyz + BA_Fragment_220_CB3((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_220_CB3((uint)(8)).xyz + r0.xyz;
  r1.x = exp2(-v3.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_220_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_220_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_221_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_221_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_221_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_221_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_221_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_221_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_221_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_221_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_221_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_221_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_221_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_221_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_221_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_221_CB2((uint)(11)).y, BA_Fragment_221_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_221_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_221_CB1((uint)(r1.w+0)).www + BA_Fragment_221_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_221_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_221_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_221_CB1((uint)(r1.w+512)).z + BA_Fragment_221_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_221_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_221_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_221_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_221_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_221_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_221_CB3((uint)(7)).xyz + BA_Fragment_221_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_221_CB3((uint)(8)).xyz + r1.xyz;
  r1.x = exp2(-v3.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_221_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_221_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_222_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_222_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_222_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_222_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_222_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_222_CB3((uint)(3)).x + r0.w;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, BA_Fragment_222_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_222_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_222_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_222_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_222_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_222_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_222_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_222_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_222_CB2((uint)(11)).y, BA_Fragment_222_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_222_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_222_CB1((uint)(r1.w+0)).www + BA_Fragment_222_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_222_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_222_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_222_CB1((uint)(r1.w+512)).z + BA_Fragment_222_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_222_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_222_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_222_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_222_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_222_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_222_CB3((uint)(7)).xyz + BA_Fragment_222_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_222_CB3((uint)(8)).xyz + r1.xyz;
  r1.x = exp2(-v3.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_222_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_222_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_223_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_223_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_223_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_223_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_223_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_223_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_223_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_223_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_223_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_223_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_223_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_223_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_223_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_223_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_223_CB2((uint)(11)).y, BA_Fragment_223_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_223_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_223_CB1((uint)(r1.z+0)).www + BA_Fragment_223_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_223_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_223_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_223_CB1((uint)(r1.z+512)).z + BA_Fragment_223_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_223_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_223_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_223_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_223_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_223_CB3((uint)(7)).xyz + BA_Fragment_223_CB3((uint)(6)).xyz;
  r0.xyz = r0.zzz * BA_Fragment_223_CB3((uint)(8)).xyz + r0.xyw;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_223_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_223_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_224_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_224_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_224_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_224_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_224_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_224_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_224_CB3((uint)(3)).x + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_224_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_224_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_224_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_224_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_224_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_224_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_224_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_224_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_224_CB2((uint)(11)).y, BA_Fragment_224_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_224_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_224_CB1((uint)(r1.z+0)).www + BA_Fragment_224_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_224_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_224_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_224_CB1((uint)(r1.z+512)).z + BA_Fragment_224_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_224_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_224_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_224_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_224_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_224_CB3((uint)(7)).xyz + BA_Fragment_224_CB3((uint)(6)).xyz;
  r0.xyz = r0.zzz * BA_Fragment_224_CB3((uint)(8)).xyz + r0.xyw;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_224_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_224_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_225_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_225_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_225_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_225_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_225_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_225_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_225_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_225_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_225_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_225_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_225_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_225_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_225_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_225_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_225_CB2((uint)(11)).y, BA_Fragment_225_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_225_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_225_CB1((uint)(r1.z+0)).www + BA_Fragment_225_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_225_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_225_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_225_CB1((uint)(r1.z+512)).z + BA_Fragment_225_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_225_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_225_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_225_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_225_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_225_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_225_CB3((uint)(7)).xyz + BA_Fragment_225_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_225_CB3((uint)(8)).xyz + r0.xzw;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_225_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_225_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_226_CB3(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(_Cutoff, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_226_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u, 1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_226_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u, (uint)(MAX_VISIBLE_LIGHTS-1))];
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_226_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v1.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_226_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_226_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_226_CB3((uint)(3)).x + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_226_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_226_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_226_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_226_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_226_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_226_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_226_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_226_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_226_CB2((uint)(11)).y, BA_Fragment_226_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_226_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_226_CB1((uint)(r1.z+0)).www + BA_Fragment_226_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_226_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_226_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_226_CB1((uint)(r1.z+512)).z + BA_Fragment_226_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_226_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_226_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_226_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_226_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_226_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_226_CB3((uint)(7)).xyz + BA_Fragment_226_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_226_CB3((uint)(8)).xyz + r0.xzw;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_226_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_226_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
