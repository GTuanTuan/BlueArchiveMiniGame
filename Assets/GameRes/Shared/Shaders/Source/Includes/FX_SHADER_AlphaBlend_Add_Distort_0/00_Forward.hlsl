// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float _Custom_Data_Distort_Power_Use;
float _Custom_Data_MainMask_Offset_Use;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Distortion_Power_X;
float _Distortion_Power_Y;
float _Main_Distortion_Use;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mask_Distortion_Use;
float _Mask_Speed_X;
float _Mask_Speed_Y;
float _Multiply;
float _RGBRGBA;
float4 _Tex_Distort_ST;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
Texture2D<float4> _Tex_Distort;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
SamplerState sampler_Tex_Distort;
SamplerState sampler_Tex_Main;
SamplerState sampler_Tex_Mask;
#ifndef cmp
#define cmp -
#endif

#if !defined(INSTANCING_ON)
float4 BA_Vertex_2_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_2_CB0(uint i)
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

  r0.xyz = BA_Vertex_2_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_2_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_2_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_2_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_2_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_2_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xyzw = v2.xyzw;
  o2.xyzw = v3.xyzw;
  o3.xy = v4.xy;
  o3.zw = float2(0,0);
  o4.xyzw = v5.xyzw;
  return;
}
#elif defined(INSTANCING_ON)
float4 BA_Vertex_3_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_3_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_3_CB0(uint i)
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
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD0,
  float4 v5 : COLOR0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : TEXCOORD5,
  out float4 o4 : COLOR0,
  out uint o5 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v6);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v6.x + asint(BA_Vertex_3_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r0.yzw = BA_Vertex_3_CB2((uint)(r0.x+1)).xyz * v0.yyy;
  r0.yzw = BA_Vertex_3_CB2((uint)(r0.x+0)).xyz * v0.xxx + r0.yzw;
  r0.yzw = BA_Vertex_3_CB2((uint)(r0.x+2)).xyz * v0.zzz + r0.yzw;
  r0.xyz = BA_Vertex_3_CB2((uint)(r0.x+3)).xyz + r0.yzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xyzw = v2.xyzw;
  o2.xyzw = v3.xyzw;
  o3.xy = v4.xy;
  o3.zw = float2(0,0);
  o4.xyzw = v5.xyzw;
  o5.x = v6.x;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(INSTANCING_ON)
float4 BA_Fragment_5_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 3u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 4u) value = float4(0.0, _Mask_Distortion_Use, _Mask_Speed_Y, _Mask_Speed_X);
  if (i == 5u) value = float4(_Dis_Speed_Y, _Dis_Speed_X, _Multiply, _Distortion_Power_Y);
  if (i == 6u) value = float4(_Custom_Data_Distort_Power_Use, _Main_Distortion_Use, _Main_Speed_Y, _Main_Speed_X);
  if (i == 7u) value = float4(_Custom_Data_MainMask_Offset_Use, 0.0, 0.0, 0.0);
  if (i == 8u) value = float4(0.0, _Distortion_Power_X, _RGBRGBA, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_5_CB0(uint i)
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

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v3.xy * BA_Fragment_5_CB1((uint)(3)).xy + BA_Fragment_5_CB1((uint)(3)).zw;
  r0.xy = BA_Fragment_5_CB0((uint)(11)).yy * BA_Fragment_5_CB1((uint)(5)).yx + r0.xy;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r0.zw = cmp(float2(0,0) != BA_Fragment_5_CB1((uint)(6)).xy);
  r1.xy = r0.zz ? v2.xy : 0;
  r2.x = BA_Fragment_5_CB1((uint)(8)).y + r1.x;
  r2.y = BA_Fragment_5_CB1((uint)(5)).w + r1.y;
  r0.xy = r2.xy * r0.xy;
  r0.zw = r0.ww ? r0.xy : 0;
  r1.x = cmp(0 != BA_Fragment_5_CB1((uint)(7)).x);
  r1.xyzw = r1.xxxx ? v1.xyzw : 0;
  r1.xy = BA_Fragment_5_CB0((uint)(11)).yy * BA_Fragment_5_CB1((uint)(6)).wz + r1.xy;
  r1.zw = BA_Fragment_5_CB0((uint)(11)).yy * BA_Fragment_5_CB1((uint)(4)).wz + r1.zw;
  r0.zw = r1.xy + r0.zw;
  r1.xy = v3.xy * BA_Fragment_5_CB1((uint)(2)).xy + BA_Fragment_5_CB1((uint)(2)).zw;
  r0.zw = r1.xy + r0.zw;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r3.xyz = v4.xyz * r2.xyz;
  r3.xyz = BA_Fragment_5_CB1((uint)(1)).xyz * r3.xyz;
  r0.zw = v3.xy * BA_Fragment_5_CB1((uint)(0)).xy + BA_Fragment_5_CB1((uint)(0)).zw;
  r0.zw = r1.zw + r0.zw;
  r1.x = cmp(0 != BA_Fragment_5_CB1((uint)(4)).y);
  r0.xy = r1.xx ? r0.xy : 0;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.yzw = r3.xyz * r0.xxx;
  r0.yzw = BA_Fragment_5_CB1((uint)(5)).zzz * r0.yzw;
  o0.xyz = r0.yzw * r2.www;
  r0.y = cmp(0 != BA_Fragment_5_CB1((uint)(8)).z);
  r0.y = r0.y ? r2.w : r2.x;
  r0.z = v4.w * v4.w;
  r0.y = r0.y * r0.z;
  r0.y = BA_Fragment_5_CB1((uint)(1)).w * r0.y;
  r0.x = r0.y * r0.x;
  o0.w = saturate(BA_Fragment_5_CB1((uint)(5)).z * r0.x);
  return;
}
#elif defined(INSTANCING_ON)
float4 BA_Fragment_6_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 3u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 4u) value = float4(0.0, _Mask_Distortion_Use, _Mask_Speed_Y, _Mask_Speed_X);
  if (i == 5u) value = float4(_Dis_Speed_Y, _Dis_Speed_X, _Multiply, _Distortion_Power_Y);
  if (i == 6u) value = float4(_Custom_Data_Distort_Power_Use, _Main_Distortion_Use, _Main_Speed_Y, _Main_Speed_X);
  if (i == 7u) value = float4(_Custom_Data_MainMask_Offset_Use, 0.0, 0.0, 0.0);
  if (i == 8u) value = float4(0.0, _Distortion_Power_X, _RGBRGBA, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_6_CB0(uint i)
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
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_Target0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v3.xy * BA_Fragment_6_CB1((uint)(3)).xy + BA_Fragment_6_CB1((uint)(3)).zw;
  r0.xy = BA_Fragment_6_CB0((uint)(11)).yy * BA_Fragment_6_CB1((uint)(5)).yx + r0.xy;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r0.zw = cmp(float2(0,0) != BA_Fragment_6_CB1((uint)(6)).xy);
  r1.xy = r0.zz ? v2.xy : 0;
  r2.x = BA_Fragment_6_CB1((uint)(8)).y + r1.x;
  r2.y = BA_Fragment_6_CB1((uint)(5)).w + r1.y;
  r0.xy = r2.xy * r0.xy;
  r0.zw = r0.ww ? r0.xy : 0;
  r1.x = cmp(0 != BA_Fragment_6_CB1((uint)(7)).x);
  r1.xyzw = r1.xxxx ? v1.xyzw : 0;
  r1.xy = BA_Fragment_6_CB0((uint)(11)).yy * BA_Fragment_6_CB1((uint)(6)).wz + r1.xy;
  r1.zw = BA_Fragment_6_CB0((uint)(11)).yy * BA_Fragment_6_CB1((uint)(4)).wz + r1.zw;
  r0.zw = r1.xy + r0.zw;
  r1.xy = v3.xy * BA_Fragment_6_CB1((uint)(2)).xy + BA_Fragment_6_CB1((uint)(2)).zw;
  r0.zw = r1.xy + r0.zw;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r3.xyz = v4.xyz * r2.xyz;
  r3.xyz = BA_Fragment_6_CB1((uint)(1)).xyz * r3.xyz;
  r0.zw = v3.xy * BA_Fragment_6_CB1((uint)(0)).xy + BA_Fragment_6_CB1((uint)(0)).zw;
  r0.zw = r1.zw + r0.zw;
  r1.x = cmp(0 != BA_Fragment_6_CB1((uint)(4)).y);
  r0.xy = r1.xx ? r0.xy : 0;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.yzw = r3.xyz * r0.xxx;
  r0.yzw = BA_Fragment_6_CB1((uint)(5)).zzz * r0.yzw;
  o0.xyz = r0.yzw * r2.www;
  r0.y = cmp(0 != BA_Fragment_6_CB1((uint)(8)).z);
  r0.y = r0.y ? r2.w : r2.x;
  r0.z = v4.w * v4.w;
  r0.y = r0.y * r0.z;
  r0.y = BA_Fragment_6_CB1((uint)(1)).w * r0.y;
  r0.x = r0.y * r0.x;
  o0.w = saturate(BA_Fragment_6_CB1((uint)(5)).z * r0.x);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
