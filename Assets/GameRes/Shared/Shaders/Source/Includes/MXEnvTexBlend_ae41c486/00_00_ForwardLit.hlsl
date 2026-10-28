// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float _LightmapStrength;
float4 _MainLightShadowParams;
float4 _MainLightShadowmapSize;
float4x4 _MainLightWorldToShadow[5];
float4 _MainTex_ST;
float4 _PrefabLightmapTex_ST;
float4 _ShadowCoordModifier;
Texture2D<float4> _BlendTex;
Texture2D<float4> _MainLightShadowmapTexture;
Texture2D<float4> _MainTex;
Texture2D<float4> _PrefabLightmapTex;
SamplerState sampler_BlendTex;
SamplerComparisonState sampler_MainLightShadowmapTexture;
SamplerState sampler_MainTex;
SamplerState sampler_PrefabLightmapTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_12_CB2(uint i)
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

float4 BA_Vertex_12_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_12_CB0(uint i)
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
  float2 v2 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float2 o2 : TEXCOORD2,
  out float4 o3 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_12_CB1((uint)(1)).xy + BA_Vertex_12_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.x = dot(v1.xyz, BA_Vertex_12_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_12_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_12_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_12_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_12_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_12_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_12_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_12_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_12_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_12_CB2((uint)(27)).xyzw, r0.xyzw);
  r0.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r0.xyz);
  o1.w = 0;
  o2.xy = float2(0,0);
  r0.xyz = BA_Vertex_12_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_12_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_12_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_12_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_12_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_12_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_12_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o3.xyzw = BA_Vertex_12_CB0((uint)(76)).xyzw + r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_13_CB2(uint i)
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

float4 BA_Vertex_13_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_13_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float2 o2 : TEXCOORD2,
  out float4 o3 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_13_CB1((uint)(1)).xy + BA_Vertex_13_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.x = dot(v1.xyz, BA_Vertex_13_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_13_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_13_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_13_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_13_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_13_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_13_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_13_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_13_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_13_CB2((uint)(27)).xyzw, r0.xyzw);
  r0.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r0.xyz);
  r0.xyz = BA_Vertex_13_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_13_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_13_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_13_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_13_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_13_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_13_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_13_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = r0.z / BA_Vertex_13_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_13_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.w = saturate(r0.x * BA_Vertex_13_CB0((uint)(55)).z + BA_Vertex_13_CB0((uint)(55)).w);
  o2.xy = float2(0,0);
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_14_CB2(uint i)
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

float4 BA_Vertex_14_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_14_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float2 o2 : TEXCOORD2,
  out float4 o3 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_14_CB1((uint)(1)).xy + BA_Vertex_14_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.x = dot(v1.xyz, BA_Vertex_14_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_14_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_14_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_14_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_14_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_14_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_14_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_14_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_14_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_14_CB2((uint)(27)).xyzw, r0.xyzw);
  r0.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r0.xyz);
  r0.xyz = BA_Vertex_14_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_14_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_14_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_14_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_14_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_14_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_14_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_14_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = r0.z / BA_Vertex_14_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_14_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.w = BA_Vertex_14_CB0((uint)(55)).x * r0.x;
  o2.xy = float2(0,0);
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_15_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  return value;
}

float4 BA_Vertex_15_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_15_CB0(uint i)
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
  float2 v3 : TEXCOORD1,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float2 o2 : TEXCOORD2,
  out float4 o3 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_15_CB1((uint)(1)).xy + BA_Vertex_15_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  o1.xy = v3.xy * BA_Vertex_15_CB2((uint)(23)).xy + BA_Vertex_15_CB2((uint)(23)).zw;
  o1.z = 0;
  o2.xy = float2(0,0);
  r0.xyz = BA_Vertex_15_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_15_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_15_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_15_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_15_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_15_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_15_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o3.xyzw = BA_Vertex_15_CB0((uint)(76)).xyzw + r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_16_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  return value;
}

float4 BA_Vertex_16_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_16_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
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
  float2 v3 : TEXCOORD1,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float2 o2 : TEXCOORD2,
  out float4 o3 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_16_CB1((uint)(1)).xy + BA_Vertex_16_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.xyz = BA_Vertex_16_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_16_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_16_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_16_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_16_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_16_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_16_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_16_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = r0.z / BA_Vertex_16_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_16_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_16_CB0((uint)(55)).z + BA_Vertex_16_CB0((uint)(55)).w);
  o1.xy = v3.xy * BA_Vertex_16_CB2((uint)(23)).xy + BA_Vertex_16_CB2((uint)(23)).zw;
  o2.xy = float2(0,0);
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_17_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  return value;
}

float4 BA_Vertex_17_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_17_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
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
  float2 v3 : TEXCOORD1,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float2 o2 : TEXCOORD2,
  out float4 o3 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_17_CB1((uint)(1)).xy + BA_Vertex_17_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.xyz = BA_Vertex_17_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_17_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_17_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_17_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_17_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_17_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_17_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_17_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = r0.z / BA_Vertex_17_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_17_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = BA_Vertex_17_CB0((uint)(55)).x * r0.x;
  o1.xy = v3.xy * BA_Vertex_17_CB2((uint)(23)).xy + BA_Vertex_17_CB2((uint)(23)).zw;
  o2.xy = float2(0,0);
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_18_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_18_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 2u) value = float4(_PrefabLightmapTex_ST.x, _PrefabLightmapTex_ST.y, _PrefabLightmapTex_ST.z, _PrefabLightmapTex_ST.w);
  return value;
}

float4 BA_Vertex_18_CB0(uint i)
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
  float2 v3 : TEXCOORD1,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float2 o2 : TEXCOORD2,
  out float4 o3 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_18_CB1((uint)(1)).xy + BA_Vertex_18_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  o1.xy = v3.xy * BA_Vertex_18_CB1((uint)(2)).xy + BA_Vertex_18_CB1((uint)(2)).zw;
  o1.z = 0;
  o2.xy = float2(0,0);
  r0.xyz = BA_Vertex_18_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_18_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_18_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_18_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_18_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_18_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_18_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o3.xyzw = BA_Vertex_18_CB0((uint)(76)).xyzw + r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_19_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_19_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 2u) value = float4(_PrefabLightmapTex_ST.x, _PrefabLightmapTex_ST.y, _PrefabLightmapTex_ST.z, _PrefabLightmapTex_ST.w);
  return value;
}

float4 BA_Vertex_19_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
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
  float2 v3 : TEXCOORD1,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float2 o2 : TEXCOORD2,
  out float4 o3 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_19_CB1((uint)(1)).xy + BA_Vertex_19_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.xyz = BA_Vertex_19_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_19_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_19_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_19_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_19_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_19_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_19_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_19_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = r0.z / BA_Vertex_19_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_19_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = saturate(r0.x * BA_Vertex_19_CB0((uint)(55)).z + BA_Vertex_19_CB0((uint)(55)).w);
  o1.xy = v3.xy * BA_Vertex_19_CB1((uint)(2)).xy + BA_Vertex_19_CB1((uint)(2)).zw;
  o2.xy = float2(0,0);
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_20_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_20_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 2u) value = float4(_PrefabLightmapTex_ST.x, _PrefabLightmapTex_ST.y, _PrefabLightmapTex_ST.z, _PrefabLightmapTex_ST.w);
  return value;
}

float4 BA_Vertex_20_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
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
  float2 v3 : TEXCOORD1,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float2 o2 : TEXCOORD2,
  out float4 o3 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_20_CB1((uint)(1)).xy + BA_Vertex_20_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.xyz = BA_Vertex_20_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_20_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_20_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_20_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_20_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_20_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_20_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_20_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = r0.z / BA_Vertex_20_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_20_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.z = BA_Vertex_20_CB0((uint)(55)).x * r0.x;
  o1.xy = v3.xy * BA_Vertex_20_CB1((uint)(2)).xy + BA_Vertex_20_CB1((uint)(2)).zw;
  o2.xy = float2(0,0);
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_21_CB2(uint i)
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

float4 BA_Vertex_21_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_21_CB0(uint i)
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
  float2 v2 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float2 o2 : TEXCOORD2,
  out float4 o3 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_21_CB1((uint)(1)).xy + BA_Vertex_21_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.x = dot(v1.xyz, BA_Vertex_21_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_21_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_21_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_21_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_21_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_21_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_21_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_21_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_21_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_21_CB2((uint)(27)).xyzw, r0.xyzw);
  r0.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r0.xyz);
  o1.w = 0;
  o2.xy = float2(0,0);
  r0.xyz = BA_Vertex_21_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_21_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_21_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_21_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_21_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_21_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_21_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o3.xyzw = BA_Vertex_21_CB0((uint)(76)).xyzw + r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_22_CB2(uint i)
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

float4 BA_Vertex_22_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_22_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float2 o2 : TEXCOORD2,
  out float4 o3 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_22_CB1((uint)(1)).xy + BA_Vertex_22_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.x = dot(v1.xyz, BA_Vertex_22_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_22_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_22_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_22_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_22_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_22_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_22_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_22_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_22_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_22_CB2((uint)(27)).xyzw, r0.xyzw);
  r0.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r0.xyz);
  r0.xyz = BA_Vertex_22_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_22_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_22_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_22_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_22_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_22_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_22_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_22_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = r0.z / BA_Vertex_22_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_22_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.w = saturate(r0.x * BA_Vertex_22_CB0((uint)(55)).z + BA_Vertex_22_CB0((uint)(55)).w);
  o2.xy = float2(0,0);
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_23_CB2(uint i)
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

float4 BA_Vertex_23_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_23_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float2 o2 : TEXCOORD2,
  out float4 o3 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_23_CB1((uint)(1)).xy + BA_Vertex_23_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.x = dot(v1.xyz, BA_Vertex_23_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_23_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_23_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_23_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_23_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_23_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_23_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_23_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_23_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_23_CB2((uint)(27)).xyzw, r0.xyzw);
  r0.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r0.xyz);
  r0.xyz = BA_Vertex_23_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_23_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_23_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_23_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_23_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_23_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_23_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_23_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = r0.z / BA_Vertex_23_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_23_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o1.w = BA_Vertex_23_CB0((uint)(55)).x * r0.x;
  o2.xy = float2(0,0);
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_24_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_24_CB2(uint i)
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

