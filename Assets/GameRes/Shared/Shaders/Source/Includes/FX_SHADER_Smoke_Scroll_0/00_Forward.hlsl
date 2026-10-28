// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float4 _Color2;
float _Color2_Offset;
float _Color2_Scroll_Use;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Multiply;
float _Shadow_Color_Value;
float _Shadow_Value;
float _Step_Offset;
float _Step_Power;
float _Step_Scale;
float _Step_Scroll_Use;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
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
  float4 v4 : TEXCOORD2,
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
  if (i == 0u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Color2.x, _Color2.y, _Color2.z, _Color2.w);
  if (i == 3u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 4u) value = float4(_Color2_Offset, _Color2_Scroll_Use, _Step_Offset, _Step_Scale);
  if (i == 5u) value = float4(_Shadow_Value, _Step_Power, _Step_Scroll_Use, _Shadow_Color_Value);
  if (i == 6u) value = float4(_Main_Speed_Y, _Main_Speed_X, 0.0, _Multiply);
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
  float4 v4 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_3_CB1((uint)(4)).wz + v3.xy;
  r0.x = v1.x * r0.x + r0.y;
  r1.yz = v1.xy * BA_Fragment_3_CB1((uint)(1)).xy + BA_Fragment_3_CB1((uint)(1)).zw;
  r1.x = v2.z * r1.y;
  r0.yz = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(6)).yx + r1.xz;
  r1.x = v2.w;
  r1.y = 0;
  r0.yz = r1.xy + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.y = BA_Fragment_3_CB1((uint)(5)).x + r1.z;
  r0.y = r0.x * r1.w + r0.y;
  r0.xz = r0.xx * r1.ww + r1.zy;
  r0.w = cmp(0 != BA_Fragment_3_CB1((uint)(5)).z);
  r0.w = r0.w ? v2.x : BA_Fragment_3_CB1((uint)(5)).y;
  r0.xy = cmp(r0.xy >= r0.ww);
  r0.z = 1 + -r0.z;
  r0.x = r0.x ? 1.000000 : 0;
  r0.y = r0.y ? 0 : 1;
  r0.w = BA_Fragment_3_CB1((uint)(5)).w + -r1.x;
  r0.y = r0.y * r0.w + r1.x;
  r1.xyz = v4.xyz * r0.yyy;
  r1.xyz = BA_Fragment_3_CB1((uint)(3)).xyz * r1.xyz;
  r2.xyz = r1.xyz * r0.xxx;
  r1.xyz = -r1.xyz * r0.xxx + BA_Fragment_3_CB1((uint)(2)).xyz;
  r0.x = BA_Fragment_3_CB1((uint)(3)).w * r0.x;
  r0.x = BA_Fragment_3_CB1((uint)(6)).w * r0.x;
  r0.x = v4.w * r0.x;
  r0.x = r0.x * r1.w;
  r0.y = cmp(0 != BA_Fragment_3_CB1((uint)(4)).y);
  r0.y = r0.y ? v2.y : BA_Fragment_3_CB1((uint)(4)).x;
  r0.y = cmp(r0.y >= r0.z);
  r0.y = r0.y ? 1.000000 : 0;
  r0.yzw = r0.yyy * r1.xyz + r2.xyz;
  o0.xyz = BA_Fragment_3_CB1((uint)(6)).www * r0.yzw;
  r0.yz = v1.xy * BA_Fragment_3_CB1((uint)(0)).xy + BA_Fragment_3_CB1((uint)(0)).zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  o0.w = saturate(r1.x * r0.x);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
