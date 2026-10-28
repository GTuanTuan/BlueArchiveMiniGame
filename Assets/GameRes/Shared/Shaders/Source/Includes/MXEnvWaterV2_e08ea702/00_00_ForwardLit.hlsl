// Exact names and types from the original compiled parameter metadata.
float4 _DepthColor;
float _DepthGradDistance;
float4 _DistortST;
float _DistortSpeedU;
float _DistortSpeedV;
float _DistortStrengthU;
float _DistortStrengthV;
float4 _MainLightShadowParams;
float4 _MainLightShadowmapSize;
float4x4 _MainLightWorldToShadow[5];
float4 _RippleColor;
float4 _RippleST;
float _RippleSpeedU;
float _RippleSpeedV;
float4 _ShadowCoordModifier;
float4 _SurfaceColor;
float _SurfaceFadeDistance;
Texture2D<float4> _CameraDepthTexture;
Texture2D<float4> _DataTex;
Texture2D<float4> _MainLightShadowmapTexture;
SamplerState sampler_CameraDepthTexture;
SamplerState sampler_DataTex;
SamplerComparisonState sampler_MainLightShadowmapTexture;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS) && !defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Vertex_4_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RippleST.x, _RippleST.y, _RippleST.z, _RippleST.w);
  if (i == 1u) value = float4(_DistortST.x, _DistortST.y, _DistortST.z, _DistortST.w);
  if (i == 5u) value = float4(_RippleSpeedU, _RippleSpeedV, _DistortSpeedU, _DistortSpeedV);
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
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  r0.xy = v2.xy * BA_Vertex_4_CB2((uint)(0)).xy + BA_Vertex_4_CB2((uint)(0)).zw;
  o0.xy = BA_Vertex_4_CB0((uint)(11)).yy * BA_Vertex_4_CB2((uint)(5)).xy + r0.xy;
  r0.xy = v2.xy * BA_Vertex_4_CB2((uint)(1)).xy + BA_Vertex_4_CB2((uint)(1)).zw;
  o0.zw = BA_Vertex_4_CB0((uint)(11)).yy * BA_Vertex_4_CB2((uint)(5)).zw + r0.xy;
  r0.xyz = BA_Vertex_4_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_4_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_4_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_4_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_4_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_4_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o1.xy = r1.xw + r1.zz;
  o1.zw = r0.zw;
  o3.xyzw = r0.xyzw;
  r0.x = dot(v1.xyz, BA_Vertex_4_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_4_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_4_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_4_CB0((uint)(5)).xyz));
  o2.y = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS) && defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Vertex_5_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RippleST.x, _RippleST.y, _RippleST.z, _RippleST.w);
  if (i == 1u) value = float4(_DistortST.x, _DistortST.y, _DistortST.z, _DistortST.w);
  if (i == 5u) value = float4(_RippleSpeedU, _RippleSpeedV, _DistortSpeedU, _DistortSpeedV);
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
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  r0.xy = v2.xy * BA_Vertex_5_CB2((uint)(0)).xy + BA_Vertex_5_CB2((uint)(0)).zw;
  o0.xy = BA_Vertex_5_CB0((uint)(11)).yy * BA_Vertex_5_CB2((uint)(5)).xy + r0.xy;
  r0.xy = v2.xy * BA_Vertex_5_CB2((uint)(1)).xy + BA_Vertex_5_CB2((uint)(1)).zw;
  o0.zw = BA_Vertex_5_CB0((uint)(11)).yy * BA_Vertex_5_CB2((uint)(5)).zw + r0.xy;
  r0.xyz = BA_Vertex_5_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_5_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_5_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o1.xy = r1.xw + r1.zz;
  o1.zw = r0.zw;
  o3.xyzw = r0.xyzw;
  r0.x = dot(v1.xyz, BA_Vertex_5_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_5_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_5_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_5_CB0((uint)(5)).xyz));
  o2.y = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS) && !defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Vertex_6_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RippleST.x, _RippleST.y, _RippleST.z, _RippleST.w);
  if (i == 1u) value = float4(_DistortST.x, _DistortST.y, _DistortST.z, _DistortST.w);
  if (i == 5u) value = float4(_RippleSpeedU, _RippleSpeedV, _DistortSpeedU, _DistortSpeedV);
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
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Vertex_6_CB2((uint)(0)).xy + BA_Vertex_6_CB2((uint)(0)).zw;
  o0.xy = BA_Vertex_6_CB0((uint)(11)).yy * BA_Vertex_6_CB2((uint)(5)).xy + r0.xy;
  r0.xy = v2.xy * BA_Vertex_6_CB2((uint)(1)).xy + BA_Vertex_6_CB2((uint)(1)).zw;
  o0.zw = BA_Vertex_6_CB0((uint)(11)).yy * BA_Vertex_6_CB2((uint)(5)).zw + r0.xy;
  r0.xyz = BA_Vertex_6_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_6_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_6_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_6_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_6_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_6_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_6_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_6_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o1.xy = r1.xw + r1.zz;
  o1.zw = r0.zw;
  r1.x = r0.z / BA_Vertex_6_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_6_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.y = saturate(r0.x * BA_Vertex_6_CB0((uint)(55)).z + BA_Vertex_6_CB0((uint)(55)).w);
  r0.x = dot(v1.xyz, BA_Vertex_6_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_6_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_6_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_6_CB0((uint)(5)).xyz));
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS) && defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Vertex_7_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RippleST.x, _RippleST.y, _RippleST.z, _RippleST.w);
  if (i == 1u) value = float4(_DistortST.x, _DistortST.y, _DistortST.z, _DistortST.w);
  if (i == 5u) value = float4(_RippleSpeedU, _RippleSpeedV, _DistortSpeedU, _DistortSpeedV);
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
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Vertex_7_CB2((uint)(0)).xy + BA_Vertex_7_CB2((uint)(0)).zw;
  o0.xy = BA_Vertex_7_CB0((uint)(11)).yy * BA_Vertex_7_CB2((uint)(5)).xy + r0.xy;
  r0.xy = v2.xy * BA_Vertex_7_CB2((uint)(1)).xy + BA_Vertex_7_CB2((uint)(1)).zw;
  o0.zw = BA_Vertex_7_CB0((uint)(11)).yy * BA_Vertex_7_CB2((uint)(5)).zw + r0.xy;
  r0.xyz = BA_Vertex_7_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_7_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_7_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_7_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_7_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_7_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_7_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_7_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o1.xy = r1.xw + r1.zz;
  o1.zw = r0.zw;
  r1.x = r0.z / BA_Vertex_7_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_7_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.y = saturate(r0.x * BA_Vertex_7_CB0((uint)(55)).z + BA_Vertex_7_CB0((uint)(55)).w);
  r0.x = dot(v1.xyz, BA_Vertex_7_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_7_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_7_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_7_CB0((uint)(5)).xyz));
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS) && !defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Vertex_8_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RippleST.x, _RippleST.y, _RippleST.z, _RippleST.w);
  if (i == 1u) value = float4(_DistortST.x, _DistortST.y, _DistortST.z, _DistortST.w);
  if (i == 5u) value = float4(_RippleSpeedU, _RippleSpeedV, _DistortSpeedU, _DistortSpeedV);
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
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Vertex_8_CB2((uint)(0)).xy + BA_Vertex_8_CB2((uint)(0)).zw;
  o0.xy = BA_Vertex_8_CB0((uint)(11)).yy * BA_Vertex_8_CB2((uint)(5)).xy + r0.xy;
  r0.xy = v2.xy * BA_Vertex_8_CB2((uint)(1)).xy + BA_Vertex_8_CB2((uint)(1)).zw;
  o0.zw = BA_Vertex_8_CB0((uint)(11)).yy * BA_Vertex_8_CB2((uint)(5)).zw + r0.xy;
  r0.xyz = BA_Vertex_8_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_8_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_8_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_8_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_8_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_8_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_8_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_8_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o1.xy = r1.xw + r1.zz;
  o1.zw = r0.zw;
  r1.x = r0.z / BA_Vertex_8_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_8_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.y = BA_Vertex_8_CB0((uint)(55)).x * r0.x;
  r0.x = dot(v1.xyz, BA_Vertex_8_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_8_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_8_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_8_CB0((uint)(5)).xyz));
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS) && defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Vertex_9_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RippleST.x, _RippleST.y, _RippleST.z, _RippleST.w);
  if (i == 1u) value = float4(_DistortST.x, _DistortST.y, _DistortST.z, _DistortST.w);
  if (i == 5u) value = float4(_RippleSpeedU, _RippleSpeedV, _DistortSpeedU, _DistortSpeedV);
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
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Vertex_9_CB2((uint)(0)).xy + BA_Vertex_9_CB2((uint)(0)).zw;
  o0.xy = BA_Vertex_9_CB0((uint)(11)).yy * BA_Vertex_9_CB2((uint)(5)).xy + r0.xy;
  r0.xy = v2.xy * BA_Vertex_9_CB2((uint)(1)).xy + BA_Vertex_9_CB2((uint)(1)).zw;
  o0.zw = BA_Vertex_9_CB0((uint)(11)).yy * BA_Vertex_9_CB2((uint)(5)).zw + r0.xy;
  r0.xyz = BA_Vertex_9_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_9_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_9_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_9_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_9_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_9_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o1.xy = r1.xw + r1.zz;
  o1.zw = r0.zw;
  r1.x = r0.z / BA_Vertex_9_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_9_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.y = BA_Vertex_9_CB0((uint)(55)).x * r0.x;
  r0.x = dot(v1.xyz, BA_Vertex_9_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_9_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_9_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_9_CB0((uint)(5)).xyz));
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS) && !defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Vertex_10_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_10_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RippleST.x, _RippleST.y, _RippleST.z, _RippleST.w);
  if (i == 1u) value = float4(_DistortST.x, _DistortST.y, _DistortST.z, _DistortST.w);
  if (i == 5u) value = float4(_RippleSpeedU, _RippleSpeedV, _DistortSpeedU, _DistortSpeedV);
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
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  r0.xy = v2.xy * BA_Vertex_10_CB2((uint)(0)).xy + BA_Vertex_10_CB2((uint)(0)).zw;
  o0.xy = BA_Vertex_10_CB0((uint)(11)).yy * BA_Vertex_10_CB2((uint)(5)).xy + r0.xy;
  r0.xy = v2.xy * BA_Vertex_10_CB2((uint)(1)).xy + BA_Vertex_10_CB2((uint)(1)).zw;
  o0.zw = BA_Vertex_10_CB0((uint)(11)).yy * BA_Vertex_10_CB2((uint)(5)).zw + r0.xy;
  r0.xyz = BA_Vertex_10_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_10_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_10_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_10_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_10_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_10_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = BA_Vertex_10_CB0((uint)(17)).x * r1.y;
  r2.w = 0.5 * r0.w;
  r2.xz = float2(0.5,0.5) * r1.xw;
  o1.xy = r2.xw + r2.zz;
  o1.zw = r1.zw;
  o4.xyzw = r1.xyzw;
  r1.x = dot(v1.xyz, BA_Vertex_10_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_10_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_10_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  o2.x = saturate(dot(r1.xyz, BA_Vertex_10_CB0((uint)(5)).xyz));
  o2.y = 0;
  r1.xyz = BA_Vertex_10_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_10_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_10_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_10_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_10_CB3((uint)(1)).xy * BA_Vertex_10_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_10_CB3((uint)(0)).xy * BA_Vertex_10_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_10_CB3((uint)(2)).xy * BA_Vertex_10_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_10_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_10_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_10_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS) && defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Vertex_11_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RippleST.x, _RippleST.y, _RippleST.z, _RippleST.w);
  if (i == 1u) value = float4(_DistortST.x, _DistortST.y, _DistortST.z, _DistortST.w);
  if (i == 5u) value = float4(_RippleSpeedU, _RippleSpeedV, _DistortSpeedU, _DistortSpeedV);
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
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  r0.xy = v2.xy * BA_Vertex_11_CB2((uint)(0)).xy + BA_Vertex_11_CB2((uint)(0)).zw;
  o0.xy = BA_Vertex_11_CB0((uint)(11)).yy * BA_Vertex_11_CB2((uint)(5)).xy + r0.xy;
  r0.xy = v2.xy * BA_Vertex_11_CB2((uint)(1)).xy + BA_Vertex_11_CB2((uint)(1)).zw;
  o0.zw = BA_Vertex_11_CB0((uint)(11)).yy * BA_Vertex_11_CB2((uint)(5)).zw + r0.xy;
  r0.xyz = BA_Vertex_11_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_11_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_11_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_11_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_11_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_11_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_11_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_11_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o1.xy = r1.xw + r1.zz;
  o1.zw = r0.zw;
  o3.xyzw = r0.xyzw;
  r0.x = dot(v1.xyz, BA_Vertex_11_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_11_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_11_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_11_CB0((uint)(5)).xyz));
  o2.y = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS) && !defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Vertex_12_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_12_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RippleST.x, _RippleST.y, _RippleST.z, _RippleST.w);
  if (i == 1u) value = float4(_DistortST.x, _DistortST.y, _DistortST.z, _DistortST.w);
  if (i == 5u) value = float4(_RippleSpeedU, _RippleSpeedV, _DistortSpeedU, _DistortSpeedV);
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
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Vertex_12_CB2((uint)(0)).xy + BA_Vertex_12_CB2((uint)(0)).zw;
  o0.xy = BA_Vertex_12_CB0((uint)(11)).yy * BA_Vertex_12_CB2((uint)(5)).xy + r0.xy;
  r0.xy = v2.xy * BA_Vertex_12_CB2((uint)(1)).xy + BA_Vertex_12_CB2((uint)(1)).zw;
  o0.zw = BA_Vertex_12_CB0((uint)(11)).yy * BA_Vertex_12_CB2((uint)(5)).zw + r0.xy;
  r0.xyz = BA_Vertex_12_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_12_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_12_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_12_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_12_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_12_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_12_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_12_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = BA_Vertex_12_CB0((uint)(17)).x * r1.y;
  r2.w = 0.5 * r0.w;
  r2.xz = float2(0.5,0.5) * r1.xw;
  o1.xy = r2.xw + r2.zz;
  o1.zw = r1.zw;
  r2.x = dot(v1.xyz, BA_Vertex_12_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_12_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_12_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  o2.x = saturate(dot(r2.xyz, BA_Vertex_12_CB0((uint)(5)).xyz));
  r0.w = r1.z / BA_Vertex_12_CB0((uint)(17)).y;
  o4.xyzw = r1.xyzw;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_12_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.y = saturate(r0.w * BA_Vertex_12_CB0((uint)(55)).z + BA_Vertex_12_CB0((uint)(55)).w);
  r1.xyz = BA_Vertex_12_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_12_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_12_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_12_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_12_CB3((uint)(1)).xy * BA_Vertex_12_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_12_CB3((uint)(0)).xy * BA_Vertex_12_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_12_CB3((uint)(2)).xy * BA_Vertex_12_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_12_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_12_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_12_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS) && defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Vertex_13_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RippleST.x, _RippleST.y, _RippleST.z, _RippleST.w);
  if (i == 1u) value = float4(_DistortST.x, _DistortST.y, _DistortST.z, _DistortST.w);
  if (i == 5u) value = float4(_RippleSpeedU, _RippleSpeedV, _DistortSpeedU, _DistortSpeedV);
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
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Vertex_13_CB2((uint)(0)).xy + BA_Vertex_13_CB2((uint)(0)).zw;
  o0.xy = BA_Vertex_13_CB0((uint)(11)).yy * BA_Vertex_13_CB2((uint)(5)).xy + r0.xy;
  r0.xy = v2.xy * BA_Vertex_13_CB2((uint)(1)).xy + BA_Vertex_13_CB2((uint)(1)).zw;
  o0.zw = BA_Vertex_13_CB0((uint)(11)).yy * BA_Vertex_13_CB2((uint)(5)).zw + r0.xy;
  r0.xyz = BA_Vertex_13_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_13_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_13_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_13_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_13_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_13_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_13_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_13_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_13_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o1.xy = r1.xw + r1.zz;
  o1.zw = r0.zw;
  r1.x = r0.z / BA_Vertex_13_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_13_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.y = saturate(r0.x * BA_Vertex_13_CB0((uint)(55)).z + BA_Vertex_13_CB0((uint)(55)).w);
  r0.x = dot(v1.xyz, BA_Vertex_13_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_13_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_13_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_13_CB0((uint)(5)).xyz));
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS) && !defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Vertex_14_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 20u) value = transpose(_MainLightWorldToShadow[min((i-0u)/4u,4u)])[(i-0u)%4u];
  return value;
}

