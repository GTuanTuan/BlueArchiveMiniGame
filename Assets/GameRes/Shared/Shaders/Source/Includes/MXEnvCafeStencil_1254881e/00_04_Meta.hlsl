// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float _Cutoff;
float _EmissionStrength;
float4 _MainTex_ST;
float unity_MaxOutputValue;
bool4 unity_MetaFragmentControl;
bool4 unity_MetaVertexControl;
float unity_OneOverOutputBoost;
float unity_UseLinearSpace;
Texture2D<float4> _EmissionTex;
Texture2D<float4> _MainTex;
SamplerState sampler_EmissionTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(_ENV_ALPHA_MODE) && !defined(_ENV_CUTOUT_MODE) && !defined(_ENV_EMISSION_MODE) && !defined(_SPECULAR_SETUP)
float4 BA_Vertex_283_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat((uint)(unity_MetaVertexControl.x)), asfloat((uint)(unity_MetaVertexControl.y)), asfloat((uint)(unity_MetaVertexControl.z)), asfloat((uint)(unity_MetaVertexControl.w)));
  return value;
}

float4 BA_Vertex_283_CB2(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  if (i == 24u) value = float4(unity_DynamicLightmapST.x, unity_DynamicLightmapST.y, unity_DynamicLightmapST.z, unity_DynamicLightmapST.w);
  return value;
}

float4 BA_Vertex_283_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_283_CB0(uint i)
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
  float4 v3 : TEXCOORD1,
  float2 v4 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(0 < v0.z);
  r0.z = r0.x ? 0.000000 : 0;
  r0.xy = v3.xy * BA_Vertex_283_CB2((uint)(23)).xy + BA_Vertex_283_CB2((uint)(23)).zw;
  r0.xyz = BA_Vertex_283_CB3((uint)(0)).xxx ? r0.xyz : v0.xyz;
  r0.w = cmp(0 < r0.z);
  r1.z = r0.w ? 0.000000 : 0;
  r1.xy = v4.xy * BA_Vertex_283_CB2((uint)(24)).xy + BA_Vertex_283_CB2((uint)(24)).zw;
  r0.xyz = BA_Vertex_283_CB3((uint)(0)).yyy ? r1.xyz : r0.xyz;
  r1.xyzw = BA_Vertex_283_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_283_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_283_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_283_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xy = v2.xy * BA_Vertex_283_CB1((uint)(0)).xy + BA_Vertex_283_CB1((uint)(0)).zw;
  return;
}
#elif !defined(_ENV_ALPHA_MODE) && !defined(_ENV_CUTOUT_MODE) && !defined(_ENV_EMISSION_MODE) && defined(_SPECULAR_SETUP)
float4 BA_Vertex_284_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat((uint)(unity_MetaVertexControl.x)), asfloat((uint)(unity_MetaVertexControl.y)), asfloat((uint)(unity_MetaVertexControl.z)), asfloat((uint)(unity_MetaVertexControl.w)));
  return value;
}

float4 BA_Vertex_284_CB2(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  if (i == 24u) value = float4(unity_DynamicLightmapST.x, unity_DynamicLightmapST.y, unity_DynamicLightmapST.z, unity_DynamicLightmapST.w);
  return value;
}

float4 BA_Vertex_284_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_284_CB0(uint i)
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
  float4 v3 : TEXCOORD1,
  float2 v4 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(0 < v0.z);
  r0.z = r0.x ? 0.000000 : 0;
  r0.xy = v3.xy * BA_Vertex_284_CB2((uint)(23)).xy + BA_Vertex_284_CB2((uint)(23)).zw;
  r0.xyz = BA_Vertex_284_CB3((uint)(0)).xxx ? r0.xyz : v0.xyz;
  r0.w = cmp(0 < r0.z);
  r1.z = r0.w ? 0.000000 : 0;
  r1.xy = v4.xy * BA_Vertex_284_CB2((uint)(24)).xy + BA_Vertex_284_CB2((uint)(24)).zw;
  r0.xyz = BA_Vertex_284_CB3((uint)(0)).yyy ? r1.xyz : r0.xyz;
  r1.xyzw = BA_Vertex_284_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_284_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_284_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_284_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xy = v2.xy * BA_Vertex_284_CB1((uint)(0)).xy + BA_Vertex_284_CB1((uint)(0)).zw;
  return;
}
#elif !defined(_ENV_ALPHA_MODE) && defined(_ENV_CUTOUT_MODE) && !defined(_ENV_EMISSION_MODE) && defined(_SPECULAR_SETUP)
float4 BA_Vertex_285_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat((uint)(unity_MetaVertexControl.x)), asfloat((uint)(unity_MetaVertexControl.y)), asfloat((uint)(unity_MetaVertexControl.z)), asfloat((uint)(unity_MetaVertexControl.w)));
  return value;
}

