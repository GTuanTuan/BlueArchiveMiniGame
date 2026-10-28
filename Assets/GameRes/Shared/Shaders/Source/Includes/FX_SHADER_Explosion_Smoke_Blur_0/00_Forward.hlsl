// Exact names and types from the original compiled parameter metadata.
float _BCustom_Data_Use;
float _BDisappear_Offset;
float _BStep_Glow_Value;
float _Color_Custom_Data_Use;
float _Custom_Data_Main_Offset_Use;
float4 _GColor;
float _GColor_Glow_Value;
float _GCustom_Data_Use;
float _GDisappear_Offset;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mutiply;
float4 _RColor;
float _Shadow_Color_Multiply;
float _Shadow_Glow_Value;
float _Shadow_Value;
float _Step_Custom_DataVertex_color_Use;
float4 _Tex_Main_ST;
float _Vertex_Alpha_Use;
Texture2D<float4> _Tex_Main;
SamplerState sampler_Tex_Main;
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
  o1.xyzw = v2.xyzw;
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
  if (i == 0u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 1u) value = float4(_GColor.x, _GColor.y, _GColor.z, _GColor.w);
  if (i == 2u) value = float4(_RColor.x, _RColor.y, _RColor.z, _RColor.w);
  if (i == 3u) value = float4(0.0, _Mutiply, _GColor_Glow_Value, _GDisappear_Offset);
  if (i == 4u) value = float4(_GCustom_Data_Use, _Color_Custom_Data_Use, _Shadow_Glow_Value, _Shadow_Value);
  if (i == 5u) value = float4(_Step_Custom_DataVertex_color_Use, _BDisappear_Offset, _BCustom_Data_Use, _Shadow_Color_Multiply);
  if (i == 6u) value = float4(_Custom_Data_Main_Offset_Use, _Main_Speed_Y, _Main_Speed_X, 0.0);
  if (i == 7u) value = float4(0.0, _BStep_Glow_Value, _Vertex_Alpha_Use, 0.0);
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

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 1 + -v3.w;
  r0.yz = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(5)).zx);
  r0.x = r0.z ? r0.x : v2.w;
  r0.x = r0.y ? r0.x : BA_Fragment_3_CB1((uint)(5)).y;
  r0.yz = v1.xy * BA_Fragment_3_CB1((uint)(0)).xy + BA_Fragment_3_CB1((uint)(0)).zw;
  r0.yz = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(6)).zy + r0.yz;
  r0.w = cmp(0 != BA_Fragment_3_CB1((uint)(6)).x);
  r1.xy = r0.ww ? v2.xy : 0;
  r0.yz = r1.xy + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.y = BA_Fragment_3_CB1((uint)(4)).w + r1.z;
  r0.y = r0.x + -r0.y;
  r0.x = r1.z + -r0.x;
  r0.x = saturate(BA_Fragment_3_CB1((uint)(7)).y * r0.x);
  r0.x = r1.w * r0.x;
  r0.x = BA_Fragment_3_CB1((uint)(2)).w * r0.x;
  r0.x = BA_Fragment_3_CB1((uint)(3)).y * r0.x;
  r0.y = saturate(BA_Fragment_3_CB1((uint)(4)).z * r0.y);
  r0.z = BA_Fragment_3_CB1((uint)(5)).w + -r1.x;
  r0.y = r0.y * r0.z + r1.x;
  r0.yzw = v3.xyz * r0.yyy;
  r1.xzw = BA_Fragment_3_CB1((uint)(2)).xyz * r0.yzw;
  r2.xy = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(4)).yx);
  r2.xzw = r2.xxx ? v4.xyz : BA_Fragment_3_CB1((uint)(1)).xyz;
  r2.y = r2.y ? v2.z : BA_Fragment_3_CB1((uint)(3)).w;
  r1.y = -r2.y + r1.y;
  r1.y = saturate(BA_Fragment_3_CB1((uint)(3)).z * r1.y);
  r0.yzw = -r0.yzw * BA_Fragment_3_CB1((uint)(2)).xyz + r2.xzw;
  r0.yzw = r1.yyy * r0.yzw + r1.xzw;
  o0.xyz = BA_Fragment_3_CB1((uint)(3)).yyy * r0.yzw;
  r0.y = cmp(0 != BA_Fragment_3_CB1((uint)(7)).z);
  r0.y = r0.y ? 1 : v3.w;
  o0.w = r0.x * r0.y;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
