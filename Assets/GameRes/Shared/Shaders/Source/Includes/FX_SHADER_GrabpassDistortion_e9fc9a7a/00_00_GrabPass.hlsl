// Exact names and types from the original compiled parameter metadata.
float4 _DistPowSpeed;
float4 _GrabScaleParam;
float4 _MainTex_ST;
float _MaskSpeedX;
float _MaskSpeedY;
float4 _MaskTex_ST;
Texture2D<float4> _GrabPassTexture;
Texture2D<float4> _MainTex;
Texture2D<float4> _MaskTex;
SamplerState sampler_GrabPassTexture;
SamplerState sampler_MainTex;
SamplerState sampler_MaskTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(_USECUSTOMDATA_ON) && !defined(_USEMASKDIST_ON) && !defined(_USEOUTSIDEMASK_FRESNEL) && defined(_USEOUTSIDEMASK_NONE) && !defined(_USEOUTSIDEMASK_UV) && !defined(_USESCREENUV_ON)
float4 BA_Vertex_1_CB1(uint i)
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

float4 BA_Vertex_1_CB0(uint i)
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
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : NORMAL0,
  out float4 o2 : COLOR0,
  out float2 o3 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_1_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_1_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_1_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_1_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_1_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  r0.x = dot(v1.xyz, BA_Vertex_1_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_1_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_1_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o1.xyz = r0.xyz * r0.www;
  o2.xyzw = v2.xyzw;
  o3.xy = v3.xy;
  return;
}
#elif defined(_USECUSTOMDATA_ON) && !defined(_USEMASKDIST_ON) && !defined(_USEOUTSIDEMASK_FRESNEL) && defined(_USEOUTSIDEMASK_NONE) && !defined(_USEOUTSIDEMASK_UV) && !defined(_USESCREENUV_ON)
float4 BA_Vertex_2_CB1(uint i)
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