float4 BA_Vertex_14_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RippleST.x, _RippleST.y, _RippleST.z, _RippleST.w);
  if (i == 1u) value = float4(_DistortST.x, _DistortST.y, _DistortST.z, _DistortST.w);
  if (i == 5u) value = float4(_RippleSpeedU, _RippleSpeedV, _DistortSpeedU, _DistortSpeedV);
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
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Vertex_14_CB2((uint)(0)).xy + BA_Vertex_14_CB2((uint)(0)).zw;
  o0.xy = BA_Vertex_14_CB0((uint)(11)).yy * BA_Vertex_14_CB2((uint)(5)).xy + r0.xy;
  r0.xy = v2.xy * BA_Vertex_14_CB2((uint)(1)).xy + BA_Vertex_14_CB2((uint)(1)).zw;
  o0.zw = BA_Vertex_14_CB0((uint)(11)).yy * BA_Vertex_14_CB2((uint)(5)).zw + r0.xy;
  r0.xyz = BA_Vertex_14_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_14_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_14_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_14_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_14_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_14_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_14_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_14_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = BA_Vertex_14_CB0((uint)(17)).x * r1.y;
  r2.w = 0.5 * r0.w;
  r2.xz = float2(0.5,0.5) * r1.xw;
  o1.xy = r2.xw + r2.zz;
  o1.zw = r1.zw;
  r2.x = dot(v1.xyz, BA_Vertex_14_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_14_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_14_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  o2.x = saturate(dot(r2.xyz, BA_Vertex_14_CB0((uint)(5)).xyz));
  r0.w = r1.z / BA_Vertex_14_CB0((uint)(17)).y;
  o4.xyzw = r1.xyzw;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_14_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.y = BA_Vertex_14_CB0((uint)(55)).x * r0.w;
  r1.xyz = BA_Vertex_14_CB3((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_14_CB3((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_14_CB3((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_14_CB3((uint)(3)).xyz + r0.xyz;
  o3.z = r0.z;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.zw = BA_Vertex_14_CB3((uint)(1)).xy * BA_Vertex_14_CB0((uint)(125)).yy;
  r0.zw = BA_Vertex_14_CB3((uint)(0)).xy * BA_Vertex_14_CB0((uint)(125)).xx + r0.zw;
  r0.zw = BA_Vertex_14_CB3((uint)(2)).xy * BA_Vertex_14_CB0((uint)(125)).zz + r0.zw;
  r0.zw = BA_Vertex_14_CB3((uint)(3)).xy + r0.zw;
  r0.zw = r0.zw * float2(2,2) + float2(-1,-1);
  r1.x = saturate(BA_Vertex_14_CB0((uint)(125)).w);
  r0.xy = -r0.zw * r1.xx + r0.xy;
  r0.z = max(1, BA_Vertex_14_CB0((uint)(125)).w);
  r0.xy = r0.xy * r0.zz;
  o3.xy = r0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  o3.w = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS) && defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Vertex_15_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_RippleST.x, _RippleST.y, _RippleST.z, _RippleST.w);
  if (i == 1u) value = float4(_DistortST.x, _DistortST.y, _DistortST.z, _DistortST.w);
  if (i == 5u) value = float4(_RippleSpeedU, _RippleSpeedV, _DistortSpeedU, _DistortSpeedV);
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
  if (i == 5u) value = float4(_MainLightPosition.x, _MainLightPosition.y, _MainLightPosition.z, _MainLightPosition.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Vertex_15_CB2((uint)(0)).xy + BA_Vertex_15_CB2((uint)(0)).zw;
  o0.xy = BA_Vertex_15_CB0((uint)(11)).yy * BA_Vertex_15_CB2((uint)(5)).xy + r0.xy;
  r0.xy = v2.xy * BA_Vertex_15_CB2((uint)(1)).xy + BA_Vertex_15_CB2((uint)(1)).zw;
  o0.zw = BA_Vertex_15_CB0((uint)(11)).yy * BA_Vertex_15_CB2((uint)(5)).zw + r0.xy;
  r0.xyz = BA_Vertex_15_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_15_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_15_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_15_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_15_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_15_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.x = BA_Vertex_15_CB0((uint)(17)).x * r0.y;
  r1.w = 0.5 * r1.x;
  r1.xz = float2(0.5,0.5) * r0.xw;
  o1.xy = r1.xw + r1.zz;
  o1.zw = r0.zw;
  r1.x = r0.z / BA_Vertex_15_CB0((uint)(17)).y;
  o3.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_15_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.y = BA_Vertex_15_CB0((uint)(55)).x * r0.x;
  r0.x = dot(v1.xyz, BA_Vertex_15_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_15_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_15_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  o2.x = saturate(dot(r0.xyz, BA_Vertex_15_CB0((uint)(5)).xyz));
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS) && !defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Fragment_20_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_RippleColor.x, _RippleColor.y, _RippleColor.z, _RippleColor.w);
  if (i == 6u) value = float4(_DistortStrengthU, _DistortStrengthV, 0.0, 0.0);
  if (i == 7u) value = float4(_SurfaceColor.x, _SurfaceColor.y, _SurfaceColor.z, _SurfaceColor.w);
  if (i == 8u) value = float4(_SurfaceFadeDistance, 0.0, 0.0, 0.0);
  if (i == 9u) value = float4(_DepthColor.x, _DepthColor.y, _DepthColor.z, _DepthColor.w);
  if (i == 10u) value = float4(_DepthGradDistance, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_20_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_20_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_20_CB0((uint)(20)).z * r0.z + BA_Fragment_20_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.y = BA_Fragment_20_CB0((uint)(20)).z * r1.x + BA_Fragment_20_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.x = r0.y + -r0.x;
  r0.y = saturate(r0.x / BA_Fragment_20_CB1((uint)(8)).x);
  r0.x = saturate(r0.x / BA_Fragment_20_CB1((uint)(10)).x);
  r1.xyzw = BA_Fragment_20_CB1((uint)(9)).xyzw + -BA_Fragment_20_CB1((uint)(7)).xyzw;
  r1.xyzw = r0.xxxx * r1.xyzw + BA_Fragment_20_CB1((uint)(7)).xyzw;
  o0.w = r1.w * r0.y;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, v0.zw, BA_Fragment_20_CB0((uint)(19)).x).xyzw;
  r0.xy = r0.yy * BA_Fragment_20_CB1((uint)(6)).xy + v0.xy;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, r0.xy, BA_Fragment_20_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_20_CB1((uint)(4)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_20_CB1((uint)(4)).xyz + r1.xyz;
  r1.xyz = BA_Fragment_20_CB0((uint)(6)).xyz * v2.xxx;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS) && defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Fragment_21_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_RippleColor.x, _RippleColor.y, _RippleColor.z, _RippleColor.w);
  if (i == 6u) value = float4(_DistortStrengthU, _DistortStrengthV, 0.0, 0.0);
  if (i == 7u) value = float4(_SurfaceColor.x, _SurfaceColor.y, _SurfaceColor.z, _SurfaceColor.w);
  if (i == 8u) value = float4(_SurfaceFadeDistance, 0.0, 0.0, 0.0);
  if (i == 9u) value = float4(_DepthColor.x, _DepthColor.y, _DepthColor.z, _DepthColor.w);
  if (i == 10u) value = float4(_DepthGradDistance, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_21_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_21_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_21_CB0((uint)(20)).z * r0.z + BA_Fragment_21_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.y = BA_Fragment_21_CB0((uint)(20)).z * r1.x + BA_Fragment_21_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.x = r0.y + -r0.x;
  r0.y = saturate(r0.x / BA_Fragment_21_CB1((uint)(8)).x);
  r0.x = saturate(r0.x / BA_Fragment_21_CB1((uint)(10)).x);
  r1.xyzw = BA_Fragment_21_CB1((uint)(9)).xyzw + -BA_Fragment_21_CB1((uint)(7)).xyzw;
  r1.xyzw = r0.xxxx * r1.xyzw + BA_Fragment_21_CB1((uint)(7)).xyzw;
  o0.w = r1.w * r0.y;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, v0.zw, BA_Fragment_21_CB0((uint)(19)).x).xyzw;
  r0.xy = r0.yy * BA_Fragment_21_CB1((uint)(6)).xy + v0.xy;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, r0.xy, BA_Fragment_21_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_21_CB1((uint)(4)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_21_CB1((uint)(4)).xyz + r1.xyz;
  r1.xyz = BA_Fragment_21_CB0((uint)(6)).xyz * v2.xxx;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS) && !defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Fragment_22_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_RippleColor.x, _RippleColor.y, _RippleColor.z, _RippleColor.w);
  if (i == 6u) value = float4(_DistortStrengthU, _DistortStrengthV, 0.0, 0.0);
  if (i == 7u) value = float4(_SurfaceColor.x, _SurfaceColor.y, _SurfaceColor.z, _SurfaceColor.w);
  if (i == 8u) value = float4(_SurfaceFadeDistance, 0.0, 0.0, 0.0);
  if (i == 9u) value = float4(_DepthColor.x, _DepthColor.y, _DepthColor.z, _DepthColor.w);
  if (i == 10u) value = float4(_DepthGradDistance, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_22_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_22_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_22_CB0((uint)(20)).z * r0.z + BA_Fragment_22_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.y = BA_Fragment_22_CB0((uint)(20)).z * r1.x + BA_Fragment_22_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.x = r0.y + -r0.x;
  r0.y = saturate(r0.x / BA_Fragment_22_CB1((uint)(8)).x);
  r0.x = saturate(r0.x / BA_Fragment_22_CB1((uint)(10)).x);
  r1.xyzw = BA_Fragment_22_CB1((uint)(9)).xyzw + -BA_Fragment_22_CB1((uint)(7)).xyzw;
  r1.xyzw = r0.xxxx * r1.xyzw + BA_Fragment_22_CB1((uint)(7)).xyzw;
  o0.w = r1.w * r0.y;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, v0.zw, BA_Fragment_22_CB0((uint)(19)).x).xyzw;
  r0.xy = r0.yy * BA_Fragment_22_CB1((uint)(6)).xy + v0.xy;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, r0.xy, BA_Fragment_22_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_22_CB1((uint)(4)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_22_CB1((uint)(4)).xyz + r1.xyz;
  r1.xyz = BA_Fragment_22_CB0((uint)(6)).xyz * v2.xxx;
  r0.xyz = r0.xyz * r1.xyz + -BA_Fragment_22_CB0((uint)(56)).xyz;
  o0.xyz = v2.yyy * r0.xyz + BA_Fragment_22_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS) && defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Fragment_23_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_RippleColor.x, _RippleColor.y, _RippleColor.z, _RippleColor.w);
  if (i == 6u) value = float4(_DistortStrengthU, _DistortStrengthV, 0.0, 0.0);
  if (i == 7u) value = float4(_SurfaceColor.x, _SurfaceColor.y, _SurfaceColor.z, _SurfaceColor.w);
  if (i == 8u) value = float4(_SurfaceFadeDistance, 0.0, 0.0, 0.0);
  if (i == 9u) value = float4(_DepthColor.x, _DepthColor.y, _DepthColor.z, _DepthColor.w);
  if (i == 10u) value = float4(_DepthGradDistance, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_23_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_23_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_23_CB0((uint)(20)).z * r0.z + BA_Fragment_23_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.y = BA_Fragment_23_CB0((uint)(20)).z * r1.x + BA_Fragment_23_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.x = r0.y + -r0.x;
  r0.y = saturate(r0.x / BA_Fragment_23_CB1((uint)(8)).x);
  r0.x = saturate(r0.x / BA_Fragment_23_CB1((uint)(10)).x);
  r1.xyzw = BA_Fragment_23_CB1((uint)(9)).xyzw + -BA_Fragment_23_CB1((uint)(7)).xyzw;
  r1.xyzw = r0.xxxx * r1.xyzw + BA_Fragment_23_CB1((uint)(7)).xyzw;
  o0.w = r1.w * r0.y;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, v0.zw, BA_Fragment_23_CB0((uint)(19)).x).xyzw;
  r0.xy = r0.yy * BA_Fragment_23_CB1((uint)(6)).xy + v0.xy;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, r0.xy, BA_Fragment_23_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_23_CB1((uint)(4)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_23_CB1((uint)(4)).xyz + r1.xyz;
  r1.xyz = BA_Fragment_23_CB0((uint)(6)).xyz * v2.xxx;
  r0.xyz = r0.xyz * r1.xyz + -BA_Fragment_23_CB0((uint)(56)).xyz;
  o0.xyz = v2.yyy * r0.xyz + BA_Fragment_23_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS) && !defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Fragment_24_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_RippleColor.x, _RippleColor.y, _RippleColor.z, _RippleColor.w);
  if (i == 6u) value = float4(_DistortStrengthU, _DistortStrengthV, 0.0, 0.0);
  if (i == 7u) value = float4(_SurfaceColor.x, _SurfaceColor.y, _SurfaceColor.z, _SurfaceColor.w);
  if (i == 8u) value = float4(_SurfaceFadeDistance, 0.0, 0.0, 0.0);
  if (i == 9u) value = float4(_DepthColor.x, _DepthColor.y, _DepthColor.z, _DepthColor.w);
  if (i == 10u) value = float4(_DepthGradDistance, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_24_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, v0.zw, BA_Fragment_24_CB0((uint)(19)).x).xyzw;
  r0.xy = r0.yy * BA_Fragment_24_CB1((uint)(6)).xy + v0.xy;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, r0.xy, BA_Fragment_24_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_24_CB1((uint)(4)).w * r0.x;
  r0.yzw = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_24_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_24_CB0((uint)(20)).z * r0.w + BA_Fragment_24_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.z = BA_Fragment_24_CB0((uint)(20)).z * r1.x + BA_Fragment_24_CB0((uint)(20)).w;
  r0.z = 1 / r0.z;
  r0.y = r0.z + -r0.y;
  r0.z = saturate(r0.y / BA_Fragment_24_CB1((uint)(10)).x);
  r0.y = saturate(r0.y / BA_Fragment_24_CB1((uint)(8)).x);
  r1.xyzw = BA_Fragment_24_CB1((uint)(9)).xyzw + -BA_Fragment_24_CB1((uint)(7)).xyzw;
  r1.xyzw = r0.zzzz * r1.xyzw + BA_Fragment_24_CB1((uint)(7)).xyzw;
  r0.xzw = r0.xxx * BA_Fragment_24_CB1((uint)(4)).xyz + r1.xyz;
  o0.w = r1.w * r0.y;
  r1.xyz = BA_Fragment_24_CB0((uint)(6)).xyz * v2.xxx;
  r0.xyz = r0.xzw * r1.xyz + -BA_Fragment_24_CB0((uint)(56)).xyz;
  r0.w = exp2(-v2.y);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_24_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_MAIN_LIGHT_SHADOWS) && defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Fragment_25_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_RippleColor.x, _RippleColor.y, _RippleColor.z, _RippleColor.w);
  if (i == 6u) value = float4(_DistortStrengthU, _DistortStrengthV, 0.0, 0.0);
  if (i == 7u) value = float4(_SurfaceColor.x, _SurfaceColor.y, _SurfaceColor.z, _SurfaceColor.w);
  if (i == 8u) value = float4(_SurfaceFadeDistance, 0.0, 0.0, 0.0);
  if (i == 9u) value = float4(_DepthColor.x, _DepthColor.y, _DepthColor.z, _DepthColor.w);
  if (i == 10u) value = float4(_DepthGradDistance, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_25_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, v0.zw, BA_Fragment_25_CB0((uint)(19)).x).xyzw;
  r0.xy = r0.yy * BA_Fragment_25_CB1((uint)(6)).xy + v0.xy;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, r0.xy, BA_Fragment_25_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_25_CB1((uint)(4)).w * r0.x;
  r0.yzw = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_25_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_25_CB0((uint)(20)).z * r0.w + BA_Fragment_25_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.z = BA_Fragment_25_CB0((uint)(20)).z * r1.x + BA_Fragment_25_CB0((uint)(20)).w;
  r0.z = 1 / r0.z;
  r0.y = r0.z + -r0.y;
  r0.z = saturate(r0.y / BA_Fragment_25_CB1((uint)(10)).x);
  r0.y = saturate(r0.y / BA_Fragment_25_CB1((uint)(8)).x);
  r1.xyzw = BA_Fragment_25_CB1((uint)(9)).xyzw + -BA_Fragment_25_CB1((uint)(7)).xyzw;
  r1.xyzw = r0.zzzz * r1.xyzw + BA_Fragment_25_CB1((uint)(7)).xyzw;
  r0.xzw = r0.xxx * BA_Fragment_25_CB1((uint)(4)).xyz + r1.xyz;
  o0.w = r1.w * r0.y;
  r1.xyz = BA_Fragment_25_CB0((uint)(6)).xyz * v2.xxx;
  r0.xyz = r0.xzw * r1.xyz + -BA_Fragment_25_CB0((uint)(56)).xyz;
  r0.w = exp2(-v2.y);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_25_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS) && !defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Fragment_26_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_26_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_RippleColor.x, _RippleColor.y, _RippleColor.z, _RippleColor.w);
  if (i == 6u) value = float4(_DistortStrengthU, _DistortStrengthV, 0.0, 0.0);
  if (i == 7u) value = float4(_SurfaceColor.x, _SurfaceColor.y, _SurfaceColor.z, _SurfaceColor.w);
  if (i == 8u) value = float4(_SurfaceFadeDistance, 0.0, 0.0, 0.0);
  if (i == 9u) value = float4(_DepthColor.x, _DepthColor.y, _DepthColor.z, _DepthColor.w);
  if (i == 10u) value = float4(_DepthGradDistance, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_26_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
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

  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, v0.zw, BA_Fragment_26_CB0((uint)(19)).x).xyzw;
  r0.xy = r0.yy * BA_Fragment_26_CB1((uint)(6)).xy + v0.xy;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, r0.xy, BA_Fragment_26_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_26_CB1((uint)(4)).w * r0.x;
  r0.yzw = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_26_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_26_CB0((uint)(20)).z * r1.x + BA_Fragment_26_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.z = BA_Fragment_26_CB0((uint)(20)).z * r0.w + BA_Fragment_26_CB0((uint)(20)).w;
  r0.z = 1 / r0.z;
  r0.y = r0.y + -r0.z;
  r0.z = saturate(r0.y / BA_Fragment_26_CB1((uint)(10)).x);
  r0.y = saturate(r0.y / BA_Fragment_26_CB1((uint)(8)).x);
  r1.xyzw = BA_Fragment_26_CB1((uint)(9)).xyzw + -BA_Fragment_26_CB1((uint)(7)).xyzw;
  r1.xyzw = r0.zzzz * r1.xyzw + BA_Fragment_26_CB1((uint)(7)).xyzw;
  o0.w = r1.w * r0.y;
  r0.xyz = r0.xxx * BA_Fragment_26_CB1((uint)(4)).xyz + r1.xyz;
  r1.xyz = BA_Fragment_26_CB0((uint)(6)).xyz * v2.xxx;
  r0.xyz = r1.xyz * r0.xyz;
  r0.w = cmp(BA_Fragment_26_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r1.xy = v3.xy * BA_Fragment_26_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_26_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_26_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_26_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_26_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_26_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_26_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_26_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_26_CB2((uint)(30)).xyxy + r3.xwzw;
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
  r1.x = 1 + -BA_Fragment_26_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_26_CB2((uint)(29)).x + r1.x;
  r1.x = cmp(0 >= v3.z);
  r1.y = cmp(v3.z >= 1);
  r1.x = (int)r1.y | (int)r1.x;
  r0.w = r1.x ? 1 : r0.w;
  r1.xyz = float3(1,1,1) + -BA_Fragment_26_CB0((uint)(2)).xyz;
  r1.xyz = r0.www * r1.xyz + BA_Fragment_26_CB0((uint)(2)).xyz;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS) && defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Fragment_27_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_RippleColor.x, _RippleColor.y, _RippleColor.z, _RippleColor.w);
  if (i == 6u) value = float4(_DistortStrengthU, _DistortStrengthV, 0.0, 0.0);
  if (i == 7u) value = float4(_SurfaceColor.x, _SurfaceColor.y, _SurfaceColor.z, _SurfaceColor.w);
  if (i == 8u) value = float4(_SurfaceFadeDistance, 0.0, 0.0, 0.0);
  if (i == 9u) value = float4(_DepthColor.x, _DepthColor.y, _DepthColor.z, _DepthColor.w);
  if (i == 10u) value = float4(_DepthGradDistance, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_27_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_27_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_27_CB0((uint)(20)).z * r0.z + BA_Fragment_27_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.y = BA_Fragment_27_CB0((uint)(20)).z * r1.x + BA_Fragment_27_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.x = r0.y + -r0.x;
  r0.y = saturate(r0.x / BA_Fragment_27_CB1((uint)(8)).x);
  r0.x = saturate(r0.x / BA_Fragment_27_CB1((uint)(10)).x);
  r1.xyzw = BA_Fragment_27_CB1((uint)(9)).xyzw + -BA_Fragment_27_CB1((uint)(7)).xyzw;
  r1.xyzw = r0.xxxx * r1.xyzw + BA_Fragment_27_CB1((uint)(7)).xyzw;
  o0.w = r1.w * r0.y;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, v0.zw, BA_Fragment_27_CB0((uint)(19)).x).xyzw;
  r0.xy = r0.yy * BA_Fragment_27_CB1((uint)(6)).xy + v0.xy;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, r0.xy, BA_Fragment_27_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_27_CB1((uint)(4)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_27_CB1((uint)(4)).xyz + r1.xyz;
  r1.xyz = BA_Fragment_27_CB0((uint)(6)).xyz * v2.xxx;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS) && !defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Fragment_28_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_28_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_RippleColor.x, _RippleColor.y, _RippleColor.z, _RippleColor.w);
  if (i == 6u) value = float4(_DistortStrengthU, _DistortStrengthV, 0.0, 0.0);
  if (i == 7u) value = float4(_SurfaceColor.x, _SurfaceColor.y, _SurfaceColor.z, _SurfaceColor.w);
  if (i == 8u) value = float4(_SurfaceFadeDistance, 0.0, 0.0, 0.0);
  if (i == 9u) value = float4(_DepthColor.x, _DepthColor.y, _DepthColor.z, _DepthColor.w);
  if (i == 10u) value = float4(_DepthGradDistance, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_28_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
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

  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, v0.zw, BA_Fragment_28_CB0((uint)(19)).x).xyzw;
  r0.xy = r0.yy * BA_Fragment_28_CB1((uint)(6)).xy + v0.xy;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, r0.xy, BA_Fragment_28_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_28_CB1((uint)(4)).w * r0.x;
  r0.yzw = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_28_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_28_CB0((uint)(20)).z * r1.x + BA_Fragment_28_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.z = BA_Fragment_28_CB0((uint)(20)).z * r0.w + BA_Fragment_28_CB0((uint)(20)).w;
  r0.z = 1 / r0.z;
  r0.y = r0.y + -r0.z;
  r0.z = saturate(r0.y / BA_Fragment_28_CB1((uint)(10)).x);
  r0.y = saturate(r0.y / BA_Fragment_28_CB1((uint)(8)).x);
  r1.xyzw = BA_Fragment_28_CB1((uint)(9)).xyzw + -BA_Fragment_28_CB1((uint)(7)).xyzw;
  r1.xyzw = r0.zzzz * r1.xyzw + BA_Fragment_28_CB1((uint)(7)).xyzw;
  o0.w = r1.w * r0.y;
  r0.xyz = r0.xxx * BA_Fragment_28_CB1((uint)(4)).xyz + r1.xyz;
  r1.xyz = BA_Fragment_28_CB0((uint)(6)).xyz * v2.xxx;
  r0.xyz = r1.xyz * r0.xyz;
  r0.w = cmp(BA_Fragment_28_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r1.xy = v3.xy * BA_Fragment_28_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_28_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_28_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_28_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_28_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_28_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_28_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_28_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_28_CB2((uint)(30)).xyxy + r3.xwzw;
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
  r1.x = 1 + -BA_Fragment_28_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_28_CB2((uint)(29)).x + r1.x;
  r1.x = cmp(0 >= v3.z);
  r1.y = cmp(v3.z >= 1);
  r1.x = (int)r1.y | (int)r1.x;
  r0.w = r1.x ? 1 : r0.w;
  r1.xyz = float3(1,1,1) + -BA_Fragment_28_CB0((uint)(2)).xyz;
  r1.xyz = r0.www * r1.xyz + BA_Fragment_28_CB0((uint)(2)).xyz;
  r0.xyz = r0.xyz * r1.xyz + -BA_Fragment_28_CB0((uint)(56)).xyz;
  o0.xyz = v2.yyy * r0.xyz + BA_Fragment_28_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS) && defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Fragment_29_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_RippleColor.x, _RippleColor.y, _RippleColor.z, _RippleColor.w);
  if (i == 6u) value = float4(_DistortStrengthU, _DistortStrengthV, 0.0, 0.0);
  if (i == 7u) value = float4(_SurfaceColor.x, _SurfaceColor.y, _SurfaceColor.z, _SurfaceColor.w);
  if (i == 8u) value = float4(_SurfaceFadeDistance, 0.0, 0.0, 0.0);
  if (i == 9u) value = float4(_DepthColor.x, _DepthColor.y, _DepthColor.z, _DepthColor.w);
  if (i == 10u) value = float4(_DepthGradDistance, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_29_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_29_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_29_CB0((uint)(20)).z * r0.z + BA_Fragment_29_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.y = BA_Fragment_29_CB0((uint)(20)).z * r1.x + BA_Fragment_29_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.x = r0.y + -r0.x;
  r0.y = saturate(r0.x / BA_Fragment_29_CB1((uint)(8)).x);
  r0.x = saturate(r0.x / BA_Fragment_29_CB1((uint)(10)).x);
  r1.xyzw = BA_Fragment_29_CB1((uint)(9)).xyzw + -BA_Fragment_29_CB1((uint)(7)).xyzw;
  r1.xyzw = r0.xxxx * r1.xyzw + BA_Fragment_29_CB1((uint)(7)).xyzw;
  o0.w = r1.w * r0.y;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, v0.zw, BA_Fragment_29_CB0((uint)(19)).x).xyzw;
  r0.xy = r0.yy * BA_Fragment_29_CB1((uint)(6)).xy + v0.xy;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, r0.xy, BA_Fragment_29_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_29_CB1((uint)(4)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_29_CB1((uint)(4)).xyz + r1.xyz;
  r1.xyz = BA_Fragment_29_CB0((uint)(6)).xyz * v2.xxx;
  r0.xyz = r0.xyz * r1.xyz + -BA_Fragment_29_CB0((uint)(56)).xyz;
  o0.xyz = v2.yyy * r0.xyz + BA_Fragment_29_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS) && !defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Fragment_30_CB2(uint i)
{
  float4 value = 0;
  if (i == 29u) value = float4(_MainLightShadowParams.x, _MainLightShadowParams.y, _MainLightShadowParams.z, _MainLightShadowParams.w);
  if (i == 30u) value = float4(_MainLightShadowmapSize.x, _MainLightShadowmapSize.y, _MainLightShadowmapSize.z, _MainLightShadowmapSize.w);
  return value;
}

