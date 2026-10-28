// Exact names and types from the original compiled parameter metadata.
float _Cutoff;
float _DitherThreshold;
float3 _MxOutRimLightDir;
float4 _MxOutRimLightPosRange;
float4 _MxOutlineRimLightColor;
float2 _MxOutlineRimLightSpotAngle;
float4 _OutlineTint;
float _OutlineZCorrection;
Texture2D<float4> _MainTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_145_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_145_CB1(uint i)
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

float4 BA_Vertex_145_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_145_CB1((uint)(5)).xyz * BA_Vertex_145_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_145_CB1((uint)(4)).xyz * BA_Vertex_145_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_145_CB1((uint)(6)).xyz * BA_Vertex_145_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_145_CB1((uint)(7)).xyz * BA_Vertex_145_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_145_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_145_CB1((uint)(5)).xyz * BA_Vertex_145_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_145_CB1((uint)(4)).xyz * BA_Vertex_145_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_145_CB1((uint)(6)).xyz * BA_Vertex_145_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_145_CB1((uint)(7)).xyz * BA_Vertex_145_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_145_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_145_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_145_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_145_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_145_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_145_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_145_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_145_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_145_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_145_CB0((uint)(22)).x / BA_Vertex_145_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_145_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_145_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_145_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_146_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_146_CB1(uint i)
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

float4 BA_Vertex_146_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_146_CB1((uint)(5)).xyz * BA_Vertex_146_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_146_CB1((uint)(4)).xyz * BA_Vertex_146_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_146_CB1((uint)(6)).xyz * BA_Vertex_146_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_146_CB1((uint)(7)).xyz * BA_Vertex_146_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_146_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_146_CB1((uint)(5)).xyz * BA_Vertex_146_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_146_CB1((uint)(4)).xyz * BA_Vertex_146_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_146_CB1((uint)(6)).xyz * BA_Vertex_146_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_146_CB1((uint)(7)).xyz * BA_Vertex_146_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_146_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_146_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_146_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_146_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_146_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_146_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_146_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_146_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_146_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_146_CB0((uint)(22)).x / BA_Vertex_146_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_146_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_146_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_146_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  o2.x = 0;
  p2.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_147_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_147_CB1(uint i)
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

float4 BA_Vertex_147_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_147_CB1((uint)(5)).xyz * BA_Vertex_147_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_147_CB1((uint)(4)).xyz * BA_Vertex_147_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_147_CB1((uint)(6)).xyz * BA_Vertex_147_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_147_CB1((uint)(7)).xyz * BA_Vertex_147_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_147_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_147_CB1((uint)(5)).xyz * BA_Vertex_147_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_147_CB1((uint)(4)).xyz * BA_Vertex_147_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_147_CB1((uint)(6)).xyz * BA_Vertex_147_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_147_CB1((uint)(7)).xyz * BA_Vertex_147_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_147_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_147_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_147_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_147_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_147_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_147_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_147_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_147_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_147_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_147_CB0((uint)(22)).x / BA_Vertex_147_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_147_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_147_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_147_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_148_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_148_CB1(uint i)
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

float4 BA_Vertex_148_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_148_CB1((uint)(5)).xyz * BA_Vertex_148_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_148_CB1((uint)(4)).xyz * BA_Vertex_148_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_148_CB1((uint)(6)).xyz * BA_Vertex_148_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_148_CB1((uint)(7)).xyz * BA_Vertex_148_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_148_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_148_CB1((uint)(5)).xyz * BA_Vertex_148_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_148_CB1((uint)(4)).xyz * BA_Vertex_148_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_148_CB1((uint)(6)).xyz * BA_Vertex_148_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_148_CB1((uint)(7)).xyz * BA_Vertex_148_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_148_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_148_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_148_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_148_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_148_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_148_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_148_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_148_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_148_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_148_CB0((uint)(22)).x / BA_Vertex_148_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_148_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_148_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_148_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  p2.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_149_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_149_CB1(uint i)
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

float4 BA_Vertex_149_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_149_CB1((uint)(5)).xyz * BA_Vertex_149_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_149_CB1((uint)(4)).xyz * BA_Vertex_149_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_149_CB1((uint)(6)).xyz * BA_Vertex_149_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_149_CB1((uint)(7)).xyz * BA_Vertex_149_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_149_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_149_CB1((uint)(5)).xyz * BA_Vertex_149_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_149_CB1((uint)(4)).xyz * BA_Vertex_149_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_149_CB1((uint)(6)).xyz * BA_Vertex_149_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_149_CB1((uint)(7)).xyz * BA_Vertex_149_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_149_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_149_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_149_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_149_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_149_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_149_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_149_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_149_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_149_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_149_CB0((uint)(22)).x / BA_Vertex_149_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_149_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_149_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_149_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_149_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_150_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_150_CB1(uint i)
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

float4 BA_Vertex_150_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_150_CB1((uint)(5)).xyz * BA_Vertex_150_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_150_CB1((uint)(4)).xyz * BA_Vertex_150_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_150_CB1((uint)(6)).xyz * BA_Vertex_150_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_150_CB1((uint)(7)).xyz * BA_Vertex_150_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_150_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_150_CB1((uint)(5)).xyz * BA_Vertex_150_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_150_CB1((uint)(4)).xyz * BA_Vertex_150_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_150_CB1((uint)(6)).xyz * BA_Vertex_150_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_150_CB1((uint)(7)).xyz * BA_Vertex_150_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_150_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_150_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_150_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_150_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_150_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_150_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_150_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_150_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_150_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_150_CB0((uint)(22)).x / BA_Vertex_150_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_150_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_150_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_150_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_150_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  BA_o2_x.x = 0;
  BA_o2_zw.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_151_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_151_CB1(uint i)
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

float4 BA_Vertex_151_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_151_CB1((uint)(5)).xyz * BA_Vertex_151_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_151_CB1((uint)(4)).xyz * BA_Vertex_151_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_151_CB1((uint)(6)).xyz * BA_Vertex_151_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_151_CB1((uint)(7)).xyz * BA_Vertex_151_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_151_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_151_CB1((uint)(5)).xyz * BA_Vertex_151_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_151_CB1((uint)(4)).xyz * BA_Vertex_151_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_151_CB1((uint)(6)).xyz * BA_Vertex_151_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_151_CB1((uint)(7)).xyz * BA_Vertex_151_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_151_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_151_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_151_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_151_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_151_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_151_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_151_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_151_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_151_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_151_CB0((uint)(22)).x / BA_Vertex_151_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_151_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_151_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_151_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_151_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_152_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_152_CB1(uint i)
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

float4 BA_Vertex_152_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_152_CB1((uint)(5)).xyz * BA_Vertex_152_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_152_CB1((uint)(4)).xyz * BA_Vertex_152_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_152_CB1((uint)(6)).xyz * BA_Vertex_152_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_152_CB1((uint)(7)).xyz * BA_Vertex_152_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_152_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_152_CB1((uint)(5)).xyz * BA_Vertex_152_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_152_CB1((uint)(4)).xyz * BA_Vertex_152_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_152_CB1((uint)(6)).xyz * BA_Vertex_152_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_152_CB1((uint)(7)).xyz * BA_Vertex_152_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_152_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_152_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_152_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_152_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_152_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_152_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_152_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_152_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_152_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_152_CB0((uint)(22)).x / BA_Vertex_152_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_152_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_152_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_152_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_152_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  BA_o2_x.x = 0;
  BA_o2_zw.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_153_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_153_CB1(uint i)
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

float4 BA_Vertex_153_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_153_CB1((uint)(5)).xyz * BA_Vertex_153_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_153_CB1((uint)(4)).xyz * BA_Vertex_153_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_153_CB1((uint)(6)).xyz * BA_Vertex_153_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_153_CB1((uint)(7)).xyz * BA_Vertex_153_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_153_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_153_CB1((uint)(5)).xyz * BA_Vertex_153_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_153_CB1((uint)(4)).xyz * BA_Vertex_153_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_153_CB1((uint)(6)).xyz * BA_Vertex_153_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_153_CB1((uint)(7)).xyz * BA_Vertex_153_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_153_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_153_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_153_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_153_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_153_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_153_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_153_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_153_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_153_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_153_CB0((uint)(22)).x / BA_Vertex_153_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_153_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_153_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_153_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_153_CB0((uint)(59)).z + BA_Vertex_153_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_153_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_153_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_154_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_154_CB1(uint i)
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

float4 BA_Vertex_154_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_154_CB1((uint)(5)).xyz * BA_Vertex_154_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_154_CB1((uint)(4)).xyz * BA_Vertex_154_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_154_CB1((uint)(6)).xyz * BA_Vertex_154_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_154_CB1((uint)(7)).xyz * BA_Vertex_154_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_154_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_154_CB1((uint)(5)).xyz * BA_Vertex_154_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_154_CB1((uint)(4)).xyz * BA_Vertex_154_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_154_CB1((uint)(6)).xyz * BA_Vertex_154_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_154_CB1((uint)(7)).xyz * BA_Vertex_154_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_154_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_154_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_154_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_154_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_154_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_154_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_154_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_154_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_154_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_154_CB0((uint)(22)).x / BA_Vertex_154_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_154_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_154_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_154_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_154_CB0((uint)(59)).z + BA_Vertex_154_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_154_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_154_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  p2.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_155_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_155_CB1(uint i)
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

float4 BA_Vertex_155_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_155_CB1((uint)(5)).xyz * BA_Vertex_155_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_155_CB1((uint)(4)).xyz * BA_Vertex_155_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_155_CB1((uint)(6)).xyz * BA_Vertex_155_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_155_CB1((uint)(7)).xyz * BA_Vertex_155_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_155_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_155_CB1((uint)(5)).xyz * BA_Vertex_155_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_155_CB1((uint)(4)).xyz * BA_Vertex_155_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_155_CB1((uint)(6)).xyz * BA_Vertex_155_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_155_CB1((uint)(7)).xyz * BA_Vertex_155_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_155_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_155_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_155_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_155_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_155_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_155_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_155_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_155_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_155_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_155_CB0((uint)(22)).x / BA_Vertex_155_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_155_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_155_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_155_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_155_CB0((uint)(59)).z + BA_Vertex_155_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_155_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_155_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_156_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_156_CB1(uint i)
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

