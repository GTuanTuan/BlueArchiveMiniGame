// Exact names and types from the original compiled parameter metadata.
float4 _Add_Color;
float _Add_Speed_X;
float _Add_Speed_Y;
float _Add_Tex_SharpnessR_G;
float _Add_Tex_StepR_G;
float _Add_Tex_useB;
float _Add_Tex_useG;
float _Custom_Data_Add_Tex_Step_use;
float _Custom_Data_Main_OffsetUse;
float _Custom_Data_Main_Tex_Step_use;
float _Custom_Data_Target_OffsetUse;
float _GDistort_Power_X;
float _GDistort_Power_Y;
float _GDistort_Speed_X;
float _GDistort_Speed_Y;
float4 _G_Tilingxy_Offsetzw;
float4 _Main_Color;
float _Main_Multiply;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Main_Tex_Alpha_use;
float _Main_Tex_StepB;
float _RDistort_Power_X;
float _RDistort_Power_Y;
float _RDistort_Speed_X;
float _RDistort_Speed_Y;
float _RGBRGBA;
float4 _R_Tilingxy_Offsetzw;
float4 _Tex_AddRGB_ST;
float _Tex_Add_Distort_UseR_or_G;
float _Tex_Main_Distort_UseR_or_G;
float4 _Tex_Main_ST;
Texture2D<float4> _Tex_AddRGB;
Texture2D<float4> _Tex_DistortRG;
Texture2D<float4> _Tex_Main;
SamplerState sampler_Tex_AddRGB;
SamplerState sampler_Tex_DistortRG;
SamplerState sampler_Tex_Main;
#ifndef cmp
#define cmp -
#endif

#if !defined(_ALPHAPREMULTIPLY_ON)
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
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD1,
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
  o1.xyz = v2.xyz;
  o1.w = 0;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON)
float4 BA_Vertex_2_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_2_CB0(uint i)
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
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD1,
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

  r0.xyz = BA_Vertex_2_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_2_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_2_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_2_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_2_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_2_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xyz = v2.xyz;
  o1.w = 0;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(_ALPHAPREMULTIPLY_ON)