float4 BA_Vertex_285_CB2(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  if (i == 24u) value = float4(unity_DynamicLightmapST.x, unity_DynamicLightmapST.y, unity_DynamicLightmapST.z, unity_DynamicLightmapST.w);
  return value;
}

float4 BA_Vertex_285_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_285_CB0(uint i)
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
  float4 v3 : TEXCOORD1,
  float2 v4 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(0 < v0.z);
  r0.z = r0.x ? 0.000000 : 0;
  r0.xy = v3.xy * BA_Vertex_285_CB2((uint)(23)).xy + BA_Vertex_285_CB2((uint)(23)).zw;
  r0.xyz = BA_Vertex_285_CB3((uint)(0)).xxx ? r0.xyz : v0.xyz;
  r0.w = cmp(0 < r0.z);
  r1.z = r0.w ? 0.000000 : 0;
  r1.xy = v4.xy * BA_Vertex_285_CB2((uint)(24)).xy + BA_Vertex_285_CB2((uint)(24)).zw;
  r0.xyz = BA_Vertex_285_CB3((uint)(0)).yyy ? r1.xyz : r0.xyz;
  r1.xyzw = BA_Vertex_285_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_285_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_285_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_285_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xy = v2.xy * BA_Vertex_285_CB1((uint)(0)).xy + BA_Vertex_285_CB1((uint)(0)).zw;
  return;
}
#elif defined(_ENV_ALPHA_MODE) && !defined(_ENV_CUTOUT_MODE) && !defined(_ENV_EMISSION_MODE) && defined(_SPECULAR_SETUP)
float4 BA_Vertex_286_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat((uint)(unity_MetaVertexControl.x)), asfloat((uint)(unity_MetaVertexControl.y)), asfloat((uint)(unity_MetaVertexControl.z)), asfloat((uint)(unity_MetaVertexControl.w)));
  return value;
}

float4 BA_Vertex_286_CB2(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  if (i == 24u) value = float4(unity_DynamicLightmapST.x, unity_DynamicLightmapST.y, unity_DynamicLightmapST.z, unity_DynamicLightmapST.w);
  return value;
}

float4 BA_Vertex_286_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_286_CB0(uint i)
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
  float4 v3 : TEXCOORD1,
  float2 v4 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(0 < v0.z);
  r0.z = r0.x ? 0.000000 : 0;
  r0.xy = v3.xy * BA_Vertex_286_CB2((uint)(23)).xy + BA_Vertex_286_CB2((uint)(23)).zw;
  r0.xyz = BA_Vertex_286_CB3((uint)(0)).xxx ? r0.xyz : v0.xyz;
  r0.w = cmp(0 < r0.z);
  r1.z = r0.w ? 0.000000 : 0;
  r1.xy = v4.xy * BA_Vertex_286_CB2((uint)(24)).xy + BA_Vertex_286_CB2((uint)(24)).zw;
  r0.xyz = BA_Vertex_286_CB3((uint)(0)).yyy ? r1.xyz : r0.xyz;
  r1.xyzw = BA_Vertex_286_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_286_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_286_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_286_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xy = v2.xy * BA_Vertex_286_CB1((uint)(0)).xy + BA_Vertex_286_CB1((uint)(0)).zw;
  return;
}
#elif !defined(_ENV_ALPHA_MODE) && !defined(_ENV_CUTOUT_MODE) && defined(_ENV_EMISSION_MODE) && defined(_SPECULAR_SETUP)
float4 BA_Vertex_287_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat((uint)(unity_MetaVertexControl.x)), asfloat((uint)(unity_MetaVertexControl.y)), asfloat((uint)(unity_MetaVertexControl.z)), asfloat((uint)(unity_MetaVertexControl.w)));
  return value;
}

float4 BA_Vertex_287_CB2(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(unity_LightmapST.x, unity_LightmapST.y, unity_LightmapST.z, unity_LightmapST.w);
  if (i == 24u) value = float4(unity_DynamicLightmapST.x, unity_DynamicLightmapST.y, unity_DynamicLightmapST.z, unity_DynamicLightmapST.w);
  return value;
}

