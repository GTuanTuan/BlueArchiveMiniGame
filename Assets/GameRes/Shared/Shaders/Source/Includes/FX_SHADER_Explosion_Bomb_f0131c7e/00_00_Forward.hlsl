// Exact names and types from the original compiled parameter metadata.
float4 _Diffuse_ST;
float4 _Outline_color;
float4 _Smoke_color;
float4 _Step_ST;
float _Tex_u;
float _Tex_v;
float4 _last_color;
Texture2D<float4> _Diffuse;
Texture2D<float4> _Step;
Texture2D<float4> _second_tex;
SamplerState sampler_Diffuse;
SamplerState sampler_Step;
SamplerState sampler_second_tex;
#ifndef cmp
#define cmp -
#endif

#if 1
float4 BA_Vertex_1_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Diffuse_ST.x, _Diffuse_ST.y, _Diffuse_ST.z, _Diffuse_ST.w);
  if (i == 5u) value = float4(_Tex_u, _Tex_v, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_1_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_1_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Vertex_1_CB2((uint)(0)).xy + BA_Vertex_1_CB2((uint)(0)).zw;
  r0.xy = BA_Vertex_1_CB2((uint)(5)).xy * BA_Vertex_1_CB0((uint)(11)).yy + r0.xy;
  r0.xyzw = _Diffuse.SampleLevel(sampler_Diffuse, r0.xy, 0).xyzw;
  r0.xyz = v1.xyz * r0.xyz;
  r0.xyz = r0.xyz * v3.www + v0.xyz;
  r1.xyz = BA_Vertex_1_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_1_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_1_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_1_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_1_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_1_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_1_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xyzw = v3.xyzw;
  o2.xy = v2.xy;
  o2.zw = float2(0,0);
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_3_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Diffuse_ST.x, _Diffuse_ST.y, _Diffuse_ST.z, _Diffuse_ST.w);
  if (i == 1u) value = float4(_Smoke_color.x, _Smoke_color.y, _Smoke_color.z, _Smoke_color.w);
  if (i == 2u) value = float4(_Outline_color.x, _Outline_color.y, _Outline_color.z, _Outline_color.w);
  if (i == 3u) value = float4(_last_color.x, _last_color.y, _last_color.z, _last_color.w);
  if (i == 4u) value = float4(_Step_ST.x, _Step_ST.y, _Step_ST.z, _Step_ST.w);
  if (i == 5u) value = float4(_Tex_u, _Tex_v, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_3_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_3_CB1((uint)(0)).xy + BA_Fragment_3_CB1((uint)(0)).zw;
  r0.xy = BA_Fragment_3_CB1((uint)(5)).xy * BA_Fragment_3_CB0((uint)(11)).yy + r0.xy;
  r1.xyzw = _Diffuse.Sample(sampler_Diffuse, r0.xy).xyzw;
  r0.xyzw = _second_tex.Sample(sampler_second_tex, r0.xy).xyzw;
  r0.w = 1.10000002 * r1.x;
  r1.x = cmp(r1.x >= v1.z);
  r1.x = r1.x ? 1.000000 : 0;
  r0.w = cmp(r0.w >= v1.z);
  r0.w = r0.w ? 1.000000 : 0;
  r1.yzw = BA_Fragment_3_CB1((uint)(2)).xyz + -BA_Fragment_3_CB1((uint)(1)).xyz;
  r1.yzw = r0.www * r1.yzw + BA_Fragment_3_CB1((uint)(1)).xyz;
  r0.xyz = r0.xyz * BA_Fragment_3_CB1((uint)(3)).xyz + -r1.yzw;
  o0.xyz = r1.xxx * r0.xyz + r1.yzw;
  r0.xy = v2.xy * BA_Fragment_3_CB1((uint)(4)).xy + BA_Fragment_3_CB1((uint)(4)).zw;
  r0.xyzw = _Step.Sample(sampler_Step, r0.xy).xyzw;
  r0.x = cmp(v1.x >= r0.x);
  o0.w = r0.x ? 1.000000 : 0;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
