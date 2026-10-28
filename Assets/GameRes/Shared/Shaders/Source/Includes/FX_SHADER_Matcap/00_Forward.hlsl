// Exact names and types from the original compiled parameter metadata.
float4 _Main_Color;
float4 _Main_Tex_ST;
Texture2D<float4> _Main_Tex;
Texture2D<float4> _Matcap_Tex;
SamplerState sampler_Main_Tex;
SamplerState sampler_Matcap_Tex;
#ifndef cmp
#define cmp -
#endif

#if !defined(INSTANCING_ON)
float4 BA_Vertex_2_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_2_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : COLOR0,
  out float4 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_2_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_2_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_2_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_2_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_2_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_2_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xy = v2.xy;
  o1.zw = float2(0,0);
  o2.xyzw = v3.xyzw;
  r0.x = dot(v1.xyz, BA_Vertex_2_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_2_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_2_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  return;
}
#elif defined(INSTANCING_ON)
float4 BA_Vertex_3_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_3_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_3_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : COLOR0,
  uint v4 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : COLOR0,
  out float4 o3 : TEXCOORD4,
  out uint o4 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v4);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v4.x + asint(BA_Vertex_3_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r0.yzw = BA_Vertex_3_CB2((uint)(r0.x+1)).xyz * v0.yyy;
  r0.yzw = BA_Vertex_3_CB2((uint)(r0.x+0)).xyz * v0.xxx + r0.yzw;
  r0.yzw = BA_Vertex_3_CB2((uint)(r0.x+2)).xyz * v0.zzz + r0.yzw;
  r0.yzw = BA_Vertex_3_CB2((uint)(r0.x+3)).xyz + r0.yzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(74)).xyzw * r0.zzzz;
  r1.xyzw = BA_Vertex_3_CB0((uint)(73)).xyzw * r0.yyyy + r1.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v2.xy;
  o1.zw = float2(0,0);
  o2.xyzw = v3.xyzw;
  r1.x = dot(v1.xyz, BA_Vertex_3_CB2((uint)(r0.x+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_3_CB2((uint)(r0.x+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_3_CB2((uint)(r0.x+6)).xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o3.xyz = r1.xyz * r0.xxx;
  o3.w = 0;
  o4.x = v4.x;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(INSTANCING_ON)
float4 BA_Fragment_5_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Main_Tex_ST.x, _Main_Tex_ST.y, _Main_Tex_ST.z, _Main_Tex_ST.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_5_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_5_CB1((uint)(1)).xy + BA_Fragment_5_CB1((uint)(1)).zw;
  r0.xyzw = _Main_Tex.Sample(sampler_Main_Tex, r0.xy).xyzw;
  r0.xyz = BA_Fragment_5_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = v2.xyz * r0.xyz;
  r1.xy = BA_Fragment_5_CB0((uint)(62)).xy * v3.yy;
  r1.xy = BA_Fragment_5_CB0((uint)(61)).xy * v3.xx + r1.xy;
  r1.xy = BA_Fragment_5_CB0((uint)(63)).xy * v3.zz + r1.xy;
  r1.xy = r1.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r1.xyzw = _Matcap_Tex.Sample(sampler_Matcap_Tex, r1.xy).xyzw;
  o0.xyz = r1.xyz * r0.xyz;
  r0.x = v2.w * r1.w;
  o0.w = BA_Fragment_5_CB1((uint)(0)).w * r0.x;
  return;
}
#elif defined(INSTANCING_ON)
float4 BA_Fragment_6_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Main_Tex_ST.x, _Main_Tex_ST.y, _Main_Tex_ST.z, _Main_Tex_ST.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_6_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD4,
  uint v4 : SV_InstanceID0,
  out float4 o0 : SV_Target0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v4);
#endif
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_6_CB1((uint)(1)).xy + BA_Fragment_6_CB1((uint)(1)).zw;
  r0.xyzw = _Main_Tex.Sample(sampler_Main_Tex, r0.xy).xyzw;
  r0.xyz = BA_Fragment_6_CB1((uint)(0)).xyz * r0.xyz;
  r0.xyz = v2.xyz * r0.xyz;
  r1.xy = BA_Fragment_6_CB0((uint)(62)).xy * v3.yy;
  r1.xy = BA_Fragment_6_CB0((uint)(61)).xy * v3.xx + r1.xy;
  r1.xy = BA_Fragment_6_CB0((uint)(63)).xy * v3.zz + r1.xy;
  r1.xy = r1.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r1.xyzw = _Matcap_Tex.Sample(sampler_Matcap_Tex, r1.xy).xyzw;
  o0.xyz = r1.xyz * r0.xyz;
  r0.x = v2.w * r1.w;
  o0.w = BA_Fragment_6_CB1((uint)(0)).w * r0.x;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
