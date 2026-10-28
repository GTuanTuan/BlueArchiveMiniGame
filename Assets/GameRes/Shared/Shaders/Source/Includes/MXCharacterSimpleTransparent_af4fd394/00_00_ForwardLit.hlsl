// Exact names and types from the original compiled parameter metadata.
float _AdditionalLightSharpness;
float _AdditionalLightStrength;
float4 _CodeAddColor;
float4 _CodeAddRimColor;
float4 _CodeMultiplyColor;
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

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_3_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_3_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_3_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_4_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_4_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_4_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_5_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_5_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_5_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r1.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_5_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
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
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_6_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_6_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_6_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r1.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_6_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o1.z = 0.5 + r0.w;
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
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_7_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_7_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_7_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.w = r1.z / BA_Vertex_7_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_7_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_7_CB0((uint)(55)).z + BA_Vertex_7_CB0((uint)(55)).w);
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
  r0.x = 1 + -BA_Vertex_7_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_7_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_7_CB2((uint)(2)).xyz * BA_Vertex_7_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_8_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_8_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_8_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.w = r1.z / BA_Vertex_8_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_8_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_8_CB0((uint)(55)).z + BA_Vertex_8_CB0((uint)(55)).w);
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
  r0.x = 1 + -BA_Vertex_8_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_8_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_8_CB2((uint)(2)).xyz * BA_Vertex_8_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_9_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_9_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_9_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r1.x = r1.z / BA_Vertex_9_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_9_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_9_CB0((uint)(55)).z + BA_Vertex_9_CB0((uint)(55)).w);
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
  r0.x = 1 + -BA_Vertex_9_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_9_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_9_CB2((uint)(2)).xyz * BA_Vertex_9_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_10_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_10_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_10_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r1.x = r1.z / BA_Vertex_10_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_10_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_10_CB0((uint)(55)).z + BA_Vertex_10_CB0((uint)(55)).w);
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
  r0.x = 1 + -BA_Vertex_10_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_10_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_10_CB2((uint)(2)).xyz * BA_Vertex_10_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_11_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_11_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_11_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  o3.w = BA_Vertex_11_CB0((uint)(55)).x * r0.w;
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
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_12_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_12_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_12_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  o3.w = BA_Vertex_12_CB0((uint)(55)).x * r0.w;
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
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_13_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_13_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_13_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.w = BA_Vertex_13_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_13_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_13_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_13_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
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
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_14_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_14_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_14_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.w = BA_Vertex_14_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_14_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_14_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = BA_Vertex_14_CB0((uint)(55)).x * r1.x;
  o1.z = 0.5 + r0.w;
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
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_15_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_15_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_15_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyz = BA_Vertex_15_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_15_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_15_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_15_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_15_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_15_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_15_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_15_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_15_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_15_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_15_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_15_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_15_CB2((uint)(2)).xyz * BA_Vertex_15_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_16_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_16_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_16_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyz = BA_Vertex_16_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_16_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_16_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_16_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_16_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_16_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_16_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_16_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_16_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_16_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_16_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_16_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_16_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_16_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_16_CB2((uint)(2)).xyz * BA_Vertex_16_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_17_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_17_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_17_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyz = BA_Vertex_17_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_17_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_17_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_17_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_17_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_17_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_17_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_17_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_17_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
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
  r1.xyz = BA_Vertex_17_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_17_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_17_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_17_CB2((uint)(2)).xyz * BA_Vertex_17_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_18_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_18_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_18_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyz = BA_Vertex_18_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_18_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_18_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_18_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_18_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_18_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_18_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_18_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_18_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
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
  r1.xyz = BA_Vertex_18_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  r0.x = 1 + -BA_Vertex_18_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_18_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_18_CB2((uint)(2)).xyz * BA_Vertex_18_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_19_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_19_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_19_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyz = BA_Vertex_19_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_19_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_19_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_19_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_19_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_19_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_19_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_19_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_19_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_19_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_19_CB0((uint)(55)).z + BA_Vertex_19_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_19_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_19_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_19_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_19_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_19_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_19_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_19_CB2((uint)(2)).xyz * BA_Vertex_19_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_20_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_20_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_20_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyz = BA_Vertex_20_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_20_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_20_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_20_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_20_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_20_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_20_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_20_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_20_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_20_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = saturate(r0.w * BA_Vertex_20_CB0((uint)(55)).z + BA_Vertex_20_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_20_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_20_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_20_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_20_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_20_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_20_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_20_CB2((uint)(2)).xyz * BA_Vertex_20_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_21_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_21_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_21_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyz = BA_Vertex_21_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_21_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_21_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_21_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_21_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_21_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_21_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_21_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_21_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_21_CB0((uint)(55)).z + BA_Vertex_21_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_21_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_21_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_21_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_21_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_21_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_21_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_21_CB2((uint)(2)).xyz * BA_Vertex_21_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_22_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_22_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_22_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyz = BA_Vertex_22_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_22_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_22_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_22_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_22_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_22_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_22_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_22_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = BA_Vertex_22_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  r1.x = r1.z / BA_Vertex_22_CB0((uint)(17)).y;
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_22_CB0((uint)(17)).z * r1.x;
  r1.x = max(0, r1.x);
  o3.w = saturate(r1.x * BA_Vertex_22_CB0((uint)(55)).z + BA_Vertex_22_CB0((uint)(55)).w);
  o1.z = 0.5 + r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_22_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_22_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_22_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_22_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_22_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_22_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_22_CB2((uint)(2)).xyz * BA_Vertex_22_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_23_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_23_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_23_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyz = BA_Vertex_23_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_23_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_23_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_23_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_23_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_23_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_23_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_23_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_23_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_23_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_23_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_23_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_23_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_23_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_23_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_23_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_23_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_23_CB2((uint)(2)).xyz * BA_Vertex_23_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_24_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_24_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_24_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyz = BA_Vertex_24_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_24_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_24_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_24_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_24_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_24_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_24_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_24_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_24_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_24_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o3.w = BA_Vertex_24_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_24_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_24_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_24_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  o2.w = v2.w;
  r1.xyz = BA_Vertex_24_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_24_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_24_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_24_CB2((uint)(2)).xyz * BA_Vertex_24_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_25_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_25_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_25_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyz = BA_Vertex_25_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_25_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_25_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_25_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_25_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_25_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_25_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
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
  r1.xyz = BA_Vertex_25_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_25_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_25_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_25_CB2((uint)(2)).xyz * BA_Vertex_25_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_26_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 2u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_26_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_26_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyz = BA_Vertex_26_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_26_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_26_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_26_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_26_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_26_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_26_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
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
  r1.xyz = BA_Vertex_26_CB0((uint)(16)).xyz + -r0.xyz;
  o5.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_26_CB0((uint)(129)).y;
  o4.w = r0.x * 0.150000006 + BA_Vertex_26_CB2((uint)(1)).x;
  o4.xyz = BA_Vertex_26_CB2((uint)(2)).xyz * BA_Vertex_26_CB0((uint)(128)).xyz;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_43_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_43_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.x = dot(v2.xyz, BA_Fragment_43_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_43_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_43_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_43_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_43_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_43_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_43_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_43_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_43_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_43_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_43_CB1((uint)(7)).xyz + BA_Fragment_43_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_43_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_44_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_44_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.x = dot(v2.xyz, BA_Fragment_44_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_44_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_44_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_44_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_44_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_44_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_44_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_44_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_44_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_44_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_44_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_44_CB1((uint)(7)).xyz + BA_Fragment_44_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_44_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_45_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value;
}

float4 BA_Fragment_45_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.x = -BA_Fragment_45_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_45_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_45_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_45_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_45_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_45_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_45_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_45_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_45_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_45_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_45_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_45_CB1((uint)(7)).xyz + BA_Fragment_45_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_45_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_46_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value;
}

float4 BA_Fragment_46_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.x = -BA_Fragment_46_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_46_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_46_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_46_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_46_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_46_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_46_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_46_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_46_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_46_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_46_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_46_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_46_CB1((uint)(7)).xyz + BA_Fragment_46_CB1((uint)(6)).xyz;
  o0.xyz = r0.xxx * BA_Fragment_46_CB1((uint)(8)).xyz + r0.yzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_47_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_47_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.x = dot(v2.xyz, BA_Fragment_47_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_47_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_47_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_47_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_47_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_47_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_47_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_47_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_47_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_47_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_47_CB1((uint)(7)).xyz + BA_Fragment_47_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_47_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_47_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_47_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_48_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_48_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.x = dot(v2.xyz, BA_Fragment_48_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_48_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_48_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_48_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_48_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_48_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_48_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_48_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_48_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_48_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_48_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_48_CB1((uint)(7)).xyz + BA_Fragment_48_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_48_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_48_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_48_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_49_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value;
}

float4 BA_Fragment_49_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.x = -BA_Fragment_49_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_49_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_49_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_49_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_49_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_49_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_49_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_49_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_49_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_49_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_49_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_49_CB1((uint)(7)).xyz + BA_Fragment_49_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_49_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_49_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_49_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_50_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value;
}

float4 BA_Fragment_50_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.x = -BA_Fragment_50_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_50_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_50_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_50_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_50_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_50_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_50_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_50_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_50_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_50_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_50_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_50_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_50_CB1((uint)(7)).xyz + BA_Fragment_50_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_50_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_50_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_50_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_51_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_51_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.x = dot(v2.xyz, BA_Fragment_51_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_51_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_51_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_51_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_51_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_51_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_51_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_51_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_51_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_51_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_51_CB1((uint)(7)).xyz + BA_Fragment_51_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_51_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_51_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_51_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_52_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_52_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.x = dot(v2.xyz, BA_Fragment_52_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_52_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_52_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_52_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_52_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_52_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_52_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_52_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_52_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_52_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_52_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_52_CB1((uint)(7)).xyz + BA_Fragment_52_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_52_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_52_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_52_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_53_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value;
}

float4 BA_Fragment_53_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.x = -BA_Fragment_53_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_53_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_53_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_53_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_53_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_53_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_53_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_53_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_53_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_53_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_53_CB0((uint)(129)).xxx * r0.yzw;
  r0.yzw = r0.yzw * BA_Fragment_53_CB1((uint)(7)).xyz + BA_Fragment_53_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_53_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_53_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_53_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_54_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, 0.0);
  if (i == 4u) value = float4(0.0, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value;
}

float4 BA_Fragment_54_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.x = -BA_Fragment_54_CB1((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_54_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = r0.y * 0.769999981 + r0.x;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_54_CB0((uint)(127)).xyz * r0.xxx;
  r0.x = 1 + -r0.y;
  r0.y = -v4.w + r0.z;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_54_CB0((uint)(127)).xyz + v4.xyz;
  r0.yzw = r0.yyy * r2.xyz + BA_Fragment_54_CB0((uint)(127)).xyz;
  r1.w = -1 + BA_Fragment_54_CB1((uint)(3)).y;
  r1.w = max(0, r1.w);
  r1.w = saturate(r0.x * BA_Fragment_54_CB1((uint)(3)).y + -r1.w);
  r0.x = r0.x * r0.x;
  r1.w = v2.w * r1.w;
  r1.w = BA_Fragment_54_CB1((uint)(3)).z * r1.w;
  r0.yzw = r1.www * r1.xyz + r0.yzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_54_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_54_CB1((uint)(0)).xyzw * r1.xyzw;
  r0.yzw = r1.xyz * r0.yzw;
  o0.w = r1.w;
  r0.yzw = BA_Fragment_54_CB0((uint)(129)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = BA_Fragment_54_CB1((uint)(4)).y * r0.y;
  r0.yzw = r0.yyy * BA_Fragment_54_CB1((uint)(7)).xyz + BA_Fragment_54_CB1((uint)(6)).xyz;
  r0.xyz = r0.xxx * BA_Fragment_54_CB1((uint)(8)).xyz + r0.yzw;
  r0.xyz = -BA_Fragment_54_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_54_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_55_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_55_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_55_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_55_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_55_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_55_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_55_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_55_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_55_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_55_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_55_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_55_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_55_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_55_CB2((uint)(11)).y, BA_Fragment_55_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_55_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_55_CB1((uint)(r1.w+0)).www + BA_Fragment_55_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_55_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_55_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_55_CB1((uint)(r1.w+512)).z + BA_Fragment_55_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_55_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_55_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_55_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_55_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_55_CB3((uint)(7)).xyz + BA_Fragment_55_CB3((uint)(6)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_55_CB3((uint)(8)).xyz + r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_56_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_56_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_56_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_56_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_56_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_56_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_56_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_56_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_56_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_56_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_56_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_56_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_56_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_56_CB2((uint)(11)).y, BA_Fragment_56_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_56_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_56_CB1((uint)(r1.w+0)).www + BA_Fragment_56_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_56_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_56_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_56_CB1((uint)(r1.w+512)).z + BA_Fragment_56_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_56_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_56_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_56_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_56_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_56_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_56_CB3((uint)(7)).xyz + BA_Fragment_56_CB3((uint)(6)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_56_CB3((uint)(8)).xyz + r1.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_57_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value;
}

float4 BA_Fragment_57_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_57_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_57_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.x = -BA_Fragment_57_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_57_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_57_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_57_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_57_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_57_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_57_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_57_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_57_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_57_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_57_CB2((uint)(11)).y, BA_Fragment_57_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_57_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_57_CB1((uint)(r1.z+0)).www + BA_Fragment_57_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_57_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_57_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_57_CB1((uint)(r1.z+512)).z + BA_Fragment_57_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_57_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_57_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_57_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_57_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_57_CB3((uint)(7)).xyz + BA_Fragment_57_CB3((uint)(6)).xyz;
  o0.xyz = r0.zzz * BA_Fragment_57_CB3((uint)(8)).xyz + r0.xyw;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_58_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value;
}

float4 BA_Fragment_58_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_58_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_58_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.x = -BA_Fragment_58_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_58_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_58_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_58_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_58_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_58_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_58_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_58_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_58_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_58_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_58_CB2((uint)(11)).y, BA_Fragment_58_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_58_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_58_CB1((uint)(r1.z+0)).www + BA_Fragment_58_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_58_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_58_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_58_CB1((uint)(r1.z+512)).z + BA_Fragment_58_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_58_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_58_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_58_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_58_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_58_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_58_CB3((uint)(7)).xyz + BA_Fragment_58_CB3((uint)(6)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_58_CB3((uint)(8)).xyz + r0.xzw;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_59_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_59_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_59_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_59_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_59_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_59_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_59_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_59_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_59_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_59_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_59_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_59_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_59_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_59_CB2((uint)(11)).y, BA_Fragment_59_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_59_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_59_CB1((uint)(r1.w+0)).www + BA_Fragment_59_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_59_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_59_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_59_CB1((uint)(r1.w+512)).z + BA_Fragment_59_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_59_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_59_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_59_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_59_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_59_CB3((uint)(7)).xyz + BA_Fragment_59_CB3((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_59_CB3((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_59_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_59_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_60_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_60_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_60_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_60_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_60_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_60_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_60_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_60_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_60_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_60_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_60_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_60_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_60_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_60_CB2((uint)(11)).y, BA_Fragment_60_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_60_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_60_CB1((uint)(r1.w+0)).www + BA_Fragment_60_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_60_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_60_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_60_CB1((uint)(r1.w+512)).z + BA_Fragment_60_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_60_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_60_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_60_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_60_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_60_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_60_CB3((uint)(7)).xyz + BA_Fragment_60_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_60_CB3((uint)(8)).xyz + r1.xyz;
  r0.xyz = -BA_Fragment_60_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_60_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_61_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value;
}

float4 BA_Fragment_61_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_61_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_61_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.x = -BA_Fragment_61_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_61_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_61_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_61_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_61_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_61_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_61_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_61_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_61_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_61_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_61_CB2((uint)(11)).y, BA_Fragment_61_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_61_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_61_CB1((uint)(r1.z+0)).www + BA_Fragment_61_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_61_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_61_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_61_CB1((uint)(r1.z+512)).z + BA_Fragment_61_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_61_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_61_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_61_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_61_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_61_CB3((uint)(7)).xyz + BA_Fragment_61_CB3((uint)(6)).xyz;
  r0.xyz = r0.zzz * BA_Fragment_61_CB3((uint)(8)).xyz + r0.xyw;
  r0.xyz = -BA_Fragment_61_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_61_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_62_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value;
}

float4 BA_Fragment_62_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_62_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_62_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.x = -BA_Fragment_62_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_62_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_62_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_62_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_62_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_62_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_62_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_62_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_62_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_62_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_62_CB2((uint)(11)).y, BA_Fragment_62_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_62_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_62_CB1((uint)(r1.z+0)).www + BA_Fragment_62_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_62_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_62_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_62_CB1((uint)(r1.z+512)).z + BA_Fragment_62_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_62_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_62_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_62_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_62_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_62_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_62_CB3((uint)(7)).xyz + BA_Fragment_62_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_62_CB3((uint)(8)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_62_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_62_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_63_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_63_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_63_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_63_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_63_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_63_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_63_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_63_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_63_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_63_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_63_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_63_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_63_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_63_CB2((uint)(11)).y, BA_Fragment_63_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_63_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_63_CB1((uint)(r1.w+0)).www + BA_Fragment_63_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_63_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_63_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_63_CB1((uint)(r1.w+512)).z + BA_Fragment_63_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_63_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_63_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_63_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_63_CB0((uint)(129)).xxx + r1.xyw;
  r1.x = r1.z * r1.z;
  r0.xyz = r0.xyz * BA_Fragment_63_CB3((uint)(7)).xyz + BA_Fragment_63_CB3((uint)(6)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_63_CB3((uint)(8)).xyz + r0.xyz;
  r1.x = exp2(-v3.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_63_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_63_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_64_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_64_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_64_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_64_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_64_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v2.xyz, BA_Fragment_64_CB0((uint)(126)).xyz);
  r1.y = dot(v2.xyz, v3.xyz);
  r1.z = 1 + -r1.y;
  r1.y = r1.y * 0.769999981 + r1.x;
  r1.y = -v4.w + r1.y;
  r1.y = saturate(-20 * r1.y);
  r2.xyz = -BA_Fragment_64_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_64_CB0((uint)(127)).xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyw = BA_Fragment_64_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = -1 + BA_Fragment_64_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r1.z * BA_Fragment_64_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_64_CB3((uint)(3)).z * r2.w;
  r0.xyzw = BA_Fragment_64_CB3((uint)(0)).xyzw * r0.xyzw;
  r1.xyw = r2.www * r1.xyw + r2.xyz;
  r0.xyz = r1.xyw * r0.xyz;
  r1.x = min(BA_Fragment_64_CB2((uint)(11)).y, BA_Fragment_64_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.w = cmp((int)r1.y >= (int)r1.x);
    if (r1.w != 0) break;
    r1.w = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.w = dot(BA_Fragment_64_CB2((uint)(r1.w+12)).xyzw, icb[r2.w+0].xyzw);
    r1.w = (int)r1.w;
    r3.xyz = -v5.xyz * BA_Fragment_64_CB1((uint)(r1.w+0)).www + BA_Fragment_64_CB1((uint)(r1.w+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_64_CB1((uint)(r1.w+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_64_CB1((uint)(r1.w+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_64_CB1((uint)(r1.w+512)).z + BA_Fragment_64_CB1((uint)(r1.w+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_64_CB1((uint)(r1.w+256)).xyz * r2.www;
    r1.w = dot(r3.xyz, v2.xyz);
    r1.w = saturate(r1.w * BA_Fragment_64_CB3((uint)(4)).x + r1.w);
    r2.xyz = r1.www * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyw = BA_Fragment_64_CB3((uint)(3)).www * r2.xyz;
  r0.xyz = r0.xyz * BA_Fragment_64_CB0((uint)(129)).xxx + r1.xyw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_64_CB3((uint)(4)).y * r0.x;
  r0.y = r1.z * r1.z;
  r1.xyz = r0.xxx * BA_Fragment_64_CB3((uint)(7)).xyz + BA_Fragment_64_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_64_CB3((uint)(8)).xyz + r1.xyz;
  r1.x = exp2(-v3.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_64_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_64_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_65_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value;
}

float4 BA_Fragment_65_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_65_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_65_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.x = -BA_Fragment_65_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_65_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_65_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_65_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_65_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_65_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_65_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_65_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_65_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_65_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_65_CB2((uint)(11)).y, BA_Fragment_65_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_65_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_65_CB1((uint)(r1.z+0)).www + BA_Fragment_65_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_65_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_65_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_65_CB1((uint)(r1.z+512)).z + BA_Fragment_65_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_65_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_65_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_65_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_65_CB0((uint)(129)).xxx + r1.xyz;
  r0.z = r0.z * r0.z;
  r0.xyw = r0.xyw * BA_Fragment_65_CB3((uint)(7)).xyz + BA_Fragment_65_CB3((uint)(6)).xyz;
  r0.xyz = r0.zzz * BA_Fragment_65_CB3((uint)(8)).xyz + r0.xyw;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_65_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_65_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_66_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 3u) value = float4(0.0, _RimAreaMultiplier, _RimStrength, _AdditionalLightStrength);
  if (i == 4u) value = float4(_AdditionalLightSharpness, _GrayBrightness, 0.0, 0.0);
  if (i == 6u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  return value;
}

float4 BA_Fragment_66_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_66_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_66_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
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
  r0.x = -BA_Fragment_66_CB3((uint)(8)).w * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_66_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v2.xyz, BA_Fragment_66_CB0((uint)(126)).xyz);
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * 0.769999981 + r0.x;
  r0.y = -v4.w + r0.y;
  r0.y = saturate(-20 * r0.y);
  r2.xyz = -BA_Fragment_66_CB0((uint)(127)).xyz + v4.xyz;
  r2.xyz = r0.yyy * r2.xyz + BA_Fragment_66_CB0((uint)(127)).xyz;
  r0.x = saturate(r0.x * 4 + 0.25);
  r0.x = r0.x * 0.399999976 + 0.300000012;
  r0.xyw = BA_Fragment_66_CB0((uint)(127)).xyz * r0.xxx;
  r2.w = -1 + BA_Fragment_66_CB3((uint)(3)).y;
  r2.w = max(0, r2.w);
  r2.w = saturate(r0.z * BA_Fragment_66_CB3((uint)(3)).y + -r2.w);
  r2.w = v2.w * r2.w;
  r2.w = BA_Fragment_66_CB3((uint)(3)).z * r2.w;
  r1.xyzw = BA_Fragment_66_CB3((uint)(0)).xyzw * r1.xyzw;
  r0.xyw = r2.www * r0.xyw + r2.xyz;
  r0.xyw = r1.xyz * r0.xyw;
  r1.x = min(BA_Fragment_66_CB2((uint)(11)).y, BA_Fragment_66_CB0((uint)(10)).x);
  r1.x = (int)r1.x;
  r2.xyz = float3(0,0,0);
  r1.y = 0;
  while (true) {
    r1.z = cmp((int)r1.y >= (int)r1.x);
    if (r1.z != 0) break;
    r1.z = (uint)r1.y >> 2;
    r2.w = (int)r1.y & 3;
    r1.z = dot(BA_Fragment_66_CB2((uint)(r1.z+12)).xyzw, icb[r2.w+0].xyzw);
    r1.z = (int)r1.z;
    r3.xyz = -v5.xyz * BA_Fragment_66_CB1((uint)(r1.z+0)).www + BA_Fragment_66_CB1((uint)(r1.z+0)).xyz;
    r2.w = dot(r3.xyz, r3.xyz);
    r2.w = max(6.10351563e-005, r2.w);
    r3.w = rsqrt(r2.w);
    r3.xyz = r3.xyz * r3.www;
    r3.w = 1 / r2.w;
    r2.w = BA_Fragment_66_CB1((uint)(r1.z+512)).x * r2.w;
    r2.w = -r2.w * r2.w + 1;
    r2.w = max(0, r2.w);
    r2.w = r2.w * r2.w;
    r2.w = r3.w * r2.w;
    r3.w = dot(BA_Fragment_66_CB1((uint)(r1.z+768)).xyz, r3.xyz);
    r3.w = saturate(r3.w * BA_Fragment_66_CB1((uint)(r1.z+512)).z + BA_Fragment_66_CB1((uint)(r1.z+512)).w);
    r3.w = r3.w * r3.w;
    r2.w = r3.w * r2.w;
    r4.xyz = BA_Fragment_66_CB1((uint)(r1.z+256)).xyz * r2.www;
    r1.z = dot(r3.xyz, v2.xyz);
    r1.z = saturate(r1.z * BA_Fragment_66_CB3((uint)(4)).x + r1.z);
    r2.xyz = r1.zzz * r4.xyz + r2.xyz;
    r1.y = (int)r1.y + 1;
  }
  r1.xyz = BA_Fragment_66_CB3((uint)(3)).www * r2.xyz;
  r0.xyw = r0.xyw * BA_Fragment_66_CB0((uint)(129)).xxx + r1.xyz;
  r0.x = dot(r0.xyw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_66_CB3((uint)(4)).y * r0.x;
  r0.y = r0.z * r0.z;
  r0.xzw = r0.xxx * BA_Fragment_66_CB3((uint)(7)).xyz + BA_Fragment_66_CB3((uint)(6)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_66_CB3((uint)(8)).xyz + r0.xzw;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_66_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_66_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
