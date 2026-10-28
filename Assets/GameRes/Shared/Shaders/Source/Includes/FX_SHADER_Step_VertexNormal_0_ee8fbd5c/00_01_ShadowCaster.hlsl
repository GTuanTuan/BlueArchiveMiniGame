// Exact names and types from the original compiled parameter metadata.
float _BChannel_Step_Power;
float _BCustom_Data_Use;
float _Custom_VertexNormal_Offset_Use;
float3 _LightDirection;
float _Multiply;
float4 _ShadowBias;
float4 _ShadowCoordModifier;
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
float4 BA_Vertex_5_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tex_VertexNormal_ST.x, _Tex_VertexNormal_ST.y, _Tex_VertexNormal_ST.z, _Tex_VertexNormal_ST.w);
  if (i == 6u) value = float4(_VertexNormal_Offset.x, _VertexNormal_Offset.y, _VertexNormal_Offset.z, 0.0);
  if (i == 7u) value = float4(0.0, _Custom_VertexNormal_Offset_Use, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_5_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_5_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_ShadowBias.x, _ShadowBias.y, _ShadowBias.z, _ShadowBias.w);
  if (i == 125u) value = float4(_LightDirection.x, _LightDirection.y, _LightDirection.z, 0.0);
  if (i == 127u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD1,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(0 != BA_Vertex_5_CB2((uint)(7)).y);
  r0.xy = r0.xx ? v3.xy : 0;
  r0.zw = v2.xy * BA_Vertex_5_CB2((uint)(0)).xy + BA_Vertex_5_CB2((uint)(0)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_VertexNormal.SampleLevel(sampler_Tex_VertexNormal, r0.xy, 0).xyzw;
  r0.yzw = BA_Vertex_5_CB2((uint)(6)).xyz * v1.xyz;
  r0.xyz = r0.yzw * r0.xxx + v0.xyz;
  r1.xyz = BA_Vertex_5_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_5_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_5_CB1((uint)(3)).xyz + r0.xyz;
  r0.xyz = BA_Vertex_5_CB0((uint)(125)).xyz * BA_Vertex_5_CB0((uint)(124)).xxx + r0.xyz;
  r1.xyz = BA_Vertex_5_CB1((uint)(1)).xyz * v1.yyy;
  r1.xyz = BA_Vertex_5_CB1((uint)(0)).xyz * v1.xxx + r1.xyz;
  r1.xyz = BA_Vertex_5_CB1((uint)(2)).xyz * v1.zzz + r1.xyz;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = saturate(dot(BA_Vertex_5_CB0((uint)(125)).xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_5_CB0((uint)(124)).y * r0.w;
  r0.xyz = r1.xyz * r0.www + r0.xyz;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.xy = BA_Vertex_5_CB0((uint)(127)).yy * BA_Vertex_5_CB0((uint)(74)).xy;
  r1.xy = BA_Vertex_5_CB0((uint)(73)).xy * BA_Vertex_5_CB0((uint)(127)).xx + r1.xy;
  r1.xy = BA_Vertex_5_CB0((uint)(75)).xy * BA_Vertex_5_CB0((uint)(127)).zz + r1.xy;
  r1.xy = BA_Vertex_5_CB0((uint)(76)).xy + r1.xy;
  r1.z = saturate(BA_Vertex_5_CB0((uint)(127)).w);
  r0.xy = -r1.xy * r1.zz + r0.xy;
  r1.x = max(1, BA_Vertex_5_CB0((uint)(127)).w);
  o0.xy = r1.xx * r0.xy;
  o0.z = min(1, r0.z);
  o0.w = r0.w;
  o1.xyzw = v4.xyzw;
  o2.xyzw = v5.xyzw;
  o3.xy = v2.xy;
  o3.zw = float2(0,0);
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_6_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 4u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 7u) value = float4(0.0, 0.0, _Multiply, 0.0);
  if (i == 8u) value = float4(0.0, 0.0, _BCustom_Data_Use, _BChannel_Step_Power);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v3.xy * BA_Fragment_6_CB0((uint)(4)).xy + BA_Fragment_6_CB0((uint)(4)).zw;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.x = cmp(0 != BA_Fragment_6_CB0((uint)(8)).z);
  r0.x = r0.x ? v2.z : BA_Fragment_6_CB0((uint)(8)).w;
  r0.x = cmp(r0.z >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_6_CB0((uint)(7)).z * r0.x;
  r0.yz = v3.xy * BA_Fragment_6_CB0((uint)(2)).xy + BA_Fragment_6_CB0((uint)(2)).zw;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = saturate(r1.w * r0.x);
  r0.x = -0.100000001 + r0.x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = float4(0,0,0,0);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