float4 BA_Vertex_24_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_24_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_24_CB1((uint)(1)).xy + BA_Vertex_24_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.x = dot(v1.xyz, BA_Vertex_24_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_24_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_24_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_24_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_24_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_24_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_24_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_24_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_24_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_24_CB2((uint)(27)).xyzw, r0.xyzw);
  r0.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r0.xyz);
  o1.w = 0;
  o2.xy = float2(0,0);
  r0.xy = BA_Vertex_24_CB3((uint)(1)).xy * BA_Vertex_24_CB0((uint)(125)).yy;
  r0.xy = BA_Vertex_24_CB3((uint)(0)).xy * BA_Vertex_24_CB0((uint)(125)).xx + r0.xy;
  r0.xy = BA_Vertex_24_CB3((uint)(2)).xy * BA_Vertex_24_CB0((uint)(125)).zz + r0.xy;
  r0.xy = BA_Vertex_24_CB3((uint)(3)).xy + r0.xy;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r1.xyz = BA_Vertex_24_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_24_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_24_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_24_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_24_CB3((uint)(1)).xyz * r1.yyy;
  r2.xyz = BA_Vertex_24_CB3((uint)(0)).xyz * r1.xxx + r2.xyz;
  r2.xyz = BA_Vertex_24_CB3((uint)(2)).xyz * r1.zzz + r2.xyz;
  r2.xyz = BA_Vertex_24_CB3((uint)(3)).xyz + r2.xyz;
  r0.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r1.w = saturate(BA_Vertex_24_CB0((uint)(125)).w);
  r0.xy = -r0.xy * r1.ww + r0.zw;
  r0.z = max(1, BA_Vertex_24_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.xyzw = BA_Vertex_24_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_24_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_24_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  o4.xyzw = BA_Vertex_24_CB0((uint)(76)).xyzw + r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_25_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_25_CB2(uint i)
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

float4 BA_Vertex_25_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_25_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_25_CB1((uint)(1)).xy + BA_Vertex_25_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.x = dot(v1.xyz, BA_Vertex_25_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_25_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_25_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_25_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_25_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_25_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_25_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_25_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_25_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_25_CB2((uint)(27)).xyzw, r0.xyzw);
  r0.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r0.xyz);
  r0.xyz = BA_Vertex_25_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_25_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_25_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_25_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_25_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_25_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_25_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_25_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = r1.z / BA_Vertex_25_CB0((uint)(17)).y;
  o4.xyzw = r1.xyzw;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_25_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_25_CB0((uint)(55)).z + BA_Vertex_25_CB0((uint)(55)).w);
  o2.xy = float2(0,0);
  r1.xyz = BA_Vertex_25_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_25_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_25_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_25_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_25_CB3((uint)(1)).xy * BA_Vertex_25_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_25_CB3((uint)(0)).xy * BA_Vertex_25_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_25_CB3((uint)(2)).xy * BA_Vertex_25_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_25_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_25_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_25_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_26_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_26_CB2(uint i)
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

float4 BA_Vertex_26_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_26_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_26_CB1((uint)(1)).xy + BA_Vertex_26_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.x = dot(v1.xyz, BA_Vertex_26_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_26_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_26_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_26_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_26_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_26_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_26_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_26_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_26_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_26_CB2((uint)(27)).xyzw, r0.xyzw);
  r0.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r0.xyz);
  r0.xyz = BA_Vertex_26_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_26_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_26_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_26_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_26_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_26_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_26_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_26_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = r1.z / BA_Vertex_26_CB0((uint)(17)).y;
  o4.xyzw = r1.xyzw;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_26_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_26_CB0((uint)(55)).x * r0.w;
  o2.xy = float2(0,0);
  r1.xyz = BA_Vertex_26_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_26_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_26_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_26_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_26_CB3((uint)(1)).xy * BA_Vertex_26_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_26_CB3((uint)(0)).xy * BA_Vertex_26_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_26_CB3((uint)(2)).xy * BA_Vertex_26_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_26_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_26_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_26_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_27_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_27_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  return value;
}

float4 BA_Vertex_27_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_27_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float2 v3 : TEXCOORD1,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_27_CB1((uint)(1)).xy + BA_Vertex_27_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  o1.xy = v3.xy * BA_Vertex_27_CB2((uint)(23)).xy + BA_Vertex_27_CB2((uint)(23)).zw;
  o1.z = 0;
  o2.xy = float2(0,0);
  r0.xy = BA_Vertex_27_CB3((uint)(1)).xy * BA_Vertex_27_CB0((uint)(125)).yy;
  r0.xy = BA_Vertex_27_CB3((uint)(0)).xy * BA_Vertex_27_CB0((uint)(125)).xx + r0.xy;
  r0.xy = BA_Vertex_27_CB3((uint)(2)).xy * BA_Vertex_27_CB0((uint)(125)).zz + r0.xy;
  r0.xy = BA_Vertex_27_CB3((uint)(3)).xy + r0.xy;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r1.xyz = BA_Vertex_27_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_27_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_27_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_27_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_27_CB3((uint)(1)).xyz * r1.yyy;
  r2.xyz = BA_Vertex_27_CB3((uint)(0)).xyz * r1.xxx + r2.xyz;
  r2.xyz = BA_Vertex_27_CB3((uint)(2)).xyz * r1.zzz + r2.xyz;
  r2.xyz = BA_Vertex_27_CB3((uint)(3)).xyz + r2.xyz;
  r0.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r1.w = saturate(BA_Vertex_27_CB0((uint)(125)).w);
  r0.xy = -r0.xy * r1.ww + r0.zw;
  r0.z = max(1, BA_Vertex_27_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.xyzw = BA_Vertex_27_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_27_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_27_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  o4.xyzw = BA_Vertex_27_CB0((uint)(76)).xyzw + r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_28_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_28_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  return value;
}

float4 BA_Vertex_28_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_28_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float2 v3 : TEXCOORD1,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_28_CB1((uint)(1)).xy + BA_Vertex_28_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.xyz = BA_Vertex_28_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_28_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_28_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_28_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_28_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_28_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_28_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_28_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = r1.z / BA_Vertex_28_CB0((uint)(17)).y;
  o4.xyzw = r1.xyzw;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_28_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.z = saturate(r0.w * BA_Vertex_28_CB0((uint)(55)).z + BA_Vertex_28_CB0((uint)(55)).w);
  o1.xy = v3.xy * BA_Vertex_28_CB2((uint)(23)).xy + BA_Vertex_28_CB2((uint)(23)).zw;
  o2.xy = float2(0,0);
  r1.xyz = BA_Vertex_28_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_28_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_28_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_28_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_28_CB3((uint)(1)).xy * BA_Vertex_28_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_28_CB3((uint)(0)).xy * BA_Vertex_28_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_28_CB3((uint)(2)).xy * BA_Vertex_28_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_28_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_28_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_28_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_29_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_29_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  return value;
}

float4 BA_Vertex_29_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_29_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float2 v3 : TEXCOORD1,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_29_CB1((uint)(1)).xy + BA_Vertex_29_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.xyz = BA_Vertex_29_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_29_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_29_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_29_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_29_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_29_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_29_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_29_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = r1.z / BA_Vertex_29_CB0((uint)(17)).y;
  o4.xyzw = r1.xyzw;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_29_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.z = BA_Vertex_29_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy * BA_Vertex_29_CB2((uint)(23)).xy + BA_Vertex_29_CB2((uint)(23)).zw;
  o2.xy = float2(0,0);
  r1.xyz = BA_Vertex_29_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_29_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_29_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_29_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_29_CB3((uint)(1)).xy * BA_Vertex_29_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_29_CB3((uint)(0)).xy * BA_Vertex_29_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_29_CB3((uint)(2)).xy * BA_Vertex_29_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_29_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_29_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_29_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_30_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_30_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_30_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 2u) value = float4(_PrefabLightmapTex_ST.x, _PrefabLightmapTex_ST.y, _PrefabLightmapTex_ST.z, _PrefabLightmapTex_ST.w);
  return value;
}

float4 BA_Vertex_30_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float2 v3 : TEXCOORD1,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_30_CB1((uint)(1)).xy + BA_Vertex_30_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  o1.xy = v3.xy * BA_Vertex_30_CB1((uint)(2)).xy + BA_Vertex_30_CB1((uint)(2)).zw;
  o1.z = 0;
  o2.xy = float2(0,0);
  r0.xy = BA_Vertex_30_CB3((uint)(1)).xy * BA_Vertex_30_CB0((uint)(125)).yy;
  r0.xy = BA_Vertex_30_CB3((uint)(0)).xy * BA_Vertex_30_CB0((uint)(125)).xx + r0.xy;
  r0.xy = BA_Vertex_30_CB3((uint)(2)).xy * BA_Vertex_30_CB0((uint)(125)).zz + r0.xy;
  r0.xy = BA_Vertex_30_CB3((uint)(3)).xy + r0.xy;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r1.xyz = BA_Vertex_30_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_30_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_30_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_30_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_30_CB3((uint)(1)).xyz * r1.yyy;
  r2.xyz = BA_Vertex_30_CB3((uint)(0)).xyz * r1.xxx + r2.xyz;
  r2.xyz = BA_Vertex_30_CB3((uint)(2)).xyz * r1.zzz + r2.xyz;
  r2.xyz = BA_Vertex_30_CB3((uint)(3)).xyz + r2.xyz;
  r0.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r1.w = saturate(BA_Vertex_30_CB0((uint)(125)).w);
  r0.xy = -r0.xy * r1.ww + r0.zw;
  r0.z = max(1, BA_Vertex_30_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.xyzw = BA_Vertex_30_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_30_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_30_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  o4.xyzw = BA_Vertex_30_CB0((uint)(76)).xyzw + r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_31_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_31_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_31_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 2u) value = float4(_PrefabLightmapTex_ST.x, _PrefabLightmapTex_ST.y, _PrefabLightmapTex_ST.z, _PrefabLightmapTex_ST.w);
  return value;
}

float4 BA_Vertex_31_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float2 v3 : TEXCOORD1,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_31_CB1((uint)(1)).xy + BA_Vertex_31_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.xyz = BA_Vertex_31_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_31_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_31_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_31_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_31_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_31_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_31_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_31_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = r1.z / BA_Vertex_31_CB0((uint)(17)).y;
  o4.xyzw = r1.xyzw;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_31_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.z = saturate(r0.w * BA_Vertex_31_CB0((uint)(55)).z + BA_Vertex_31_CB0((uint)(55)).w);
  o1.xy = v3.xy * BA_Vertex_31_CB1((uint)(2)).xy + BA_Vertex_31_CB1((uint)(2)).zw;
  o2.xy = float2(0,0);
  r1.xyz = BA_Vertex_31_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_31_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_31_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_31_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_31_CB3((uint)(1)).xy * BA_Vertex_31_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_31_CB3((uint)(0)).xy * BA_Vertex_31_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_31_CB3((uint)(2)).xy * BA_Vertex_31_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_31_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_31_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_31_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_32_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_32_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_32_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 2u) value = float4(_PrefabLightmapTex_ST.x, _PrefabLightmapTex_ST.y, _PrefabLightmapTex_ST.z, _PrefabLightmapTex_ST.w);
  return value;
}

