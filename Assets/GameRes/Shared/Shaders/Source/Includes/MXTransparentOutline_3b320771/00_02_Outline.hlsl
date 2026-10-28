// Exact names and types from the original compiled parameter metadata.
float _DissolveFactor;
int _DissolveUVChannel;
float4 _LineColor;
float _OutlineAlpha;
float _OutlineThickness;
Texture2D<float4> _InlineDissolveTex;
SamplerState sampler_InlineDissolveTex;
#ifndef cmp
#define cmp -
#endif

#if 1
float4 BA_Vertex_15_CB2(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(0.0, _OutlineThickness, 0.0, 0.0);
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
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_15_CB0(uint i)
{
  float4 value = 0;
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
  float3 v1 : TANGENT0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float2 v4 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_15_CB1((uint)(5)).xyz * BA_Vertex_15_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_15_CB1((uint)(4)).xyz * BA_Vertex_15_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(6)).xyz * BA_Vertex_15_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(7)).xyz * BA_Vertex_15_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v1.xyz);
  r0.x = BA_Vertex_15_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_15_CB1((uint)(5)).xyz * BA_Vertex_15_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_15_CB1((uint)(4)).xyz * BA_Vertex_15_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_15_CB1((uint)(6)).xyz * BA_Vertex_15_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_15_CB1((uint)(7)).xyz * BA_Vertex_15_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v1.xyz);
  r0.y = BA_Vertex_15_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_15_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_15_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_15_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_15_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_15_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_15_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_15_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_15_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = BA_Vertex_15_CB2((uint)(2)).y * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.z = BA_Vertex_15_CB0((uint)(18)).x / BA_Vertex_15_CB0((uint)(18)).y;
  o0.xy = r0.xy * r0.zz + r1.xy;
  o0.zw = r1.zw;
  o1.xy = v3.xy;
  o1.zw = v4.xy;
  o2.xyzw = v2.xyzw;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_17_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_LineColor.x, _LineColor.y, _LineColor.z, _LineColor.w);
  if (i == 2u) value = float4(_OutlineAlpha, 0.0, asfloat(_DissolveUVChannel), _DissolveFactor);
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
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_17_CB1((uint)(2)).zz ? v1.zw : v1.xy;
  r0.xyzw = _InlineDissolveTex.SampleBias(sampler_InlineDissolveTex, r0.xy, BA_Fragment_17_CB0((uint)(19)).x).xyzw;
  r0.x = cmp(r0.z >= BA_Fragment_17_CB1((uint)(2)).w);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_17_CB1((uint)(1)).w * r0.x;
  o0.w = BA_Fragment_17_CB1((uint)(2)).x * r0.x;
  o0.xyz = BA_Fragment_17_CB1((uint)(1)).xyz * v2.xyz;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