float4 BA_Fragment_30_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_RippleColor.x, _RippleColor.y, _RippleColor.z, _RippleColor.w);
  if (i == 6u) value = float4(_DistortStrengthU, _DistortStrengthV, 0.0, 0.0);
  if (i == 7u) value = float4(_SurfaceColor.x, _SurfaceColor.y, _SurfaceColor.z, _SurfaceColor.w);
  if (i == 8u) value = float4(_SurfaceFadeDistance, 0.0, 0.0, 0.0);
  if (i == 9u) value = float4(_DepthColor.x, _DepthColor.y, _DepthColor.z, _DepthColor.w);
  if (i == 10u) value = float4(_DepthGradDistance, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_30_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_SubtractiveShadowColor.x, _SubtractiveShadowColor.y, _SubtractiveShadowColor.z, _SubtractiveShadowColor.w);
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
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

  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, v0.zw, BA_Fragment_30_CB0((uint)(19)).x).xyzw;
  r0.xy = r0.yy * BA_Fragment_30_CB1((uint)(6)).xy + v0.xy;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, r0.xy, BA_Fragment_30_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_30_CB1((uint)(4)).w * r0.x;
  r0.yzw = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_30_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_30_CB0((uint)(20)).z * r1.x + BA_Fragment_30_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.z = BA_Fragment_30_CB0((uint)(20)).z * r0.w + BA_Fragment_30_CB0((uint)(20)).w;
  r0.z = 1 / r0.z;
  r0.y = r0.y + -r0.z;
  r0.z = saturate(r0.y / BA_Fragment_30_CB1((uint)(10)).x);
  r0.y = saturate(r0.y / BA_Fragment_30_CB1((uint)(8)).x);
  r1.xyzw = BA_Fragment_30_CB1((uint)(9)).xyzw + -BA_Fragment_30_CB1((uint)(7)).xyzw;
  r1.xyzw = r0.zzzz * r1.xyzw + BA_Fragment_30_CB1((uint)(7)).xyzw;
  o0.w = r1.w * r0.y;
  r0.xyz = r0.xxx * BA_Fragment_30_CB1((uint)(4)).xyz + r1.xyz;
  r1.xyz = BA_Fragment_30_CB0((uint)(6)).xyz * v2.xxx;
  r0.xyz = r1.xyz * r0.xyz;
  r0.w = cmp(BA_Fragment_30_CB2((uint)(29)).y != 0.000000);
  if (r0.w != 0) {
    r1.xy = v3.xy * BA_Fragment_30_CB2((uint)(30)).zw + float2(0.5,0.5);
    r1.xy = floor(r1.xy);
    r1.zw = v3.xy * BA_Fragment_30_CB2((uint)(30)).zw + -r1.xy;
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
    r3.xyz = BA_Fragment_30_CB2((uint)(30)).xxx * r3.yxz;
    r4.xyz = BA_Fragment_30_CB2((uint)(30)).yyy * r4.xyz;
    r3.w = r4.x;
    r5.xyzw = r1.xyxy * BA_Fragment_30_CB2((uint)(30)).xyxy + r3.ywxw;
    r1.zw = r1.xy * BA_Fragment_30_CB2((uint)(30)).xy + r3.zw;
    r4.w = r3.y;
    r3.yw = r4.yz;
    r6.xyzw = r1.xyxy * BA_Fragment_30_CB2((uint)(30)).xyxy + r3.xyzy;
    r4.xyzw = r1.xyxy * BA_Fragment_30_CB2((uint)(30)).xyxy + r4.wywz;
    r3.xyzw = r1.xyxy * BA_Fragment_30_CB2((uint)(30)).xyxy + r3.xwzw;
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
  r1.x = 1 + -BA_Fragment_30_CB2((uint)(29)).x;
  r0.w = r0.w * BA_Fragment_30_CB2((uint)(29)).x + r1.x;
  r1.x = cmp(0 >= v3.z);
  r1.y = cmp(v3.z >= 1);
  r1.x = (int)r1.y | (int)r1.x;
  r0.w = r1.x ? 1 : r0.w;
  r1.xyz = float3(1,1,1) + -BA_Fragment_30_CB0((uint)(2)).xyz;
  r1.xyz = r0.www * r1.xyz + BA_Fragment_30_CB0((uint)(2)).xyz;
  r0.w = exp2(-v2.y);
  r0.w = min(1, r0.w);
  r0.xyz = r0.xyz * r1.xyz + -BA_Fragment_30_CB0((uint)(56)).xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_30_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_MAIN_LIGHT_SHADOWS) && defined(_RECEIVE_SHADOWS_OFF)
