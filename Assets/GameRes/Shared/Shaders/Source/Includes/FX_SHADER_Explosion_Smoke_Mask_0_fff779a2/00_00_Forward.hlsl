// Exact names and types from the original compiled parameter metadata.
float _BCustom_Data_Use;
float _BDisappear_Offset;
float _Color_Custom_Data_Use;
float _Custom_Data_Main_Offset_Use;
float _Custom_Data_Mask_Offset_Use;
float4 _GColor;
float _GColor_Sharpness;
float _GCustom_Data_Use;
float _GDisappear_Offset;
float4 _MainColor;
float _Main_Speed_X;
float _Main_Speed_Y;
float4 _Main_TexRGBA_ST;
float _Mask_Speed_X;
float _Mask_Speed_Y;
float4 _Mask_Tex_ST;
float _Mutiply;
float _Shadow_Color_Multiply;
float _Shadow_Value;
Texture2D<float4> _Main_TexRGBA;
Texture2D<float4> _Mask_Tex;
SamplerState sampler_Main_TexRGBA;
SamplerState sampler_Mask_Tex;
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
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : COLOR0,
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
  float4 value = 0;
  if (i == 0u) value = float4(_GColor.x, _GColor.y, _GColor.z, _GColor.w);
  if (i == 1u) value = float4(_Main_TexRGBA_ST.x, _Main_TexRGBA_ST.y, _Main_TexRGBA_ST.z, _Main_TexRGBA_ST.w);
  if (i == 2u) value = float4(_MainColor.x, _MainColor.y, _MainColor.z, _MainColor.w);
  if (i == 3u) value = float4(_Mask_Tex_ST.x, _Mask_Tex_ST.y, _Mask_Tex_ST.z, _Mask_Tex_ST.w);
  if (i == 4u) value = float4(0.0, _GDisappear_Offset, _GCustom_Data_Use, _Color_Custom_Data_Use);
  if (i == 5u) value = float4(_Mask_Speed_Y, _Mask_Speed_X, _Custom_Data_Mask_Offset_Use, _Shadow_Value);
  if (i == 6u) value = float4(_BDisappear_Offset, _BCustom_Data_Use, _Shadow_Color_Multiply, _Main_Speed_Y);
  if (i == 7u) value = float4(_Main_Speed_X, _Custom_Data_Main_Offset_Use, 0.0, _GColor_Sharpness);
  if (i == 8u) value = float4(_Mutiply, 0.0, 0.0, 0.0);
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
  float4 v3 : COLOR0,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_3_CB1((uint)(5)).yx * BA_Fragment_3_CB0((uint)(11)).yy;
  r0.z = cmp(0 != BA_Fragment_3_CB1((uint)(5)).z);
  r0.xy = r0.zz ? v1.xy : r0.xy;
  r0.zw = v2.xy * BA_Fragment_3_CB1((uint)(3)).xy + BA_Fragment_3_CB1((uint)(3)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Mask_Tex.Sample(sampler_Mask_Tex, r0.xy).xyzw;
  r1.x = BA_Fragment_3_CB1((uint)(7)).x * BA_Fragment_3_CB0((uint)(11)).y;
  r1.y = BA_Fragment_3_CB1((uint)(6)).w * BA_Fragment_3_CB0((uint)(11)).y;
  r0.y = cmp(0 != BA_Fragment_3_CB1((uint)(7)).y);
  r0.yz = r0.yy ? v1.xy : r1.xy;
  r1.xy = v2.xy * BA_Fragment_3_CB1((uint)(1)).xy + BA_Fragment_3_CB1((uint)(1)).zw;
  r0.yz = r1.xy + r0.yz;
  r1.xyzw = _Main_TexRGBA.Sample(sampler_Main_TexRGBA, r0.yz).xyzw;
  r0.y = r1.z * r0.x + BA_Fragment_3_CB1((uint)(5)).w;
  r0.x = r1.z * r0.x;
  r0.z = cmp(0 != BA_Fragment_3_CB1((uint)(6)).y);
  r0.z = r0.z ? v1.w : BA_Fragment_3_CB1((uint)(6)).x;
  r0.xy = cmp(r0.zy >= r0.xz);
  r0.x = r0.x ? 0 : 1;
  r0.x = r1.w * r0.x;
  r0.x = v3.w * r0.x;
  o0.w = BA_Fragment_3_CB1((uint)(2)).w * r0.x;
  r0.x = r0.y ? 0 : 1;
  r0.y = BA_Fragment_3_CB1((uint)(6)).z + -r1.x;
  r0.x = r0.x * r0.y + r1.x;
  r0.xyz = v3.xyz * r0.xxx;
  r1.xzw = BA_Fragment_3_CB1((uint)(2)).xyz * r0.xyz;
  r2.xy = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(4)).wz);
  r2.xzw = r2.xxx ? v4.xyz : BA_Fragment_3_CB1((uint)(0)).xyz;
  r0.w = r2.y ? v1.z : BA_Fragment_3_CB1((uint)(4)).y;
  r0.w = r1.y + -r0.w;
  r0.w = saturate(BA_Fragment_3_CB1((uint)(7)).w * r0.w);
  r0.xyz = -r0.xyz * BA_Fragment_3_CB1((uint)(2)).xyz + r2.xzw;
  r0.xyz = r0.www * r0.xyz + r1.xzw;
  o0.xyz = BA_Fragment_3_CB1((uint)(8)).xxx * r0.xyz;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
