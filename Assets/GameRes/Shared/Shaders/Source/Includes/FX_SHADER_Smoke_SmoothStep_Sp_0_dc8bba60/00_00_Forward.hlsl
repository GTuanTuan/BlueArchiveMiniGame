// Exact names and types from the original compiled parameter metadata.
float _Alpha;
float _Alphaclip_Value;
float4 _Color;
float _GDissolve_Speed_X;
float _GDissolve_Speed_Y;
float _GDissolve_Str;
float4 _GTillingxyOffsetzw;
float _Gra_Lerp;
float4 _Gra_TillingxyOffsetzw;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mask_Speed_X;
float _Mask_Speed_Y;
float _RDistort_Speed_X;
float _RDistort_Speed_Y;
float _RDistortion_Power_X;
float _RDistortion_Power_Y;
float4 _RTillingxyOffsetzw;
float _Smooth;
float _SoftParticleFarFade;
float _SoftParticleNearFade;
float _Subtract;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
Texture2D<float4> _CameraDepthTexture;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
Texture2D<float4> _Tex_RDistortGDissolve;
SamplerState sampler_CameraDepthTexture;
SamplerState sampler_Tex_Main;
SamplerState sampler_Tex_Mask;
SamplerState sampler_Tex_RDistortGDissolve;
#ifndef cmp
#define cmp -
#endif

#if !defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_1_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_1_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_1_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_1_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_1_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r0.y = BA_Vertex_1_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_1_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_1_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_1_CB0((uint)(64)).z + r0.x;
  o2.z = -r0.x;
  o2.xy = v3.xy;
  o2.w = 0;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  r0.x = BA_Vertex_1_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o5.zw = r1.zw;
  o5.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_2_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_2_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r0.y = BA_Vertex_2_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_2_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_2_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_2_CB0((uint)(64)).z + r0.x;
  o2.z = -r0.x;
  o2.xy = v3.xy;
  o2.w = 0;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  r0.x = BA_Vertex_2_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o5.zw = r1.zw;
  o5.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Vertex_3_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_3_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_3_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_3_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r0.y = BA_Vertex_3_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_3_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_3_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_3_CB0((uint)(64)).z + r0.x;
  o2.z = -r0.x;
  o2.xy = v3.xy;
  o2.w = 0;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  r0.x = BA_Vertex_3_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o5.zw = r1.zw;
  o5.xy = r0.xw + r0.zz;
  return;
}
#elif defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
float4 BA_Vertex_4_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_4_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_4_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_4_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r0.y = BA_Vertex_4_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_4_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_4_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_4_CB0((uint)(64)).z + r0.x;
  o2.z = -r0.x;
  o2.xy = v3.xy;
  o2.w = 0;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  r0.x = BA_Vertex_4_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o5.zw = r1.zw;
  o5.xy = r0.xw + r0.zz;
  return;
}
#elif defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Vertex_5_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_5_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_5_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_5_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_5_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_5_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r0.y = BA_Vertex_5_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_5_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_5_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_5_CB0((uint)(64)).z + r0.x;
  o2.z = -r0.x;
  o2.xy = v3.xy;
  o2.w = 0;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  r0.x = BA_Vertex_5_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o5.zw = r1.zw;
  o5.xy = r0.xw + r0.zz;
  return;
}
#elif defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && !defined(_GRA_WRAP_CLAMP) && defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Vertex_6_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_6_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_6_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_6_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_6_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_6_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_6_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r0.y = BA_Vertex_6_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_6_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_6_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_6_CB0((uint)(64)).z + r0.x;
  o2.z = -r0.x;
  o2.xy = v3.xy;
  o2.w = 0;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  r0.x = BA_Vertex_6_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o5.zw = r1.zw;
  o5.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Vertex_7_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_7_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_7_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_7_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_7_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_7_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_7_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r0.y = BA_Vertex_7_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_7_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_7_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_7_CB0((uint)(64)).z + r0.x;
  o2.z = -r0.x;
  o2.xy = v3.xy;
  o2.w = 0;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  r0.x = BA_Vertex_7_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o5.zw = r1.zw;
  o5.xy = r0.xw + r0.zz;
  return;
}
#elif !defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Vertex_8_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_8_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_8_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_8_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_8_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_8_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_8_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r0.y = BA_Vertex_8_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_8_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_8_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_8_CB0((uint)(64)).z + r0.x;
  o2.z = -r0.x;
  o2.xy = v3.xy;
  o2.w = 0;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  r0.x = BA_Vertex_8_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.x;
  r0.xz = float2(0.5,0.5) * r1.xw;
  o5.zw = r1.zw;
  o5.xy = r0.xw + r0.zz;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Vert(float4 position : POSITION, out float4 clip : SV_POSITION) { clip = TransformObjectToHClip(position.xyz); }
