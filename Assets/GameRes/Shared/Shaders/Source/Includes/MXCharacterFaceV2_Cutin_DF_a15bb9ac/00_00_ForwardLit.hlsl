// Exact names and types from the original compiled parameter metadata.
float4 _CodeAddColor;
float4 _CodeAddRimColor;
float4 _CodeMultiplyColor;
float4 _MainLightShadowParams;
float4 _MainLightShadowmapSize;
float4x4 _MainLightWorldToShadow[5];
float4 _MxCharLightData;
float3 _MxCharLightDir;
float3 _MxCharLightTone;
float3 _MxCharShadowTone;
float _RimAreaLeveler;
float _RimAreaMultiplier;
float _RimStrength;
float4 _ShadowCoordModifier;
float _ShadowThreshold;
float4 _ShadowTint;
float4 _Tint;
Texture2D<float4> _MainLightShadowmapTexture;
Texture2D<float4> _MainTex;
Texture2D<float4> _MaskTex;
SamplerComparisonState sampler_MainLightShadowmapTexture;
SamplerState sampler_MainTex;
SamplerState sampler_MaskTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_4_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, 0.0, _ShadowThreshold);
  if (i == 4u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
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
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4)
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
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_4_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_4_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_4_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_4_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_4_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_4_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_4_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_4_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_4_CB2((uint)(0)).w;
  o5.xyz = BA_Vertex_4_CB2((uint)(4)).xyz * BA_Vertex_4_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_5_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, 0.0, _ShadowThreshold);
  if (i == 4u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_5_CB0(uint i)
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
  out float4 o5 : TEXCOORD4)
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
  r0.w = r1.z / BA_Vertex_5_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_5_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_5_CB0((uint)(55)).z + BA_Vertex_5_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_5_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_5_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_5_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_5_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_5_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_5_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_5_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_5_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_5_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_5_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_5_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_5_CB2((uint)(0)).w;
  o5.xyz = BA_Vertex_5_CB2((uint)(4)).xyz * BA_Vertex_5_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_6_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, 0.0, _ShadowThreshold);
  if (i == 4u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_6_CB0(uint i)
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
  out float4 o5 : TEXCOORD4)
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
  r0.w = r1.z / BA_Vertex_6_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_6_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_6_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_6_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_6_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_6_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_6_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_6_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_6_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_6_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_6_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_6_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_6_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_6_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_6_CB2((uint)(0)).w;
  o5.xyz = BA_Vertex_6_CB2((uint)(4)).xyz * BA_Vertex_6_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_7_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_7_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, 0.0, _ShadowThreshold);
  if (i == 4u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_7_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
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
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_7_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_7_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_7_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_7_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_7_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_7_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_7_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_7_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_7_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_7_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_7_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_7_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_7_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_7_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_7_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_7_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_7_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r1.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_7_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_7_CB2((uint)(0)).w;
  o5.xyz = BA_Vertex_7_CB2((uint)(4)).xyz * BA_Vertex_7_CB0((uint)(128)).xyz;
  r1.xyz = BA_Vertex_7_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_7_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_7_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_7_CB3((uint)(3)).xyz + r0.xyz;
  o6.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_7_CB3((uint)(1)).xy * BA_Vertex_7_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_7_CB3((uint)(0)).xy * BA_Vertex_7_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_7_CB3((uint)(2)).xy * BA_Vertex_7_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_7_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_7_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_7_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o6.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o6.w = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_8_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_8_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, 0.0, _ShadowThreshold);
  if (i == 4u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
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
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
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
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_8_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_8_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_8_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_8_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_8_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_8_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_8_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_8_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_8_CB0((uint)(55)).z + BA_Vertex_8_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_8_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_8_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_8_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_8_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_8_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_8_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_8_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_8_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_8_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_8_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_8_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r1.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_8_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_8_CB2((uint)(0)).w;
  o5.xyz = BA_Vertex_8_CB2((uint)(4)).xyz * BA_Vertex_8_CB0((uint)(128)).xyz;
  r1.xyz = BA_Vertex_8_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_8_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_8_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_8_CB3((uint)(3)).xyz + r0.xyz;
  o6.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_8_CB3((uint)(1)).xy * BA_Vertex_8_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_8_CB3((uint)(0)).xy * BA_Vertex_8_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_8_CB3((uint)(2)).xy * BA_Vertex_8_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_8_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_8_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_8_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o6.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o6.w = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_9_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_9_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, 0.0, _ShadowThreshold);
  if (i == 4u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
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
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
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
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_9_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_9_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_9_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_9_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_9_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_9_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_9_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_9_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_9_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_9_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_9_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_9_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_9_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_9_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_9_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_9_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_9_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_9_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r1.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_9_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_9_CB2((uint)(0)).w;
  o5.xyz = BA_Vertex_9_CB2((uint)(4)).xyz * BA_Vertex_9_CB0((uint)(128)).xyz;
  r1.xyz = BA_Vertex_9_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_9_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_9_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_9_CB3((uint)(3)).xyz + r0.xyz;
  o6.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_9_CB3((uint)(1)).xy * BA_Vertex_9_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_9_CB3((uint)(0)).xy * BA_Vertex_9_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_9_CB3((uint)(2)).xy * BA_Vertex_9_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_9_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_9_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_9_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o6.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o6.w = 0;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_13_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RimAreaMultiplier, _RimStrength, _RimAreaLeveler, 0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_13_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Fragment_13_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
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
  float4 v5 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_13_CB1((uint)(5)).xyz * BA_Fragment_13_CB0((uint)(5)).yyy;
  r0.xyz = BA_Fragment_13_CB1((uint)(4)).xyz * BA_Fragment_13_CB0((uint)(5)).xxx + r0.xyz;
  r0.xyz = BA_Fragment_13_CB1((uint)(6)).xyz * BA_Fragment_13_CB0((uint)(5)).zzz + r0.xyz;
  r0.x = dot(r0.xyz, r0.xyz);
  r0.x = rsqrt(r0.x);
  r0.xy = r0.yz * r0.xx;
  r0.z = cmp(0 < r0.y);
  r0.w = cmp(r0.y < 0);
  r0.z = (int)-r0.z + (int)r0.w;
  r0.z = (int)r0.z;
  r0.z = saturate(r0.z);
  r0.w = 1 + -r0.z;
  r1.xy = v1.xy * float2(-1,1) + float2(1,0);
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, r1.xy, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  r0.w = r1.z * r0.w;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  r0.z = r0.z * r1.z + r0.w;
  r0.y = dot(r0.xy, r0.xy);
  r0.y = max(6.10351563e-005, r0.y);
  r0.y = rsqrt(r0.y);
  r0.x = -r0.x * r0.y + 1;
  r0.x = cmp(r0.x >= r0.z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.yzw = -BA_Fragment_13_CB0((uint)(127)).xyz + v5.xyz;
  r0.xyz = r0.xxx * r0.yzw + BA_Fragment_13_CB0((uint)(127)).xyz;
  r0.xyz = r0.xyz * BA_Fragment_13_CB0((uint)(129)).xxx + v2.xyz;
  r0.w = dot(v3.xyz, BA_Fragment_13_CB0((uint)(126)).xyz);
  r0.w = saturate(r0.w * 4 + 0.25);
  r0.w = r0.w * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_13_CB0((uint)(127)).xyz * r0.www;
  r0.w = dot(v3.xyz, v4.xyz);
  r0.w = 1 + -r0.w;
  r1.w = saturate(r0.w * BA_Fragment_13_CB2((uint)(0)).x + -BA_Fragment_13_CB2((uint)(0)).z);
  r0.w = r0.w * r0.w;
  r1.w = v3.w * r1.w;
  r1.w = BA_Fragment_13_CB2((uint)(0)).y * r1.w;
  r1.w = BA_Fragment_13_CB0((uint)(129)).x * r1.w;
  r0.xyz = r1.www * r1.xyz + r0.xyz;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_13_CB2((uint)(3)).xyzw * r1.xyzw;
  r0.xyz = r1.xyz * r0.xyz;
  o0.w = r1.w;
  r0.xyz = r0.xyz * BA_Fragment_13_CB2((uint)(8)).xyz + BA_Fragment_13_CB2((uint)(7)).xyz;
  o0.xyz = r0.www * BA_Fragment_13_CB2((uint)(9)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_14_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RimAreaMultiplier, _RimStrength, _RimAreaLeveler, 0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_14_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Fragment_14_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
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
  float4 v5 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_14_CB1((uint)(5)).xyz * BA_Fragment_14_CB0((uint)(5)).yyy;
  r0.xyz = BA_Fragment_14_CB1((uint)(4)).xyz * BA_Fragment_14_CB0((uint)(5)).xxx + r0.xyz;
  r0.xyz = BA_Fragment_14_CB1((uint)(6)).xyz * BA_Fragment_14_CB0((uint)(5)).zzz + r0.xyz;
  r0.x = dot(r0.xyz, r0.xyz);
  r0.x = rsqrt(r0.x);
  r0.xy = r0.yz * r0.xx;
  r0.z = cmp(0 < r0.y);
  r0.w = cmp(r0.y < 0);
  r0.z = (int)-r0.z + (int)r0.w;
  r0.z = (int)r0.z;
  r0.z = saturate(r0.z);
  r0.w = 1 + -r0.z;
  r1.xy = v1.xy * float2(-1,1) + float2(1,0);
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, r1.xy, BA_Fragment_14_CB0((uint)(19)).x).xyzw;
  r0.w = r1.z * r0.w;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_14_CB0((uint)(19)).x).xyzw;
  r0.z = r0.z * r1.z + r0.w;
  r0.y = dot(r0.xy, r0.xy);
  r0.y = max(6.10351563e-005, r0.y);
  r0.y = rsqrt(r0.y);
  r0.x = -r0.x * r0.y + 1;
  r0.x = cmp(r0.x >= r0.z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.yzw = -BA_Fragment_14_CB0((uint)(127)).xyz + v5.xyz;
  r0.xyz = r0.xxx * r0.yzw + BA_Fragment_14_CB0((uint)(127)).xyz;
  r0.xyz = r0.xyz * BA_Fragment_14_CB0((uint)(129)).xxx + v2.xyz;
  r0.w = dot(v3.xyz, BA_Fragment_14_CB0((uint)(126)).xyz);
  r0.w = saturate(r0.w * 4 + 0.25);
  r0.w = r0.w * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_14_CB0((uint)(127)).xyz * r0.www;
  r0.w = dot(v3.xyz, v4.xyz);
  r0.w = 1 + -r0.w;
  r1.w = saturate(r0.w * BA_Fragment_14_CB2((uint)(0)).x + -BA_Fragment_14_CB2((uint)(0)).z);
  r0.w = r0.w * r0.w;
  r1.w = v3.w * r1.w;
  r1.w = BA_Fragment_14_CB2((uint)(0)).y * r1.w;
  r1.w = BA_Fragment_14_CB0((uint)(129)).x * r1.w;
  r0.xyz = r1.www * r1.xyz + r0.xyz;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_14_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_14_CB2((uint)(3)).xyzw * r1.xyzw;
  r0.xyz = r1.xyz * r0.xyz;
  o0.w = r1.w;
  r0.xyz = r0.xyz * BA_Fragment_14_CB2((uint)(8)).xyz + BA_Fragment_14_CB2((uint)(7)).xyz;
  r0.xyz = r0.www * BA_Fragment_14_CB2((uint)(9)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_14_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_14_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_15_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RimAreaMultiplier, _RimStrength, _RimAreaLeveler, 0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_15_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Fragment_15_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
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
  float4 v5 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_15_CB1((uint)(5)).xyz * BA_Fragment_15_CB0((uint)(5)).yyy;
  r0.xyz = BA_Fragment_15_CB1((uint)(4)).xyz * BA_Fragment_15_CB0((uint)(5)).xxx + r0.xyz;
  r0.xyz = BA_Fragment_15_CB1((uint)(6)).xyz * BA_Fragment_15_CB0((uint)(5)).zzz + r0.xyz;
  r0.x = dot(r0.xyz, r0.xyz);
  r0.x = rsqrt(r0.x);
  r0.xy = r0.yz * r0.xx;
  r0.z = cmp(0 < r0.y);
  r0.w = cmp(r0.y < 0);
  r0.z = (int)-r0.z + (int)r0.w;
  r0.z = (int)r0.z;
  r0.z = saturate(r0.z);
  r0.w = 1 + -r0.z;
  r1.xy = v1.xy * float2(-1,1) + float2(1,0);
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, r1.xy, BA_Fragment_15_CB0((uint)(19)).x).xyzw;
  r0.w = r1.z * r0.w;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_15_CB0((uint)(19)).x).xyzw;
  r0.z = r0.z * r1.z + r0.w;
  r0.y = dot(r0.xy, r0.xy);
  r0.y = max(6.10351563e-005, r0.y);
  r0.y = rsqrt(r0.y);
  r0.x = -r0.x * r0.y + 1;
  r0.x = cmp(r0.x >= r0.z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.yzw = -BA_Fragment_15_CB0((uint)(127)).xyz + v5.xyz;
  r0.xyz = r0.xxx * r0.yzw + BA_Fragment_15_CB0((uint)(127)).xyz;
  r0.xyz = r0.xyz * BA_Fragment_15_CB0((uint)(129)).xxx + v2.xyz;
  r0.w = dot(v3.xyz, BA_Fragment_15_CB0((uint)(126)).xyz);
  r0.w = saturate(r0.w * 4 + 0.25);
  r0.w = r0.w * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_15_CB0((uint)(127)).xyz * r0.www;
  r0.w = dot(v3.xyz, v4.xyz);
  r0.w = 1 + -r0.w;
  r1.w = saturate(r0.w * BA_Fragment_15_CB2((uint)(0)).x + -BA_Fragment_15_CB2((uint)(0)).z);
  r0.w = r0.w * r0.w;
  r1.w = v3.w * r1.w;
  r1.w = BA_Fragment_15_CB2((uint)(0)).y * r1.w;
  r1.w = BA_Fragment_15_CB0((uint)(129)).x * r1.w;
  r0.xyz = r1.www * r1.xyz + r0.xyz;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_15_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_15_CB2((uint)(3)).xyzw * r1.xyzw;
  r0.xyz = r1.xyz * r0.xyz;
  o0.w = r1.w;
  r0.xyz = r0.xyz * BA_Fragment_15_CB2((uint)(8)).xyz + BA_Fragment_15_CB2((uint)(7)).xyz;
  r0.xyz = r0.www * BA_Fragment_15_CB2((uint)(9)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_15_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_15_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_16_CB3(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_16_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RimAreaMultiplier, _RimStrength, _RimAreaLeveler, 0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_16_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Fragment_16_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
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
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_16_CB0((uint)(19)).x).xyzw;
  r0.xyzw = BA_Fragment_16_CB2((uint)(3)).xyzw * r0.xyzw;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_16_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v3.xyz, BA_Fragment_16_CB0((uint)(126)).xyz);
  r1.w = dot(v3.xyz, v4.xyz);
  r2.xy = v1.xy * float2(-1,1) + float2(1,0);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, r2.xy, BA_Fragment_16_CB0((uint)(19)).x).xyzw;
  r2.x = cmp(BA_Fragment_16_CB3((uint)(29)).y != 0.000000);
  if (r2.x != 0) {
    r2.xy = v6.xy * BA_Fragment_16_CB3((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r3.xy = v6.xy * BA_Fragment_16_CB3((uint)(30)).zw + -r2.xy;
    r4.xyzw = float4(0.5,1,0.5,1) + r3.xxyy;
    r5.xyzw = r4.xxzz * r4.xxzz;
    r3.zw = float2(0.0799999982,0.0799999982) * r5.yw;
    r4.xz = r5.xz * float2(0.5,0.5) + -r3.xy;
    r5.xy = float2(1,1) + -r3.xy;
    r5.zw = min(float2(0,0), r3.xy);
    r5.zw = -r5.zw * r5.zw + r5.xy;
    r3.xy = max(float2(0,0), r3.xy);
    r3.xy = -r3.xy * r3.xy + r4.yw;
    r5.zw = float2(1,1) + r5.zw;
    r3.xy = float2(1,1) + r3.xy;
    r6.xy = float2(0.159999996,0.159999996) * r4.xz;
    r7.xy = float2(0.159999996,0.159999996) * r5.xy;
    r5.xy = float2(0.159999996,0.159999996) * r5.zw;
    r8.xy = float2(0.159999996,0.159999996) * r3.xy;
    r3.xy = float2(0.159999996,0.159999996) * r4.yw;
    r6.z = r5.x;
    r6.w = r3.x;
    r7.z = r8.x;
    r7.w = r3.z;
    r4.xyzw = r7.zwxz + r6.zwxz;
    r5.z = r6.y;
    r5.w = r3.y;
    r8.z = r7.y;
    r8.w = r3.w;
    r3.xyz = r8.zyw + r5.zyw;
    r5.xyz = r7.xzw / r4.zwy;
    r5.xyz = float3(-2.5,-0.5,1.5) + r5.xyz;
    r6.xyz = r8.zyw / r3.xyz;
    r6.xyz = float3(-2.5,-0.5,1.5) + r6.xyz;
    r5.xyz = BA_Fragment_16_CB3((uint)(30)).xxx * r5.yxz;
    r6.xyz = BA_Fragment_16_CB3((uint)(30)).yyy * r6.xyz;
    r5.w = r6.x;
    r7.xyzw = r2.xyxy * BA_Fragment_16_CB3((uint)(30)).xyxy + r5.ywxw;
    r8.xy = r2.xy * BA_Fragment_16_CB3((uint)(30)).xy + r5.zw;
    r6.w = r5.y;
    r5.yw = r6.yz;
    r9.xyzw = r2.xyxy * BA_Fragment_16_CB3((uint)(30)).xyxy + r5.xyzy;
    r6.xyzw = r2.xyxy * BA_Fragment_16_CB3((uint)(30)).xyxy + r6.wywz;
    r5.xyzw = r2.xyxy * BA_Fragment_16_CB3((uint)(30)).xyxy + r5.xwzw;
    r10.xyzw = r4.zwyz * r3.xxxy;
    r11.xyzw = r4.xyzw * r3.yyzz;
    r2.x = r4.y * r3.z;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v6.z).x;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v6.z).x;
    r2.w = r10.y * r2.w;
    r2.y = r10.x * r2.y + r2.w;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r8.xy, v6.z).x;
    r2.y = r10.z * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v6.z).x;
    r2.y = r10.w * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r9.xy, v6.z).x;
    r2.y = r11.x * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r9.zw, v6.z).x;
    r2.y = r11.y * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v6.z).x;
    r2.y = r11.z * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v6.z).x;
    r2.y = r11.w * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v6.z).x;
    r2.x = r2.x * r2.w + r2.y;
  } else {
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v6.xy, v6.z).x;
  }
  r2.y = 1 + -BA_Fragment_16_CB3((uint)(29)).x;
  r2.x = r2.x * BA_Fragment_16_CB3((uint)(29)).x + r2.y;
  r2.y = cmp(0 >= v6.z);
  r2.w = cmp(v6.z >= 1);
  r2.y = (int)r2.w | (int)r2.y;
  r2.x = 1 + -r2.x;
  r2.x = r2.y ? 0 : r2.x;
  r1.yw = float2(1,1) + -r1.yw;
  r3.xyz = BA_Fragment_16_CB1((uint)(5)).xyz * BA_Fragment_16_CB0((uint)(5)).yyy;
  r3.xyz = BA_Fragment_16_CB1((uint)(4)).xyz * BA_Fragment_16_CB0((uint)(5)).xxx + r3.xyz;
  r3.xyz = BA_Fragment_16_CB1((uint)(6)).xyz * BA_Fragment_16_CB0((uint)(5)).zzz + r3.xyz;
  r2.y = dot(r3.xyz, r3.xyz);
  r2.y = rsqrt(r2.y);
  r2.yw = r3.yz * r2.yy;
  r3.x = cmp(0 < r2.w);
  r3.y = cmp(r2.w < 0);
  r3.x = (int)-r3.x + (int)r3.y;
  r3.x = (int)r3.x;
  r3.x = saturate(r3.x);
  r3.y = 1 + -r3.x;
  r2.z = r3.y * r2.z;
  r1.z = r3.x * r1.z + r2.z;
  r2.z = dot(r2.yw, r2.yw);
  r2.z = max(6.10351563e-005, r2.z);
  r2.z = rsqrt(r2.z);
  r2.y = -r2.y * r2.z + 1;
  r1.z = cmp(r2.y >= r1.z);
  r1.z = r1.z ? 1.000000 : 0;
  r1.y = saturate(r2.x * r1.y + r1.z);
  r2.xyz = -BA_Fragment_16_CB0((uint)(127)).xyz + v5.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_16_CB0((uint)(127)).xyz;
  r2.xyz = r2.xyz * BA_Fragment_16_CB0((uint)(129)).xxx + v2.xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_16_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = saturate(r1.w * BA_Fragment_16_CB2((uint)(0)).x + -BA_Fragment_16_CB2((uint)(0)).z);
  r2.w = v3.w * r2.w;
  r2.w = BA_Fragment_16_CB2((uint)(0)).y * r2.w;
  r2.w = BA_Fragment_16_CB0((uint)(129)).x * r2.w;
  r1.xyz = r2.www * r1.xyz + r2.xyz;
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = r1.w * r1.w;
  r0.xyz = r0.xyz * BA_Fragment_16_CB2((uint)(8)).xyz + BA_Fragment_16_CB2((uint)(7)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_16_CB2((uint)(9)).xyz + r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_17_CB3(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_17_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RimAreaMultiplier, _RimStrength, _RimAreaLeveler, 0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_17_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Fragment_17_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
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
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_17_CB0((uint)(19)).x).xyzw;
  r0.xyzw = BA_Fragment_17_CB2((uint)(3)).xyzw * r0.xyzw;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_17_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v3.xyz, BA_Fragment_17_CB0((uint)(126)).xyz);
  r1.w = dot(v3.xyz, v4.xyz);
  r2.xy = v1.xy * float2(-1,1) + float2(1,0);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, r2.xy, BA_Fragment_17_CB0((uint)(19)).x).xyzw;
  r2.x = cmp(BA_Fragment_17_CB3((uint)(29)).y != 0.000000);
  if (r2.x != 0) {
    r2.xy = v6.xy * BA_Fragment_17_CB3((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r3.xy = v6.xy * BA_Fragment_17_CB3((uint)(30)).zw + -r2.xy;
    r4.xyzw = float4(0.5,1,0.5,1) + r3.xxyy;
    r5.xyzw = r4.xxzz * r4.xxzz;
    r3.zw = float2(0.0799999982,0.0799999982) * r5.yw;
    r4.xz = r5.xz * float2(0.5,0.5) + -r3.xy;
    r5.xy = float2(1,1) + -r3.xy;
    r5.zw = min(float2(0,0), r3.xy);
    r5.zw = -r5.zw * r5.zw + r5.xy;
    r3.xy = max(float2(0,0), r3.xy);
    r3.xy = -r3.xy * r3.xy + r4.yw;
    r5.zw = float2(1,1) + r5.zw;
    r3.xy = float2(1,1) + r3.xy;
    r6.xy = float2(0.159999996,0.159999996) * r4.xz;
    r7.xy = float2(0.159999996,0.159999996) * r5.xy;
    r5.xy = float2(0.159999996,0.159999996) * r5.zw;
    r8.xy = float2(0.159999996,0.159999996) * r3.xy;
    r3.xy = float2(0.159999996,0.159999996) * r4.yw;
    r6.z = r5.x;
    r6.w = r3.x;
    r7.z = r8.x;
    r7.w = r3.z;
    r4.xyzw = r7.zwxz + r6.zwxz;
    r5.z = r6.y;
    r5.w = r3.y;
    r8.z = r7.y;
    r8.w = r3.w;
    r3.xyz = r8.zyw + r5.zyw;
    r5.xyz = r7.xzw / r4.zwy;
    r5.xyz = float3(-2.5,-0.5,1.5) + r5.xyz;
    r6.xyz = r8.zyw / r3.xyz;
    r6.xyz = float3(-2.5,-0.5,1.5) + r6.xyz;
    r5.xyz = BA_Fragment_17_CB3((uint)(30)).xxx * r5.yxz;
    r6.xyz = BA_Fragment_17_CB3((uint)(30)).yyy * r6.xyz;
    r5.w = r6.x;
    r7.xyzw = r2.xyxy * BA_Fragment_17_CB3((uint)(30)).xyxy + r5.ywxw;
    r8.xy = r2.xy * BA_Fragment_17_CB3((uint)(30)).xy + r5.zw;
    r6.w = r5.y;
    r5.yw = r6.yz;
    r9.xyzw = r2.xyxy * BA_Fragment_17_CB3((uint)(30)).xyxy + r5.xyzy;
    r6.xyzw = r2.xyxy * BA_Fragment_17_CB3((uint)(30)).xyxy + r6.wywz;
    r5.xyzw = r2.xyxy * BA_Fragment_17_CB3((uint)(30)).xyxy + r5.xwzw;
    r10.xyzw = r4.zwyz * r3.xxxy;
    r11.xyzw = r4.xyzw * r3.yyzz;
    r2.x = r4.y * r3.z;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v6.z).x;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v6.z).x;
    r2.w = r10.y * r2.w;
    r2.y = r10.x * r2.y + r2.w;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r8.xy, v6.z).x;
    r2.y = r10.z * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v6.z).x;
    r2.y = r10.w * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r9.xy, v6.z).x;
    r2.y = r11.x * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r9.zw, v6.z).x;
    r2.y = r11.y * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v6.z).x;
    r2.y = r11.z * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v6.z).x;
    r2.y = r11.w * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v6.z).x;
    r2.x = r2.x * r2.w + r2.y;
  } else {
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v6.xy, v6.z).x;
  }
  r2.y = 1 + -BA_Fragment_17_CB3((uint)(29)).x;
  r2.x = r2.x * BA_Fragment_17_CB3((uint)(29)).x + r2.y;
  r2.y = cmp(0 >= v6.z);
  r2.w = cmp(v6.z >= 1);
  r2.y = (int)r2.w | (int)r2.y;
  r2.x = 1 + -r2.x;
  r2.x = r2.y ? 0 : r2.x;
  r1.yw = float2(1,1) + -r1.yw;
  r3.xyz = BA_Fragment_17_CB1((uint)(5)).xyz * BA_Fragment_17_CB0((uint)(5)).yyy;
  r3.xyz = BA_Fragment_17_CB1((uint)(4)).xyz * BA_Fragment_17_CB0((uint)(5)).xxx + r3.xyz;
  r3.xyz = BA_Fragment_17_CB1((uint)(6)).xyz * BA_Fragment_17_CB0((uint)(5)).zzz + r3.xyz;
  r2.y = dot(r3.xyz, r3.xyz);
  r2.y = rsqrt(r2.y);
  r2.yw = r3.yz * r2.yy;
  r3.x = cmp(0 < r2.w);
  r3.y = cmp(r2.w < 0);
  r3.x = (int)-r3.x + (int)r3.y;
  r3.x = (int)r3.x;
  r3.x = saturate(r3.x);
  r3.y = 1 + -r3.x;
  r2.z = r3.y * r2.z;
  r1.z = r3.x * r1.z + r2.z;
  r2.z = dot(r2.yw, r2.yw);
  r2.z = max(6.10351563e-005, r2.z);
  r2.z = rsqrt(r2.z);
  r2.y = -r2.y * r2.z + 1;
  r1.z = cmp(r2.y >= r1.z);
  r1.z = r1.z ? 1.000000 : 0;
  r1.y = saturate(r2.x * r1.y + r1.z);
  r2.xyz = -BA_Fragment_17_CB0((uint)(127)).xyz + v5.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_17_CB0((uint)(127)).xyz;
  r2.xyz = r2.xyz * BA_Fragment_17_CB0((uint)(129)).xxx + v2.xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_17_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = saturate(r1.w * BA_Fragment_17_CB2((uint)(0)).x + -BA_Fragment_17_CB2((uint)(0)).z);
  r2.w = v3.w * r2.w;
  r2.w = BA_Fragment_17_CB2((uint)(0)).y * r2.w;
  r2.w = BA_Fragment_17_CB0((uint)(129)).x * r2.w;
  r1.xyz = r2.www * r1.xyz + r2.xyz;
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = r1.w * r1.w;
  r0.xyz = r0.xyz * BA_Fragment_17_CB2((uint)(8)).xyz + BA_Fragment_17_CB2((uint)(7)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_17_CB2((uint)(9)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_17_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_17_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_18_CB3(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_18_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RimAreaMultiplier, _RimStrength, _RimAreaLeveler, 0.0);
  if (i == 3u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 7u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 8u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 9u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_18_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Fragment_18_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
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
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_18_CB0((uint)(19)).x).xyzw;
  r0.xyzw = BA_Fragment_18_CB2((uint)(3)).xyzw * r0.xyzw;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_18_CB0((uint)(19)).x).xyzw;
  r1.x = dot(v3.xyz, BA_Fragment_18_CB0((uint)(126)).xyz);
  r1.w = dot(v3.xyz, v4.xyz);
  r2.xy = v1.xy * float2(-1,1) + float2(1,0);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, r2.xy, BA_Fragment_18_CB0((uint)(19)).x).xyzw;
  r2.x = cmp(BA_Fragment_18_CB3((uint)(29)).y != 0.000000);
  if (r2.x != 0) {
    r2.xy = v6.xy * BA_Fragment_18_CB3((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r3.xy = v6.xy * BA_Fragment_18_CB3((uint)(30)).zw + -r2.xy;
    r4.xyzw = float4(0.5,1,0.5,1) + r3.xxyy;
    r5.xyzw = r4.xxzz * r4.xxzz;
    r3.zw = float2(0.0799999982,0.0799999982) * r5.yw;
    r4.xz = r5.xz * float2(0.5,0.5) + -r3.xy;
    r5.xy = float2(1,1) + -r3.xy;
    r5.zw = min(float2(0,0), r3.xy);
    r5.zw = -r5.zw * r5.zw + r5.xy;
    r3.xy = max(float2(0,0), r3.xy);
    r3.xy = -r3.xy * r3.xy + r4.yw;
    r5.zw = float2(1,1) + r5.zw;
    r3.xy = float2(1,1) + r3.xy;
    r6.xy = float2(0.159999996,0.159999996) * r4.xz;
    r7.xy = float2(0.159999996,0.159999996) * r5.xy;
    r5.xy = float2(0.159999996,0.159999996) * r5.zw;
    r8.xy = float2(0.159999996,0.159999996) * r3.xy;
    r3.xy = float2(0.159999996,0.159999996) * r4.yw;
    r6.z = r5.x;
    r6.w = r3.x;
    r7.z = r8.x;
    r7.w = r3.z;
    r4.xyzw = r7.zwxz + r6.zwxz;
    r5.z = r6.y;
    r5.w = r3.y;
    r8.z = r7.y;
    r8.w = r3.w;
    r3.xyz = r8.zyw + r5.zyw;
    r5.xyz = r7.xzw / r4.zwy;
    r5.xyz = float3(-2.5,-0.5,1.5) + r5.xyz;
    r6.xyz = r8.zyw / r3.xyz;
    r6.xyz = float3(-2.5,-0.5,1.5) + r6.xyz;
    r5.xyz = BA_Fragment_18_CB3((uint)(30)).xxx * r5.yxz;
    r6.xyz = BA_Fragment_18_CB3((uint)(30)).yyy * r6.xyz;
    r5.w = r6.x;
    r7.xyzw = r2.xyxy * BA_Fragment_18_CB3((uint)(30)).xyxy + r5.ywxw;
    r8.xy = r2.xy * BA_Fragment_18_CB3((uint)(30)).xy + r5.zw;
    r6.w = r5.y;
    r5.yw = r6.yz;
    r9.xyzw = r2.xyxy * BA_Fragment_18_CB3((uint)(30)).xyxy + r5.xyzy;
    r6.xyzw = r2.xyxy * BA_Fragment_18_CB3((uint)(30)).xyxy + r6.wywz;
    r5.xyzw = r2.xyxy * BA_Fragment_18_CB3((uint)(30)).xyxy + r5.xwzw;
    r10.xyzw = r4.zwyz * r3.xxxy;
    r11.xyzw = r4.xyzw * r3.yyzz;
    r2.x = r4.y * r3.z;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v6.z).x;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v6.z).x;
    r2.w = r10.y * r2.w;
    r2.y = r10.x * r2.y + r2.w;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r8.xy, v6.z).x;
    r2.y = r10.z * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v6.z).x;
    r2.y = r10.w * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r9.xy, v6.z).x;
    r2.y = r11.x * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r9.zw, v6.z).x;
    r2.y = r11.y * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v6.z).x;
    r2.y = r11.z * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v6.z).x;
    r2.y = r11.w * r2.w + r2.y;
    r2.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v6.z).x;
    r2.x = r2.x * r2.w + r2.y;
  } else {
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v6.xy, v6.z).x;
  }
  r2.y = 1 + -BA_Fragment_18_CB3((uint)(29)).x;
  r2.x = r2.x * BA_Fragment_18_CB3((uint)(29)).x + r2.y;
  r2.y = cmp(0 >= v6.z);
  r2.w = cmp(v6.z >= 1);
  r2.y = (int)r2.w | (int)r2.y;
  r2.x = 1 + -r2.x;
  r2.x = r2.y ? 0 : r2.x;
  r1.yw = float2(1,1) + -r1.yw;
  r3.xyz = BA_Fragment_18_CB1((uint)(5)).xyz * BA_Fragment_18_CB0((uint)(5)).yyy;
  r3.xyz = BA_Fragment_18_CB1((uint)(4)).xyz * BA_Fragment_18_CB0((uint)(5)).xxx + r3.xyz;
  r3.xyz = BA_Fragment_18_CB1((uint)(6)).xyz * BA_Fragment_18_CB0((uint)(5)).zzz + r3.xyz;
  r2.y = dot(r3.xyz, r3.xyz);
  r2.y = rsqrt(r2.y);
  r2.yw = r3.yz * r2.yy;
  r3.x = cmp(0 < r2.w);
  r3.y = cmp(r2.w < 0);
  r3.x = (int)-r3.x + (int)r3.y;
  r3.x = (int)r3.x;
  r3.x = saturate(r3.x);
  r3.y = 1 + -r3.x;
  r2.z = r3.y * r2.z;
  r1.z = r3.x * r1.z + r2.z;
  r2.z = dot(r2.yw, r2.yw);
  r2.z = max(6.10351563e-005, r2.z);
  r2.z = rsqrt(r2.z);
  r2.y = -r2.y * r2.z + 1;
  r1.z = cmp(r2.y >= r1.z);
  r1.z = r1.z ? 1.000000 : 0;
  r1.y = saturate(r2.x * r1.y + r1.z);
  r2.xyz = -BA_Fragment_18_CB0((uint)(127)).xyz + v5.xyz;
  r2.xyz = r1.yyy * r2.xyz + BA_Fragment_18_CB0((uint)(127)).xyz;
  r2.xyz = r2.xyz * BA_Fragment_18_CB0((uint)(129)).xxx + v2.xyz;
  r1.x = saturate(r1.x * 4 + 0.25);
  r1.x = r1.x * 0.399999976 + 0.300000012;
  r1.xyz = BA_Fragment_18_CB0((uint)(127)).xyz * r1.xxx;
  r2.w = saturate(r1.w * BA_Fragment_18_CB2((uint)(0)).x + -BA_Fragment_18_CB2((uint)(0)).z);
  r2.w = v3.w * r2.w;
  r2.w = BA_Fragment_18_CB2((uint)(0)).y * r2.w;
  r2.w = BA_Fragment_18_CB0((uint)(129)).x * r2.w;
  r1.xyz = r2.www * r1.xyz + r2.xyz;
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = r1.w * r1.w;
  r0.xyz = r0.xyz * BA_Fragment_18_CB2((uint)(8)).xyz + BA_Fragment_18_CB2((uint)(7)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_18_CB2((uint)(9)).xyz + r0.xyz;
  r1.x = exp2(-v2.w);
  r1.x = min(1, r1.x);
  r0.xyz = -BA_Fragment_18_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r1.xxx * r0.xyz + BA_Fragment_18_CB0((uint)(56)).xyz;
  o0.w = r0.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
