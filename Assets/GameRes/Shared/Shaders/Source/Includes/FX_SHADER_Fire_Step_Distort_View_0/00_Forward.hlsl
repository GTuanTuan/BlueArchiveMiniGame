// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float _Custom_Data_Distort_Power_Use;
float _Custom_Data_Main_Offset_Use;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Distortion_Power_X;
float _Distortion_Power_Y;
float4 _Distortion_Tilling;
float _Main_Distortion_Use;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mask_Distortion_Use;
float _Mask_Speed_X;
float _Mask_Speed_Y;
float _Multiply;
float _RGBRGBA;
float _Step_Custom_DataVertex_color_Use;
float _Step_Power;
float _Step_Scroll_Use;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
float4 _UV_Add_TilingOffset;
float _UV_Add_Use;
float _Vertex_Alpha_Use;
Texture2D<float4> _Tex_Distort;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
SamplerState sampler_Tex_Distort;
SamplerState sampler_Tex_Main;
SamplerState sampler_Tex_Mask;
#ifndef cmp
#define cmp -
#endif

#if 1
float4 BA_Vertex_1_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_1_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : TEXCOORD6,
  out float4 o5 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

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
  r0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v2.xyzw;
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  r0.y = BA_Vertex_1_CB0((uint)(17)).x * r0.y;
  r1.xzw = float3(0.5,0.5,0.5) * r0.xwy;
  o4.zw = r0.zw;
  o4.xy = r1.xw + r1.zz;
  o5.xyzw = v5.xyzw;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_3_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 3u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(_Distortion_Tilling.x, _Distortion_Tilling.y, _Distortion_Tilling.z, _Distortion_Tilling.w);
  if (i == 5u) value = float4(_Multiply, _Mask_Speed_Y, _Mask_Speed_X, _Mask_Distortion_Use);
  if (i == 6u) value = float4(_Step_Custom_DataVertex_color_Use, _Step_Power, _Step_Scroll_Use, _Main_Speed_Y);
  if (i == 7u) value = float4(0.0, _RGBRGBA, _UV_Add_Use, _Dis_Speed_Y);
  if (i == 8u) value = float4(_Dis_Speed_X, _Custom_Data_Distort_Power_Use, _Distortion_Power_Y, _Distortion_Power_X);
  if (i == 9u) value = float4(_Main_Distortion_Use, _Custom_Data_Main_Offset_Use, 0.0, _Main_Speed_X);
  if (i == 10u) value = float4(_Vertex_Alpha_Use, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_3_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  float4 v2 : TEXCOORD4,
  float4 v3 : TEXCOORD5,
  float4 v4 : TEXCOORD6,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_3_CB1((uint)(8)).x * BA_Fragment_3_CB0((uint)(11)).y;
  r0.y = BA_Fragment_3_CB1((uint)(7)).w * BA_Fragment_3_CB0((uint)(11)).y;
  r0.zw = v4.xy / v4.ww;
  r1.xy = BA_Fragment_3_CB1((uint)(4)).xy * r0.zw;
  r1.zw = float2(0,1);
  r0.xy = r1.zy + r0.xy;
  r0.xy = r1.xw + r0.xy;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r0.z = cmp(0 != BA_Fragment_3_CB1((uint)(8)).y);
  r0.zw = r0.zz ? v3.xy : 0;
  r0.zw = BA_Fragment_3_CB1((uint)(8)).wz + r0.zw;
  r0.xy = r0.zw * r0.xy;
  r0.zw = v2.xy * BA_Fragment_3_CB1((uint)(0)).xy + BA_Fragment_3_CB1((uint)(0)).zw;
  r0.z = r0.z + r0.w;
  r1.xy = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(7)).zy);
  r0.z = r1.x ? r0.z : 1;
  r1.xz = r0.xy * r0.zz;
  r2.xy = v2.xy * BA_Fragment_3_CB1((uint)(2)).xy + BA_Fragment_3_CB1((uint)(2)).zw;
  r2.zw = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(9)).yx);
  r1.xz = r2.ww ? r1.xz : r2.xy;
  r2.zw = r2.zz ? v1.zw : 0;
  r1.xz = r2.zw + r1.xz;
  r3.x = BA_Fragment_3_CB1((uint)(9)).w * BA_Fragment_3_CB0((uint)(11)).y;
  r3.y = BA_Fragment_3_CB1((uint)(6)).w * BA_Fragment_3_CB0((uint)(11)).y;
  r2.xy = r3.xy + r2.xy;
  r1.xz = r2.xy + r1.xz;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r1.xz).xyzw;
  r0.w = r1.y ? r2.w : r2.x;
  r1.xyz = v5.xyz * r2.xyz;
  r2.xy = v2.xy * BA_Fragment_3_CB1((uint)(3)).xy + BA_Fragment_3_CB1((uint)(3)).zw;
  r2.zw = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(5)).zy + r2.xy;
  r0.xy = r0.xy * r0.zz + r2.zw;
  r0.z = cmp(0 != BA_Fragment_3_CB1((uint)(5)).w);
  r0.xy = r0.zz ? r0.xy : r2.xy;
  r2.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.x = 1 + -v5.w;
  r0.yz = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(6)).zx);
  r0.x = r0.z ? r0.x : v1.x;
  r0.x = r0.y ? r0.x : BA_Fragment_3_CB1((uint)(6)).y;
  r0.x = cmp(r2.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = BA_Fragment_3_CB1((uint)(1)).w * r0.x;
  r1.xyz = r1.xyz * r0.xxx;
  r1.xyz = BA_Fragment_3_CB1((uint)(1)).xyz * r1.xyz;
  o0.xyz = BA_Fragment_3_CB1((uint)(5)).xxx * r1.xyz;
  r0.x = r0.y * r0.w;
  r0.y = cmp(0 != BA_Fragment_3_CB1((uint)(10)).x);
  r0.y = r0.y ? v5.w : v5.x;
  r0.x = r0.x * r0.y;
  o0.w = saturate(BA_Fragment_3_CB1((uint)(5)).x * r0.x);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
