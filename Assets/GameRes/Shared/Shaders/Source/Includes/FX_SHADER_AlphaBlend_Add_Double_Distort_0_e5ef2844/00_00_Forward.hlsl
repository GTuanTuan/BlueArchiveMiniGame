// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float _Custom_Data_GDistort_Power_Use;
float _Custom_Data_MainMask_Offset_Use;
float _Custom_Data_RDistort_Power_Use;
float _GDistort_Power_X;
float _GDistort_Power_Y;
float _GDistort_Speed_X;
float _GDistort_Speed_Y;
float _GDistort_invert;
float4 _G_Tilingxy_Offsetzw;
float _Main_Distort_Use;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mask_GDistort_Use;
float _Mask_RDistort_Use;
float _Mask_Speed_X;
float _Mask_Speed_Y;
float _Multiply;
float _RDistort_Power_X;
float _RDistort_Power_Y;
float _RDistort_Speed_X;
float _RDistort_Speed_Y;
float _RGBRGBA;
float4 _R_Tilingxy_Offsetzw;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
Texture2D<float4> _Tex_DistortRG;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
SamplerState sampler_Tex_DistortRG;
SamplerState sampler_Tex_Main;
SamplerState sampler_Tex_Mask;
#ifndef cmp
#define cmp -
#endif

#if 1
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
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD0,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0)
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
  r0.xyzw = BA_Vertex_1_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xyzw = v2.xyzw;
  o2.xyzw = v3.xyzw;
  o3.xyz = v4.xyz;
  o3.w = 0;
  o4.xyzw = v5.xyzw;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_3_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 3u) value = float4(_R_Tilingxy_Offsetzw.x, _R_Tilingxy_Offsetzw.y, _R_Tilingxy_Offsetzw.z, _R_Tilingxy_Offsetzw.w);
  if (i == 4u) value = float4(_G_Tilingxy_Offsetzw.x, _G_Tilingxy_Offsetzw.y, _G_Tilingxy_Offsetzw.z, _G_Tilingxy_Offsetzw.w);
  if (i == 5u) value = float4(0.0, _Mask_RDistort_Use, _Mask_GDistort_Use, _Mask_Speed_Y);
  if (i == 6u) value = float4(_Mask_Speed_X, _Custom_Data_GDistort_Power_Use, _GDistort_Power_Y, _GDistort_Power_X);
  if (i == 7u) value = float4(_GDistort_Speed_Y, _GDistort_Speed_X, _GDistort_invert, _RDistort_Speed_Y);
  if (i == 8u) value = float4(_RDistort_Speed_X, _RDistort_Power_Y, _RDistort_Power_X, _Custom_Data_RDistort_Power_Use);
  if (i == 9u) value = float4(_Main_Distort_Use, _Main_Speed_Y, _Main_Speed_X, _Custom_Data_MainMask_Offset_Use);
  if (i == 11u) value = float4(_Multiply, _RGBRGBA, 0.0, 0.0);
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
  float4 v3 : TEXCOORD5,
  float4 v4 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v3.xy * BA_Fragment_3_CB1((uint)(3)).xy + BA_Fragment_3_CB1((uint)(3)).zw;
  r1.x = BA_Fragment_3_CB1((uint)(8)).x * BA_Fragment_3_CB0((uint)(11)).y;
  r1.y = BA_Fragment_3_CB1((uint)(7)).w * BA_Fragment_3_CB0((uint)(11)).y;
  r0.xy = r1.xy + r0.xy;
  r0.zw = v3.xy * BA_Fragment_3_CB1((uint)(4)).xy + BA_Fragment_3_CB1((uint)(4)).zw;
  r0.zw = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(7)).yx + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r0.z = 1 + -r1.y;
  r0.w = cmp(0 != BA_Fragment_3_CB1((uint)(7)).z);
  r0.z = r0.w ? r0.z : r1.y;
  r0.w = cmp(0 != BA_Fragment_3_CB1((uint)(6)).y);
  r1.xy = r0.ww ? v2.zw : 0;
  r1.xy = BA_Fragment_3_CB1((uint)(6)).wz + r1.xy;
  r0.xy = r0.zz * r1.xy + r0.xy;
  r0.zw = r1.xy * r0.zz;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.x = cmp(0 != BA_Fragment_3_CB1((uint)(8)).w);
  r0.xy = r0.xx ? v2.xy : 0;
  r0.xy = BA_Fragment_3_CB1((uint)(8)).zy + r0.xy;
  r0.xy = r0.xy * r1.xx;
  r1.xy = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(5)).zy);
  r1.yz = r1.yy ? r0.xy : 0;
  r0.zw = r1.xx ? r0.zw : 0;
  r1.xw = v3.xy * BA_Fragment_3_CB1((uint)(0)).xy + BA_Fragment_3_CB1((uint)(0)).zw;
  r2.x = BA_Fragment_3_CB1((uint)(6)).x * BA_Fragment_3_CB0((uint)(11)).y;
  r2.y = BA_Fragment_3_CB1((uint)(5)).w * BA_Fragment_3_CB0((uint)(11)).y;
  r2.zw = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(9)).wx);
  r3.xyzw = r2.zzzz ? v1.xyzw : 0;
  r0.xy = r2.ww ? r0.xy : 0;
  r2.xy = r3.zw + r2.xy;
  r2.zw = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(9)).zy + r3.xy;
  r0.xy = r2.zw + r0.xy;
  r1.xw = r2.xy + r1.xw;
  r0.zw = r1.xw + r0.zw;
  r0.zw = r0.zw + r1.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.zw).xyzw;
  r0.zw = v3.xy * BA_Fragment_3_CB1((uint)(2)).xy + BA_Fragment_3_CB1((uint)(2)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r2.xyz = v4.xyz * r0.xyz;
  r2.xyz = BA_Fragment_3_CB1((uint)(1)).xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.xyz;
  r1.yzw = BA_Fragment_3_CB1((uint)(11)).xxx * r1.yzw;
  o0.xyz = r1.yzw * r0.www;
  r0.y = cmp(0 != BA_Fragment_3_CB1((uint)(11)).y);
  r0.x = r0.y ? r0.w : r0.x;
  r0.y = v4.w * v4.w;
  r0.x = r0.x * r0.y;
  r0.x = BA_Fragment_3_CB1((uint)(1)).w * r0.x;
  r0.x = r0.x * r1.x;
  o0.w = saturate(BA_Fragment_3_CB1((uint)(11)).x * r0.x);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
