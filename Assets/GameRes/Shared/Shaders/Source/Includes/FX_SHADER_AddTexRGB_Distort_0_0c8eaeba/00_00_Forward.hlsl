// Exact names and types from the original compiled parameter metadata.
float4 _Add_Color;
float _Add_Distortion_Use;
float _Add_Multiply;
float _Add_Speed_X;
float _Add_Speed_Y;
float _BAdd_Distortion_Use;
float4 _Color;
float _Custom_Data_Distort_Power_Use;
float _Custom_Data_MainMask_Offset_Use;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Distortion_Power_X;
float _Distortion_Power_Y;
float _GAdd_Distortion_Use;
float _Main_Distortion_Use;
float _Main_Multiply;
float _Main_Speed_X;
float _Main_Speed_Y;
float _RAdd_Distortion_Use;
float4 _Tex_AddRGB_ST;
float4 _Tex_Distort_ST;
float4 _Tex_Main_ST;
float4 _UV_Add_TilingOffset;
float _UV_Add_Use;
Texture2D<float4> _Tex_AddRGB;
Texture2D<float4> _Tex_Distort;
Texture2D<float4> _Tex_Main;
SamplerState sampler_Tex_AddRGB;
SamplerState sampler_Tex_Distort;
SamplerState sampler_Tex_Main;
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
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD0,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5)
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
  o3.xy = v4.xy;
  o3.zw = float2(0,0);
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
  if (i == 0u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 1u) value = float4(_Tex_AddRGB_ST.x, _Tex_AddRGB_ST.y, _Tex_AddRGB_ST.z, _Tex_AddRGB_ST.w);
  if (i == 2u) value = float4(_Add_Color.x, _Add_Color.y, _Add_Color.z, _Add_Color.w);
  if (i == 3u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 4u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 5u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 6u) value = float4(_Main_Multiply, _GAdd_Distortion_Use, _Add_Speed_Y, _Add_Speed_X);
  if (i == 7u) value = float4(_Add_Distortion_Use, _RAdd_Distortion_Use, _Dis_Speed_Y, _BAdd_Distortion_Use);
  if (i == 8u) value = float4(_Dis_Speed_X, _Distortion_Power_Y, _Distortion_Power_X, _Custom_Data_Distort_Power_Use);
  if (i == 9u) value = float4(_Main_Distortion_Use, _Main_Speed_Y, _Main_Speed_X, _Custom_Data_MainMask_Offset_Use);
  if (i == 10u) value = float4(_UV_Add_Use, _Add_Multiply, 0.0, 0.0);
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
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v3.xy * BA_Fragment_3_CB1((uint)(3)).xy + BA_Fragment_3_CB1((uint)(3)).zw;
  r1.x = BA_Fragment_3_CB1((uint)(8)).x * BA_Fragment_3_CB0((uint)(11)).y;
  r1.y = BA_Fragment_3_CB1((uint)(7)).z * BA_Fragment_3_CB0((uint)(11)).y;
  r0.xy = r1.xy + r0.xy;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r0.z = cmp(0 != BA_Fragment_3_CB1((uint)(8)).w);
  r0.zw = r0.zz ? v4.xy : 0;
  r0.zw = BA_Fragment_3_CB1((uint)(8)).zy + r0.zw;
  r0.xy = r0.zw * r0.xy;
  r0.zw = v3.xy * BA_Fragment_3_CB1((uint)(5)).xy + BA_Fragment_3_CB1((uint)(5)).zw;
  r0.z = r0.z + r0.w;
  r0.w = cmp(0 != BA_Fragment_3_CB1((uint)(10)).x);
  r0.z = r0.w ? r0.z : 1;
  r0.xy = r0.xy * r0.zz;
  r1.xyz = cmp(float3(0,0,0) != BA_Fragment_3_CB1((uint)(7)).xyw);
  r0.zw = r1.xx ? r0.xy : 0;
  r1.xw = v3.xy * BA_Fragment_3_CB1((uint)(1)).xy + BA_Fragment_3_CB1((uint)(1)).zw;
  r2.xy = r1.xw + r0.zw;
  r0.zw = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(6)).wz + r0.zw;
  r0.zw = r0.zw + r1.xw;
  r1.xw = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(9)).wx);
  r3.xyzw = r1.xxxx ? v2.xyzw : 0;
  r0.xy = r1.ww ? r0.xy : 0;
  r0.zw = r3.zw + r0.zw;
  r1.xw = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(9)).zy + r3.xy;
  r2.z = cmp(0 != BA_Fragment_3_CB1((uint)(6)).y);
  r2.zw = r2.zz ? r0.zw : r2.xy;
  r3.xyzw = r1.yyzz ? r0.zwzw : r2.xyxy;
  r2.xyzw = _Tex_AddRGB.Sample(sampler_Tex_AddRGB, r2.zw).xyzw;
  r4.xyzw = _Tex_AddRGB.Sample(sampler_Tex_AddRGB, r3.xy).xyzw;
  r3.xyzw = _Tex_AddRGB.Sample(sampler_Tex_AddRGB, r3.zw).xyzw;
  r0.z = -r4.x * r2.y + 1;
  r0.z = saturate(r0.z * r3.z);
  r0.z = saturate(BA_Fragment_3_CB1((uint)(10)).y * r0.z);
  r1.yz = v3.xy * BA_Fragment_3_CB1((uint)(0)).xy + BA_Fragment_3_CB1((uint)(0)).zw;
  r1.xy = r1.xw + r1.yz;
  r0.xy = r1.xy + r0.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r0.xyw = BA_Fragment_3_CB1((uint)(6)).xxx * v1.xyz;
  r0.xyw = r0.xyw * r1.xyz;
  r1.x = v1.w * r1.w;
  r1.x = BA_Fragment_3_CB1((uint)(4)).w * r1.x;
  o0.w = saturate(BA_Fragment_3_CB1((uint)(6)).x * r1.x);
  r0.xyw = saturate(BA_Fragment_3_CB1((uint)(4)).xyz * r0.xyw);
  r1.xyz = BA_Fragment_3_CB1((uint)(2)).xyz + -r0.xyw;
  o0.xyz = r0.zzz * r1.xyz + r0.xyw;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
