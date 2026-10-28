// Exact names and types from the original compiled parameter metadata.
float _AlphaClip_Value;
float _BCustom_Data_Use;
float _BDisappear_Offset;
float _Custom_Data_Distort_Power_Offset_Use;
float _Custom_Data_MainRB_Offset_Use;
float _Custom_Data_Shadow_Value_Use;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Distortion_Power_X;
float _Distortion_Power_Y;
float _GColor_Sharpness;
float _GCustom_Data_Use;
float _GDisappear_Offset;
float4 _MainColor;
float _Main_Speed_X;
float _Main_Speed_Y;
float4 _Main_TexRGBA_ST;
float _Mutiply;
float _Shadow_Value;
float4 _SubColor;
float _Sub_Speed_X;
float _Sub_Speed_Y;
float4 _Sub_Tex_ST;
float4 _Tex_Distort_ST;
float4 _UV_Add_TilingOffset;
float _UV_Add_Use;
Texture2D<float4> _Main_TexRGBA;
Texture2D<float4> _Sub_Tex;
Texture2D<float4> _Tex_Distort;
SamplerState sampler_Main_TexRGBA;
SamplerState sampler_Sub_Tex;
SamplerState sampler_Tex_Distort;
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD1,
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
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_3_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_MainColor.x, _MainColor.y, _MainColor.z, _MainColor.w);
  if (i == 1u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 2u) value = float4(_Sub_Tex_ST.x, _Sub_Tex_ST.y, _Sub_Tex_ST.z, _Sub_Tex_ST.w);
  if (i == 3u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 4u) value = float4(_SubColor.x, _SubColor.y, _SubColor.z, _SubColor.w);
  if (i == 5u) value = float4(_Main_TexRGBA_ST.x, _Main_TexRGBA_ST.y, _Main_TexRGBA_ST.z, _Main_TexRGBA_ST.w);
  if (i == 6u) value = float4(0.0, _Shadow_Value, _Custom_Data_Shadow_Value_Use, _BDisappear_Offset);
  if (i == 7u) value = float4(_BCustom_Data_Use, _GColor_Sharpness, _GDisappear_Offset, _GCustom_Data_Use);
  if (i == 8u) value = float4(_Sub_Speed_Y, _Sub_Speed_X, _Main_Speed_X, _Mutiply);
  if (i == 9u) value = float4(_Custom_Data_MainRB_Offset_Use, _UV_Add_Use, _Distortion_Power_Y, _Distortion_Power_X);
  if (i == 10u) value = float4(_Custom_Data_Distort_Power_Offset_Use, _Dis_Speed_Y, _Dis_Speed_X, 0.0);
  if (i == 11u) value = float4(0.0, 0.0, _Main_Speed_Y, _AlphaClip_Value);
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
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_3_CB1((uint)(8)).w * v1.w;
  r0.x = BA_Fragment_3_CB1((uint)(0)).w * r0.x;
  r1.xy = v2.xy * BA_Fragment_3_CB1((uint)(1)).xy + BA_Fragment_3_CB1((uint)(1)).zw;
  r1.zw = float2(0,1);
  r0.yz = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(10)).zy + r1.zy;
  r0.yz = r1.xw + r0.yz;
  r1.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.yz).xyzw;
  r0.y = cmp(0 != BA_Fragment_3_CB1((uint)(10)).x);
  r0.yz = r0.yy ? v3.zw : 0;
  r0.yz = BA_Fragment_3_CB1((uint)(9)).wz + r0.yz;
  r0.yz = r1.xy * r0.yz;
  r1.x = BA_Fragment_3_CB1((uint)(8)).z * BA_Fragment_3_CB0((uint)(11)).y;
  r1.y = BA_Fragment_3_CB1((uint)(11)).z * BA_Fragment_3_CB0((uint)(11)).y;
  r1.zw = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(9)).yx);
  r1.xy = r1.ww ? v3.xy : r1.xy;
  r2.yz = v2.xy * BA_Fragment_3_CB1((uint)(5)).xy + BA_Fragment_3_CB1((uint)(5)).zw;
  r2.x = v4.w * r2.y;
  r1.xy = r2.xz + r1.xy;
  r2.xy = v2.xy * BA_Fragment_3_CB1((uint)(3)).xy + BA_Fragment_3_CB1((uint)(3)).zw;
  r0.w = r2.x + r2.y;
  r0.w = r1.z ? r0.w : 1;
  r1.xy = r0.yz * r0.ww + r1.xy;
  r1.xyzw = _Main_TexRGBA.Sample(sampler_Main_TexRGBA, r1.xy).xyzw;
  r2.xy = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(7)).wx);
  r2.y = r2.y ? v4.y : BA_Fragment_3_CB1((uint)(6)).w;
  r2.x = r2.x ? v4.x : BA_Fragment_3_CB1((uint)(7)).z;
  r2.z = cmp(r2.y >= r1.z);
  r0.x = r2.z ? 0 : r0.x;
  r0.x = saturate(r0.x * r1.w);
  r1.w = -BA_Fragment_3_CB1((uint)(11)).w + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r1.w < 0);
  if (r0.x != 0) discard;
  r2.zw = v2.xy * BA_Fragment_3_CB1((uint)(2)).xy + BA_Fragment_3_CB1((uint)(2)).zw;
  r2.zw = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(8)).yx + r2.zw;
  r0.xy = r0.yz * r0.ww + r2.zw;
  r0.xyzw = _Sub_Tex.Sample(sampler_Sub_Tex, r0.xy).xyzw;
  r0.x = saturate(r0.y + r1.y);
  r0.x = r0.x + -r2.x;
  r0.x = saturate(BA_Fragment_3_CB1((uint)(7)).y * r0.x);
  r0.y = cmp(0 != BA_Fragment_3_CB1((uint)(6)).z);
  r0.y = r0.y ? v4.z : BA_Fragment_3_CB1((uint)(6)).y;
  r0.y = r1.z + r0.y;
  r0.y = cmp(r0.y >= r2.y);
  r0.y = r0.y ? -1 : -0;
  r0.x = r0.x + r0.y;
  r0.x = 1 + r0.x;
  r0.x = min(1, r0.x);
  r0.yzw = BA_Fragment_3_CB1((uint)(0)).xyz * v1.xyz;
  r1.yzw = r0.yzw * r1.xxx;
  r0.yzw = -r0.yzw * r1.xxx + BA_Fragment_3_CB1((uint)(4)).xyz;
  r0.xyz = r0.xxx * r0.yzw + r1.yzw;
  o0.xyz = BA_Fragment_3_CB1((uint)(8)).www * r0.xyz;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
