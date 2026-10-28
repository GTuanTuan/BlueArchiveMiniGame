// Exact names and types from the original compiled parameter metadata.
float _BlendValue;
float4 _CodeAddColor;
float4 _CodeAddRimColor;
float4 _CodeMultiplyColor;
float4 _Color;
float4 _MainLightShadowParams;
float4 _MainLightShadowmapSize;
float4x4 _MainLightWorldToShadow[5];
float4 _MainTex_ST;
float4 _MaskColor;
float _ShadowAttenSpec;
float4 _ShadowCoordModifier;
float4 _SpecLightColor;
float4 _SpecLightDir;
float _SpecPower;
Texture2D<float4> _BlendTex;
Texture2D<float4> _MainLightShadowmapTexture;
Texture2D<float4> _MainTex;
Texture2D<float4> _SpecTex;
SamplerState sampler_BlendTex;
SamplerComparisonState sampler_MainLightShadowmapTexture;
SamplerState sampler_MainTex;
SamplerState sampler_SpecTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
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
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_24_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
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

  o0.xy = v2.xy * BA_Vertex_24_CB1((uint)(0)).xy + BA_Vertex_24_CB1((uint)(0)).zw;
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
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  o1.w = 0;
  r1.xyz = BA_Vertex_24_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_24_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_24_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_24_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_24_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www + BA_Vertex_24_CB1((uint)(4)).yzw;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r2.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_24_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.xyzw = BA_Vertex_24_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_24_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_24_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_24_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_24_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o3.xy = r1.xw + r1.zz;
  o3.zw = r0.zw;
  o4.xyzw = r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
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
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_25_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
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

  o0.xy = v2.xy * BA_Vertex_25_CB1((uint)(0)).xy + BA_Vertex_25_CB1((uint)(0)).zw;
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
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  o1.w = 0;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_25_CB0((uint)(5)).xyz));
  r1.xyz = BA_Vertex_25_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_25_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_25_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_25_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_25_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r2.xyz * r0.www + BA_Vertex_25_CB1((uint)(4)).yzw;
  r2.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r2.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r3.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r2.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_25_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  r0.xyzw = BA_Vertex_25_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_25_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_25_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_25_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_25_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o3.xy = r1.xw + r1.zz;
  o3.zw = r0.zw;
  o4.xyzw = r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_26_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_26_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_26_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_26_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_26_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
  out float4 o4 : SV_POSITION0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_26_CB1((uint)(0)).xy + BA_Vertex_26_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_26_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_26_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_26_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_26_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_26_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_26_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_26_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_26_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_26_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_26_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_26_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  o1.w = 0;
  r0.xzw = BA_Vertex_26_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_26_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_26_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_26_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyz = BA_Vertex_26_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www + BA_Vertex_26_CB1((uint)(4)).yzw;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r2.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_26_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.xy = float2(0,0);
  r1.xyzw = BA_Vertex_26_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_26_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_26_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_26_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_26_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o3.xy = r1.xw + r1.zz;
  o3.zw = r0.zw;
  o4.xyzw = r0.xyzw;
  o5.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_27_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_27_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_27_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_27_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_27_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
  out float4 o4 : SV_POSITION0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_27_CB1((uint)(0)).xy + BA_Vertex_27_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_27_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_27_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_27_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_27_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_27_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_27_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_27_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_27_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_27_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_27_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_27_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  o1.w = 0;
  r0.xzw = BA_Vertex_27_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_27_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_27_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_27_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyz = BA_Vertex_27_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r2.xyz * r0.www + BA_Vertex_27_CB1((uint)(4)).yzw;
  r2.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r2.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r2.xyz));
  o2.x = saturate(dot(r1.xyz, BA_Vertex_27_CB0((uint)(5)).xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_27_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  r1.xyzw = BA_Vertex_27_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_27_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_27_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_27_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_27_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o3.xy = r1.xw + r1.zz;
  o3.zw = r0.zw;
  o4.xyzw = r0.xyzw;
  o5.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_28_CB2(uint i)
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

float4 BA_Vertex_28_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_28_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
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

  o0.xy = v2.xy * BA_Vertex_28_CB1((uint)(0)).xy + BA_Vertex_28_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_28_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_28_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_28_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_28_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_28_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_28_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_28_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_28_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_28_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_28_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_28_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_28_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_28_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_28_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_28_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_28_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_28_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyz = BA_Vertex_28_CB0((uint)(16)).xyz + -r1.xyz;
  r2.xyzw = BA_Vertex_28_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_28_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_28_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_28_CB0((uint)(55)).z + BA_Vertex_28_CB0((uint)(55)).w);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www + BA_Vertex_28_CB1((uint)(4)).yzw;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_28_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.x = BA_Vertex_28_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r2.zw;
  o4.xyzw = r2.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_29_CB2(uint i)
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

float4 BA_Vertex_29_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_29_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
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

  o0.xy = v2.xy * BA_Vertex_29_CB1((uint)(0)).xy + BA_Vertex_29_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_29_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_29_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_29_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_29_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_29_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_29_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_29_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_29_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_29_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_29_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_29_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_29_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_29_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_29_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_29_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_29_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_29_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyz = BA_Vertex_29_CB0((uint)(16)).xyz + -r1.xyz;
  r2.xyzw = BA_Vertex_29_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_29_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_29_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_29_CB0((uint)(55)).z + BA_Vertex_29_CB0((uint)(55)).w);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r1.xyz * r0.www + BA_Vertex_29_CB1((uint)(4)).yzw;
  r1.xyz = r1.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r1.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r1.xyz));
  o2.x = saturate(dot(r0.xyz, BA_Vertex_29_CB0((uint)(5)).xyz));
  r0.x = log2(r0.w);
  r0.x = BA_Vertex_29_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  r0.x = BA_Vertex_29_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r2.zw;
  o4.xyzw = r2.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_30_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_30_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_30_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_30_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_30_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
  out float4 o4 : SV_POSITION0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_30_CB1((uint)(0)).xy + BA_Vertex_30_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_30_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_30_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_30_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_30_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_30_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_30_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_30_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_30_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_30_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_30_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_30_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_30_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_30_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_30_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_30_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_30_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_30_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_30_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r0.xyz = BA_Vertex_30_CB0((uint)(16)).xyz + -r0.xyz;
  r2.xyzw = BA_Vertex_30_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_30_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_30_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_30_CB0((uint)(55)).z + BA_Vertex_30_CB0((uint)(55)).w);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www + BA_Vertex_30_CB1((uint)(4)).yzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = saturate(dot(r1.xyz, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_30_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.x = BA_Vertex_30_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r2.zw;
  o4.xyzw = r2.xyzw;
  o5.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_31_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_31_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_31_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_31_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_31_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
  out float4 o4 : SV_POSITION0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_31_CB1((uint)(0)).xy + BA_Vertex_31_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_31_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_31_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_31_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_31_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_31_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_31_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_31_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_31_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_31_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_31_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_31_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_31_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_31_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_31_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_31_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_31_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_31_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_31_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r0.xyz = BA_Vertex_31_CB0((uint)(16)).xyz + -r0.xyz;
  r2.xyzw = BA_Vertex_31_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_31_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_31_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_31_CB0((uint)(55)).z + BA_Vertex_31_CB0((uint)(55)).w);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r0.xyz * r0.www + BA_Vertex_31_CB1((uint)(4)).yzw;
  r0.xyz = r0.xyz * r0.www;
  r0.x = saturate(dot(r1.xyz, r0.xyz));
  o2.y = 1 + -r0.x;
  r0.x = dot(r3.xyz, r3.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r3.xyz * r0.xxx;
  r0.x = saturate(dot(r1.xyz, r0.xyz));
  o2.x = saturate(dot(r1.xyz, BA_Vertex_31_CB0((uint)(5)).xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_31_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  r0.x = BA_Vertex_31_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r2.zw;
  o4.xyzw = r2.xyzw;
  o5.x = v3.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_32_CB2(uint i)
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

float4 BA_Vertex_32_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_32_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
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

  o0.xy = v2.xy * BA_Vertex_32_CB1((uint)(0)).xy + BA_Vertex_32_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_32_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_32_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_32_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_32_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_32_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_32_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_32_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_32_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_32_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_32_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_32_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_32_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_32_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_32_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_32_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_32_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_32_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyz = BA_Vertex_32_CB0((uint)(16)).xyz + -r1.xyz;
  r2.xyzw = BA_Vertex_32_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_32_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_32_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_32_CB0((uint)(55)).x * r0.w;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www + BA_Vertex_32_CB1((uint)(4)).yzw;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_32_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.x = BA_Vertex_32_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r2.zw;
  o4.xyzw = r2.xyzw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
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
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_33_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
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

  o0.xy = v2.xy * BA_Vertex_33_CB1((uint)(0)).xy + BA_Vertex_33_CB1((uint)(0)).zw;
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
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_33_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_33_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_33_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_33_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_33_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_33_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_33_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyz = BA_Vertex_33_CB0((uint)(16)).xyz + -r1.xyz;
  r2.xyzw = BA_Vertex_33_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_33_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_33_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_33_CB0((uint)(55)).x * r0.w;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r1.xyz * r0.www + BA_Vertex_33_CB1((uint)(4)).yzw;
  r1.xyz = r1.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r1.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r1.xyz));
  o2.x = saturate(dot(r0.xyz, BA_Vertex_33_CB0((uint)(5)).xyz));
  r0.x = log2(r0.w);
  r0.x = BA_Vertex_33_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  r0.x = BA_Vertex_33_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r2.zw;
  o4.xyzw = r2.xyzw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_34_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_34_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_34_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_34_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_34_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
  out float4 o4 : SV_POSITION0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_34_CB1((uint)(0)).xy + BA_Vertex_34_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_34_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_34_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_34_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_34_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_34_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_34_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_34_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_34_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_34_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_34_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_34_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_34_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_34_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_34_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_34_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_34_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_34_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_34_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r0.xyz = BA_Vertex_34_CB0((uint)(16)).xyz + -r0.xyz;
  r2.xyzw = BA_Vertex_34_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_34_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_34_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_34_CB0((uint)(55)).x * r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www + BA_Vertex_34_CB1((uint)(4)).yzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = saturate(dot(r1.xyz, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_34_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.x = BA_Vertex_34_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r2.zw;
  o4.xyzw = r2.xyzw;
  o5.x = v3.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_35_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_35_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_35_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_35_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_35_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
  out float4 o4 : SV_POSITION0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_35_CB1((uint)(0)).xy + BA_Vertex_35_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_35_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_35_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_35_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_35_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_35_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_35_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_35_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_35_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_35_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_35_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_35_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_35_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_35_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_35_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_35_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_35_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_35_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_35_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r0.xyz = BA_Vertex_35_CB0((uint)(16)).xyz + -r0.xyz;
  r2.xyzw = BA_Vertex_35_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_35_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_35_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_35_CB0((uint)(55)).x * r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r0.xyz * r0.www + BA_Vertex_35_CB1((uint)(4)).yzw;
  r0.xyz = r0.xyz * r0.www;
  r0.x = saturate(dot(r1.xyz, r0.xyz));
  o2.y = 1 + -r0.x;
  r0.x = dot(r3.xyz, r3.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r3.xyz * r0.xxx;
  r0.x = saturate(dot(r1.xyz, r0.xyz));
  o2.x = saturate(dot(r1.xyz, BA_Vertex_35_CB0((uint)(5)).xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_35_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  r0.x = BA_Vertex_35_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r2.zw;
  o4.xyzw = r2.xyzw;
  o5.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_36_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  return value;
}

float4 BA_Vertex_36_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_36_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
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

  o0.xy = v2.xy * BA_Vertex_36_CB1((uint)(0)).xy + BA_Vertex_36_CB1((uint)(0)).zw;
  o1.xy = v3.xy * BA_Vertex_36_CB2((uint)(23)).xy + BA_Vertex_36_CB2((uint)(23)).zw;
  o1.z = 0;
  r0.x = dot(v1.xyz, BA_Vertex_36_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_36_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_36_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xyz = BA_Vertex_36_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_36_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_36_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_36_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_36_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www + BA_Vertex_36_CB1((uint)(4)).yzw;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r2.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_36_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.xyzw = BA_Vertex_36_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_36_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_36_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_36_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_36_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o3.xy = r1.xw + r1.zz;
  o3.zw = r0.zw;
  o4.xyzw = r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_37_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/2u;
    uint c = (i-0u)%2u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_LightmapSTArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_LightmapIndexArray;
  }
  return value;
}

float4 BA_Vertex_37_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_37_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_37_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_37_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  uint v4 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
  out float4 o4 : SV_POSITION0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v4);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_37_CB1((uint)(0)).xy + BA_Vertex_37_CB1((uint)(0)).zw;
  r0.x = (int)v4.x + asint(BA_Vertex_37_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 1;
  r0.x = (uint)r0.x << 3;
  o1.xy = v3.xy * BA_Vertex_37_CB4((uint)(r0.y+0)).xy + BA_Vertex_37_CB4((uint)(r0.y+0)).zw;
  o1.z = 0;
  r0.yzw = BA_Vertex_37_CB3((uint)(r0.x+1)).xyz * v0.yyy;
  r0.yzw = BA_Vertex_37_CB3((uint)(r0.x+0)).xyz * v0.xxx + r0.yzw;
  r0.yzw = BA_Vertex_37_CB3((uint)(r0.x+2)).xyz * v0.zzz + r0.yzw;
  r0.yzw = BA_Vertex_37_CB3((uint)(r0.x+3)).xyz + r0.yzw;
  r1.xyz = BA_Vertex_37_CB0((uint)(16)).xyz + -r0.yzw;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = max(1.17549435e-038, r1.w);
  r1.w = rsqrt(r1.w);
  r1.xyz = r1.xyz * r1.www + BA_Vertex_37_CB1((uint)(4)).yzw;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = max(1.17549435e-038, r1.w);
  r1.w = rsqrt(r1.w);
  r1.xyz = r1.xyz * r1.www;
  r2.x = dot(v1.xyz, BA_Vertex_37_CB3((uint)(r0.x+4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_37_CB3((uint)(r0.x+5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_37_CB3((uint)(r0.x+6)).xyz);
  r0.x = dot(r2.xyz, r2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r2.xyz = r2.xyz * r0.xxx;
  r0.x = saturate(dot(r2.xyz, r1.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_37_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r1.xyzw = BA_Vertex_37_CB0((uint)(74)).xyzw * r0.zzzz;
  r1.xyzw = BA_Vertex_37_CB0((uint)(73)).xyzw * r0.yyyy + r1.xyzw;
  r0.xyzw = BA_Vertex_37_CB0((uint)(75)).xyzw * r0.wwww + r1.xyzw;
  r0.xyzw = BA_Vertex_37_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_37_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o3.xy = r1.xw + r1.zz;
  o3.zw = r0.zw;
  o4.xyzw = r0.xyzw;
  o5.x = v4.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_38_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  return value;
}

float4 BA_Vertex_38_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_38_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
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

  o0.xy = v2.xy * BA_Vertex_38_CB1((uint)(0)).xy + BA_Vertex_38_CB1((uint)(0)).zw;
  r0.xyz = BA_Vertex_38_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_38_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_38_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_38_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_38_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_38_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_38_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_38_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_38_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = r1.z / BA_Vertex_38_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_38_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.z = saturate(r0.w * BA_Vertex_38_CB0((uint)(55)).z + BA_Vertex_38_CB0((uint)(55)).w);
  o1.xy = v3.xy * BA_Vertex_38_CB2((uint)(23)).xy + BA_Vertex_38_CB2((uint)(23)).zw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www + BA_Vertex_38_CB1((uint)(4)).yzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_38_CB2((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_38_CB2((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_38_CB2((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.x = saturate(dot(r2.xyz, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_38_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.x = BA_Vertex_38_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r1.zw;
  o4.xyzw = r1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_39_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/2u;
    uint c = (i-0u)%2u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_LightmapSTArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_LightmapIndexArray;
  }
  return value;
}

float4 BA_Vertex_39_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_39_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_39_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_39_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v4 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
  out float4 o4 : SV_POSITION0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v4);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_39_CB1((uint)(0)).xy + BA_Vertex_39_CB1((uint)(0)).zw;
  r0.x = (int)v4.x + asint(BA_Vertex_39_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 1;
  r0.x = (uint)r0.x << 3;
  o1.xy = v3.xy * BA_Vertex_39_CB4((uint)(r0.y+0)).xy + BA_Vertex_39_CB4((uint)(r0.y+0)).zw;
  r0.yzw = BA_Vertex_39_CB3((uint)(r0.x+1)).xyz * v0.yyy;
  r0.yzw = BA_Vertex_39_CB3((uint)(r0.x+0)).xyz * v0.xxx + r0.yzw;
  r0.yzw = BA_Vertex_39_CB3((uint)(r0.x+2)).xyz * v0.zzz + r0.yzw;
  r0.yzw = BA_Vertex_39_CB3((uint)(r0.x+3)).xyz + r0.yzw;
  r1.xyzw = BA_Vertex_39_CB0((uint)(74)).xyzw * r0.zzzz;
  r1.xyzw = BA_Vertex_39_CB0((uint)(73)).xyzw * r0.yyyy + r1.xyzw;
  r1.xyzw = BA_Vertex_39_CB0((uint)(75)).xyzw * r0.wwww + r1.xyzw;
  r0.yzw = BA_Vertex_39_CB0((uint)(16)).xyz + -r0.yzw;
  r1.xyzw = BA_Vertex_39_CB0((uint)(76)).xyzw + r1.xyzw;
  r2.x = r1.z / BA_Vertex_39_CB0((uint)(17)).y;
  r2.x = 1 + -r2.x;
  r2.x = BA_Vertex_39_CB0((uint)(17)).z * r2.x;
  r2.x = max(0, r2.x);
  o1.z = saturate(r2.x * BA_Vertex_39_CB0((uint)(55)).z + BA_Vertex_39_CB0((uint)(55)).w);
  r2.x = dot(v1.xyz, BA_Vertex_39_CB3((uint)(r0.x+4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_39_CB3((uint)(r0.x+5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_39_CB3((uint)(r0.x+6)).xyz);
  r0.x = dot(r2.xyz, r2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r2.xyz = r2.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx + BA_Vertex_39_CB1((uint)(4)).yzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = saturate(dot(r2.xyz, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_39_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.x = BA_Vertex_39_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r1.zw;
  o4.xyzw = r1.xyzw;
  o5.x = v4.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_40_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  return value;
}

float4 BA_Vertex_40_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_40_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
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

  o0.xy = v2.xy * BA_Vertex_40_CB1((uint)(0)).xy + BA_Vertex_40_CB1((uint)(0)).zw;
  r0.xyz = BA_Vertex_40_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_40_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_40_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_40_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_40_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_40_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_40_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_40_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_40_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = r1.z / BA_Vertex_40_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_40_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.z = BA_Vertex_40_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy * BA_Vertex_40_CB2((uint)(23)).xy + BA_Vertex_40_CB2((uint)(23)).zw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www + BA_Vertex_40_CB1((uint)(4)).yzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_40_CB2((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_40_CB2((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_40_CB2((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.x = saturate(dot(r2.xyz, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_40_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.x = BA_Vertex_40_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r1.zw;
  o4.xyzw = r1.xyzw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_41_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/2u;
    uint c = (i-0u)%2u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_LightmapSTArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_LightmapIndexArray;
  }
  return value;
}

float4 BA_Vertex_41_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_41_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_41_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_41_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v4 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
  out float4 o4 : SV_POSITION0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v4);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_41_CB1((uint)(0)).xy + BA_Vertex_41_CB1((uint)(0)).zw;
  r0.x = (int)v4.x + asint(BA_Vertex_41_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 1;
  r0.x = (uint)r0.x << 3;
  o1.xy = v3.xy * BA_Vertex_41_CB4((uint)(r0.y+0)).xy + BA_Vertex_41_CB4((uint)(r0.y+0)).zw;
  r0.yzw = BA_Vertex_41_CB3((uint)(r0.x+1)).xyz * v0.yyy;
  r0.yzw = BA_Vertex_41_CB3((uint)(r0.x+0)).xyz * v0.xxx + r0.yzw;
  r0.yzw = BA_Vertex_41_CB3((uint)(r0.x+2)).xyz * v0.zzz + r0.yzw;
  r0.yzw = BA_Vertex_41_CB3((uint)(r0.x+3)).xyz + r0.yzw;
  r1.xyzw = BA_Vertex_41_CB0((uint)(74)).xyzw * r0.zzzz;
  r1.xyzw = BA_Vertex_41_CB0((uint)(73)).xyzw * r0.yyyy + r1.xyzw;
  r1.xyzw = BA_Vertex_41_CB0((uint)(75)).xyzw * r0.wwww + r1.xyzw;
  r0.yzw = BA_Vertex_41_CB0((uint)(16)).xyz + -r0.yzw;
  r1.xyzw = BA_Vertex_41_CB0((uint)(76)).xyzw + r1.xyzw;
  r2.x = r1.z / BA_Vertex_41_CB0((uint)(17)).y;
  r2.x = 1 + -r2.x;
  r2.x = BA_Vertex_41_CB0((uint)(17)).z * r2.x;
  r2.x = max(0, r2.x);
  o1.z = BA_Vertex_41_CB0((uint)(55)).x * r2.x;
  r2.x = dot(v1.xyz, BA_Vertex_41_CB3((uint)(r0.x+4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_41_CB3((uint)(r0.x+5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_41_CB3((uint)(r0.x+6)).xyz);
  r0.x = dot(r2.xyz, r2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r2.xyz = r2.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx + BA_Vertex_41_CB1((uint)(4)).yzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = saturate(dot(r2.xyz, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_41_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.x = BA_Vertex_41_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r1.zw;
  o4.xyzw = r1.xyzw;
  o5.x = v4.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_42_CB2(uint i)
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

float4 BA_Vertex_42_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_42_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
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

  o0.xy = v2.xy * BA_Vertex_42_CB1((uint)(0)).xy + BA_Vertex_42_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_42_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_42_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_42_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_42_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_42_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_42_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_42_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_42_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_42_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_42_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  o1.w = 0;
  r1.xyz = BA_Vertex_42_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_42_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_42_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_42_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_42_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www + BA_Vertex_42_CB1((uint)(4)).yzw;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r2.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_42_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.xyzw = BA_Vertex_42_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_42_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_42_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_42_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_42_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o3.xy = r1.xw + r1.zz;
  o3.zw = r0.zw;
  o4.xyzw = r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_43_CB2(uint i)
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

float4 BA_Vertex_43_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_43_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD7,
  out float4 o6 : SV_POSITION0)
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

  o0.xy = v2.xy * BA_Vertex_43_CB1((uint)(0)).xy + BA_Vertex_43_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_43_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_43_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_43_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_43_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_43_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_43_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_43_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_43_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_43_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_43_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  o1.w = 0;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_43_CB0((uint)(5)).xyz));
  r1.xyz = BA_Vertex_43_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_43_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_43_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_43_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_43_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r2.xyz * r0.www + BA_Vertex_43_CB1((uint)(4)).yzw;
  r2.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r2.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r2.xyz));
  o3.xyz = r0.xyz;
  r0.x = log2(r0.w);
  r0.x = BA_Vertex_43_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o4.xyz = r1.xyz;
  r0.xyzw = BA_Vertex_43_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_43_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_43_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_43_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_43_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o5.xy = r1.xw + r1.zz;
  o5.zw = r0.zw;
  o6.xyzw = r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_44_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_44_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_44_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_44_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_44_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
  out float4 o4 : SV_POSITION0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_44_CB1((uint)(0)).xy + BA_Vertex_44_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_44_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_44_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_44_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_44_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_44_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_44_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_44_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_44_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_44_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_44_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_44_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  o1.w = 0;
  r0.xzw = BA_Vertex_44_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_44_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_44_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_44_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyz = BA_Vertex_44_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www + BA_Vertex_44_CB1((uint)(4)).yzw;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r2.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_44_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.xy = float2(0,0);
  r1.xyzw = BA_Vertex_44_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_44_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_44_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_44_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_44_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o3.xy = r1.xw + r1.zz;
  o3.zw = r0.zw;
  o4.xyzw = r0.xyzw;
  o5.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_45_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_45_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_45_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_45_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_45_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD7,
  out float4 o6 : SV_POSITION0,
  out uint o7 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_45_CB1((uint)(0)).xy + BA_Vertex_45_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_45_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_45_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_45_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_45_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_45_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_45_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_45_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_45_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_45_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_45_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_45_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  o1.w = 0;
  r0.xzw = BA_Vertex_45_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_45_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_45_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_45_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyz = BA_Vertex_45_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r2.xyz * r0.www + BA_Vertex_45_CB1((uint)(4)).yzw;
  r2.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r2.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r2.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_45_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.x = saturate(dot(r1.xyz, BA_Vertex_45_CB0((uint)(5)).xyz));
  o3.xyz = r1.xyz;
  o4.xyz = r0.xyz;
  r1.xyzw = BA_Vertex_45_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_45_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_45_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_45_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_45_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o5.xy = r1.xw + r1.zz;
  o5.zw = r0.zw;
  o6.xyzw = r0.xyzw;
  o7.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_46_CB2(uint i)
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

float4 BA_Vertex_46_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_46_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
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

  o0.xy = v2.xy * BA_Vertex_46_CB1((uint)(0)).xy + BA_Vertex_46_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_46_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_46_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_46_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_46_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_46_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_46_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_46_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_46_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_46_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_46_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_46_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_46_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_46_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_46_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_46_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_46_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_46_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyz = BA_Vertex_46_CB0((uint)(16)).xyz + -r1.xyz;
  r2.xyzw = BA_Vertex_46_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_46_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_46_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_46_CB0((uint)(55)).z + BA_Vertex_46_CB0((uint)(55)).w);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www + BA_Vertex_46_CB1((uint)(4)).yzw;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_46_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.x = BA_Vertex_46_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r2.zw;
  o4.xyzw = r2.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_47_CB2(uint i)
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

float4 BA_Vertex_47_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_47_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD7,
  out float4 o6 : SV_POSITION0)
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

  o0.xy = v2.xy * BA_Vertex_47_CB1((uint)(0)).xy + BA_Vertex_47_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_47_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_47_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_47_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_47_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_47_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_47_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_47_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_47_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_47_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_47_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_47_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_47_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_47_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_47_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_47_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_47_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_47_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_47_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_47_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_47_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_47_CB0((uint)(55)).z + BA_Vertex_47_CB0((uint)(55)).w);
  r3.xyz = BA_Vertex_47_CB0((uint)(16)).xyz + -r1.xyz;
  o4.xyz = r1.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r3.xyz * r0.www + BA_Vertex_47_CB1((uint)(4)).yzw;
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r3.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r1.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_47_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.x = saturate(dot(r0.xyz, BA_Vertex_47_CB0((uint)(5)).xyz));
  o3.xyz = r0.xyz;
  r0.x = BA_Vertex_47_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o5.xy = r0.xw + r0.zz;
  o5.zw = r2.zw;
  o6.xyzw = r2.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_48_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_48_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_48_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_48_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_48_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
  out float4 o4 : SV_POSITION0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_48_CB1((uint)(0)).xy + BA_Vertex_48_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_48_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_48_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_48_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_48_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_48_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_48_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_48_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_48_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_48_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_48_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_48_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_48_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_48_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_48_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_48_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_48_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_48_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_48_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r0.xyz = BA_Vertex_48_CB0((uint)(16)).xyz + -r0.xyz;
  r2.xyzw = BA_Vertex_48_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_48_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_48_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_48_CB0((uint)(55)).z + BA_Vertex_48_CB0((uint)(55)).w);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www + BA_Vertex_48_CB1((uint)(4)).yzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = saturate(dot(r1.xyz, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_48_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.x = BA_Vertex_48_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r2.zw;
  o4.xyzw = r2.xyzw;
  o5.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_49_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_49_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_49_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_49_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_49_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD7,
  out float4 o6 : SV_POSITION0,
  out uint o7 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_49_CB1((uint)(0)).xy + BA_Vertex_49_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_49_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_49_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_49_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_49_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_49_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_49_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_49_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_49_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_49_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_49_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_49_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_49_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_49_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_49_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_49_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_49_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_49_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_49_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_49_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_49_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_49_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_49_CB0((uint)(55)).z + BA_Vertex_49_CB0((uint)(55)).w);
  r3.xyz = BA_Vertex_49_CB0((uint)(16)).xyz + -r0.xyz;
  o4.xyz = r0.xyz;
  r0.x = dot(r3.xyz, r3.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r3.xyz * r0.xxx + BA_Vertex_49_CB1((uint)(4)).yzw;
  r3.xyz = r3.xyz * r0.xxx;
  r0.x = saturate(dot(r1.xyz, r3.xyz));
  o2.y = 1 + -r0.x;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r0.x = saturate(dot(r1.xyz, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_49_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.x = saturate(dot(r1.xyz, BA_Vertex_49_CB0((uint)(5)).xyz));
  o3.xyz = r1.xyz;
  r0.x = BA_Vertex_49_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o5.xy = r0.xw + r0.zz;
  o5.zw = r2.zw;
  o6.xyzw = r2.xyzw;
  o7.x = v3.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_50_CB2(uint i)
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

float4 BA_Vertex_50_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_50_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
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

  o0.xy = v2.xy * BA_Vertex_50_CB1((uint)(0)).xy + BA_Vertex_50_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_50_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_50_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_50_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_50_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_50_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_50_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_50_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_50_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_50_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_50_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_50_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_50_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_50_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_50_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_50_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_50_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_50_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyz = BA_Vertex_50_CB0((uint)(16)).xyz + -r1.xyz;
  r2.xyzw = BA_Vertex_50_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_50_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_50_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_50_CB0((uint)(55)).x * r0.w;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www + BA_Vertex_50_CB1((uint)(4)).yzw;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_50_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.x = BA_Vertex_50_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r2.zw;
  o4.xyzw = r2.xyzw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_51_CB2(uint i)
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

float4 BA_Vertex_51_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_51_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD7,
  out float4 o6 : SV_POSITION0)
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

  o0.xy = v2.xy * BA_Vertex_51_CB1((uint)(0)).xy + BA_Vertex_51_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_51_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_51_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_51_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_51_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_51_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_51_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_51_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_51_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_51_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_51_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_51_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_51_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_51_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_51_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_51_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_51_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_51_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_51_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_51_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_51_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_51_CB0((uint)(55)).x * r0.w;
  r3.xyz = BA_Vertex_51_CB0((uint)(16)).xyz + -r1.xyz;
  o4.xyz = r1.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r3.xyz * r0.www + BA_Vertex_51_CB1((uint)(4)).yzw;
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r3.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r1.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_51_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.x = saturate(dot(r0.xyz, BA_Vertex_51_CB0((uint)(5)).xyz));
  o3.xyz = r0.xyz;
  r0.x = BA_Vertex_51_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o5.xy = r0.xw + r0.zz;
  o5.zw = r2.zw;
  o6.xyzw = r2.xyzw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_52_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_52_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_52_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_52_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_52_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD7,
  out float4 o4 : SV_POSITION0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_52_CB1((uint)(0)).xy + BA_Vertex_52_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_52_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_52_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_52_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_52_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_52_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_52_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_52_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_52_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_52_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_52_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_52_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_52_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_52_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_52_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_52_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_52_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_52_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_52_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r0.xyz = BA_Vertex_52_CB0((uint)(16)).xyz + -r0.xyz;
  r2.xyzw = BA_Vertex_52_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_52_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_52_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_52_CB0((uint)(55)).x * r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www + BA_Vertex_52_CB1((uint)(4)).yzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = saturate(dot(r1.xyz, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_52_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.x = BA_Vertex_52_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o3.xy = r0.xw + r0.zz;
  o3.zw = r2.zw;
  o4.xyzw = r2.xyzw;
  o5.x = v3.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_53_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_53_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_53_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_53_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_53_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD7,
  out float4 o6 : SV_POSITION0,
  out uint o7 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_53_CB1((uint)(0)).xy + BA_Vertex_53_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_53_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_53_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_53_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_53_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_53_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_53_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_53_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_53_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_53_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_53_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_53_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_53_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_53_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_53_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_53_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_53_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_53_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_53_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_53_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_53_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_53_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_53_CB0((uint)(55)).x * r0.w;
  r3.xyz = BA_Vertex_53_CB0((uint)(16)).xyz + -r0.xyz;
  o4.xyz = r0.xyz;
  r0.x = dot(r3.xyz, r3.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r3.xyz * r0.xxx + BA_Vertex_53_CB1((uint)(4)).yzw;
  r3.xyz = r3.xyz * r0.xxx;
  r0.x = saturate(dot(r1.xyz, r3.xyz));
  o2.y = 1 + -r0.x;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r0.x = saturate(dot(r1.xyz, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_53_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.x = saturate(dot(r1.xyz, BA_Vertex_53_CB0((uint)(5)).xyz));
  o3.xyz = r1.xyz;
  r0.x = BA_Vertex_53_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o5.xy = r0.xw + r0.zz;
  o5.zw = r2.zw;
  o6.xyzw = r2.xyzw;
  o7.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_54_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_54_CB2(uint i)
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

float4 BA_Vertex_54_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_54_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0)
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

  o0.xy = v2.xy * BA_Vertex_54_CB1((uint)(0)).xy + BA_Vertex_54_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_54_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_54_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_54_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_54_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_54_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_54_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_54_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_54_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_54_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_54_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  o1.w = 0;
  r1.xyz = BA_Vertex_54_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_54_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_54_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_54_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_54_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www + BA_Vertex_54_CB1((uint)(4)).yzw;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r2.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_54_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.xy = BA_Vertex_54_CB3((uint)(1)).xy * BA_Vertex_54_CB0((uint)(125)).yy;
  r0.xy = BA_Vertex_54_CB3((uint)(0)).xy * BA_Vertex_54_CB0((uint)(125)).xx + r0.xy;
  r0.xy = BA_Vertex_54_CB3((uint)(2)).xy * BA_Vertex_54_CB0((uint)(125)).zz + r0.xy;
  r0.xy = BA_Vertex_54_CB3((uint)(3)).xy + r0.xy;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r2.xyz = BA_Vertex_54_CB3((uint)(1)).xyz * r1.yyy;
  r2.xyz = BA_Vertex_54_CB3((uint)(0)).xyz * r1.xxx + r2.xyz;
  r2.xyz = BA_Vertex_54_CB3((uint)(2)).xyz * r1.zzz + r2.xyz;
  r2.xyz = BA_Vertex_54_CB3((uint)(3)).xyz + r2.xyz;
  r0.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r1.w = saturate(BA_Vertex_54_CB0((uint)(125)).w);
  r0.xy = -r0.xy * r1.ww + r0.zw;
  r0.z = max(1, BA_Vertex_54_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.xyzw = BA_Vertex_54_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_54_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_54_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_54_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_54_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o4.xy = r1.xw + r1.zz;
  o4.zw = r0.zw;
  o5.xyzw = r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_55_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_55_CB2(uint i)
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

float4 BA_Vertex_55_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_55_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0)
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

  o0.xy = v2.xy * BA_Vertex_55_CB1((uint)(0)).xy + BA_Vertex_55_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_55_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_55_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_55_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_55_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_55_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_55_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_55_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_55_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_55_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_55_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  o1.w = 0;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_55_CB0((uint)(5)).xyz));
  r1.xyz = BA_Vertex_55_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_55_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_55_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_55_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_55_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r2.xyz * r0.www + BA_Vertex_55_CB1((uint)(4)).yzw;
  r2.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r2.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r3.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r2.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_55_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  r0.xy = BA_Vertex_55_CB3((uint)(1)).xy * BA_Vertex_55_CB0((uint)(125)).yy;
  r0.xy = BA_Vertex_55_CB3((uint)(0)).xy * BA_Vertex_55_CB0((uint)(125)).xx + r0.xy;
  r0.xy = BA_Vertex_55_CB3((uint)(2)).xy * BA_Vertex_55_CB0((uint)(125)).zz + r0.xy;
  r0.xy = BA_Vertex_55_CB3((uint)(3)).xy + r0.xy;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r2.xyz = BA_Vertex_55_CB3((uint)(1)).xyz * r1.yyy;
  r2.xyz = BA_Vertex_55_CB3((uint)(0)).xyz * r1.xxx + r2.xyz;
  r2.xyz = BA_Vertex_55_CB3((uint)(2)).xyz * r1.zzz + r2.xyz;
  r2.xyz = BA_Vertex_55_CB3((uint)(3)).xyz + r2.xyz;
  r0.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r1.w = saturate(BA_Vertex_55_CB0((uint)(125)).w);
  r0.xy = -r0.xy * r1.ww + r0.zw;
  r0.z = max(1, BA_Vertex_55_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.xyzw = BA_Vertex_55_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_55_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_55_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_55_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_55_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o4.xy = r1.xw + r1.zz;
  o4.zw = r0.zw;
  o5.xyzw = r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_56_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_56_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_56_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_56_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_56_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_56_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0,
  out uint o6 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
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

  o0.xy = v2.xy * BA_Vertex_56_CB1((uint)(0)).xy + BA_Vertex_56_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_56_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_56_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_56_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_56_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_56_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_56_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_56_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_56_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_56_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_56_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_56_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  o1.w = 0;
  r0.xzw = BA_Vertex_56_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_56_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_56_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_56_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyz = BA_Vertex_56_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www + BA_Vertex_56_CB1((uint)(4)).yzw;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r2.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_56_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.xy = float2(0,0);
  r1.xy = BA_Vertex_56_CB5((uint)(1)).xy * BA_Vertex_56_CB0((uint)(125)).yy;
  r1.xy = BA_Vertex_56_CB5((uint)(0)).xy * BA_Vertex_56_CB0((uint)(125)).xx + r1.xy;
  r1.xy = BA_Vertex_56_CB5((uint)(2)).xy * BA_Vertex_56_CB0((uint)(125)).zz + r1.xy;
  r1.xy = BA_Vertex_56_CB5((uint)(3)).xy + r1.xy;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r2.xyz = BA_Vertex_56_CB5((uint)(1)).xyz * r0.yyy;
  r2.xyz = BA_Vertex_56_CB5((uint)(0)).xyz * r0.xxx + r2.xyz;
  r2.xyz = BA_Vertex_56_CB5((uint)(2)).xyz * r0.zzz + r2.xyz;
  r2.xyz = BA_Vertex_56_CB5((uint)(3)).xyz + r2.xyz;
  r1.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r0.w = saturate(BA_Vertex_56_CB0((uint)(125)).w);
  r1.xy = -r1.xy * r0.ww + r1.zw;
  r0.w = max(1, BA_Vertex_56_CB0((uint)(125)).w);
  r1.xy = r1.xy * r0.ww;
  o3.xy = r1.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r1.xyzw = BA_Vertex_56_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_56_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_56_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_56_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_56_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o4.xy = r1.xw + r1.zz;
  o4.zw = r0.zw;
  o5.xyzw = r0.xyzw;
  o6.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_57_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_57_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_57_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_57_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_57_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_57_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0,
  out uint o6 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
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

  o0.xy = v2.xy * BA_Vertex_57_CB1((uint)(0)).xy + BA_Vertex_57_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_57_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_57_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_57_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_57_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_57_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_57_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_57_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_57_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_57_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_57_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_57_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  o1.w = 0;
  r0.xzw = BA_Vertex_57_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_57_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_57_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_57_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyz = BA_Vertex_57_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r2.xyz * r0.www + BA_Vertex_57_CB1((uint)(4)).yzw;
  r2.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r2.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r2.xyz));
  o2.x = saturate(dot(r1.xyz, BA_Vertex_57_CB0((uint)(5)).xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_57_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  r1.xy = BA_Vertex_57_CB5((uint)(1)).xy * BA_Vertex_57_CB0((uint)(125)).yy;
  r1.xy = BA_Vertex_57_CB5((uint)(0)).xy * BA_Vertex_57_CB0((uint)(125)).xx + r1.xy;
  r1.xy = BA_Vertex_57_CB5((uint)(2)).xy * BA_Vertex_57_CB0((uint)(125)).zz + r1.xy;
  r1.xy = BA_Vertex_57_CB5((uint)(3)).xy + r1.xy;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r2.xyz = BA_Vertex_57_CB5((uint)(1)).xyz * r0.yyy;
  r2.xyz = BA_Vertex_57_CB5((uint)(0)).xyz * r0.xxx + r2.xyz;
  r2.xyz = BA_Vertex_57_CB5((uint)(2)).xyz * r0.zzz + r2.xyz;
  r2.xyz = BA_Vertex_57_CB5((uint)(3)).xyz + r2.xyz;
  r1.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r0.w = saturate(BA_Vertex_57_CB0((uint)(125)).w);
  r1.xy = -r1.xy * r0.ww + r1.zw;
  r0.w = max(1, BA_Vertex_57_CB0((uint)(125)).w);
  r1.xy = r1.xy * r0.ww;
  o3.xy = r1.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r1.xyzw = BA_Vertex_57_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_57_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_57_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_57_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_57_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o4.xy = r1.xw + r1.zz;
  o4.zw = r0.zw;
  o5.xyzw = r0.xyzw;
  o6.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_58_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_58_CB2(uint i)
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

float4 BA_Vertex_58_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_58_CB0(uint i)
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
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0)
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

  o0.xy = v2.xy * BA_Vertex_58_CB1((uint)(0)).xy + BA_Vertex_58_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_58_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_58_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_58_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_58_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_58_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_58_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_58_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_58_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_58_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_58_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_58_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_58_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_58_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_58_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_58_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_58_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_58_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_58_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_58_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_58_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_58_CB0((uint)(55)).z + BA_Vertex_58_CB0((uint)(55)).w);
  r3.xyz = BA_Vertex_58_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www + BA_Vertex_58_CB1((uint)(4)).yzw;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r3.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_58_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.xyz = BA_Vertex_58_CB3((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_58_CB3((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_58_CB3((uint)(2)).xyz * r1.zzz + r0.xyz;
  r0.xyz = BA_Vertex_58_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_58_CB3((uint)(1)).xy * BA_Vertex_58_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_58_CB3((uint)(0)).xy * BA_Vertex_58_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_58_CB3((uint)(2)).xy * BA_Vertex_58_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_58_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_58_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_58_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_58_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r2.zw;
  o5.xyzw = r2.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_59_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_59_CB2(uint i)
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

float4 BA_Vertex_59_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_59_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_59_CB1((uint)(0)).xy + BA_Vertex_59_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_59_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_59_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_59_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_59_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_59_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_59_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_59_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_59_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_59_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_59_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_59_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_59_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_59_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_59_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_59_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_59_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_59_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_59_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_59_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_59_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_59_CB0((uint)(55)).z + BA_Vertex_59_CB0((uint)(55)).w);
  o2.x = saturate(dot(r0.xyz, BA_Vertex_59_CB0((uint)(5)).xyz));
  r3.xyz = BA_Vertex_59_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r4.xyz = r3.xyz * r0.www + BA_Vertex_59_CB1((uint)(4)).yzw;
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r3.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r4.xyz, r4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r4.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r3.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_59_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  r0.xyz = BA_Vertex_59_CB3((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_59_CB3((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_59_CB3((uint)(2)).xyz * r1.zzz + r0.xyz;
  r0.xyz = BA_Vertex_59_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_59_CB3((uint)(1)).xy * BA_Vertex_59_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_59_CB3((uint)(0)).xy * BA_Vertex_59_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_59_CB3((uint)(2)).xy * BA_Vertex_59_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_59_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_59_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_59_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_59_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r2.zw;
  o5.xyzw = r2.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_60_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_60_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_60_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_60_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_60_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_60_CB0(uint i)
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
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0,
  out uint o6 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
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

  o0.xy = v2.xy * BA_Vertex_60_CB1((uint)(0)).xy + BA_Vertex_60_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_60_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_60_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_60_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_60_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_60_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_60_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_60_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_60_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_60_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_60_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_60_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_60_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_60_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_60_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_60_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_60_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_60_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_60_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_60_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_60_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_60_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_60_CB0((uint)(55)).z + BA_Vertex_60_CB0((uint)(55)).w);
  r3.xyz = BA_Vertex_60_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www + BA_Vertex_60_CB1((uint)(4)).yzw;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r3.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_60_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.xy = float2(0,0);
  r1.xyz = BA_Vertex_60_CB5((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_60_CB5((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_60_CB5((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_60_CB5((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_60_CB5((uint)(1)).xy * BA_Vertex_60_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_60_CB5((uint)(0)).xy * BA_Vertex_60_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_60_CB5((uint)(2)).xy * BA_Vertex_60_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_60_CB5((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_60_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_60_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_60_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r2.zw;
  o5.xyzw = r2.xyzw;
  o6.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_61_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_61_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_61_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_61_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_61_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_61_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0,
  out uint o6 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_61_CB1((uint)(0)).xy + BA_Vertex_61_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_61_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_61_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_61_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_61_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_61_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_61_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_61_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_61_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_61_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_61_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_61_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_61_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_61_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_61_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_61_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_61_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_61_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_61_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_61_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_61_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_61_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_61_CB0((uint)(55)).z + BA_Vertex_61_CB0((uint)(55)).w);
  o2.x = saturate(dot(r1.xyz, BA_Vertex_61_CB0((uint)(5)).xyz));
  r3.xyz = BA_Vertex_61_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r4.xyz = r3.xyz * r0.www + BA_Vertex_61_CB1((uint)(4)).yzw;
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r3.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r4.xyz, r4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r4.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r3.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_61_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  r1.xyz = BA_Vertex_61_CB5((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_61_CB5((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_61_CB5((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_61_CB5((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_61_CB5((uint)(1)).xy * BA_Vertex_61_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_61_CB5((uint)(0)).xy * BA_Vertex_61_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_61_CB5((uint)(2)).xy * BA_Vertex_61_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_61_CB5((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_61_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_61_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_61_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r2.zw;
  o5.xyzw = r2.xyzw;
  o6.x = v3.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_62_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_62_CB2(uint i)
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

float4 BA_Vertex_62_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_62_CB0(uint i)
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
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0)
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

  o0.xy = v2.xy * BA_Vertex_62_CB1((uint)(0)).xy + BA_Vertex_62_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_62_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_62_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_62_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_62_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_62_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_62_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_62_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_62_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_62_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_62_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_62_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_62_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_62_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_62_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_62_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_62_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_62_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_62_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_62_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_62_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_62_CB0((uint)(55)).x * r0.w;
  r3.xyz = BA_Vertex_62_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www + BA_Vertex_62_CB1((uint)(4)).yzw;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r3.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_62_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.xyz = BA_Vertex_62_CB3((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_62_CB3((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_62_CB3((uint)(2)).xyz * r1.zzz + r0.xyz;
  r0.xyz = BA_Vertex_62_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_62_CB3((uint)(1)).xy * BA_Vertex_62_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_62_CB3((uint)(0)).xy * BA_Vertex_62_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_62_CB3((uint)(2)).xy * BA_Vertex_62_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_62_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_62_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_62_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_62_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r2.zw;
  o5.xyzw = r2.xyzw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_63_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_63_CB2(uint i)
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

float4 BA_Vertex_63_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_63_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_63_CB1((uint)(0)).xy + BA_Vertex_63_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_63_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_63_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_63_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_63_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_63_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_63_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_63_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_63_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_63_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_63_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_63_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_63_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_63_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_63_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_63_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_63_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_63_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_63_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_63_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_63_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_63_CB0((uint)(55)).x * r0.w;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_63_CB0((uint)(5)).xyz));
  r3.xyz = BA_Vertex_63_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r4.xyz = r3.xyz * r0.www + BA_Vertex_63_CB1((uint)(4)).yzw;
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r3.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r4.xyz, r4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r4.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r3.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_63_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  r0.xyz = BA_Vertex_63_CB3((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_63_CB3((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_63_CB3((uint)(2)).xyz * r1.zzz + r0.xyz;
  r0.xyz = BA_Vertex_63_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_63_CB3((uint)(1)).xy * BA_Vertex_63_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_63_CB3((uint)(0)).xy * BA_Vertex_63_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_63_CB3((uint)(2)).xy * BA_Vertex_63_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_63_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_63_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_63_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_63_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r2.zw;
  o5.xyzw = r2.xyzw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_64_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_64_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_64_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_64_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_64_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_64_CB0(uint i)
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
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0,
  out uint o6 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
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

  o0.xy = v2.xy * BA_Vertex_64_CB1((uint)(0)).xy + BA_Vertex_64_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_64_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_64_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_64_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_64_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_64_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_64_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_64_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_64_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_64_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_64_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_64_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_64_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_64_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_64_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_64_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_64_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_64_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_64_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_64_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_64_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_64_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_64_CB0((uint)(55)).x * r0.w;
  r3.xyz = BA_Vertex_64_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www + BA_Vertex_64_CB1((uint)(4)).yzw;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r3.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_64_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.xy = float2(0,0);
  r1.xyz = BA_Vertex_64_CB5((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_64_CB5((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_64_CB5((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_64_CB5((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_64_CB5((uint)(1)).xy * BA_Vertex_64_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_64_CB5((uint)(0)).xy * BA_Vertex_64_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_64_CB5((uint)(2)).xy * BA_Vertex_64_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_64_CB5((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_64_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_64_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_64_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r2.zw;
  o5.xyzw = r2.xyzw;
  o6.x = v3.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_65_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_65_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_65_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_65_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_65_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_65_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0,
  out uint o6 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_65_CB1((uint)(0)).xy + BA_Vertex_65_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_65_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_65_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_65_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_65_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_65_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_65_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_65_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_65_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_65_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_65_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_65_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_65_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_65_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_65_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_65_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_65_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_65_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_65_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_65_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_65_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_65_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_65_CB0((uint)(55)).x * r0.w;
  o2.x = saturate(dot(r1.xyz, BA_Vertex_65_CB0((uint)(5)).xyz));
  r3.xyz = BA_Vertex_65_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r4.xyz = r3.xyz * r0.www + BA_Vertex_65_CB1((uint)(4)).yzw;
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r3.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r4.xyz, r4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r4.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r3.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_65_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  r1.xyz = BA_Vertex_65_CB5((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_65_CB5((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_65_CB5((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_65_CB5((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_65_CB5((uint)(1)).xy * BA_Vertex_65_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_65_CB5((uint)(0)).xy * BA_Vertex_65_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_65_CB5((uint)(2)).xy * BA_Vertex_65_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_65_CB5((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_65_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_65_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_65_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r2.zw;
  o5.xyzw = r2.xyzw;
  o6.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_66_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_66_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  return value;
}

float4 BA_Vertex_66_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_66_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_66_CB1((uint)(0)).xy + BA_Vertex_66_CB1((uint)(0)).zw;
  o1.xy = v3.xy * BA_Vertex_66_CB2((uint)(23)).xy + BA_Vertex_66_CB2((uint)(23)).zw;
  o1.z = 0;
  r0.x = dot(v1.xyz, BA_Vertex_66_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_66_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_66_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xyz = BA_Vertex_66_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_66_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_66_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_66_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_66_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www + BA_Vertex_66_CB1((uint)(4)).yzw;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r2.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_66_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.xy = BA_Vertex_66_CB3((uint)(1)).xy * BA_Vertex_66_CB0((uint)(125)).yy;
  r0.xy = BA_Vertex_66_CB3((uint)(0)).xy * BA_Vertex_66_CB0((uint)(125)).xx + r0.xy;
  r0.xy = BA_Vertex_66_CB3((uint)(2)).xy * BA_Vertex_66_CB0((uint)(125)).zz + r0.xy;
  r0.xy = BA_Vertex_66_CB3((uint)(3)).xy + r0.xy;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r2.xyz = BA_Vertex_66_CB3((uint)(1)).xyz * r1.yyy;
  r2.xyz = BA_Vertex_66_CB3((uint)(0)).xyz * r1.xxx + r2.xyz;
  r2.xyz = BA_Vertex_66_CB3((uint)(2)).xyz * r1.zzz + r2.xyz;
  r2.xyz = BA_Vertex_66_CB3((uint)(3)).xyz + r2.xyz;
  r0.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r1.w = saturate(BA_Vertex_66_CB0((uint)(125)).w);
  r0.xy = -r0.xy * r1.ww + r0.zw;
  r0.z = max(1, BA_Vertex_66_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.xyzw = BA_Vertex_66_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_66_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_66_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_66_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_66_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o4.xy = r1.xw + r1.zz;
  o4.zw = r0.zw;
  o5.xyzw = r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_67_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_67_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/2u;
    uint c = (i-0u)%2u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_LightmapSTArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_LightmapIndexArray;
  }
  return value;
}

float4 BA_Vertex_67_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_67_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_67_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_67_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  uint v4 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0,
  out uint o6 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v4);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_67_CB1((uint)(0)).xy + BA_Vertex_67_CB1((uint)(0)).zw;
  r0.x = (int)v4.x + asint(BA_Vertex_67_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 1;
  r0.x = (uint)r0.x << 3;
  o1.xy = v3.xy * BA_Vertex_67_CB4((uint)(r0.y+0)).xy + BA_Vertex_67_CB4((uint)(r0.y+0)).zw;
  o1.z = 0;
  r1.x = dot(v1.xyz, BA_Vertex_67_CB3((uint)(r0.x+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_67_CB3((uint)(r0.x+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_67_CB3((uint)(r0.x+6)).xyz);
  r0.y = dot(r1.xyz, r1.xyz);
  r0.y = max(1.17549435e-038, r0.y);
  r0.y = rsqrt(r0.y);
  r0.yzw = r1.xyz * r0.yyy;
  r1.xyz = BA_Vertex_67_CB3((uint)(r0.x+1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_67_CB3((uint)(r0.x+0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_67_CB3((uint)(r0.x+2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_67_CB3((uint)(r0.x+3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_67_CB0((uint)(16)).xyz + -r1.xyz;
  r0.x = dot(r2.xyz, r2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r2.xyz = r2.xyz * r0.xxx + BA_Vertex_67_CB1((uint)(4)).yzw;
  r0.x = dot(r2.xyz, r2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r2.xyz = r2.xyz * r0.xxx;
  r0.x = saturate(dot(r0.yzw, r2.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_67_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.xy = BA_Vertex_67_CB5((uint)(1)).xy * BA_Vertex_67_CB0((uint)(125)).yy;
  r0.xy = BA_Vertex_67_CB5((uint)(0)).xy * BA_Vertex_67_CB0((uint)(125)).xx + r0.xy;
  r0.xy = BA_Vertex_67_CB5((uint)(2)).xy * BA_Vertex_67_CB0((uint)(125)).zz + r0.xy;
  r0.xy = BA_Vertex_67_CB5((uint)(3)).xy + r0.xy;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r2.xyz = BA_Vertex_67_CB5((uint)(1)).xyz * r1.yyy;
  r2.xyz = BA_Vertex_67_CB5((uint)(0)).xyz * r1.xxx + r2.xyz;
  r2.xyz = BA_Vertex_67_CB5((uint)(2)).xyz * r1.zzz + r2.xyz;
  r2.xyz = BA_Vertex_67_CB5((uint)(3)).xyz + r2.xyz;
  r0.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r1.w = saturate(BA_Vertex_67_CB0((uint)(125)).w);
  r0.xy = -r0.xy * r1.ww + r0.zw;
  r0.z = max(1, BA_Vertex_67_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.xyzw = BA_Vertex_67_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_67_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_67_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_67_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_67_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o4.xy = r1.xw + r1.zz;
  o4.zw = r0.zw;
  o5.xyzw = r0.xyzw;
  o6.x = v4.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_68_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_68_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  return value;
}

float4 BA_Vertex_68_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_68_CB0(uint i)
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
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0)
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

  o0.xy = v2.xy * BA_Vertex_68_CB1((uint)(0)).xy + BA_Vertex_68_CB1((uint)(0)).zw;
  o1.xy = v3.xy * BA_Vertex_68_CB2((uint)(23)).xy + BA_Vertex_68_CB2((uint)(23)).zw;
  r0.xyz = BA_Vertex_68_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_68_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_68_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_68_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_68_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_68_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_68_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_68_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = r1.z / BA_Vertex_68_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_68_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.z = saturate(r0.w * BA_Vertex_68_CB0((uint)(55)).z + BA_Vertex_68_CB0((uint)(55)).w);
  r2.x = dot(v1.xyz, BA_Vertex_68_CB2((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_68_CB2((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_68_CB2((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r3.xyz = BA_Vertex_68_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www + BA_Vertex_68_CB1((uint)(4)).yzw;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r2.xyz, r3.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_68_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.xy = float2(0,0);
  r2.xyz = BA_Vertex_68_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_68_CB3((uint)(0)).xyz * r0.xxx + r2.xyz;
  r0.xyz = BA_Vertex_68_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_68_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_68_CB3((uint)(1)).xy * BA_Vertex_68_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_68_CB3((uint)(0)).xy * BA_Vertex_68_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_68_CB3((uint)(2)).xy * BA_Vertex_68_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_68_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r2.x = saturate(BA_Vertex_68_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r2.xx + r0.xy;
  r0.z = max(1, BA_Vertex_68_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_68_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r1.zw;
  o5.xyzw = r1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_69_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_69_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/2u;
    uint c = (i-0u)%2u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_LightmapSTArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_LightmapIndexArray;
  }
  return value;
}

float4 BA_Vertex_69_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_69_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_69_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_69_CB0(uint i)
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
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float2 v3 : TEXCOORD1,
  uint v4 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0,
  out uint o6 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v4);
#endif
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

  o0.xy = v2.xy * BA_Vertex_69_CB1((uint)(0)).xy + BA_Vertex_69_CB1((uint)(0)).zw;
  r0.x = (int)v4.x + asint(BA_Vertex_69_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 1;
  r0.x = (uint)r0.x << 3;
  o1.xy = v3.xy * BA_Vertex_69_CB4((uint)(r0.y+0)).xy + BA_Vertex_69_CB4((uint)(r0.y+0)).zw;
  r0.yzw = BA_Vertex_69_CB3((uint)(r0.x+1)).xyz * v0.yyy;
  r0.yzw = BA_Vertex_69_CB3((uint)(r0.x+0)).xyz * v0.xxx + r0.yzw;
  r0.yzw = BA_Vertex_69_CB3((uint)(r0.x+2)).xyz * v0.zzz + r0.yzw;
  r0.yzw = BA_Vertex_69_CB3((uint)(r0.x+3)).xyz + r0.yzw;
  r1.xyzw = BA_Vertex_69_CB0((uint)(74)).xyzw * r0.zzzz;
  r1.xyzw = BA_Vertex_69_CB0((uint)(73)).xyzw * r0.yyyy + r1.xyzw;
  r1.xyzw = BA_Vertex_69_CB0((uint)(75)).xyzw * r0.wwww + r1.xyzw;
  r1.xyzw = BA_Vertex_69_CB0((uint)(76)).xyzw + r1.xyzw;
  r2.x = r1.z / BA_Vertex_69_CB0((uint)(17)).y;
  r2.x = 1 + -r2.x;
  r2.x = BA_Vertex_69_CB0((uint)(17)).z * r2.x;
  r2.x = max(0, r2.x);
  o1.z = saturate(r2.x * BA_Vertex_69_CB0((uint)(55)).z + BA_Vertex_69_CB0((uint)(55)).w);
  r2.x = dot(v1.xyz, BA_Vertex_69_CB3((uint)(r0.x+4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_69_CB3((uint)(r0.x+5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_69_CB3((uint)(r0.x+6)).xyz);
  r0.x = dot(r2.xyz, r2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r2.xyz = r2.xyz * r0.xxx;
  r3.xyz = BA_Vertex_69_CB0((uint)(16)).xyz + -r0.yzw;
  r0.x = dot(r3.xyz, r3.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r3.xyz = r3.xyz * r0.xxx + BA_Vertex_69_CB1((uint)(4)).yzw;
  r0.x = dot(r3.xyz, r3.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r3.xyz = r3.xyz * r0.xxx;
  r0.x = saturate(dot(r2.xyz, r3.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_69_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r2.xyz = BA_Vertex_69_CB5((uint)(1)).xyz * r0.zzz;
  r0.xyz = BA_Vertex_69_CB5((uint)(0)).xyz * r0.yyy + r2.xyz;
  r0.xyz = BA_Vertex_69_CB5((uint)(2)).xyz * r0.www + r0.xyz;
  r0.xyz = BA_Vertex_69_CB5((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_69_CB5((uint)(1)).xy * BA_Vertex_69_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_69_CB5((uint)(0)).xy * BA_Vertex_69_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_69_CB5((uint)(2)).xy * BA_Vertex_69_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_69_CB5((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r2.x = saturate(BA_Vertex_69_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r2.xx + r0.xy;
  r0.z = max(1, BA_Vertex_69_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_69_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r1.zw;
  o5.xyzw = r1.xyzw;
  o6.x = v4.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_70_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_70_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  return value;
}

float4 BA_Vertex_70_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_70_CB0(uint i)
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
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0)
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

  o0.xy = v2.xy * BA_Vertex_70_CB1((uint)(0)).xy + BA_Vertex_70_CB1((uint)(0)).zw;
  o1.xy = v3.xy * BA_Vertex_70_CB2((uint)(23)).xy + BA_Vertex_70_CB2((uint)(23)).zw;
  r0.xyz = BA_Vertex_70_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_70_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_70_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_70_CB2((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_70_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_70_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_70_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_70_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = r1.z / BA_Vertex_70_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_70_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.z = BA_Vertex_70_CB0((uint)(55)).x * r0.w;
  r2.x = dot(v1.xyz, BA_Vertex_70_CB2((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_70_CB2((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_70_CB2((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r3.xyz = BA_Vertex_70_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www + BA_Vertex_70_CB1((uint)(4)).yzw;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r2.xyz, r3.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_70_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.xy = float2(0,0);
  r2.xyz = BA_Vertex_70_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_70_CB3((uint)(0)).xyz * r0.xxx + r2.xyz;
  r0.xyz = BA_Vertex_70_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_70_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_70_CB3((uint)(1)).xy * BA_Vertex_70_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_70_CB3((uint)(0)).xy * BA_Vertex_70_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_70_CB3((uint)(2)).xy * BA_Vertex_70_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_70_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r2.x = saturate(BA_Vertex_70_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r2.xx + r0.xy;
  r0.z = max(1, BA_Vertex_70_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_70_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r1.zw;
  o5.xyzw = r1.xyzw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_71_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_71_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/2u;
    uint c = (i-0u)%2u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_LightmapSTArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_LightmapIndexArray;
  }
  return value;
}

float4 BA_Vertex_71_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_71_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_71_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_71_CB0(uint i)
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
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float2 v3 : TEXCOORD1,
  uint v4 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0,
  out uint o6 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v4);
#endif
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

  o0.xy = v2.xy * BA_Vertex_71_CB1((uint)(0)).xy + BA_Vertex_71_CB1((uint)(0)).zw;
  r0.x = (int)v4.x + asint(BA_Vertex_71_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 1;
  r0.x = (uint)r0.x << 3;
  o1.xy = v3.xy * BA_Vertex_71_CB4((uint)(r0.y+0)).xy + BA_Vertex_71_CB4((uint)(r0.y+0)).zw;
  r0.yzw = BA_Vertex_71_CB3((uint)(r0.x+1)).xyz * v0.yyy;
  r0.yzw = BA_Vertex_71_CB3((uint)(r0.x+0)).xyz * v0.xxx + r0.yzw;
  r0.yzw = BA_Vertex_71_CB3((uint)(r0.x+2)).xyz * v0.zzz + r0.yzw;
  r0.yzw = BA_Vertex_71_CB3((uint)(r0.x+3)).xyz + r0.yzw;
  r1.xyzw = BA_Vertex_71_CB0((uint)(74)).xyzw * r0.zzzz;
  r1.xyzw = BA_Vertex_71_CB0((uint)(73)).xyzw * r0.yyyy + r1.xyzw;
  r1.xyzw = BA_Vertex_71_CB0((uint)(75)).xyzw * r0.wwww + r1.xyzw;
  r1.xyzw = BA_Vertex_71_CB0((uint)(76)).xyzw + r1.xyzw;
  r2.x = r1.z / BA_Vertex_71_CB0((uint)(17)).y;
  r2.x = 1 + -r2.x;
  r2.x = BA_Vertex_71_CB0((uint)(17)).z * r2.x;
  r2.x = max(0, r2.x);
  o1.z = BA_Vertex_71_CB0((uint)(55)).x * r2.x;
  r2.x = dot(v1.xyz, BA_Vertex_71_CB3((uint)(r0.x+4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_71_CB3((uint)(r0.x+5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_71_CB3((uint)(r0.x+6)).xyz);
  r0.x = dot(r2.xyz, r2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r2.xyz = r2.xyz * r0.xxx;
  r3.xyz = BA_Vertex_71_CB0((uint)(16)).xyz + -r0.yzw;
  r0.x = dot(r3.xyz, r3.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r3.xyz = r3.xyz * r0.xxx + BA_Vertex_71_CB1((uint)(4)).yzw;
  r0.x = dot(r3.xyz, r3.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r3.xyz = r3.xyz * r0.xxx;
  r0.x = saturate(dot(r2.xyz, r3.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_71_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r2.xyz = BA_Vertex_71_CB5((uint)(1)).xyz * r0.zzz;
  r0.xyz = BA_Vertex_71_CB5((uint)(0)).xyz * r0.yyy + r2.xyz;
  r0.xyz = BA_Vertex_71_CB5((uint)(2)).xyz * r0.www + r0.xyz;
  r0.xyz = BA_Vertex_71_CB5((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_71_CB5((uint)(1)).xy * BA_Vertex_71_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_71_CB5((uint)(0)).xy * BA_Vertex_71_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_71_CB5((uint)(2)).xy * BA_Vertex_71_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_71_CB5((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r2.x = saturate(BA_Vertex_71_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r2.xx + r0.xy;
  r0.z = max(1, BA_Vertex_71_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_71_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r1.zw;
  o5.xyzw = r1.xyzw;
  o6.x = v4.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_72_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_72_CB2(uint i)
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

float4 BA_Vertex_72_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_72_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0)
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

  o0.xy = v2.xy * BA_Vertex_72_CB1((uint)(0)).xy + BA_Vertex_72_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_72_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_72_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_72_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_72_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_72_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_72_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_72_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_72_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_72_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_72_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  o1.w = 0;
  r1.xyz = BA_Vertex_72_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_72_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_72_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_72_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_72_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www + BA_Vertex_72_CB1((uint)(4)).yzw;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r2.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_72_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.xy = BA_Vertex_72_CB3((uint)(1)).xy * BA_Vertex_72_CB0((uint)(125)).yy;
  r0.xy = BA_Vertex_72_CB3((uint)(0)).xy * BA_Vertex_72_CB0((uint)(125)).xx + r0.xy;
  r0.xy = BA_Vertex_72_CB3((uint)(2)).xy * BA_Vertex_72_CB0((uint)(125)).zz + r0.xy;
  r0.xy = BA_Vertex_72_CB3((uint)(3)).xy + r0.xy;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r2.xyz = BA_Vertex_72_CB3((uint)(1)).xyz * r1.yyy;
  r2.xyz = BA_Vertex_72_CB3((uint)(0)).xyz * r1.xxx + r2.xyz;
  r2.xyz = BA_Vertex_72_CB3((uint)(2)).xyz * r1.zzz + r2.xyz;
  r2.xyz = BA_Vertex_72_CB3((uint)(3)).xyz + r2.xyz;
  r0.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r1.w = saturate(BA_Vertex_72_CB0((uint)(125)).w);
  r0.xy = -r0.xy * r1.ww + r0.zw;
  r0.z = max(1, BA_Vertex_72_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.xyzw = BA_Vertex_72_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_72_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_72_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_72_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_72_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o4.xy = r1.xw + r1.zz;
  o4.zw = r0.zw;
  o5.xyzw = r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_73_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_73_CB2(uint i)
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

float4 BA_Vertex_73_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_73_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  out float4 o4 : TEXCOORD4,
  out float4 o5 : TEXCOORD5,
  out float4 o6 : TEXCOORD7,
  out float4 o7 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_73_CB1((uint)(0)).xy + BA_Vertex_73_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_73_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_73_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_73_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_73_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_73_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_73_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_73_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_73_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_73_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_73_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  o1.w = 0;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_73_CB0((uint)(5)).xyz));
  r1.xyz = BA_Vertex_73_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_73_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_73_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_73_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyz = BA_Vertex_73_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r2.xyz * r0.www + BA_Vertex_73_CB1((uint)(4)).yzw;
  r2.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r2.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r2.xyz));
  o4.xyz = r0.xyz;
  r0.x = log2(r0.w);
  r0.x = BA_Vertex_73_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  r0.xy = BA_Vertex_73_CB3((uint)(1)).xy * BA_Vertex_73_CB0((uint)(125)).yy;
  r0.xy = BA_Vertex_73_CB3((uint)(0)).xy * BA_Vertex_73_CB0((uint)(125)).xx + r0.xy;
  r0.xy = BA_Vertex_73_CB3((uint)(2)).xy * BA_Vertex_73_CB0((uint)(125)).zz + r0.xy;
  r0.xy = BA_Vertex_73_CB3((uint)(3)).xy + r0.xy;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r2.xyz = BA_Vertex_73_CB3((uint)(1)).xyz * r1.yyy;
  r2.xyz = BA_Vertex_73_CB3((uint)(0)).xyz * r1.xxx + r2.xyz;
  r2.xyz = BA_Vertex_73_CB3((uint)(2)).xyz * r1.zzz + r2.xyz;
  r2.xyz = BA_Vertex_73_CB3((uint)(3)).xyz + r2.xyz;
  r0.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r1.w = saturate(BA_Vertex_73_CB0((uint)(125)).w);
  r0.xy = -r0.xy * r1.ww + r0.zw;
  r0.z = max(1, BA_Vertex_73_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  o5.xyz = r1.xyz;
  r0.xyzw = BA_Vertex_73_CB0((uint)(74)).xyzw * r1.yyyy;
  r0.xyzw = BA_Vertex_73_CB0((uint)(73)).xyzw * r1.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_73_CB0((uint)(75)).xyzw * r1.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_73_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_73_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o6.xy = r1.xw + r1.zz;
  o6.zw = r0.zw;
  o7.xyzw = r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_74_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_74_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_74_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_74_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_74_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_74_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0,
  out uint o6 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
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

  o0.xy = v2.xy * BA_Vertex_74_CB1((uint)(0)).xy + BA_Vertex_74_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_74_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_74_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_74_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_74_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_74_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_74_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_74_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_74_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_74_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_74_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_74_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  o1.w = 0;
  r0.xzw = BA_Vertex_74_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_74_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_74_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_74_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyz = BA_Vertex_74_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www + BA_Vertex_74_CB1((uint)(4)).yzw;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r2.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_74_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.xy = float2(0,0);
  r1.xy = BA_Vertex_74_CB5((uint)(1)).xy * BA_Vertex_74_CB0((uint)(125)).yy;
  r1.xy = BA_Vertex_74_CB5((uint)(0)).xy * BA_Vertex_74_CB0((uint)(125)).xx + r1.xy;
  r1.xy = BA_Vertex_74_CB5((uint)(2)).xy * BA_Vertex_74_CB0((uint)(125)).zz + r1.xy;
  r1.xy = BA_Vertex_74_CB5((uint)(3)).xy + r1.xy;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r2.xyz = BA_Vertex_74_CB5((uint)(1)).xyz * r0.yyy;
  r2.xyz = BA_Vertex_74_CB5((uint)(0)).xyz * r0.xxx + r2.xyz;
  r2.xyz = BA_Vertex_74_CB5((uint)(2)).xyz * r0.zzz + r2.xyz;
  r2.xyz = BA_Vertex_74_CB5((uint)(3)).xyz + r2.xyz;
  r1.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r0.w = saturate(BA_Vertex_74_CB0((uint)(125)).w);
  r1.xy = -r1.xy * r0.ww + r1.zw;
  r0.w = max(1, BA_Vertex_74_CB0((uint)(125)).w);
  r1.xy = r1.xy * r0.ww;
  o3.xy = r1.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r1.xyzw = BA_Vertex_74_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_74_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_74_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_74_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_74_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o4.xy = r1.xw + r1.zz;
  o4.zw = r0.zw;
  o5.xyzw = r0.xyzw;
  o6.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_75_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_75_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_75_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_75_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_75_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_75_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD4,
  out float4 o5 : TEXCOORD5,
  out float4 o6 : TEXCOORD7,
  out float4 o7 : SV_POSITION0,
  out uint o8 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_75_CB1((uint)(0)).xy + BA_Vertex_75_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_75_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_75_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_75_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_75_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_75_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_75_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_75_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_75_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_75_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_75_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_75_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  o1.w = 0;
  r0.xzw = BA_Vertex_75_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_75_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_75_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_75_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyz = BA_Vertex_75_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r2.xyz * r0.www + BA_Vertex_75_CB1((uint)(4)).yzw;
  r2.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r2.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r2.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_75_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.x = saturate(dot(r1.xyz, BA_Vertex_75_CB0((uint)(5)).xyz));
  o4.xyz = r1.xyz;
  r1.xy = BA_Vertex_75_CB5((uint)(1)).xy * BA_Vertex_75_CB0((uint)(125)).yy;
  r1.xy = BA_Vertex_75_CB5((uint)(0)).xy * BA_Vertex_75_CB0((uint)(125)).xx + r1.xy;
  r1.xy = BA_Vertex_75_CB5((uint)(2)).xy * BA_Vertex_75_CB0((uint)(125)).zz + r1.xy;
  r1.xy = BA_Vertex_75_CB5((uint)(3)).xy + r1.xy;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r2.xyz = BA_Vertex_75_CB5((uint)(1)).xyz * r0.yyy;
  r2.xyz = BA_Vertex_75_CB5((uint)(0)).xyz * r0.xxx + r2.xyz;
  r2.xyz = BA_Vertex_75_CB5((uint)(2)).xyz * r0.zzz + r2.xyz;
  r2.xyz = BA_Vertex_75_CB5((uint)(3)).xyz + r2.xyz;
  r1.zw = r2.xy * float2(2,2) + float2(-1,-1);
  o3.z = r2.z;
  r0.w = saturate(BA_Vertex_75_CB0((uint)(125)).w);
  r1.xy = -r1.xy * r0.ww + r1.zw;
  r0.w = max(1, BA_Vertex_75_CB0((uint)(125)).w);
  r1.xy = r1.xy * r0.ww;
  o3.xy = r1.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  o5.xyz = r0.xyz;
  r1.xyzw = BA_Vertex_75_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_75_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_75_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_75_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_75_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o6.xy = r1.xw + r1.zz;
  o6.zw = r0.zw;
  o7.xyzw = r0.xyzw;
  o8.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_76_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_76_CB2(uint i)
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

float4 BA_Vertex_76_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_76_CB0(uint i)
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
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0)
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

  o0.xy = v2.xy * BA_Vertex_76_CB1((uint)(0)).xy + BA_Vertex_76_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_76_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_76_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_76_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_76_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_76_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_76_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_76_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_76_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_76_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_76_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_76_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_76_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_76_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_76_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_76_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_76_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_76_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_76_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_76_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_76_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_76_CB0((uint)(55)).z + BA_Vertex_76_CB0((uint)(55)).w);
  r3.xyz = BA_Vertex_76_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www + BA_Vertex_76_CB1((uint)(4)).yzw;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r3.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_76_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.xyz = BA_Vertex_76_CB3((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_76_CB3((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_76_CB3((uint)(2)).xyz * r1.zzz + r0.xyz;
  r0.xyz = BA_Vertex_76_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_76_CB3((uint)(1)).xy * BA_Vertex_76_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_76_CB3((uint)(0)).xy * BA_Vertex_76_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_76_CB3((uint)(2)).xy * BA_Vertex_76_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_76_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_76_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_76_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_76_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r2.zw;
  o5.xyzw = r2.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_77_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_77_CB2(uint i)
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

float4 BA_Vertex_77_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_77_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o4 : TEXCOORD4,
  out float4 o5 : TEXCOORD5,
  out float4 o6 : TEXCOORD7,
  out float4 o7 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_77_CB1((uint)(0)).xy + BA_Vertex_77_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_77_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_77_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_77_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_77_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_77_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_77_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_77_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_77_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_77_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_77_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_77_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_77_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_77_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_77_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_77_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_77_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_77_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_77_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_77_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_77_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_77_CB0((uint)(55)).z + BA_Vertex_77_CB0((uint)(55)).w);
  r3.xyz = BA_Vertex_77_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r4.xyz = r3.xyz * r0.www + BA_Vertex_77_CB1((uint)(4)).yzw;
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r3.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r4.xyz, r4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r4.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r3.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_77_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.x = saturate(dot(r0.xyz, BA_Vertex_77_CB0((uint)(5)).xyz));
  o4.xyz = r0.xyz;
  r0.xyz = BA_Vertex_77_CB3((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_77_CB3((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_77_CB3((uint)(2)).xyz * r1.zzz + r0.xyz;
  o5.xyz = r1.xyz;
  r0.xyz = BA_Vertex_77_CB3((uint)(3)).xyz + r0.xyz;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  o3.z = r0.z;
  r0.zw = BA_Vertex_77_CB3((uint)(1)).xy * BA_Vertex_77_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_77_CB3((uint)(0)).xy * BA_Vertex_77_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_77_CB3((uint)(2)).xy * BA_Vertex_77_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_77_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_77_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_77_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_77_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o6.xy = r0.xw + r0.zz;
  o6.zw = r2.zw;
  o7.xyzw = r2.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_78_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_78_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_78_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_78_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_78_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_78_CB0(uint i)
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
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0,
  out uint o6 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
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

  o0.xy = v2.xy * BA_Vertex_78_CB1((uint)(0)).xy + BA_Vertex_78_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_78_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_78_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_78_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_78_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_78_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_78_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_78_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_78_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_78_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_78_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_78_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_78_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_78_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_78_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_78_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_78_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_78_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_78_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_78_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_78_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_78_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_78_CB0((uint)(55)).z + BA_Vertex_78_CB0((uint)(55)).w);
  r3.xyz = BA_Vertex_78_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www + BA_Vertex_78_CB1((uint)(4)).yzw;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r3.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_78_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.xy = float2(0,0);
  r1.xyz = BA_Vertex_78_CB5((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_78_CB5((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_78_CB5((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_78_CB5((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_78_CB5((uint)(1)).xy * BA_Vertex_78_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_78_CB5((uint)(0)).xy * BA_Vertex_78_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_78_CB5((uint)(2)).xy * BA_Vertex_78_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_78_CB5((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_78_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_78_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_78_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r2.zw;
  o5.xyzw = r2.xyzw;
  o6.x = v3.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_79_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_79_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_79_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_79_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_79_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_79_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD4,
  out float4 o5 : TEXCOORD5,
  out float4 o6 : TEXCOORD7,
  out float4 o7 : SV_POSITION0,
  out uint o8 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_79_CB1((uint)(0)).xy + BA_Vertex_79_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_79_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_79_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_79_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_79_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_79_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_79_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_79_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_79_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_79_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_79_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_79_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_79_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_79_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_79_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_79_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_79_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_79_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_79_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_79_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_79_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_79_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = saturate(r0.w * BA_Vertex_79_CB0((uint)(55)).z + BA_Vertex_79_CB0((uint)(55)).w);
  o2.x = saturate(dot(r1.xyz, BA_Vertex_79_CB0((uint)(5)).xyz));
  r3.xyz = BA_Vertex_79_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r4.xyz = r3.xyz * r0.www + BA_Vertex_79_CB1((uint)(4)).yzw;
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r3.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r4.xyz, r4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r4.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r3.xyz));
  o4.xyz = r1.xyz;
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_79_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  r1.xyz = BA_Vertex_79_CB5((uint)(1)).xyz * r0.yyy;
  r1.xyz = BA_Vertex_79_CB5((uint)(0)).xyz * r0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_79_CB5((uint)(2)).xyz * r0.zzz + r1.xyz;
  o5.xyz = r0.xyz;
  r0.xyz = BA_Vertex_79_CB5((uint)(3)).xyz + r1.xyz;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  o3.z = r0.z;
  r0.zw = BA_Vertex_79_CB5((uint)(1)).xy * BA_Vertex_79_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_79_CB5((uint)(0)).xy * BA_Vertex_79_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_79_CB5((uint)(2)).xy * BA_Vertex_79_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_79_CB5((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_79_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_79_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_79_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o6.xy = r0.xw + r0.zz;
  o6.zw = r2.zw;
  o7.xyzw = r2.xyzw;
  o8.x = v3.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_80_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_80_CB2(uint i)
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

float4 BA_Vertex_80_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_80_CB0(uint i)
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
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0)
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

  o0.xy = v2.xy * BA_Vertex_80_CB1((uint)(0)).xy + BA_Vertex_80_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_80_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_80_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_80_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_80_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_80_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_80_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_80_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_80_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_80_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_80_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_80_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_80_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_80_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_80_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_80_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_80_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_80_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_80_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_80_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_80_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_80_CB0((uint)(55)).x * r0.w;
  r3.xyz = BA_Vertex_80_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www + BA_Vertex_80_CB1((uint)(4)).yzw;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r3.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Vertex_80_CB1((uint)(5)).w * r0.x;
  o2.z = exp2(r0.x);
  o2.xy = float2(0,0);
  r0.xyz = BA_Vertex_80_CB3((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_80_CB3((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_80_CB3((uint)(2)).xyz * r1.zzz + r0.xyz;
  r0.xyz = BA_Vertex_80_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_80_CB3((uint)(1)).xy * BA_Vertex_80_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_80_CB3((uint)(0)).xy * BA_Vertex_80_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_80_CB3((uint)(2)).xy * BA_Vertex_80_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_80_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_80_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_80_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_80_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r2.zw;
  o5.xyzw = r2.xyzw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_81_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_81_CB2(uint i)
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

float4 BA_Vertex_81_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_81_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  out float4 o4 : TEXCOORD4,
  out float4 o5 : TEXCOORD5,
  out float4 o6 : TEXCOORD7,
  out float4 o7 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_81_CB1((uint)(0)).xy + BA_Vertex_81_CB1((uint)(0)).zw;
  r0.x = dot(v1.xyz, BA_Vertex_81_CB2((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_81_CB2((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_81_CB2((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(BA_Vertex_81_CB2((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_81_CB2((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_81_CB2((uint)(30)).xyzw, r2.xyzw);
  r1.xyz = BA_Vertex_81_CB2((uint)(31)).xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(BA_Vertex_81_CB2((uint)(25)).xyzw, r0.xyzw);
  r2.y = dot(BA_Vertex_81_CB2((uint)(26)).xyzw, r0.xyzw);
  r2.z = dot(BA_Vertex_81_CB2((uint)(27)).xyzw, r0.xyzw);
  r1.xyz = r2.xyz + r1.xyz;
  o1.xyz = max(float3(0,0,0), r1.xyz);
  r1.xyz = BA_Vertex_81_CB2((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_81_CB2((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_81_CB2((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_81_CB2((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_81_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_81_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_81_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_81_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_81_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_81_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_81_CB0((uint)(55)).x * r0.w;
  r3.xyz = BA_Vertex_81_CB0((uint)(16)).xyz + -r1.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r4.xyz = r3.xyz * r0.www + BA_Vertex_81_CB1((uint)(4)).yzw;
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r3.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r4.xyz, r4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r4.xyz * r0.www;
  r0.w = saturate(dot(r0.xyz, r3.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_81_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.x = saturate(dot(r0.xyz, BA_Vertex_81_CB0((uint)(5)).xyz));
  o4.xyz = r0.xyz;
  r0.xyz = BA_Vertex_81_CB3((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_81_CB3((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_81_CB3((uint)(2)).xyz * r1.zzz + r0.xyz;
  o5.xyz = r1.xyz;
  r0.xyz = BA_Vertex_81_CB3((uint)(3)).xyz + r0.xyz;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  o3.z = r0.z;
  r0.zw = BA_Vertex_81_CB3((uint)(1)).xy * BA_Vertex_81_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_81_CB3((uint)(0)).xy * BA_Vertex_81_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_81_CB3((uint)(2)).xy * BA_Vertex_81_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_81_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_81_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_81_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_81_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o6.xy = r0.xw + r0.zz;
  o6.zw = r2.zw;
  o7.xyzw = r2.xyzw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_82_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_82_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_82_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_82_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_82_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_82_CB0(uint i)
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
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD7,
  out float4 o5 : SV_POSITION0,
  out uint o6 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
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

  o0.xy = v2.xy * BA_Vertex_82_CB1((uint)(0)).xy + BA_Vertex_82_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_82_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_82_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_82_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_82_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_82_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_82_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_82_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_82_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_82_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_82_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_82_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_82_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_82_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_82_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_82_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_82_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_82_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_82_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_82_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_82_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_82_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_82_CB0((uint)(55)).x * r0.w;
  r3.xyz = BA_Vertex_82_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www + BA_Vertex_82_CB1((uint)(4)).yzw;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r3.xyz));
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_82_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  o2.xy = float2(0,0);
  r1.xyz = BA_Vertex_82_CB5((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_82_CB5((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_82_CB5((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_82_CB5((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_82_CB5((uint)(1)).xy * BA_Vertex_82_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_82_CB5((uint)(0)).xy * BA_Vertex_82_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_82_CB5((uint)(2)).xy * BA_Vertex_82_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_82_CB5((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_82_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_82_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_82_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o4.xy = r0.xw + r0.zz;
  o4.zw = r2.zw;
  o5.xyzw = r2.xyzw;
  o6.x = v3.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Vertex_83_CB5(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_83_CB4(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/7u;
    uint c = (i-0u)%7u;
    if (c == 0u) value = unity_Builtins2Array[e].unity_SHArArray;
    if (c == 1u) value = unity_Builtins2Array[e].unity_SHAgArray;
    if (c == 2u) value = unity_Builtins2Array[e].unity_SHAbArray;
    if (c == 3u) value = unity_Builtins2Array[e].unity_SHBrArray;
    if (c == 4u) value = unity_Builtins2Array[e].unity_SHBgArray;
    if (c == 5u) value = unity_Builtins2Array[e].unity_SHBbArray;
    if (c == 6u) value = unity_Builtins2Array[e].unity_SHCArray;
  }
  return value;
}

float4 BA_Vertex_83_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_83_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_83_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 4u) value = float4(0.0, _SpecLightDir.x, _SpecLightDir.y, _SpecLightDir.z);
  if (i == 5u) value = float4(0.0, 0.0, 0.0, _SpecPower);
  return value;
}

float4 BA_Vertex_83_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
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
  uint v3 : SV_InstanceID0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD4,
  out float4 o5 : TEXCOORD5,
  out float4 o6 : TEXCOORD7,
  out float4 o7 : SV_POSITION0,
  out uint o8 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_83_CB1((uint)(0)).xy + BA_Vertex_83_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_83_CB2((uint)(0)).x);
  r0.y = (uint)r0.x << 3;
  r0.x = (int)r0.x * 7;
  r1.x = dot(v1.xyz, BA_Vertex_83_CB3((uint)(r0.y+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_83_CB3((uint)(r0.y+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_83_CB3((uint)(r0.y+6)).xyz);
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = max(1.17549435e-038, r0.z);
  r0.z = rsqrt(r0.z);
  r1.xyz = r1.xyz * r0.zzz;
  r0.z = r1.y * r1.y;
  r0.z = r1.x * r1.x + -r0.z;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_83_CB4((uint)(r0.x+3)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_83_CB4((uint)(r0.x+4)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_83_CB4((uint)(r0.x+5)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_83_CB4((uint)(r0.x+6)).xyz * r0.zzz + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_83_CB4((uint)(r0.x+0)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_83_CB4((uint)(r0.x+1)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_83_CB4((uint)(r0.x+2)).xyzw, r1.xyzw);
  r0.xzw = r3.xyz + r2.xyz;
  o1.xyz = max(float3(0,0,0), r0.xzw);
  r0.xzw = BA_Vertex_83_CB3((uint)(r0.y+1)).xyz * v0.yyy;
  r0.xzw = BA_Vertex_83_CB3((uint)(r0.y+0)).xyz * v0.xxx + r0.xzw;
  r0.xzw = BA_Vertex_83_CB3((uint)(r0.y+2)).xyz * v0.zzz + r0.xzw;
  r0.xyz = BA_Vertex_83_CB3((uint)(r0.y+3)).xyz + r0.xzw;
  r2.xyzw = BA_Vertex_83_CB0((uint)(74)).xyzw * r0.yyyy;
  r2.xyzw = BA_Vertex_83_CB0((uint)(73)).xyzw * r0.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_83_CB0((uint)(75)).xyzw * r0.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_83_CB0((uint)(76)).xyzw + r2.xyzw;
  r0.w = r2.z / BA_Vertex_83_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_83_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o1.w = BA_Vertex_83_CB0((uint)(55)).x * r0.w;
  o2.x = saturate(dot(r1.xyz, BA_Vertex_83_CB0((uint)(5)).xyz));
  r3.xyz = BA_Vertex_83_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r4.xyz = r3.xyz * r0.www + BA_Vertex_83_CB1((uint)(4)).yzw;
  r3.xyz = r3.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r3.xyz));
  o2.y = 1 + -r0.w;
  r0.w = dot(r4.xyz, r4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r3.xyz = r4.xyz * r0.www;
  r0.w = saturate(dot(r1.xyz, r3.xyz));
  o4.xyz = r1.xyz;
  r0.w = log2(r0.w);
  r0.w = BA_Vertex_83_CB1((uint)(5)).w * r0.w;
  o2.z = exp2(r0.w);
  r1.xyz = BA_Vertex_83_CB5((uint)(1)).xyz * r0.yyy;
  r1.xyz = BA_Vertex_83_CB5((uint)(0)).xyz * r0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_83_CB5((uint)(2)).xyz * r0.zzz + r1.xyz;
  o5.xyz = r0.xyz;
  r0.xyz = BA_Vertex_83_CB5((uint)(3)).xyz + r1.xyz;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  o3.z = r0.z;
  r0.zw = BA_Vertex_83_CB5((uint)(1)).xy * BA_Vertex_83_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_83_CB5((uint)(0)).xy * BA_Vertex_83_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_83_CB5((uint)(2)).xy * BA_Vertex_83_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_83_CB5((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_83_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_83_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  r0.x = BA_Vertex_83_CB0((uint)(17)).x * r2.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r2.xw;
  o6.xy = r0.xw + r0.zz;
  o6.zw = r2.zw;
  o7.xyzw = r2.xyzw;
  o8.x = v3.x;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Vert(float4 position : POSITION, out float4 clip : SV_POSITION) { clip = TransformObjectToHClip(position.xyz); }
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_100_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_100_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_100_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_100_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_100_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_100_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_100_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_100_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_100_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_100_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  o0.xyz = v1.xyz * r0.xyz + r1.xyz;
  o0.w = BA_Fragment_100_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_101_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_101_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_101_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_101_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_101_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_101_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_101_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_101_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_101_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_101_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r2.xyz = BA_Fragment_101_CB0((uint)(6)).xyz * v2.xxx + v1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_101_CB1((uint)(7)).xyz + BA_Fragment_101_CB1((uint)(6)).yzw;
  r0.w = v2.y * v2.y;
  o0.xyz = r0.www * BA_Fragment_101_CB1((uint)(8)).xyz + r0.xyz;
  o0.w = BA_Fragment_101_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_102_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_102_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_102_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_102_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_102_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_102_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_102_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_102_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_102_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_102_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  o0.xyz = v1.xyz * r0.xyz + r1.xyz;
  o0.w = BA_Fragment_102_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_103_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_103_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_103_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_103_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_103_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_103_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_103_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_103_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_103_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_103_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r2.xyz = BA_Fragment_103_CB0((uint)(6)).xyz * v2.xxx + v1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_103_CB1((uint)(7)).xyz + BA_Fragment_103_CB1((uint)(6)).yzw;
  r0.w = v2.y * v2.y;
  o0.xyz = r0.www * BA_Fragment_103_CB1((uint)(8)).xyz + r0.xyz;
  o0.w = BA_Fragment_103_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_104_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_104_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_104_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_104_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_104_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_104_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_104_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_104_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_104_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_104_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r0.xyz = v1.xyz * r0.xyz + r1.xyz;
  r0.xyz = -BA_Fragment_104_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_104_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_104_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_105_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_105_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_105_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_105_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_105_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_105_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_105_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_105_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_105_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_105_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r2.xyz = BA_Fragment_105_CB0((uint)(6)).xyz * v2.xxx + v1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_105_CB1((uint)(7)).xyz + BA_Fragment_105_CB1((uint)(6)).yzw;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.www * BA_Fragment_105_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_105_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_105_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_105_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_106_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_106_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_106_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_106_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_106_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_106_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_106_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_106_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_106_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_106_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r0.xyz = v1.xyz * r0.xyz + r1.xyz;
  r0.xyz = -BA_Fragment_106_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_106_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_106_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_107_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_107_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_107_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_107_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_107_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_107_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_107_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_107_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_107_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_107_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r2.xyz = BA_Fragment_107_CB0((uint)(6)).xyz * v2.xxx + v1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_107_CB1((uint)(7)).xyz + BA_Fragment_107_CB1((uint)(6)).yzw;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.www * BA_Fragment_107_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_107_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_107_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_107_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_108_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_108_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_108_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_108_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_108_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_108_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_108_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_108_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_108_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_108_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r0.xyz = v1.xyz * r0.xyz + r1.xyz;
  r0.xyz = -BA_Fragment_108_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_108_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_108_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_109_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_109_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_109_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_109_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_109_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_109_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_109_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_109_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_109_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_109_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r2.xyz = BA_Fragment_109_CB0((uint)(6)).xyz * v2.xxx + v1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_109_CB1((uint)(7)).xyz + BA_Fragment_109_CB1((uint)(6)).yzw;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.www * BA_Fragment_109_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_109_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_109_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_109_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_110_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_110_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_110_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_110_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_110_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_110_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_110_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_110_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_110_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_110_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r0.xyz = v1.xyz * r0.xyz + r1.xyz;
  r0.xyz = -BA_Fragment_110_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_110_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_110_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_111_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_111_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_111_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_111_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_111_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_111_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_111_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_111_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_111_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_111_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r2.xyz = BA_Fragment_111_CB0((uint)(6)).xyz * v2.xxx + v1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_111_CB1((uint)(7)).xyz + BA_Fragment_111_CB1((uint)(6)).yzw;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.www * BA_Fragment_111_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_111_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_111_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_111_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_112_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_112_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_112_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_112_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_112_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_112_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_112_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_112_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_112_CB1((uint)(6)).x);
  r0.w = r1.w * r0.w;
  r2.xyz = BA_Fragment_112_CB1((uint)(5)).xyz * r0.www;
  r3.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_112_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.xyz * r2.xyz;
  o0.xyz = r1.xyz * r0.xyz + r2.xyz;
  o0.w = BA_Fragment_112_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_113_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_113_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_113_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_113_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_113_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_113_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_113_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_113_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_113_CB1((uint)(6)).x);
  r0.w = r1.w * r0.w;
  r2.xyz = BA_Fragment_113_CB1((uint)(5)).xyz * r0.www;
  r3.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_113_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.xyz * r2.xyz;
  o0.xyz = r1.xyz * r0.xyz + r2.xyz;
  o0.w = BA_Fragment_113_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_114_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_114_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_114_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_114_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_114_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_114_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_114_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_114_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_114_CB1((uint)(6)).x);
  r0.w = r1.w * r0.w;
  r2.xyz = BA_Fragment_114_CB1((uint)(5)).xyz * r0.www;
  r3.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_114_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_114_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_114_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_114_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_115_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_115_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_115_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_115_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_115_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_115_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_115_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_115_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_115_CB1((uint)(6)).x);
  r0.w = r1.w * r0.w;
  r2.xyz = BA_Fragment_115_CB1((uint)(5)).xyz * r0.www;
  r3.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_115_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_115_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_115_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_115_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_116_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_116_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_116_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_116_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_116_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_116_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_116_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_116_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_116_CB1((uint)(6)).x);
  r0.w = r1.w * r0.w;
  r2.xyz = BA_Fragment_116_CB1((uint)(5)).xyz * r0.www;
  r3.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_116_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_116_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_116_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_116_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_117_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_117_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_117_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_117_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_117_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_117_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_117_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_117_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_117_CB1((uint)(6)).x);
  r0.w = r1.w * r0.w;
  r2.xyz = BA_Fragment_117_CB1((uint)(5)).xyz * r0.www;
  r3.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_117_CB0((uint)(19)).x).xyzw;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_117_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_117_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_117_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_118_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_118_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_118_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_118_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_118_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_118_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_118_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_118_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_118_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_118_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  o0.xyz = v1.xyz * r0.xyz + r1.xyz;
  o0.w = BA_Fragment_118_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_119_CB3(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_119_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_119_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_119_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD7,
  float4 v6 : SV_POSITION0,
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_119_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_119_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_119_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_119_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_119_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyz = BA_Fragment_119_CB0((uint)(6)).xyz * v2.xxx + v1.xyz;
  r1.w = min(BA_Fragment_119_CB3((uint)(11)).y, BA_Fragment_119_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r2.xyz = r1.xyz;
  r2.w = 0;
  while (true) {
    r3.x = cmp((int)r2.w >= (int)r1.w);
    if (r3.x != 0) break;
    r3.x = (uint)r2.w >> 2;
    r3.y = (int)r2.w & 3;
    r3.x = dot(BA_Fragment_119_CB3((uint)(r3.x+12)).xyzw, icb[r3.y+0].xyzw);
    r3.x = (int)r3.x;
    r3.yzw = -v4.xyz * BA_Fragment_119_CB2((uint)(r3.x+0)).www + BA_Fragment_119_CB2((uint)(r3.x+0)).xyz;
    r4.x = dot(r3.yzw, r3.yzw);
    r4.x = max(6.10351563e-005, r4.x);
    r4.y = rsqrt(r4.x);
    r3.yzw = r4.yyy * r3.yzw;
    r4.y = 1 / r4.x;
    r4.x = BA_Fragment_119_CB2((uint)(r3.x+512)).x * r4.x;
    r4.x = -r4.x * r4.x + 1;
    r4.x = max(0, r4.x);
    r4.x = r4.x * r4.x;
    r4.x = r4.y * r4.x;
    r4.y = dot(BA_Fragment_119_CB2((uint)(r3.x+768)).xyz, r3.yzw);
    r4.y = saturate(r4.y * BA_Fragment_119_CB2((uint)(r3.x+512)).z + BA_Fragment_119_CB2((uint)(r3.x+512)).w);
    r4.y = r4.y * r4.y;
    r4.x = r4.x * r4.y;
    r4.xyz = BA_Fragment_119_CB2((uint)(r3.x+256)).xyz * r4.xxx;
    r3.x = saturate(dot(v3.xyz, r3.yzw));
    r2.xyz = r4.xyz * r3.xxx + r2.xyz;
    r2.w = (int)r2.w + 1;
  }
  r1.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_119_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_119_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_119_CB1((uint)(5)).xyz * r0.www;
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_119_CB1((uint)(7)).xyz + BA_Fragment_119_CB1((uint)(6)).yzw;
  o0.xyz = r0.www * BA_Fragment_119_CB1((uint)(8)).xyz + r0.xyz;
  o0.w = BA_Fragment_119_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_120_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_120_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_120_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_120_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_120_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_120_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_120_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_120_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_120_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_120_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  o0.xyz = v1.xyz * r0.xyz + r1.xyz;
  o0.w = BA_Fragment_120_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_121_CB3(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_121_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_121_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_121_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD7,
  float4 v6 : SV_POSITION0,
  uint v7 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v7);
#endif
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_121_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_121_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_121_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_121_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_121_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyz = BA_Fragment_121_CB0((uint)(6)).xyz * v2.xxx + v1.xyz;
  r1.w = min(BA_Fragment_121_CB3((uint)(11)).y, BA_Fragment_121_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r2.xyz = r1.xyz;
  r2.w = 0;
  while (true) {
    r3.x = cmp((int)r2.w >= (int)r1.w);
    if (r3.x != 0) break;
    r3.x = (uint)r2.w >> 2;
    r3.y = (int)r2.w & 3;
    r3.x = dot(BA_Fragment_121_CB3((uint)(r3.x+12)).xyzw, icb[r3.y+0].xyzw);
    r3.x = (int)r3.x;
    r3.yzw = -v4.xyz * BA_Fragment_121_CB2((uint)(r3.x+0)).www + BA_Fragment_121_CB2((uint)(r3.x+0)).xyz;
    r4.x = dot(r3.yzw, r3.yzw);
    r4.x = max(6.10351563e-005, r4.x);
    r4.y = rsqrt(r4.x);
    r3.yzw = r4.yyy * r3.yzw;
    r4.y = 1 / r4.x;
    r4.x = BA_Fragment_121_CB2((uint)(r3.x+512)).x * r4.x;
    r4.x = -r4.x * r4.x + 1;
    r4.x = max(0, r4.x);
    r4.x = r4.x * r4.x;
    r4.x = r4.y * r4.x;
    r4.y = dot(BA_Fragment_121_CB2((uint)(r3.x+768)).xyz, r3.yzw);
    r4.y = saturate(r4.y * BA_Fragment_121_CB2((uint)(r3.x+512)).z + BA_Fragment_121_CB2((uint)(r3.x+512)).w);
    r4.y = r4.y * r4.y;
    r4.x = r4.x * r4.y;
    r4.xyz = BA_Fragment_121_CB2((uint)(r3.x+256)).xyz * r4.xxx;
    r3.x = saturate(dot(v3.xyz, r3.yzw));
    r2.xyz = r4.xyz * r3.xxx + r2.xyz;
    r2.w = (int)r2.w + 1;
  }
  r1.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_121_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_121_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_121_CB1((uint)(5)).xyz * r0.www;
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_121_CB1((uint)(7)).xyz + BA_Fragment_121_CB1((uint)(6)).yzw;
  o0.xyz = r0.www * BA_Fragment_121_CB1((uint)(8)).xyz + r0.xyz;
  o0.w = BA_Fragment_121_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_122_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_122_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_122_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_122_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_122_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_122_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_122_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_122_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_122_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_122_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r0.xyz = v1.xyz * r0.xyz + r1.xyz;
  r0.xyz = -BA_Fragment_122_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_122_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_122_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_123_CB3(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_123_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_123_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_123_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD7,
  float4 v6 : SV_POSITION0,
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_123_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_123_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_123_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_123_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_123_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyz = BA_Fragment_123_CB0((uint)(6)).xyz * v2.xxx + v1.xyz;
  r1.w = min(BA_Fragment_123_CB3((uint)(11)).y, BA_Fragment_123_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r2.xyz = r1.xyz;
  r2.w = 0;
  while (true) {
    r3.x = cmp((int)r2.w >= (int)r1.w);
    if (r3.x != 0) break;
    r3.x = (uint)r2.w >> 2;
    r3.y = (int)r2.w & 3;
    r3.x = dot(BA_Fragment_123_CB3((uint)(r3.x+12)).xyzw, icb[r3.y+0].xyzw);
    r3.x = (int)r3.x;
    r3.yzw = -v4.xyz * BA_Fragment_123_CB2((uint)(r3.x+0)).www + BA_Fragment_123_CB2((uint)(r3.x+0)).xyz;
    r4.x = dot(r3.yzw, r3.yzw);
    r4.x = max(6.10351563e-005, r4.x);
    r4.y = rsqrt(r4.x);
    r3.yzw = r4.yyy * r3.yzw;
    r4.y = 1 / r4.x;
    r4.x = BA_Fragment_123_CB2((uint)(r3.x+512)).x * r4.x;
    r4.x = -r4.x * r4.x + 1;
    r4.x = max(0, r4.x);
    r4.x = r4.x * r4.x;
    r4.x = r4.y * r4.x;
    r4.y = dot(BA_Fragment_123_CB2((uint)(r3.x+768)).xyz, r3.yzw);
    r4.y = saturate(r4.y * BA_Fragment_123_CB2((uint)(r3.x+512)).z + BA_Fragment_123_CB2((uint)(r3.x+512)).w);
    r4.y = r4.y * r4.y;
    r4.x = r4.x * r4.y;
    r4.xyz = BA_Fragment_123_CB2((uint)(r3.x+256)).xyz * r4.xxx;
    r3.x = saturate(dot(v3.xyz, r3.yzw));
    r2.xyz = r4.xyz * r3.xxx + r2.xyz;
    r2.w = (int)r2.w + 1;
  }
  r1.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_123_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_123_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_123_CB1((uint)(5)).xyz * r0.www;
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_123_CB1((uint)(7)).xyz + BA_Fragment_123_CB1((uint)(6)).yzw;
  r0.xyz = r0.www * BA_Fragment_123_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_123_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_123_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_123_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_124_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_124_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_124_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_124_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_124_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_124_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_124_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_124_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_124_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_124_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r0.xyz = v1.xyz * r0.xyz + r1.xyz;
  r0.xyz = -BA_Fragment_124_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_124_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_124_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_125_CB3(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_125_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_125_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_125_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD7,
  float4 v6 : SV_POSITION0,
  uint v7 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v7);
#endif
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_125_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_125_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_125_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_125_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_125_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyz = BA_Fragment_125_CB0((uint)(6)).xyz * v2.xxx + v1.xyz;
  r1.w = min(BA_Fragment_125_CB3((uint)(11)).y, BA_Fragment_125_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r2.xyz = r1.xyz;
  r2.w = 0;
  while (true) {
    r3.x = cmp((int)r2.w >= (int)r1.w);
    if (r3.x != 0) break;
    r3.x = (uint)r2.w >> 2;
    r3.y = (int)r2.w & 3;
    r3.x = dot(BA_Fragment_125_CB3((uint)(r3.x+12)).xyzw, icb[r3.y+0].xyzw);
    r3.x = (int)r3.x;
    r3.yzw = -v4.xyz * BA_Fragment_125_CB2((uint)(r3.x+0)).www + BA_Fragment_125_CB2((uint)(r3.x+0)).xyz;
    r4.x = dot(r3.yzw, r3.yzw);
    r4.x = max(6.10351563e-005, r4.x);
    r4.y = rsqrt(r4.x);
    r3.yzw = r4.yyy * r3.yzw;
    r4.y = 1 / r4.x;
    r4.x = BA_Fragment_125_CB2((uint)(r3.x+512)).x * r4.x;
    r4.x = -r4.x * r4.x + 1;
    r4.x = max(0, r4.x);
    r4.x = r4.x * r4.x;
    r4.x = r4.y * r4.x;
    r4.y = dot(BA_Fragment_125_CB2((uint)(r3.x+768)).xyz, r3.yzw);
    r4.y = saturate(r4.y * BA_Fragment_125_CB2((uint)(r3.x+512)).z + BA_Fragment_125_CB2((uint)(r3.x+512)).w);
    r4.y = r4.y * r4.y;
    r4.x = r4.x * r4.y;
    r4.xyz = BA_Fragment_125_CB2((uint)(r3.x+256)).xyz * r4.xxx;
    r3.x = saturate(dot(v3.xyz, r3.yzw));
    r2.xyz = r4.xyz * r3.xxx + r2.xyz;
    r2.w = (int)r2.w + 1;
  }
  r1.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_125_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_125_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_125_CB1((uint)(5)).xyz * r0.www;
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_125_CB1((uint)(7)).xyz + BA_Fragment_125_CB1((uint)(6)).yzw;
  r0.xyz = r0.www * BA_Fragment_125_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_125_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_125_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_125_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_126_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_126_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_126_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_126_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_126_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_126_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_126_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_126_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_126_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_126_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r0.xyz = v1.xyz * r0.xyz + r1.xyz;
  r0.xyz = -BA_Fragment_126_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_126_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_126_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_127_CB3(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_127_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_127_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_127_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD7,
  float4 v6 : SV_POSITION0,
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_127_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_127_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_127_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_127_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_127_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyz = BA_Fragment_127_CB0((uint)(6)).xyz * v2.xxx + v1.xyz;
  r1.w = min(BA_Fragment_127_CB3((uint)(11)).y, BA_Fragment_127_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r2.xyz = r1.xyz;
  r2.w = 0;
  while (true) {
    r3.x = cmp((int)r2.w >= (int)r1.w);
    if (r3.x != 0) break;
    r3.x = (uint)r2.w >> 2;
    r3.y = (int)r2.w & 3;
    r3.x = dot(BA_Fragment_127_CB3((uint)(r3.x+12)).xyzw, icb[r3.y+0].xyzw);
    r3.x = (int)r3.x;
    r3.yzw = -v4.xyz * BA_Fragment_127_CB2((uint)(r3.x+0)).www + BA_Fragment_127_CB2((uint)(r3.x+0)).xyz;
    r4.x = dot(r3.yzw, r3.yzw);
    r4.x = max(6.10351563e-005, r4.x);
    r4.y = rsqrt(r4.x);
    r3.yzw = r4.yyy * r3.yzw;
    r4.y = 1 / r4.x;
    r4.x = BA_Fragment_127_CB2((uint)(r3.x+512)).x * r4.x;
    r4.x = -r4.x * r4.x + 1;
    r4.x = max(0, r4.x);
    r4.x = r4.x * r4.x;
    r4.x = r4.y * r4.x;
    r4.y = dot(BA_Fragment_127_CB2((uint)(r3.x+768)).xyz, r3.yzw);
    r4.y = saturate(r4.y * BA_Fragment_127_CB2((uint)(r3.x+512)).z + BA_Fragment_127_CB2((uint)(r3.x+512)).w);
    r4.y = r4.y * r4.y;
    r4.x = r4.x * r4.y;
    r4.xyz = BA_Fragment_127_CB2((uint)(r3.x+256)).xyz * r4.xxx;
    r3.x = saturate(dot(v3.xyz, r3.yzw));
    r2.xyz = r4.xyz * r3.xxx + r2.xyz;
    r2.w = (int)r2.w + 1;
  }
  r1.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_127_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_127_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_127_CB1((uint)(5)).xyz * r0.www;
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_127_CB1((uint)(7)).xyz + BA_Fragment_127_CB1((uint)(6)).yzw;
  r0.xyz = r0.www * BA_Fragment_127_CB1((uint)(8)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_127_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_127_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_127_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_128_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_128_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD7,
  float4 v4 : SV_POSITION0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_128_CB0((uint)(19)).x).xyzw;
  r1.x = 1 + -r0.w;
  r1.xyz = r0.www * BA_Fragment_128_CB1((uint)(2)).xyz + r1.xxx;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_128_CB0((uint)(19)).x).xyzw;
  r2.xyz = BA_Fragment_128_CB1((uint)(1)).xyz * r2.xyz;
  r0.w = v2.z * r2.w;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = 1 + -BA_Fragment_128_CB1((uint)(4)).x;
  r0.xyz = saturate(r1.www + r0.xyz);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = v1.x + v1.y;
  r1.x = v1.z + r1.x;
  r1.x = saturate(r1.x * 0.333000004 + -BA_Fragment_128_CB1((uint)(6)).x);
  r0.w = r1.x * r0.w;
  r1.xyz = BA_Fragment_128_CB1((uint)(5)).xyz * r0.www;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_128_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.xyz;
  r0.xyz = v1.xyz * r0.xyz + r1.xyz;
  r0.xyz = -BA_Fragment_128_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_128_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_128_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && !defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_129_CB3(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_129_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_129_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_129_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD7,
  float4 v6 : SV_POSITION0,
  uint v7 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v7);
#endif
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_129_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_129_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_129_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_129_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_129_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyz = BA_Fragment_129_CB0((uint)(6)).xyz * v2.xxx + v1.xyz;
  r1.w = min(BA_Fragment_129_CB3((uint)(11)).y, BA_Fragment_129_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r2.xyz = r1.xyz;
  r2.w = 0;
  while (true) {
    r3.x = cmp((int)r2.w >= (int)r1.w);
    if (r3.x != 0) break;
    r3.x = (uint)r2.w >> 2;
    r3.y = (int)r2.w & 3;
    r3.x = dot(BA_Fragment_129_CB3((uint)(r3.x+12)).xyzw, icb[r3.y+0].xyzw);
    r3.x = (int)r3.x;
    r3.yzw = -v4.xyz * BA_Fragment_129_CB2((uint)(r3.x+0)).www + BA_Fragment_129_CB2((uint)(r3.x+0)).xyz;
    r4.x = dot(r3.yzw, r3.yzw);
    r4.x = max(6.10351563e-005, r4.x);
    r4.y = rsqrt(r4.x);
    r3.yzw = r4.yyy * r3.yzw;
    r4.y = 1 / r4.x;
    r4.x = BA_Fragment_129_CB2((uint)(r3.x+512)).x * r4.x;
    r4.x = -r4.x * r4.x + 1;
    r4.x = max(0, r4.x);
    r4.x = r4.x * r4.x;
    r4.x = r4.y * r4.x;
    r4.y = dot(BA_Fragment_129_CB2((uint)(r3.x+768)).xyz, r3.yzw);
    r4.y = saturate(r4.y * BA_Fragment_129_CB2((uint)(r3.x+512)).z + BA_Fragment_129_CB2((uint)(r3.x+512)).w);
    r4.y = r4.y * r4.y;
    r4.x = r4.x * r4.y;
    r4.xyz = BA_Fragment_129_CB2((uint)(r3.x+256)).xyz * r4.xxx;
    r3.x = saturate(dot(v3.xyz, r3.yzw));
    r2.xyz = r4.xyz * r3.xxx + r2.xyz;
    r2.w = (int)r2.w + 1;
  }
  r1.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_129_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_129_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_129_CB1((uint)(5)).xyz * r0.www;
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_129_CB1((uint)(7)).xyz + BA_Fragment_129_CB1((uint)(6)).yzw;
  r0.xyz = r0.www * BA_Fragment_129_CB1((uint)(8)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_129_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_129_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_129_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_130_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_130_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_130_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_130_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_130_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_130_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_130_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_130_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_130_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_130_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_130_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_130_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_130_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_130_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_130_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_130_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_130_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_130_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_130_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_130_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.yzw = -BA_Fragment_130_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r1.xxx * r1.yzw + BA_Fragment_130_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_130_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_130_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_130_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  o0.xyz = r1.xyz * r0.xyz + r2.xyz;
  o0.w = BA_Fragment_130_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_131_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_131_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_131_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_131_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_131_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_131_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_131_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_131_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_131_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_131_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_131_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_131_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_131_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_131_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_131_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_131_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_131_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_131_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_131_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_131_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.xyz = BA_Fragment_131_CB0((uint)(6)).xyz * r1.xxx;
  r1.xyz = r1.xyz * v2.xxx + v1.xyz;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_131_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_131_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_131_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_131_CB1((uint)(7)).xyz + BA_Fragment_131_CB1((uint)(6)).yzw;
  o0.xyz = r0.www * BA_Fragment_131_CB1((uint)(8)).xyz + r0.xyz;
  o0.w = BA_Fragment_131_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_132_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_132_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_132_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_132_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_132_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_132_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_132_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_132_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_132_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_132_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_132_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_132_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_132_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_132_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_132_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_132_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_132_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_132_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_132_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_132_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.yzw = -BA_Fragment_132_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r1.xxx * r1.yzw + BA_Fragment_132_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_132_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_132_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_132_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  o0.xyz = r1.xyz * r0.xyz + r2.xyz;
  o0.w = BA_Fragment_132_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_133_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_133_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_133_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_133_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_133_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_133_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_133_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_133_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_133_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_133_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_133_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_133_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_133_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_133_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_133_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_133_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_133_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_133_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_133_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_133_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.xyz = BA_Fragment_133_CB0((uint)(6)).xyz * r1.xxx;
  r1.xyz = r1.xyz * v2.xxx + v1.xyz;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_133_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_133_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_133_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_133_CB1((uint)(7)).xyz + BA_Fragment_133_CB1((uint)(6)).yzw;
  o0.xyz = r0.www * BA_Fragment_133_CB1((uint)(8)).xyz + r0.xyz;
  o0.w = BA_Fragment_133_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_134_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_134_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_134_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_134_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_134_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_134_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_134_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_134_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_134_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_134_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_134_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_134_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_134_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_134_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_134_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_134_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_134_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_134_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_134_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_134_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.yzw = -BA_Fragment_134_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r1.xxx * r1.yzw + BA_Fragment_134_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_134_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_134_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_134_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_134_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_134_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_134_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_135_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_135_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_135_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_135_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_135_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_135_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_135_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_135_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_135_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_135_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_135_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_135_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_135_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_135_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_135_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_135_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_135_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_135_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_135_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_135_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.xyz = BA_Fragment_135_CB0((uint)(6)).xyz * r1.xxx;
  r1.xyz = r1.xyz * v2.xxx + v1.xyz;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_135_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_135_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_135_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_135_CB1((uint)(7)).xyz + BA_Fragment_135_CB1((uint)(6)).yzw;
  r0.xyz = r0.www * BA_Fragment_135_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_135_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_135_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_135_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_136_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_136_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_136_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_136_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_136_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_136_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_136_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_136_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_136_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_136_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_136_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_136_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_136_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_136_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_136_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_136_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_136_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_136_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_136_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_136_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.yzw = -BA_Fragment_136_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r1.xxx * r1.yzw + BA_Fragment_136_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_136_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_136_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_136_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_136_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_136_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_136_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_137_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_137_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_137_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_137_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_137_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_137_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_137_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_137_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_137_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_137_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_137_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_137_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_137_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_137_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_137_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_137_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_137_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_137_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_137_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_137_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.xyz = BA_Fragment_137_CB0((uint)(6)).xyz * r1.xxx;
  r1.xyz = r1.xyz * v2.xxx + v1.xyz;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_137_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_137_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_137_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_137_CB1((uint)(7)).xyz + BA_Fragment_137_CB1((uint)(6)).yzw;
  r0.xyz = r0.www * BA_Fragment_137_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_137_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_137_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_137_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_138_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_138_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_138_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_138_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_138_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_138_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_138_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_138_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_138_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_138_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_138_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_138_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_138_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_138_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_138_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_138_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_138_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_138_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_138_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_138_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.yzw = -BA_Fragment_138_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r1.xxx * r1.yzw + BA_Fragment_138_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_138_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_138_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_138_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_138_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_138_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_138_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_139_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_139_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_139_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_139_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_139_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_139_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_139_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_139_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_139_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_139_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_139_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_139_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_139_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_139_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_139_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_139_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_139_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_139_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_139_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_139_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.xyz = BA_Fragment_139_CB0((uint)(6)).xyz * r1.xxx;
  r1.xyz = r1.xyz * v2.xxx + v1.xyz;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_139_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_139_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_139_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_139_CB1((uint)(7)).xyz + BA_Fragment_139_CB1((uint)(6)).yzw;
  r0.xyz = r0.www * BA_Fragment_139_CB1((uint)(8)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_139_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_139_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_139_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_140_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_140_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_140_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_140_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_140_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_140_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_140_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_140_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_140_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_140_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_140_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_140_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_140_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_140_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_140_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_140_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_140_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_140_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_140_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_140_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.yzw = -BA_Fragment_140_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r1.xxx * r1.yzw + BA_Fragment_140_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_140_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_140_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_140_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_140_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_140_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_140_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_141_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_141_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_141_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_141_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_141_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_141_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_141_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_141_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_141_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_141_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_141_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_141_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_141_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_141_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_141_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_141_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_141_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_141_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_141_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_141_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.xyz = BA_Fragment_141_CB0((uint)(6)).xyz * r1.xxx;
  r1.xyz = r1.xyz * v2.xxx + v1.xyz;
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_141_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_141_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_141_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_141_CB1((uint)(7)).xyz + BA_Fragment_141_CB1((uint)(6)).yzw;
  r0.xyz = r0.www * BA_Fragment_141_CB1((uint)(8)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_141_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_141_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_141_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_142_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_142_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_142_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_142_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_142_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_142_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_142_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_142_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_142_CB0((uint)(19)).x).xyzw;
  r1.w = cmp(BA_Fragment_142_CB2((uint)(29)).y != 0.000000);
  if (r1.w != 0) {
    r2.xy = v3.xy * BA_Fragment_142_CB2((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r2.zw = v3.xy * BA_Fragment_142_CB2((uint)(30)).zw + -r2.xy;
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
    r4.xyz = BA_Fragment_142_CB2((uint)(30)).xxx * r4.yxz;
    r5.xyz = BA_Fragment_142_CB2((uint)(30)).yyy * r5.xyz;
    r4.w = r5.x;
    r6.xyzw = r2.xyxy * BA_Fragment_142_CB2((uint)(30)).xyxy + r4.ywxw;
    r2.zw = r2.xy * BA_Fragment_142_CB2((uint)(30)).xy + r4.zw;
    r5.w = r4.y;
    r4.yw = r5.yz;
    r7.xyzw = r2.xyxy * BA_Fragment_142_CB2((uint)(30)).xyxy + r4.xyzy;
    r5.xyzw = r2.xyxy * BA_Fragment_142_CB2((uint)(30)).xyxy + r5.wywz;
    r4.xyzw = r2.xyxy * BA_Fragment_142_CB2((uint)(30)).xyxy + r4.xwzw;
    r9.xyzw = r8.zwyz * r3.xxxy;
    r10.xyzw = r8.xyzw * r3.yyzz;
    r1.w = r8.y * r3.z;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r2.y = r9.y * r2.y;
    r2.x = r9.x * r2.x + r2.y;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r2.zw, v3.z).x;
    r2.x = r9.z * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = r9.w * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v3.z).x;
    r2.x = r10.x * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v3.z).x;
    r2.x = r10.y * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r10.z * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r2.x = r10.w * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.w = r1.w * r2.y + r2.x;
  } else {
    r1.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r2.x = 1 + -BA_Fragment_142_CB2((uint)(29)).x;
  r1.w = r1.w * BA_Fragment_142_CB2((uint)(29)).x + r2.x;
  r2.x = cmp(0 >= v3.z);
  r2.y = cmp(v3.z >= 1);
  r2.x = (int)r2.y | (int)r2.x;
  r1.w = r2.x ? 1 : r1.w;
  r2.xyz = -BA_Fragment_142_CB0((uint)(2)).xyz + r1.xyz;
  r2.xyz = r1.www * r2.xyz + BA_Fragment_142_CB0((uint)(2)).xyz;
  r1.xyz = min(r2.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_142_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_142_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_142_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  o0.xyz = r1.xyz * r0.xyz + r2.xyz;
  o0.w = BA_Fragment_142_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_143_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_143_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_143_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_143_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_143_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_143_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_143_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_143_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_143_CB0((uint)(19)).x).xyzw;
  r1.w = cmp(BA_Fragment_143_CB2((uint)(29)).y != 0.000000);
  if (r1.w != 0) {
    r2.xy = v3.xy * BA_Fragment_143_CB2((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r2.zw = v3.xy * BA_Fragment_143_CB2((uint)(30)).zw + -r2.xy;
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
    r4.xyz = BA_Fragment_143_CB2((uint)(30)).xxx * r4.yxz;
    r5.xyz = BA_Fragment_143_CB2((uint)(30)).yyy * r5.xyz;
    r4.w = r5.x;
    r6.xyzw = r2.xyxy * BA_Fragment_143_CB2((uint)(30)).xyxy + r4.ywxw;
    r2.zw = r2.xy * BA_Fragment_143_CB2((uint)(30)).xy + r4.zw;
    r5.w = r4.y;
    r4.yw = r5.yz;
    r7.xyzw = r2.xyxy * BA_Fragment_143_CB2((uint)(30)).xyxy + r4.xyzy;
    r5.xyzw = r2.xyxy * BA_Fragment_143_CB2((uint)(30)).xyxy + r5.wywz;
    r4.xyzw = r2.xyxy * BA_Fragment_143_CB2((uint)(30)).xyxy + r4.xwzw;
    r9.xyzw = r8.zwyz * r3.xxxy;
    r10.xyzw = r8.xyzw * r3.yyzz;
    r1.w = r8.y * r3.z;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r2.y = r9.y * r2.y;
    r2.x = r9.x * r2.x + r2.y;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r2.zw, v3.z).x;
    r2.x = r9.z * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = r9.w * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v3.z).x;
    r2.x = r10.x * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v3.z).x;
    r2.x = r10.y * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r10.z * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r2.x = r10.w * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.w = r1.w * r2.y + r2.x;
  } else {
    r1.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r2.x = 1 + -BA_Fragment_143_CB2((uint)(29)).x;
  r1.w = r1.w * BA_Fragment_143_CB2((uint)(29)).x + r2.x;
  r2.x = cmp(0 >= v3.z);
  r2.y = cmp(v3.z >= 1);
  r2.x = (int)r2.y | (int)r2.x;
  r1.w = r2.x ? 1 : r1.w;
  r2.xyz = -BA_Fragment_143_CB0((uint)(2)).xyz + r1.xyz;
  r2.xyz = r1.www * r2.xyz + BA_Fragment_143_CB0((uint)(2)).xyz;
  r1.xyz = min(r2.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_143_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_143_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_143_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  o0.xyz = r1.xyz * r0.xyz + r2.xyz;
  o0.w = BA_Fragment_143_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_144_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_144_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_144_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_144_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_144_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_144_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_144_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_144_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_144_CB0((uint)(19)).x).xyzw;
  r1.w = cmp(BA_Fragment_144_CB2((uint)(29)).y != 0.000000);
  if (r1.w != 0) {
    r2.xy = v3.xy * BA_Fragment_144_CB2((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r2.zw = v3.xy * BA_Fragment_144_CB2((uint)(30)).zw + -r2.xy;
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
    r4.xyz = BA_Fragment_144_CB2((uint)(30)).xxx * r4.yxz;
    r5.xyz = BA_Fragment_144_CB2((uint)(30)).yyy * r5.xyz;
    r4.w = r5.x;
    r6.xyzw = r2.xyxy * BA_Fragment_144_CB2((uint)(30)).xyxy + r4.ywxw;
    r2.zw = r2.xy * BA_Fragment_144_CB2((uint)(30)).xy + r4.zw;
    r5.w = r4.y;
    r4.yw = r5.yz;
    r7.xyzw = r2.xyxy * BA_Fragment_144_CB2((uint)(30)).xyxy + r4.xyzy;
    r5.xyzw = r2.xyxy * BA_Fragment_144_CB2((uint)(30)).xyxy + r5.wywz;
    r4.xyzw = r2.xyxy * BA_Fragment_144_CB2((uint)(30)).xyxy + r4.xwzw;
    r9.xyzw = r8.zwyz * r3.xxxy;
    r10.xyzw = r8.xyzw * r3.yyzz;
    r1.w = r8.y * r3.z;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r2.y = r9.y * r2.y;
    r2.x = r9.x * r2.x + r2.y;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r2.zw, v3.z).x;
    r2.x = r9.z * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = r9.w * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v3.z).x;
    r2.x = r10.x * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v3.z).x;
    r2.x = r10.y * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r10.z * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r2.x = r10.w * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.w = r1.w * r2.y + r2.x;
  } else {
    r1.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r2.x = 1 + -BA_Fragment_144_CB2((uint)(29)).x;
  r1.w = r1.w * BA_Fragment_144_CB2((uint)(29)).x + r2.x;
  r2.x = cmp(0 >= v3.z);
  r2.y = cmp(v3.z >= 1);
  r2.x = (int)r2.y | (int)r2.x;
  r1.w = r2.x ? 1 : r1.w;
  r2.xyz = -BA_Fragment_144_CB0((uint)(2)).xyz + r1.xyz;
  r2.xyz = r1.www * r2.xyz + BA_Fragment_144_CB0((uint)(2)).xyz;
  r1.xyz = min(r2.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_144_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_144_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_144_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_144_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_144_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_144_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_145_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_145_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_145_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_145_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_145_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_145_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_145_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_145_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_145_CB0((uint)(19)).x).xyzw;
  r1.w = cmp(BA_Fragment_145_CB2((uint)(29)).y != 0.000000);
  if (r1.w != 0) {
    r2.xy = v3.xy * BA_Fragment_145_CB2((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r2.zw = v3.xy * BA_Fragment_145_CB2((uint)(30)).zw + -r2.xy;
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
    r4.xyz = BA_Fragment_145_CB2((uint)(30)).xxx * r4.yxz;
    r5.xyz = BA_Fragment_145_CB2((uint)(30)).yyy * r5.xyz;
    r4.w = r5.x;
    r6.xyzw = r2.xyxy * BA_Fragment_145_CB2((uint)(30)).xyxy + r4.ywxw;
    r2.zw = r2.xy * BA_Fragment_145_CB2((uint)(30)).xy + r4.zw;
    r5.w = r4.y;
    r4.yw = r5.yz;
    r7.xyzw = r2.xyxy * BA_Fragment_145_CB2((uint)(30)).xyxy + r4.xyzy;
    r5.xyzw = r2.xyxy * BA_Fragment_145_CB2((uint)(30)).xyxy + r5.wywz;
    r4.xyzw = r2.xyxy * BA_Fragment_145_CB2((uint)(30)).xyxy + r4.xwzw;
    r9.xyzw = r8.zwyz * r3.xxxy;
    r10.xyzw = r8.xyzw * r3.yyzz;
    r1.w = r8.y * r3.z;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r2.y = r9.y * r2.y;
    r2.x = r9.x * r2.x + r2.y;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r2.zw, v3.z).x;
    r2.x = r9.z * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = r9.w * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v3.z).x;
    r2.x = r10.x * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v3.z).x;
    r2.x = r10.y * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r10.z * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r2.x = r10.w * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.w = r1.w * r2.y + r2.x;
  } else {
    r1.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r2.x = 1 + -BA_Fragment_145_CB2((uint)(29)).x;
  r1.w = r1.w * BA_Fragment_145_CB2((uint)(29)).x + r2.x;
  r2.x = cmp(0 >= v3.z);
  r2.y = cmp(v3.z >= 1);
  r2.x = (int)r2.y | (int)r2.x;
  r1.w = r2.x ? 1 : r1.w;
  r2.xyz = -BA_Fragment_145_CB0((uint)(2)).xyz + r1.xyz;
  r2.xyz = r1.www * r2.xyz + BA_Fragment_145_CB0((uint)(2)).xyz;
  r1.xyz = min(r2.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_145_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_145_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_145_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_145_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.zzz * r0.xyz + BA_Fragment_145_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_145_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_146_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_146_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_146_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_146_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_146_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_146_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_146_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_146_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_146_CB0((uint)(19)).x).xyzw;
  r1.w = cmp(BA_Fragment_146_CB2((uint)(29)).y != 0.000000);
  if (r1.w != 0) {
    r2.xy = v3.xy * BA_Fragment_146_CB2((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r2.zw = v3.xy * BA_Fragment_146_CB2((uint)(30)).zw + -r2.xy;
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
    r4.xyz = BA_Fragment_146_CB2((uint)(30)).xxx * r4.yxz;
    r5.xyz = BA_Fragment_146_CB2((uint)(30)).yyy * r5.xyz;
    r4.w = r5.x;
    r6.xyzw = r2.xyxy * BA_Fragment_146_CB2((uint)(30)).xyxy + r4.ywxw;
    r2.zw = r2.xy * BA_Fragment_146_CB2((uint)(30)).xy + r4.zw;
    r5.w = r4.y;
    r4.yw = r5.yz;
    r7.xyzw = r2.xyxy * BA_Fragment_146_CB2((uint)(30)).xyxy + r4.xyzy;
    r5.xyzw = r2.xyxy * BA_Fragment_146_CB2((uint)(30)).xyxy + r5.wywz;
    r4.xyzw = r2.xyxy * BA_Fragment_146_CB2((uint)(30)).xyxy + r4.xwzw;
    r9.xyzw = r8.zwyz * r3.xxxy;
    r10.xyzw = r8.xyzw * r3.yyzz;
    r1.w = r8.y * r3.z;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r2.y = r9.y * r2.y;
    r2.x = r9.x * r2.x + r2.y;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r2.zw, v3.z).x;
    r2.x = r9.z * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = r9.w * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v3.z).x;
    r2.x = r10.x * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v3.z).x;
    r2.x = r10.y * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r10.z * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r2.x = r10.w * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.w = r1.w * r2.y + r2.x;
  } else {
    r1.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r2.x = 1 + -BA_Fragment_146_CB2((uint)(29)).x;
  r1.w = r1.w * BA_Fragment_146_CB2((uint)(29)).x + r2.x;
  r2.x = cmp(0 >= v3.z);
  r2.y = cmp(v3.z >= 1);
  r2.x = (int)r2.y | (int)r2.x;
  r1.w = r2.x ? 1 : r1.w;
  r2.xyz = -BA_Fragment_146_CB0((uint)(2)).xyz + r1.xyz;
  r2.xyz = r1.www * r2.xyz + BA_Fragment_146_CB0((uint)(2)).xyz;
  r1.xyz = min(r2.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_146_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_146_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_146_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_146_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_146_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_146_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && defined(LIGHTMAP_ON) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_147_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_147_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_147_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_147_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_147_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_147_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_147_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_147_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.xyzw = unity_Lightmap.SampleBias(samplerunity_Lightmap, v1.xy, BA_Fragment_147_CB0((uint)(19)).x).xyzw;
  r1.w = cmp(BA_Fragment_147_CB2((uint)(29)).y != 0.000000);
  if (r1.w != 0) {
    r2.xy = v3.xy * BA_Fragment_147_CB2((uint)(30)).zw + float2(0.5,0.5);
    r2.xy = floor(r2.xy);
    r2.zw = v3.xy * BA_Fragment_147_CB2((uint)(30)).zw + -r2.xy;
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
    r4.xyz = BA_Fragment_147_CB2((uint)(30)).xxx * r4.yxz;
    r5.xyz = BA_Fragment_147_CB2((uint)(30)).yyy * r5.xyz;
    r4.w = r5.x;
    r6.xyzw = r2.xyxy * BA_Fragment_147_CB2((uint)(30)).xyxy + r4.ywxw;
    r2.zw = r2.xy * BA_Fragment_147_CB2((uint)(30)).xy + r4.zw;
    r5.w = r4.y;
    r4.yw = r5.yz;
    r7.xyzw = r2.xyxy * BA_Fragment_147_CB2((uint)(30)).xyxy + r4.xyzy;
    r5.xyzw = r2.xyxy * BA_Fragment_147_CB2((uint)(30)).xyxy + r5.wywz;
    r4.xyzw = r2.xyxy * BA_Fragment_147_CB2((uint)(30)).xyxy + r4.xwzw;
    r9.xyzw = r8.zwyz * r3.xxxy;
    r10.xyzw = r8.xyzw * r3.yyzz;
    r1.w = r8.y * r3.z;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r2.y = r9.y * r2.y;
    r2.x = r9.x * r2.x + r2.y;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r2.zw, v3.z).x;
    r2.x = r9.z * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = r9.w * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.xy, v3.z).x;
    r2.x = r10.x * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r7.zw, v3.z).x;
    r2.x = r10.y * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r10.z * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r2.x = r10.w * r2.y + r2.x;
    r2.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.w = r1.w * r2.y + r2.x;
  } else {
    r1.w = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r2.x = 1 + -BA_Fragment_147_CB2((uint)(29)).x;
  r1.w = r1.w * BA_Fragment_147_CB2((uint)(29)).x + r2.x;
  r2.x = cmp(0 >= v3.z);
  r2.y = cmp(v3.z >= 1);
  r2.x = (int)r2.y | (int)r2.x;
  r1.w = r2.x ? 1 : r1.w;
  r2.xyz = -BA_Fragment_147_CB0((uint)(2)).xyz + r1.xyz;
  r2.xyz = r1.www * r2.xyz + BA_Fragment_147_CB0((uint)(2)).xyz;
  r1.xyz = min(r2.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_147_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_147_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_147_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.w = exp2(-v1.z);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_147_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_147_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_147_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_148_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_148_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_148_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_148_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_148_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_148_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_148_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_148_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_148_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_148_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_148_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_148_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_148_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_148_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_148_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_148_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_148_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_148_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_148_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_148_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.yzw = -BA_Fragment_148_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r1.xxx * r1.yzw + BA_Fragment_148_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_148_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_148_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_148_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  o0.xyz = r1.xyz * r0.xyz + r2.xyz;
  o0.w = BA_Fragment_148_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_149_CB4(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_149_CB3(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_149_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_149_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_149_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD4,
  float4 v5 : TEXCOORD5,
  float4 v6 : TEXCOORD7,
  float4 v7 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_149_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_149_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_149_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_149_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_149_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_149_CB4((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_149_CB4((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_149_CB4((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_149_CB4((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_149_CB4((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_149_CB4((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_149_CB4((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_149_CB4((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_149_CB4((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_149_CB4((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_149_CB4((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_149_CB4((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.xyz = BA_Fragment_149_CB0((uint)(6)).xyz * r1.xxx;
  r1.xyz = r1.xyz * v2.xxx + v1.xyz;
  r1.w = min(BA_Fragment_149_CB3((uint)(11)).y, BA_Fragment_149_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r2.xyz = r1.xyz;
  r2.w = 0;
  while (true) {
    r3.x = cmp((int)r2.w >= (int)r1.w);
    if (r3.x != 0) break;
    r3.x = (uint)r2.w >> 2;
    r3.y = (int)r2.w & 3;
    r3.x = dot(BA_Fragment_149_CB3((uint)(r3.x+12)).xyzw, icb[r3.y+0].xyzw);
    r3.x = (int)r3.x;
    r3.yzw = -v5.xyz * BA_Fragment_149_CB2((uint)(r3.x+0)).www + BA_Fragment_149_CB2((uint)(r3.x+0)).xyz;
    r4.x = dot(r3.yzw, r3.yzw);
    r4.x = max(6.10351563e-005, r4.x);
    r4.y = rsqrt(r4.x);
    r3.yzw = r4.yyy * r3.yzw;
    r4.y = 1 / r4.x;
    r4.x = BA_Fragment_149_CB2((uint)(r3.x+512)).x * r4.x;
    r4.x = -r4.x * r4.x + 1;
    r4.x = max(0, r4.x);
    r4.x = r4.x * r4.x;
    r4.x = r4.y * r4.x;
    r4.y = dot(BA_Fragment_149_CB2((uint)(r3.x+768)).xyz, r3.yzw);
    r4.y = saturate(r4.y * BA_Fragment_149_CB2((uint)(r3.x+512)).z + BA_Fragment_149_CB2((uint)(r3.x+512)).w);
    r4.y = r4.y * r4.y;
    r4.x = r4.x * r4.y;
    r4.xyz = BA_Fragment_149_CB2((uint)(r3.x+256)).xyz * r4.xxx;
    r3.x = saturate(dot(v4.xyz, r3.yzw));
    r2.xyz = r4.xyz * r3.xxx + r2.xyz;
    r2.w = (int)r2.w + 1;
  }
  r1.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_149_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_149_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_149_CB1((uint)(5)).xyz * r0.www;
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_149_CB1((uint)(7)).xyz + BA_Fragment_149_CB1((uint)(6)).yzw;
  o0.xyz = r0.www * BA_Fragment_149_CB1((uint)(8)).xyz + r0.xyz;
  o0.w = BA_Fragment_149_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_150_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_150_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_150_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_150_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_150_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_150_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_150_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_150_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_150_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_150_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_150_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_150_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_150_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_150_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_150_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_150_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_150_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_150_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_150_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_150_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.yzw = -BA_Fragment_150_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r1.xxx * r1.yzw + BA_Fragment_150_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_150_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_150_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_150_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  o0.xyz = r1.xyz * r0.xyz + r2.xyz;
  o0.w = BA_Fragment_150_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_151_CB4(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_151_CB3(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_151_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_151_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_151_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD4,
  float4 v5 : TEXCOORD5,
  float4 v6 : TEXCOORD7,
  float4 v7 : SV_POSITION0,
  uint v8 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v8);
#endif
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_151_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_151_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_151_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_151_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_151_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_151_CB4((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_151_CB4((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_151_CB4((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_151_CB4((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_151_CB4((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_151_CB4((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_151_CB4((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_151_CB4((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_151_CB4((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_151_CB4((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_151_CB4((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_151_CB4((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.xyz = BA_Fragment_151_CB0((uint)(6)).xyz * r1.xxx;
  r1.xyz = r1.xyz * v2.xxx + v1.xyz;
  r1.w = min(BA_Fragment_151_CB3((uint)(11)).y, BA_Fragment_151_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r2.xyz = r1.xyz;
  r2.w = 0;
  while (true) {
    r3.x = cmp((int)r2.w >= (int)r1.w);
    if (r3.x != 0) break;
    r3.x = (uint)r2.w >> 2;
    r3.y = (int)r2.w & 3;
    r3.x = dot(BA_Fragment_151_CB3((uint)(r3.x+12)).xyzw, icb[r3.y+0].xyzw);
    r3.x = (int)r3.x;
    r3.yzw = -v5.xyz * BA_Fragment_151_CB2((uint)(r3.x+0)).www + BA_Fragment_151_CB2((uint)(r3.x+0)).xyz;
    r4.x = dot(r3.yzw, r3.yzw);
    r4.x = max(6.10351563e-005, r4.x);
    r4.y = rsqrt(r4.x);
    r3.yzw = r4.yyy * r3.yzw;
    r4.y = 1 / r4.x;
    r4.x = BA_Fragment_151_CB2((uint)(r3.x+512)).x * r4.x;
    r4.x = -r4.x * r4.x + 1;
    r4.x = max(0, r4.x);
    r4.x = r4.x * r4.x;
    r4.x = r4.y * r4.x;
    r4.y = dot(BA_Fragment_151_CB2((uint)(r3.x+768)).xyz, r3.yzw);
    r4.y = saturate(r4.y * BA_Fragment_151_CB2((uint)(r3.x+512)).z + BA_Fragment_151_CB2((uint)(r3.x+512)).w);
    r4.y = r4.y * r4.y;
    r4.x = r4.x * r4.y;
    r4.xyz = BA_Fragment_151_CB2((uint)(r3.x+256)).xyz * r4.xxx;
    r3.x = saturate(dot(v4.xyz, r3.yzw));
    r2.xyz = r4.xyz * r3.xxx + r2.xyz;
    r2.w = (int)r2.w + 1;
  }
  r1.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_151_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_151_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_151_CB1((uint)(5)).xyz * r0.www;
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_151_CB1((uint)(7)).xyz + BA_Fragment_151_CB1((uint)(6)).yzw;
  o0.xyz = r0.www * BA_Fragment_151_CB1((uint)(8)).xyz + r0.xyz;
  o0.w = BA_Fragment_151_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_152_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_152_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_152_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_152_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_152_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_152_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_152_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_152_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_152_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_152_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_152_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_152_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_152_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_152_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_152_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_152_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_152_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_152_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_152_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_152_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.yzw = -BA_Fragment_152_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r1.xxx * r1.yzw + BA_Fragment_152_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_152_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_152_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_152_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_152_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_152_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_152_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_153_CB4(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_153_CB3(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_153_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_153_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_153_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD4,
  float4 v5 : TEXCOORD5,
  float4 v6 : TEXCOORD7,
  float4 v7 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_153_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_153_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_153_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_153_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_153_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_153_CB4((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_153_CB4((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_153_CB4((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_153_CB4((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_153_CB4((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_153_CB4((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_153_CB4((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_153_CB4((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_153_CB4((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_153_CB4((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_153_CB4((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_153_CB4((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.xyz = BA_Fragment_153_CB0((uint)(6)).xyz * r1.xxx;
  r1.xyz = r1.xyz * v2.xxx + v1.xyz;
  r1.w = min(BA_Fragment_153_CB3((uint)(11)).y, BA_Fragment_153_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r2.xyz = r1.xyz;
  r2.w = 0;
  while (true) {
    r3.x = cmp((int)r2.w >= (int)r1.w);
    if (r3.x != 0) break;
    r3.x = (uint)r2.w >> 2;
    r3.y = (int)r2.w & 3;
    r3.x = dot(BA_Fragment_153_CB3((uint)(r3.x+12)).xyzw, icb[r3.y+0].xyzw);
    r3.x = (int)r3.x;
    r3.yzw = -v5.xyz * BA_Fragment_153_CB2((uint)(r3.x+0)).www + BA_Fragment_153_CB2((uint)(r3.x+0)).xyz;
    r4.x = dot(r3.yzw, r3.yzw);
    r4.x = max(6.10351563e-005, r4.x);
    r4.y = rsqrt(r4.x);
    r3.yzw = r4.yyy * r3.yzw;
    r4.y = 1 / r4.x;
    r4.x = BA_Fragment_153_CB2((uint)(r3.x+512)).x * r4.x;
    r4.x = -r4.x * r4.x + 1;
    r4.x = max(0, r4.x);
    r4.x = r4.x * r4.x;
    r4.x = r4.y * r4.x;
    r4.y = dot(BA_Fragment_153_CB2((uint)(r3.x+768)).xyz, r3.yzw);
    r4.y = saturate(r4.y * BA_Fragment_153_CB2((uint)(r3.x+512)).z + BA_Fragment_153_CB2((uint)(r3.x+512)).w);
    r4.y = r4.y * r4.y;
    r4.x = r4.x * r4.y;
    r4.xyz = BA_Fragment_153_CB2((uint)(r3.x+256)).xyz * r4.xxx;
    r3.x = saturate(dot(v4.xyz, r3.yzw));
    r2.xyz = r4.xyz * r3.xxx + r2.xyz;
    r2.w = (int)r2.w + 1;
  }
  r1.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_153_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_153_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_153_CB1((uint)(5)).xyz * r0.www;
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_153_CB1((uint)(7)).xyz + BA_Fragment_153_CB1((uint)(6)).yzw;
  r0.xyz = r0.www * BA_Fragment_153_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_153_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_153_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_153_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_154_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_154_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_154_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_154_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_154_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_154_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_154_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_154_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_154_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_154_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_154_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_154_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_154_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_154_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_154_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_154_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_154_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_154_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_154_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_154_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.yzw = -BA_Fragment_154_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r1.xxx * r1.yzw + BA_Fragment_154_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_154_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_154_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_154_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_154_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_154_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_154_CB1((uint)(1)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_155_CB4(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_155_CB3(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_155_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_155_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_155_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD4,
  float4 v5 : TEXCOORD5,
  float4 v6 : TEXCOORD7,
  float4 v7 : SV_POSITION0,
  uint v8 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v8);
#endif
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_155_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_155_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_155_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_155_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_155_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_155_CB4((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_155_CB4((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_155_CB4((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_155_CB4((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_155_CB4((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_155_CB4((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_155_CB4((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_155_CB4((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_155_CB4((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_155_CB4((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_155_CB4((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_155_CB4((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.xyz = BA_Fragment_155_CB0((uint)(6)).xyz * r1.xxx;
  r1.xyz = r1.xyz * v2.xxx + v1.xyz;
  r1.w = min(BA_Fragment_155_CB3((uint)(11)).y, BA_Fragment_155_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r2.xyz = r1.xyz;
  r2.w = 0;
  while (true) {
    r3.x = cmp((int)r2.w >= (int)r1.w);
    if (r3.x != 0) break;
    r3.x = (uint)r2.w >> 2;
    r3.y = (int)r2.w & 3;
    r3.x = dot(BA_Fragment_155_CB3((uint)(r3.x+12)).xyzw, icb[r3.y+0].xyzw);
    r3.x = (int)r3.x;
    r3.yzw = -v5.xyz * BA_Fragment_155_CB2((uint)(r3.x+0)).www + BA_Fragment_155_CB2((uint)(r3.x+0)).xyz;
    r4.x = dot(r3.yzw, r3.yzw);
    r4.x = max(6.10351563e-005, r4.x);
    r4.y = rsqrt(r4.x);
    r3.yzw = r4.yyy * r3.yzw;
    r4.y = 1 / r4.x;
    r4.x = BA_Fragment_155_CB2((uint)(r3.x+512)).x * r4.x;
    r4.x = -r4.x * r4.x + 1;
    r4.x = max(0, r4.x);
    r4.x = r4.x * r4.x;
    r4.x = r4.y * r4.x;
    r4.y = dot(BA_Fragment_155_CB2((uint)(r3.x+768)).xyz, r3.yzw);
    r4.y = saturate(r4.y * BA_Fragment_155_CB2((uint)(r3.x+512)).z + BA_Fragment_155_CB2((uint)(r3.x+512)).w);
    r4.y = r4.y * r4.y;
    r4.x = r4.x * r4.y;
    r4.xyz = BA_Fragment_155_CB2((uint)(r3.x+256)).xyz * r4.xxx;
    r3.x = saturate(dot(v4.xyz, r3.yzw));
    r2.xyz = r4.xyz * r3.xxx + r2.xyz;
    r2.w = (int)r2.w + 1;
  }
  r1.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_155_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_155_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_155_CB1((uint)(5)).xyz * r0.www;
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_155_CB1((uint)(7)).xyz + BA_Fragment_155_CB1((uint)(6)).yzw;
  r0.xyz = r0.www * BA_Fragment_155_CB1((uint)(8)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_155_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v1.www * r0.xyz + BA_Fragment_155_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_155_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_156_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_156_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_156_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_156_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_156_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_156_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_156_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_156_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_156_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_156_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_156_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_156_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_156_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_156_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_156_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_156_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_156_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_156_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_156_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_156_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.yzw = -BA_Fragment_156_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r1.xxx * r1.yzw + BA_Fragment_156_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_156_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_156_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_156_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_156_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_156_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_156_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_157_CB4(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_157_CB3(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_157_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_157_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_157_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD4,
  float4 v5 : TEXCOORD5,
  float4 v6 : TEXCOORD7,
  float4 v7 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_157_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_157_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_157_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_157_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_157_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_157_CB4((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_157_CB4((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_157_CB4((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_157_CB4((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_157_CB4((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_157_CB4((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_157_CB4((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_157_CB4((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_157_CB4((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_157_CB4((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_157_CB4((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_157_CB4((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.xyz = BA_Fragment_157_CB0((uint)(6)).xyz * r1.xxx;
  r1.xyz = r1.xyz * v2.xxx + v1.xyz;
  r1.w = min(BA_Fragment_157_CB3((uint)(11)).y, BA_Fragment_157_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r2.xyz = r1.xyz;
  r2.w = 0;
  while (true) {
    r3.x = cmp((int)r2.w >= (int)r1.w);
    if (r3.x != 0) break;
    r3.x = (uint)r2.w >> 2;
    r3.y = (int)r2.w & 3;
    r3.x = dot(BA_Fragment_157_CB3((uint)(r3.x+12)).xyzw, icb[r3.y+0].xyzw);
    r3.x = (int)r3.x;
    r3.yzw = -v5.xyz * BA_Fragment_157_CB2((uint)(r3.x+0)).www + BA_Fragment_157_CB2((uint)(r3.x+0)).xyz;
    r4.x = dot(r3.yzw, r3.yzw);
    r4.x = max(6.10351563e-005, r4.x);
    r4.y = rsqrt(r4.x);
    r3.yzw = r4.yyy * r3.yzw;
    r4.y = 1 / r4.x;
    r4.x = BA_Fragment_157_CB2((uint)(r3.x+512)).x * r4.x;
    r4.x = -r4.x * r4.x + 1;
    r4.x = max(0, r4.x);
    r4.x = r4.x * r4.x;
    r4.x = r4.y * r4.x;
    r4.y = dot(BA_Fragment_157_CB2((uint)(r3.x+768)).xyz, r3.yzw);
    r4.y = saturate(r4.y * BA_Fragment_157_CB2((uint)(r3.x+512)).z + BA_Fragment_157_CB2((uint)(r3.x+512)).w);
    r4.y = r4.y * r4.y;
    r4.x = r4.x * r4.y;
    r4.xyz = BA_Fragment_157_CB2((uint)(r3.x+256)).xyz * r4.xxx;
    r3.x = saturate(dot(v4.xyz, r3.yzw));
    r2.xyz = r4.xyz * r3.xxx + r2.xyz;
    r2.w = (int)r2.w + 1;
  }
  r1.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_157_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_157_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_157_CB1((uint)(5)).xyz * r0.www;
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_157_CB1((uint)(7)).xyz + BA_Fragment_157_CB1((uint)(6)).yzw;
  r0.xyz = r0.www * BA_Fragment_157_CB1((uint)(8)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_157_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_157_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_157_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && !defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_158_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_158_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_158_CB0(uint i)
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
  float4 v4 : TEXCOORD7,
  float4 v5 : SV_POSITION0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_158_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_158_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_158_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_158_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_158_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_158_CB2((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_158_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_158_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_158_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_158_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_158_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_158_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_158_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_158_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_158_CB2((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_158_CB2((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_158_CB2((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.yzw = -BA_Fragment_158_CB0((uint)(2)).xyz + v1.xyz;
  r1.xyz = r1.xxx * r1.yzw + BA_Fragment_158_CB0((uint)(2)).xyz;
  r1.xyz = min(v1.xyz, r1.xyz);
  r2.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_158_CB0((uint)(19)).x).xyzw;
  r1.w = r1.x + r1.y;
  r1.w = r1.w + r1.z;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_158_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_158_CB1((uint)(5)).xyz * r0.www;
  r2.xyz = r3.xyz * r2.xyz;
  r0.xyz = r1.xyz * r0.xyz + r2.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_158_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_158_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_158_CB1((uint)(1)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON) && !defined(LIGHTMAP_ON) && defined(_ADDITIONAL_LIGHTS) && defined(_DYNAMIC_LIGHTS) && defined(_MAIN_LIGHT_SHADOWS)
float4 BA_Fragment_159_CB4(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_159_CB3(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_159_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_159_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_MaskColor.x, _MaskColor.y, _MaskColor.z, _MaskColor.w);
  if (i == 4u) value = float4(_BlendValue, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_SpecLightColor.x, _SpecLightColor.y, _SpecLightColor.z, 0.0);
  if (i == 6u) value = float4(_ShadowAttenSpec, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 7u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 8u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_159_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD4,
  float4 v5 : TEXCOORD5,
  float4 v6 : TEXCOORD7,
  float4 v7 : SV_POSITION0,
  uint v8 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v8);
#endif
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_159_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_159_CB1((uint)(1)).xyz * r0.xyz;
  r1.xyzw = _BlendTex.SampleBias(sampler_BlendTex, v0.xy, BA_Fragment_159_CB0((uint)(19)).x).xyzw;
  r2.x = 1 + -r1.w;
  r2.xyz = r1.www * BA_Fragment_159_CB1((uint)(2)).xyz + r2.xxx;
  r0.xyz = r2.xyz * r0.xyz;
  r1.w = 1 + -BA_Fragment_159_CB1((uint)(4)).x;
  r1.xyz = saturate(r1.xyz + r1.www);
  r0.xyz = r1.xyz * r0.xyz;
  r1.x = cmp(BA_Fragment_159_CB4((uint)(29)).y != 0.000000);
  if (r1.x != 0) {
    r1.xy = v3.xy * BA_Fragment_159_CB4((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_159_CB4((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_159_CB4((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_159_CB4((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_159_CB4((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_159_CB4((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_159_CB4((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_159_CB4((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_159_CB4((uint)(30)).xyxy + r3.xwzw;
    r8.xyzw = r7.zwyz * r2.xxxy;
    r9.xyzw = r7.xyzw * r2.yyzz;
    r1.x = r7.y * r2.z;
    r1.y = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.xy, v3.z).x;
    r2.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r5.zw, v3.z).x;
    r2.x = r8.y * r2.x;
    r1.y = r8.x * r1.y + r2.x;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r1.zw, v3.z).x;
    r1.y = r8.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.xy, v3.z).x;
    r1.y = r8.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.xy, v3.z).x;
    r1.y = r9.x * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r6.zw, v3.z).x;
    r1.y = r9.y * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r4.zw, v3.z).x;
    r1.y = r9.z * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.xy, v3.z).x;
    r1.y = r9.w * r1.z + r1.y;
    r1.z = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, r3.zw, v3.z).x;
    r1.x = r1.x * r1.z + r1.y;
  } else {
    r1.x = _MainLightShadowmapTexture.SampleCmpLevelZero(sampler_MainLightShadowmapTexture, v3.xy, v3.z).x;
  }
  r1.y = 1 + -BA_Fragment_159_CB4((uint)(29)).x;
  r1.x = r1.x * BA_Fragment_159_CB4((uint)(29)).x + r1.y;
  r1.y = cmp(0 >= v3.z);
  r1.z = cmp(v3.z >= 1);
  r1.y = (int)r1.z | (int)r1.y;
  r1.x = r1.y ? 1 : r1.x;
  r1.xyz = BA_Fragment_159_CB0((uint)(6)).xyz * r1.xxx;
  r1.xyz = r1.xyz * v2.xxx + v1.xyz;
  r1.w = min(BA_Fragment_159_CB3((uint)(11)).y, BA_Fragment_159_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r2.xyz = r1.xyz;
  r2.w = 0;
  while (true) {
    r3.x = cmp((int)r2.w >= (int)r1.w);
    if (r3.x != 0) break;
    r3.x = (uint)r2.w >> 2;
    r3.y = (int)r2.w & 3;
    r3.x = dot(BA_Fragment_159_CB3((uint)(r3.x+12)).xyzw, icb[r3.y+0].xyzw);
    r3.x = (int)r3.x;
    r3.yzw = -v5.xyz * BA_Fragment_159_CB2((uint)(r3.x+0)).www + BA_Fragment_159_CB2((uint)(r3.x+0)).xyz;
    r4.x = dot(r3.yzw, r3.yzw);
    r4.x = max(6.10351563e-005, r4.x);
    r4.y = rsqrt(r4.x);
    r3.yzw = r4.yyy * r3.yzw;
    r4.y = 1 / r4.x;
    r4.x = BA_Fragment_159_CB2((uint)(r3.x+512)).x * r4.x;
    r4.x = -r4.x * r4.x + 1;
    r4.x = max(0, r4.x);
    r4.x = r4.x * r4.x;
    r4.x = r4.y * r4.x;
    r4.y = dot(BA_Fragment_159_CB2((uint)(r3.x+768)).xyz, r3.yzw);
    r4.y = saturate(r4.y * BA_Fragment_159_CB2((uint)(r3.x+512)).z + BA_Fragment_159_CB2((uint)(r3.x+512)).w);
    r4.y = r4.y * r4.y;
    r4.x = r4.x * r4.y;
    r4.xyz = BA_Fragment_159_CB2((uint)(r3.x+256)).xyz * r4.xxx;
    r3.x = saturate(dot(v4.xyz, r3.yzw));
    r2.xyz = r4.xyz * r3.xxx + r2.xyz;
    r2.w = (int)r2.w + 1;
  }
  r1.xyzw = _SpecTex.SampleBias(sampler_SpecTex, v0.xy, BA_Fragment_159_CB0((uint)(19)).x).xyzw;
  r1.w = v1.x + v1.y;
  r1.w = v1.z + r1.w;
  r1.w = saturate(r1.w * 0.333000004 + -BA_Fragment_159_CB1((uint)(6)).x);
  r0.w = v2.z * r0.w;
  r0.w = r0.w * r1.w;
  r3.xyz = BA_Fragment_159_CB1((uint)(5)).xyz * r0.www;
  r1.xyz = r3.xyz * r1.xyz;
  r0.xyz = r2.xyz * r0.xyz + r1.xyz;
  r0.w = v2.y * v2.y;
  r0.xyz = r0.xyz * BA_Fragment_159_CB1((uint)(7)).xyz + BA_Fragment_159_CB1((uint)(6)).yzw;
  r0.xyz = r0.www * BA_Fragment_159_CB1((uint)(8)).xyz + r0.xyz;
  r0.w = exp2(-v1.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_159_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_159_CB0((uint)(56)).xyz;
  o0.w = BA_Fragment_159_CB1((uint)(1)).w;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Frag(out float4 color : SV_TARGET0) { color = float4(1,0,1,1); }
#endif
