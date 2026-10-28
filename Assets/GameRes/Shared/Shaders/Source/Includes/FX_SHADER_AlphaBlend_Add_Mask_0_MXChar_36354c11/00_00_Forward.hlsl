// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float _Custom_Data_MainMask_Offset_Use;
float _DitherThreshold;
float _GrayBrightness;
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

#if !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
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
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD4,
  out float4 o2 : TEXCOORD5,
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
#elif !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
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
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD4,
  out float4 o2 : TEXCOORD5,
  out float4 o3 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_3_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_3_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_3_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_3_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_3_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xyzw = v2.xyzw;
  o2.xy = v3.xy;
  o2.zw = float2(0,0);
  o3.xyzw = v4.xyzw;
  return;
}
#elif defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
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

  r0.xyz = BA_Vertex_4_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_4_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_4_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_4_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_4_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw + r0.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_4_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o1.x = 0.5 + r0.x;
  o2.xyzw = v2.xyzw;
  o3.xy = v3.xy;
  o3.zw = float2(0,0);
  o4.xyzw = v4.xyzw;
  return;
}
#elif defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
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

  r0.xyz = BA_Vertex_5_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_5_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw + r0.xyzw;
  o0.xyzw = r0.xyzw;
  r0.x = BA_Vertex_5_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r0.w;
  o1.x = 0.5 + r0.x;
  o2.xyzw = v2.xyzw;
  o3.xy = v3.xy;
  o3.zw = float2(0,0);
  o4.xyzw = v4.xyzw;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_10_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, _Custom_Data_MainMask_Offset_Use, _Main_Speed_X);
  if (i == 4u) value = float4(_Main_Speed_Y, _RGBRGBA, _Mask_Speed_X, _Mask_Speed_Y);
  if (i == 5u) value = float4(_Multiply, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_10_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD4,
  float4 v2 : TEXCOORD5,
  float4 v3 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(0 != BA_Fragment_10_CB1((uint)(3)).z);
  r0.xyzw = r0.xxxx ? v1.xyzw : 0;
  r1.x = BA_Fragment_10_CB1((uint)(3)).w * BA_Fragment_10_CB0((uint)(11)).y;
  r1.yzw = BA_Fragment_10_CB1((uint)(4)).xzw * BA_Fragment_10_CB0((uint)(11)).yyy;
  r0.xyzw = r1.xyzw + r0.xyzw;
  r1.xy = v2.xy * BA_Fragment_10_CB1((uint)(0)).xy + BA_Fragment_10_CB1((uint)(0)).zw;
  r0.xy = r1.xy + r0.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r2.xyz = v3.xyz * r1.xyz;
  r2.xyz = BA_Fragment_10_CB1((uint)(1)).xyz * r2.xyz;
  r0.x = cmp(0 != BA_Fragment_10_CB1((uint)(4)).y);
  r1.xyz = r0.xxx ? r1.www : r1.xyz;
  r1.yzw = r2.xyz * r1.xyz;
  r0.xy = v2.xy * BA_Fragment_10_CB1((uint)(2)).xy + BA_Fragment_10_CB1((uint)(2)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.yzw = r1.yzw * r0.xxx;
  o0.xyz = BA_Fragment_10_CB1((uint)(5)).xxx * r0.yzw;
  r0.y = v3.w * v3.w;
  r0.y = r1.x * r0.y;
  r0.y = BA_Fragment_10_CB1((uint)(1)).w * r0.y;
  r0.x = r0.y * r0.x;
  o0.w = saturate(BA_Fragment_10_CB1((uint)(5)).x * r0.x);
  return;
}
#elif !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_11_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, _Custom_Data_MainMask_Offset_Use, _Main_Speed_X);
  if (i == 4u) value = float4(_Main_Speed_Y, _RGBRGBA, _Mask_Speed_X, _Mask_Speed_Y);
  if (i == 5u) value = float4(_Multiply, 0.0, _GrayBrightness, 0.0);
  return value;
}

