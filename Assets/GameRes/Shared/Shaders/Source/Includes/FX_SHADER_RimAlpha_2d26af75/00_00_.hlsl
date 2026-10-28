// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float _Custom_Data_MainMask_Offset_Use;
float4 _MainTex_ST;
float _Multiply;
float _RGBRGBA;
float _RimFlip;
float _RimSharpness;
float _RimStrength;
Texture2D<float4> _MainTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_IS_MULTIPLY) && !defined(_IS_PMA)
float4 BA_Vertex_1_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, 0.0, _Custom_Data_MainMask_Offset_Use);
  return value;
}

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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COlOR0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD0,
  out float3 o4 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_1_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_1_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_1_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_1_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_1_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_1_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = BA_Vertex_1_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v1.xyzw;
  r0.x = dot(v2.xyz, BA_Vertex_1_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_1_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_1_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r0.xyz * r0.www;
  r0.xy = v3.xy * BA_Vertex_1_CB2((uint)(0)).xy + BA_Vertex_1_CB2((uint)(0)).zw;
  o3.xy = BA_Vertex_1_CB2((uint)(3)).ww * v4.xy + r0.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_IS_MULTIPLY) && !defined(_IS_PMA)
float4 BA_Vertex_2_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, 0.0, _Custom_Data_MainMask_Offset_Use);
  return value;
}

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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COlOR0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD0,
  out float3 o4 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_2_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_2_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_2_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_2_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_2_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = BA_Vertex_2_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v1.xyzw;
  r0.x = dot(v2.xyz, BA_Vertex_2_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_2_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_2_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r0.xyz * r0.www;
  r0.xy = v3.xy * BA_Vertex_2_CB2((uint)(0)).xy + BA_Vertex_2_CB2((uint)(0)).zw;
  o3.xy = BA_Vertex_2_CB2((uint)(3)).ww * v4.xy + r0.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_IS_MULTIPLY) && defined(_IS_PMA)
float4 BA_Vertex_3_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, 0.0, _Custom_Data_MainMask_Offset_Use);
  return value;
}

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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COlOR0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD0,
  out float3 o4 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_3_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_3_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_3_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_3_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_3_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = BA_Vertex_3_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v1.xyzw;
  r0.x = dot(v2.xyz, BA_Vertex_3_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_3_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_3_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r0.xyz * r0.www;
  r0.xy = v3.xy * BA_Vertex_3_CB2((uint)(0)).xy + BA_Vertex_3_CB2((uint)(0)).zw;
  o3.xy = BA_Vertex_3_CB2((uint)(3)).ww * v4.xy + r0.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_IS_MULTIPLY) && !defined(_IS_PMA)
float4 BA_Vertex_4_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, 0.0, _Custom_Data_MainMask_Offset_Use);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COlOR0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD0,
  out float3 o4 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_4_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_4_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_4_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_4_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_4_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = BA_Vertex_4_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v1.xyzw;
  r0.x = dot(v2.xyz, BA_Vertex_4_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_4_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_4_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r0.xyz * r0.www;
  r0.xy = v3.xy * BA_Vertex_4_CB2((uint)(0)).xy + BA_Vertex_4_CB2((uint)(0)).zw;
  o3.xy = BA_Vertex_4_CB2((uint)(3)).ww * v4.xy + r0.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_IS_MULTIPLY) && !defined(_IS_PMA)
float4 BA_Vertex_5_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, 0.0, _Custom_Data_MainMask_Offset_Use);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COlOR0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD0,
  out float3 o4 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_5_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_5_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = BA_Vertex_5_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v1.xyzw;
  r0.x = dot(v2.xyz, BA_Vertex_5_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_5_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_5_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r0.xyz * r0.www;
  r0.xy = v3.xy * BA_Vertex_5_CB2((uint)(0)).xy + BA_Vertex_5_CB2((uint)(0)).zw;
  o3.xy = BA_Vertex_5_CB2((uint)(3)).ww * v4.xy + r0.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_IS_MULTIPLY) && defined(_IS_PMA)
float4 BA_Vertex_6_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, 0.0, _Custom_Data_MainMask_Offset_Use);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COlOR0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD0,
  out float3 o4 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_6_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_6_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_6_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_6_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_6_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_6_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = BA_Vertex_6_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v1.xyzw;
  r0.x = dot(v2.xyz, BA_Vertex_6_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_6_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_6_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r0.xyz * r0.www;
  r0.xy = v3.xy * BA_Vertex_6_CB2((uint)(0)).xy + BA_Vertex_6_CB2((uint)(0)).zw;
  o3.xy = BA_Vertex_6_CB2((uint)(3)).ww * v4.xy + r0.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_IS_MULTIPLY) && !defined(_IS_PMA)