#endif

#if !defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Fragment_11_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 2u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 4u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(0.0, _Mask_Speed_X, _SoftParticleFarFade, _SoftParticleNearFade);
  if (i == 7u) value = float4(_Alpha, _Gra_Lerp, 0.0, 0.0);
  if (i == 8u) value = float4(_GDissolve_Str, _GDissolve_Speed_X, _Mask_Speed_Y, _Smooth);
  if (i == 9u) value = float4(_Subtract, _Main_Speed_Y, _Main_Speed_X, 0.0);
  if (i == 10u) value = float4(_GDissolve_Speed_Y, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_11_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v5.xy / v5.ww;
  r0.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_11_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_11_CB0((uint)(20)).z * r0.x + BA_Fragment_11_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.x = -BA_Fragment_11_CB1((uint)(6)).w + r0.x;
  r0.x = -v2.z + r0.x;
  r0.y = BA_Fragment_11_CB1((uint)(6)).z + -BA_Fragment_11_CB1((uint)(6)).w;
  r0.y = 1 / r0.y;
  r0.x = saturate(r0.x * r0.y);
  r0.yz = v2.xy * BA_Fragment_11_CB1((uint)(4)).xy + BA_Fragment_11_CB1((uint)(4)).zw;
  r1.y = BA_Fragment_11_CB1((uint)(10)).x * BA_Fragment_11_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_11_CB1((uint)(8)).yz * BA_Fragment_11_CB0((uint)(11)).yy;
  r0.yz = r1.xy + r0.yz;
  r2.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.y = v2.x * BA_Fragment_11_CB1((uint)(2)).x + BA_Fragment_11_CB1((uint)(2)).z;
  r0.y = -r2.y * BA_Fragment_11_CB1((uint)(8)).x + r0.y;
  r0.z = BA_Fragment_11_CB1((uint)(8)).x * r2.y;
  r0.y = BA_Fragment_11_CB1((uint)(7)).y * r0.y + r0.z;
  r0.y = -BA_Fragment_11_CB1((uint)(9)).x + r0.y;
  r0.z = 1 / BA_Fragment_11_CB1((uint)(8)).w;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.y * -2 + 3;
  r0.y = r0.y * r0.y;
  r0.y = r0.z * r0.y;
  r0.zw = v2.xy * BA_Fragment_11_CB1((uint)(5)).xy + BA_Fragment_11_CB1((uint)(5)).zw;
  r0.zw = BA_Fragment_11_CB1((uint)(9)).zy * BA_Fragment_11_CB0((uint)(11)).yy + r0.zw;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r2.x * r0.y;
  r0.y = v1.w * r0.y;
  r0.y = BA_Fragment_11_CB1((uint)(7)).x * r0.y;
  r0.z = BA_Fragment_11_CB1((uint)(0)).w * r2.w;
  r2.xyz = v1.xyz * r2.xyz;
  o0.xyz = BA_Fragment_11_CB1((uint)(0)).xyz * r2.xyz;
  r0.y = r0.z * r0.y;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_11_CB1((uint)(1)).xy + BA_Fragment_11_CB1((uint)(1)).zw;
  r1.z = BA_Fragment_11_CB1((uint)(6)).y * BA_Fragment_11_CB0((uint)(11)).y;
  r0.yz = r0.yz + r1.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_11_CB1((uint)(10)).y + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
float4 BA_Fragment_12_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 2u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 4u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(0.0, _Mask_Speed_X, _SoftParticleFarFade, _SoftParticleNearFade);
  if (i == 7u) value = float4(_Alpha, _Gra_Lerp, 0.0, 0.0);
  if (i == 8u) value = float4(_GDissolve_Str, _GDissolve_Speed_X, _Mask_Speed_Y, _Smooth);
  if (i == 9u) value = float4(_Subtract, _Main_Speed_Y, _Main_Speed_X, 0.0);
  if (i == 10u) value = float4(_GDissolve_Speed_Y, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_12_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v5.xy / v5.ww;
  r0.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_12_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_12_CB0((uint)(20)).z * r0.x + BA_Fragment_12_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.x = -BA_Fragment_12_CB1((uint)(6)).w + r0.x;
  r0.x = -v2.z + r0.x;
  r0.y = BA_Fragment_12_CB1((uint)(6)).z + -BA_Fragment_12_CB1((uint)(6)).w;
  r0.y = 1 / r0.y;
  r0.x = saturate(r0.x * r0.y);
  r0.yz = v2.xy * BA_Fragment_12_CB1((uint)(4)).xy + BA_Fragment_12_CB1((uint)(4)).zw;
  r1.y = BA_Fragment_12_CB1((uint)(10)).x * BA_Fragment_12_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_12_CB1((uint)(8)).yz * BA_Fragment_12_CB0((uint)(11)).yy;
  r0.yz = r1.xy + r0.yz;
  r2.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.y = v2.x * BA_Fragment_12_CB1((uint)(2)).x + BA_Fragment_12_CB1((uint)(2)).z;
  r0.y = -r2.y * BA_Fragment_12_CB1((uint)(8)).x + r0.y;
  r0.z = BA_Fragment_12_CB1((uint)(8)).x * r2.y;
  r0.y = BA_Fragment_12_CB1((uint)(7)).y * r0.y + r0.z;
  r0.y = -BA_Fragment_12_CB1((uint)(9)).x + r0.y;
  r0.z = 1 / BA_Fragment_12_CB1((uint)(8)).w;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.y * -2 + 3;
  r0.y = r0.y * r0.y;
  r0.y = r0.z * r0.y;
  r0.zw = v2.xy * BA_Fragment_12_CB1((uint)(5)).xy + BA_Fragment_12_CB1((uint)(5)).zw;
  r0.zw = BA_Fragment_12_CB1((uint)(9)).zy * BA_Fragment_12_CB0((uint)(11)).yy + r0.zw;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r2.w * r0.y;
  r0.y = v1.w * r0.y;
  r0.y = BA_Fragment_12_CB1((uint)(7)).x * r0.y;
  r0.z = BA_Fragment_12_CB1((uint)(0)).w * r2.w;
  r2.xyz = v1.xyz * r2.xyz;
  o0.xyz = BA_Fragment_12_CB1((uint)(0)).xyz * r2.xyz;
  r0.y = r0.z * r0.y;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_12_CB1((uint)(1)).xy + BA_Fragment_12_CB1((uint)(1)).zw;
  r1.z = BA_Fragment_12_CB1((uint)(6)).y * BA_Fragment_12_CB0((uint)(11)).y;
  r0.yz = r0.yz + r1.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_12_CB1((uint)(10)).y + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Fragment_13_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 2u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_RDistort_Speed_X, _Mask_Speed_X, _SoftParticleFarFade, _SoftParticleNearFade);
  if (i == 7u) value = float4(_Alpha, _Gra_Lerp, _RDistortion_Power_X, _RDistortion_Power_Y);
  if (i == 8u) value = float4(_GDissolve_Str, _GDissolve_Speed_X, _Mask_Speed_Y, _Smooth);
  if (i == 9u) value = float4(_Subtract, _Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y);
  if (i == 10u) value = float4(_GDissolve_Speed_Y, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_13_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_13_CB1((uint)(4)).xy + BA_Fragment_13_CB1((uint)(4)).zw;
  r1.y = BA_Fragment_13_CB1((uint)(10)).x * BA_Fragment_13_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_13_CB1((uint)(8)).yz * BA_Fragment_13_CB0((uint)(11)).yy;
  r0.xy = r1.xy + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.x = v2.x * BA_Fragment_13_CB1((uint)(2)).x + BA_Fragment_13_CB1((uint)(2)).z;
  r0.x = -r0.y * BA_Fragment_13_CB1((uint)(8)).x + r0.x;
  r0.y = BA_Fragment_13_CB1((uint)(8)).x * r0.y;
  r0.x = BA_Fragment_13_CB1((uint)(7)).y * r0.x + r0.y;
  r0.x = -BA_Fragment_13_CB1((uint)(9)).x + r0.x;
  r0.y = 1 / BA_Fragment_13_CB1((uint)(8)).w;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r1.xz = BA_Fragment_13_CB1((uint)(6)).xy * BA_Fragment_13_CB0((uint)(11)).yy;
  r1.y = BA_Fragment_13_CB1((uint)(9)).w * BA_Fragment_13_CB0((uint)(11)).y;
  r0.yz = frac(r1.xy);
  r1.xy = v2.xy * BA_Fragment_13_CB1((uint)(3)).xy + BA_Fragment_13_CB1((uint)(3)).zw;
  r0.yz = r1.xy + r0.yz;
  r2.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.yz = v2.xy * BA_Fragment_13_CB1((uint)(5)).xy + BA_Fragment_13_CB1((uint)(5)).zw;
  r0.yz = BA_Fragment_13_CB1((uint)(7)).zw * r2.xx + r0.yz;
  r0.yz = BA_Fragment_13_CB1((uint)(9)).zy * BA_Fragment_13_CB0((uint)(11)).yy + r0.yz;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = r2.x * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_13_CB1((uint)(7)).x * r0.x;
  r0.y = BA_Fragment_13_CB1((uint)(0)).w * r2.w;
  r2.xyz = v1.xyz * r2.xyz;
  o0.xyz = BA_Fragment_13_CB1((uint)(0)).xyz * r2.xyz;
  r0.x = r0.y * r0.x;
  r0.yz = v5.xy / v5.ww;
  r2.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_13_CB0((uint)(20)).z * r2.x + BA_Fragment_13_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_13_CB1((uint)(6)).w + r0.y;
  r0.y = -v2.z + r0.y;
  r0.z = BA_Fragment_13_CB1((uint)(6)).z + -BA_Fragment_13_CB1((uint)(6)).w;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.x = r0.x * r0.y;
  r0.yz = v2.xy * BA_Fragment_13_CB1((uint)(1)).xy + BA_Fragment_13_CB1((uint)(1)).zw;
  r0.yz = r0.yz + r1.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_13_CB1((uint)(10)).y + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && defined(_RGBA_ON)
float4 BA_Fragment_14_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 2u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 4u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(0.0, _Mask_Speed_X, _SoftParticleFarFade, _SoftParticleNearFade);
  if (i == 7u) value = float4(_Alpha, _Gra_Lerp, 0.0, 0.0);
  if (i == 8u) value = float4(_GDissolve_Str, _GDissolve_Speed_X, _Mask_Speed_Y, _Smooth);
  if (i == 9u) value = float4(_Subtract, _Main_Speed_Y, _Main_Speed_X, 0.0);
  if (i == 10u) value = float4(_GDissolve_Speed_Y, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_14_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v5.xy / v5.ww;
  r0.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_14_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_14_CB0((uint)(20)).z * r0.x + BA_Fragment_14_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.x = -BA_Fragment_14_CB1((uint)(6)).w + r0.x;
  r0.x = -v2.z + r0.x;
  r0.y = BA_Fragment_14_CB1((uint)(6)).z + -BA_Fragment_14_CB1((uint)(6)).w;
  r0.y = 1 / r0.y;
  r0.x = saturate(r0.x * r0.y);
  r0.yz = v2.xy * BA_Fragment_14_CB1((uint)(4)).xy + BA_Fragment_14_CB1((uint)(4)).zw;
  r1.y = BA_Fragment_14_CB1((uint)(10)).x * BA_Fragment_14_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_14_CB1((uint)(8)).yz * BA_Fragment_14_CB0((uint)(11)).yy;
  r0.yz = r1.xy + r0.yz;
  r0.yz = v4.zw + r0.yz;
  r2.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.y = v2.x * BA_Fragment_14_CB1((uint)(2)).x + BA_Fragment_14_CB1((uint)(2)).z;
  r0.y = -r2.y * BA_Fragment_14_CB1((uint)(8)).x + r0.y;
  r0.z = BA_Fragment_14_CB1((uint)(8)).x * r2.y;
  r0.y = BA_Fragment_14_CB1((uint)(7)).y * r0.y + r0.z;
  r0.z = BA_Fragment_14_CB1((uint)(9)).x + v3.x;
  r0.y = r0.y + -r0.z;
  r0.z = BA_Fragment_14_CB1((uint)(8)).w + v3.y;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.y * -2 + 3;
  r0.y = r0.y * r0.y;
  r0.y = r0.z * r0.y;
  r0.zw = v2.xy * BA_Fragment_14_CB1((uint)(5)).xy + BA_Fragment_14_CB1((uint)(5)).zw;
  r0.zw = BA_Fragment_14_CB1((uint)(9)).zy * BA_Fragment_14_CB0((uint)(11)).yy + r0.zw;
  r0.zw = v3.zw + r0.zw;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r2.w * r0.y;
  r0.y = v1.w * r0.y;
  r0.y = BA_Fragment_14_CB1((uint)(7)).x * r0.y;
  r0.z = BA_Fragment_14_CB1((uint)(0)).w * r2.w;
  r2.xyz = v1.xyz * r2.xyz;
  o0.xyz = BA_Fragment_14_CB1((uint)(0)).xyz * r2.xyz;
  r0.y = r0.z * r0.y;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_14_CB1((uint)(1)).xy + BA_Fragment_14_CB1((uint)(1)).zw;
  r1.z = BA_Fragment_14_CB1((uint)(6)).y * BA_Fragment_14_CB0((uint)(11)).y;
  r0.yz = r0.yz + r1.zw;
  r0.yz = v4.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_14_CB1((uint)(10)).y + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Fragment_15_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 2u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_RDistort_Speed_X, _Mask_Speed_X, _SoftParticleFarFade, _SoftParticleNearFade);
  if (i == 7u) value = float4(_Alpha, _Gra_Lerp, _RDistortion_Power_X, _RDistortion_Power_Y);
  if (i == 8u) value = float4(_GDissolve_Str, _GDissolve_Speed_X, _Mask_Speed_Y, _Smooth);
  if (i == 9u) value = float4(_Subtract, _Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y);
  if (i == 10u) value = float4(_GDissolve_Speed_Y, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_15_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy * BA_Fragment_15_CB1((uint)(4)).xy + BA_Fragment_15_CB1((uint)(4)).zw;
  r1.y = BA_Fragment_15_CB1((uint)(10)).x * BA_Fragment_15_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_15_CB1((uint)(8)).yz * BA_Fragment_15_CB0((uint)(11)).yy;
  r0.xy = r1.xy + r0.xy;
  r0.xy = v4.zw + r0.xy;
  r0.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.xy).xyzw;
  r0.x = v2.x * BA_Fragment_15_CB1((uint)(2)).x + BA_Fragment_15_CB1((uint)(2)).z;
  r0.x = -r0.y * BA_Fragment_15_CB1((uint)(8)).x + r0.x;
  r0.y = BA_Fragment_15_CB1((uint)(8)).x * r0.y;
  r0.x = BA_Fragment_15_CB1((uint)(7)).y * r0.x + r0.y;
  r0.y = BA_Fragment_15_CB1((uint)(9)).x + v3.x;
  r0.x = r0.x + -r0.y;
  r0.y = BA_Fragment_15_CB1((uint)(8)).w + v3.y;
  r0.y = 1 / r0.y;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r1.xz = BA_Fragment_15_CB1((uint)(6)).xy * BA_Fragment_15_CB0((uint)(11)).yy;
  r1.y = BA_Fragment_15_CB1((uint)(9)).w * BA_Fragment_15_CB0((uint)(11)).y;
  r0.yz = frac(r1.xy);
  r1.xy = v2.xy * BA_Fragment_15_CB1((uint)(3)).xy + BA_Fragment_15_CB1((uint)(3)).zw;
  r0.yz = r1.xy + r0.yz;
  r2.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.yz = v2.xy * BA_Fragment_15_CB1((uint)(5)).xy + BA_Fragment_15_CB1((uint)(5)).zw;
  r0.yz = BA_Fragment_15_CB1((uint)(7)).zw * r2.xx + r0.yz;
  r0.yz = BA_Fragment_15_CB1((uint)(9)).zy * BA_Fragment_15_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = r2.x * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_15_CB1((uint)(7)).x * r0.x;
  r0.y = BA_Fragment_15_CB1((uint)(0)).w * r2.w;
  r2.xyz = v1.xyz * r2.xyz;
  o0.xyz = BA_Fragment_15_CB1((uint)(0)).xyz * r2.xyz;
  r0.x = r0.y * r0.x;
  r0.yz = v5.xy / v5.ww;
  r2.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_15_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_15_CB0((uint)(20)).z * r2.x + BA_Fragment_15_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_15_CB1((uint)(6)).w + r0.y;
  r0.y = -v2.z + r0.y;
  r0.z = BA_Fragment_15_CB1((uint)(6)).z + -BA_Fragment_15_CB1((uint)(6)).w;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.x = r0.x * r0.y;
  r0.yz = v2.xy * BA_Fragment_15_CB1((uint)(1)).xy + BA_Fragment_15_CB1((uint)(1)).zw;
  r0.yz = r0.yz + r1.zw;
  r0.yz = v4.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_15_CB1((uint)(10)).y + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && !defined(_GRA_WRAP_CLAMP) && defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && !defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Fragment_16_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 2u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_RDistort_Speed_X, _Mask_Speed_X, _SoftParticleFarFade, _SoftParticleNearFade);
  if (i == 7u) value = float4(_Alpha, _Gra_Lerp, _RDistortion_Power_X, _RDistortion_Power_Y);
  if (i == 8u) value = float4(_GDissolve_Str, _GDissolve_Speed_X, _Mask_Speed_Y, _Smooth);
  if (i == 9u) value = float4(_Subtract, _Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y);
  if (i == 10u) value = float4(_GDissolve_Speed_Y, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_16_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = v2.x * BA_Fragment_16_CB1((uint)(2)).x + BA_Fragment_16_CB1((uint)(2)).z;
  r0.x = frac(r0.x);
  r0.yz = v2.xy * BA_Fragment_16_CB1((uint)(4)).xy + BA_Fragment_16_CB1((uint)(4)).zw;
  r1.y = BA_Fragment_16_CB1((uint)(10)).x * BA_Fragment_16_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_16_CB1((uint)(8)).yz * BA_Fragment_16_CB0((uint)(11)).yy;
  r0.yz = r1.xy + r0.yz;
  r0.yz = v4.zw + r0.yz;
  r2.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.x = -r2.y * BA_Fragment_16_CB1((uint)(8)).x + r0.x;
  r0.y = BA_Fragment_16_CB1((uint)(8)).x * r2.y;
  r0.x = BA_Fragment_16_CB1((uint)(7)).y * r0.x + r0.y;
  r0.y = BA_Fragment_16_CB1((uint)(9)).x + v3.x;
  r0.x = r0.x + -r0.y;
  r0.y = BA_Fragment_16_CB1((uint)(8)).w + v3.y;
  r0.y = 1 / r0.y;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r1.xz = BA_Fragment_16_CB1((uint)(6)).xy * BA_Fragment_16_CB0((uint)(11)).yy;
  r1.y = BA_Fragment_16_CB1((uint)(9)).w * BA_Fragment_16_CB0((uint)(11)).y;
  r0.yz = frac(r1.xy);
  r1.xy = v2.xy * BA_Fragment_16_CB1((uint)(3)).xy + BA_Fragment_16_CB1((uint)(3)).zw;
  r0.yz = r1.xy + r0.yz;
  r2.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.yz = v2.xy * BA_Fragment_16_CB1((uint)(5)).xy + BA_Fragment_16_CB1((uint)(5)).zw;
  r0.yz = BA_Fragment_16_CB1((uint)(7)).zw * r2.xx + r0.yz;
  r0.yz = BA_Fragment_16_CB1((uint)(9)).zy * BA_Fragment_16_CB0((uint)(11)).yy + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r0.x = r2.x * r0.x;
  r0.x = v1.w * r0.x;
  r0.x = BA_Fragment_16_CB1((uint)(7)).x * r0.x;
  r0.y = BA_Fragment_16_CB1((uint)(0)).w * r2.w;
  r2.xyz = v1.xyz * r2.xyz;
  o0.xyz = BA_Fragment_16_CB1((uint)(0)).xyz * r2.xyz;
  r0.x = r0.y * r0.x;
  r0.yz = v5.xy / v5.ww;
  r2.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.yz, BA_Fragment_16_CB0((uint)(19)).x).xyzw;
  r0.y = BA_Fragment_16_CB0((uint)(20)).z * r2.x + BA_Fragment_16_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.y = -BA_Fragment_16_CB1((uint)(6)).w + r0.y;
  r0.y = -v2.z + r0.y;
  r0.z = BA_Fragment_16_CB1((uint)(6)).z + -BA_Fragment_16_CB1((uint)(6)).w;
  r0.z = 1 / r0.z;
  r0.y = saturate(r0.y * r0.z);
  r0.x = r0.x * r0.y;
  r0.yz = v2.xy * BA_Fragment_16_CB1((uint)(1)).xy + BA_Fragment_16_CB1((uint)(1)).zw;
  r0.yz = r0.yz + r1.zw;
  r0.yz = v4.xy + r0.yz;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_16_CB1((uint)(10)).y + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && !defined(_MAIN_DISTORTION_USE_ON) && defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Fragment_17_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 2u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_RDistort_Speed_X, _Mask_Speed_X, _SoftParticleFarFade, _SoftParticleNearFade);
  if (i == 7u) value = float4(_Alpha, _Gra_Lerp, _RDistortion_Power_X, _RDistortion_Power_Y);
  if (i == 8u) value = float4(_GDissolve_Str, _GDissolve_Speed_X, _Mask_Speed_Y, _Smooth);
  if (i == 9u) value = float4(_Subtract, _Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y);
  if (i == 10u) value = float4(_GDissolve_Speed_Y, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_17_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v5.xy / v5.ww;
  r0.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_17_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_17_CB0((uint)(20)).z * r0.x + BA_Fragment_17_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.x = -BA_Fragment_17_CB1((uint)(6)).w + r0.x;
  r0.x = -v2.z + r0.x;
  r0.y = BA_Fragment_17_CB1((uint)(6)).z + -BA_Fragment_17_CB1((uint)(6)).w;
  r0.y = 1 / r0.y;
  r0.x = saturate(r0.x * r0.y);
  r0.yz = v2.xy * BA_Fragment_17_CB1((uint)(4)).xy + BA_Fragment_17_CB1((uint)(4)).zw;
  r1.y = BA_Fragment_17_CB1((uint)(10)).x * BA_Fragment_17_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_17_CB1((uint)(8)).yz * BA_Fragment_17_CB0((uint)(11)).yy;
  r0.yz = r1.xy + r0.yz;
  r2.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.y = v2.x * BA_Fragment_17_CB1((uint)(2)).x + BA_Fragment_17_CB1((uint)(2)).z;
  r0.y = -r2.y * BA_Fragment_17_CB1((uint)(8)).x + r0.y;
  r0.z = BA_Fragment_17_CB1((uint)(8)).x * r2.y;
  r0.y = BA_Fragment_17_CB1((uint)(7)).y * r0.y + r0.z;
  r0.y = -BA_Fragment_17_CB1((uint)(9)).x + r0.y;
  r0.z = 1 / BA_Fragment_17_CB1((uint)(8)).w;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.y * -2 + 3;
  r0.y = r0.y * r0.y;
  r0.y = r0.z * r0.y;
  r0.zw = v2.xy * BA_Fragment_17_CB1((uint)(5)).xy + BA_Fragment_17_CB1((uint)(5)).zw;
  r0.zw = BA_Fragment_17_CB1((uint)(9)).zy * BA_Fragment_17_CB0((uint)(11)).yy + r0.zw;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r2.x * r0.y;
  r0.y = v1.w * r0.y;
  r0.y = BA_Fragment_17_CB1((uint)(7)).x * r0.y;
  r0.z = BA_Fragment_17_CB1((uint)(0)).w * r2.w;
  r2.xyz = v1.xyz * r2.xyz;
  o0.xyz = BA_Fragment_17_CB1((uint)(0)).xyz * r2.xyz;
  r0.y = r0.z * r0.y;
  r0.x = r0.y * r0.x;
  r1.xz = BA_Fragment_17_CB1((uint)(6)).xy * BA_Fragment_17_CB0((uint)(11)).yy;
  r1.y = BA_Fragment_17_CB1((uint)(9)).w * BA_Fragment_17_CB0((uint)(11)).y;
  r0.yz = frac(r1.xy);
  r1.xy = v2.xy * BA_Fragment_17_CB1((uint)(3)).xy + BA_Fragment_17_CB1((uint)(3)).zw;
  r0.yz = r1.xy + r0.yz;
  r2.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.yz = v2.xy * BA_Fragment_17_CB1((uint)(1)).xy + BA_Fragment_17_CB1((uint)(1)).zw;
  r0.yz = BA_Fragment_17_CB1((uint)(7)).zw * r2.xx + r0.yz;
  r0.yz = r0.yz + r1.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_17_CB1((uint)(10)).y + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(_CUSTOMDATA_USE_ON) && defined(_GRA_CHANNEL_U) && defined(_GRA_WRAP_CLAMP) && !defined(_GRA_WRAP_REPEAT) && defined(_MAIN_DISTORTION_USE_ON) && defined(_MASK_DISTORTION_USE_ON) && !defined(_RGBA_ON)
float4 BA_Fragment_18_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 2u) value = float4(_Gra_TillingxyOffsetzw.x, _Gra_TillingxyOffsetzw.y, _Gra_TillingxyOffsetzw.z, _Gra_TillingxyOffsetzw.w);
  if (i == 3u) value = float4(_RTillingxyOffsetzw.x, _RTillingxyOffsetzw.y, _RTillingxyOffsetzw.z, _RTillingxyOffsetzw.w);
  if (i == 4u) value = float4(_GTillingxyOffsetzw.x, _GTillingxyOffsetzw.y, _GTillingxyOffsetzw.z, _GTillingxyOffsetzw.w);
  if (i == 5u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 6u) value = float4(_RDistort_Speed_X, _Mask_Speed_X, _SoftParticleFarFade, _SoftParticleNearFade);
  if (i == 7u) value = float4(_Alpha, _Gra_Lerp, _RDistortion_Power_X, _RDistortion_Power_Y);
  if (i == 8u) value = float4(_GDissolve_Str, _GDissolve_Speed_X, _Mask_Speed_Y, _Smooth);
  if (i == 9u) value = float4(_Subtract, _Main_Speed_Y, _Main_Speed_X, _RDistort_Speed_Y);
  if (i == 10u) value = float4(_GDissolve_Speed_Y, _Alphaclip_Value, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_18_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v5.xy / v5.ww;
  r0.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_18_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_18_CB0((uint)(20)).z * r0.x + BA_Fragment_18_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.x = -BA_Fragment_18_CB1((uint)(6)).w + r0.x;
  r0.x = -v2.z + r0.x;
  r0.y = BA_Fragment_18_CB1((uint)(6)).z + -BA_Fragment_18_CB1((uint)(6)).w;
  r0.y = 1 / r0.y;
  r0.x = saturate(r0.x * r0.y);
  r0.yz = v2.xy * BA_Fragment_18_CB1((uint)(4)).xy + BA_Fragment_18_CB1((uint)(4)).zw;
  r1.y = BA_Fragment_18_CB1((uint)(10)).x * BA_Fragment_18_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_18_CB1((uint)(8)).yz * BA_Fragment_18_CB0((uint)(11)).yy;
  r0.yz = r1.xy + r0.yz;
  r2.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.yz).xyzw;
  r0.y = v2.x * BA_Fragment_18_CB1((uint)(2)).x + BA_Fragment_18_CB1((uint)(2)).z;
  r0.y = -r2.y * BA_Fragment_18_CB1((uint)(8)).x + r0.y;
  r0.z = BA_Fragment_18_CB1((uint)(8)).x * r2.y;
  r0.y = BA_Fragment_18_CB1((uint)(7)).y * r0.y + r0.z;
  r0.y = -BA_Fragment_18_CB1((uint)(9)).x + r0.y;
  r0.z = 1 / BA_Fragment_18_CB1((uint)(8)).w;
  r0.y = saturate(r0.y * r0.z);
  r0.z = r0.y * -2 + 3;
  r0.y = r0.y * r0.y;
  r0.y = r0.z * r0.y;
  r1.xz = BA_Fragment_18_CB1((uint)(6)).xy * BA_Fragment_18_CB0((uint)(11)).yy;
  r1.y = BA_Fragment_18_CB1((uint)(9)).w * BA_Fragment_18_CB0((uint)(11)).y;
  r0.zw = frac(r1.xy);
  r1.xy = v2.xy * BA_Fragment_18_CB1((uint)(3)).xy + BA_Fragment_18_CB1((uint)(3)).zw;
  r0.zw = r1.xy + r0.zw;
  r2.xyzw = _Tex_RDistortGDissolve.Sample(sampler_Tex_RDistortGDissolve, r0.zw).xyzw;
  r0.zw = v2.xy * BA_Fragment_18_CB1((uint)(5)).xy + BA_Fragment_18_CB1((uint)(5)).zw;
  r0.zw = BA_Fragment_18_CB1((uint)(7)).zw * r2.xx + r0.zw;
  r0.zw = BA_Fragment_18_CB1((uint)(9)).zy * BA_Fragment_18_CB0((uint)(11)).yy + r0.zw;
  r3.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.y = r3.x * r0.y;
  r0.y = v1.w * r0.y;
  r0.y = BA_Fragment_18_CB1((uint)(7)).x * r0.y;
  r0.z = BA_Fragment_18_CB1((uint)(0)).w * r3.w;
  r2.yzw = v1.xyz * r3.xyz;
  o0.xyz = BA_Fragment_18_CB1((uint)(0)).xyz * r2.yzw;
  r0.y = r0.z * r0.y;
  r0.x = r0.y * r0.x;
  r0.yz = v2.xy * BA_Fragment_18_CB1((uint)(1)).xy + BA_Fragment_18_CB1((uint)(1)).zw;
  r0.yz = BA_Fragment_18_CB1((uint)(7)).zw * r2.xx + r0.yz;
  r0.yz = r0.yz + r1.zw;
  r1.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.yz).xyzw;
  r0.x = saturate(r1.y * r0.x);
  r0.y = -BA_Fragment_18_CB1((uint)(10)).y + r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Frag(out float4 color : SV_TARGET0) { color = float4(1,0,1,1); }
#endif
