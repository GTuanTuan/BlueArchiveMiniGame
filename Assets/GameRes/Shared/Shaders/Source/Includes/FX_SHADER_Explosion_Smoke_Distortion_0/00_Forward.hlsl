// Exact names and types from the original compiled parameter metadata.
float _BCustom_Data_Use;
float _BDisappear_Offset;
float _Color_Custom_Data_Use;
float _Custom_Data_MainMask_Offset_Use;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Distortion_Power_X;
float _Distortion_Power_Y;
float4 _GColor;
float _GColor_Sharpness;
float _GCustom_Data_Use;
float _GDisappear_Offset;
float4 _MainColor;
float _Main_Speed_X;
float _Main_Speed_Y;
float4 _Main_TexRGBA_ST;
float _Mutiply;
float _Shadow_Color_Multiply;
float _Shadow_Value;
float4 _Tex_Distort_ST;
Texture2D<float4> _Main_TexRGBA;
Texture2D<float4> _Tex_Distort;
SamplerState sampler_Main_TexRGBA;
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
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD1,
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
  o1.xy = v2.xy;
  o1.zw = float2(0,0);
  o2.xyzw = v3.xyzw;
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
  if (i == 0u) value = float4(_Main_TexRGBA_ST.x, _Main_TexRGBA_ST.y, _Main_TexRGBA_ST.z, _Main_TexRGBA_ST.w);
  if (i == 1u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 2u) value = float4(_GColor.x, _GColor.y, _GColor.z, _GColor.w);
  if (i == 3u) value = float4(_MainColor.x, _MainColor.y, _MainColor.z, _MainColor.w);
  if (i == 4u) value = float4(_GDisappear_Offset, _GCustom_Data_Use, _Color_Custom_Data_Use, _Shadow_Value);
  if (i == 5u) value = float4(_BDisappear_Offset, _BCustom_Data_Use, _Shadow_Color_Multiply, 0.0);
  if (i == 6u) value = float4(_Main_Speed_Y, _Main_Speed_X, _Custom_Data_MainMask_Offset_Use, _Distortion_Power_Y);
  if (i == 7u) value = float4(_Distortion_Power_X, _Dis_Speed_Y, _Dis_Speed_X, 0.0);
  if (i == 8u) value = float4(_GColor_Sharpness, _Mutiply, 0.0, 0.0);
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
  float4 v3 : COLOR0,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_3_CB1((uint)(6)).yx * BA_Fragment_3_CB0((uint)(11)).yy;
  r0.z = cmp(0 != BA_Fragment_3_CB1((uint)(6)).z);
  r0.xy = r0.zz ? v2.xy : r0.xy;
  r0.zw = v1.xy * BA_Fragment_3_CB1((uint)(0)).xy + BA_Fragment_3_CB1((uint)(0)).zw;
  r0.xy = r0.xy + r0.zw;
  r1.xy = v1.xy * BA_Fragment_3_CB1((uint)(1)).xy + BA_Fragment_3_CB1((uint)(1)).zw;
  r1.zw = float2(0,1);
  r0.zw = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(7)).zy + r1.zy;
  r0.zw = r1.xw + r0.zw;
  r1.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.zw).xyzw;
  r2.x = BA_Fragment_3_CB1((uint)(7)).x * r1.x;
  r2.y = BA_Fragment_3_CB1((uint)(6)).w * r1.y;
  r0.xy = r2.xy + r0.xy;
  r0.xyzw = _Main_TexRGBA.Sample(sampler_Main_TexRGBA, r0.xy).xyzw;
  r1.x = BA_Fragment_3_CB1((uint)(4)).w + r0.z;
  r1.y = cmp(0 != BA_Fragment_3_CB1((uint)(5)).y);
  r1.y = r1.y ? v2.w : BA_Fragment_3_CB1((uint)(5)).x;
  r1.x = cmp(r1.x >= r1.y);
  r0.z = cmp(r1.y >= r0.z);
  r1.x = r1.x ? 0 : 1;
  r1.y = BA_Fragment_3_CB1((uint)(5)).z + -r0.x;
  r0.x = r1.x * r1.y + r0.x;
  r1.xyz = v3.xyz * r0.xxx;
  r2.xyz = BA_Fragment_3_CB1((uint)(3)).xyz * r1.xyz;
  r3.xy = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(4)).zy);
  r3.xzw = r3.xxx ? v4.xyz : BA_Fragment_3_CB1((uint)(2)).xyz;
  r0.x = r3.y ? v2.z : BA_Fragment_3_CB1((uint)(4)).x;
  r0.x = r0.y + -r0.x;
  r0.x = saturate(BA_Fragment_3_CB1((uint)(8)).x * r0.x);
  r1.xyz = -r1.xyz * BA_Fragment_3_CB1((uint)(3)).xyz + r3.xzw;
  r1.xyz = r0.xxx * r1.xyz + r2.xyz;
  o0.xyz = BA_Fragment_3_CB1((uint)(8)).yyy * r1.xyz;
  r0.x = BA_Fragment_3_CB1((uint)(8)).y * v3.w;
  r0.x = BA_Fragment_3_CB1((uint)(3)).w * r0.x;
  r0.x = r0.z ? 0 : r0.x;
  o0.w = saturate(r0.x * r0.w);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