float4 BA_Vertex_7_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, 0.0, _Custom_Data_MainMask_Offset_Use);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COlOR0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD0,
  out float3 o4 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_7_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_7_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_7_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_7_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_7_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_7_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = BA_Vertex_7_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v1.xyzw;
  r0.x = dot(v2.xyz, BA_Vertex_7_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_7_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_7_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r0.xyz * r0.www;
  r0.xy = v3.xy * BA_Vertex_7_CB2((uint)(0)).xy + BA_Vertex_7_CB2((uint)(0)).zw;
  o3.xy = BA_Vertex_7_CB2((uint)(3)).ww * v4.xy + r0.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_IS_MULTIPLY) && !defined(_IS_PMA)
float4 BA_Vertex_8_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, 0.0, _Custom_Data_MainMask_Offset_Use);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COlOR0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD0,
  out float3 o4 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_8_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_8_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_8_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_8_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_8_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_8_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = BA_Vertex_8_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v1.xyzw;
  r0.x = dot(v2.xyz, BA_Vertex_8_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_8_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_8_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r0.xyz * r0.www;
  r0.xy = v3.xy * BA_Vertex_8_CB2((uint)(0)).xy + BA_Vertex_8_CB2((uint)(0)).zw;
  o3.xy = BA_Vertex_8_CB2((uint)(3)).ww * v4.xy + r0.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_IS_MULTIPLY) && defined(_IS_PMA)
float4 BA_Vertex_9_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, 0.0, _Custom_Data_MainMask_Offset_Use);
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
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COlOR0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD0,
  out float3 o4 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_9_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_9_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_9_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_9_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyz = BA_Vertex_9_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v1.xyzw;
  r0.x = dot(v2.xyz, BA_Vertex_9_CB1((uint)(4)).xyz);
  r0.y = dot(v2.xyz, BA_Vertex_9_CB1((uint)(5)).xyz);
  r0.z = dot(v2.xyz, BA_Vertex_9_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r0.xyz * r0.www;
  r0.xy = v3.xy * BA_Vertex_9_CB2((uint)(0)).xy + BA_Vertex_9_CB2((uint)(0)).zw;
  o3.xy = BA_Vertex_9_CB2((uint)(3)).ww * v4.xy + r0.xy;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_IS_MULTIPLY) && !defined(_IS_PMA)
float4 BA_Fragment_11_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Multiply, 0.0, 0.0, _RimFlip);
  if (i == 3u) value = float4(_RimSharpness, _RimStrength, 0.0, 0.0);
  if (i == 4u) value = float4(_RGBRGBA, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_11_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COlOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float3 v4 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, v2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = v2.xyz * r0.xxx;
  r0.w = -BA_Fragment_11_CB1((uint)(2)).w * 2 + 1;
  r0.xyz = r0.www * r0.xyz;
  r0.w = dot(v4.xyz, v4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = v4.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = 1 + -r0.x;
  r0.x = log2(r0.x);
  r0.y = max(9.99999975e-005, BA_Fragment_11_CB1((uint)(3)).x);
  r0.x = r0.y * r0.x;
  r0.x = exp2(r0.x);
  r0.y = BA_Fragment_11_CB1((uint)(3)).y * r0.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v3.xy, BA_Fragment_11_CB0((uint)(19)).x).xyzw;
  r0.z = r1.w + -r1.x;
  r0.z = BA_Fragment_11_CB1((uint)(4)).x * r0.z + r1.x;
  r1.xyz = BA_Fragment_11_CB1((uint)(1)).xyz * r1.xyz;
  r1.xyz = v1.xyz * r1.xyz;
  r1.xyz = BA_Fragment_11_CB1((uint)(2)).xxx * r1.xyz;
  r1.w = saturate(r0.z * v1.w + -r0.y);
  r0.x = saturate(-r0.x * BA_Fragment_11_CB1((uint)(3)).y + r1.w);
  o0.xyzw = r1.xyzw * r0.xxxx;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_IS_MULTIPLY) && !defined(_IS_PMA)