float4 BA_Vertex_287_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_287_CB0(uint i)
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
  float4 v3 : TEXCOORD1,
  float2 v4 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(0 < v0.z);
  r0.z = r0.x ? 0.000000 : 0;
  r0.xy = v3.xy * BA_Vertex_287_CB2((uint)(23)).xy + BA_Vertex_287_CB2((uint)(23)).zw;
  r0.xyz = BA_Vertex_287_CB3((uint)(0)).xxx ? r0.xyz : v0.xyz;
  r0.w = cmp(0 < r0.z);
  r1.z = r0.w ? 0.000000 : 0;
  r1.xy = v4.xy * BA_Vertex_287_CB2((uint)(24)).xy + BA_Vertex_287_CB2((uint)(24)).zw;
  r0.xyz = BA_Vertex_287_CB3((uint)(0)).yyy ? r1.xyz : r0.xyz;
  r1.xyzw = BA_Vertex_287_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_287_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_287_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_287_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xy = v2.xy * BA_Vertex_287_CB1((uint)(0)).xy + BA_Vertex_287_CB1((uint)(0)).zw;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Vert(float4 position : POSITION, out float4 clip : SV_POSITION) { clip = TransformObjectToHClip(position.xyz); }
#endif

#if !defined(_ENV_ALPHA_MODE) && !defined(_ENV_CUTOUT_MODE) && !defined(_ENV_EMISSION_MODE) && !defined(_SPECULAR_SETUP)
float4 BA_Fragment_291_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(asfloat((uint)(unity_MetaFragmentControl.x)), asfloat((uint)(unity_MetaFragmentControl.y)), asfloat((uint)(unity_MetaFragmentControl.z)), asfloat((uint)(unity_MetaFragmentControl.w)));
  return value;
}

float4 BA_Fragment_291_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_291_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 124u) value = float4(unity_OneOverOutputBoost, unity_MaxOutputValue, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_291_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_291_CB1((uint)(1)).xyz * r0.xyz;
  r0.xyz = float3(0.125,0.125,0.125) * r0.xyz;
  r0.xyz = log2(abs(r0.xyz));
  r0.w = saturate(BA_Fragment_291_CB0((uint)(124)).x);
  r0.xyz = r0.www * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r0.xyz = min(BA_Fragment_291_CB0((uint)(124)).yyy, r0.xyz);
  r0.w = 1;
  r0.xyzw = BA_Fragment_291_CB2((uint)(1)).xxxx ? r0.xyzw : float4(0,0,0,0);
  o0.xyzw = BA_Fragment_291_CB2((uint)(1)).yyyy ? float4(0,0,0,1) : r0.xyzw;
  return;
}
#elif !defined(_ENV_ALPHA_MODE) && !defined(_ENV_CUTOUT_MODE) && !defined(_ENV_EMISSION_MODE) && defined(_SPECULAR_SETUP)
float4 BA_Fragment_292_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(asfloat((uint)(unity_MetaFragmentControl.x)), asfloat((uint)(unity_MetaFragmentControl.y)), asfloat((uint)(unity_MetaFragmentControl.z)), asfloat((uint)(unity_MetaFragmentControl.w)));
  return value;
}

float4 BA_Fragment_292_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_292_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 124u) value = float4(unity_OneOverOutputBoost, unity_MaxOutputValue, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_292_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_292_CB1((uint)(1)).xyz * r0.xyz;
  r0.xyz = r0.xyz * float3(0.800000012,0.800000012,0.800000012) + float3(0.0250000004,0.0250000004,0.0250000004);
  r0.xyz = log2(abs(r0.xyz));
  r0.w = saturate(BA_Fragment_292_CB0((uint)(124)).x);
  r0.xyz = r0.www * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r0.xyz = min(BA_Fragment_292_CB0((uint)(124)).yyy, r0.xyz);
  r0.w = 1;
  r0.xyzw = BA_Fragment_292_CB2((uint)(1)).xxxx ? r0.xyzw : float4(0,0,0,0);
  o0.xyzw = BA_Fragment_292_CB2((uint)(1)).yyyy ? float4(0,0,0,1) : r0.xyzw;
  return;
}
#elif !defined(_ENV_ALPHA_MODE) && defined(_ENV_CUTOUT_MODE) && !defined(_ENV_EMISSION_MODE) && defined(_SPECULAR_SETUP)
float4 BA_Fragment_293_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(asfloat((uint)(unity_MetaFragmentControl.x)), asfloat((uint)(unity_MetaFragmentControl.y)), asfloat((uint)(unity_MetaFragmentControl.z)), asfloat((uint)(unity_MetaFragmentControl.w)));
  return value;
}

