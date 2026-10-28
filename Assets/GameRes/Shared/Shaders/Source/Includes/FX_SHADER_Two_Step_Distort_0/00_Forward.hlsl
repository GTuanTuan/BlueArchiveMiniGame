// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float _Custom_Data_Distort_Power_Use;
float _Custom_Data_Main_Offset_Use;
float _Dis_Power_X;
float _Dis_Power_Y;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Multiply;
float _Multiply_G;
float _Step_Scroll_Use;
float _Step_Value;
float4 _Tex_Distort_ST;
float4 _Tex_MainRGB_ST;
Texture2D<float4> _Tex_Distort;
Texture2D<float4> _Tex_MainRGB;
SamplerState sampler_Tex_Distort;
SamplerState sampler_Tex_MainRGB;
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
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
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
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_MainRGB_ST.x, _Tex_MainRGB_ST.y, _Tex_MainRGB_ST.z, _Tex_MainRGB_ST.w);
  if (i == 2u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 3u) value = float4(0.0, _Step_Scroll_Use, _Custom_Data_Main_Offset_Use, _Main_Speed_Y);
  if (i == 4u) value = float4(_Main_Speed_X, _Dis_Power_Y, _Custom_Data_Distort_Power_Use, _Step_Value);
  if (i == 5u) value = float4(_Dis_Speed_Y, _Dis_Speed_X, _Multiply, 0.0);
  if (i == 6u) value = float4(_Dis_Power_X, _Multiply_G, 0.0, 0.0);
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

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_3_CB1((uint)(2)).xy + BA_Fragment_3_CB1((uint)(2)).zw;
  r0.xy = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(5)).yx + r0.xy;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r0.yz = v1.xy * BA_Fragment_3_CB1((uint)(1)).xy + BA_Fragment_3_CB1((uint)(1)).zw;
  r0.w = cmp(0 != BA_Fragment_3_CB1((uint)(4)).z);
  r1.x = r0.w ? v2.x : BA_Fragment_3_CB1((uint)(6)).x;
  r1.y = r0.w ? v2.y : BA_Fragment_3_CB1((uint)(4)).y;
  r0.xy = r0.xx * r1.xy + r0.yz;
  r1.x = BA_Fragment_3_CB1((uint)(4)).x * BA_Fragment_3_CB0((uint)(11)).y;
  r1.y = BA_Fragment_3_CB1((uint)(3)).w * BA_Fragment_3_CB0((uint)(11)).y;
  r0.xy = r1.xy + r0.xy;
  r0.zw = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(3)).zy);
  r1.xy = r0.zz ? v3.zw : 0;
  r0.z = r0.w ? v3.x : BA_Fragment_3_CB1((uint)(4)).w;
  r0.xy = r1.xy + r0.xy;
  r1.xyzw = _Tex_MainRGB.Sample(sampler_Tex_MainRGB, r0.xy).xyzw;
  r0.xy = cmp(r0.zz >= r1.xy);
  r0.xy = r0.xy ? float2(0,0) : float2(1,1);
  r0.z = BA_Fragment_3_CB1((uint)(5)).z * r0.x;
  r0.z = v4.w * r0.z;
  r0.z = saturate(r0.z * r1.z);
  r0.w = -0.0900000036 + r0.z;
  o0.w = r0.z;
  r0.z = cmp(r0.w < 0);
  if (r0.z != 0) discard;
  r0.xzw = BA_Fragment_3_CB1((uint)(0)).xyz * r0.xxx;
  r0.xzw = v4.xyz * r0.xzw;
  r1.xyz = BA_Fragment_3_CB1((uint)(6)).yyy * BA_Fragment_3_CB1((uint)(0)).xyz;
  r1.xyz = v4.xyz * r1.xyz;
  r1.xyz = r1.xyz * v3.yyy + -r0.xzw;
  r0.xyz = r0.yyy * r1.xyz + r0.xzw;
  o0.xyz = BA_Fragment_3_CB1((uint)(5)).zzz * r0.xyz;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