float4 BA_Fragment_12_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Multiply, 0.0, 0.0, _RimFlip);
  if (i == 3u) value = float4(_RimSharpness, _RimStrength, 0.0, 0.0);
  if (i == 4u) value = float4(_RGBRGBA, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_12_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COlOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float3 v4 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, v2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = v2.xyz * r0.xxx;
  r0.w = -BA_Fragment_12_CB1((uint)(2)).w * 2 + 1;
  r0.xyz = r0.www * r0.xyz;
  r0.w = dot(v4.xyz, v4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = v4.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = 1 + -r0.x;
  r0.x = log2(r0.x);
  r0.y = max(9.99999975e-005, BA_Fragment_12_CB1((uint)(3)).x);
  r0.x = r0.y * r0.x;
  r0.x = exp2(r0.x);
  r0.y = BA_Fragment_12_CB1((uint)(3)).y * r0.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v3.xy, BA_Fragment_12_CB0((uint)(19)).x).xyzw;
  r0.z = r1.w + -r1.x;
  r0.z = BA_Fragment_12_CB1((uint)(4)).x * r0.z + r1.x;
  r1.xyz = BA_Fragment_12_CB1((uint)(1)).xyz * r1.xyz;
  r1.xyz = v1.xyz * r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_12_CB1((uint)(2)).xxx + float3(-1,-1,-1);
  r0.y = saturate(r0.z * v1.w + -r0.y);
  r0.x = saturate(-r0.x * BA_Fragment_12_CB1((uint)(3)).y + r0.y);
  o0.xyz = r0.xxx * r1.xyz + float3(1,1,1);
  o0.w = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_IS_MULTIPLY) && defined(_IS_PMA)
float4 BA_Fragment_13_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Multiply, 0.0, 0.0, _RimFlip);
  if (i == 3u) value = float4(_RimSharpness, _RimStrength, 0.0, 0.0);
  if (i == 4u) value = float4(_RGBRGBA, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_13_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COlOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float3 v4 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, v2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = v2.xyz * r0.xxx;
  r0.w = -BA_Fragment_13_CB1((uint)(2)).w * 2 + 1;
  r0.xyz = r0.www * r0.xyz;
  r0.w = dot(v4.xyz, v4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = v4.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = 1 + -r0.x;
  r0.x = log2(r0.x);
  r0.y = max(9.99999975e-005, BA_Fragment_13_CB1((uint)(3)).x);
  r0.x = r0.y * r0.x;
  r0.x = exp2(r0.x);
  r0.y = BA_Fragment_13_CB1((uint)(3)).y * r0.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v3.xy, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  r0.z = r1.w + -r1.x;
  r0.z = BA_Fragment_13_CB1((uint)(4)).x * r0.z + r1.x;
  r1.xyz = BA_Fragment_13_CB1((uint)(1)).xyz * r1.xyz;
  r1.xyz = v1.xyz * r1.xyz;
  r1.xyz = BA_Fragment_13_CB1((uint)(2)).xxx * r1.xyz;
  r1.w = saturate(r0.z * v1.w + -r0.y);
  r0.x = saturate(-r0.x * BA_Fragment_13_CB1((uint)(3)).y + r1.w);
  r0.xyzw = r1.xyzw * r0.xxxx;
  o0.xyz = r0.xyz * r0.www;
  o0.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_IS_MULTIPLY) && !defined(_IS_PMA)
float4 BA_Fragment_14_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Multiply, 0.0, 0.0, _RimFlip);
  if (i == 3u) value = float4(_RimSharpness, _RimStrength, 0.0, 0.0);
  if (i == 4u) value = float4(_RGBRGBA, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_14_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COlOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float3 v4 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, v2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = v2.xyz * r0.xxx;
  r0.w = -BA_Fragment_14_CB1((uint)(2)).w * 2 + 1;
  r0.xyz = r0.www * r0.xyz;
  r0.w = dot(v4.xyz, v4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = v4.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = 1 + -r0.x;
  r0.x = log2(r0.x);
  r0.y = max(9.99999975e-005, BA_Fragment_14_CB1((uint)(3)).x);
  r0.x = r0.y * r0.x;
  r0.x = exp2(r0.x);
  r0.y = BA_Fragment_14_CB1((uint)(3)).y * r0.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v3.xy, BA_Fragment_14_CB0((uint)(19)).x).xyzw;
  r0.z = r1.w + -r1.x;
  r0.z = BA_Fragment_14_CB1((uint)(4)).x * r0.z + r1.x;
  r1.xyz = BA_Fragment_14_CB1((uint)(1)).xyz * r1.xyz;
  r1.xyz = v1.xyz * r1.xyz;
  r1.xyz = BA_Fragment_14_CB1((uint)(2)).xxx * r1.xyz;
  r1.w = saturate(r0.z * v1.w + -r0.y);
  r0.x = saturate(-r0.x * BA_Fragment_14_CB1((uint)(3)).y + r1.w);
  o0.xyzw = r1.xyzw * r0.xxxx;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_IS_MULTIPLY) && !defined(_IS_PMA)
