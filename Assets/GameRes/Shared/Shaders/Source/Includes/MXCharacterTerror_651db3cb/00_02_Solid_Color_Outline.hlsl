// Exact names and types from the original compiled parameter metadata.
float _DissolveDirection;
float _DissolveLineThinness;
float _DissolveStartHeight;
float4 _DissolveTex_TexelSize;
float _DitherThreshold;
float4 _OutlineTint;
Texture2D<float4> _DissolveTex;
SamplerState sampler_DissolveTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_40_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  return value;
}

float4 BA_Vertex_40_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_40_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_40_CB1((uint)(5)).xyz * BA_Vertex_40_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_40_CB1((uint)(4)).xyz * BA_Vertex_40_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_40_CB1((uint)(6)).xyz * BA_Vertex_40_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_40_CB1((uint)(7)).xyz * BA_Vertex_40_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_40_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_40_CB1((uint)(5)).xyz * BA_Vertex_40_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_40_CB1((uint)(4)).xyz * BA_Vertex_40_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_40_CB1((uint)(6)).xyz * BA_Vertex_40_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_40_CB1((uint)(7)).xyz * BA_Vertex_40_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_40_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_40_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_40_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_40_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_40_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_40_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_40_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_40_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_40_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_40_CB0((uint)(22)).x / BA_Vertex_40_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.zw = r1.zw;
  o1.xyz = BA_Vertex_40_CB2((uint)(2)).xyz * BA_Vertex_40_CB0((uint)(10)).xyz;
  o1.w = BA_Vertex_40_CB2((uint)(2)).w;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_41_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  return value;
}

float4 BA_Vertex_41_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_41_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_41_CB1((uint)(5)).xyz * BA_Vertex_41_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_41_CB1((uint)(4)).xyz * BA_Vertex_41_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_41_CB1((uint)(6)).xyz * BA_Vertex_41_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_41_CB1((uint)(7)).xyz * BA_Vertex_41_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_41_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_41_CB1((uint)(5)).xyz * BA_Vertex_41_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_41_CB1((uint)(4)).xyz * BA_Vertex_41_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_41_CB1((uint)(6)).xyz * BA_Vertex_41_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_41_CB1((uint)(7)).xyz * BA_Vertex_41_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_41_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_41_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_41_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_41_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_41_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_41_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_41_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_41_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_41_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_41_CB0((uint)(22)).x / BA_Vertex_41_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.zw = r1.zw;
  o1.xyz = BA_Vertex_41_CB2((uint)(2)).xyz * BA_Vertex_41_CB0((uint)(10)).xyz;
  o1.w = BA_Vertex_41_CB2((uint)(2)).w;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_42_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 7u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_42_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_42_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_42_CB1((uint)(5)).xyz * BA_Vertex_42_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_42_CB1((uint)(4)).xyz * BA_Vertex_42_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_42_CB1((uint)(6)).xyz * BA_Vertex_42_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_42_CB1((uint)(7)).xyz * BA_Vertex_42_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_42_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_42_CB1((uint)(5)).xyz * BA_Vertex_42_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_42_CB1((uint)(4)).xyz * BA_Vertex_42_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_42_CB1((uint)(6)).xyz * BA_Vertex_42_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_42_CB1((uint)(7)).xyz * BA_Vertex_42_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_42_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_42_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_42_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_42_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_42_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_42_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_42_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_42_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_42_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_42_CB0((uint)(22)).x / BA_Vertex_42_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  o0.zw = r2.zw;
  o1.xyz = BA_Vertex_42_CB2((uint)(2)).xyz * BA_Vertex_42_CB0((uint)(10)).xyz;
  o1.w = BA_Vertex_42_CB2((uint)(2)).w;
  r0.w = BA_Vertex_42_CB2((uint)(7)).y + -r1.y;
  r0.w = BA_Vertex_42_CB2((uint)(7)).x * r0.w;
  r1.x = 1 + -BA_Vertex_42_CB2((uint)(7)).x;
  r0.w = r1.y * r1.x + r0.w;
  r0.w = r0.w / BA_Vertex_42_CB2((uint)(7)).y;
  r1.x = 1 + -BA_Vertex_42_CB2((uint)(17)).x;
  r0.w = r1.x + -r0.w;
  o2.w = saturate(BA_Vertex_42_CB2((uint)(7)).z * r0.w);
  r0.z = BA_Vertex_42_CB0((uint)(21)).x * r0.y;
  r0.xy = r0.xz + r2.ww;
  r0.z = 0.5 / r2.w;
  o2.yz = r0.xy * r0.zz;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_43_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 7u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_43_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_43_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_43_CB1((uint)(5)).xyz * BA_Vertex_43_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_43_CB1((uint)(4)).xyz * BA_Vertex_43_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_43_CB1((uint)(6)).xyz * BA_Vertex_43_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_43_CB1((uint)(7)).xyz * BA_Vertex_43_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_43_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_43_CB1((uint)(5)).xyz * BA_Vertex_43_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_43_CB1((uint)(4)).xyz * BA_Vertex_43_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_43_CB1((uint)(6)).xyz * BA_Vertex_43_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_43_CB1((uint)(7)).xyz * BA_Vertex_43_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_43_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_43_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_43_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_43_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_43_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_43_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_43_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_43_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_43_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_43_CB0((uint)(22)).x / BA_Vertex_43_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  o0.zw = r2.zw;
  o1.xyz = BA_Vertex_43_CB2((uint)(2)).xyz * BA_Vertex_43_CB0((uint)(10)).xyz;
  o1.w = BA_Vertex_43_CB2((uint)(2)).w;
  r0.w = BA_Vertex_43_CB2((uint)(7)).y + -r1.y;
  r0.w = BA_Vertex_43_CB2((uint)(7)).x * r0.w;
  r1.x = 1 + -BA_Vertex_43_CB2((uint)(7)).x;
  r0.w = r1.y * r1.x + r0.w;
  r0.w = r0.w / BA_Vertex_43_CB2((uint)(7)).y;
  r1.x = 1 + -BA_Vertex_43_CB2((uint)(17)).x;
  r0.w = r1.x + -r0.w;
  o2.w = saturate(BA_Vertex_43_CB2((uint)(7)).z * r0.w);
  r0.z = BA_Vertex_43_CB0((uint)(21)).x * r0.y;
  r0.xy = r0.xz + r2.ww;
  r0.z = 0.5 / r2.w;
  o2.yz = r0.xy * r0.zz;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_44_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  return value;
}

