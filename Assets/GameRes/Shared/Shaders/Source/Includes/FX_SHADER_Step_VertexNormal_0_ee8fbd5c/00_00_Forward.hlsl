// Exact names and types from the original compiled parameter metadata.
float _BChannel_Step_Power;
float _BCustom_Data_Use;
float4 _Color;
float _Custom_VertexNormal_Offset_Use;
float4 _GChannel_Color;
float _GChannel_Step_Power;
float _GCustom_Data_Use;
float _Multiply;
float4 _RChannel_Color;
float _RMultiply;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
float4 _Tex_VertexNormal_ST;
float4 _VertexNormal_Offset;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
Texture2D<float4> _Tex_VertexNormal;
SamplerState sampler_Tex_Main;
SamplerState sampler_Tex_Mask;
SamplerState sampler_Tex_VertexNormal;
#ifndef cmp
#define cmp -
#endif

#if 1
float4 BA_Vertex_1_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tex_VertexNormal_ST.x, _Tex_VertexNormal_ST.y, _Tex_VertexNormal_ST.z, _Tex_VertexNormal_ST.w);
  if (i == 6u) value = float4(_VertexNormal_Offset.x, _VertexNormal_Offset.y, _VertexNormal_Offset.z, 0.0);
  if (i == 7u) value = float4(0.0, _Custom_VertexNormal_Offset_Use, 0.0, 0.0);
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
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(0 != BA_Vertex_1_CB2((uint)(7)).y);
  r0.xy = r0.xx ? v3.xy : 0;
  r0.zw = v2.xy * BA_Vertex_1_CB2((uint)(0)).xy + BA_Vertex_1_CB2((uint)(0)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_VertexNormal.SampleLevel(sampler_Tex_VertexNormal, r0.xy, 0).xyzw;
  r0.yzw = BA_Vertex_1_CB2((uint)(6)).xyz * v1.xyz;
  r0.xyz = r0.yzw * r0.xxx + v0.xyz;
  r1.xyz = BA_Vertex_1_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_1_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_1_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_1_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_1_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_1_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_1_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xy = v2.xy;
  o1.zw = float2(0,0);
  o2.xyzw = v4.xyzw;
  o3.xyzw = v5.xyzw;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_3_CB0(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 3u) value = float4(_RChannel_Color.x, _RChannel_Color.y, _RChannel_Color.z, _RChannel_Color.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 5u) value = float4(_GChannel_Color.x, _GChannel_Color.y, _GChannel_Color.z, _GChannel_Color.w);
  if (i == 7u) value = float4(0.0, 0.0, _Multiply, _RMultiply);
  if (i == 8u) value = float4(_GCustom_Data_Use, _GChannel_Step_Power, _BCustom_Data_Use, _BChannel_Step_Power);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = cmp(float2(0,0) != BA_Fragment_3_CB0((uint)(8)).xz);
  r0.xy = r0.xy ? v2.yz : BA_Fragment_3_CB0((uint)(8)).yw;
  r0.zw = v1.xy * BA_Fragment_3_CB0((uint)(4)).xy + BA_Fragment_3_CB0((uint)(4)).zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.xy = cmp(r1.yz >= r0.xy);
  r0.z = saturate(BA_Fragment_3_CB0((uint)(7)).w + r1.x);
  r0.xy = r0.xy ? float2(1,1) : 0;
  r0.y = v3.w * r0.y;
  r0.y = BA_Fragment_3_CB0((uint)(7)).z * r0.y;
  r1.xy = v1.xy * BA_Fragment_3_CB0((uint)(2)).xy + BA_Fragment_3_CB0((uint)(2)).zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xy).xyzw;
  r0.y = saturate(r1.w * r0.y);
  r1.xyz = BA_Fragment_3_CB0((uint)(1)).xyz * r1.xyz;
  r0.w = -0.100000001 + r0.y;
  o0.w = r0.y;
  r0.y = cmp(r0.w < 0);
  if (r0.y != 0) discard;
  r2.xyz = BA_Fragment_3_CB0((uint)(7)).zzz * r1.xyz;
  r1.xyz = -r1.xyz * BA_Fragment_3_CB0((uint)(7)).zzz + BA_Fragment_3_CB0((uint)(3)).xyz;
  r0.yzw = r0.zzz * r1.xyz + r2.xyz;
  r1.xyz = BA_Fragment_3_CB0((uint)(5)).xyz + -r0.yzw;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  o0.xyz = v3.xyz * r0.xyz;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