float4 BA_Fragment_15_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Multiply, 0.0, 0.0, _RimFlip);
  if (i == 3u) value = float4(_RimSharpness, _RimStrength, 0.0, 0.0);
  if (i == 4u) value = float4(_RGBRGBA, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_15_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COlOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float3 v4 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, v2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = v2.xyz * r0.xxx;
  r0.w = -BA_Fragment_15_CB1((uint)(2)).w * 2 + 1;
  r0.xyz = r0.www * r0.xyz;
  r0.w = dot(v4.xyz, v4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = v4.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = 1 + -r0.x;
  r0.x = log2(r0.x);
  r0.y = max(9.99999975e-005, BA_Fragment_15_CB1((uint)(3)).x);
  r0.x = r0.y * r0.x;
  r0.x = exp2(r0.x);
  r0.y = BA_Fragment_15_CB1((uint)(3)).y * r0.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v3.xy, BA_Fragment_15_CB0((uint)(19)).x).xyzw;
  r0.z = r1.w + -r1.x;
  r0.z = BA_Fragment_15_CB1((uint)(4)).x * r0.z + r1.x;
  r1.xyz = BA_Fragment_15_CB1((uint)(1)).xyz * r1.xyz;
  r1.xyz = v1.xyz * r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_15_CB1((uint)(2)).xxx + float3(-1,-1,-1);
  r0.y = saturate(r0.z * v1.w + -r0.y);
  r0.x = saturate(-r0.x * BA_Fragment_15_CB1((uint)(3)).y + r0.y);
  o0.xyz = r0.xxx * r1.xyz + float3(1,1,1);
  o0.w = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_IS_MULTIPLY) && defined(_IS_PMA)
float4 BA_Fragment_16_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Multiply, 0.0, 0.0, _RimFlip);
  if (i == 3u) value = float4(_RimSharpness, _RimStrength, 0.0, 0.0);
  if (i == 4u) value = float4(_RGBRGBA, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_16_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COlOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float3 v4 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, v2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = v2.xyz * r0.xxx;
  r0.w = -BA_Fragment_16_CB1((uint)(2)).w * 2 + 1;
  r0.xyz = r0.www * r0.xyz;
  r0.w = dot(v4.xyz, v4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = v4.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = 1 + -r0.x;
  r0.x = log2(r0.x);
  r0.y = max(9.99999975e-005, BA_Fragment_16_CB1((uint)(3)).x);
  r0.x = r0.y * r0.x;
  r0.x = exp2(r0.x);
  r0.y = BA_Fragment_16_CB1((uint)(3)).y * r0.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v3.xy, BA_Fragment_16_CB0((uint)(19)).x).xyzw;
  r0.z = r1.w + -r1.x;
  r0.z = BA_Fragment_16_CB1((uint)(4)).x * r0.z + r1.x;
  r1.xyz = BA_Fragment_16_CB1((uint)(1)).xyz * r1.xyz;
  r1.xyz = v1.xyz * r1.xyz;
  r1.xyz = BA_Fragment_16_CB1((uint)(2)).xxx * r1.xyz;
  r1.w = saturate(r0.z * v1.w + -r0.y);
  r0.x = saturate(-r0.x * BA_Fragment_16_CB1((uint)(3)).y + r1.w);
  r0.xyzw = r1.xyzw * r0.xxxx;
  o0.xyz = r0.xyz * r0.www;
  o0.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_IS_MULTIPLY) && !defined(_IS_PMA)