float4 BA_Fragment_4_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Tex_AddRGB_ST.x, _Tex_AddRGB_ST.y, _Tex_AddRGB_ST.z, _Tex_AddRGB_ST.w);
  if (i == 2u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 3u) value = float4(_Add_Color.x, _Add_Color.y, _Add_Color.z, _Add_Color.w);
  if (i == 4u) value = float4(_R_Tilingxy_Offsetzw.x, _R_Tilingxy_Offsetzw.y, _R_Tilingxy_Offsetzw.z, _R_Tilingxy_Offsetzw.w);
  if (i == 5u) value = float4(_G_Tilingxy_Offsetzw.x, _G_Tilingxy_Offsetzw.y, _G_Tilingxy_Offsetzw.z, _G_Tilingxy_Offsetzw.w);
  if (i == 6u) value = float4(_Custom_Data_Main_Tex_Step_use, _Main_Tex_StepB, _Main_Tex_Alpha_use, _Add_Speed_X);
  if (i == 7u) value = float4(_Add_Speed_Y, _Custom_Data_Target_OffsetUse, _Tex_Add_Distort_UseR_or_G, _Add_Tex_useG);
  if (i == 8u) value = float4(_Custom_Data_Add_Tex_Step_use, _Add_Tex_useB, _RGBRGBA, _Main_Speed_X);
  if (i == 9u) value = float4(_Add_Tex_StepR_G, _Custom_Data_Main_OffsetUse, _GDistort_Power_Y, _GDistort_Power_X);
  if (i == 10u) value = float4(_GDistort_Speed_Y, _GDistort_Speed_X, _RDistort_Speed_Y, _RDistort_Speed_X);
  if (i == 11u) value = float4(_RDistort_Power_Y, _RDistort_Power_X, _Tex_Main_Distort_UseR_or_G, _Main_Speed_Y);
  if (i == 12u) value = float4(_Main_Multiply, _Add_Tex_SharpnessR_G, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_4_CB0(uint i)
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

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_4_CB1((uint)(4)).xy + BA_Fragment_4_CB1((uint)(4)).zw;
  r0.xy = BA_Fragment_4_CB0((uint)(11)).yy * BA_Fragment_4_CB1((uint)(10)).wz + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.xy = BA_Fragment_4_CB1((uint)(11)).yx * r0.xx;
  r0.zw = v1.xy * BA_Fragment_4_CB1((uint)(5)).xy + BA_Fragment_4_CB1((uint)(5)).zw;
  r0.zw = BA_Fragment_4_CB0((uint)(11)).yy * BA_Fragment_4_CB1((uint)(10)).yx + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r0.zw = BA_Fragment_4_CB1((uint)(9)).wz * r1.yy;
  r1.xyz = cmp(float3(0,0,0) != BA_Fragment_4_CB1((uint)(7)).yzw);
  r1.yw = r1.yy ? r0.zw : r0.xy;
  r2.xy = r1.xx ? v2.zw : 0;
  r3.x = BA_Fragment_4_CB1((uint)(6)).w * BA_Fragment_4_CB0((uint)(11)).y;
  r3.y = BA_Fragment_4_CB1((uint)(7)).x * BA_Fragment_4_CB0((uint)(11)).y;
  r2.zw = v1.xy * BA_Fragment_4_CB1((uint)(1)).xy + BA_Fragment_4_CB1((uint)(1)).zw;
  r3.xy = r3.xy + r2.zw;
  r4.xyzw = _Tex_AddRGB.Sample(sampler_Tex_AddRGB, r2.zw).xyzw;
  r2.xy = r3.xy + r2.xy;
  r1.xy = r2.xy + r1.yw;
  r2.xyzw = _Tex_AddRGB.Sample(sampler_Tex_AddRGB, r1.xy).xyzw;
  r1.x = r1.z ? r4.x : 0;
  r1.x = saturate(r2.y + r1.x);
  r1.yzw = cmp(float3(0,0,0) != BA_Fragment_4_CB1((uint)(8)).yzx);
  r1.w = r1.w ? v4.x : BA_Fragment_4_CB1((uint)(9)).x;
  r1.x = r1.x + -r1.w;
  r1.x = saturate(BA_Fragment_4_CB1((uint)(12)).y * r1.x);
  r1.w = cmp(0 != BA_Fragment_4_CB1((uint)(11)).z);
  r0.xy = r1.ww ? r0.zw : r0.xy;
  r2.x = BA_Fragment_4_CB1((uint)(8)).w * BA_Fragment_4_CB0((uint)(11)).y;
  r2.y = BA_Fragment_4_CB1((uint)(11)).w * BA_Fragment_4_CB0((uint)(11)).y;
  r0.zw = v1.xy * BA_Fragment_4_CB1((uint)(2)).xy + BA_Fragment_4_CB1((uint)(2)).zw;
  r0.zw = r2.xy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.z = cmp(0 != BA_Fragment_4_CB1((uint)(9)).y);
  r0.zw = r0.zz ? v2.xy : 0;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r2.xy = cmp(float2(0,0) != BA_Fragment_4_CB1((uint)(6)).xz);
  r1.w = r2.y ? r0.w : 1;
  r2.x = r2.x ? v4.y : BA_Fragment_4_CB1((uint)(6)).y;
  r1.x = saturate(r1.w * r1.x);
  r2.yzw = v3.xyz * r0.xyz;
  r2.yzw = BA_Fragment_4_CB1((uint)(0)).xyz * r2.yzw;
  r2.yzw = BA_Fragment_4_CB1((uint)(12)).xxx * r2.yzw;
  r2.yzw = r2.yzw * r0.www;
  r0.xyz = r1.zzz ? r0.www : r0.xyz;
  r0.w = r1.y ? r4.z : 1;
  r0.w = cmp(r2.x >= r0.w);
  r0.w = r0.w ? 0 : 1;
  r1.yzw = r2.yzw * r0.xyz;
  r2.xyz = r1.yzw * r0.www;
  r1.yzw = -r1.yzw * r0.www + BA_Fragment_4_CB1((uint)(3)).xyz;
  o0.xyz = r1.xxx * r1.yzw + r2.xyz;
  r0.y = v3.w * v3.w;
  r0.x = r0.x * r0.y;
  r0.x = BA_Fragment_4_CB1((uint)(0)).w * r0.x;
  r0.x = saturate(BA_Fragment_4_CB1((uint)(12)).x * r0.x);
  o0.w = r0.x * r0.w;
  return;
}
#elif defined(_ALPHAPREMULTIPLY_ON)
float4 BA_Fragment_5_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Main_Color.x, _Main_Color.y, _Main_Color.z, _Main_Color.w);
  if (i == 1u) value = float4(_Tex_AddRGB_ST.x, _Tex_AddRGB_ST.y, _Tex_AddRGB_ST.z, _Tex_AddRGB_ST.w);
  if (i == 2u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 3u) value = float4(_Add_Color.x, _Add_Color.y, _Add_Color.z, _Add_Color.w);
  if (i == 4u) value = float4(_R_Tilingxy_Offsetzw.x, _R_Tilingxy_Offsetzw.y, _R_Tilingxy_Offsetzw.z, _R_Tilingxy_Offsetzw.w);
  if (i == 5u) value = float4(_G_Tilingxy_Offsetzw.x, _G_Tilingxy_Offsetzw.y, _G_Tilingxy_Offsetzw.z, _G_Tilingxy_Offsetzw.w);
  if (i == 6u) value = float4(_Custom_Data_Main_Tex_Step_use, _Main_Tex_StepB, _Main_Tex_Alpha_use, _Add_Speed_X);
  if (i == 7u) value = float4(_Add_Speed_Y, _Custom_Data_Target_OffsetUse, _Tex_Add_Distort_UseR_or_G, _Add_Tex_useG);
  if (i == 8u) value = float4(_Custom_Data_Add_Tex_Step_use, _Add_Tex_useB, _RGBRGBA, _Main_Speed_X);
  if (i == 9u) value = float4(_Add_Tex_StepR_G, _Custom_Data_Main_OffsetUse, _GDistort_Power_Y, _GDistort_Power_X);
  if (i == 10u) value = float4(_GDistort_Speed_Y, _GDistort_Speed_X, _RDistort_Speed_Y, _RDistort_Speed_X);
  if (i == 11u) value = float4(_RDistort_Power_Y, _RDistort_Power_X, _Tex_Main_Distort_UseR_or_G, _Main_Speed_Y);
  if (i == 12u) value = float4(_Main_Multiply, _Add_Tex_SharpnessR_G, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_5_CB0(uint i)
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

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_5_CB1((uint)(4)).xy + BA_Fragment_5_CB1((uint)(4)).zw;
  r0.xy = BA_Fragment_5_CB0((uint)(11)).yy * BA_Fragment_5_CB1((uint)(10)).wz + r0.xy;
  r0.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.xy).xyzw;
  r0.xy = BA_Fragment_5_CB1((uint)(11)).yx * r0.xx;
  r0.zw = v1.xy * BA_Fragment_5_CB1((uint)(5)).xy + BA_Fragment_5_CB1((uint)(5)).zw;
  r0.zw = BA_Fragment_5_CB0((uint)(11)).yy * BA_Fragment_5_CB1((uint)(10)).yx + r0.zw;
  r1.xyzw = _Tex_DistortRG.Sample(sampler_Tex_DistortRG, r0.zw).xyzw;
  r0.zw = BA_Fragment_5_CB1((uint)(9)).wz * r1.yy;
  r1.xyz = cmp(float3(0,0,0) != BA_Fragment_5_CB1((uint)(7)).yzw);
  r1.yw = r1.yy ? r0.zw : r0.xy;
  r2.xy = r1.xx ? v2.zw : 0;
  r3.x = BA_Fragment_5_CB1((uint)(6)).w * BA_Fragment_5_CB0((uint)(11)).y;
  r3.y = BA_Fragment_5_CB1((uint)(7)).x * BA_Fragment_5_CB0((uint)(11)).y;
  r2.zw = v1.xy * BA_Fragment_5_CB1((uint)(1)).xy + BA_Fragment_5_CB1((uint)(1)).zw;
  r3.xy = r3.xy + r2.zw;
  r4.xyzw = _Tex_AddRGB.Sample(sampler_Tex_AddRGB, r2.zw).xyzw;
  r2.xy = r3.xy + r2.xy;
  r1.xy = r2.xy + r1.yw;
  r2.xyzw = _Tex_AddRGB.Sample(sampler_Tex_AddRGB, r1.xy).xyzw;
  r1.x = r1.z ? r4.x : 0;
  r1.x = saturate(r2.y + r1.x);
  r1.yzw = cmp(float3(0,0,0) != BA_Fragment_5_CB1((uint)(8)).yzx);
  r1.w = r1.w ? v4.x : BA_Fragment_5_CB1((uint)(9)).x;
  r1.x = r1.x + -r1.w;
  r1.x = saturate(BA_Fragment_5_CB1((uint)(12)).y * r1.x);
  r1.w = cmp(0 != BA_Fragment_5_CB1((uint)(11)).z);
  r0.xy = r1.ww ? r0.zw : r0.xy;
  r2.x = BA_Fragment_5_CB1((uint)(8)).w * BA_Fragment_5_CB0((uint)(11)).y;
  r2.y = BA_Fragment_5_CB1((uint)(11)).w * BA_Fragment_5_CB0((uint)(11)).y;
  r0.zw = v1.xy * BA_Fragment_5_CB1((uint)(2)).xy + BA_Fragment_5_CB1((uint)(2)).zw;
  r0.zw = r2.xy + r0.zw;
  r0.xy = r0.zw + r0.xy;
  r0.z = cmp(0 != BA_Fragment_5_CB1((uint)(9)).y);
  r0.zw = r0.zz ? v2.xy : 0;
  r0.xy = r0.xy + r0.zw;
  r0.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r2.xy = cmp(float2(0,0) != BA_Fragment_5_CB1((uint)(6)).xz);
  r1.w = r2.y ? r0.w : 1;
  r2.x = r2.x ? v4.y : BA_Fragment_5_CB1((uint)(6)).y;
  r1.x = saturate(r1.w * r1.x);
  r2.yzw = v3.xyz * r0.xyz;
  r2.yzw = BA_Fragment_5_CB1((uint)(0)).xyz * r2.yzw;
  r2.yzw = BA_Fragment_5_CB1((uint)(12)).xxx * r2.yzw;
  r2.yzw = r2.yzw * r0.www;
  r0.xyz = r1.zzz ? r0.www : r0.xyz;
  r0.w = r1.y ? r4.z : 1;
  r0.w = cmp(r2.x >= r0.w);
  r0.w = r0.w ? 0 : 1;
  r1.yzw = r2.yzw * r0.xyz;
  r2.xyz = r1.yzw * r0.www;
  r1.yzw = -r1.yzw * r0.www + BA_Fragment_5_CB1((uint)(3)).xyz;
  r1.xyz = r1.xxx * r1.yzw + r2.xyz;
  r0.y = v3.w * v3.w;
  r0.x = r0.x * r0.y;
  r0.x = BA_Fragment_5_CB1((uint)(0)).w * r0.x;
  r0.x = saturate(BA_Fragment_5_CB1((uint)(12)).x * r0.x);
  r0.x = r0.x * r0.w;
  o0.xyz = r1.xyz * r0.xxx;
  o0.w = r0.x;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