float4 BA_Vertex_156_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_156_CB1((uint)(5)).xyz * BA_Vertex_156_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_156_CB1((uint)(4)).xyz * BA_Vertex_156_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_156_CB1((uint)(6)).xyz * BA_Vertex_156_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_156_CB1((uint)(7)).xyz * BA_Vertex_156_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_156_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_156_CB1((uint)(5)).xyz * BA_Vertex_156_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_156_CB1((uint)(4)).xyz * BA_Vertex_156_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_156_CB1((uint)(6)).xyz * BA_Vertex_156_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_156_CB1((uint)(7)).xyz * BA_Vertex_156_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_156_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_156_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_156_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_156_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_156_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_156_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_156_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_156_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_156_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_156_CB0((uint)(22)).x / BA_Vertex_156_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_156_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_156_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_156_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_156_CB0((uint)(59)).z + BA_Vertex_156_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_156_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_156_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  p2.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_157_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_157_CB1(uint i)
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

float4 BA_Vertex_157_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_157_CB1((uint)(5)).xyz * BA_Vertex_157_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_157_CB1((uint)(4)).xyz * BA_Vertex_157_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_157_CB1((uint)(6)).xyz * BA_Vertex_157_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_157_CB1((uint)(7)).xyz * BA_Vertex_157_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_157_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_157_CB1((uint)(5)).xyz * BA_Vertex_157_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_157_CB1((uint)(4)).xyz * BA_Vertex_157_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_157_CB1((uint)(6)).xyz * BA_Vertex_157_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_157_CB1((uint)(7)).xyz * BA_Vertex_157_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_157_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_157_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_157_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_157_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_157_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_157_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_157_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_157_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_157_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_157_CB0((uint)(22)).x / BA_Vertex_157_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_157_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_157_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_157_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_157_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_157_CB0((uint)(59)).z + BA_Vertex_157_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_157_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_157_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_158_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_158_CB1(uint i)
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

