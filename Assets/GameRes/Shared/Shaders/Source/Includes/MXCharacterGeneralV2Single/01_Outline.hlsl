// Exact names and types from the original compiled parameter metadata.
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

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_35_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_35_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_35_CB1((uint)(5)).xyz * BA_Vertex_35_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_35_CB1((uint)(4)).xyz * BA_Vertex_35_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_35_CB1((uint)(6)).xyz * BA_Vertex_35_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_35_CB1((uint)(7)).xyz * BA_Vertex_35_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_35_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_35_CB1((uint)(5)).xyz * BA_Vertex_35_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_35_CB1((uint)(4)).xyz * BA_Vertex_35_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_35_CB1((uint)(6)).xyz * BA_Vertex_35_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_35_CB1((uint)(7)).xyz * BA_Vertex_35_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_35_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_35_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_35_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_35_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_35_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_35_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_35_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_35_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_35_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_35_CB0((uint)(22)).x / BA_Vertex_35_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_35_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_35_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_35_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_36_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_36_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_36_CB1((uint)(5)).xyz * BA_Vertex_36_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_36_CB1((uint)(4)).xyz * BA_Vertex_36_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_36_CB1((uint)(6)).xyz * BA_Vertex_36_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_36_CB1((uint)(7)).xyz * BA_Vertex_36_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_36_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_36_CB1((uint)(5)).xyz * BA_Vertex_36_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_36_CB1((uint)(4)).xyz * BA_Vertex_36_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_36_CB1((uint)(6)).xyz * BA_Vertex_36_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_36_CB1((uint)(7)).xyz * BA_Vertex_36_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_36_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_36_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_36_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_36_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_36_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_36_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_36_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_36_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_36_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_36_CB0((uint)(22)).x / BA_Vertex_36_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_36_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_36_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_36_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_37_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_37_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_37_CB1((uint)(5)).xyz * BA_Vertex_37_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_37_CB1((uint)(4)).xyz * BA_Vertex_37_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_37_CB1((uint)(6)).xyz * BA_Vertex_37_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_37_CB1((uint)(7)).xyz * BA_Vertex_37_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_37_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_37_CB1((uint)(5)).xyz * BA_Vertex_37_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_37_CB1((uint)(4)).xyz * BA_Vertex_37_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_37_CB1((uint)(6)).xyz * BA_Vertex_37_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_37_CB1((uint)(7)).xyz * BA_Vertex_37_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_37_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_37_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_37_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_37_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_37_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_37_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_37_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_37_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_37_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_37_CB0((uint)(22)).x / BA_Vertex_37_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_37_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_37_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_37_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_37_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_38_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_38_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_38_CB1((uint)(5)).xyz * BA_Vertex_38_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_38_CB1((uint)(4)).xyz * BA_Vertex_38_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_38_CB1((uint)(6)).xyz * BA_Vertex_38_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_38_CB1((uint)(7)).xyz * BA_Vertex_38_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_38_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_38_CB1((uint)(5)).xyz * BA_Vertex_38_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_38_CB1((uint)(4)).xyz * BA_Vertex_38_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_38_CB1((uint)(6)).xyz * BA_Vertex_38_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_38_CB1((uint)(7)).xyz * BA_Vertex_38_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_38_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_38_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_38_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_38_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_38_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_38_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_38_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_38_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_38_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_38_CB0((uint)(22)).x / BA_Vertex_38_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_38_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_38_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_38_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_38_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_39_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_39_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_39_CB1((uint)(5)).xyz * BA_Vertex_39_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_39_CB1((uint)(4)).xyz * BA_Vertex_39_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_39_CB1((uint)(6)).xyz * BA_Vertex_39_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_39_CB1((uint)(7)).xyz * BA_Vertex_39_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_39_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_39_CB1((uint)(5)).xyz * BA_Vertex_39_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_39_CB1((uint)(4)).xyz * BA_Vertex_39_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_39_CB1((uint)(6)).xyz * BA_Vertex_39_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_39_CB1((uint)(7)).xyz * BA_Vertex_39_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_39_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_39_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_39_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_39_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_39_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_39_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_39_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_39_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_39_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_39_CB0((uint)(22)).x / BA_Vertex_39_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_39_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_39_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_39_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_39_CB0((uint)(59)).z + BA_Vertex_39_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_39_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_39_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_40_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_40_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_40_CB1((uint)(5)).xyz * BA_Vertex_40_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_40_CB1((uint)(4)).xyz * BA_Vertex_40_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_40_CB1((uint)(6)).xyz * BA_Vertex_40_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_40_CB1((uint)(7)).xyz * BA_Vertex_40_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_40_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_40_CB1((uint)(5)).xyz * BA_Vertex_40_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_40_CB1((uint)(4)).xyz * BA_Vertex_40_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_40_CB1((uint)(6)).xyz * BA_Vertex_40_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_40_CB1((uint)(7)).xyz * BA_Vertex_40_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
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
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_40_CB0((uint)(22)).x / BA_Vertex_40_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_40_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_40_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_40_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_40_CB0((uint)(59)).z + BA_Vertex_40_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_40_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_40_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_41_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_41_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_41_CB1((uint)(5)).xyz * BA_Vertex_41_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_41_CB1((uint)(4)).xyz * BA_Vertex_41_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_41_CB1((uint)(6)).xyz * BA_Vertex_41_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_41_CB1((uint)(7)).xyz * BA_Vertex_41_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_41_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_41_CB1((uint)(5)).xyz * BA_Vertex_41_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_41_CB1((uint)(4)).xyz * BA_Vertex_41_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_41_CB1((uint)(6)).xyz * BA_Vertex_41_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_41_CB1((uint)(7)).xyz * BA_Vertex_41_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
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
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_41_CB0((uint)(22)).x / BA_Vertex_41_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_41_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_41_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_41_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_41_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_41_CB0((uint)(59)).z + BA_Vertex_41_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_41_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_41_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_42_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_42_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_42_CB1((uint)(5)).xyz * BA_Vertex_42_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_42_CB1((uint)(4)).xyz * BA_Vertex_42_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_42_CB1((uint)(6)).xyz * BA_Vertex_42_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_42_CB1((uint)(7)).xyz * BA_Vertex_42_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_42_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_42_CB1((uint)(5)).xyz * BA_Vertex_42_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_42_CB1((uint)(4)).xyz * BA_Vertex_42_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_42_CB1((uint)(6)).xyz * BA_Vertex_42_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_42_CB1((uint)(7)).xyz * BA_Vertex_42_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
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
  r1.xyzw = BA_Vertex_42_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_42_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_42_CB0((uint)(22)).x / BA_Vertex_42_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_42_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_42_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_42_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_42_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_42_CB0((uint)(59)).z + BA_Vertex_42_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_42_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_42_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_43_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_43_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_43_CB1((uint)(5)).xyz * BA_Vertex_43_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_43_CB1((uint)(4)).xyz * BA_Vertex_43_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_43_CB1((uint)(6)).xyz * BA_Vertex_43_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_43_CB1((uint)(7)).xyz * BA_Vertex_43_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_43_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_43_CB1((uint)(5)).xyz * BA_Vertex_43_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_43_CB1((uint)(4)).xyz * BA_Vertex_43_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_43_CB1((uint)(6)).xyz * BA_Vertex_43_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_43_CB1((uint)(7)).xyz * BA_Vertex_43_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
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
  r1.xyzw = BA_Vertex_43_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_43_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_43_CB0((uint)(22)).x / BA_Vertex_43_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_43_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_43_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_43_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_43_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_43_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_43_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_44_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_44_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_44_CB1((uint)(5)).xyz * BA_Vertex_44_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_44_CB1((uint)(4)).xyz * BA_Vertex_44_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_44_CB1((uint)(6)).xyz * BA_Vertex_44_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_44_CB1((uint)(7)).xyz * BA_Vertex_44_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_44_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_44_CB1((uint)(5)).xyz * BA_Vertex_44_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_44_CB1((uint)(4)).xyz * BA_Vertex_44_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_44_CB1((uint)(6)).xyz * BA_Vertex_44_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_44_CB1((uint)(7)).xyz * BA_Vertex_44_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
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
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_44_CB0((uint)(22)).x / BA_Vertex_44_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_44_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_44_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_44_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_44_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_44_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_44_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_45_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_45_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_45_CB1((uint)(5)).xyz * BA_Vertex_45_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_45_CB1((uint)(4)).xyz * BA_Vertex_45_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_45_CB1((uint)(6)).xyz * BA_Vertex_45_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_45_CB1((uint)(7)).xyz * BA_Vertex_45_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_45_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_45_CB1((uint)(5)).xyz * BA_Vertex_45_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_45_CB1((uint)(4)).xyz * BA_Vertex_45_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_45_CB1((uint)(6)).xyz * BA_Vertex_45_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_45_CB1((uint)(7)).xyz * BA_Vertex_45_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
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
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_45_CB0((uint)(22)).x / BA_Vertex_45_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_45_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_45_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_45_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_45_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_45_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_45_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_45_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_46_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_46_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_46_CB1((uint)(5)).xyz * BA_Vertex_46_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_46_CB1((uint)(4)).xyz * BA_Vertex_46_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_46_CB1((uint)(6)).xyz * BA_Vertex_46_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_46_CB1((uint)(7)).xyz * BA_Vertex_46_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_46_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_46_CB1((uint)(5)).xyz * BA_Vertex_46_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_46_CB1((uint)(4)).xyz * BA_Vertex_46_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_46_CB1((uint)(6)).xyz * BA_Vertex_46_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_46_CB1((uint)(7)).xyz * BA_Vertex_46_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
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
  r1.xyzw = BA_Vertex_46_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_46_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_46_CB0((uint)(22)).x / BA_Vertex_46_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_46_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_46_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_46_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_46_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_46_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v3.xy, 0).xyzw;
  r0.xyz = BA_Vertex_46_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_46_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_47_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_47_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_47_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_47_CB0((uint)(22)).x / BA_Vertex_47_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_47_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_47_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_47_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_47_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_47_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_47_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_48_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_48_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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
  r2.xyzw = BA_Vertex_48_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_48_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_48_CB0((uint)(22)).x / BA_Vertex_48_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_48_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_48_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_48_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_48_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_48_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_48_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_49_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_49_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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
  r2.xyzw = BA_Vertex_49_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_49_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_49_CB0((uint)(22)).x / BA_Vertex_49_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_49_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_49_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_49_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_49_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  o2.x = 0;
  r0.x = dot(v2.xyz, BA_Vertex_49_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_49_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_49_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_50_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_50_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_50_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_50_CB0((uint)(22)).x / BA_Vertex_50_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_50_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_50_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_50_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_50_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  r0.x = dot(v2.xyz, BA_Vertex_50_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_50_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_50_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_51_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_51_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_51_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_51_CB0((uint)(22)).x / BA_Vertex_51_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_51_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_51_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_51_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_51_CB0((uint)(59)).z + BA_Vertex_51_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_51_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_51_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_51_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_51_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_51_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_52_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_52_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_52_CB1((uint)(5)).xyz * BA_Vertex_52_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_52_CB1((uint)(4)).xyz * BA_Vertex_52_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_52_CB1((uint)(6)).xyz * BA_Vertex_52_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_52_CB1((uint)(7)).xyz * BA_Vertex_52_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_52_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_52_CB1((uint)(5)).xyz * BA_Vertex_52_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_52_CB1((uint)(4)).xyz * BA_Vertex_52_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_52_CB1((uint)(6)).xyz * BA_Vertex_52_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_52_CB1((uint)(7)).xyz * BA_Vertex_52_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_52_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_52_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_52_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_52_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_52_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_52_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_52_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_52_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_52_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_52_CB0((uint)(22)).x / BA_Vertex_52_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_52_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_52_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_52_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_52_CB0((uint)(59)).z + BA_Vertex_52_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_52_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_52_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_52_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_52_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_52_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_53_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_53_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_53_CB1((uint)(5)).xyz * BA_Vertex_53_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_53_CB1((uint)(4)).xyz * BA_Vertex_53_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_53_CB1((uint)(6)).xyz * BA_Vertex_53_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_53_CB1((uint)(7)).xyz * BA_Vertex_53_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_53_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_53_CB1((uint)(5)).xyz * BA_Vertex_53_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_53_CB1((uint)(4)).xyz * BA_Vertex_53_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_53_CB1((uint)(6)).xyz * BA_Vertex_53_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_53_CB1((uint)(7)).xyz * BA_Vertex_53_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_53_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_53_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_53_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_53_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_53_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_53_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_53_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_53_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_53_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_53_CB0((uint)(22)).x / BA_Vertex_53_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_53_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_53_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_53_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_53_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_53_CB0((uint)(59)).z + BA_Vertex_53_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_53_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_53_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_53_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_53_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_53_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_54_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_54_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_54_CB1((uint)(5)).xyz * BA_Vertex_54_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_54_CB1((uint)(4)).xyz * BA_Vertex_54_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_54_CB1((uint)(6)).xyz * BA_Vertex_54_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_54_CB1((uint)(7)).xyz * BA_Vertex_54_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_54_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_54_CB1((uint)(5)).xyz * BA_Vertex_54_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_54_CB1((uint)(4)).xyz * BA_Vertex_54_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_54_CB1((uint)(6)).xyz * BA_Vertex_54_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_54_CB1((uint)(7)).xyz * BA_Vertex_54_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_54_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_54_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_54_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_54_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_54_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_54_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_54_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_54_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_54_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_54_CB0((uint)(22)).x / BA_Vertex_54_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_54_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_54_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_54_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_54_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_54_CB0((uint)(59)).z + BA_Vertex_54_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_54_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_54_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_54_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_54_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_54_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_55_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_55_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_55_CB1((uint)(5)).xyz * BA_Vertex_55_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_55_CB1((uint)(4)).xyz * BA_Vertex_55_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_55_CB1((uint)(6)).xyz * BA_Vertex_55_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_55_CB1((uint)(7)).xyz * BA_Vertex_55_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_55_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_55_CB1((uint)(5)).xyz * BA_Vertex_55_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_55_CB1((uint)(4)).xyz * BA_Vertex_55_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_55_CB1((uint)(6)).xyz * BA_Vertex_55_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_55_CB1((uint)(7)).xyz * BA_Vertex_55_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_55_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_55_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_55_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_55_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_55_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_55_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_55_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_55_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_55_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_55_CB0((uint)(22)).x / BA_Vertex_55_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_55_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_55_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_55_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_55_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_55_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_55_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_55_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_55_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_55_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_56_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_56_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_56_CB1((uint)(5)).xyz * BA_Vertex_56_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_56_CB1((uint)(4)).xyz * BA_Vertex_56_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_56_CB1((uint)(6)).xyz * BA_Vertex_56_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_56_CB1((uint)(7)).xyz * BA_Vertex_56_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_56_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_56_CB1((uint)(5)).xyz * BA_Vertex_56_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_56_CB1((uint)(4)).xyz * BA_Vertex_56_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_56_CB1((uint)(6)).xyz * BA_Vertex_56_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_56_CB1((uint)(7)).xyz * BA_Vertex_56_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_56_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_56_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_56_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_56_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_56_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_56_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_56_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_56_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_56_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_56_CB0((uint)(22)).x / BA_Vertex_56_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_56_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_56_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_56_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_56_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_56_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_56_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_56_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_56_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_56_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_57_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_57_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_57_CB1((uint)(5)).xyz * BA_Vertex_57_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_57_CB1((uint)(4)).xyz * BA_Vertex_57_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_57_CB1((uint)(6)).xyz * BA_Vertex_57_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_57_CB1((uint)(7)).xyz * BA_Vertex_57_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_57_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_57_CB1((uint)(5)).xyz * BA_Vertex_57_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_57_CB1((uint)(4)).xyz * BA_Vertex_57_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_57_CB1((uint)(6)).xyz * BA_Vertex_57_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_57_CB1((uint)(7)).xyz * BA_Vertex_57_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_57_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_57_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_57_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_57_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_57_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_57_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_57_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_57_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_57_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_57_CB0((uint)(22)).x / BA_Vertex_57_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_57_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_57_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_57_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_57_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_57_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_57_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_57_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_57_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_57_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_57_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_58_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_58_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_58_CB1((uint)(5)).xyz * BA_Vertex_58_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_58_CB1((uint)(4)).xyz * BA_Vertex_58_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_58_CB1((uint)(6)).xyz * BA_Vertex_58_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_58_CB1((uint)(7)).xyz * BA_Vertex_58_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_58_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_58_CB1((uint)(5)).xyz * BA_Vertex_58_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_58_CB1((uint)(4)).xyz * BA_Vertex_58_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_58_CB1((uint)(6)).xyz * BA_Vertex_58_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_58_CB1((uint)(7)).xyz * BA_Vertex_58_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_58_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_58_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_58_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_58_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_58_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_58_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_58_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_58_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_58_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_58_CB0((uint)(22)).x / BA_Vertex_58_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_58_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_58_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_58_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_58_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_58_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_58_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_58_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_58_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_58_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_58_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_59_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_59_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_59_CB1((uint)(5)).xyz * BA_Vertex_59_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_59_CB1((uint)(4)).xyz * BA_Vertex_59_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_59_CB1((uint)(6)).xyz * BA_Vertex_59_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_59_CB1((uint)(7)).xyz * BA_Vertex_59_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_59_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_59_CB1((uint)(5)).xyz * BA_Vertex_59_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_59_CB1((uint)(4)).xyz * BA_Vertex_59_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_59_CB1((uint)(6)).xyz * BA_Vertex_59_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_59_CB1((uint)(7)).xyz * BA_Vertex_59_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_59_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_59_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_59_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_59_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_59_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_59_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_59_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_59_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_59_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_59_CB0((uint)(22)).x / BA_Vertex_59_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_59_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_59_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_59_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_59_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_59_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_59_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_60_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_60_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_60_CB1((uint)(5)).xyz * BA_Vertex_60_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_60_CB1((uint)(4)).xyz * BA_Vertex_60_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_60_CB1((uint)(6)).xyz * BA_Vertex_60_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_60_CB1((uint)(7)).xyz * BA_Vertex_60_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_60_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_60_CB1((uint)(5)).xyz * BA_Vertex_60_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_60_CB1((uint)(4)).xyz * BA_Vertex_60_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_60_CB1((uint)(6)).xyz * BA_Vertex_60_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_60_CB1((uint)(7)).xyz * BA_Vertex_60_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_60_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_60_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_60_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_60_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_60_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_60_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_60_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_60_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_60_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_60_CB0((uint)(22)).x / BA_Vertex_60_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_60_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_60_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_60_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_60_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_60_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_60_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_61_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_61_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_61_CB1((uint)(5)).xyz * BA_Vertex_61_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_61_CB1((uint)(4)).xyz * BA_Vertex_61_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_61_CB1((uint)(6)).xyz * BA_Vertex_61_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_61_CB1((uint)(7)).xyz * BA_Vertex_61_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_61_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_61_CB1((uint)(5)).xyz * BA_Vertex_61_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_61_CB1((uint)(4)).xyz * BA_Vertex_61_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_61_CB1((uint)(6)).xyz * BA_Vertex_61_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_61_CB1((uint)(7)).xyz * BA_Vertex_61_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_61_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_61_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_61_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_61_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_61_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_61_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_61_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_61_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_61_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_61_CB0((uint)(22)).x / BA_Vertex_61_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_61_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_61_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_61_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_61_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  o2.x = 0;
  r0.x = dot(v2.xyz, BA_Vertex_61_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_61_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_61_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_62_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_62_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_62_CB1((uint)(5)).xyz * BA_Vertex_62_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_62_CB1((uint)(4)).xyz * BA_Vertex_62_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_62_CB1((uint)(6)).xyz * BA_Vertex_62_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_62_CB1((uint)(7)).xyz * BA_Vertex_62_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_62_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_62_CB1((uint)(5)).xyz * BA_Vertex_62_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_62_CB1((uint)(4)).xyz * BA_Vertex_62_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_62_CB1((uint)(6)).xyz * BA_Vertex_62_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_62_CB1((uint)(7)).xyz * BA_Vertex_62_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_62_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_62_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_62_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_62_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_62_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_62_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_62_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_62_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_62_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_62_CB0((uint)(22)).x / BA_Vertex_62_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_62_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_62_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_62_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_62_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  r0.x = dot(v2.xyz, BA_Vertex_62_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_62_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_62_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_63_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_63_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_63_CB1((uint)(5)).xyz * BA_Vertex_63_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_63_CB1((uint)(4)).xyz * BA_Vertex_63_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_63_CB1((uint)(6)).xyz * BA_Vertex_63_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_63_CB1((uint)(7)).xyz * BA_Vertex_63_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_63_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_63_CB1((uint)(5)).xyz * BA_Vertex_63_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_63_CB1((uint)(4)).xyz * BA_Vertex_63_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_63_CB1((uint)(6)).xyz * BA_Vertex_63_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_63_CB1((uint)(7)).xyz * BA_Vertex_63_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_63_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_63_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_63_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_63_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_63_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_63_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_63_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_63_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_63_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_63_CB0((uint)(22)).x / BA_Vertex_63_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_63_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_63_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_63_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_63_CB0((uint)(59)).z + BA_Vertex_63_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_63_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_63_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_63_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_63_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_63_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_64_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_64_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_64_CB1((uint)(5)).xyz * BA_Vertex_64_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_64_CB1((uint)(4)).xyz * BA_Vertex_64_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_64_CB1((uint)(6)).xyz * BA_Vertex_64_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_64_CB1((uint)(7)).xyz * BA_Vertex_64_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_64_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_64_CB1((uint)(5)).xyz * BA_Vertex_64_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_64_CB1((uint)(4)).xyz * BA_Vertex_64_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_64_CB1((uint)(6)).xyz * BA_Vertex_64_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_64_CB1((uint)(7)).xyz * BA_Vertex_64_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_64_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_64_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_64_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_64_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_64_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_64_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_64_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_64_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_64_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_64_CB0((uint)(22)).x / BA_Vertex_64_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_64_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_64_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_64_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_64_CB0((uint)(59)).z + BA_Vertex_64_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_64_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_64_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_64_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_64_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_64_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_65_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_65_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_65_CB1((uint)(5)).xyz * BA_Vertex_65_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_65_CB1((uint)(4)).xyz * BA_Vertex_65_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_65_CB1((uint)(6)).xyz * BA_Vertex_65_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_65_CB1((uint)(7)).xyz * BA_Vertex_65_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_65_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_65_CB1((uint)(5)).xyz * BA_Vertex_65_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_65_CB1((uint)(4)).xyz * BA_Vertex_65_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_65_CB1((uint)(6)).xyz * BA_Vertex_65_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_65_CB1((uint)(7)).xyz * BA_Vertex_65_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_65_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_65_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_65_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_65_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_65_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_65_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_65_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_65_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_65_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_65_CB0((uint)(22)).x / BA_Vertex_65_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_65_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_65_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_65_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_65_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_65_CB0((uint)(59)).z + BA_Vertex_65_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_65_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_65_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_65_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_65_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_65_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_66_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_66_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_66_CB1((uint)(5)).xyz * BA_Vertex_66_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_66_CB1((uint)(4)).xyz * BA_Vertex_66_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_66_CB1((uint)(6)).xyz * BA_Vertex_66_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_66_CB1((uint)(7)).xyz * BA_Vertex_66_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_66_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_66_CB1((uint)(5)).xyz * BA_Vertex_66_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_66_CB1((uint)(4)).xyz * BA_Vertex_66_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_66_CB1((uint)(6)).xyz * BA_Vertex_66_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_66_CB1((uint)(7)).xyz * BA_Vertex_66_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_66_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_66_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_66_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_66_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_66_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_66_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_66_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_66_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_66_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_66_CB0((uint)(22)).x / BA_Vertex_66_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_66_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_66_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_66_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_66_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_66_CB0((uint)(59)).z + BA_Vertex_66_CB0((uint)(59)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_66_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_66_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_66_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_66_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_66_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_67_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_67_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_67_CB1((uint)(5)).xyz * BA_Vertex_67_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_67_CB1((uint)(4)).xyz * BA_Vertex_67_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_67_CB1((uint)(6)).xyz * BA_Vertex_67_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_67_CB1((uint)(7)).xyz * BA_Vertex_67_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_67_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_67_CB1((uint)(5)).xyz * BA_Vertex_67_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_67_CB1((uint)(4)).xyz * BA_Vertex_67_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_67_CB1((uint)(6)).xyz * BA_Vertex_67_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_67_CB1((uint)(7)).xyz * BA_Vertex_67_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_67_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_67_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_67_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_67_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_67_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_67_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_67_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_67_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_67_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_67_CB0((uint)(22)).x / BA_Vertex_67_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_67_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_67_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_67_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_67_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_67_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_67_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_67_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_67_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_67_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_68_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_68_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_68_CB1((uint)(5)).xyz * BA_Vertex_68_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_68_CB1((uint)(4)).xyz * BA_Vertex_68_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_68_CB1((uint)(6)).xyz * BA_Vertex_68_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_68_CB1((uint)(7)).xyz * BA_Vertex_68_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_68_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_68_CB1((uint)(5)).xyz * BA_Vertex_68_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_68_CB1((uint)(4)).xyz * BA_Vertex_68_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_68_CB1((uint)(6)).xyz * BA_Vertex_68_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_68_CB1((uint)(7)).xyz * BA_Vertex_68_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_68_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_68_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_68_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_68_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_68_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_68_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_68_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_68_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o3.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_68_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_68_CB0((uint)(22)).x / BA_Vertex_68_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_68_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_68_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_68_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_68_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_68_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_68_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.y = dot(v2.xyz, BA_Vertex_68_CB1((uint)(4)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_68_CB1((uint)(5)).xyz);
  r0.w = dot(v2.xyz, BA_Vertex_68_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_69_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_69_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_69_CB1((uint)(5)).xyz * BA_Vertex_69_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_69_CB1((uint)(4)).xyz * BA_Vertex_69_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_69_CB1((uint)(6)).xyz * BA_Vertex_69_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_69_CB1((uint)(7)).xyz * BA_Vertex_69_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_69_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_69_CB1((uint)(5)).xyz * BA_Vertex_69_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_69_CB1((uint)(4)).xyz * BA_Vertex_69_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_69_CB1((uint)(6)).xyz * BA_Vertex_69_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_69_CB1((uint)(7)).xyz * BA_Vertex_69_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_69_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_69_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_69_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_69_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_69_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_69_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_69_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_69_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_69_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_69_CB0((uint)(22)).x / BA_Vertex_69_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_69_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_69_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_69_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_69_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_69_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_69_CB2((uint)(1)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_69_CB0((uint)(10)).xyz * r0.xyz;
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_69_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_69_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_69_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_70_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 1u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_70_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
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
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = BA_Vertex_70_CB1((uint)(5)).xyz * BA_Vertex_70_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_70_CB1((uint)(4)).xyz * BA_Vertex_70_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_70_CB1((uint)(6)).xyz * BA_Vertex_70_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_70_CB1((uint)(7)).xyz * BA_Vertex_70_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_70_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_70_CB1((uint)(5)).xyz * BA_Vertex_70_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_70_CB1((uint)(4)).xyz * BA_Vertex_70_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_70_CB1((uint)(6)).xyz * BA_Vertex_70_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_70_CB1((uint)(7)).xyz * BA_Vertex_70_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_70_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_70_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_70_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_70_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_70_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_70_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_70_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_70_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  o4.xyz = r1.xyz;
  r1.xyzw = BA_Vertex_70_CB0((uint)(80)).xyzw + r2.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_70_CB0((uint)(22)).x / BA_Vertex_70_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_70_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_70_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_70_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_70_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_70_CB0((uint)(59)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_70_CB2((uint)(1)).xyz * r0.xyz;
  r0.xyz = BA_Vertex_70_CB0((uint)(10)).xyz * r0.xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  r0.x = dot(v2.xyz, BA_Vertex_70_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_70_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_70_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)

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
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)

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
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_85_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_85_CB0((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_86_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_86_CB0((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_87_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = -BA_Fragment_87_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_87_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_88_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.xyz = -BA_Fragment_88_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_88_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_89_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_89_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_89_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_89_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_89_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_90_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_90_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_90_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_90_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_90_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_91_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.yzw = -BA_Fragment_91_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_91_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_92_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.yzw = -BA_Fragment_92_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_92_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_93_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_93_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_93_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_93_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_93_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_94_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_94_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_94_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_94_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_94_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_95_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_95_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.x = cmp(BA_Fragment_95_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_95_CB0((uint)(20)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_95_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_95_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_95_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_95_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_95_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_95_CB1((uint)(6)).w * BA_Fragment_95_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_96_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_96_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.x = cmp(BA_Fragment_96_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_96_CB0((uint)(20)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_96_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_96_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_96_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_96_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_96_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_96_CB1((uint)(6)).w * BA_Fragment_96_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_97_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_97_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_97_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_97_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_97_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_97_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_97_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_97_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_97_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_97_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_97_CB1((uint)(6)).w * BA_Fragment_97_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_98_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_98_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_98_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_98_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_98_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_98_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_98_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_98_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_98_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_98_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_98_CB1((uint)(6)).w * BA_Fragment_98_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_99_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_99_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.x = cmp(BA_Fragment_99_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_99_CB0((uint)(20)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_99_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_99_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_99_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_99_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_99_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_99_CB1((uint)(6)).w * BA_Fragment_99_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_99_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_99_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_100_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_100_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.x = cmp(BA_Fragment_100_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_100_CB0((uint)(20)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_100_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_100_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_100_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_100_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_100_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_100_CB1((uint)(6)).w * BA_Fragment_100_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_100_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_100_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_101_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_101_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_101_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_101_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_101_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_101_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_101_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_101_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_101_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_101_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_101_CB1((uint)(6)).w * BA_Fragment_101_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_101_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_101_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_102_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_102_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_102_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_102_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_102_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_102_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_102_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_102_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_102_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_102_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_102_CB1((uint)(6)).w * BA_Fragment_102_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_102_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_102_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_103_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_103_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.x = cmp(BA_Fragment_103_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_103_CB0((uint)(20)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_103_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_103_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_103_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_103_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_103_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_103_CB1((uint)(6)).w * BA_Fragment_103_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_103_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_103_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_104_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_104_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.x = cmp(BA_Fragment_104_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_104_CB0((uint)(20)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_104_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_104_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_104_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_104_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_104_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_104_CB1((uint)(6)).w * BA_Fragment_104_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_104_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_104_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_105_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_105_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_105_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_105_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_105_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_105_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_105_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_105_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_105_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_105_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_105_CB1((uint)(6)).w * BA_Fragment_105_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_105_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_105_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_106_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_106_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_106_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_106_CB0((uint)(25)).w == 0.000000);
  r0.yzw = BA_Fragment_106_CB0((uint)(20)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_106_CB0((uint)(65)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_106_CB0((uint)(66)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_106_CB0((uint)(67)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_106_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_106_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = BA_Fragment_106_CB1((uint)(6)).w * BA_Fragment_106_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_106_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_106_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_107_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_107_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.x = BA_Fragment_107_CB1((uint)(8)).x + -BA_Fragment_107_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_107_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_107_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_107_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_107_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_107_CB1((uint)(6)).w * BA_Fragment_107_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_107_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_107_CB0((uint)(20)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_107_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_107_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_107_CB0((uint)(67)).z;
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
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_108_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_108_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.x = BA_Fragment_108_CB1((uint)(8)).x + -BA_Fragment_108_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_108_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_108_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_108_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_108_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_108_CB1((uint)(6)).w * BA_Fragment_108_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_108_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_108_CB0((uint)(20)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_108_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_108_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_108_CB0((uint)(67)).z;
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
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_109_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_109_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_109_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_109_CB1((uint)(8)).x + -BA_Fragment_109_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_109_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_109_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_109_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_109_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_109_CB1((uint)(6)).w * BA_Fragment_109_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_109_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_109_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_109_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_109_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_109_CB0((uint)(67)).z;
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
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_110_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_110_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_110_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_110_CB1((uint)(8)).x + -BA_Fragment_110_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_110_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_110_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_110_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_110_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_110_CB1((uint)(6)).w * BA_Fragment_110_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_110_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_110_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_110_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_110_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_110_CB0((uint)(67)).z;
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
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_111_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_111_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.x = BA_Fragment_111_CB1((uint)(8)).x + -BA_Fragment_111_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_111_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_111_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_111_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_111_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_111_CB1((uint)(6)).w * BA_Fragment_111_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_111_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_111_CB0((uint)(20)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_111_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_111_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_111_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_111_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_111_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_112_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_112_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.x = BA_Fragment_112_CB1((uint)(8)).x + -BA_Fragment_112_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_112_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_112_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_112_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_112_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_112_CB1((uint)(6)).w * BA_Fragment_112_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_112_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_112_CB0((uint)(20)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_112_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_112_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_112_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_112_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_112_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_113_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_113_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_113_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_113_CB1((uint)(8)).x + -BA_Fragment_113_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_113_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_113_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_113_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_113_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_113_CB1((uint)(6)).w * BA_Fragment_113_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_113_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_113_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_113_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_113_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_113_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_113_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_113_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_114_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_114_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_114_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_114_CB1((uint)(8)).x + -BA_Fragment_114_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_114_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_114_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_114_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_114_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_114_CB1((uint)(6)).w * BA_Fragment_114_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_114_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_114_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_114_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_114_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_114_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_114_CB0((uint)(60)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_114_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_115_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_115_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.x = BA_Fragment_115_CB1((uint)(8)).x + -BA_Fragment_115_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_115_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_115_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_115_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_115_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_115_CB1((uint)(6)).w * BA_Fragment_115_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_115_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_115_CB0((uint)(20)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_115_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_115_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_115_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_115_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_115_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_116_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_116_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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

  r0.x = BA_Fragment_116_CB1((uint)(8)).x + -BA_Fragment_116_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_116_CB1((uint)(6)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_116_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_116_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_116_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_116_CB1((uint)(6)).w * BA_Fragment_116_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_116_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_116_CB0((uint)(20)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_116_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_116_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_116_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_116_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_116_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_117_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_117_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_117_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_117_CB1((uint)(8)).x + -BA_Fragment_117_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_117_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_117_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_117_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_117_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_117_CB1((uint)(6)).w * BA_Fragment_117_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_117_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_117_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_117_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_117_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_117_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_117_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_117_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_118_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 5u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 6u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 7u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 8u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_118_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 20u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 25u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 65u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 67u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
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
  r0.x = -BA_Fragment_118_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_118_CB1((uint)(8)).x + -BA_Fragment_118_CB1((uint)(8)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_118_CB1((uint)(6)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_118_CB1((uint)(7)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_118_CB1((uint)(5)).xyz * r0.yyy;
  r1.y = -BA_Fragment_118_CB1((uint)(8)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_118_CB1((uint)(6)).w * BA_Fragment_118_CB1((uint)(6)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_118_CB0((uint)(25)).w == 0.000000);
  r1.xyz = BA_Fragment_118_CB0((uint)(20)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_118_CB0((uint)(65)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_118_CB0((uint)(66)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_118_CB0((uint)(67)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_118_CB0((uint)(60)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_118_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