float4 BA_Vertex_32_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float2 v3 : TEXCOORD1,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_32_CB1((uint)(1)).xy + BA_Vertex_32_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.xyz = BA_Vertex_32_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_32_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_32_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_32_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_32_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_32_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_32_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_32_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = r1.z / BA_Vertex_32_CB0((uint)(17)).y;
  o4.xyzw = r1.xyzw;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_32_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.z = BA_Vertex_32_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy * BA_Vertex_32_CB1((uint)(2)).xy + BA_Vertex_32_CB1((uint)(2)).zw;
  o2.xy = float2(0,0);
  r1.xyz = BA_Vertex_32_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_32_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_32_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_32_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_32_CB3((uint)(1)).xy * BA_Vertex_32_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_32_CB3((uint)(0)).xy * BA_Vertex_32_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_32_CB3((uint)(2)).xy * BA_Vertex_32_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_32_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_32_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_32_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_33_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_33_CB2(uint i)
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

float4 BA_Vertex_33_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_33_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_33_CB1((uint)(1)).xy + BA_Vertex_33_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.x = dot(v1.xyz, BA_Vertex_33_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_33_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_33_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_33_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_33_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_33_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_33_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_33_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_33_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_33_CB2((uint)(27)).xyzw, r0.xyzw);
  r0.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r0.xyz);
  o1.w = 0;
  o2.xy = float2(0,0);
  r0.xy = BA_Vertex_33_CB3((uint)(1)).xy * BA_Vertex_33_CB0((uint)(125)).yy;
  r0.xy = BA_Vertex_33_CB3((uint)(0)).xy * BA_Vertex_33_CB0((uint)(125)).xx + r0.xy;
  r0.xy = BA_Vertex_33_CB3((uint)(2)).xy * BA_Vertex_33_CB0((uint)(125)).zz + r0.xy;
  r0.xy = BA_Vertex_33_CB3((uint)(3)).xy + r0.xy;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r1.xyz = BA_Vertex_33_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_33_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_33_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_33_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_33_CB3((uint)(1)).xyz * r1.yyy;
  r2.xyz = BA_Vertex_33_CB3((uint)(0)).xyz * r1.xxx + r2.xyz;
  r2.xyz = BA_Vertex_33_CB3((uint)(2)).xyz * r1.zzz + r2.xyz;
  r2.xyz = BA_Vertex_33_CB3((uint)(3)).xyz + r2.xyz;
  r0.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r1.w = saturate(BA_Vertex_33_CB0((uint)(125)).w);
  r0.xy = -r0.xy * r1.ww + r0.zw;
  r0.z = max(1, BA_Vertex_33_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.xyzw = BA_Vertex_33_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_33_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_33_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  o4.xyzw = BA_Vertex_33_CB0((uint)(76)).xyzw + r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_34_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_34_CB2(uint i)
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

float4 BA_Vertex_34_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_34_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_34_CB1((uint)(1)).xy + BA_Vertex_34_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.x = dot(v1.xyz, BA_Vertex_34_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_34_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_34_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_34_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_34_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_34_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_34_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_34_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_34_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_34_CB2((uint)(27)).xyzw, r0.xyzw);
  r0.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r0.xyz);
  r0.xyz = BA_Vertex_34_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_34_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_34_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_34_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_34_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_34_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_34_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_34_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = r1.z / BA_Vertex_34_CB0((uint)(17)).y;
  o4.xyzw = r1.xyzw;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_34_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_34_CB0((uint)(55)).z + BA_Vertex_34_CB0((uint)(55)).w);
  o2.xy = float2(0,0);
  r1.xyz = BA_Vertex_34_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_34_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_34_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_34_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_34_CB3((uint)(1)).xy * BA_Vertex_34_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_34_CB3((uint)(0)).xy * BA_Vertex_34_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_34_CB3((uint)(2)).xy * BA_Vertex_34_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_34_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_34_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_34_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_35_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_35_CB2(uint i)
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

