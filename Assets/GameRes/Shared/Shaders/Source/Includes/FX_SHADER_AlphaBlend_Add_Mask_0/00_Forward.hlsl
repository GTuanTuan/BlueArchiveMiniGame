// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float _Custom_Data_MainMask_Offset_Use;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mask_Speed_X;
float _Mask_Speed_Y;
float _Multiply;
float _RGBRGBA;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
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
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

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
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
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
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : COLOR0,
  out uint o4 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v5.x + asint(BA_Vertex_3_CB1((uint)(0)).x);
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
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  o4.x = v5.x;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(INSTANCING_ON)
float4 BA_Fragment_5_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(0.0, _Custom_Data_MainMask_Offset_Use, _Main_Speed_X, _Main_Speed_Y);
  if (i == 5u) value = float4(_RGBRGBA, _Mask_Speed_X, _Mask_Speed_Y, _Multiply);
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
  float4 v3 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_5_CB1((uint)(0)).xy + BA_Fragment_5_CB1((uint)(0)).zw;
  r0.z = cmp(0 != BA_Fragment_5_CB1((uint)(4)).y);
  r1.xyzw = r0.zzzz ? v1.xyzw : 0;
  r0.zw = BA_Fragment_5_CB0((uint)(11)).yy * BA_Fragment_5_CB1((uint)(4)).zw + r1.xy;
  r1.xy = BA_Fragment_5_CB0((uint)(11)).yy * BA_Fragment_5_CB1((uint)(5)).yz + r1.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r2.xyz = v3.xyz * r0.xyz;
  r2.xyz = BA_Fragment_5_CB1((uint)(1)).xyz * r2.xyz;
  r1.z = cmp(0 != BA_Fragment_5_CB1((uint)(5)).x);
  r0.xyz = r1.zzz ? r0.www : r0.xyz;
  r0.yzw = r2.xyz * r0.xyz;
  r1.zw = v2.xy * BA_Fragment_5_CB1((uint)(2)).xy + BA_Fragment_5_CB1((uint)(2)).zw;
  r1.xy = r1.xy + r1.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r1.xy).xyzw;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = BA_Fragment_5_CB1((uint)(5)).www * r0.yzw;
  r0.y = v3.w * v3.w;
  r0.x = r0.x * r0.y;
  r0.x = BA_Fragment_5_CB1((uint)(1)).w * r0.x;
  r0.x = r0.x * r1.x;
  o0.w = saturate(BA_Fragment_5_CB1((uint)(5)).w * r0.x);
  return;
}
#elif defined(INSTANCING_ON)
float4 BA_Fragment_6_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 4u) value = float4(0.0, _Custom_Data_MainMask_Offset_Use, _Main_Speed_X, _Main_Speed_Y);
  if (i == 5u) value = float4(_RGBRGBA, _Mask_Speed_X, _Mask_Speed_Y, _Multiply);
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
  float4 v3 : COLOR0,
  uint v4 : SV_InstanceID0,
  out float4 o0 : SV_Target0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v4);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_6_CB1((uint)(0)).xy + BA_Fragment_6_CB1((uint)(0)).zw;
  r0.z = cmp(0 != BA_Fragment_6_CB1((uint)(4)).y);
  r1.xyzw = r0.zzzz ? v1.xyzw : 0;
  r0.zw = BA_Fragment_6_CB0((uint)(11)).yy * BA_Fragment_6_CB1((uint)(4)).zw + r1.xy;
  r1.xy = BA_Fragment_6_CB0((uint)(11)).yy * BA_Fragment_6_CB1((uint)(5)).yz + r1.zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r2.xyz = v3.xyz * r0.xyz;
  r2.xyz = BA_Fragment_6_CB1((uint)(1)).xyz * r2.xyz;
  r1.z = cmp(0 != BA_Fragment_6_CB1((uint)(5)).x);
  r0.xyz = r1.zzz ? r0.www : r0.xyz;
  r0.yzw = r2.xyz * r0.xyz;
  r1.zw = v2.xy * BA_Fragment_6_CB1((uint)(2)).xy + BA_Fragment_6_CB1((uint)(2)).zw;
  r1.xy = r1.xy + r1.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r1.xy).xyzw;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = BA_Fragment_6_CB1((uint)(5)).www * r0.yzw;
  r0.y = v3.w * v3.w;
  r0.x = r0.x * r0.y;
  r0.x = BA_Fragment_6_CB1((uint)(1)).w * r0.x;
  r0.x = r0.x * r1.x;
  o0.w = saturate(BA_Fragment_6_CB1((uint)(5)).w * r0.x);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
