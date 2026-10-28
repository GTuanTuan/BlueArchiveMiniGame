// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float _Custom_Data_Distort_Power_Use;
float _Custom_Data_Main_Offset_Use;
float _Custom_Data_Mask_Offset_Usecustom78;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Distortion_Power_X;
float _Distortion_Power_Y;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mask_Speed_X;
float _Mask_Speed_Y;
float _Multiply;
float _RGBRGBA;
float _Step_Custom_DataVertex_color_Use;
float _Step_Power;
float _Step_Scroll_Use;
float4 _Tex_Distort_ST;
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

  r0.xyz = BA_Vertex_2_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_2_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_2_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_2_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_2_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_2_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xy = v2.xy;
  o1.zw = float2(0,0);
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
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
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
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
  o1.xy = v2.xy;
  o1.zw = float2(0,0);
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
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
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 4u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 5u) value = float4(0.0, _Multiply, _Custom_Data_Mask_Offset_Usecustom78, _Mask_Speed_Y);
  if (i == 6u) value = float4(_Mask_Speed_X, _Step_Custom_DataVertex_color_Use, _Step_Power, _Step_Scroll_Use);
  if (i == 7u) value = float4(_UV_Add_Use, _Dis_Speed_X, _RGBRGBA, _Custom_Data_Distort_Power_Use);
  if (i == 8u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Custom_Data_Main_Offset_Use, _Main_Speed_Y);
  if (i == 9u) value = float4(_Main_Speed_X, 0.0, 0.0, 0.0);
  if (i == 10u) value = float4(0.0, _Dis_Speed_Y, _Vertex_Alpha_Use, 0.0);
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

  r0.xy = v1.xy * BA_Fragment_5_CB1((uint)(2)).xy + BA_Fragment_5_CB1((uint)(2)).zw;
  r1.x = BA_Fragment_5_CB1((uint)(6)).x * BA_Fragment_5_CB0((uint)(11)).y;
  r1.y = BA_Fragment_5_CB1((uint)(5)).w * BA_Fragment_5_CB0((uint)(11)).y;
  r0.xy = r1.xy + r0.xy;
  r1.x = BA_Fragment_5_CB1((uint)(7)).y * BA_Fragment_5_CB0((uint)(11)).y;
  r1.y = BA_Fragment_5_CB1((uint)(10)).y * BA_Fragment_5_CB0((uint)(11)).y;
  r2.xy = v1.xy * BA_Fragment_5_CB1((uint)(4)).xy + BA_Fragment_5_CB1((uint)(4)).zw;
  r2.zw = float2(0,1);
  r0.zw = r2.zy + r1.xy;
  r0.zw = r2.xw + r0.zw;
  r1.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.zw).xyzw;
  r2.xyz = cmp(float3(0,0,0) != BA_Fragment_5_CB1((uint)(7)).wxz);
  r0.zw = r2.xx ? v3.xy : 0;
  r0.zw = BA_Fragment_5_CB1((uint)(8)).yx + r0.zw;
  r0.zw = r0.zw * r1.xy;
  r1.xy = v1.xy * BA_Fragment_5_CB1((uint)(3)).xy + BA_Fragment_5_CB1((uint)(3)).zw;
  r1.x = r1.x + r1.y;
  r1.x = r2.y ? r1.x : 1;
  r0.xy = r0.zw * r1.xx + r0.xy;
  r1.y = cmp(0 != BA_Fragment_5_CB1((uint)(5)).z);
  r1.yz = r1.yy ? v3.zw : 0;
  r0.xy = r1.yz + r0.xy;
  r3.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.x = 1 + -v4.w;
  r1.yz = cmp(float2(0,0) != BA_Fragment_5_CB1((uint)(6)).wy);
  r0.x = r1.z ? r0.x : v2.x;
  r0.x = r1.y ? r0.x : BA_Fragment_5_CB1((uint)(6)).z;
  r0.x = cmp(r3.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r1.yz = v1.xy * BA_Fragment_5_CB1((uint)(1)).xy + BA_Fragment_5_CB1((uint)(1)).zw;
  r2.x = BA_Fragment_5_CB1((uint)(9)).x * BA_Fragment_5_CB0((uint)(11)).y;
  r2.y = BA_Fragment_5_CB1((uint)(8)).w * BA_Fragment_5_CB0((uint)(11)).y;
  r1.yz = r2.xy + r1.yz;
  r0.y = cmp(0 != BA_Fragment_5_CB1((uint)(8)).z);
  r2.xy = r0.yy ? v2.zw : 0;
  r1.yz = r2.xy + r1.yz;
  r0.yz = r0.zw * r1.xx + r1.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.yzw = v4.xyz * r1.xyz;
  r1.x = r2.z ? r1.w : r1.x;
  r0.yzw = r0.yzw * r0.xxx;
  r0.x = BA_Fragment_5_CB1((uint)(0)).w * r0.x;
  r0.x = r0.x * r1.x;
  r0.yzw = BA_Fragment_5_CB1((uint)(0)).xyz * r0.yzw;
  r0.yzw = BA_Fragment_5_CB1((uint)(5)).yyy * r0.yzw;
  o0.xyz = r0.yzw * r1.xxx;
  r0.y = cmp(0 != BA_Fragment_5_CB1((uint)(10)).z);
  r0.y = r0.y ? 1 : v4.w;
  r0.x = r0.x * r0.y;
  o0.w = saturate(BA_Fragment_5_CB1((uint)(5)).y * r0.x);
  return;
}
#elif defined(INSTANCING_ON)
float4 BA_Fragment_6_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 4u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 5u) value = float4(0.0, _Multiply, _Custom_Data_Mask_Offset_Usecustom78, _Mask_Speed_Y);
  if (i == 6u) value = float4(_Mask_Speed_X, _Step_Custom_DataVertex_color_Use, _Step_Power, _Step_Scroll_Use);
  if (i == 7u) value = float4(_UV_Add_Use, _Dis_Speed_X, _RGBRGBA, _Custom_Data_Distort_Power_Use);
  if (i == 8u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Custom_Data_Main_Offset_Use, _Main_Speed_Y);
  if (i == 9u) value = float4(_Main_Speed_X, 0.0, 0.0, 0.0);
  if (i == 10u) value = float4(0.0, _Dis_Speed_Y, _Vertex_Alpha_Use, 0.0);
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

  r0.xy = v1.xy * BA_Fragment_6_CB1((uint)(2)).xy + BA_Fragment_6_CB1((uint)(2)).zw;
  r1.x = BA_Fragment_6_CB1((uint)(6)).x * BA_Fragment_6_CB0((uint)(11)).y;
  r1.y = BA_Fragment_6_CB1((uint)(5)).w * BA_Fragment_6_CB0((uint)(11)).y;
  r0.xy = r1.xy + r0.xy;
  r1.x = BA_Fragment_6_CB1((uint)(7)).y * BA_Fragment_6_CB0((uint)(11)).y;
  r1.y = BA_Fragment_6_CB1((uint)(10)).y * BA_Fragment_6_CB0((uint)(11)).y;
  r2.xy = v1.xy * BA_Fragment_6_CB1((uint)(4)).xy + BA_Fragment_6_CB1((uint)(4)).zw;
  r2.zw = float2(0,1);
  r0.zw = r2.zy + r1.xy;
  r0.zw = r2.xw + r0.zw;
  r1.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.zw).xyzw;
  r2.xyz = cmp(float3(0,0,0) != BA_Fragment_6_CB1((uint)(7)).wxz);
  r0.zw = r2.xx ? v3.xy : 0;
  r0.zw = BA_Fragment_6_CB1((uint)(8)).yx + r0.zw;
  r0.zw = r0.zw * r1.xy;
  r1.xy = v1.xy * BA_Fragment_6_CB1((uint)(3)).xy + BA_Fragment_6_CB1((uint)(3)).zw;
  r1.x = r1.x + r1.y;
  r1.x = r2.y ? r1.x : 1;
  r0.xy = r0.zw * r1.xx + r0.xy;
  r1.y = cmp(0 != BA_Fragment_6_CB1((uint)(5)).z);
  r1.yz = r1.yy ? v3.zw : 0;
  r0.xy = r1.yz + r0.xy;
  r3.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.x = 1 + -v4.w;
  r1.yz = cmp(float2(0,0) != BA_Fragment_6_CB1((uint)(6)).wy);
  r0.x = r1.z ? r0.x : v2.x;
  r0.x = r1.y ? r0.x : BA_Fragment_6_CB1((uint)(6)).z;
  r0.x = cmp(r3.x >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r1.yz = v1.xy * BA_Fragment_6_CB1((uint)(1)).xy + BA_Fragment_6_CB1((uint)(1)).zw;
  r2.x = BA_Fragment_6_CB1((uint)(9)).x * BA_Fragment_6_CB0((uint)(11)).y;
  r2.y = BA_Fragment_6_CB1((uint)(8)).w * BA_Fragment_6_CB0((uint)(11)).y;
  r1.yz = r2.xy + r1.yz;
  r0.y = cmp(0 != BA_Fragment_6_CB1((uint)(8)).z);
  r2.xy = r0.yy ? v2.zw : 0;
  r1.yz = r2.xy + r1.yz;
  r0.yz = r0.zw * r1.xx + r1.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.yzw = v4.xyz * r1.xyz;
  r1.x = r2.z ? r1.w : r1.x;
  r0.yzw = r0.yzw * r0.xxx;
  r0.x = BA_Fragment_6_CB1((uint)(0)).w * r0.x;
  r0.x = r0.x * r1.x;
  r0.yzw = BA_Fragment_6_CB1((uint)(0)).xyz * r0.yzw;
  r0.yzw = BA_Fragment_6_CB1((uint)(5)).yyy * r0.yzw;
  o0.xyz = r0.yzw * r1.xxx;
  r0.y = cmp(0 != BA_Fragment_6_CB1((uint)(10)).z);
  r0.y = r0.y ? 1 : v4.w;
  r0.x = r0.x * r0.y;
  o0.w = saturate(BA_Fragment_6_CB1((uint)(5)).y * r0.x);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