float4 BA_Fragment_11_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD4,
  float4 v2 : TEXCOORD5,
  float4 v3 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(0 != BA_Fragment_11_CB1((uint)(3)).z);
  r0.xyzw = r0.xxxx ? v1.xyzw : 0;
  r1.x = BA_Fragment_11_CB1((uint)(3)).w * BA_Fragment_11_CB0((uint)(11)).y;
  r1.yzw = BA_Fragment_11_CB1((uint)(4)).xzw * BA_Fragment_11_CB0((uint)(11)).yyy;
  r0.xyzw = r1.xyzw + r0.xyzw;
  r1.xy = v2.xy * BA_Fragment_11_CB1((uint)(0)).xy + BA_Fragment_11_CB1((uint)(0)).zw;
  r0.xy = r1.xy + r0.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r2.xyz = v3.xyz * r1.xyz;
  r2.xyz = BA_Fragment_11_CB1((uint)(1)).xyz * r2.xyz;
  r0.x = cmp(0 != BA_Fragment_11_CB1((uint)(4)).y);
  r1.xyz = r0.xxx ? r1.www : r1.xyz;
  r1.yzw = r2.xyz * r1.xyz;
  r0.xy = v2.xy * BA_Fragment_11_CB1((uint)(2)).xy + BA_Fragment_11_CB1((uint)(2)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.yzw = r1.yzw * r0.xxx;
  r0.yzw = BA_Fragment_11_CB1((uint)(5)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  o0.xyz = BA_Fragment_11_CB1((uint)(5)).zzz * r0.yyy;
  r0.y = v3.w * v3.w;
  r0.y = r1.x * r0.y;
  r0.y = BA_Fragment_11_CB1((uint)(1)).w * r0.y;
  r0.x = r0.y * r0.x;
  o0.w = saturate(BA_Fragment_11_CB1((uint)(5)).x * r0.x);
  return;
}
#elif defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_12_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, _Custom_Data_MainMask_Offset_Use, _Main_Speed_X);
  if (i == 4u) value = float4(_Main_Speed_Y, _RGBRGBA, _Mask_Speed_X, _Mask_Speed_Y);
  if (i == 5u) value = float4(_Multiply, _DitherThreshold, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_12_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
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

  r0.x = 333.333344 * v1.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_12_CB1((uint)(5)).y * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(0 != BA_Fragment_12_CB1((uint)(3)).z);
  r0.xyzw = r0.xxxx ? v2.xyzw : 0;
  r1.x = BA_Fragment_12_CB1((uint)(3)).w * BA_Fragment_12_CB0((uint)(11)).y;
  r1.yzw = BA_Fragment_12_CB1((uint)(4)).xzw * BA_Fragment_12_CB0((uint)(11)).yyy;
  r0.xyzw = r1.xyzw + r0.xyzw;
  r1.xy = v3.xy * BA_Fragment_12_CB1((uint)(0)).xy + BA_Fragment_12_CB1((uint)(0)).zw;
  r0.xy = r1.xy + r0.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r2.xyz = v4.xyz * r1.xyz;
  r2.xyz = BA_Fragment_12_CB1((uint)(1)).xyz * r2.xyz;
  r0.x = cmp(0 != BA_Fragment_12_CB1((uint)(4)).y);
  r1.xyz = r0.xxx ? r1.www : r1.xyz;
  r1.yzw = r2.xyz * r1.xyz;
  r0.xy = v3.xy * BA_Fragment_12_CB1((uint)(2)).xy + BA_Fragment_12_CB1((uint)(2)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.yzw = r1.yzw * r0.xxx;
  o0.xyz = BA_Fragment_12_CB1((uint)(5)).xxx * r0.yzw;
  r0.y = v4.w * v4.w;
  r0.y = r1.x * r0.y;
  r0.y = BA_Fragment_12_CB1((uint)(1)).w * r0.y;
  r0.x = r0.y * r0.x;
  o0.w = saturate(BA_Fragment_12_CB1((uint)(5)).x * r0.x);
  return;
}
#elif defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_13_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 1u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 2u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 3u) value = float4(0.0, 0.0, _Custom_Data_MainMask_Offset_Use, _Main_Speed_X);
  if (i == 4u) value = float4(_Main_Speed_Y, _RGBRGBA, _Mask_Speed_X, _Mask_Speed_Y);
  if (i == 5u) value = float4(_Multiply, _DitherThreshold, _GrayBrightness, 0.0);
  return value;
}

float4 BA_Fragment_13_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
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

  r0.x = 333.333344 * v1.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_13_CB1((uint)(5)).y * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(0 != BA_Fragment_13_CB1((uint)(3)).z);
  r0.xyzw = r0.xxxx ? v2.xyzw : 0;
  r1.x = BA_Fragment_13_CB1((uint)(3)).w * BA_Fragment_13_CB0((uint)(11)).y;
  r1.yzw = BA_Fragment_13_CB1((uint)(4)).xzw * BA_Fragment_13_CB0((uint)(11)).yyy;
  r0.xyzw = r1.xyzw + r0.xyzw;
  r1.xy = v3.xy * BA_Fragment_13_CB1((uint)(0)).xy + BA_Fragment_13_CB1((uint)(0)).zw;
  r0.xy = r1.xy + r0.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r2.xyz = v4.xyz * r1.xyz;
  r2.xyz = BA_Fragment_13_CB1((uint)(1)).xyz * r2.xyz;
  r0.x = cmp(0 != BA_Fragment_13_CB1((uint)(4)).y);
  r1.xyz = r0.xxx ? r1.www : r1.xyz;
  r1.yzw = r2.xyz * r1.xyz;
  r0.xy = v3.xy * BA_Fragment_13_CB1((uint)(2)).xy + BA_Fragment_13_CB1((uint)(2)).zw;
  r0.xy = r0.zw + r0.xy;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.yzw = r1.yzw * r0.xxx;
  r0.yzw = BA_Fragment_13_CB1((uint)(5)).xxx * r0.yzw;
  r0.y = dot(r0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  o0.xyz = BA_Fragment_13_CB1((uint)(5)).zzz * r0.yyy;
  r0.y = v4.w * v4.w;
  r0.y = r1.x * r0.y;
  r0.y = BA_Fragment_13_CB1((uint)(1)).w * r0.y;
  r0.x = r0.y * r0.x;
  o0.w = saturate(BA_Fragment_13_CB1((uint)(5)).x * r0.x);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