float4 BA_Fragment_31_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_RippleColor.x, _RippleColor.y, _RippleColor.z, _RippleColor.w);
  if (i == 6u) value = float4(_DistortStrengthU, _DistortStrengthV, 0.0, 0.0);
  if (i == 7u) value = float4(_SurfaceColor.x, _SurfaceColor.y, _SurfaceColor.z, _SurfaceColor.w);
  if (i == 8u) value = float4(_SurfaceFadeDistance, 0.0, 0.0, 0.0);
  if (i == 9u) value = float4(_DepthColor.x, _DepthColor.y, _DepthColor.z, _DepthColor.w);
  if (i == 10u) value = float4(_DepthGradDistance, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_31_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, v0.zw, BA_Fragment_31_CB0((uint)(19)).x).xyzw;
  r0.xy = r0.yy * BA_Fragment_31_CB1((uint)(6)).xy + v0.xy;
  r0.xyzw = _DataTex.SampleBias(sampler_DataTex, r0.xy, BA_Fragment_31_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_31_CB1((uint)(4)).w * r0.x;
  r0.yzw = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_31_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_31_CB0((uint)(20)).z * r0.w + BA_Fragment_31_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.z = BA_Fragment_31_CB0((uint)(20)).z * r1.x + BA_Fragment_31_CB0((uint)(20)).w;
  r0.z = 1 / r0.z;
  r0.y = r0.z + -r0.y;
  r0.z = saturate(r0.y / BA_Fragment_31_CB1((uint)(10)).x);
  r0.y = saturate(r0.y / BA_Fragment_31_CB1((uint)(8)).x);
  r1.xyzw = BA_Fragment_31_CB1((uint)(9)).xyzw + -BA_Fragment_31_CB1((uint)(7)).xyzw;
  r1.xyzw = r0.zzzz * r1.xyzw + BA_Fragment_31_CB1((uint)(7)).xyzw;
  r0.xzw = r0.xxx * BA_Fragment_31_CB1((uint)(4)).xyz + r1.xyz;
  o0.w = r1.w * r0.y;
  r1.xyz = BA_Fragment_31_CB0((uint)(6)).xyz * v2.xxx;
  r0.xyz = r0.xzw * r1.xyz + -BA_Fragment_31_CB0((uint)(56)).xyz;
  r0.w = exp2(-v2.y);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_31_CB0((uint)(56)).xyz;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