float4 BA_Vertex_158_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_158_CB1((uint)(5)).xyz * BA_Vertex_158_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_158_CB1((uint)(4)).xyz * BA_Vertex_158_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_158_CB1((uint)(6)).xyz * BA_Vertex_158_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_158_CB1((uint)(7)).xyz * BA_Vertex_158_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_158_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_158_CB1((uint)(5)).xyz * BA_Vertex_158_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_158_CB1((uint)(4)).xyz * BA_Vertex_158_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_158_CB1((uint)(6)).xyz * BA_Vertex_158_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_158_CB1((uint)(7)).xyz * BA_Vertex_158_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_158_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_158_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_158_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_158_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_158_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_158_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_158_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_158_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_158_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_158_CB0((uint)(22)).x / BA_Vertex_158_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_158_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_158_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_158_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_158_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = saturate(r0.x * BA_Vertex_158_CB0((uint)(59)).z + BA_Vertex_158_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_158_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_158_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  BA_o2_zw.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_159_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_159_CB1(uint i)
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

float4 BA_Vertex_159_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_159_CB1((uint)(5)).xyz * BA_Vertex_159_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_159_CB1((uint)(4)).xyz * BA_Vertex_159_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_159_CB1((uint)(6)).xyz * BA_Vertex_159_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_159_CB1((uint)(7)).xyz * BA_Vertex_159_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_159_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_159_CB1((uint)(5)).xyz * BA_Vertex_159_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_159_CB1((uint)(4)).xyz * BA_Vertex_159_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_159_CB1((uint)(6)).xyz * BA_Vertex_159_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_159_CB1((uint)(7)).xyz * BA_Vertex_159_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_159_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_159_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_159_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_159_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_159_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_159_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_159_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_159_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_159_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_159_CB0((uint)(22)).x / BA_Vertex_159_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_159_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_159_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_159_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_159_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_159_CB0((uint)(59)).z + BA_Vertex_159_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_159_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_159_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_160_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_160_CB1(uint i)
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

float4 BA_Vertex_160_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_160_CB1((uint)(5)).xyz * BA_Vertex_160_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_160_CB1((uint)(4)).xyz * BA_Vertex_160_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_160_CB1((uint)(6)).xyz * BA_Vertex_160_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_160_CB1((uint)(7)).xyz * BA_Vertex_160_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_160_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_160_CB1((uint)(5)).xyz * BA_Vertex_160_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_160_CB1((uint)(4)).xyz * BA_Vertex_160_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_160_CB1((uint)(6)).xyz * BA_Vertex_160_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_160_CB1((uint)(7)).xyz * BA_Vertex_160_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_160_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_160_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_160_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_160_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_160_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_160_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_160_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_160_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_160_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_160_CB0((uint)(22)).x / BA_Vertex_160_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_160_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_160_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_160_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_160_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = saturate(r0.x * BA_Vertex_160_CB0((uint)(59)).z + BA_Vertex_160_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_160_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_160_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  BA_o2_zw.xy = v3.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_161_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_161_CB1(uint i)
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

float4 BA_Vertex_161_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_161_CB1((uint)(5)).xyz * BA_Vertex_161_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_161_CB1((uint)(4)).xyz * BA_Vertex_161_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_161_CB1((uint)(6)).xyz * BA_Vertex_161_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_161_CB1((uint)(7)).xyz * BA_Vertex_161_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_161_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_161_CB1((uint)(5)).xyz * BA_Vertex_161_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_161_CB1((uint)(4)).xyz * BA_Vertex_161_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_161_CB1((uint)(6)).xyz * BA_Vertex_161_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_161_CB1((uint)(7)).xyz * BA_Vertex_161_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_161_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_161_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_161_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_161_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_161_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_161_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_161_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_161_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_161_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_161_CB0((uint)(22)).x / BA_Vertex_161_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_161_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_161_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_161_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_161_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_161_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_161_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_162_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_162_CB1(uint i)
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

float4 BA_Vertex_162_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_162_CB1((uint)(5)).xyz * BA_Vertex_162_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_162_CB1((uint)(4)).xyz * BA_Vertex_162_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_162_CB1((uint)(6)).xyz * BA_Vertex_162_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_162_CB1((uint)(7)).xyz * BA_Vertex_162_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_162_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_162_CB1((uint)(5)).xyz * BA_Vertex_162_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_162_CB1((uint)(4)).xyz * BA_Vertex_162_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_162_CB1((uint)(6)).xyz * BA_Vertex_162_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_162_CB1((uint)(7)).xyz * BA_Vertex_162_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_162_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_162_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_162_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_162_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_162_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_162_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_162_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_162_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_162_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_162_CB0((uint)(22)).x / BA_Vertex_162_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_162_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_162_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_162_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_162_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_162_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_162_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  p2.xy = v3.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_163_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_163_CB1(uint i)
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

float4 BA_Vertex_163_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
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

  r0.xyz = BA_Vertex_163_CB1((uint)(5)).xyz * BA_Vertex_163_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_163_CB1((uint)(4)).xyz * BA_Vertex_163_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_163_CB1((uint)(6)).xyz * BA_Vertex_163_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_163_CB1((uint)(7)).xyz * BA_Vertex_163_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_163_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_163_CB1((uint)(5)).xyz * BA_Vertex_163_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_163_CB1((uint)(4)).xyz * BA_Vertex_163_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_163_CB1((uint)(6)).xyz * BA_Vertex_163_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_163_CB1((uint)(7)).xyz * BA_Vertex_163_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_163_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_163_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_163_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_163_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_163_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_163_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_163_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_163_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_163_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_163_CB0((uint)(22)).x / BA_Vertex_163_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_163_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_163_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_163_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_163_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_163_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_163_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_164_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_164_CB1(uint i)
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

float4 BA_Vertex_164_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_164_CB1((uint)(5)).xyz * BA_Vertex_164_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_164_CB1((uint)(4)).xyz * BA_Vertex_164_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_164_CB1((uint)(6)).xyz * BA_Vertex_164_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_164_CB1((uint)(7)).xyz * BA_Vertex_164_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_164_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_164_CB1((uint)(5)).xyz * BA_Vertex_164_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_164_CB1((uint)(4)).xyz * BA_Vertex_164_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_164_CB1((uint)(6)).xyz * BA_Vertex_164_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_164_CB1((uint)(7)).xyz * BA_Vertex_164_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_164_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_164_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_164_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_164_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_164_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_164_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_164_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_164_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_164_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_164_CB0((uint)(22)).x / BA_Vertex_164_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_164_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_164_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_164_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_164_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_164_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_164_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  p2.xy = v3.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_165_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_165_CB1(uint i)
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

float4 BA_Vertex_165_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_165_CB1((uint)(5)).xyz * BA_Vertex_165_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_165_CB1((uint)(4)).xyz * BA_Vertex_165_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_165_CB1((uint)(6)).xyz * BA_Vertex_165_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_165_CB1((uint)(7)).xyz * BA_Vertex_165_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_165_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_165_CB1((uint)(5)).xyz * BA_Vertex_165_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_165_CB1((uint)(4)).xyz * BA_Vertex_165_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_165_CB1((uint)(6)).xyz * BA_Vertex_165_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_165_CB1((uint)(7)).xyz * BA_Vertex_165_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_165_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_165_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_165_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_165_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_165_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_165_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_165_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_165_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_165_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_165_CB0((uint)(22)).x / BA_Vertex_165_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_165_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_165_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_165_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_165_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_165_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_165_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_165_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_166_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_166_CB1(uint i)
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

float4 BA_Vertex_166_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_166_CB1((uint)(5)).xyz * BA_Vertex_166_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_166_CB1((uint)(4)).xyz * BA_Vertex_166_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_166_CB1((uint)(6)).xyz * BA_Vertex_166_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_166_CB1((uint)(7)).xyz * BA_Vertex_166_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_166_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_166_CB1((uint)(5)).xyz * BA_Vertex_166_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_166_CB1((uint)(4)).xyz * BA_Vertex_166_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_166_CB1((uint)(6)).xyz * BA_Vertex_166_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_166_CB1((uint)(7)).xyz * BA_Vertex_166_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_166_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_166_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_166_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_166_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_166_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_166_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_166_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_166_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_166_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_166_CB0((uint)(22)).x / BA_Vertex_166_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_166_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_166_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_166_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_166_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = BA_Vertex_166_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_166_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_166_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  BA_o2_zw.xy = v3.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_167_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_167_CB1(uint i)
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

float4 BA_Vertex_167_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_167_CB1((uint)(5)).xyz * BA_Vertex_167_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_167_CB1((uint)(4)).xyz * BA_Vertex_167_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_167_CB1((uint)(6)).xyz * BA_Vertex_167_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_167_CB1((uint)(7)).xyz * BA_Vertex_167_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_167_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_167_CB1((uint)(5)).xyz * BA_Vertex_167_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_167_CB1((uint)(4)).xyz * BA_Vertex_167_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_167_CB1((uint)(6)).xyz * BA_Vertex_167_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_167_CB1((uint)(7)).xyz * BA_Vertex_167_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_167_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_167_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_167_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_167_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_167_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_167_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_167_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_167_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_167_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_167_CB0((uint)(22)).x / BA_Vertex_167_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_167_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_167_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_167_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_167_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_167_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_167_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_167_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_168_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_168_CB1(uint i)
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

float4 BA_Vertex_168_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_168_CB1((uint)(5)).xyz * BA_Vertex_168_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_168_CB1((uint)(4)).xyz * BA_Vertex_168_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_168_CB1((uint)(6)).xyz * BA_Vertex_168_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_168_CB1((uint)(7)).xyz * BA_Vertex_168_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_168_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_168_CB1((uint)(5)).xyz * BA_Vertex_168_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_168_CB1((uint)(4)).xyz * BA_Vertex_168_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_168_CB1((uint)(6)).xyz * BA_Vertex_168_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_168_CB1((uint)(7)).xyz * BA_Vertex_168_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_168_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_168_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_168_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_168_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_168_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_168_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_168_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_168_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_168_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_168_CB0((uint)(22)).x / BA_Vertex_168_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_168_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_168_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_168_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_168_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = BA_Vertex_168_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_168_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_168_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  BA_o2_zw.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_169_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_169_CB1(uint i)
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

float4 BA_Vertex_169_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_169_CB1((uint)(5)).xyz * BA_Vertex_169_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_169_CB1((uint)(4)).xyz * BA_Vertex_169_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_169_CB1((uint)(6)).xyz * BA_Vertex_169_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_169_CB1((uint)(7)).xyz * BA_Vertex_169_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_169_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_169_CB1((uint)(5)).xyz * BA_Vertex_169_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_169_CB1((uint)(4)).xyz * BA_Vertex_169_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_169_CB1((uint)(6)).xyz * BA_Vertex_169_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_169_CB1((uint)(7)).xyz * BA_Vertex_169_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_169_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_169_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_169_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_169_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_169_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_169_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_169_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_169_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_169_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_169_CB0((uint)(22)).x / BA_Vertex_169_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_169_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_169_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_169_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_169_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_169_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_169_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_170_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_170_CB1(uint i)
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

float4 BA_Vertex_170_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_170_CB1((uint)(5)).xyz * BA_Vertex_170_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_170_CB1((uint)(4)).xyz * BA_Vertex_170_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_170_CB1((uint)(6)).xyz * BA_Vertex_170_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_170_CB1((uint)(7)).xyz * BA_Vertex_170_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_170_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_170_CB1((uint)(5)).xyz * BA_Vertex_170_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_170_CB1((uint)(4)).xyz * BA_Vertex_170_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_170_CB1((uint)(6)).xyz * BA_Vertex_170_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_170_CB1((uint)(7)).xyz * BA_Vertex_170_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_170_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_170_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_170_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_170_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_170_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_170_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_170_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_170_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_170_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_170_CB0((uint)(22)).x / BA_Vertex_170_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_170_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_170_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_170_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  o2.x = 0;
  p2.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_170_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_170_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_170_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_171_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_171_CB1(uint i)
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

float4 BA_Vertex_171_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_171_CB1((uint)(5)).xyz * BA_Vertex_171_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_171_CB1((uint)(4)).xyz * BA_Vertex_171_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_171_CB1((uint)(6)).xyz * BA_Vertex_171_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_171_CB1((uint)(7)).xyz * BA_Vertex_171_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_171_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_171_CB1((uint)(5)).xyz * BA_Vertex_171_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_171_CB1((uint)(4)).xyz * BA_Vertex_171_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_171_CB1((uint)(6)).xyz * BA_Vertex_171_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_171_CB1((uint)(7)).xyz * BA_Vertex_171_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_171_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_171_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_171_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_171_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_171_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_171_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_171_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_171_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_171_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_171_CB0((uint)(22)).x / BA_Vertex_171_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_171_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_171_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_171_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_171_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_171_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_171_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_172_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_172_CB1(uint i)
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

float4 BA_Vertex_172_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_172_CB1((uint)(5)).xyz * BA_Vertex_172_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_172_CB1((uint)(4)).xyz * BA_Vertex_172_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_172_CB1((uint)(6)).xyz * BA_Vertex_172_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_172_CB1((uint)(7)).xyz * BA_Vertex_172_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_172_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_172_CB1((uint)(5)).xyz * BA_Vertex_172_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_172_CB1((uint)(4)).xyz * BA_Vertex_172_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_172_CB1((uint)(6)).xyz * BA_Vertex_172_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_172_CB1((uint)(7)).xyz * BA_Vertex_172_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_172_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_172_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_172_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_172_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_172_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_172_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_172_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_172_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_172_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_172_CB0((uint)(22)).x / BA_Vertex_172_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_172_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_172_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_172_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  p2.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_172_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_172_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_172_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_173_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_173_CB1(uint i)
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

float4 BA_Vertex_173_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_173_CB1((uint)(5)).xyz * BA_Vertex_173_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_173_CB1((uint)(4)).xyz * BA_Vertex_173_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_173_CB1((uint)(6)).xyz * BA_Vertex_173_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_173_CB1((uint)(7)).xyz * BA_Vertex_173_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_173_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_173_CB1((uint)(5)).xyz * BA_Vertex_173_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_173_CB1((uint)(4)).xyz * BA_Vertex_173_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_173_CB1((uint)(6)).xyz * BA_Vertex_173_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_173_CB1((uint)(7)).xyz * BA_Vertex_173_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_173_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_173_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_173_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_173_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_173_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_173_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_173_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_173_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_173_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_173_CB0((uint)(22)).x / BA_Vertex_173_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_173_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_173_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_173_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_173_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  o2.x = 0;
  r0.x = dot(v2.xyz, BA_Vertex_173_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_173_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_173_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_174_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_174_CB1(uint i)
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

float4 BA_Vertex_174_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_174_CB1((uint)(5)).xyz * BA_Vertex_174_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_174_CB1((uint)(4)).xyz * BA_Vertex_174_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_174_CB1((uint)(6)).xyz * BA_Vertex_174_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_174_CB1((uint)(7)).xyz * BA_Vertex_174_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_174_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_174_CB1((uint)(5)).xyz * BA_Vertex_174_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_174_CB1((uint)(4)).xyz * BA_Vertex_174_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_174_CB1((uint)(6)).xyz * BA_Vertex_174_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_174_CB1((uint)(7)).xyz * BA_Vertex_174_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_174_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_174_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_174_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_174_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_174_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_174_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_174_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_174_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_174_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_174_CB0((uint)(22)).x / BA_Vertex_174_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_174_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_174_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_174_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_174_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  BA_o2_x.x = 0;
  BA_o2_zw.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_174_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_174_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_174_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_175_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_175_CB1(uint i)
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

float4 BA_Vertex_175_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_175_CB1((uint)(5)).xyz * BA_Vertex_175_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_175_CB1((uint)(4)).xyz * BA_Vertex_175_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_175_CB1((uint)(6)).xyz * BA_Vertex_175_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_175_CB1((uint)(7)).xyz * BA_Vertex_175_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_175_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_175_CB1((uint)(5)).xyz * BA_Vertex_175_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_175_CB1((uint)(4)).xyz * BA_Vertex_175_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_175_CB1((uint)(6)).xyz * BA_Vertex_175_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_175_CB1((uint)(7)).xyz * BA_Vertex_175_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_175_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_175_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_175_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_175_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_175_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_175_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_175_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_175_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_175_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_175_CB0((uint)(22)).x / BA_Vertex_175_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_175_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_175_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_175_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_175_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  r0.x = dot(v2.xyz, BA_Vertex_175_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_175_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_175_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_176_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_176_CB1(uint i)
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

float4 BA_Vertex_176_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_176_CB1((uint)(5)).xyz * BA_Vertex_176_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_176_CB1((uint)(4)).xyz * BA_Vertex_176_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_176_CB1((uint)(6)).xyz * BA_Vertex_176_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_176_CB1((uint)(7)).xyz * BA_Vertex_176_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_176_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_176_CB1((uint)(5)).xyz * BA_Vertex_176_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_176_CB1((uint)(4)).xyz * BA_Vertex_176_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_176_CB1((uint)(6)).xyz * BA_Vertex_176_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_176_CB1((uint)(7)).xyz * BA_Vertex_176_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_176_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_176_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_176_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_176_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_176_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_176_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_176_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_176_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_176_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_176_CB0((uint)(22)).x / BA_Vertex_176_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_176_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_176_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_176_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_176_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  BA_o2_x.x = 0;
  BA_o2_zw.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_176_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_176_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_176_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_177_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_177_CB1(uint i)
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

float4 BA_Vertex_177_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_177_CB1((uint)(5)).xyz * BA_Vertex_177_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_177_CB1((uint)(4)).xyz * BA_Vertex_177_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_177_CB1((uint)(6)).xyz * BA_Vertex_177_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_177_CB1((uint)(7)).xyz * BA_Vertex_177_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_177_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_177_CB1((uint)(5)).xyz * BA_Vertex_177_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_177_CB1((uint)(4)).xyz * BA_Vertex_177_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_177_CB1((uint)(6)).xyz * BA_Vertex_177_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_177_CB1((uint)(7)).xyz * BA_Vertex_177_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_177_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_177_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_177_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_177_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_177_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_177_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_177_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_177_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_177_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_177_CB0((uint)(22)).x / BA_Vertex_177_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_177_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_177_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_177_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_177_CB0((uint)(59)).z + BA_Vertex_177_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_177_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_177_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_177_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_177_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_177_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_178_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_178_CB1(uint i)
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

float4 BA_Vertex_178_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_178_CB1((uint)(5)).xyz * BA_Vertex_178_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_178_CB1((uint)(4)).xyz * BA_Vertex_178_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_178_CB1((uint)(6)).xyz * BA_Vertex_178_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_178_CB1((uint)(7)).xyz * BA_Vertex_178_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_178_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_178_CB1((uint)(5)).xyz * BA_Vertex_178_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_178_CB1((uint)(4)).xyz * BA_Vertex_178_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_178_CB1((uint)(6)).xyz * BA_Vertex_178_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_178_CB1((uint)(7)).xyz * BA_Vertex_178_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_178_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_178_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_178_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_178_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_178_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_178_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_178_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_178_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_178_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_178_CB0((uint)(22)).x / BA_Vertex_178_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_178_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_178_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_178_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_178_CB0((uint)(59)).z + BA_Vertex_178_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_178_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_178_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  p2.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_178_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_178_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_178_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_179_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_179_CB1(uint i)
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

float4 BA_Vertex_179_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_179_CB1((uint)(5)).xyz * BA_Vertex_179_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_179_CB1((uint)(4)).xyz * BA_Vertex_179_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_179_CB1((uint)(6)).xyz * BA_Vertex_179_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_179_CB1((uint)(7)).xyz * BA_Vertex_179_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_179_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_179_CB1((uint)(5)).xyz * BA_Vertex_179_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_179_CB1((uint)(4)).xyz * BA_Vertex_179_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_179_CB1((uint)(6)).xyz * BA_Vertex_179_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_179_CB1((uint)(7)).xyz * BA_Vertex_179_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_179_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_179_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_179_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_179_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_179_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_179_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_179_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_179_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_179_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_179_CB0((uint)(22)).x / BA_Vertex_179_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_179_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_179_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_179_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_179_CB0((uint)(59)).z + BA_Vertex_179_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_179_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_179_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_179_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_179_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_179_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_180_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_180_CB1(uint i)
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

float4 BA_Vertex_180_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_180_CB1((uint)(5)).xyz * BA_Vertex_180_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_180_CB1((uint)(4)).xyz * BA_Vertex_180_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_180_CB1((uint)(6)).xyz * BA_Vertex_180_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_180_CB1((uint)(7)).xyz * BA_Vertex_180_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_180_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_180_CB1((uint)(5)).xyz * BA_Vertex_180_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_180_CB1((uint)(4)).xyz * BA_Vertex_180_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_180_CB1((uint)(6)).xyz * BA_Vertex_180_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_180_CB1((uint)(7)).xyz * BA_Vertex_180_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_180_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_180_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_180_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_180_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_180_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_180_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_180_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_180_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_180_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_180_CB0((uint)(22)).x / BA_Vertex_180_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_180_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_180_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_180_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_180_CB0((uint)(59)).z + BA_Vertex_180_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_180_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_180_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  p2.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_180_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_180_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_180_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_181_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_181_CB1(uint i)
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

float4 BA_Vertex_181_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_181_CB1((uint)(5)).xyz * BA_Vertex_181_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_181_CB1((uint)(4)).xyz * BA_Vertex_181_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_181_CB1((uint)(6)).xyz * BA_Vertex_181_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_181_CB1((uint)(7)).xyz * BA_Vertex_181_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_181_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_181_CB1((uint)(5)).xyz * BA_Vertex_181_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_181_CB1((uint)(4)).xyz * BA_Vertex_181_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_181_CB1((uint)(6)).xyz * BA_Vertex_181_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_181_CB1((uint)(7)).xyz * BA_Vertex_181_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_181_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_181_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_181_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_181_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_181_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_181_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_181_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_181_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_181_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_181_CB0((uint)(22)).x / BA_Vertex_181_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_181_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_181_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_181_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_181_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_181_CB0((uint)(59)).z + BA_Vertex_181_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_181_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_181_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_181_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_181_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_181_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_182_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_182_CB1(uint i)
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

float4 BA_Vertex_182_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_182_CB1((uint)(5)).xyz * BA_Vertex_182_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_182_CB1((uint)(4)).xyz * BA_Vertex_182_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_182_CB1((uint)(6)).xyz * BA_Vertex_182_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_182_CB1((uint)(7)).xyz * BA_Vertex_182_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_182_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_182_CB1((uint)(5)).xyz * BA_Vertex_182_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_182_CB1((uint)(4)).xyz * BA_Vertex_182_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_182_CB1((uint)(6)).xyz * BA_Vertex_182_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_182_CB1((uint)(7)).xyz * BA_Vertex_182_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_182_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_182_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_182_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_182_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_182_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_182_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_182_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_182_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_182_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_182_CB0((uint)(22)).x / BA_Vertex_182_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_182_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_182_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_182_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_182_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = saturate(r0.x * BA_Vertex_182_CB0((uint)(59)).z + BA_Vertex_182_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_182_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_182_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  BA_o2_zw.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_182_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_182_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_182_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_183_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_183_CB1(uint i)
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

float4 BA_Vertex_183_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_183_CB1((uint)(5)).xyz * BA_Vertex_183_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_183_CB1((uint)(4)).xyz * BA_Vertex_183_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_183_CB1((uint)(6)).xyz * BA_Vertex_183_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_183_CB1((uint)(7)).xyz * BA_Vertex_183_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_183_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_183_CB1((uint)(5)).xyz * BA_Vertex_183_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_183_CB1((uint)(4)).xyz * BA_Vertex_183_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_183_CB1((uint)(6)).xyz * BA_Vertex_183_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_183_CB1((uint)(7)).xyz * BA_Vertex_183_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_183_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_183_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_183_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_183_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_183_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_183_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_183_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_183_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_183_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_183_CB0((uint)(22)).x / BA_Vertex_183_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_183_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_183_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_183_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_183_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_183_CB0((uint)(59)).z + BA_Vertex_183_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_183_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_183_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_183_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_183_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_183_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_184_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_184_CB1(uint i)
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

float4 BA_Vertex_184_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_184_CB1((uint)(5)).xyz * BA_Vertex_184_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_184_CB1((uint)(4)).xyz * BA_Vertex_184_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_184_CB1((uint)(6)).xyz * BA_Vertex_184_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_184_CB1((uint)(7)).xyz * BA_Vertex_184_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_184_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_184_CB1((uint)(5)).xyz * BA_Vertex_184_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_184_CB1((uint)(4)).xyz * BA_Vertex_184_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_184_CB1((uint)(6)).xyz * BA_Vertex_184_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_184_CB1((uint)(7)).xyz * BA_Vertex_184_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_184_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_184_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_184_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_184_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_184_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_184_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_184_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_184_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_184_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_184_CB0((uint)(22)).x / BA_Vertex_184_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_184_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_184_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_184_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_184_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = saturate(r0.x * BA_Vertex_184_CB0((uint)(59)).z + BA_Vertex_184_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_184_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_184_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  BA_o2_zw.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_184_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_184_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_184_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_185_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_185_CB1(uint i)
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

float4 BA_Vertex_185_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_185_CB1((uint)(5)).xyz * BA_Vertex_185_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_185_CB1((uint)(4)).xyz * BA_Vertex_185_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_185_CB1((uint)(6)).xyz * BA_Vertex_185_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_185_CB1((uint)(7)).xyz * BA_Vertex_185_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_185_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_185_CB1((uint)(5)).xyz * BA_Vertex_185_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_185_CB1((uint)(4)).xyz * BA_Vertex_185_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_185_CB1((uint)(6)).xyz * BA_Vertex_185_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_185_CB1((uint)(7)).xyz * BA_Vertex_185_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_185_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_185_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_185_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_185_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_185_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_185_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_185_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_185_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_185_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_185_CB0((uint)(22)).x / BA_Vertex_185_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_185_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_185_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_185_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_185_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_185_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_185_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_185_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_185_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_185_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_186_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_186_CB1(uint i)
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

float4 BA_Vertex_186_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_186_CB1((uint)(5)).xyz * BA_Vertex_186_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_186_CB1((uint)(4)).xyz * BA_Vertex_186_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_186_CB1((uint)(6)).xyz * BA_Vertex_186_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_186_CB1((uint)(7)).xyz * BA_Vertex_186_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_186_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_186_CB1((uint)(5)).xyz * BA_Vertex_186_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_186_CB1((uint)(4)).xyz * BA_Vertex_186_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_186_CB1((uint)(6)).xyz * BA_Vertex_186_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_186_CB1((uint)(7)).xyz * BA_Vertex_186_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_186_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_186_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_186_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_186_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_186_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_186_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_186_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_186_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_186_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_186_CB0((uint)(22)).x / BA_Vertex_186_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_186_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_186_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_186_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_186_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_186_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_186_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  p2.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_186_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_186_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_186_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_187_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_187_CB1(uint i)
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

float4 BA_Vertex_187_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_187_CB1((uint)(5)).xyz * BA_Vertex_187_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_187_CB1((uint)(4)).xyz * BA_Vertex_187_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_187_CB1((uint)(6)).xyz * BA_Vertex_187_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_187_CB1((uint)(7)).xyz * BA_Vertex_187_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_187_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_187_CB1((uint)(5)).xyz * BA_Vertex_187_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_187_CB1((uint)(4)).xyz * BA_Vertex_187_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_187_CB1((uint)(6)).xyz * BA_Vertex_187_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_187_CB1((uint)(7)).xyz * BA_Vertex_187_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_187_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_187_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_187_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_187_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_187_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_187_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_187_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_187_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_187_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_187_CB0((uint)(22)).x / BA_Vertex_187_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_187_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_187_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_187_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_187_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_187_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_187_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_187_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_187_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_187_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_188_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_188_CB1(uint i)
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

float4 BA_Vertex_188_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_188_CB1((uint)(5)).xyz * BA_Vertex_188_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_188_CB1((uint)(4)).xyz * BA_Vertex_188_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_188_CB1((uint)(6)).xyz * BA_Vertex_188_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_188_CB1((uint)(7)).xyz * BA_Vertex_188_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_188_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_188_CB1((uint)(5)).xyz * BA_Vertex_188_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_188_CB1((uint)(4)).xyz * BA_Vertex_188_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_188_CB1((uint)(6)).xyz * BA_Vertex_188_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_188_CB1((uint)(7)).xyz * BA_Vertex_188_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_188_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_188_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_188_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_188_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_188_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_188_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_188_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_188_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_188_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_188_CB0((uint)(22)).x / BA_Vertex_188_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_188_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_188_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_188_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_188_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_188_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_188_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  p2.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_188_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_188_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_188_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_189_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_189_CB1(uint i)
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

float4 BA_Vertex_189_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_189_CB1((uint)(5)).xyz * BA_Vertex_189_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_189_CB1((uint)(4)).xyz * BA_Vertex_189_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_189_CB1((uint)(6)).xyz * BA_Vertex_189_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_189_CB1((uint)(7)).xyz * BA_Vertex_189_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_189_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_189_CB1((uint)(5)).xyz * BA_Vertex_189_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_189_CB1((uint)(4)).xyz * BA_Vertex_189_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_189_CB1((uint)(6)).xyz * BA_Vertex_189_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_189_CB1((uint)(7)).xyz * BA_Vertex_189_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_189_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_189_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_189_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_189_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_189_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_189_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_189_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_189_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_189_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_189_CB0((uint)(22)).x / BA_Vertex_189_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_189_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_189_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_189_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_189_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_189_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_189_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_189_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_189_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_189_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_189_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_190_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_190_CB1(uint i)
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

float4 BA_Vertex_190_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_190_CB1((uint)(5)).xyz * BA_Vertex_190_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_190_CB1((uint)(4)).xyz * BA_Vertex_190_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_190_CB1((uint)(6)).xyz * BA_Vertex_190_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_190_CB1((uint)(7)).xyz * BA_Vertex_190_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_190_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_190_CB1((uint)(5)).xyz * BA_Vertex_190_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_190_CB1((uint)(4)).xyz * BA_Vertex_190_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_190_CB1((uint)(6)).xyz * BA_Vertex_190_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_190_CB1((uint)(7)).xyz * BA_Vertex_190_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_190_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_190_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_190_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_190_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_190_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_190_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_190_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_190_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_190_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_190_CB0((uint)(22)).x / BA_Vertex_190_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_190_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_190_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_190_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_190_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = BA_Vertex_190_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_190_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_190_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  BA_o2_zw.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_190_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_190_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_190_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_191_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_191_CB1(uint i)
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

float4 BA_Vertex_191_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_191_CB1((uint)(5)).xyz * BA_Vertex_191_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_191_CB1((uint)(4)).xyz * BA_Vertex_191_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_191_CB1((uint)(6)).xyz * BA_Vertex_191_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_191_CB1((uint)(7)).xyz * BA_Vertex_191_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_191_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_191_CB1((uint)(5)).xyz * BA_Vertex_191_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_191_CB1((uint)(4)).xyz * BA_Vertex_191_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_191_CB1((uint)(6)).xyz * BA_Vertex_191_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_191_CB1((uint)(7)).xyz * BA_Vertex_191_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_191_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_191_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_191_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_191_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_191_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_191_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_191_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_191_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_191_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_191_CB0((uint)(22)).x / BA_Vertex_191_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_191_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_191_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_191_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_191_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_191_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_191_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_191_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_191_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_191_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_191_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_192_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_192_CB1(uint i)
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

float4 BA_Vertex_192_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_192_CB1((uint)(5)).xyz * BA_Vertex_192_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_192_CB1((uint)(4)).xyz * BA_Vertex_192_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_192_CB1((uint)(6)).xyz * BA_Vertex_192_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_192_CB1((uint)(7)).xyz * BA_Vertex_192_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_192_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_192_CB1((uint)(5)).xyz * BA_Vertex_192_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_192_CB1((uint)(4)).xyz * BA_Vertex_192_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_192_CB1((uint)(6)).xyz * BA_Vertex_192_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_192_CB1((uint)(7)).xyz * BA_Vertex_192_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_192_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_192_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_192_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_192_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_192_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_192_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_192_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_192_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_192_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_192_CB0((uint)(22)).x / BA_Vertex_192_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_192_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_192_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_192_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_192_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = BA_Vertex_192_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_192_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_192_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  BA_o2_zw.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_192_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_192_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_192_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_193_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_193_CB1(uint i)
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

float4 BA_Vertex_193_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_193_CB1((uint)(5)).xyz * BA_Vertex_193_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_193_CB1((uint)(4)).xyz * BA_Vertex_193_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_193_CB1((uint)(6)).xyz * BA_Vertex_193_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_193_CB1((uint)(7)).xyz * BA_Vertex_193_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_193_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_193_CB1((uint)(5)).xyz * BA_Vertex_193_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_193_CB1((uint)(4)).xyz * BA_Vertex_193_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_193_CB1((uint)(6)).xyz * BA_Vertex_193_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_193_CB1((uint)(7)).xyz * BA_Vertex_193_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_193_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_193_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_193_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_193_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_193_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_193_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_193_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_193_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_193_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_193_CB0((uint)(22)).x / BA_Vertex_193_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_193_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_193_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_193_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_193_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_193_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_193_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_194_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_194_CB1(uint i)
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

float4 BA_Vertex_194_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_194_CB1((uint)(5)).xyz * BA_Vertex_194_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_194_CB1((uint)(4)).xyz * BA_Vertex_194_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_194_CB1((uint)(6)).xyz * BA_Vertex_194_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_194_CB1((uint)(7)).xyz * BA_Vertex_194_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_194_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_194_CB1((uint)(5)).xyz * BA_Vertex_194_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_194_CB1((uint)(4)).xyz * BA_Vertex_194_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_194_CB1((uint)(6)).xyz * BA_Vertex_194_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_194_CB1((uint)(7)).xyz * BA_Vertex_194_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_194_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_194_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_194_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_194_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_194_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_194_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_194_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_194_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_194_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_194_CB0((uint)(22)).x / BA_Vertex_194_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_194_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_194_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_194_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  o2.x = 0;
  p2.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_194_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_194_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_194_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_195_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_195_CB1(uint i)
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

float4 BA_Vertex_195_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_195_CB1((uint)(5)).xyz * BA_Vertex_195_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_195_CB1((uint)(4)).xyz * BA_Vertex_195_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_195_CB1((uint)(6)).xyz * BA_Vertex_195_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_195_CB1((uint)(7)).xyz * BA_Vertex_195_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_195_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_195_CB1((uint)(5)).xyz * BA_Vertex_195_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_195_CB1((uint)(4)).xyz * BA_Vertex_195_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_195_CB1((uint)(6)).xyz * BA_Vertex_195_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_195_CB1((uint)(7)).xyz * BA_Vertex_195_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_195_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_195_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_195_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_195_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_195_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_195_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_195_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_195_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_195_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_195_CB0((uint)(22)).x / BA_Vertex_195_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_195_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_195_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_195_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_195_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_195_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_195_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_196_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_196_CB1(uint i)
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

float4 BA_Vertex_196_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_196_CB1((uint)(5)).xyz * BA_Vertex_196_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_196_CB1((uint)(4)).xyz * BA_Vertex_196_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_196_CB1((uint)(6)).xyz * BA_Vertex_196_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_196_CB1((uint)(7)).xyz * BA_Vertex_196_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_196_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_196_CB1((uint)(5)).xyz * BA_Vertex_196_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_196_CB1((uint)(4)).xyz * BA_Vertex_196_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_196_CB1((uint)(6)).xyz * BA_Vertex_196_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_196_CB1((uint)(7)).xyz * BA_Vertex_196_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_196_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_196_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_196_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_196_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_196_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_196_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_196_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_196_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_196_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_196_CB0((uint)(22)).x / BA_Vertex_196_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_196_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_196_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_196_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  p2.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_196_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_196_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_196_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_197_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_197_CB1(uint i)
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

float4 BA_Vertex_197_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_197_CB1((uint)(5)).xyz * BA_Vertex_197_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_197_CB1((uint)(4)).xyz * BA_Vertex_197_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_197_CB1((uint)(6)).xyz * BA_Vertex_197_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_197_CB1((uint)(7)).xyz * BA_Vertex_197_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_197_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_197_CB1((uint)(5)).xyz * BA_Vertex_197_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_197_CB1((uint)(4)).xyz * BA_Vertex_197_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_197_CB1((uint)(6)).xyz * BA_Vertex_197_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_197_CB1((uint)(7)).xyz * BA_Vertex_197_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_197_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_197_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_197_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_197_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_197_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_197_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_197_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_197_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_197_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_197_CB0((uint)(22)).x / BA_Vertex_197_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_197_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_197_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_197_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_197_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  o2.x = 0;
  r0.x = dot(v2.xyz, BA_Vertex_197_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_197_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_197_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_198_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_198_CB1(uint i)
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

float4 BA_Vertex_198_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_198_CB1((uint)(5)).xyz * BA_Vertex_198_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_198_CB1((uint)(4)).xyz * BA_Vertex_198_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_198_CB1((uint)(6)).xyz * BA_Vertex_198_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_198_CB1((uint)(7)).xyz * BA_Vertex_198_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_198_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_198_CB1((uint)(5)).xyz * BA_Vertex_198_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_198_CB1((uint)(4)).xyz * BA_Vertex_198_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_198_CB1((uint)(6)).xyz * BA_Vertex_198_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_198_CB1((uint)(7)).xyz * BA_Vertex_198_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_198_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_198_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_198_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_198_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_198_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_198_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_198_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_198_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_198_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_198_CB0((uint)(22)).x / BA_Vertex_198_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_198_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_198_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_198_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_198_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  BA_o2_x.x = 0;
  BA_o2_zw.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_198_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_198_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_198_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_199_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_199_CB1(uint i)
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

float4 BA_Vertex_199_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_199_CB1((uint)(5)).xyz * BA_Vertex_199_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_199_CB1((uint)(4)).xyz * BA_Vertex_199_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_199_CB1((uint)(6)).xyz * BA_Vertex_199_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_199_CB1((uint)(7)).xyz * BA_Vertex_199_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_199_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_199_CB1((uint)(5)).xyz * BA_Vertex_199_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_199_CB1((uint)(4)).xyz * BA_Vertex_199_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_199_CB1((uint)(6)).xyz * BA_Vertex_199_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_199_CB1((uint)(7)).xyz * BA_Vertex_199_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_199_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_199_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_199_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_199_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_199_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_199_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_199_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_199_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_199_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_199_CB0((uint)(22)).x / BA_Vertex_199_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_199_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_199_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_199_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_199_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  r0.x = dot(v2.xyz, BA_Vertex_199_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_199_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_199_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_200_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_200_CB1(uint i)
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

float4 BA_Vertex_200_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_200_CB1((uint)(5)).xyz * BA_Vertex_200_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_200_CB1((uint)(4)).xyz * BA_Vertex_200_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_200_CB1((uint)(6)).xyz * BA_Vertex_200_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_200_CB1((uint)(7)).xyz * BA_Vertex_200_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_200_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_200_CB1((uint)(5)).xyz * BA_Vertex_200_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_200_CB1((uint)(4)).xyz * BA_Vertex_200_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_200_CB1((uint)(6)).xyz * BA_Vertex_200_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_200_CB1((uint)(7)).xyz * BA_Vertex_200_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_200_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_200_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_200_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_200_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_200_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_200_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_200_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_200_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_200_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_200_CB0((uint)(22)).x / BA_Vertex_200_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_200_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_200_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_200_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_200_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  BA_o2_x.x = 0;
  BA_o2_zw.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_200_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_200_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_200_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_201_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_201_CB1(uint i)
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

float4 BA_Vertex_201_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_201_CB1((uint)(5)).xyz * BA_Vertex_201_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_201_CB1((uint)(4)).xyz * BA_Vertex_201_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_201_CB1((uint)(6)).xyz * BA_Vertex_201_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_201_CB1((uint)(7)).xyz * BA_Vertex_201_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_201_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_201_CB1((uint)(5)).xyz * BA_Vertex_201_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_201_CB1((uint)(4)).xyz * BA_Vertex_201_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_201_CB1((uint)(6)).xyz * BA_Vertex_201_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_201_CB1((uint)(7)).xyz * BA_Vertex_201_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_201_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_201_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_201_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_201_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_201_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_201_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_201_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_201_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_201_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_201_CB0((uint)(22)).x / BA_Vertex_201_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_201_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_201_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_201_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_201_CB0((uint)(59)).z + BA_Vertex_201_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_201_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_201_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_201_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_201_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_201_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_202_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_202_CB1(uint i)
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

float4 BA_Vertex_202_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_202_CB1((uint)(5)).xyz * BA_Vertex_202_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_202_CB1((uint)(4)).xyz * BA_Vertex_202_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_202_CB1((uint)(6)).xyz * BA_Vertex_202_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_202_CB1((uint)(7)).xyz * BA_Vertex_202_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_202_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_202_CB1((uint)(5)).xyz * BA_Vertex_202_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_202_CB1((uint)(4)).xyz * BA_Vertex_202_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_202_CB1((uint)(6)).xyz * BA_Vertex_202_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_202_CB1((uint)(7)).xyz * BA_Vertex_202_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_202_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_202_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_202_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_202_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_202_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_202_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_202_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_202_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_202_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_202_CB0((uint)(22)).x / BA_Vertex_202_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_202_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_202_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_202_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_202_CB0((uint)(59)).z + BA_Vertex_202_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_202_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_202_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  p2.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_202_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_202_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_202_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_203_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_203_CB1(uint i)
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

float4 BA_Vertex_203_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_203_CB1((uint)(5)).xyz * BA_Vertex_203_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_203_CB1((uint)(4)).xyz * BA_Vertex_203_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_203_CB1((uint)(6)).xyz * BA_Vertex_203_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_203_CB1((uint)(7)).xyz * BA_Vertex_203_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_203_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_203_CB1((uint)(5)).xyz * BA_Vertex_203_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_203_CB1((uint)(4)).xyz * BA_Vertex_203_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_203_CB1((uint)(6)).xyz * BA_Vertex_203_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_203_CB1((uint)(7)).xyz * BA_Vertex_203_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_203_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_203_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_203_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_203_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_203_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_203_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_203_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_203_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_203_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_203_CB0((uint)(22)).x / BA_Vertex_203_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_203_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_203_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_203_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_203_CB0((uint)(59)).z + BA_Vertex_203_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_203_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_203_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_203_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_203_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_203_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_204_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_204_CB1(uint i)
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

float4 BA_Vertex_204_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_204_CB1((uint)(5)).xyz * BA_Vertex_204_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_204_CB1((uint)(4)).xyz * BA_Vertex_204_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_204_CB1((uint)(6)).xyz * BA_Vertex_204_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_204_CB1((uint)(7)).xyz * BA_Vertex_204_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_204_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_204_CB1((uint)(5)).xyz * BA_Vertex_204_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_204_CB1((uint)(4)).xyz * BA_Vertex_204_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_204_CB1((uint)(6)).xyz * BA_Vertex_204_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_204_CB1((uint)(7)).xyz * BA_Vertex_204_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_204_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_204_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_204_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_204_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_204_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_204_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_204_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_204_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_204_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_204_CB0((uint)(22)).x / BA_Vertex_204_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_204_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_204_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_204_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_204_CB0((uint)(59)).z + BA_Vertex_204_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_204_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_204_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  p2.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_204_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_204_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_204_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_205_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_205_CB1(uint i)
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

float4 BA_Vertex_205_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_205_CB1((uint)(5)).xyz * BA_Vertex_205_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_205_CB1((uint)(4)).xyz * BA_Vertex_205_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_205_CB1((uint)(6)).xyz * BA_Vertex_205_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_205_CB1((uint)(7)).xyz * BA_Vertex_205_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_205_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_205_CB1((uint)(5)).xyz * BA_Vertex_205_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_205_CB1((uint)(4)).xyz * BA_Vertex_205_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_205_CB1((uint)(6)).xyz * BA_Vertex_205_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_205_CB1((uint)(7)).xyz * BA_Vertex_205_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_205_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_205_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_205_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_205_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_205_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_205_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_205_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_205_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_205_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_205_CB0((uint)(22)).x / BA_Vertex_205_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_205_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_205_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_205_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_205_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_205_CB0((uint)(59)).z + BA_Vertex_205_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_205_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_205_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_205_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_205_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_205_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_206_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_206_CB1(uint i)
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

float4 BA_Vertex_206_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_206_CB1((uint)(5)).xyz * BA_Vertex_206_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_206_CB1((uint)(4)).xyz * BA_Vertex_206_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_206_CB1((uint)(6)).xyz * BA_Vertex_206_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_206_CB1((uint)(7)).xyz * BA_Vertex_206_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_206_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_206_CB1((uint)(5)).xyz * BA_Vertex_206_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_206_CB1((uint)(4)).xyz * BA_Vertex_206_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_206_CB1((uint)(6)).xyz * BA_Vertex_206_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_206_CB1((uint)(7)).xyz * BA_Vertex_206_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_206_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_206_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_206_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_206_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_206_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_206_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_206_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_206_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_206_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_206_CB0((uint)(22)).x / BA_Vertex_206_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_206_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_206_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_206_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_206_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = saturate(r0.x * BA_Vertex_206_CB0((uint)(59)).z + BA_Vertex_206_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_206_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_206_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  BA_o2_zw.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_206_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_206_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_206_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_207_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_207_CB1(uint i)
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

float4 BA_Vertex_207_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_207_CB1((uint)(5)).xyz * BA_Vertex_207_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_207_CB1((uint)(4)).xyz * BA_Vertex_207_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_207_CB1((uint)(6)).xyz * BA_Vertex_207_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_207_CB1((uint)(7)).xyz * BA_Vertex_207_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_207_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_207_CB1((uint)(5)).xyz * BA_Vertex_207_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_207_CB1((uint)(4)).xyz * BA_Vertex_207_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_207_CB1((uint)(6)).xyz * BA_Vertex_207_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_207_CB1((uint)(7)).xyz * BA_Vertex_207_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_207_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_207_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_207_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_207_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_207_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_207_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_207_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_207_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_207_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_207_CB0((uint)(22)).x / BA_Vertex_207_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_207_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_207_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_207_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_207_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_207_CB0((uint)(59)).z + BA_Vertex_207_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_207_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_207_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_207_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_207_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_207_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_208_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_208_CB1(uint i)
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

float4 BA_Vertex_208_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_208_CB1((uint)(5)).xyz * BA_Vertex_208_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_208_CB1((uint)(4)).xyz * BA_Vertex_208_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_208_CB1((uint)(6)).xyz * BA_Vertex_208_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_208_CB1((uint)(7)).xyz * BA_Vertex_208_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_208_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_208_CB1((uint)(5)).xyz * BA_Vertex_208_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_208_CB1((uint)(4)).xyz * BA_Vertex_208_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_208_CB1((uint)(6)).xyz * BA_Vertex_208_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_208_CB1((uint)(7)).xyz * BA_Vertex_208_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_208_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_208_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_208_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_208_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_208_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_208_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_208_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_208_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_208_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_208_CB0((uint)(22)).x / BA_Vertex_208_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_208_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_208_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_208_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_208_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = saturate(r0.x * BA_Vertex_208_CB0((uint)(59)).z + BA_Vertex_208_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_208_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_208_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  BA_o2_zw.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_208_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_208_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_208_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_209_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_209_CB1(uint i)
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

float4 BA_Vertex_209_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_209_CB1((uint)(5)).xyz * BA_Vertex_209_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_209_CB1((uint)(4)).xyz * BA_Vertex_209_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_209_CB1((uint)(6)).xyz * BA_Vertex_209_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_209_CB1((uint)(7)).xyz * BA_Vertex_209_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_209_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_209_CB1((uint)(5)).xyz * BA_Vertex_209_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_209_CB1((uint)(4)).xyz * BA_Vertex_209_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_209_CB1((uint)(6)).xyz * BA_Vertex_209_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_209_CB1((uint)(7)).xyz * BA_Vertex_209_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_209_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_209_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_209_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_209_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_209_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_209_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_209_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_209_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_209_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_209_CB0((uint)(22)).x / BA_Vertex_209_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_209_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_209_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_209_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_209_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_209_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_209_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_209_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_209_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_209_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_210_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_210_CB1(uint i)
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

float4 BA_Vertex_210_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_210_CB1((uint)(5)).xyz * BA_Vertex_210_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_210_CB1((uint)(4)).xyz * BA_Vertex_210_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_210_CB1((uint)(6)).xyz * BA_Vertex_210_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_210_CB1((uint)(7)).xyz * BA_Vertex_210_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_210_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_210_CB1((uint)(5)).xyz * BA_Vertex_210_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_210_CB1((uint)(4)).xyz * BA_Vertex_210_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_210_CB1((uint)(6)).xyz * BA_Vertex_210_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_210_CB1((uint)(7)).xyz * BA_Vertex_210_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_210_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_210_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_210_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_210_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_210_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_210_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_210_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_210_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_210_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_210_CB0((uint)(22)).x / BA_Vertex_210_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_210_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_210_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_210_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_210_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_210_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_210_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  p2.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_210_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_210_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_210_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_211_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_211_CB1(uint i)
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

float4 BA_Vertex_211_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_211_CB1((uint)(5)).xyz * BA_Vertex_211_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_211_CB1((uint)(4)).xyz * BA_Vertex_211_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_211_CB1((uint)(6)).xyz * BA_Vertex_211_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_211_CB1((uint)(7)).xyz * BA_Vertex_211_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_211_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_211_CB1((uint)(5)).xyz * BA_Vertex_211_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_211_CB1((uint)(4)).xyz * BA_Vertex_211_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_211_CB1((uint)(6)).xyz * BA_Vertex_211_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_211_CB1((uint)(7)).xyz * BA_Vertex_211_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_211_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_211_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_211_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_211_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_211_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_211_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_211_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_211_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_211_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_211_CB0((uint)(22)).x / BA_Vertex_211_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_211_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_211_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_211_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_211_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_211_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_211_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_211_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_211_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_211_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_212_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_212_CB1(uint i)
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

float4 BA_Vertex_212_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_212_CB1((uint)(5)).xyz * BA_Vertex_212_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_212_CB1((uint)(4)).xyz * BA_Vertex_212_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_212_CB1((uint)(6)).xyz * BA_Vertex_212_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_212_CB1((uint)(7)).xyz * BA_Vertex_212_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_212_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_212_CB1((uint)(5)).xyz * BA_Vertex_212_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_212_CB1((uint)(4)).xyz * BA_Vertex_212_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_212_CB1((uint)(6)).xyz * BA_Vertex_212_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_212_CB1((uint)(7)).xyz * BA_Vertex_212_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_212_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_212_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_212_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_212_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_212_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_212_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_212_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_212_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_212_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_212_CB0((uint)(22)).x / BA_Vertex_212_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_212_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_212_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_212_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_212_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_212_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_212_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  p2.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_212_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_212_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_212_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_213_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_213_CB1(uint i)
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

float4 BA_Vertex_213_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_213_CB1((uint)(5)).xyz * BA_Vertex_213_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_213_CB1((uint)(4)).xyz * BA_Vertex_213_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_213_CB1((uint)(6)).xyz * BA_Vertex_213_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_213_CB1((uint)(7)).xyz * BA_Vertex_213_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_213_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_213_CB1((uint)(5)).xyz * BA_Vertex_213_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_213_CB1((uint)(4)).xyz * BA_Vertex_213_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_213_CB1((uint)(6)).xyz * BA_Vertex_213_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_213_CB1((uint)(7)).xyz * BA_Vertex_213_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_213_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_213_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_213_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_213_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_213_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_213_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_213_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_213_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_213_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_213_CB0((uint)(22)).x / BA_Vertex_213_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_213_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_213_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_213_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_213_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_213_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_213_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_213_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_213_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_213_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_213_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_214_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_214_CB1(uint i)
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

float4 BA_Vertex_214_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_214_CB1((uint)(5)).xyz * BA_Vertex_214_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_214_CB1((uint)(4)).xyz * BA_Vertex_214_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_214_CB1((uint)(6)).xyz * BA_Vertex_214_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_214_CB1((uint)(7)).xyz * BA_Vertex_214_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_214_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_214_CB1((uint)(5)).xyz * BA_Vertex_214_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_214_CB1((uint)(4)).xyz * BA_Vertex_214_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_214_CB1((uint)(6)).xyz * BA_Vertex_214_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_214_CB1((uint)(7)).xyz * BA_Vertex_214_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_214_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_214_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_214_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_214_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_214_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_214_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_214_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_214_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_214_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_214_CB0((uint)(22)).x / BA_Vertex_214_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_214_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_214_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_214_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_214_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = BA_Vertex_214_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_214_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_214_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  BA_o2_zw.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_214_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_214_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_214_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_215_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_215_CB1(uint i)
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

float4 BA_Vertex_215_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_215_CB1((uint)(5)).xyz * BA_Vertex_215_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_215_CB1((uint)(4)).xyz * BA_Vertex_215_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_215_CB1((uint)(6)).xyz * BA_Vertex_215_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_215_CB1((uint)(7)).xyz * BA_Vertex_215_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_215_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_215_CB1((uint)(5)).xyz * BA_Vertex_215_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_215_CB1((uint)(4)).xyz * BA_Vertex_215_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_215_CB1((uint)(6)).xyz * BA_Vertex_215_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_215_CB1((uint)(7)).xyz * BA_Vertex_215_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_215_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_215_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_215_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_215_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_215_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_215_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_215_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_215_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_215_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_215_CB0((uint)(22)).x / BA_Vertex_215_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_215_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_215_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_215_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_215_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_215_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_215_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_215_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_215_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_215_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_215_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_216_CB2(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_216_CB1(uint i)
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

float4 BA_Vertex_216_CB0(uint i)
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
  float4 v1 : COLOR0,
  float4 v2 : NORMAL0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_216_CB1((uint)(5)).xyz * BA_Vertex_216_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_216_CB1((uint)(4)).xyz * BA_Vertex_216_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_216_CB1((uint)(6)).xyz * BA_Vertex_216_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_216_CB1((uint)(7)).xyz * BA_Vertex_216_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_216_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_216_CB1((uint)(5)).xyz * BA_Vertex_216_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_216_CB1((uint)(4)).xyz * BA_Vertex_216_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_216_CB1((uint)(6)).xyz * BA_Vertex_216_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_216_CB1((uint)(7)).xyz * BA_Vertex_216_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_216_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_216_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_216_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_216_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_216_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_216_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_216_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_216_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_216_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_216_CB0((uint)(22)).x / BA_Vertex_216_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_216_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_216_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_216_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_216_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = BA_Vertex_216_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_216_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_216_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  BA_o2_zw.xy = v4.xy;
  r0.x = dot(v2.xyz, BA_Vertex_216_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_216_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_216_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)

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
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_242_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  return value;
}

float4 BA_Fragment_242_CB0(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_242_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_242_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)

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
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_244_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  return value;
}

float4 BA_Fragment_244_CB0(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_244_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_244_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_245_CB0(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_245_CB0((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_246_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_246_CB0(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_246_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_246_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_246_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_247_CB0(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_247_CB0((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_248_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_248_CB0(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_248_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_248_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_248_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_249_CB0(uint i)
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

  r0.xyz = -BA_Fragment_249_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_249_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_250_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  return value;
}

float4 BA_Fragment_250_CB0(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_250_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_250_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_250_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_250_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_251_CB0(uint i)
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

  r0.xyz = -BA_Fragment_251_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_251_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_252_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  return value;
}

float4 BA_Fragment_252_CB0(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_252_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_252_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_252_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_252_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_253_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_253_CB0(uint i)
{
  float4 value = 0;
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_253_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_253_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_253_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_254_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_254_CB0(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_254_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_254_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_254_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_254_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = BA_i2_x.xxx * r0.xyz + BA_Fragment_254_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_255_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_255_CB0(uint i)
{
  float4 value = 0;
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_255_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_255_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_255_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_256_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_256_CB0(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_256_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_256_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_256_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_256_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = BA_i2_x.xxx * r0.xyz + BA_Fragment_256_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_257_CB0(uint i)
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
  r0.yzw = -BA_Fragment_257_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_257_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_258_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  return value;
}

float4 BA_Fragment_258_CB0(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_258_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_258_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_258_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_258_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_259_CB0(uint i)
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
  r0.yzw = -BA_Fragment_259_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_259_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_260_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  return value;
}

float4 BA_Fragment_260_CB0(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_260_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_260_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_260_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_260_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_261_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_261_CB0(uint i)
{
  float4 value = 0;
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_261_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_261_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_261_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_262_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_262_CB0(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_262_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_262_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_262_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-BA_i2_x.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_262_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_262_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_263_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_263_CB0(uint i)
{
  float4 value = 0;
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_263_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_263_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_263_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_264_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_264_CB0(uint i)
{
  float4 value = 0;
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_264_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_264_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_264_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-BA_i2_x.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_264_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_264_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_265_CB1(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_265_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_265_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_265_CB0((uint)(20)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_265_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_265_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_265_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_265_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_265_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_265_CB1((uint)(6)).w * BA_Fragment_265_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_266_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_266_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_266_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_266_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_266_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_266_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_266_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_266_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_266_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_266_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_266_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_266_CB1((uint)(6)).w * BA_Fragment_266_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_267_CB1(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_267_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_267_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_267_CB0((uint)(20)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_267_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_267_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_267_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_267_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_267_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_267_CB1((uint)(6)).w * BA_Fragment_267_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_268_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_268_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_268_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_268_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_268_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_268_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_268_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_268_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_268_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_268_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_268_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_268_CB1((uint)(6)).w * BA_Fragment_268_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_269_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_269_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_269_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_269_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_269_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_269_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_269_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_269_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_269_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_269_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_269_CB1((uint)(6)).w * BA_Fragment_269_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_270_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_270_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_270_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_270_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_270_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_270_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_270_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_270_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_270_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_270_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_270_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_270_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_270_CB1((uint)(6)).w * BA_Fragment_270_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_271_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_271_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_271_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_271_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_271_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_271_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_271_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_271_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_271_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_271_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_271_CB1((uint)(6)).w * BA_Fragment_271_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_272_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_272_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_272_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_272_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_272_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_272_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_272_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_272_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_272_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_272_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_272_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_272_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_272_CB1((uint)(6)).w * BA_Fragment_272_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_273_CB1(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_273_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_273_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_273_CB0((uint)(20)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_273_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_273_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_273_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_273_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_273_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_273_CB1((uint)(6)).w * BA_Fragment_273_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_273_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_273_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_274_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_274_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_274_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_274_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_274_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_274_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_274_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_274_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_274_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_274_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_274_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_274_CB1((uint)(6)).w * BA_Fragment_274_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_274_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_274_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_275_CB1(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_275_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_275_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_275_CB0((uint)(20)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_275_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_275_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_275_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_275_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_275_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_275_CB1((uint)(6)).w * BA_Fragment_275_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_275_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_275_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_276_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_276_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_276_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_276_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_276_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_276_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_276_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_276_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_276_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_276_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_276_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_276_CB1((uint)(6)).w * BA_Fragment_276_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_276_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_276_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_277_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_277_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_277_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_277_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_277_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_277_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_277_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_277_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_277_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_277_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_277_CB1((uint)(6)).w * BA_Fragment_277_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_277_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_277_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_278_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_278_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_278_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_278_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_278_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_278_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_278_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_278_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_278_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_278_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_278_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_278_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_278_CB1((uint)(6)).w * BA_Fragment_278_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_278_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = BA_i2_x.xxx * r0.xyz + BA_Fragment_278_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_279_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_279_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_279_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_279_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_279_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_279_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_279_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_279_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_279_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_279_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_279_CB1((uint)(6)).w * BA_Fragment_279_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_279_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_279_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_280_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_280_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_280_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_280_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_280_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_280_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_280_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_280_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_280_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_280_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_280_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_280_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_280_CB1((uint)(6)).w * BA_Fragment_280_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_280_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = BA_i2_x.xxx * r0.xyz + BA_Fragment_280_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_281_CB1(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_281_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_281_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_281_CB0((uint)(20)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_281_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_281_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_281_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_281_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_281_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_281_CB1((uint)(6)).w * BA_Fragment_281_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_281_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_281_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_282_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_282_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_282_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_282_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_282_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_282_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_282_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_282_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_282_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_282_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_282_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_282_CB1((uint)(6)).w * BA_Fragment_282_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_282_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_282_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_283_CB1(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_283_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_283_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_283_CB0((uint)(20)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_283_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_283_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_283_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_283_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_283_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_283_CB1((uint)(6)).w * BA_Fragment_283_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_283_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_283_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_284_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_284_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_284_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_284_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_284_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_284_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_284_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_284_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_284_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_284_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_284_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_284_CB1((uint)(6)).w * BA_Fragment_284_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_284_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_284_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_285_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_285_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_285_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_285_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_285_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_285_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_285_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_285_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_285_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_285_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_285_CB1((uint)(6)).w * BA_Fragment_285_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_285_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_285_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_286_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_286_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_286_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_286_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_286_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_286_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_286_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_286_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_286_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_286_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_286_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_286_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_286_CB1((uint)(6)).w * BA_Fragment_286_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_286_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-BA_i2_x.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_286_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_287_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_287_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_287_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_287_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_287_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_287_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_287_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_287_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_287_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_287_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_287_CB1((uint)(6)).w * BA_Fragment_287_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_287_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_287_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_288_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

float4 BA_Fragment_288_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_288_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_288_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_288_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_288_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_288_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_288_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_288_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_288_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_288_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_288_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_288_CB1((uint)(6)).w * BA_Fragment_288_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_288_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-BA_i2_x.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_288_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_289_CB1(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_289_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_289_CB1((uint)(8)).x + -BA_Fragment_289_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_289_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_289_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_289_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_289_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_289_CB1((uint)(6)).w * BA_Fragment_289_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_289_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_289_CB0((uint)(20)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_289_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_289_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_289_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_290_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_290_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_290_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_290_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_290_CB1((uint)(8)).x + -BA_Fragment_290_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_290_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_290_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_290_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_290_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_290_CB1((uint)(6)).w * BA_Fragment_290_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_290_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_290_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_290_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_290_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_290_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_291_CB1(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_291_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_291_CB1((uint)(8)).x + -BA_Fragment_291_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_291_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_291_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_291_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_291_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_291_CB1((uint)(6)).w * BA_Fragment_291_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_291_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_291_CB0((uint)(20)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_291_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_291_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_291_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_292_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_292_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_292_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_292_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_292_CB1((uint)(8)).x + -BA_Fragment_292_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_292_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_292_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_292_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_292_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_292_CB1((uint)(6)).w * BA_Fragment_292_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_292_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_292_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_292_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_292_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_292_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_293_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_293_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_293_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_293_CB1((uint)(8)).x + -BA_Fragment_293_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_293_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_293_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_293_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_293_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_293_CB1((uint)(6)).w * BA_Fragment_293_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_293_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_293_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_293_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_293_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_293_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_294_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_294_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_294_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_294_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_294_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_294_CB1((uint)(8)).x + -BA_Fragment_294_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_294_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_294_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_294_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_294_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_294_CB1((uint)(6)).w * BA_Fragment_294_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_294_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_294_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_294_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_294_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_294_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_295_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_295_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_295_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_295_CB1((uint)(8)).x + -BA_Fragment_295_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_295_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_295_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_295_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_295_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_295_CB1((uint)(6)).w * BA_Fragment_295_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_295_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_295_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_295_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_295_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_295_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_296_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_296_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_296_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_296_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_296_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_296_CB1((uint)(8)).x + -BA_Fragment_296_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_296_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_296_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_296_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_296_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_296_CB1((uint)(6)).w * BA_Fragment_296_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_296_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_296_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_296_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_296_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_296_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_297_CB1(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_297_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_297_CB1((uint)(8)).x + -BA_Fragment_297_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_297_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_297_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_297_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_297_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_297_CB1((uint)(6)).w * BA_Fragment_297_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_297_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_297_CB0((uint)(20)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_297_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_297_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_297_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_297_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_297_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_298_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_298_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_298_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_298_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_298_CB1((uint)(8)).x + -BA_Fragment_298_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_298_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_298_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_298_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_298_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_298_CB1((uint)(6)).w * BA_Fragment_298_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_298_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_298_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_298_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_298_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_298_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_298_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_298_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_299_CB1(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_299_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_299_CB1((uint)(8)).x + -BA_Fragment_299_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_299_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_299_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_299_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_299_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_299_CB1((uint)(6)).w * BA_Fragment_299_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_299_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_299_CB0((uint)(20)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_299_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_299_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_299_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_299_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_299_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_300_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_300_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_300_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_300_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_300_CB1((uint)(8)).x + -BA_Fragment_300_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_300_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_300_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_300_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_300_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_300_CB1((uint)(6)).w * BA_Fragment_300_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_300_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_300_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_300_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_300_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_300_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_300_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_300_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_301_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_301_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_301_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_301_CB1((uint)(8)).x + -BA_Fragment_301_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_301_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_301_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_301_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_301_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_301_CB1((uint)(6)).w * BA_Fragment_301_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_301_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_301_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_301_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_301_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_301_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_301_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_301_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_302_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_302_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_302_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_302_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_302_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_302_CB1((uint)(8)).x + -BA_Fragment_302_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_302_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_302_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_302_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_302_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_302_CB1((uint)(6)).w * BA_Fragment_302_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_302_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_302_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_302_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_302_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_302_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_302_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = BA_i2_x.xxx * r0.xyz + BA_Fragment_302_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_303_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_303_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_303_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_303_CB1((uint)(8)).x + -BA_Fragment_303_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_303_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_303_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_303_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_303_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_303_CB1((uint)(6)).w * BA_Fragment_303_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_303_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_303_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_303_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_303_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_303_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_303_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_303_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_304_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_304_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_304_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_304_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_304_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_304_CB1((uint)(8)).x + -BA_Fragment_304_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_304_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_304_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_304_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_304_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_304_CB1((uint)(6)).w * BA_Fragment_304_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_304_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_304_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_304_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_304_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_304_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_304_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = BA_i2_x.xxx * r0.xyz + BA_Fragment_304_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_305_CB1(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_305_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_305_CB1((uint)(8)).x + -BA_Fragment_305_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_305_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_305_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_305_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_305_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_305_CB1((uint)(6)).w * BA_Fragment_305_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_305_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_305_CB0((uint)(20)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_305_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_305_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_305_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_305_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_305_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_306_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_306_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_306_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_306_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_306_CB1((uint)(8)).x + -BA_Fragment_306_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_306_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_306_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_306_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_306_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_306_CB1((uint)(6)).w * BA_Fragment_306_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_306_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_306_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_306_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_306_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_306_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_306_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_306_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_307_CB1(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_307_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_307_CB1((uint)(8)).x + -BA_Fragment_307_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_307_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_307_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_307_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_307_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_307_CB1((uint)(6)).w * BA_Fragment_307_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_307_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_307_CB0((uint)(20)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_307_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_307_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_307_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_307_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_307_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_308_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_308_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_308_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_308_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_308_CB1((uint)(8)).x + -BA_Fragment_308_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_308_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_308_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_308_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_308_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_308_CB1((uint)(6)).w * BA_Fragment_308_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_308_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_308_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_308_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_308_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_308_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_308_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_308_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_309_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_309_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_309_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_309_CB1((uint)(8)).x + -BA_Fragment_309_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_309_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_309_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_309_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_309_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_309_CB1((uint)(6)).w * BA_Fragment_309_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_309_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_309_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_309_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_309_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_309_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_309_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_309_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_310_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_310_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_310_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_310_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_310_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_310_CB1((uint)(8)).x + -BA_Fragment_310_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_310_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_310_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_310_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_310_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_310_CB1((uint)(6)).w * BA_Fragment_310_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_310_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_310_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_310_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_310_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_310_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_310_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-BA_i2_x.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_310_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_311_CB1(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_311_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_311_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_311_CB1((uint)(8)).x + -BA_Fragment_311_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_311_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_311_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_311_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_311_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_311_CB1((uint)(6)).w * BA_Fragment_311_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_311_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_311_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_311_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_311_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_311_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_311_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_311_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_312_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_312_CB0(uint i)
{
  float4 value = 0;
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_312_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_312_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_312_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_312_CB1((uint)(8)).x + -BA_Fragment_312_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_312_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_312_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_312_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_312_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_312_CB1((uint)(6)).w * BA_Fragment_312_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_312_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_312_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_312_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_312_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_312_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_312_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-BA_i2_x.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_312_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