float4 BA_Vertex_35_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_35_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.zw = v2.xy * BA_Vertex_35_CB1((uint)(1)).xy + BA_Vertex_35_CB1((uint)(1)).zw;
  o0.xy = v2.xy;
  r0.x = dot(v1.xyz, BA_Vertex_35_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_35_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_35_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_35_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_35_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_35_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_35_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_35_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_35_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_35_CB2((uint)(27)).xyzw, r0.xyzw);
  r0.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r0.xyz);
  r0.xyz = BA_Vertex_35_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_35_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_35_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_35_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_35_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_35_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_35_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_35_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = r1.z / BA_Vertex_35_CB0((uint)(17)).y;
  o4.xyzw = r1.xyzw;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_35_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_35_CB0((uint)(55)).x * r0.w;
  o2.xy = float2(0,0);
  r1.xyz = BA_Vertex_35_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_35_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_35_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_35_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_35_CB3((uint)(1)).xy * BA_Vertex_35_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_35_CB3((uint)(0)).xy * BA_Vertex_35_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_35_CB3((uint)(2)).xy * BA_Vertex_35_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_35_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_35_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_35_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_48_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_48_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_48_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_48_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_48_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.yyy * r2.xyz;
  r1.xyz = r1.xyz * r3.xxx + r2.xyz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_48_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_48_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r3.zzz + r1.xyz;
  r0.xyz = r0.xyz * r3.www + r1.xyz;
  r0.xyz = BA_Fragment_48_CB1((uint)(0)).xyz * r0.xyz;
  o0.xyz = v1.xyz * r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_49_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_49_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_49_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_49_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_49_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.yyy * r2.xyz;
  r1.xyz = r1.xyz * r3.xxx + r2.xyz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_49_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_49_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r3.zzz + r1.xyz;
  r0.xyz = r0.xyz * r3.www + r1.xyz;
  r0.xyz = BA_Fragment_49_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = v1.xyz * r0.xyz + -BA_Fragment_49_CB0((uint)(56)).xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_49_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_50_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_50_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_50_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_50_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_50_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.yyy * r2.xyz;
  r1.xyz = r1.xyz * r3.xxx + r2.xyz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_50_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_50_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r3.zzz + r1.xyz;
  r0.xyz = r0.xyz * r3.www + r1.xyz;
  r0.xyz = BA_Fragment_50_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = v1.xyz * r0.xyz + -BA_Fragment_50_CB0((uint)(56)).xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_50_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_51_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_LightmapStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_51_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_51_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_51_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_51_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.yyy * r2.xyz;
  r1.xyz = r1.xyz * r3.xxx + r2.xyz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_51_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_51_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r3.zzz + r1.xyz;
  r0.xyz = r0.xyz * r3.www + r1.xyz;
  r0.xyz = BA_Fragment_51_CB1((uint)(0)).xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_51_CB0((uint)(19)).x).xyzw;
  r0.w = 1 + -BA_Fragment_51_CB1((uint)(3)).x;
  r1.xyz = BA_Fragment_51_CB1((uint)(3)).xxx * r1.xyz + r0.www;
  r1.xyz = min(r1.xyz, r1.xyz);
  o0.xyz = r1.xyz * r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_52_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_LightmapStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_52_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_52_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_52_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_52_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.yyy * r2.xyz;
  r1.xyz = r1.xyz * r3.xxx + r2.xyz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_52_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_52_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r3.zzz + r1.xyz;
  r0.xyz = r0.xyz * r3.www + r1.xyz;
  r0.xyz = BA_Fragment_52_CB1((uint)(0)).xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_52_CB0((uint)(19)).x).xyzw;
  r0.w = 1 + -BA_Fragment_52_CB1((uint)(3)).x;
  r1.xyz = BA_Fragment_52_CB1((uint)(3)).xxx * r1.xyz + r0.www;
  r1.xyz = min(r1.xyz, r1.xyz);
  r0.xyz = r1.xyz * r0.xyz + -BA_Fragment_52_CB0((uint)(56)).xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_52_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_53_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_LightmapStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_53_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_53_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_53_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_53_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.yyy * r2.xyz;
  r1.xyz = r1.xyz * r3.xxx + r2.xyz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_53_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_53_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r3.zzz + r1.xyz;
  r0.xyz = r0.xyz * r3.www + r1.xyz;
  r0.xyz = BA_Fragment_53_CB1((uint)(0)).xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_53_CB0((uint)(19)).x).xyzw;
  r0.w = 1 + -BA_Fragment_53_CB1((uint)(3)).x;
  r1.xyz = BA_Fragment_53_CB1((uint)(3)).xxx * r1.xyz + r0.www;
  r1.xyz = min(r1.xyz, r1.xyz);
  r0.xyz = r1.xyz * r0.xyz + -BA_Fragment_53_CB0((uint)(56)).xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_53_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_54_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_LightmapStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_54_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_54_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_54_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_54_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.yyy * r2.xyz;
  r1.xyz = r1.xyz * r3.xxx + r2.xyz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_54_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_54_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r3.zzz + r1.xyz;
  r0.xyz = r0.xyz * r3.www + r1.xyz;
  r0.xyz = BA_Fragment_54_CB1((uint)(0)).xyz * r0.xyz;
  r1.xyzw = _PrefabLightmapTex.SampleBias(sampler_PrefabLightmapTex, v1.xy, BA_Fragment_54_CB0((uint)(19)).x).xyzw;
  r0.w = 1 + -BA_Fragment_54_CB1((uint)(3)).x;
  r1.xyz = BA_Fragment_54_CB1((uint)(3)).xxx * r1.xyz + r0.www;
  r1.xyz = min(r1.xyz, r1.xyz);
  o0.xyz = r1.xyz * r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_55_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_LightmapStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_55_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_55_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_55_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_55_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.yyy * r2.xyz;
  r1.xyz = r1.xyz * r3.xxx + r2.xyz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_55_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_55_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r3.zzz + r1.xyz;
  r0.xyz = r0.xyz * r3.www + r1.xyz;
  r0.xyz = BA_Fragment_55_CB1((uint)(0)).xyz * r0.xyz;
  r1.xyzw = _PrefabLightmapTex.SampleBias(sampler_PrefabLightmapTex, v1.xy, BA_Fragment_55_CB0((uint)(19)).x).xyzw;
  r0.w = 1 + -BA_Fragment_55_CB1((uint)(3)).x;
  r1.xyz = BA_Fragment_55_CB1((uint)(3)).xxx * r1.xyz + r0.www;
  r1.xyz = min(r1.xyz, r1.xyz);
  r0.xyz = r1.xyz * r0.xyz + -BA_Fragment_55_CB0((uint)(56)).xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_55_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_56_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_LightmapStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_56_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_56_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_56_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_56_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.yyy * r2.xyz;
  r1.xyz = r1.xyz * r3.xxx + r2.xyz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_56_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_56_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r3.zzz + r1.xyz;
  r0.xyz = r0.xyz * r3.www + r1.xyz;
  r0.xyz = BA_Fragment_56_CB1((uint)(0)).xyz * r0.xyz;
  r1.xyzw = _PrefabLightmapTex.SampleBias(sampler_PrefabLightmapTex, v1.xy, BA_Fragment_56_CB0((uint)(19)).x).xyzw;
  r0.w = 1 + -BA_Fragment_56_CB1((uint)(3)).x;
  r1.xyz = BA_Fragment_56_CB1((uint)(3)).xxx * r1.xyz + r0.www;
  r1.xyz = min(r1.xyz, r1.xyz);
  r0.xyz = r1.xyz * r0.xyz + -BA_Fragment_56_CB0((uint)(56)).xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_56_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_57_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_57_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_57_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_57_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_57_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.yyy * r2.xyz;
  r1.xyz = r1.xyz * r3.xxx + r2.xyz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_57_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_57_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r3.zzz + r1.xyz;
  r0.xyz = r0.xyz * r3.www + r1.xyz;
  r0.xyz = BA_Fragment_57_CB1((uint)(0)).xyz * r0.xyz;
  o0.xyz = v1.xyz * r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_58_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_58_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_58_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_58_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_58_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.yyy * r2.xyz;
  r1.xyz = r1.xyz * r3.xxx + r2.xyz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_58_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_58_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r3.zzz + r1.xyz;
  r0.xyz = r0.xyz * r3.www + r1.xyz;
  r0.xyz = BA_Fragment_58_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = v1.xyz * r0.xyz + -BA_Fragment_58_CB0((uint)(56)).xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_58_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_59_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_59_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float4 v3 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_59_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_59_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_59_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.yyy * r2.xyz;
  r1.xyz = r1.xyz * r3.xxx + r2.xyz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_59_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_59_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r3.zzz + r1.xyz;
  r0.xyz = r0.xyz * r3.www + r1.xyz;
  r0.xyz = BA_Fragment_59_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = v1.xyz * r0.xyz + -BA_Fragment_59_CB0((uint)(56)).xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_59_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_60_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_60_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_60_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_60_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_60_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_60_CB0((uint)(19)).x).xyzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_60_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_60_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * r1.yyy;
  r0.xyz = r3.xyz * r1.xxx + r0.xyz;
  r0.xyz = r2.xyz * r1.zzz + r0.xyz;
  r0.xyz = r4.xyz * r1.www + r0.xyz;
  r0.xyz = BA_Fragment_60_CB1((uint)(0)).xyz * r0.xyz;
  r0.w = cmp(BA_Fragment_60_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r1.xy = v3.xy * BA_Fragment_60_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_60_CB2((uint)(30)).zw + -r1.xy;
    r2.xyzw = float4(0.5,1,0.5,1) + r1.zzww;
    r3.xyzw = r2.xxzz * r2.xxzz;
    r2.xz = float2(0.0799999982,0.0799999982) * r3.yw;
    r3.xy = r3.xz * float2(0.5,0.5) + -r1.zw;
    r3.zw = float2(1,1) + -r1.zw;
    r4.xy = min(float2(0,0), r1.zw);
    r4.xy = -r4.xy * r4.xy + r3.zw;
    r1.zw = max(float2(0,0), r1.zw);
    r1.zw = -r1.zw * r1.zw + r2.yw;
    r4.xy = float2(1,1) + r4.xy;
    r1.zw = float2(1,1) + r1.zw;
    r5.xy = float2(0.159999996,0.159999996) * r3.xy;
    r3.xy = float2(0.159999996,0.159999996) * r3.zw;
    r4.xy = float2(0.159999996,0.159999996) * r4.xy;
    r6.xy = float2(0.159999996,0.159999996) * r1.zw;
    r1.zw = float2(0.159999996,0.159999996) * r2.yw;
    r5.z = r4.x;
    r5.w = r1.z;
    r3.z = r6.x;
    r3.w = r2.x;
    r7.xyzw = r5.zwxz + r3.zwxz;
    r4.z = r5.y;
    r4.w = r1.w;
    r6.z = r3.y;
    r6.w = r2.z;
    r2.xyz = r6.zyw + r4.zyw;
    r3.xyz = r3.xzw / r7.zwy;
    r3.xyz = float3(-2.5,-0.5,1.5) + r3.xyz;
    r4.xyz = r6.zyw / r2.xyz;
    r4.xyz = float3(-2.5,-0.5,1.5) + r4.xyz;
    r3.xyz = BA_Fragment_60_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_60_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_60_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_60_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_60_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_60_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_60_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r0.w = r7.y * r2.z;
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r1.y = r8.y * r1.y;
    r1.x = r8.x * r1.x + r1.y;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.x = r8.z * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.x = r8.w * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.x = r9.x * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.x = r9.y * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.x = r9.z * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.x = r9.w * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r0.w = r0.w * r1.y + r1.x;
  } else {
    r0.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.x = 1 + -BA_Fragment_60_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_60_CB2((uint)(29)).x + r1.x;
  r1.x = cmp(0 >= v3.z);
  r1.y = cmp(v3.z >= 1);
  r1.x = (int)r1.y | (int)r1.x;
  r0.w = r1.x ? 1 : r0.w;
  r1.xyz = -BA_Fragment_60_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r0.www * r1.xyz + BA_Fragment_60_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  o0.xyz = r1.xyz * r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_61_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_61_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_61_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_61_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_61_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_61_CB0((uint)(19)).x).xyzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_61_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_61_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * r1.yyy;
  r0.xyz = r3.xyz * r1.xxx + r0.xyz;
  r0.xyz = r2.xyz * r1.zzz + r0.xyz;
  r0.xyz = r4.xyz * r1.www + r0.xyz;
  r0.xyz = BA_Fragment_61_CB1((uint)(0)).xyz * r0.xyz;
  r0.w = cmp(BA_Fragment_61_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r1.xy = v3.xy * BA_Fragment_61_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_61_CB2((uint)(30)).zw + -r1.xy;
    r2.xyzw = float4(0.5,1,0.5,1) + r1.zzww;
    r3.xyzw = r2.xxzz * r2.xxzz;
    r2.xz = float2(0.0799999982,0.0799999982) * r3.yw;
    r3.xy = r3.xz * float2(0.5,0.5) + -r1.zw;
    r3.zw = float2(1,1) + -r1.zw;
    r4.xy = min(float2(0,0), r1.zw);
    r4.xy = -r4.xy * r4.xy + r3.zw;
    r1.zw = max(float2(0,0), r1.zw);
    r1.zw = -r1.zw * r1.zw + r2.yw;
    r4.xy = float2(1,1) + r4.xy;
    r1.zw = float2(1,1) + r1.zw;
    r5.xy = float2(0.159999996,0.159999996) * r3.xy;
    r3.xy = float2(0.159999996,0.159999996) * r3.zw;
    r4.xy = float2(0.159999996,0.159999996) * r4.xy;
    r6.xy = float2(0.159999996,0.159999996) * r1.zw;
    r1.zw = float2(0.159999996,0.159999996) * r2.yw;
    r5.z = r4.x;
    r5.w = r1.z;
    r3.z = r6.x;
    r3.w = r2.x;
    r7.xyzw = r5.zwxz + r3.zwxz;
    r4.z = r5.y;
    r4.w = r1.w;
    r6.z = r3.y;
    r6.w = r2.z;
    r2.xyz = r6.zyw + r4.zyw;
    r3.xyz = r3.xzw / r7.zwy;
    r3.xyz = float3(-2.5,-0.5,1.5) + r3.xyz;
    r4.xyz = r6.zyw / r2.xyz;
    r4.xyz = float3(-2.5,-0.5,1.5) + r4.xyz;
    r3.xyz = BA_Fragment_61_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_61_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_61_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_61_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_61_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_61_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_61_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r0.w = r7.y * r2.z;
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r1.y = r8.y * r1.y;
    r1.x = r8.x * r1.x + r1.y;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.x = r8.z * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.x = r8.w * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.x = r9.x * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.x = r9.y * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.x = r9.z * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.x = r9.w * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r0.w = r0.w * r1.y + r1.x;
  } else {
    r0.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.x = 1 + -BA_Fragment_61_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_61_CB2((uint)(29)).x + r1.x;
  r1.x = cmp(0 >= v3.z);
  r1.y = cmp(v3.z >= 1);
  r1.x = (int)r1.y | (int)r1.x;
  r0.w = r1.x ? 1 : r0.w;
  r1.xyz = -BA_Fragment_61_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r0.www * r1.xyz + BA_Fragment_61_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r0.xyz = r1.xyz * r0.xyz + -BA_Fragment_61_CB0((uint)(56)).xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_61_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_62_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_62_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_62_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_62_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_62_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_62_CB0((uint)(19)).x).xyzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_62_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_62_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * r1.yyy;
  r0.xyz = r3.xyz * r1.xxx + r0.xyz;
  r0.xyz = r2.xyz * r1.zzz + r0.xyz;
  r0.xyz = r4.xyz * r1.www + r0.xyz;
  r0.xyz = BA_Fragment_62_CB1((uint)(0)).xyz * r0.xyz;
  r0.w = cmp(BA_Fragment_62_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r1.xy = v3.xy * BA_Fragment_62_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_62_CB2((uint)(30)).zw + -r1.xy;
    r2.xyzw = float4(0.5,1,0.5,1) + r1.zzww;
    r3.xyzw = r2.xxzz * r2.xxzz;
    r2.xz = float2(0.0799999982,0.0799999982) * r3.yw;
    r3.xy = r3.xz * float2(0.5,0.5) + -r1.zw;
    r3.zw = float2(1,1) + -r1.zw;
    r4.xy = min(float2(0,0), r1.zw);
    r4.xy = -r4.xy * r4.xy + r3.zw;
    r1.zw = max(float2(0,0), r1.zw);
    r1.zw = -r1.zw * r1.zw + r2.yw;
    r4.xy = float2(1,1) + r4.xy;
    r1.zw = float2(1,1) + r1.zw;
    r5.xy = float2(0.159999996,0.159999996) * r3.xy;
    r3.xy = float2(0.159999996,0.159999996) * r3.zw;
    r4.xy = float2(0.159999996,0.159999996) * r4.xy;
    r6.xy = float2(0.159999996,0.159999996) * r1.zw;
    r1.zw = float2(0.159999996,0.159999996) * r2.yw;
    r5.z = r4.x;
    r5.w = r1.z;
    r3.z = r6.x;
    r3.w = r2.x;
    r7.xyzw = r5.zwxz + r3.zwxz;
    r4.z = r5.y;
    r4.w = r1.w;
    r6.z = r3.y;
    r6.w = r2.z;
    r2.xyz = r6.zyw + r4.zyw;
    r3.xyz = r3.xzw / r7.zwy;
    r3.xyz = float3(-2.5,-0.5,1.5) + r3.xyz;
    r4.xyz = r6.zyw / r2.xyz;
    r4.xyz = float3(-2.5,-0.5,1.5) + r4.xyz;
    r3.xyz = BA_Fragment_62_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_62_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_62_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_62_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_62_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_62_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_62_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r0.w = r7.y * r2.z;
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r1.y = r8.y * r1.y;
    r1.x = r8.x * r1.x + r1.y;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.x = r8.z * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.x = r8.w * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.x = r9.x * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.x = r9.y * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.x = r9.z * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.x = r9.w * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r0.w = r0.w * r1.y + r1.x;
  } else {
    r0.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.x = 1 + -BA_Fragment_62_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_62_CB2((uint)(29)).x + r1.x;
  r1.x = cmp(0 >= v3.z);
  r1.y = cmp(v3.z >= 1);
  r1.x = (int)r1.y | (int)r1.x;
  r0.w = r1.x ? 1 : r0.w;
  r1.xyz = -BA_Fragment_62_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r0.www * r1.xyz + BA_Fragment_62_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  r0.xyz = r1.xyz * r0.xyz + -BA_Fragment_62_CB0((uint)(56)).xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_62_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_63_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_63_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_LightmapStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_63_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_63_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_63_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_63_CB0((uint)(19)).x).xyzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_63_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_63_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * r1.yyy;
  r0.xyz = r3.xyz * r1.xxx + r0.xyz;
  r0.xyz = r2.xyz * r1.zzz + r0.xyz;
  r0.xyz = r4.xyz * r1.www + r0.xyz;
  r0.xyz = BA_Fragment_63_CB1((uint)(0)).xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_63_CB0((uint)(19)).x).xyzw;
  r0.w = 1 + -BA_Fragment_63_CB1((uint)(3)).x;
  r1.xyz = BA_Fragment_63_CB1((uint)(3)).xxx * r1.xyz + r0.www;
  r0.w = cmp(BA_Fragment_63_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r2.xy = v3.xy * BA_Fragment_63_CB2((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r2.zw = v3.xy * BA_Fragment_63_CB2((uint)(30)).zw + -r2.xy;
    r3.xyzw = float4(0.5,1,0.5,1) + r2.zzww;
    r4.xyzw = r3.xxzz * r3.xxzz;
    r3.xz = float2(0.0799999982,0.0799999982) * r4.yw;
    r4.xy = r4.xz * float2(0.5,0.5) + -r2.zw;
    r4.zw = float2(1,1) + -r2.zw;
    r5.xy = min(float2(0,0), r2.zw);
    r5.xy = -r5.xy * r5.xy + r4.zw;
    r2.zw = max(float2(0,0), r2.zw);
    r2.zw = -r2.zw * r2.zw + r3.yw;
    r5.xy = float2(1,1) + r5.xy;
    r2.zw = float2(1,1) + r2.zw;
    r6.xy = float2(0.159999996,0.159999996) * r4.xy;
    r4.xy = float2(0.159999996,0.159999996) * r4.zw;
    r5.xy = float2(0.159999996,0.159999996) * r5.xy;
    r7.xy = float2(0.159999996,0.159999996) * r2.zw;
    r2.zw = float2(0.159999996,0.159999996) * r3.yw;
    r6.z = r5.x;
    r6.w = r2.z;
    r4.z = r7.x;
    r4.w = r3.x;
    r8.xyzw = r6.zwxz + r4.zwxz;
    r5.z = r6.y;
    r5.w = r2.w;
    r7.z = r4.y;
    r7.w = r3.z;
    r3.xyz = r7.zyw + r5.zyw;
    r4.xyz = r4.xzw / r8.zwy;
    r4.xyz = float3(-2.5,-0.5,1.5) + r4.xyz;
    r5.xyz = r7.zyw / r3.xyz;
    r5.xyz = float3(-2.5,-0.5,1.5) + r5.xyz;
    r4.xyz = BA_Fragment_63_CB2((uint)(30)).xxx * r4.yxz;
    r5.xyz = BA_Fragment_63_CB2((uint)(30)).yyy * r5.xyz;
    r4.w = r5.x;
    r6.xyzw = r2.xyxy * BA_Fragment_63_CB2((uint)(30)).xyxy + r4.ywxw;
    r2.zw = r2.xy * BA_Fragment_63_CB2((uint)(30)).xy + r4.zw;
    r5.w = r4.y;
    r4.yw = r5.yz;
    r7.xyzw = r2.xyxy * BA_Fragment_63_CB2((uint)(30)).xyxy + r4.xyzy;
    r5.xyzw = r2.xyxy * BA_Fragment_63_CB2((uint)(30)).xyxy + r5.wywz;
    r4.xyzw = r2.xyxy * BA_Fragment_63_CB2((uint)(30)).xyxy + r4.xwzw;
    r9.xyzw = r8.zwyz * r3.xxxy;
    r10.xyzw = r8.xyzw * r3.yyzz;
    r0.w = r8.y * r3.z;
    r1.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r2.x = r9.y * r2.x;
    r1.w = r9.x * r1.w + r2.x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r2.zw, v3.z).x;
    r1.w = r9.z * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r1.w = r9.w * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v3.z).x;
    r1.w = r10.x * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v3.z).x;
    r1.w = r10.y * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r1.w = r10.z * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.w = r10.w * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r0.w = r0.w * r2.x + r1.w;
  } else {
    r0.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.w = 1 + -BA_Fragment_63_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_63_CB2((uint)(29)).x + r1.w;
  r1.w = cmp(0 >= v3.z);
  r2.x = cmp(v3.z >= 1);
  r1.w = (int)r1.w | (int)r2.x;
  r0.w = r1.w ? 1 : r0.w;
  r2.xyz = -BA_Fragment_63_CB0((uint)(2)).xyz + r1.xyz;
  r2.xyz = r0.www * r2.xyz + BA_Fragment_63_CB0((uint)(2)).xyz;
  r1.xyz = min(r2.xyz, r1.xyz);
  o0.xyz = r1.xyz * r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_64_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_64_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_LightmapStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_64_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_64_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_64_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_64_CB0((uint)(19)).x).xyzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_64_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_64_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * r1.yyy;
  r0.xyz = r3.xyz * r1.xxx + r0.xyz;
  r0.xyz = r2.xyz * r1.zzz + r0.xyz;
  r0.xyz = r4.xyz * r1.www + r0.xyz;
  r0.xyz = BA_Fragment_64_CB1((uint)(0)).xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_64_CB0((uint)(19)).x).xyzw;
  r0.w = 1 + -BA_Fragment_64_CB1((uint)(3)).x;
  r1.xyz = BA_Fragment_64_CB1((uint)(3)).xxx * r1.xyz + r0.www;
  r0.w = cmp(BA_Fragment_64_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r2.xy = v3.xy * BA_Fragment_64_CB2((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r2.zw = v3.xy * BA_Fragment_64_CB2((uint)(30)).zw + -r2.xy;
    r3.xyzw = float4(0.5,1,0.5,1) + r2.zzww;
    r4.xyzw = r3.xxzz * r3.xxzz;
    r3.xz = float2(0.0799999982,0.0799999982) * r4.yw;
    r4.xy = r4.xz * float2(0.5,0.5) + -r2.zw;
    r4.zw = float2(1,1) + -r2.zw;
    r5.xy = min(float2(0,0), r2.zw);
    r5.xy = -r5.xy * r5.xy + r4.zw;
    r2.zw = max(float2(0,0), r2.zw);
    r2.zw = -r2.zw * r2.zw + r3.yw;
    r5.xy = float2(1,1) + r5.xy;
    r2.zw = float2(1,1) + r2.zw;
    r6.xy = float2(0.159999996,0.159999996) * r4.xy;
    r4.xy = float2(0.159999996,0.159999996) * r4.zw;
    r5.xy = float2(0.159999996,0.159999996) * r5.xy;
    r7.xy = float2(0.159999996,0.159999996) * r2.zw;
    r2.zw = float2(0.159999996,0.159999996) * r3.yw;
    r6.z = r5.x;
    r6.w = r2.z;
    r4.z = r7.x;
    r4.w = r3.x;
    r8.xyzw = r6.zwxz + r4.zwxz;
    r5.z = r6.y;
    r5.w = r2.w;
    r7.z = r4.y;
    r7.w = r3.z;
    r3.xyz = r7.zyw + r5.zyw;
    r4.xyz = r4.xzw / r8.zwy;
    r4.xyz = float3(-2.5,-0.5,1.5) + r4.xyz;
    r5.xyz = r7.zyw / r3.xyz;
    r5.xyz = float3(-2.5,-0.5,1.5) + r5.xyz;
    r4.xyz = BA_Fragment_64_CB2((uint)(30)).xxx * r4.yxz;
    r5.xyz = BA_Fragment_64_CB2((uint)(30)).yyy * r5.xyz;
    r4.w = r5.x;
    r6.xyzw = r2.xyxy * BA_Fragment_64_CB2((uint)(30)).xyxy + r4.ywxw;
    r2.zw = r2.xy * BA_Fragment_64_CB2((uint)(30)).xy + r4.zw;
    r5.w = r4.y;
    r4.yw = r5.yz;
    r7.xyzw = r2.xyxy * BA_Fragment_64_CB2((uint)(30)).xyxy + r4.xyzy;
    r5.xyzw = r2.xyxy * BA_Fragment_64_CB2((uint)(30)).xyxy + r5.wywz;
    r4.xyzw = r2.xyxy * BA_Fragment_64_CB2((uint)(30)).xyxy + r4.xwzw;
    r9.xyzw = r8.zwyz * r3.xxxy;
    r10.xyzw = r8.xyzw * r3.yyzz;
    r0.w = r8.y * r3.z;
    r1.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r2.x = r9.y * r2.x;
    r1.w = r9.x * r1.w + r2.x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r2.zw, v3.z).x;
    r1.w = r9.z * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r1.w = r9.w * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v3.z).x;
    r1.w = r10.x * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v3.z).x;
    r1.w = r10.y * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r1.w = r10.z * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.w = r10.w * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r0.w = r0.w * r2.x + r1.w;
  } else {
    r0.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.w = 1 + -BA_Fragment_64_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_64_CB2((uint)(29)).x + r1.w;
  r1.w = cmp(0 >= v3.z);
  r2.x = cmp(v3.z >= 1);
  r1.w = (int)r1.w | (int)r2.x;
  r0.w = r1.w ? 1 : r0.w;
  r2.xyz = -BA_Fragment_64_CB0((uint)(2)).xyz + r1.xyz;
  r2.xyz = r0.www * r2.xyz + BA_Fragment_64_CB0((uint)(2)).xyz;
  r1.xyz = min(r2.xyz, r1.xyz);
  r0.xyz = r1.xyz * r0.xyz + -BA_Fragment_64_CB0((uint)(56)).xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_64_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_65_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_65_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_LightmapStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_65_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_65_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_65_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_65_CB0((uint)(19)).x).xyzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_65_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_65_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * r1.yyy;
  r0.xyz = r3.xyz * r1.xxx + r0.xyz;
  r0.xyz = r2.xyz * r1.zzz + r0.xyz;
  r0.xyz = r4.xyz * r1.www + r0.xyz;
  r0.xyz = BA_Fragment_65_CB1((uint)(0)).xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_65_CB0((uint)(19)).x).xyzw;
  r0.w = 1 + -BA_Fragment_65_CB1((uint)(3)).x;
  r1.xyz = BA_Fragment_65_CB1((uint)(3)).xxx * r1.xyz + r0.www;
  r0.w = cmp(BA_Fragment_65_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r2.xy = v3.xy * BA_Fragment_65_CB2((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r2.zw = v3.xy * BA_Fragment_65_CB2((uint)(30)).zw + -r2.xy;
    r3.xyzw = float4(0.5,1,0.5,1) + r2.zzww;
    r4.xyzw = r3.xxzz * r3.xxzz;
    r3.xz = float2(0.0799999982,0.0799999982) * r4.yw;
    r4.xy = r4.xz * float2(0.5,0.5) + -r2.zw;
    r4.zw = float2(1,1) + -r2.zw;
    r5.xy = min(float2(0,0), r2.zw);
    r5.xy = -r5.xy * r5.xy + r4.zw;
    r2.zw = max(float2(0,0), r2.zw);
    r2.zw = -r2.zw * r2.zw + r3.yw;
    r5.xy = float2(1,1) + r5.xy;
    r2.zw = float2(1,1) + r2.zw;
    r6.xy = float2(0.159999996,0.159999996) * r4.xy;
    r4.xy = float2(0.159999996,0.159999996) * r4.zw;
    r5.xy = float2(0.159999996,0.159999996) * r5.xy;
    r7.xy = float2(0.159999996,0.159999996) * r2.zw;
    r2.zw = float2(0.159999996,0.159999996) * r3.yw;
    r6.z = r5.x;
    r6.w = r2.z;
    r4.z = r7.x;
    r4.w = r3.x;
    r8.xyzw = r6.zwxz + r4.zwxz;
    r5.z = r6.y;
    r5.w = r2.w;
    r7.z = r4.y;
    r7.w = r3.z;
    r3.xyz = r7.zyw + r5.zyw;
    r4.xyz = r4.xzw / r8.zwy;
    r4.xyz = float3(-2.5,-0.5,1.5) + r4.xyz;
    r5.xyz = r7.zyw / r3.xyz;
    r5.xyz = float3(-2.5,-0.5,1.5) + r5.xyz;
    r4.xyz = BA_Fragment_65_CB2((uint)(30)).xxx * r4.yxz;
    r5.xyz = BA_Fragment_65_CB2((uint)(30)).yyy * r5.xyz;
    r4.w = r5.x;
    r6.xyzw = r2.xyxy * BA_Fragment_65_CB2((uint)(30)).xyxy + r4.ywxw;
    r2.zw = r2.xy * BA_Fragment_65_CB2((uint)(30)).xy + r4.zw;
    r5.w = r4.y;
    r4.yw = r5.yz;
    r7.xyzw = r2.xyxy * BA_Fragment_65_CB2((uint)(30)).xyxy + r4.xyzy;
    r5.xyzw = r2.xyxy * BA_Fragment_65_CB2((uint)(30)).xyxy + r5.wywz;
    r4.xyzw = r2.xyxy * BA_Fragment_65_CB2((uint)(30)).xyxy + r4.xwzw;
    r9.xyzw = r8.zwyz * r3.xxxy;
    r10.xyzw = r8.xyzw * r3.yyzz;
    r0.w = r8.y * r3.z;
    r1.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r2.x = r9.y * r2.x;
    r1.w = r9.x * r1.w + r2.x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r2.zw, v3.z).x;
    r1.w = r9.z * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r1.w = r9.w * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v3.z).x;
    r1.w = r10.x * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v3.z).x;
    r1.w = r10.y * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r1.w = r10.z * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.w = r10.w * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r0.w = r0.w * r2.x + r1.w;
  } else {
    r0.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.w = 1 + -BA_Fragment_65_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_65_CB2((uint)(29)).x + r1.w;
  r1.w = cmp(0 >= v3.z);
  r2.x = cmp(v3.z >= 1);
  r1.w = (int)r1.w | (int)r2.x;
  r0.w = r1.w ? 1 : r0.w;
  r2.xyz = -BA_Fragment_65_CB0((uint)(2)).xyz + r1.xyz;
  r2.xyz = r0.www * r2.xyz + BA_Fragment_65_CB0((uint)(2)).xyz;
  r1.xyz = min(r2.xyz, r1.xyz);
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  r0.xyz = r1.xyz * r0.xyz + -BA_Fragment_65_CB0((uint)(56)).xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_65_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_66_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_66_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_LightmapStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_66_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_66_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_66_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_66_CB0((uint)(19)).x).xyzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_66_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_66_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * r1.yyy;
  r0.xyz = r3.xyz * r1.xxx + r0.xyz;
  r0.xyz = r2.xyz * r1.zzz + r0.xyz;
  r0.xyz = r4.xyz * r1.www + r0.xyz;
  r0.xyz = BA_Fragment_66_CB1((uint)(0)).xyz * r0.xyz;
  r1.xyzw = _PrefabLightmapTex.SampleBias(sampler_PrefabLightmapTex, v1.xy, BA_Fragment_66_CB0((uint)(19)).x).xyzw;
  r0.w = 1 + -BA_Fragment_66_CB1((uint)(3)).x;
  r1.xyz = BA_Fragment_66_CB1((uint)(3)).xxx * r1.xyz + r0.www;
  r0.w = cmp(BA_Fragment_66_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r2.xy = v3.xy * BA_Fragment_66_CB2((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r2.zw = v3.xy * BA_Fragment_66_CB2((uint)(30)).zw + -r2.xy;
    r3.xyzw = float4(0.5,1,0.5,1) + r2.zzww;
    r4.xyzw = r3.xxzz * r3.xxzz;
    r3.xz = float2(0.0799999982,0.0799999982) * r4.yw;
    r4.xy = r4.xz * float2(0.5,0.5) + -r2.zw;
    r4.zw = float2(1,1) + -r2.zw;
    r5.xy = min(float2(0,0), r2.zw);
    r5.xy = -r5.xy * r5.xy + r4.zw;
    r2.zw = max(float2(0,0), r2.zw);
    r2.zw = -r2.zw * r2.zw + r3.yw;
    r5.xy = float2(1,1) + r5.xy;
    r2.zw = float2(1,1) + r2.zw;
    r6.xy = float2(0.159999996,0.159999996) * r4.xy;
    r4.xy = float2(0.159999996,0.159999996) * r4.zw;
    r5.xy = float2(0.159999996,0.159999996) * r5.xy;
    r7.xy = float2(0.159999996,0.159999996) * r2.zw;
    r2.zw = float2(0.159999996,0.159999996) * r3.yw;
    r6.z = r5.x;
    r6.w = r2.z;
    r4.z = r7.x;
    r4.w = r3.x;
    r8.xyzw = r6.zwxz + r4.zwxz;
    r5.z = r6.y;
    r5.w = r2.w;
    r7.z = r4.y;
    r7.w = r3.z;
    r3.xyz = r7.zyw + r5.zyw;
    r4.xyz = r4.xzw / r8.zwy;
    r4.xyz = float3(-2.5,-0.5,1.5) + r4.xyz;
    r5.xyz = r7.zyw / r3.xyz;
    r5.xyz = float3(-2.5,-0.5,1.5) + r5.xyz;
    r4.xyz = BA_Fragment_66_CB2((uint)(30)).xxx * r4.yxz;
    r5.xyz = BA_Fragment_66_CB2((uint)(30)).yyy * r5.xyz;
    r4.w = r5.x;
    r6.xyzw = r2.xyxy * BA_Fragment_66_CB2((uint)(30)).xyxy + r4.ywxw;
    r2.zw = r2.xy * BA_Fragment_66_CB2((uint)(30)).xy + r4.zw;
    r5.w = r4.y;
    r4.yw = r5.yz;
    r7.xyzw = r2.xyxy * BA_Fragment_66_CB2((uint)(30)).xyxy + r4.xyzy;
    r5.xyzw = r2.xyxy * BA_Fragment_66_CB2((uint)(30)).xyxy + r5.wywz;
    r4.xyzw = r2.xyxy * BA_Fragment_66_CB2((uint)(30)).xyxy + r4.xwzw;
    r9.xyzw = r8.zwyz * r3.xxxy;
    r10.xyzw = r8.xyzw * r3.yyzz;
    r0.w = r8.y * r3.z;
    r1.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r2.x = r9.y * r2.x;
    r1.w = r9.x * r1.w + r2.x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r2.zw, v3.z).x;
    r1.w = r9.z * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r1.w = r9.w * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v3.z).x;
    r1.w = r10.x * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v3.z).x;
    r1.w = r10.y * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r1.w = r10.z * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.w = r10.w * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r0.w = r0.w * r2.x + r1.w;
  } else {
    r0.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.w = 1 + -BA_Fragment_66_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_66_CB2((uint)(29)).x + r1.w;
  r1.w = cmp(0 >= v3.z);
  r2.x = cmp(v3.z >= 1);
  r1.w = (int)r1.w | (int)r2.x;
  r0.w = r1.w ? 1 : r0.w;
  r2.xyz = -BA_Fragment_66_CB0((uint)(2)).xyz + r1.xyz;
  r2.xyz = r0.www * r2.xyz + BA_Fragment_66_CB0((uint)(2)).xyz;
  r1.xyz = min(r2.xyz, r1.xyz);
  o0.xyz = r1.xyz * r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_67_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_67_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_LightmapStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_67_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_67_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_67_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_67_CB0((uint)(19)).x).xyzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_67_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_67_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * r1.yyy;
  r0.xyz = r3.xyz * r1.xxx + r0.xyz;
  r0.xyz = r2.xyz * r1.zzz + r0.xyz;
  r0.xyz = r4.xyz * r1.www + r0.xyz;
  r0.xyz = BA_Fragment_67_CB1((uint)(0)).xyz * r0.xyz;
  r1.xyzw = _PrefabLightmapTex.SampleBias(sampler_PrefabLightmapTex, v1.xy, BA_Fragment_67_CB0((uint)(19)).x).xyzw;
  r0.w = 1 + -BA_Fragment_67_CB1((uint)(3)).x;
  r1.xyz = BA_Fragment_67_CB1((uint)(3)).xxx * r1.xyz + r0.www;
  r0.w = cmp(BA_Fragment_67_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r2.xy = v3.xy * BA_Fragment_67_CB2((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r2.zw = v3.xy * BA_Fragment_67_CB2((uint)(30)).zw + -r2.xy;
    r3.xyzw = float4(0.5,1,0.5,1) + r2.zzww;
    r4.xyzw = r3.xxzz * r3.xxzz;
    r3.xz = float2(0.0799999982,0.0799999982) * r4.yw;
    r4.xy = r4.xz * float2(0.5,0.5) + -r2.zw;
    r4.zw = float2(1,1) + -r2.zw;
    r5.xy = min(float2(0,0), r2.zw);
    r5.xy = -r5.xy * r5.xy + r4.zw;
    r2.zw = max(float2(0,0), r2.zw);
    r2.zw = -r2.zw * r2.zw + r3.yw;
    r5.xy = float2(1,1) + r5.xy;
    r2.zw = float2(1,1) + r2.zw;
    r6.xy = float2(0.159999996,0.159999996) * r4.xy;
    r4.xy = float2(0.159999996,0.159999996) * r4.zw;
    r5.xy = float2(0.159999996,0.159999996) * r5.xy;
    r7.xy = float2(0.159999996,0.159999996) * r2.zw;
    r2.zw = float2(0.159999996,0.159999996) * r3.yw;
    r6.z = r5.x;
    r6.w = r2.z;
    r4.z = r7.x;
    r4.w = r3.x;
    r8.xyzw = r6.zwxz + r4.zwxz;
    r5.z = r6.y;
    r5.w = r2.w;
    r7.z = r4.y;
    r7.w = r3.z;
    r3.xyz = r7.zyw + r5.zyw;
    r4.xyz = r4.xzw / r8.zwy;
    r4.xyz = float3(-2.5,-0.5,1.5) + r4.xyz;
    r5.xyz = r7.zyw / r3.xyz;
    r5.xyz = float3(-2.5,-0.5,1.5) + r5.xyz;
    r4.xyz = BA_Fragment_67_CB2((uint)(30)).xxx * r4.yxz;
    r5.xyz = BA_Fragment_67_CB2((uint)(30)).yyy * r5.xyz;
    r4.w = r5.x;
    r6.xyzw = r2.xyxy * BA_Fragment_67_CB2((uint)(30)).xyxy + r4.ywxw;
    r2.zw = r2.xy * BA_Fragment_67_CB2((uint)(30)).xy + r4.zw;
    r5.w = r4.y;
    r4.yw = r5.yz;
    r7.xyzw = r2.xyxy * BA_Fragment_67_CB2((uint)(30)).xyxy + r4.xyzy;
    r5.xyzw = r2.xyxy * BA_Fragment_67_CB2((uint)(30)).xyxy + r5.wywz;
    r4.xyzw = r2.xyxy * BA_Fragment_67_CB2((uint)(30)).xyxy + r4.xwzw;
    r9.xyzw = r8.zwyz * r3.xxxy;
    r10.xyzw = r8.xyzw * r3.yyzz;
    r0.w = r8.y * r3.z;
    r1.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r2.x = r9.y * r2.x;
    r1.w = r9.x * r1.w + r2.x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r2.zw, v3.z).x;
    r1.w = r9.z * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r1.w = r9.w * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v3.z).x;
    r1.w = r10.x * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v3.z).x;
    r1.w = r10.y * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r1.w = r10.z * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.w = r10.w * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r0.w = r0.w * r2.x + r1.w;
  } else {
    r0.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.w = 1 + -BA_Fragment_67_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_67_CB2((uint)(29)).x + r1.w;
  r1.w = cmp(0 >= v3.z);
  r2.x = cmp(v3.z >= 1);
  r1.w = (int)r1.w | (int)r2.x;
  r0.w = r1.w ? 1 : r0.w;
  r2.xyz = -BA_Fragment_67_CB0((uint)(2)).xyz + r1.xyz;
  r2.xyz = r0.www * r2.xyz + BA_Fragment_67_CB0((uint)(2)).xyz;
  r1.xyz = min(r2.xyz, r1.xyz);
  r0.xyz = r1.xyz * r0.xyz + -BA_Fragment_67_CB0((uint)(56)).xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_67_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_68_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_68_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_LightmapStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_68_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_68_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_68_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_68_CB0((uint)(19)).x).xyzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_68_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_68_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * r1.yyy;
  r0.xyz = r3.xyz * r1.xxx + r0.xyz;
  r0.xyz = r2.xyz * r1.zzz + r0.xyz;
  r0.xyz = r4.xyz * r1.www + r0.xyz;
  r0.xyz = BA_Fragment_68_CB1((uint)(0)).xyz * r0.xyz;
  r1.xyzw = _PrefabLightmapTex.SampleBias(sampler_PrefabLightmapTex, v1.xy, BA_Fragment_68_CB0((uint)(19)).x).xyzw;
  r0.w = 1 + -BA_Fragment_68_CB1((uint)(3)).x;
  r1.xyz = BA_Fragment_68_CB1((uint)(3)).xxx * r1.xyz + r0.www;
  r0.w = cmp(BA_Fragment_68_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r2.xy = v3.xy * BA_Fragment_68_CB2((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r2.zw = v3.xy * BA_Fragment_68_CB2((uint)(30)).zw + -r2.xy;
    r3.xyzw = float4(0.5,1,0.5,1) + r2.zzww;
    r4.xyzw = r3.xxzz * r3.xxzz;
    r3.xz = float2(0.0799999982,0.0799999982) * r4.yw;
    r4.xy = r4.xz * float2(0.5,0.5) + -r2.zw;
    r4.zw = float2(1,1) + -r2.zw;
    r5.xy = min(float2(0,0), r2.zw);
    r5.xy = -r5.xy * r5.xy + r4.zw;
    r2.zw = max(float2(0,0), r2.zw);
    r2.zw = -r2.zw * r2.zw + r3.yw;
    r5.xy = float2(1,1) + r5.xy;
    r2.zw = float2(1,1) + r2.zw;
    r6.xy = float2(0.159999996,0.159999996) * r4.xy;
    r4.xy = float2(0.159999996,0.159999996) * r4.zw;
    r5.xy = float2(0.159999996,0.159999996) * r5.xy;
    r7.xy = float2(0.159999996,0.159999996) * r2.zw;
    r2.zw = float2(0.159999996,0.159999996) * r3.yw;
    r6.z = r5.x;
    r6.w = r2.z;
    r4.z = r7.x;
    r4.w = r3.x;
    r8.xyzw = r6.zwxz + r4.zwxz;
    r5.z = r6.y;
    r5.w = r2.w;
    r7.z = r4.y;
    r7.w = r3.z;
    r3.xyz = r7.zyw + r5.zyw;
    r4.xyz = r4.xzw / r8.zwy;
    r4.xyz = float3(-2.5,-0.5,1.5) + r4.xyz;
    r5.xyz = r7.zyw / r3.xyz;
    r5.xyz = float3(-2.5,-0.5,1.5) + r5.xyz;
    r4.xyz = BA_Fragment_68_CB2((uint)(30)).xxx * r4.yxz;
    r5.xyz = BA_Fragment_68_CB2((uint)(30)).yyy * r5.xyz;
    r4.w = r5.x;
    r6.xyzw = r2.xyxy * BA_Fragment_68_CB2((uint)(30)).xyxy + r4.ywxw;
    r2.zw = r2.xy * BA_Fragment_68_CB2((uint)(30)).xy + r4.zw;
    r5.w = r4.y;
    r4.yw = r5.yz;
    r7.xyzw = r2.xyxy * BA_Fragment_68_CB2((uint)(30)).xyxy + r4.xyzy;
    r5.xyzw = r2.xyxy * BA_Fragment_68_CB2((uint)(30)).xyxy + r5.wywz;
    r4.xyzw = r2.xyxy * BA_Fragment_68_CB2((uint)(30)).xyxy + r4.xwzw;
    r9.xyzw = r8.zwyz * r3.xxxy;
    r10.xyzw = r8.xyzw * r3.yyzz;
    r0.w = r8.y * r3.z;
    r1.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r2.x = r9.y * r2.x;
    r1.w = r9.x * r1.w + r2.x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r2.zw, v3.z).x;
    r1.w = r9.z * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r1.w = r9.w * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v3.z).x;
    r1.w = r10.x * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v3.z).x;
    r1.w = r10.y * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r1.w = r10.z * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.w = r10.w * r2.x + r1.w;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r0.w = r0.w * r2.x + r1.w;
  } else {
    r0.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.w = 1 + -BA_Fragment_68_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_68_CB2((uint)(29)).x + r1.w;
  r1.w = cmp(0 >= v3.z);
  r2.x = cmp(v3.z >= 1);
  r1.w = (int)r1.w | (int)r2.x;
  r0.w = r1.w ? 1 : r0.w;
  r2.xyz = -BA_Fragment_68_CB0((uint)(2)).xyz + r1.xyz;
  r2.xyz = r0.www * r2.xyz + BA_Fragment_68_CB0((uint)(2)).xyz;
  r1.xyz = min(r2.xyz, r1.xyz);
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  r0.xyz = r1.xyz * r0.xyz + -BA_Fragment_68_CB0((uint)(56)).xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_68_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_69_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_69_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_69_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_69_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_69_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_69_CB0((uint)(19)).x).xyzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_69_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_69_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * r1.yyy;
  r0.xyz = r3.xyz * r1.xxx + r0.xyz;
  r0.xyz = r2.xyz * r1.zzz + r0.xyz;
  r0.xyz = r4.xyz * r1.www + r0.xyz;
  r0.xyz = BA_Fragment_69_CB1((uint)(0)).xyz * r0.xyz;
  r0.w = cmp(BA_Fragment_69_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r1.xy = v3.xy * BA_Fragment_69_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_69_CB2((uint)(30)).zw + -r1.xy;
    r2.xyzw = float4(0.5,1,0.5,1) + r1.zzww;
    r3.xyzw = r2.xxzz * r2.xxzz;
    r2.xz = float2(0.0799999982,0.0799999982) * r3.yw;
    r3.xy = r3.xz * float2(0.5,0.5) + -r1.zw;
    r3.zw = float2(1,1) + -r1.zw;
    r4.xy = min(float2(0,0), r1.zw);
    r4.xy = -r4.xy * r4.xy + r3.zw;
    r1.zw = max(float2(0,0), r1.zw);
    r1.zw = -r1.zw * r1.zw + r2.yw;
    r4.xy = float2(1,1) + r4.xy;
    r1.zw = float2(1,1) + r1.zw;
    r5.xy = float2(0.159999996,0.159999996) * r3.xy;
    r3.xy = float2(0.159999996,0.159999996) * r3.zw;
    r4.xy = float2(0.159999996,0.159999996) * r4.xy;
    r6.xy = float2(0.159999996,0.159999996) * r1.zw;
    r1.zw = float2(0.159999996,0.159999996) * r2.yw;
    r5.z = r4.x;
    r5.w = r1.z;
    r3.z = r6.x;
    r3.w = r2.x;
    r7.xyzw = r5.zwxz + r3.zwxz;
    r4.z = r5.y;
    r4.w = r1.w;
    r6.z = r3.y;
    r6.w = r2.z;
    r2.xyz = r6.zyw + r4.zyw;
    r3.xyz = r3.xzw / r7.zwy;
    r3.xyz = float3(-2.5,-0.5,1.5) + r3.xyz;
    r4.xyz = r6.zyw / r2.xyz;
    r4.xyz = float3(-2.5,-0.5,1.5) + r4.xyz;
    r3.xyz = BA_Fragment_69_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_69_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_69_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_69_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_69_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_69_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_69_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r0.w = r7.y * r2.z;
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r1.y = r8.y * r1.y;
    r1.x = r8.x * r1.x + r1.y;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.x = r8.z * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.x = r8.w * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.x = r9.x * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.x = r9.y * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.x = r9.z * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.x = r9.w * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r0.w = r0.w * r1.y + r1.x;
  } else {
    r0.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.x = 1 + -BA_Fragment_69_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_69_CB2((uint)(29)).x + r1.x;
  r1.x = cmp(0 >= v3.z);
  r1.y = cmp(v3.z >= 1);
  r1.x = (int)r1.y | (int)r1.x;
  r0.w = r1.x ? 1 : r0.w;
  r1.xyz = -BA_Fragment_69_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r0.www * r1.xyz + BA_Fragment_69_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  o0.xyz = r1.xyz * r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_70_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_70_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_70_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_70_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_70_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_70_CB0((uint)(19)).x).xyzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_70_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_70_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * r1.yyy;
  r0.xyz = r3.xyz * r1.xxx + r0.xyz;
  r0.xyz = r2.xyz * r1.zzz + r0.xyz;
  r0.xyz = r4.xyz * r1.www + r0.xyz;
  r0.xyz = BA_Fragment_70_CB1((uint)(0)).xyz * r0.xyz;
  r0.w = cmp(BA_Fragment_70_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r1.xy = v3.xy * BA_Fragment_70_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_70_CB2((uint)(30)).zw + -r1.xy;
    r2.xyzw = float4(0.5,1,0.5,1) + r1.zzww;
    r3.xyzw = r2.xxzz * r2.xxzz;
    r2.xz = float2(0.0799999982,0.0799999982) * r3.yw;
    r3.xy = r3.xz * float2(0.5,0.5) + -r1.zw;
    r3.zw = float2(1,1) + -r1.zw;
    r4.xy = min(float2(0,0), r1.zw);
    r4.xy = -r4.xy * r4.xy + r3.zw;
    r1.zw = max(float2(0,0), r1.zw);
    r1.zw = -r1.zw * r1.zw + r2.yw;
    r4.xy = float2(1,1) + r4.xy;
    r1.zw = float2(1,1) + r1.zw;
    r5.xy = float2(0.159999996,0.159999996) * r3.xy;
    r3.xy = float2(0.159999996,0.159999996) * r3.zw;
    r4.xy = float2(0.159999996,0.159999996) * r4.xy;
    r6.xy = float2(0.159999996,0.159999996) * r1.zw;
    r1.zw = float2(0.159999996,0.159999996) * r2.yw;
    r5.z = r4.x;
    r5.w = r1.z;
    r3.z = r6.x;
    r3.w = r2.x;
    r7.xyzw = r5.zwxz + r3.zwxz;
    r4.z = r5.y;
    r4.w = r1.w;
    r6.z = r3.y;
    r6.w = r2.z;
    r2.xyz = r6.zyw + r4.zyw;
    r3.xyz = r3.xzw / r7.zwy;
    r3.xyz = float3(-2.5,-0.5,1.5) + r3.xyz;
    r4.xyz = r6.zyw / r2.xyz;
    r4.xyz = float3(-2.5,-0.5,1.5) + r4.xyz;
    r3.xyz = BA_Fragment_70_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_70_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_70_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_70_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_70_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_70_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_70_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r0.w = r7.y * r2.z;
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r1.y = r8.y * r1.y;
    r1.x = r8.x * r1.x + r1.y;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.x = r8.z * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.x = r8.w * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.x = r9.x * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.x = r9.y * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.x = r9.z * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.x = r9.w * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r0.w = r0.w * r1.y + r1.x;
  } else {
    r0.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.x = 1 + -BA_Fragment_70_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_70_CB2((uint)(29)).x + r1.x;
  r1.x = cmp(0 >= v3.z);
  r1.y = cmp(v3.z >= 1);
  r1.x = (int)r1.y | (int)r1.x;
  r0.w = r1.x ? 1 : r0.w;
  r1.xyz = -BA_Fragment_70_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r0.www * r1.xyz + BA_Fragment_70_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r0.xyz = r1.xyz * r0.xyz + -BA_Fragment_70_CB0((uint)(56)).xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_70_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_BAKED_PREFAB) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_71_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_71_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_71_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(2.01612902,2.01612902,2.01612902,2.01612902) * v0.zwwz;
  r1.xyzw = cmp(r0.xyzw >= -r0.wzzw);
  r0.xyzw = frac(abs(r0.wzzw));
  r0.xyzw = r1.xyzw ? r0.xyzw : -r0.wzzw;
  r0.xyzw = r0.xyzw * float4(0.495999992,0.495999992,0.495999992,0.495999992) + float4(0.00200000009,0.00200000009,0.501999974,0.501999974);
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_71_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_71_CB0((uint)(19)).x).xyzw;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xz, BA_Fragment_71_CB0((uint)(19)).x).xyzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wy, BA_Fragment_71_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.wz, BA_Fragment_71_CB0((uint)(19)).x).xyzw;
  r0.xyz = r0.xyz * r1.yyy;
  r0.xyz = r3.xyz * r1.xxx + r0.xyz;
  r0.xyz = r2.xyz * r1.zzz + r0.xyz;
  r0.xyz = r4.xyz * r1.www + r0.xyz;
  r0.xyz = BA_Fragment_71_CB1((uint)(0)).xyz * r0.xyz;
  r0.w = cmp(BA_Fragment_71_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r1.xy = v3.xy * BA_Fragment_71_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_71_CB2((uint)(30)).zw + -r1.xy;
    r2.xyzw = float4(0.5,1,0.5,1) + r1.zzww;
    r3.xyzw = r2.xxzz * r2.xxzz;
    r2.xz = float2(0.0799999982,0.0799999982) * r3.yw;
    r3.xy = r3.xz * float2(0.5,0.5) + -r1.zw;
    r3.zw = float2(1,1) + -r1.zw;
    r4.xy = min(float2(0,0), r1.zw);
    r4.xy = -r4.xy * r4.xy + r3.zw;
    r1.zw = max(float2(0,0), r1.zw);
    r1.zw = -r1.zw * r1.zw + r2.yw;
    r4.xy = float2(1,1) + r4.xy;
    r1.zw = float2(1,1) + r1.zw;
    r5.xy = float2(0.159999996,0.159999996) * r3.xy;
    r3.xy = float2(0.159999996,0.159999996) * r3.zw;
    r4.xy = float2(0.159999996,0.159999996) * r4.xy;
    r6.xy = float2(0.159999996,0.159999996) * r1.zw;
    r1.zw = float2(0.159999996,0.159999996) * r2.yw;
    r5.z = r4.x;
    r5.w = r1.z;
    r3.z = r6.x;
    r3.w = r2.x;
    r7.xyzw = r5.zwxz + r3.zwxz;
    r4.z = r5.y;
    r4.w = r1.w;
    r6.z = r3.y;
    r6.w = r2.z;
    r2.xyz = r6.zyw + r4.zyw;
    r3.xyz = r3.xzw / r7.zwy;
    r3.xyz = float3(-2.5,-0.5,1.5) + r3.xyz;
    r4.xyz = r6.zyw / r2.xyz;
    r4.xyz = float3(-2.5,-0.5,1.5) + r4.xyz;
    r3.xyz = BA_Fragment_71_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_71_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_71_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_71_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_71_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_71_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_71_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r0.w = r7.y * r2.z;
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r1.y = r8.y * r1.y;
    r1.x = r8.x * r1.x + r1.y;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.x = r8.z * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.x = r8.w * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.x = r9.x * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.x = r9.y * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.x = r9.z * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.x = r9.w * r1.y + r1.x;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r0.w = r0.w * r1.y + r1.x;
  } else {
    r0.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.x = 1 + -BA_Fragment_71_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_71_CB2((uint)(29)).x + r1.x;
  r1.x = cmp(0 >= v3.z);
  r1.y = cmp(v3.z >= 1);
  r1.x = (int)r1.y | (int)r1.x;
  r0.w = r1.x ? 1 : r0.w;
  r1.xyz = -BA_Fragment_71_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r0.www * r1.xyz + BA_Fragment_71_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  r0.xyz = r1.xyz * r0.xyz + -BA_Fragment_71_CB0((uint)(56)).xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_71_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