float4 BA_Vertex_2_CB0(uint i)
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float2 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : NORMAL0,
  out float4 o2 : COLOR0,
  out float2 o3 : TEXCOORD0,
  out float2 p3 : TEXCOORD2,
  out float4 o4 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  p3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_2_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_2_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  r0.x = dot(v1.xyz, BA_Vertex_2_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_2_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_2_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o1.xyz = r0.xyz * r0.www;
  o2.xyzw = v2.xyzw;
  o3.xy = v3.xy;
  p3.xy = v5.xy;
  o4.xyzw = v4.xyzw;
  return;
}
#elif defined(_USECUSTOMDATA_ON) && defined(_USEMASKDIST_ON) && !defined(_USEOUTSIDEMASK_FRESNEL) && defined(_USEOUTSIDEMASK_NONE) && !defined(_USEOUTSIDEMASK_UV) && defined(_USESCREENUV_ON)
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
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float2 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : NORMAL0,
  out float4 o2 : COLOR0,
  out float2 o3 : TEXCOORD0,
  out float2 p3 : TEXCOORD2,
  out float4 o4 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  p3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_3_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_3_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  r0.x = dot(v1.xyz, BA_Vertex_3_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_3_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_3_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o1.xyz = r0.xyz * r0.www;
  o2.xyzw = v2.xyzw;
  o3.xy = v3.xy;
  p3.xy = v5.xy;
  o4.xyzw = v4.xyzw;
  return;
}
#elif defined(_USECUSTOMDATA_ON) && defined(_USEMASKDIST_ON) && !defined(_USEOUTSIDEMASK_FRESNEL) && !defined(_USEOUTSIDEMASK_NONE) && defined(_USEOUTSIDEMASK_UV) && !defined(_USESCREENUV_ON)
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
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float2 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : NORMAL0,
  out float4 o2 : COLOR0,
  out float2 o3 : TEXCOORD0,
  out float2 p3 : TEXCOORD2,
  out float4 o4 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  p3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_4_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_4_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  r0.x = dot(v1.xyz, BA_Vertex_4_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_4_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_4_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o1.xyz = r0.xyz * r0.www;
  o2.xyzw = v2.xyzw;
  o3.xy = v3.xy;
  p3.xy = v5.xy;
  o4.xyzw = v4.xyzw;
  return;
}
#elif defined(_USECUSTOMDATA_ON) && !defined(_USEMASKDIST_ON) && defined(_USEOUTSIDEMASK_FRESNEL) && !defined(_USEOUTSIDEMASK_NONE) && !defined(_USEOUTSIDEMASK_UV) && !defined(_USESCREENUV_ON)
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
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float2 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : NORMAL0,
  out float4 o2 : COLOR0,
  out float2 o3 : TEXCOORD0,
  out float2 p3 : TEXCOORD2,
  out float4 o4 : TEXCOORD1,
  out float3 o5 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  p3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_5_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_5_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_5_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_5_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o5.xyz = r0.xyz;
  r0.x = dot(v1.xyz, BA_Vertex_5_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_5_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_5_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o1.xyz = r0.xyz * r0.www;
  o2.xyzw = v2.xyzw;
  o3.xy = v3.xy;
  p3.xy = v5.xy;
  o4.xyzw = v4.xyzw;
  return;
}
#elif !defined(_USECUSTOMDATA_ON) && defined(_USEMASKDIST_ON) && defined(_USEOUTSIDEMASK_FRESNEL) && !defined(_USEOUTSIDEMASK_NONE) && !defined(_USEOUTSIDEMASK_UV) && !defined(_USESCREENUV_ON)
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
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float3 o1 : NORMAL0,
  out float4 o2 : COLOR0,
  out float4 o3 : TEXCOORD0,
  out float3 o4 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_6_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_6_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_6_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_6_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_6_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o4.xyz = r0.xyz;
  r0.x = dot(v1.xyz, BA_Vertex_6_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_6_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_6_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o1.xyz = r0.xyz * r0.www;
  o2.xyzw = v2.xyzw;
  o3.xy = v3.xy;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Vert(float4 position : POSITION, out float4 clip : SV_POSITION) { clip = TransformObjectToHClip(position.xyz); }
#endif

#if !defined(_USECUSTOMDATA_ON) && !defined(_USEMASKDIST_ON) && !defined(_USEOUTSIDEMASK_FRESNEL) && defined(_USEOUTSIDEMASK_NONE) && !defined(_USEOUTSIDEMASK_UV) && !defined(_USESCREENUV_ON)
float4 BA_Fragment_9_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_GrabScaleParam.x, _GrabScaleParam.y, _GrabScaleParam.z, _GrabScaleParam.w);
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 2u) value = float4(_MaskTex_ST.x, _MaskTex_ST.y, _MaskTex_ST.z, _MaskTex_ST.w);
  if (i == 3u) value = float4(_DistPowSpeed.x, _DistPowSpeed.y, _DistPowSpeed.z, _DistPowSpeed.w);
  if (i == 4u) value = float4(_MaskSpeedX, _MaskSpeedY, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_9_CB0(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_ScaledScreenParams.x, _ScaledScreenParams.y, _ScaledScreenParams.z, _ScaledScreenParams.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 23u) value = float4(_ScaleBiasRt.x, _ScaleBiasRt.y, _ScaleBiasRt.z, _ScaleBiasRt.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_9_CB1((uint)(3)).zw * BA_Fragment_9_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v3.xy * BA_Fragment_9_CB1((uint)(1)).xy + BA_Fragment_9_CB1((uint)(1)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = BA_Fragment_9_CB1((uint)(3)).xy + r0.xy;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_9_CB0((uint)(19)).x).xyzw;
  r0.xy = BA_Fragment_9_CB1((uint)(3)).xy * r0.xy;
  r0.zw = BA_Fragment_9_CB1((uint)(4)).xy * BA_Fragment_9_CB0((uint)(11)).yy;
  r0.zw = frac(r0.zw);
  r1.xy = v3.xy * BA_Fragment_9_CB1((uint)(2)).xy + BA_Fragment_9_CB1((uint)(2)).zw;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, r0.zw, BA_Fragment_9_CB0((uint)(19)).x).xyzw;
  r1.x = saturate(r1.x);
  r0.xy = r1.xx * r0.xy;
  r0.xy = v2.ww * r0.xy;
  r0.zw = float2(1,1) / BA_Fragment_9_CB0((uint)(4)).xy;
  r1.xy = v0.xy * r0.zw;
  r0.z = r1.y * BA_Fragment_9_CB0((uint)(23)).x + BA_Fragment_9_CB0((uint)(23)).y;
  r1.z = 1 + -r0.z;
  r0.xy = r1.xz * BA_Fragment_9_CB1((uint)(0)).xy + r0.xy;
  r0.xyzw = _GrabPassTexture.SampleBias(sampler_GrabPassTexture, r0.xy, BA_Fragment_9_CB0((uint)(19)).x).xyzw;
  o0.xyz = v2.xyz * r0.xyz;
  o0.w = r0.w;
  return;
}
#elif defined(_USECUSTOMDATA_ON) && !defined(_USEMASKDIST_ON) && !defined(_USEOUTSIDEMASK_FRESNEL) && defined(_USEOUTSIDEMASK_NONE) && !defined(_USEOUTSIDEMASK_UV) && !defined(_USESCREENUV_ON)
float4 BA_Fragment_10_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_GrabScaleParam.x, _GrabScaleParam.y, _GrabScaleParam.z, _GrabScaleParam.w);
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 2u) value = float4(_MaskTex_ST.x, _MaskTex_ST.y, _MaskTex_ST.z, _MaskTex_ST.w);
  if (i == 3u) value = float4(_DistPowSpeed.x, _DistPowSpeed.y, _DistPowSpeed.z, _DistPowSpeed.w);
  if (i == 4u) value = float4(_MaskSpeedX, _MaskSpeedY, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_10_CB0(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_ScaledScreenParams.x, _ScaledScreenParams.y, _ScaledScreenParams.z, _ScaledScreenParams.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 23u) value = float4(_ScaleBiasRt.x, _ScaleBiasRt.y, _ScaleBiasRt.z, _ScaleBiasRt.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  float2 w3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_10_CB1((uint)(3)).zw * BA_Fragment_10_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v3.xy * BA_Fragment_10_CB1((uint)(1)).xy + BA_Fragment_10_CB1((uint)(1)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = v4.xy + r0.xy;
  r0.zw = BA_Fragment_10_CB1((uint)(3)).xy + v4.zw;
  r0.xy = r0.xy + r0.zw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_10_CB0((uint)(19)).x).xyzw;
  r0.xy = r1.xy * r0.zw;
  r0.zw = BA_Fragment_10_CB1((uint)(4)).xy * BA_Fragment_10_CB0((uint)(11)).yy;
  r0.zw = frac(r0.zw);
  r1.xy = v3.xy * BA_Fragment_10_CB1((uint)(2)).xy + BA_Fragment_10_CB1((uint)(2)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = w3.xy + r0.zw;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, r0.zw, BA_Fragment_10_CB0((uint)(19)).x).xyzw;
  r1.x = saturate(r1.x);
  r0.xy = r1.xx * r0.xy;
  r0.xy = v2.ww * r0.xy;
  r0.zw = float2(1,1) / BA_Fragment_10_CB0((uint)(4)).xy;
  r1.xy = v0.xy * r0.zw;
  r0.z = r1.y * BA_Fragment_10_CB0((uint)(23)).x + BA_Fragment_10_CB0((uint)(23)).y;
  r1.z = 1 + -r0.z;
  r0.xy = r1.xz * BA_Fragment_10_CB1((uint)(0)).xy + r0.xy;
  r0.xyzw = _GrabPassTexture.SampleBias(sampler_GrabPassTexture, r0.xy, BA_Fragment_10_CB0((uint)(19)).x).xyzw;
  o0.xyz = v2.xyz * r0.xyz;
  o0.w = r0.w;
  return;
}
#elif defined(_USECUSTOMDATA_ON) && defined(_USEMASKDIST_ON) && !defined(_USEOUTSIDEMASK_FRESNEL) && defined(_USEOUTSIDEMASK_NONE) && !defined(_USEOUTSIDEMASK_UV) && defined(_USESCREENUV_ON)
float4 BA_Fragment_11_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_GrabScaleParam.x, _GrabScaleParam.y, _GrabScaleParam.z, _GrabScaleParam.w);
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 2u) value = float4(_MaskTex_ST.x, _MaskTex_ST.y, _MaskTex_ST.z, _MaskTex_ST.w);
  if (i == 3u) value = float4(_DistPowSpeed.x, _DistPowSpeed.y, _DistPowSpeed.z, _DistPowSpeed.w);
  if (i == 4u) value = float4(_MaskSpeedX, _MaskSpeedY, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_11_CB0(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_ScaledScreenParams.x, _ScaledScreenParams.y, _ScaledScreenParams.z, _ScaledScreenParams.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 23u) value = float4(_ScaleBiasRt.x, _ScaleBiasRt.y, _ScaleBiasRt.z, _ScaleBiasRt.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  float2 w3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_11_CB1((uint)(4)).xy * BA_Fragment_11_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v3.xy * BA_Fragment_11_CB1((uint)(2)).xy + BA_Fragment_11_CB1((uint)(2)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = w3.xy + r0.xy;
  r0.zw = float2(1,1) / BA_Fragment_11_CB0((uint)(4)).xy;
  r1.xy = v0.xy * r0.zw;
  r0.z = r1.y * BA_Fragment_11_CB0((uint)(23)).x + BA_Fragment_11_CB0((uint)(23)).y;
  r1.z = 1 + -r0.z;
  r0.zw = BA_Fragment_11_CB1((uint)(0)).xy * r1.xz;
  r1.xy = r0.zw * BA_Fragment_11_CB1((uint)(1)).xy + BA_Fragment_11_CB1((uint)(1)).zw;
  r1.zw = BA_Fragment_11_CB1((uint)(3)).zw * BA_Fragment_11_CB0((uint)(11)).yy;
  r1.zw = frac(r1.zw);
  r1.xy = r1.xy + r1.zw;
  r1.xy = v4.xy + r1.xy;
  r1.zw = BA_Fragment_11_CB1((uint)(3)).xy + v4.zw;
  r1.xy = r1.xy + r1.zw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r1.xy, BA_Fragment_11_CB0((uint)(19)).x).xyzw;
  r0.xy = r2.xy * r1.zw + r0.xy;
  r1.xy = r2.xy * r1.zw;
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, r0.xy, BA_Fragment_11_CB0((uint)(19)).x).xyzw;
  r2.x = saturate(r2.x);
  r0.xy = r2.xx * r1.xy;
  r0.xy = r0.xy * v2.ww + r0.zw;
  r0.xyzw = _GrabPassTexture.SampleBias(sampler_GrabPassTexture, r0.xy, BA_Fragment_11_CB0((uint)(19)).x).xyzw;
  o0.xyz = v2.xyz * r0.xyz;
  o0.w = r0.w;
  return;
}
#elif defined(_USECUSTOMDATA_ON) && defined(_USEMASKDIST_ON) && !defined(_USEOUTSIDEMASK_FRESNEL) && !defined(_USEOUTSIDEMASK_NONE) && defined(_USEOUTSIDEMASK_UV) && !defined(_USESCREENUV_ON)
float4 BA_Fragment_12_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_GrabScaleParam.x, _GrabScaleParam.y, _GrabScaleParam.z, _GrabScaleParam.w);
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 2u) value = float4(_MaskTex_ST.x, _MaskTex_ST.y, _MaskTex_ST.z, _MaskTex_ST.w);
  if (i == 3u) value = float4(_DistPowSpeed.x, _DistPowSpeed.y, _DistPowSpeed.z, _DistPowSpeed.w);
  if (i == 4u) value = float4(_MaskSpeedX, _MaskSpeedY, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_12_CB0(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_ScaledScreenParams.x, _ScaledScreenParams.y, _ScaledScreenParams.z, _ScaledScreenParams.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 23u) value = float4(_ScaleBiasRt.x, _ScaleBiasRt.y, _ScaleBiasRt.z, _ScaleBiasRt.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  float2 w3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_12_CB1((uint)(4)).xy * BA_Fragment_12_CB0((uint)(11)).yy;
  r0.xy = frac(r0.xy);
  r0.zw = v3.xy * BA_Fragment_12_CB1((uint)(2)).xy + BA_Fragment_12_CB1((uint)(2)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xy = w3.xy + r0.xy;
  r0.zw = BA_Fragment_12_CB1((uint)(3)).zw * BA_Fragment_12_CB0((uint)(11)).yy;
  r0.zw = frac(r0.zw);
  r1.xy = v3.xy * BA_Fragment_12_CB1((uint)(1)).xy + BA_Fragment_12_CB1((uint)(1)).zw;
  r0.zw = r1.xy + r0.zw;
  r0.zw = v4.xy + r0.zw;
  r1.xy = BA_Fragment_12_CB1((uint)(3)).xy + v4.zw;
  r0.zw = r1.xy + r0.zw;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.zw, BA_Fragment_12_CB0((uint)(19)).x).xyzw;
  r0.xy = r2.xy * r1.xy + r0.xy;
  r0.zw = r2.xy * r1.xy;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, r0.xy, BA_Fragment_12_CB0((uint)(19)).x).xyzw;
  r1.x = saturate(r1.x);
  r0.xy = float2(-0.5,-0.5) + v3.xy;
  r0.xy = saturate(-abs(r0.xy) * float2(10,10) + float2(5,5));
  r0.x = r0.x * r0.y;
  r0.x = r1.x * r0.x;
  r0.xy = r0.zw * r0.xx;
  r0.xy = v2.ww * r0.xy;
  r0.zw = float2(1,1) / BA_Fragment_12_CB0((uint)(4)).xy;
  r1.xy = v0.xy * r0.zw;
  r0.z = r1.y * BA_Fragment_12_CB0((uint)(23)).x + BA_Fragment_12_CB0((uint)(23)).y;
  r1.z = 1 + -r0.z;
  r0.xy = r1.xz * BA_Fragment_12_CB1((uint)(0)).xy + r0.xy;
  r0.xyzw = _GrabPassTexture.SampleBias(sampler_GrabPassTexture, r0.xy, BA_Fragment_12_CB0((uint)(19)).x).xyzw;
  o0.xyz = v2.xyz * r0.xyz;
  o0.w = r0.w;
  return;
}
#elif defined(_USECUSTOMDATA_ON) && !defined(_USEMASKDIST_ON) && defined(_USEOUTSIDEMASK_FRESNEL) && !defined(_USEOUTSIDEMASK_NONE) && !defined(_USEOUTSIDEMASK_UV) && !defined(_USESCREENUV_ON)
float4 BA_Fragment_13_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_GrabScaleParam.x, _GrabScaleParam.y, _GrabScaleParam.z, _GrabScaleParam.w);
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 2u) value = float4(_MaskTex_ST.x, _MaskTex_ST.y, _MaskTex_ST.z, _MaskTex_ST.w);
  if (i == 3u) value = float4(_DistPowSpeed.x, _DistPowSpeed.y, _DistPowSpeed.z, _DistPowSpeed.w);
  if (i == 4u) value = float4(_MaskSpeedX, _MaskSpeedY, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_13_CB0(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_ScaledScreenParams.x, _ScaledScreenParams.y, _ScaledScreenParams.z, _ScaledScreenParams.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 23u) value = float4(_ScaleBiasRt.x, _ScaleBiasRt.y, _ScaleBiasRt.z, _ScaleBiasRt.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  float2 w3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float3 v5 : TEXCOORD3,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_13_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_13_CB0((uint)(16)).xyz + -v5.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_13_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_13_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_13_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.w = dot(v1.xyz, v1.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = v1.xyz * r0.www;
  r0.x = dot(r1.xyz, r0.xyz);
  r0.x = r0.x * r0.x;
  r0.x = min(1, r0.x);
  r0.yz = BA_Fragment_13_CB1((uint)(4)).xy * BA_Fragment_13_CB0((uint)(11)).yy;
  r0.yz = frac(r0.yz);
  r1.xy = v3.xy * BA_Fragment_13_CB1((uint)(2)).xy + BA_Fragment_13_CB1((uint)(2)).zw;
  r0.yz = r1.xy + r0.yz;
  r0.yz = w3.xy + r0.yz;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, r0.yz, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  r1.x = saturate(r1.x);
  r0.x = r1.x * r0.x;
  r0.yz = BA_Fragment_13_CB1((uint)(3)).zw * BA_Fragment_13_CB0((uint)(11)).yy;
  r0.yz = frac(r0.yz);
  r1.xy = v3.xy * BA_Fragment_13_CB1((uint)(1)).xy + BA_Fragment_13_CB1((uint)(1)).zw;
  r0.yz = r1.xy + r0.yz;
  r0.yz = v4.xy + r0.yz;
  r1.xy = BA_Fragment_13_CB1((uint)(3)).xy + v4.zw;
  r0.yz = r1.xy + r0.yz;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.yz, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  r0.yz = r2.xy * r1.xy;
  r0.xy = r0.yz * r0.xx;
  r0.xy = v2.ww * r0.xy;
  r0.zw = float2(1,1) / BA_Fragment_13_CB0((uint)(4)).xy;
  r1.xy = v0.xy * r0.zw;
  r0.z = r1.y * BA_Fragment_13_CB0((uint)(23)).x + BA_Fragment_13_CB0((uint)(23)).y;
  r1.z = 1 + -r0.z;
  r0.xy = r1.xz * BA_Fragment_13_CB1((uint)(0)).xy + r0.xy;
  r0.xyzw = _GrabPassTexture.SampleBias(sampler_GrabPassTexture, r0.xy, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  o0.xyz = v2.xyz * r0.xyz;
  o0.w = r0.w;
  return;
}
#elif !defined(_USECUSTOMDATA_ON) && defined(_USEMASKDIST_ON) && defined(_USEOUTSIDEMASK_FRESNEL) && !defined(_USEOUTSIDEMASK_NONE) && !defined(_USEOUTSIDEMASK_UV) && !defined(_USESCREENUV_ON)
float4 BA_Fragment_14_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_GrabScaleParam.x, _GrabScaleParam.y, _GrabScaleParam.z, _GrabScaleParam.w);
  if (i == 1u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 2u) value = float4(_MaskTex_ST.x, _MaskTex_ST.y, _MaskTex_ST.z, _MaskTex_ST.w);
  if (i == 3u) value = float4(_DistPowSpeed.x, _DistPowSpeed.y, _DistPowSpeed.z, _DistPowSpeed.w);
  if (i == 4u) value = float4(_MaskSpeedX, _MaskSpeedY, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_14_CB0(uint i)
{
  float4 value = 0;
  if (i == 4u) value = float4(_ScaledScreenParams.x, _ScaledScreenParams.y, _ScaledScreenParams.z, _ScaledScreenParams.w);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 23u) value = float4(_ScaleBiasRt.x, _ScaleBiasRt.y, _ScaleBiasRt.z, _ScaleBiasRt.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float3 v4 : TEXCOORD3,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_14_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_14_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_14_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_14_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_14_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.w = dot(v1.xyz, v1.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = v1.xyz * r0.www;
  r0.x = dot(r1.xyz, r0.xyz);
  r0.x = r0.x * r0.x;
  r0.x = min(1, r0.x);
  r0.yz = BA_Fragment_14_CB1((uint)(4)).xy * BA_Fragment_14_CB0((uint)(11)).yy;
  r0.yz = frac(r0.yz);
  r1.xy = v3.xy * BA_Fragment_14_CB1((uint)(2)).xy + BA_Fragment_14_CB1((uint)(2)).zw;
  r0.yz = r1.xy + r0.yz;
  r1.xy = BA_Fragment_14_CB1((uint)(3)).zw * BA_Fragment_14_CB0((uint)(11)).yy;
  r1.xy = frac(r1.xy);
  r1.zw = v3.xy * BA_Fragment_14_CB1((uint)(1)).xy + BA_Fragment_14_CB1((uint)(1)).zw;
  r1.xy = r1.zw + r1.xy;
  r1.xy = BA_Fragment_14_CB1((uint)(3)).xy + r1.xy;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r1.xy, BA_Fragment_14_CB0((uint)(19)).x).xyzw;
  r0.yz = r1.xy * BA_Fragment_14_CB1((uint)(3)).xy + r0.yz;
  r1.xy = BA_Fragment_14_CB1((uint)(3)).xy * r1.xy;
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, r0.yz, BA_Fragment_14_CB0((uint)(19)).x).xyzw;
  r2.x = saturate(r2.x);
  r0.x = r2.x * r0.x;
  r0.xy = r1.xy * r0.xx;
  r0.xy = v2.ww * r0.xy;
  r0.zw = float2(1,1) / BA_Fragment_14_CB0((uint)(4)).xy;
  r1.xy = v0.xy * r0.zw;
  r0.z = r1.y * BA_Fragment_14_CB0((uint)(23)).x + BA_Fragment_14_CB0((uint)(23)).y;
  r1.z = 1 + -r0.z;
  r0.xy = r1.xz * BA_Fragment_14_CB1((uint)(0)).xy + r0.xy;
  r0.xyzw = _GrabPassTexture.SampleBias(sampler_GrabPassTexture, r0.xy, BA_Fragment_14_CB0((uint)(19)).x).xyzw;
  o0.xyz = v2.xyz * r0.xyz;
  o0.w = r0.w;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Frag(out float4 color : SV_TARGET0) { color = float4(1,0,1,1); }
#endif