float4 BA_Vertex_44_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_44_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_44_CB1((uint)(5)).xyz * BA_Vertex_44_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_44_CB1((uint)(4)).xyz * BA_Vertex_44_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_44_CB1((uint)(6)).xyz * BA_Vertex_44_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_44_CB1((uint)(7)).xyz * BA_Vertex_44_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_44_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_44_CB1((uint)(5)).xyz * BA_Vertex_44_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_44_CB1((uint)(4)).xyz * BA_Vertex_44_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_44_CB1((uint)(6)).xyz * BA_Vertex_44_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_44_CB1((uint)(7)).xyz * BA_Vertex_44_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_44_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_44_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_44_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_44_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_44_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_44_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_44_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_44_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_44_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_44_CB0((uint)(22)).x / BA_Vertex_44_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.zw = r1.zw;
  r0.x = r1.z / BA_Vertex_44_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_44_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_44_CB0((uint)(59)).z + BA_Vertex_44_CB0((uint)(59)).w);
  o1.xyz = BA_Vertex_44_CB2((uint)(2)).xyz * BA_Vertex_44_CB0((uint)(10)).xyz;
  o1.w = BA_Vertex_44_CB2((uint)(2)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_45_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  return value;
}

float4 BA_Vertex_45_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_45_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_45_CB1((uint)(5)).xyz * BA_Vertex_45_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_45_CB1((uint)(4)).xyz * BA_Vertex_45_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_45_CB1((uint)(6)).xyz * BA_Vertex_45_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_45_CB1((uint)(7)).xyz * BA_Vertex_45_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_45_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_45_CB1((uint)(5)).xyz * BA_Vertex_45_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_45_CB1((uint)(4)).xyz * BA_Vertex_45_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_45_CB1((uint)(6)).xyz * BA_Vertex_45_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_45_CB1((uint)(7)).xyz * BA_Vertex_45_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_45_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_45_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_45_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_45_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_45_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_45_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_45_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_45_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_45_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_45_CB0((uint)(22)).x / BA_Vertex_45_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.zw = r1.zw;
  r0.x = r1.z / BA_Vertex_45_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_45_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_45_CB0((uint)(59)).z + BA_Vertex_45_CB0((uint)(59)).w);
  o1.xyz = BA_Vertex_45_CB2((uint)(2)).xyz * BA_Vertex_45_CB0((uint)(10)).xyz;
  o1.w = BA_Vertex_45_CB2((uint)(2)).w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_46_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 7u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_46_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_46_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_46_CB1((uint)(5)).xyz * BA_Vertex_46_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_46_CB1((uint)(4)).xyz * BA_Vertex_46_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_46_CB1((uint)(6)).xyz * BA_Vertex_46_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_46_CB1((uint)(7)).xyz * BA_Vertex_46_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_46_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_46_CB1((uint)(5)).xyz * BA_Vertex_46_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_46_CB1((uint)(4)).xyz * BA_Vertex_46_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_46_CB1((uint)(6)).xyz * BA_Vertex_46_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_46_CB1((uint)(7)).xyz * BA_Vertex_46_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_46_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_46_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_46_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_46_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_46_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_46_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_46_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_46_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_46_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_46_CB0((uint)(22)).x / BA_Vertex_46_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  o0.zw = r2.zw;
  o1.xyz = BA_Vertex_46_CB2((uint)(2)).xyz * BA_Vertex_46_CB0((uint)(10)).xyz;
  o1.w = BA_Vertex_46_CB2((uint)(2)).w;
  r0.w = BA_Vertex_46_CB2((uint)(7)).y + -r1.y;
  r0.w = BA_Vertex_46_CB2((uint)(7)).x * r0.w;
  r1.x = 1 + -BA_Vertex_46_CB2((uint)(7)).x;
  r0.w = r1.y * r1.x + r0.w;
  r0.w = r0.w / BA_Vertex_46_CB2((uint)(7)).y;
  r1.x = 1 + -BA_Vertex_46_CB2((uint)(17)).x;
  r0.w = r1.x + -r0.w;
  o2.w = saturate(BA_Vertex_46_CB2((uint)(7)).z * r0.w);
  r0.z = BA_Vertex_46_CB0((uint)(21)).x * r0.y;
  r0.xy = r0.xz + r2.ww;
  r0.z = 0.5 / r2.w;
  r0.w = r2.z / BA_Vertex_46_CB0((uint)(21)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_46_CB0((uint)(21)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.x = saturate(r0.w * BA_Vertex_46_CB0((uint)(59)).z + BA_Vertex_46_CB0((uint)(59)).w);
  o2.yz = r0.xy * r0.zz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_47_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 7u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_47_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_47_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_47_CB1((uint)(5)).xyz * BA_Vertex_47_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_47_CB1((uint)(4)).xyz * BA_Vertex_47_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_47_CB1((uint)(6)).xyz * BA_Vertex_47_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_47_CB1((uint)(7)).xyz * BA_Vertex_47_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_47_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_47_CB1((uint)(5)).xyz * BA_Vertex_47_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_47_CB1((uint)(4)).xyz * BA_Vertex_47_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_47_CB1((uint)(6)).xyz * BA_Vertex_47_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_47_CB1((uint)(7)).xyz * BA_Vertex_47_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_47_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_47_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_47_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_47_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_47_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_47_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_47_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_47_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_47_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_47_CB0((uint)(22)).x / BA_Vertex_47_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  o0.zw = r2.zw;
  o1.xyz = BA_Vertex_47_CB2((uint)(2)).xyz * BA_Vertex_47_CB0((uint)(10)).xyz;
  o1.w = BA_Vertex_47_CB2((uint)(2)).w;
  r0.w = BA_Vertex_47_CB2((uint)(7)).y + -r1.y;
  r0.w = BA_Vertex_47_CB2((uint)(7)).x * r0.w;
  r1.x = 1 + -BA_Vertex_47_CB2((uint)(7)).x;
  r0.w = r1.y * r1.x + r0.w;
  r0.w = r0.w / BA_Vertex_47_CB2((uint)(7)).y;
  r1.x = 1 + -BA_Vertex_47_CB2((uint)(17)).x;
  r0.w = r1.x + -r0.w;
  o2.w = saturate(BA_Vertex_47_CB2((uint)(7)).z * r0.w);
  r0.z = BA_Vertex_47_CB0((uint)(21)).x * r0.y;
  r0.xy = r0.xz + r2.ww;
  r0.z = 0.5 / r2.w;
  r0.w = r2.z / BA_Vertex_47_CB0((uint)(21)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_47_CB0((uint)(21)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.x = saturate(r0.w * BA_Vertex_47_CB0((uint)(59)).z + BA_Vertex_47_CB0((uint)(59)).w);
  o2.yz = r0.xy * r0.zz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_48_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  return value;
}

float4 BA_Vertex_48_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_48_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_48_CB1((uint)(5)).xyz * BA_Vertex_48_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_48_CB1((uint)(4)).xyz * BA_Vertex_48_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_48_CB1((uint)(6)).xyz * BA_Vertex_48_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_48_CB1((uint)(7)).xyz * BA_Vertex_48_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_48_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_48_CB1((uint)(5)).xyz * BA_Vertex_48_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_48_CB1((uint)(4)).xyz * BA_Vertex_48_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_48_CB1((uint)(6)).xyz * BA_Vertex_48_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_48_CB1((uint)(7)).xyz * BA_Vertex_48_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_48_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_48_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_48_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_48_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_48_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_48_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_48_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_48_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_48_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_48_CB0((uint)(22)).x / BA_Vertex_48_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.zw = r1.zw;
  r0.x = r1.z / BA_Vertex_48_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_48_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_48_CB0((uint)(59)).x * r0.x;
  o1.xyz = BA_Vertex_48_CB2((uint)(2)).xyz * BA_Vertex_48_CB0((uint)(10)).xyz;
  o1.w = BA_Vertex_48_CB2((uint)(2)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_49_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  return value;
}

float4 BA_Vertex_49_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_49_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_49_CB1((uint)(5)).xyz * BA_Vertex_49_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_49_CB1((uint)(4)).xyz * BA_Vertex_49_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_49_CB1((uint)(6)).xyz * BA_Vertex_49_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_49_CB1((uint)(7)).xyz * BA_Vertex_49_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_49_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_49_CB1((uint)(5)).xyz * BA_Vertex_49_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_49_CB1((uint)(4)).xyz * BA_Vertex_49_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_49_CB1((uint)(6)).xyz * BA_Vertex_49_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_49_CB1((uint)(7)).xyz * BA_Vertex_49_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_49_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_49_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_49_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_49_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_49_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_49_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_49_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_49_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_49_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_49_CB0((uint)(22)).x / BA_Vertex_49_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.zw = r1.zw;
  r0.x = r1.z / BA_Vertex_49_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_49_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_49_CB0((uint)(59)).x * r0.x;
  o1.xyz = BA_Vertex_49_CB2((uint)(2)).xyz * BA_Vertex_49_CB0((uint)(10)).xyz;
  o1.w = BA_Vertex_49_CB2((uint)(2)).w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_50_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 7u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_50_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_50_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_50_CB1((uint)(5)).xyz * BA_Vertex_50_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_50_CB1((uint)(4)).xyz * BA_Vertex_50_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_50_CB1((uint)(6)).xyz * BA_Vertex_50_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_50_CB1((uint)(7)).xyz * BA_Vertex_50_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_50_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_50_CB1((uint)(5)).xyz * BA_Vertex_50_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_50_CB1((uint)(4)).xyz * BA_Vertex_50_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_50_CB1((uint)(6)).xyz * BA_Vertex_50_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_50_CB1((uint)(7)).xyz * BA_Vertex_50_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_50_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_50_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_50_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_50_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_50_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_50_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_50_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_50_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_50_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_50_CB0((uint)(22)).x / BA_Vertex_50_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  o0.zw = r2.zw;
  o1.xyz = BA_Vertex_50_CB2((uint)(2)).xyz * BA_Vertex_50_CB0((uint)(10)).xyz;
  o1.w = BA_Vertex_50_CB2((uint)(2)).w;
  r0.w = BA_Vertex_50_CB2((uint)(7)).y + -r1.y;
  r0.w = BA_Vertex_50_CB2((uint)(7)).x * r0.w;
  r1.x = 1 + -BA_Vertex_50_CB2((uint)(7)).x;
  r0.w = r1.y * r1.x + r0.w;
  r0.w = r0.w / BA_Vertex_50_CB2((uint)(7)).y;
  r1.x = 1 + -BA_Vertex_50_CB2((uint)(17)).x;
  r0.w = r1.x + -r0.w;
  o2.w = saturate(BA_Vertex_50_CB2((uint)(7)).z * r0.w);
  r0.z = BA_Vertex_50_CB0((uint)(21)).x * r0.y;
  r0.xy = r0.xz + r2.ww;
  r0.z = 0.5 / r2.w;
  r0.w = r2.z / BA_Vertex_50_CB0((uint)(21)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_50_CB0((uint)(21)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.x = BA_Vertex_50_CB0((uint)(59)).x * r0.w;
  o2.yz = r0.xy * r0.zz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_51_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 7u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_51_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_51_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_51_CB1((uint)(5)).xyz * BA_Vertex_51_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_51_CB1((uint)(4)).xyz * BA_Vertex_51_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_51_CB1((uint)(6)).xyz * BA_Vertex_51_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_51_CB1((uint)(7)).xyz * BA_Vertex_51_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_51_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_51_CB1((uint)(5)).xyz * BA_Vertex_51_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_51_CB1((uint)(4)).xyz * BA_Vertex_51_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_51_CB1((uint)(6)).xyz * BA_Vertex_51_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_51_CB1((uint)(7)).xyz * BA_Vertex_51_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_51_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_51_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_51_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_51_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_51_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_51_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_51_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_51_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_51_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_51_CB0((uint)(22)).x / BA_Vertex_51_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  o0.zw = r2.zw;
  o1.xyz = BA_Vertex_51_CB2((uint)(2)).xyz * BA_Vertex_51_CB0((uint)(10)).xyz;
  o1.w = BA_Vertex_51_CB2((uint)(2)).w;
  r0.w = BA_Vertex_51_CB2((uint)(7)).y + -r1.y;
  r0.w = BA_Vertex_51_CB2((uint)(7)).x * r0.w;
  r1.x = 1 + -BA_Vertex_51_CB2((uint)(7)).x;
  r0.w = r1.y * r1.x + r0.w;
  r0.w = r0.w / BA_Vertex_51_CB2((uint)(7)).y;
  r1.x = 1 + -BA_Vertex_51_CB2((uint)(17)).x;
  r0.w = r1.x + -r0.w;
  o2.w = saturate(BA_Vertex_51_CB2((uint)(7)).z * r0.w);
  r0.z = BA_Vertex_51_CB0((uint)(21)).x * r0.y;
  r0.xy = r0.xz + r2.ww;
  r0.z = 0.5 / r2.w;
  r0.w = r2.z / BA_Vertex_51_CB0((uint)(21)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_51_CB0((uint)(21)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.x = BA_Vertex_51_CB0((uint)(59)).x * r0.w;
  o2.yz = r0.xy * r0.zz;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = v1.w;
  o0.xyzw = r0.xxxy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_82_CB1(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_DissolveTex_TexelSize.x, _DissolveTex_TexelSize.y, _DissolveTex_TexelSize.z, _DissolveTex_TexelSize.w);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_82_CB0(uint i)
{
  float4 value = 0;
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_82_CB0((uint)(22)).xy * v2.yz;
  r0.xy = r0.xy / BA_Fragment_82_CB1((uint)(6)).zw;
  r0.xyzw = _DissolveTex.SampleBias(sampler_DissolveTex, r0.xy, BA_Fragment_82_CB0((uint)(23)).x).xyzw;
  r0.x = r0.x * v2.w + -BA_Fragment_82_CB1((uint)(17)).x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_83_CB1(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_DissolveTex_TexelSize.x, _DissolveTex_TexelSize.y, _DissolveTex_TexelSize.z, _DissolveTex_TexelSize.w);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_83_CB0(uint i)
{
  float4 value = 0;
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_83_CB0((uint)(22)).xy * v2.yz;
  r0.xy = r0.xy / BA_Fragment_83_CB1((uint)(6)).zw;
  r0.xyzw = _DissolveTex.SampleBias(sampler_DissolveTex, r0.xy, BA_Fragment_83_CB0((uint)(23)).x).xyzw;
  r0.x = r0.x * v2.w + -BA_Fragment_83_CB1((uint)(17)).x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.y = v1.w;
  o0.xyzw = r0.xxxy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_84_CB0(uint i)
{
  float4 value = 0;
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = -BA_Fragment_84_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_84_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_85_CB0(uint i)
{
  float4 value = 0;
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.xyz = -BA_Fragment_85_CB0((uint)(60)).xyz + r0.xxx;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_85_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_86_CB1(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_DissolveTex_TexelSize.x, _DissolveTex_TexelSize.y, _DissolveTex_TexelSize.z, _DissolveTex_TexelSize.w);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_86_CB0(uint i)
{
  float4 value = 0;
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_86_CB0((uint)(22)).xy * v2.yz;
  r0.xy = r0.xy / BA_Fragment_86_CB1((uint)(6)).zw;
  r0.xyzw = _DissolveTex.SampleBias(sampler_DissolveTex, r0.xy, BA_Fragment_86_CB0((uint)(23)).x).xyzw;
  r0.x = r0.x * v2.w + -BA_Fragment_86_CB1((uint)(17)).x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_86_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_86_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_87_CB1(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_DissolveTex_TexelSize.x, _DissolveTex_TexelSize.y, _DissolveTex_TexelSize.z, _DissolveTex_TexelSize.w);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_87_CB0(uint i)
{
  float4 value = 0;
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_87_CB0((uint)(22)).xy * v2.yz;
  r0.xy = r0.xy / BA_Fragment_87_CB1((uint)(6)).zw;
  r0.xyzw = _DissolveTex.SampleBias(sampler_DissolveTex, r0.xy, BA_Fragment_87_CB0((uint)(23)).x).xyzw;
  r0.x = r0.x * v2.w + -BA_Fragment_87_CB1((uint)(17)).x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.xyz = -BA_Fragment_87_CB0((uint)(60)).xyz + r0.xxx;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_87_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_88_CB0(uint i)
{
  float4 value = 0;
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_88_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_88_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_89_CB0(uint i)
{
  float4 value = 0;
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.y = dot(v1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.yzw = -BA_Fragment_89_CB0((uint)(60)).xyz + r0.yyy;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_89_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_90_CB1(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_DissolveTex_TexelSize.x, _DissolveTex_TexelSize.y, _DissolveTex_TexelSize.z, _DissolveTex_TexelSize.w);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_90_CB0(uint i)
{
  float4 value = 0;
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_90_CB0((uint)(22)).xy * v2.yz;
  r0.xy = r0.xy / BA_Fragment_90_CB1((uint)(6)).zw;
  r0.xyzw = _DissolveTex.SampleBias(sampler_DissolveTex, r0.xy, BA_Fragment_90_CB0((uint)(23)).x).xyzw;
  r0.x = r0.x * v2.w + -BA_Fragment_90_CB1((uint)(17)).x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_90_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_90_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_91_CB1(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_DissolveTex_TexelSize.x, _DissolveTex_TexelSize.y, _DissolveTex_TexelSize.z, _DissolveTex_TexelSize.w);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_91_CB0(uint i)
{
  float4 value = 0;
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_91_CB0((uint)(22)).xy * v2.yz;
  r0.xy = r0.xy / BA_Fragment_91_CB1((uint)(6)).zw;
  r0.xyzw = _DissolveTex.SampleBias(sampler_DissolveTex, r0.xy, BA_Fragment_91_CB0((uint)(23)).x).xyzw;
  r0.x = r0.x * v2.w + -BA_Fragment_91_CB1((uint)(17)).x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.y = dot(v1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.yzw = -BA_Fragment_91_CB0((uint)(60)).xyz + r0.yyy;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_91_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
