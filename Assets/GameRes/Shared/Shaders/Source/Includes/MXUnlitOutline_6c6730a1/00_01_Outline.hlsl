// Exact names and types from the original compiled parameter metadata.
float4 _OutlineTint;
float _OutlineZCorrection;
Texture2D<float4> _MainTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR)
float4 BA_Vertex_10_CB2(uint i)
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

float4 BA_Vertex_10_CB1(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 3u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_10_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
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

  r0.xyz = BA_Vertex_10_CB2((uint)(5)).xyz * BA_Vertex_10_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_10_CB2((uint)(4)).xyz * BA_Vertex_10_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_10_CB2((uint)(6)).xyz * BA_Vertex_10_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_10_CB2((uint)(7)).xyz * BA_Vertex_10_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_10_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_10_CB2((uint)(5)).xyz * BA_Vertex_10_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_10_CB2((uint)(4)).xyz * BA_Vertex_10_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_10_CB2((uint)(6)).xyz * BA_Vertex_10_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_10_CB2((uint)(7)).xyz * BA_Vertex_10_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_10_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_10_CB2((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_10_CB2((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB2((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB2((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_10_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_10_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_10_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_10_CB0((uint)(18)).x / BA_Vertex_10_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_10_CB1((uint)(3)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_10_CB1((uint)(2)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_10_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR)
float4 BA_Vertex_11_CB2(uint i)
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

float4 BA_Vertex_11_CB1(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 3u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_11_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
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

  r0.xyz = BA_Vertex_11_CB2((uint)(5)).xyz * BA_Vertex_11_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_11_CB2((uint)(4)).xyz * BA_Vertex_11_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_11_CB2((uint)(6)).xyz * BA_Vertex_11_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_11_CB2((uint)(7)).xyz * BA_Vertex_11_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_11_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_11_CB2((uint)(5)).xyz * BA_Vertex_11_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_11_CB2((uint)(4)).xyz * BA_Vertex_11_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_11_CB2((uint)(6)).xyz * BA_Vertex_11_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_11_CB2((uint)(7)).xyz * BA_Vertex_11_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_11_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_11_CB2((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_11_CB2((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB2((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB2((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_11_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_11_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_11_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_11_CB0((uint)(18)).x / BA_Vertex_11_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_11_CB1((uint)(3)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_11_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_11_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_11_CB0((uint)(55)).z + BA_Vertex_11_CB0((uint)(55)).w);
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_11_CB1((uint)(2)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_11_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR)
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_12_CB1(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 3u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_12_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
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

  r0.xyz = BA_Vertex_12_CB2((uint)(5)).xyz * BA_Vertex_12_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_12_CB2((uint)(4)).xyz * BA_Vertex_12_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_12_CB2((uint)(6)).xyz * BA_Vertex_12_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_12_CB2((uint)(7)).xyz * BA_Vertex_12_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_12_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_12_CB2((uint)(5)).xyz * BA_Vertex_12_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_12_CB2((uint)(4)).xyz * BA_Vertex_12_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_12_CB2((uint)(6)).xyz * BA_Vertex_12_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_12_CB2((uint)(7)).xyz * BA_Vertex_12_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_12_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_12_CB2((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_12_CB2((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_12_CB2((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_12_CB2((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_12_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_12_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_12_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_12_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_12_CB0((uint)(18)).x / BA_Vertex_12_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_12_CB1((uint)(3)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_12_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_12_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_12_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _MainTex.SampleLevel(sampler_MainTex, v4.xy, 0).xyzw;
  r0.xyz = BA_Vertex_12_CB1((uint)(2)).xyz * r0.xyz;
  o1.xyz = BA_Vertex_12_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = 1;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR)

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
#elif !defined(FOG_EXP) && defined(FOG_LINEAR)
float4 BA_Fragment_16_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
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

  r0.xyz = -BA_Fragment_16_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_16_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR)
float4 BA_Fragment_17_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
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
  r0.yzw = -BA_Fragment_17_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_17_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