float4 BA_Fragment_17_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Multiply, 0.0, 0.0, _RimFlip);
  if (i == 3u) value = float4(_RimSharpness, _RimStrength, 0.0, 0.0);
  if (i == 4u) value = float4(_RGBRGBA, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_17_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COlOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float3 v4 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, v2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = v2.xyz * r0.xxx;
  r0.w = -BA_Fragment_17_CB1((uint)(2)).w * 2 + 1;
  r0.xyz = r0.www * r0.xyz;
  r0.w = dot(v4.xyz, v4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = v4.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = 1 + -r0.x;
  r0.x = log2(r0.x);
  r0.y = max(9.99999975e-005, BA_Fragment_17_CB1((uint)(3)).x);
  r0.x = r0.y * r0.x;
  r0.x = exp2(r0.x);
  r0.y = BA_Fragment_17_CB1((uint)(3)).y * r0.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v3.xy, BA_Fragment_17_CB0((uint)(19)).x).xyzw;
  r0.z = r1.w + -r1.x;
  r0.z = BA_Fragment_17_CB1((uint)(4)).x * r0.z + r1.x;
  r1.xyz = BA_Fragment_17_CB1((uint)(1)).xyz * r1.xyz;
  r1.xyz = v1.xyz * r1.xyz;
  r1.xyz = BA_Fragment_17_CB1((uint)(2)).xxx * r1.xyz;
  r1.w = saturate(r0.z * v1.w + -r0.y);
  r0.x = saturate(-r0.x * BA_Fragment_17_CB1((uint)(3)).y + r1.w);
  o0.xyzw = r1.xyzw * r0.xxxx;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_IS_MULTIPLY) && !defined(_IS_PMA)
float4 BA_Fragment_18_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Multiply, 0.0, 0.0, _RimFlip);
  if (i == 3u) value = float4(_RimSharpness, _RimStrength, 0.0, 0.0);
  if (i == 4u) value = float4(_RGBRGBA, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_18_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COlOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float3 v4 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, v2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = v2.xyz * r0.xxx;
  r0.w = -BA_Fragment_18_CB1((uint)(2)).w * 2 + 1;
  r0.xyz = r0.www * r0.xyz;
  r0.w = dot(v4.xyz, v4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = v4.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = 1 + -r0.x;
  r0.x = log2(r0.x);
  r0.y = max(9.99999975e-005, BA_Fragment_18_CB1((uint)(3)).x);
  r0.x = r0.y * r0.x;
  r0.x = exp2(r0.x);
  r0.y = BA_Fragment_18_CB1((uint)(3)).y * r0.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v3.xy, BA_Fragment_18_CB0((uint)(19)).x).xyzw;
  r0.z = r1.w + -r1.x;
  r0.z = BA_Fragment_18_CB1((uint)(4)).x * r0.z + r1.x;
  r1.xyz = BA_Fragment_18_CB1((uint)(1)).xyz * r1.xyz;
  r1.xyz = v1.xyz * r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_18_CB1((uint)(2)).xxx + float3(-1,-1,-1);
  r0.y = saturate(r0.z * v1.w + -r0.y);
  r0.x = saturate(-r0.x * BA_Fragment_18_CB1((uint)(3)).y + r0.y);
  o0.xyz = r0.xxx * r1.xyz + float3(1,1,1);
  o0.w = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_IS_MULTIPLY) && defined(_IS_PMA)
float4 BA_Fragment_19_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Multiply, 0.0, 0.0, _RimFlip);
  if (i == 3u) value = float4(_RimSharpness, _RimStrength, 0.0, 0.0);
  if (i == 4u) value = float4(_RGBRGBA, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_19_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COlOR0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD0,
  float3 v4 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v2.xyz, v2.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = v2.xyz * r0.xxx;
  r0.w = -BA_Fragment_19_CB1((uint)(2)).w * 2 + 1;
  r0.xyz = r0.www * r0.xyz;
  r0.w = dot(v4.xyz, v4.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = v4.xyz * r0.www;
  r0.x = saturate(dot(r0.xyz, r1.xyz));
  r0.x = 1 + -r0.x;
  r0.x = log2(r0.x);
  r0.y = max(9.99999975e-005, BA_Fragment_19_CB1((uint)(3)).x);
  r0.x = r0.y * r0.x;
  r0.x = exp2(r0.x);
  r0.y = BA_Fragment_19_CB1((uint)(3)).y * r0.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v3.xy, BA_Fragment_19_CB0((uint)(19)).x).xyzw;
  r0.z = r1.w + -r1.x;
  r0.z = BA_Fragment_19_CB1((uint)(4)).x * r0.z + r1.x;
  r1.xyz = BA_Fragment_19_CB1((uint)(1)).xyz * r1.xyz;
  r1.xyz = v1.xyz * r1.xyz;
  r1.xyz = BA_Fragment_19_CB1((uint)(2)).xxx * r1.xyz;
  r1.w = saturate(r0.z * v1.w + -r0.y);
  r0.x = saturate(-r0.x * BA_Fragment_19_CB1((uint)(3)).y + r1.w);
  r0.xyzw = r1.xyzw * r0.xxxx;
  o0.xyz = r0.xyz * r0.www;
  o0.w = r0.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