float4 BA_Fragment_293_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Cutoff, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_293_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 124u) value = float4(unity_OneOverOutputBoost, unity_MaxOutputValue, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_293_CB0((uint)(19)).x).xyzw;
  r0.w = -BA_Fragment_293_CB1((uint)(2)).x + r0.w;
  r0.xyz = BA_Fragment_293_CB1((uint)(1)).xyz * r0.xyz;
  r0.xyz = r0.xyz * float3(0.800000012,0.800000012,0.800000012) + float3(0.0250000004,0.0250000004,0.0250000004);
  r0.xyz = log2(abs(r0.xyz));
  r0.w = cmp(r0.w < 0);
  if (r0.w != 0) discard;
  r0.w = saturate(BA_Fragment_293_CB0((uint)(124)).x);
  r0.xyz = r0.www * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r0.xyz = min(BA_Fragment_293_CB0((uint)(124)).yyy, r0.xyz);
  r0.w = 1;
  r0.xyzw = BA_Fragment_293_CB2((uint)(1)).xxxx ? r0.xyzw : float4(0,0,0,0);
  o0.xyzw = BA_Fragment_293_CB2((uint)(1)).yyyy ? float4(0,0,0,1) : r0.xyzw;
  return;
}
#elif defined(_ENV_ALPHA_MODE) && !defined(_ENV_CUTOUT_MODE) && !defined(_ENV_EMISSION_MODE) && defined(_SPECULAR_SETUP)
float4 BA_Fragment_294_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(asfloat((uint)(unity_MetaFragmentControl.x)), asfloat((uint)(unity_MetaFragmentControl.y)), asfloat((uint)(unity_MetaFragmentControl.z)), asfloat((uint)(unity_MetaFragmentControl.w)));
  return value;
}

float4 BA_Fragment_294_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  return value;
}

float4 BA_Fragment_294_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 124u) value = float4(unity_OneOverOutputBoost, unity_MaxOutputValue, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_294_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_294_CB1((uint)(1)).xyz * r0.xyz;
  r0.xyz = r0.xyz * float3(0.800000012,0.800000012,0.800000012) + float3(0.0250000004,0.0250000004,0.0250000004);
  r0.xyz = log2(abs(r0.xyz));
  r0.w = saturate(BA_Fragment_294_CB0((uint)(124)).x);
  r0.xyz = r0.www * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r0.xyz = min(BA_Fragment_294_CB0((uint)(124)).yyy, r0.xyz);
  r0.w = 1;
  r0.xyzw = BA_Fragment_294_CB2((uint)(1)).xxxx ? r0.xyzw : float4(0,0,0,0);
  o0.xyzw = BA_Fragment_294_CB2((uint)(1)).yyyy ? float4(0,0,0,1) : r0.xyzw;
  return;
}
#elif !defined(_ENV_ALPHA_MODE) && !defined(_ENV_CUTOUT_MODE) && defined(_ENV_EMISSION_MODE) && defined(_SPECULAR_SETUP)
float4 BA_Fragment_295_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(asfloat((uint)(unity_MetaFragmentControl.x)), asfloat((uint)(unity_MetaFragmentControl.y)), asfloat((uint)(unity_MetaFragmentControl.z)), asfloat((uint)(unity_MetaFragmentControl.w)));
  return value;
}

float4 BA_Fragment_295_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 5u) value = float4(_EmissionStrength, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_295_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 124u) value = float4(unity_OneOverOutputBoost, unity_MaxOutputValue, unity_UseLinearSpace, 0.0);
  return value;
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_295_CB0((uint)(19)).x).xyzw;
  r0.xyz = BA_Fragment_295_CB1((uint)(1)).xyz * r0.xyz;
  r0.w = BA_Fragment_295_CB1((uint)(5)).x * r0.w;
  r0.xyz = r0.xyz * float3(0.800000012,0.800000012,0.800000012) + float3(0.0250000004,0.0250000004,0.0250000004);
  r0.xyz = log2(abs(r0.xyz));
  r1.x = saturate(BA_Fragment_295_CB0((uint)(124)).x);
  r0.xyz = r1.xxx * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r1.xyz = min(BA_Fragment_295_CB0((uint)(124)).yyy, r0.xyz);
  r1.w = 1;
  r1.xyzw = BA_Fragment_295_CB2((uint)(1)).xxxx ? r1.xyzw : float4(0,0,0,0);
  r2.xyzw = _EmissionTex.SampleBias(sampler_EmissionTex, v1.xy, BA_Fragment_295_CB0((uint)(19)).x).xyzw;
  r0.xyz = r2.xyz * r0.www;
  r2.xyz = r0.xyz * r0.xyz;
  r0.w = cmp(0 != BA_Fragment_295_CB0((uint)(124)).z);
  r0.xyz = r0.www ? r0.xyz : r2.xyz;
  r0.w = 1;
  o0.xyzw = BA_Fragment_295_CB2((uint)(1)).yyyy ? r0.xyzw : r1.xyzw;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Frag(out float4 color : SV_TARGET0) { color = float4(1,0,1,1); }
#endif
