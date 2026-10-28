// Exact names and types from the original compiled parameter metadata.
float _AlphaClip_Value;
float _Custom_Data_Main_Offset_Use;
float _Custom_Data_Mask_Offset_Use;
float _Custom_Data_Use;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Distortion_Power_X;
float _Distortion_Power_Y;
float3 _LightDirection;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mask_Speed_X;
float _Mask_Speed_Y;
float _Multiply;
float _RGBRGBA;
float4 _ShadowBias;
float4 _ShadowCoordModifier;
float _Step_Power;
float4 _Tex_DistortVertexnormal_ST;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
float4 _VertexNormal_Offset;
float _VertexNormal_Speed_X;
float _VertexNormal_Speed_Y;
Texture2D<float4> _Tex_DistortVertexnormal;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
SamplerState sampler_Tex_DistortVertexnormal;
SamplerState sampler_Tex_Main;
SamplerState sampler_Tex_Mask;
#ifndef cmp
#define cmp -
#endif

#if 1
float4 BA_Vertex_5_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tex_DistortVertexnormal_ST.x, _Tex_DistortVertexnormal_ST.y, _Tex_DistortVertexnormal_ST.z, _Tex_DistortVertexnormal_ST.w);
  if (i == 5u) value = float4(_VertexNormal_Offset.x, _VertexNormal_Offset.y, _VertexNormal_Offset.z, 0.0);
  if (i == 9u) value = float4(0.0, _VertexNormal_Speed_Y, _VertexNormal_Speed_X, 0.0);
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
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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
  float4 v3 : COLOR0,
  float4 v4 : TEXCOORD1,
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

  r0.xy = v2.xy * BA_Vertex_5_CB2((uint)(0)).xy + BA_Vertex_5_CB2((uint)(0)).zw;
  r0.xy = BA_Vertex_5_CB0((uint)(11)).yy * BA_Vertex_5_CB2((uint)(9)).zy + r0.xy;
  r0.xyzw = _Tex_DistortVertexnormal.SampleLevel(sampler_Tex_DistortVertexnormal, r0.xy, 0).xyzw;
  r0.yzw = BA_Vertex_5_CB2((uint)(5)).xyz * v1.xyz;
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
  o1.xyzw = v3.xyzw;
  o2.xyzw = v4.xyzw;
  o3.xy = v2.xy;
  o3.zw = float2(0,0);
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_7_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tex_DistortVertexnormal_ST.x, _Tex_DistortVertexnormal_ST.y, _Tex_DistortVertexnormal_ST.z, _Tex_DistortVertexnormal_ST.w);
  if (i == 2u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 6u) value = float4(_Multiply, _Custom_Data_Mask_Offset_Use, _Mask_Speed_Y, _Mask_Speed_X);
  if (i == 7u) value = float4(_Step_Power, _Custom_Data_Use, _Custom_Data_Main_Offset_Use, _Dis_Speed_X);
  if (i == 8u) value = float4(_RGBRGBA, _Distortion_Power_Y, _Distortion_Power_X, _Main_Speed_Y);
  if (i == 9u) value = float4(_Main_Speed_X, 0.0, 0.0, 0.0);
  if (i == 10u) value = float4(_Dis_Speed_Y, _AlphaClip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_7_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_7_CB1((uint)(7)).w * BA_Fragment_7_CB0((uint)(11)).y;
  r0.y = BA_Fragment_7_CB1((uint)(10)).x * BA_Fragment_7_CB0((uint)(11)).y;
  r1.xy = v3.xy * BA_Fragment_7_CB1((uint)(0)).xy + BA_Fragment_7_CB1((uint)(0)).zw;
  r1.zw = float2(0,1);
  r0.xy = r1.zy + r0.xy;
  r0.xy = r1.xw + r0.xy;
  r0.xyzw = _Tex_DistortVertexnormal.Sample(sampler_Tex_DistortVertexnormal, r0.xy).xyzw;
  r0.zw = v3.xy * BA_Fragment_7_CB1((uint)(3)).xy + BA_Fragment_7_CB1((uint)(3)).zw;
  r0.zw = BA_Fragment_7_CB0((uint)(11)).yy * BA_Fragment_7_CB1((uint)(6)).wz + r0.zw;
  r0.zw = BA_Fragment_7_CB1((uint)(8)).zy * r0.xy + r0.zw;
  r1.x = cmp(0 != BA_Fragment_7_CB1((uint)(6)).y);
  r1.xy = r1.xx ? v2.xy : 0;
  r0.zw = r1.xy + r0.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.zw = cmp(float2(0,0) != BA_Fragment_7_CB1((uint)(7)).yz);
  r0.z = r0.z ? v2.z : BA_Fragment_7_CB1((uint)(7)).x;
  r1.yz = r0.ww ? v2.xy : 0;
  r0.z = cmp(r1.x >= r0.z);
  r0.z = r0.z ? 1.000000 : 0;
  r0.z = v1.w * r0.z;
  r0.z = BA_Fragment_7_CB1((uint)(6)).x * r0.z;
  r1.xw = v3.xy * BA_Fragment_7_CB1((uint)(2)).xy + BA_Fragment_7_CB1((uint)(2)).zw;
  r2.x = BA_Fragment_7_CB1((uint)(9)).x * BA_Fragment_7_CB0((uint)(11)).y;
  r2.y = BA_Fragment_7_CB1((uint)(8)).w * BA_Fragment_7_CB0((uint)(11)).y;
  r1.xw = r2.xy + r1.xw;
  r0.xy = BA_Fragment_7_CB1((uint)(8)).zy * r0.xy + r1.xw;
  r0.xy = r0.xy + r1.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r0.x = cmp(0 != BA_Fragment_7_CB1((uint)(8)).x);
  r0.x = r0.x ? r1.w : r1.x;
  r0.x = saturate(r0.z * r0.x);
  r0.x = -BA_Fragment_7_CB1((uint)(10)).y + r0.x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = float4(0,0,0,0);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
