// Exact names and types from the original compiled parameter metadata.
float _CrushScale;
float _Damage;
float _DitherThreshold;
float3 _MxOutRimLightDir;
float4 _MxOutRimLightPosRange;
float4 _MxOutlineRimLightColor;
float2 _MxOutlineRimLightSpotAngle;
float4 _NoiseDir;
float4 _OutlineTint;
float _OutlineZCorrection;
Texture2D<float4> _NoiseTex;
Texture2D<float4> _mainTex;
SamplerState sampler_NoiseTex;
SamplerState sampler_mainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_164_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_164_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_164_CB1((uint)(5)).xyz * BA_Vertex_164_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_164_CB1((uint)(4)).xyz * BA_Vertex_164_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_164_CB1((uint)(6)).xyz * BA_Vertex_164_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_164_CB1((uint)(7)).xyz * BA_Vertex_164_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_164_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_164_CB1((uint)(5)).xyz * BA_Vertex_164_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_164_CB1((uint)(4)).xyz * BA_Vertex_164_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_164_CB1((uint)(6)).xyz * BA_Vertex_164_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_164_CB1((uint)(7)).xyz * BA_Vertex_164_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_164_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_164_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_164_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_164_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_164_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_164_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_164_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_164_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_164_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_164_CB0((uint)(18)).x / BA_Vertex_164_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_164_CB0((uint)(125)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_164_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_164_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_165_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_165_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_165_CB1((uint)(5)).xyz * BA_Vertex_165_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_165_CB1((uint)(4)).xyz * BA_Vertex_165_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_165_CB1((uint)(6)).xyz * BA_Vertex_165_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_165_CB1((uint)(7)).xyz * BA_Vertex_165_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_165_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_165_CB1((uint)(5)).xyz * BA_Vertex_165_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_165_CB1((uint)(4)).xyz * BA_Vertex_165_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_165_CB1((uint)(6)).xyz * BA_Vertex_165_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_165_CB1((uint)(7)).xyz * BA_Vertex_165_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_165_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_165_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_165_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_165_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_165_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_165_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_165_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_165_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_165_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_165_CB0((uint)(18)).x / BA_Vertex_165_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_165_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_165_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_165_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_166_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_166_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_166_CB1((uint)(5)).xyz * BA_Vertex_166_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_166_CB1((uint)(4)).xyz * BA_Vertex_166_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_166_CB1((uint)(6)).xyz * BA_Vertex_166_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_166_CB1((uint)(7)).xyz * BA_Vertex_166_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_166_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_166_CB1((uint)(5)).xyz * BA_Vertex_166_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_166_CB1((uint)(4)).xyz * BA_Vertex_166_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_166_CB1((uint)(6)).xyz * BA_Vertex_166_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_166_CB1((uint)(7)).xyz * BA_Vertex_166_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_166_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_166_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_166_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_166_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_166_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_166_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_166_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_166_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_166_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_166_CB0((uint)(18)).x / BA_Vertex_166_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_166_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_166_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_166_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_166_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_167_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_167_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_167_CB1((uint)(5)).xyz * BA_Vertex_167_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_167_CB1((uint)(4)).xyz * BA_Vertex_167_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_167_CB1((uint)(6)).xyz * BA_Vertex_167_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_167_CB1((uint)(7)).xyz * BA_Vertex_167_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_167_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_167_CB1((uint)(5)).xyz * BA_Vertex_167_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_167_CB1((uint)(4)).xyz * BA_Vertex_167_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_167_CB1((uint)(6)).xyz * BA_Vertex_167_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_167_CB1((uint)(7)).xyz * BA_Vertex_167_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_167_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_167_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_167_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_167_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_167_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_167_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_167_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_167_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_167_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_167_CB0((uint)(18)).x / BA_Vertex_167_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_167_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_167_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_167_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_167_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_168_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_168_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, _CrushScale, 0.0);
  if (i == 126u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_168_CB1((uint)(5)).xyz * BA_Vertex_168_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_168_CB1((uint)(4)).xyz * BA_Vertex_168_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_168_CB1((uint)(6)).xyz * BA_Vertex_168_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_168_CB1((uint)(7)).xyz * BA_Vertex_168_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_168_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_168_CB1((uint)(5)).xyz * BA_Vertex_168_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_168_CB1((uint)(4)).xyz * BA_Vertex_168_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_168_CB1((uint)(6)).xyz * BA_Vertex_168_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_168_CB1((uint)(7)).xyz * BA_Vertex_168_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_168_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_168_CB0((uint)(125)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_168_CB0((uint)(126)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_168_CB0((uint)(126)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_168_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_168_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_168_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_168_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_168_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_168_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_168_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_168_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_168_CB0((uint)(18)).x / BA_Vertex_168_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_168_CB0((uint)(125)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_168_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_168_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_169_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_169_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, _CrushScale, 0.0);
  if (i == 127u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_169_CB1((uint)(5)).xyz * BA_Vertex_169_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_169_CB1((uint)(4)).xyz * BA_Vertex_169_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_169_CB1((uint)(6)).xyz * BA_Vertex_169_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_169_CB1((uint)(7)).xyz * BA_Vertex_169_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_169_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_169_CB1((uint)(5)).xyz * BA_Vertex_169_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_169_CB1((uint)(4)).xyz * BA_Vertex_169_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_169_CB1((uint)(6)).xyz * BA_Vertex_169_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_169_CB1((uint)(7)).xyz * BA_Vertex_169_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_169_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_169_CB0((uint)(126)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_169_CB0((uint)(127)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_169_CB0((uint)(127)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_169_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_169_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_169_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_169_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_169_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_169_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_169_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_169_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_169_CB0((uint)(18)).x / BA_Vertex_169_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_169_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_169_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_169_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_170_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_170_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, _CrushScale, 0.0);
  if (i == 127u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_170_CB1((uint)(5)).xyz * BA_Vertex_170_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_170_CB1((uint)(4)).xyz * BA_Vertex_170_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_170_CB1((uint)(6)).xyz * BA_Vertex_170_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_170_CB1((uint)(7)).xyz * BA_Vertex_170_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_170_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_170_CB1((uint)(5)).xyz * BA_Vertex_170_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_170_CB1((uint)(4)).xyz * BA_Vertex_170_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_170_CB1((uint)(6)).xyz * BA_Vertex_170_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_170_CB1((uint)(7)).xyz * BA_Vertex_170_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_170_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_170_CB0((uint)(126)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_170_CB0((uint)(127)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_170_CB0((uint)(127)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_170_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_170_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_170_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_170_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_170_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_170_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_170_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_170_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_170_CB0((uint)(18)).x / BA_Vertex_170_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_170_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_170_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_170_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_170_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_171_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_171_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, _CrushScale, 0.0);
  if (i == 127u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_171_CB1((uint)(5)).xyz * BA_Vertex_171_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_171_CB1((uint)(4)).xyz * BA_Vertex_171_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_171_CB1((uint)(6)).xyz * BA_Vertex_171_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_171_CB1((uint)(7)).xyz * BA_Vertex_171_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_171_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_171_CB1((uint)(5)).xyz * BA_Vertex_171_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_171_CB1((uint)(4)).xyz * BA_Vertex_171_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_171_CB1((uint)(6)).xyz * BA_Vertex_171_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_171_CB1((uint)(7)).xyz * BA_Vertex_171_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_171_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_171_CB0((uint)(126)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_171_CB0((uint)(127)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_171_CB0((uint)(127)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_171_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_171_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_171_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_171_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_171_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_171_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_171_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_171_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_171_CB0((uint)(18)).x / BA_Vertex_171_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_171_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_171_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_171_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_171_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_172_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_172_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_172_CB1((uint)(5)).xyz * BA_Vertex_172_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_172_CB1((uint)(4)).xyz * BA_Vertex_172_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_172_CB1((uint)(6)).xyz * BA_Vertex_172_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_172_CB1((uint)(7)).xyz * BA_Vertex_172_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_172_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_172_CB1((uint)(5)).xyz * BA_Vertex_172_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_172_CB1((uint)(4)).xyz * BA_Vertex_172_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_172_CB1((uint)(6)).xyz * BA_Vertex_172_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_172_CB1((uint)(7)).xyz * BA_Vertex_172_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_172_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_172_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_172_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_172_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_172_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_172_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_172_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_172_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_172_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_172_CB0((uint)(18)).x / BA_Vertex_172_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_172_CB0((uint)(125)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_172_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_172_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_172_CB0((uint)(55)).z + BA_Vertex_172_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_172_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_172_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_173_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_173_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_173_CB1((uint)(5)).xyz * BA_Vertex_173_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_173_CB1((uint)(4)).xyz * BA_Vertex_173_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_173_CB1((uint)(6)).xyz * BA_Vertex_173_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_173_CB1((uint)(7)).xyz * BA_Vertex_173_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_173_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_173_CB1((uint)(5)).xyz * BA_Vertex_173_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_173_CB1((uint)(4)).xyz * BA_Vertex_173_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_173_CB1((uint)(6)).xyz * BA_Vertex_173_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_173_CB1((uint)(7)).xyz * BA_Vertex_173_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_173_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_173_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_173_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_173_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_173_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_173_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_173_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_173_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_173_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_173_CB0((uint)(18)).x / BA_Vertex_173_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_173_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_173_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_173_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_173_CB0((uint)(55)).z + BA_Vertex_173_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_173_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_173_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_174_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_174_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_174_CB1((uint)(5)).xyz * BA_Vertex_174_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_174_CB1((uint)(4)).xyz * BA_Vertex_174_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_174_CB1((uint)(6)).xyz * BA_Vertex_174_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_174_CB1((uint)(7)).xyz * BA_Vertex_174_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_174_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_174_CB1((uint)(5)).xyz * BA_Vertex_174_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_174_CB1((uint)(4)).xyz * BA_Vertex_174_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_174_CB1((uint)(6)).xyz * BA_Vertex_174_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_174_CB1((uint)(7)).xyz * BA_Vertex_174_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_174_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_174_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_174_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_174_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_174_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_174_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_174_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_174_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_174_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_174_CB0((uint)(18)).x / BA_Vertex_174_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_174_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_174_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_174_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_174_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_174_CB0((uint)(55)).z + BA_Vertex_174_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_174_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_174_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_175_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_175_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_175_CB1((uint)(5)).xyz * BA_Vertex_175_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_175_CB1((uint)(4)).xyz * BA_Vertex_175_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_175_CB1((uint)(6)).xyz * BA_Vertex_175_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_175_CB1((uint)(7)).xyz * BA_Vertex_175_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_175_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_175_CB1((uint)(5)).xyz * BA_Vertex_175_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_175_CB1((uint)(4)).xyz * BA_Vertex_175_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_175_CB1((uint)(6)).xyz * BA_Vertex_175_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_175_CB1((uint)(7)).xyz * BA_Vertex_175_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_175_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_175_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_175_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_175_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_175_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_175_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_175_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_175_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_175_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_175_CB0((uint)(18)).x / BA_Vertex_175_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_175_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_175_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_175_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_175_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_175_CB0((uint)(55)).z + BA_Vertex_175_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_175_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_175_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_176_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_176_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, _CrushScale, 0.0);
  if (i == 126u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_176_CB1((uint)(5)).xyz * BA_Vertex_176_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_176_CB1((uint)(4)).xyz * BA_Vertex_176_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_176_CB1((uint)(6)).xyz * BA_Vertex_176_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_176_CB1((uint)(7)).xyz * BA_Vertex_176_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_176_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_176_CB1((uint)(5)).xyz * BA_Vertex_176_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_176_CB1((uint)(4)).xyz * BA_Vertex_176_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_176_CB1((uint)(6)).xyz * BA_Vertex_176_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_176_CB1((uint)(7)).xyz * BA_Vertex_176_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_176_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_176_CB0((uint)(125)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_176_CB0((uint)(126)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_176_CB0((uint)(126)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_176_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_176_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_176_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_176_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_176_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_176_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_176_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_176_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_176_CB0((uint)(18)).x / BA_Vertex_176_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_176_CB0((uint)(125)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_176_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_176_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_176_CB0((uint)(55)).z + BA_Vertex_176_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_176_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_176_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_177_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_177_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, _CrushScale, 0.0);
  if (i == 127u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_177_CB1((uint)(5)).xyz * BA_Vertex_177_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_177_CB1((uint)(4)).xyz * BA_Vertex_177_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_177_CB1((uint)(6)).xyz * BA_Vertex_177_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_177_CB1((uint)(7)).xyz * BA_Vertex_177_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_177_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_177_CB1((uint)(5)).xyz * BA_Vertex_177_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_177_CB1((uint)(4)).xyz * BA_Vertex_177_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_177_CB1((uint)(6)).xyz * BA_Vertex_177_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_177_CB1((uint)(7)).xyz * BA_Vertex_177_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_177_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_177_CB0((uint)(126)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_177_CB0((uint)(127)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_177_CB0((uint)(127)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_177_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_177_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_177_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_177_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_177_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_177_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_177_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_177_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_177_CB0((uint)(18)).x / BA_Vertex_177_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_177_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_177_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_177_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_177_CB0((uint)(55)).z + BA_Vertex_177_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_177_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_177_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_178_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_178_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, _CrushScale, 0.0);
  if (i == 127u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_178_CB1((uint)(5)).xyz * BA_Vertex_178_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_178_CB1((uint)(4)).xyz * BA_Vertex_178_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_178_CB1((uint)(6)).xyz * BA_Vertex_178_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_178_CB1((uint)(7)).xyz * BA_Vertex_178_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_178_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_178_CB1((uint)(5)).xyz * BA_Vertex_178_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_178_CB1((uint)(4)).xyz * BA_Vertex_178_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_178_CB1((uint)(6)).xyz * BA_Vertex_178_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_178_CB1((uint)(7)).xyz * BA_Vertex_178_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_178_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_178_CB0((uint)(126)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_178_CB0((uint)(127)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_178_CB0((uint)(127)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_178_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_178_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_178_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_178_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_178_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_178_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_178_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_178_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_178_CB0((uint)(18)).x / BA_Vertex_178_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_178_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_178_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_178_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_178_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_178_CB0((uint)(55)).z + BA_Vertex_178_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_178_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_178_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_179_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_179_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, _CrushScale, 0.0);
  if (i == 127u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_179_CB1((uint)(5)).xyz * BA_Vertex_179_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_179_CB1((uint)(4)).xyz * BA_Vertex_179_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_179_CB1((uint)(6)).xyz * BA_Vertex_179_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_179_CB1((uint)(7)).xyz * BA_Vertex_179_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_179_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_179_CB1((uint)(5)).xyz * BA_Vertex_179_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_179_CB1((uint)(4)).xyz * BA_Vertex_179_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_179_CB1((uint)(6)).xyz * BA_Vertex_179_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_179_CB1((uint)(7)).xyz * BA_Vertex_179_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_179_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_179_CB0((uint)(126)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_179_CB0((uint)(127)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_179_CB0((uint)(127)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_179_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_179_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_179_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_179_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_179_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_179_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_179_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_179_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_179_CB0((uint)(18)).x / BA_Vertex_179_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_179_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_179_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_179_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_179_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_179_CB0((uint)(55)).z + BA_Vertex_179_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_179_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_179_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_180_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_180_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_180_CB1((uint)(5)).xyz * BA_Vertex_180_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_180_CB1((uint)(4)).xyz * BA_Vertex_180_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_180_CB1((uint)(6)).xyz * BA_Vertex_180_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_180_CB1((uint)(7)).xyz * BA_Vertex_180_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_180_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_180_CB1((uint)(5)).xyz * BA_Vertex_180_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_180_CB1((uint)(4)).xyz * BA_Vertex_180_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_180_CB1((uint)(6)).xyz * BA_Vertex_180_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_180_CB1((uint)(7)).xyz * BA_Vertex_180_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_180_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_180_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_180_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_180_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_180_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_180_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_180_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_180_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_180_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_180_CB0((uint)(18)).x / BA_Vertex_180_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_180_CB0((uint)(125)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_180_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_180_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_180_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_180_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_180_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_181_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_181_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_181_CB1((uint)(5)).xyz * BA_Vertex_181_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_181_CB1((uint)(4)).xyz * BA_Vertex_181_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_181_CB1((uint)(6)).xyz * BA_Vertex_181_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_181_CB1((uint)(7)).xyz * BA_Vertex_181_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_181_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_181_CB1((uint)(5)).xyz * BA_Vertex_181_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_181_CB1((uint)(4)).xyz * BA_Vertex_181_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_181_CB1((uint)(6)).xyz * BA_Vertex_181_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_181_CB1((uint)(7)).xyz * BA_Vertex_181_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_181_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_181_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_181_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_181_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_181_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_181_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_181_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_181_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_181_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_181_CB0((uint)(18)).x / BA_Vertex_181_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_181_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_181_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_181_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_181_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_181_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_181_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_182_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_182_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_182_CB1((uint)(5)).xyz * BA_Vertex_182_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_182_CB1((uint)(4)).xyz * BA_Vertex_182_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_182_CB1((uint)(6)).xyz * BA_Vertex_182_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_182_CB1((uint)(7)).xyz * BA_Vertex_182_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_182_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_182_CB1((uint)(5)).xyz * BA_Vertex_182_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_182_CB1((uint)(4)).xyz * BA_Vertex_182_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_182_CB1((uint)(6)).xyz * BA_Vertex_182_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_182_CB1((uint)(7)).xyz * BA_Vertex_182_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_182_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_182_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_182_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_182_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_182_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_182_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_182_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_182_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_182_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_182_CB0((uint)(18)).x / BA_Vertex_182_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_182_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_182_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_182_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_182_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_182_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_182_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_182_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_183_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_183_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_183_CB1((uint)(5)).xyz * BA_Vertex_183_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_183_CB1((uint)(4)).xyz * BA_Vertex_183_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_183_CB1((uint)(6)).xyz * BA_Vertex_183_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_183_CB1((uint)(7)).xyz * BA_Vertex_183_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_183_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_183_CB1((uint)(5)).xyz * BA_Vertex_183_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_183_CB1((uint)(4)).xyz * BA_Vertex_183_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_183_CB1((uint)(6)).xyz * BA_Vertex_183_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_183_CB1((uint)(7)).xyz * BA_Vertex_183_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_183_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_183_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_183_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_183_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_183_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_183_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_183_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_183_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_183_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_183_CB0((uint)(18)).x / BA_Vertex_183_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_183_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_183_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_183_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_183_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_183_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_183_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_183_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_184_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_184_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, _CrushScale, 0.0);
  if (i == 126u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_184_CB1((uint)(5)).xyz * BA_Vertex_184_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_184_CB1((uint)(4)).xyz * BA_Vertex_184_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_184_CB1((uint)(6)).xyz * BA_Vertex_184_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_184_CB1((uint)(7)).xyz * BA_Vertex_184_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_184_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_184_CB1((uint)(5)).xyz * BA_Vertex_184_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_184_CB1((uint)(4)).xyz * BA_Vertex_184_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_184_CB1((uint)(6)).xyz * BA_Vertex_184_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_184_CB1((uint)(7)).xyz * BA_Vertex_184_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_184_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_184_CB0((uint)(125)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_184_CB0((uint)(126)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_184_CB0((uint)(126)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_184_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_184_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_184_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_184_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_184_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_184_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_184_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_184_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_184_CB0((uint)(18)).x / BA_Vertex_184_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_184_CB0((uint)(125)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_184_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_184_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_184_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_184_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_184_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_185_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_185_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, _CrushScale, 0.0);
  if (i == 127u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_185_CB1((uint)(5)).xyz * BA_Vertex_185_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_185_CB1((uint)(4)).xyz * BA_Vertex_185_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_185_CB1((uint)(6)).xyz * BA_Vertex_185_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_185_CB1((uint)(7)).xyz * BA_Vertex_185_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_185_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_185_CB1((uint)(5)).xyz * BA_Vertex_185_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_185_CB1((uint)(4)).xyz * BA_Vertex_185_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_185_CB1((uint)(6)).xyz * BA_Vertex_185_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_185_CB1((uint)(7)).xyz * BA_Vertex_185_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_185_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_185_CB0((uint)(126)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_185_CB0((uint)(127)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_185_CB0((uint)(127)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_185_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_185_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_185_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_185_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_185_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_185_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_185_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_185_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_185_CB0((uint)(18)).x / BA_Vertex_185_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_185_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_185_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_185_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_185_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_185_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_185_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_186_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_186_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, _CrushScale, 0.0);
  if (i == 127u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_186_CB1((uint)(5)).xyz * BA_Vertex_186_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_186_CB1((uint)(4)).xyz * BA_Vertex_186_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_186_CB1((uint)(6)).xyz * BA_Vertex_186_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_186_CB1((uint)(7)).xyz * BA_Vertex_186_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_186_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_186_CB1((uint)(5)).xyz * BA_Vertex_186_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_186_CB1((uint)(4)).xyz * BA_Vertex_186_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_186_CB1((uint)(6)).xyz * BA_Vertex_186_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_186_CB1((uint)(7)).xyz * BA_Vertex_186_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_186_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_186_CB0((uint)(126)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_186_CB0((uint)(127)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_186_CB0((uint)(127)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_186_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_186_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_186_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_186_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_186_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_186_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_186_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_186_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_186_CB0((uint)(18)).x / BA_Vertex_186_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_186_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_186_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_186_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_186_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_186_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_186_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_186_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_187_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_187_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, _CrushScale, 0.0);
  if (i == 127u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_187_CB1((uint)(5)).xyz * BA_Vertex_187_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_187_CB1((uint)(4)).xyz * BA_Vertex_187_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_187_CB1((uint)(6)).xyz * BA_Vertex_187_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_187_CB1((uint)(7)).xyz * BA_Vertex_187_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_187_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_187_CB1((uint)(5)).xyz * BA_Vertex_187_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_187_CB1((uint)(4)).xyz * BA_Vertex_187_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_187_CB1((uint)(6)).xyz * BA_Vertex_187_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_187_CB1((uint)(7)).xyz * BA_Vertex_187_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_187_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_187_CB0((uint)(126)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_187_CB0((uint)(127)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_187_CB0((uint)(127)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_187_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_187_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_187_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_187_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_187_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_187_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_187_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_187_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_187_CB0((uint)(18)).x / BA_Vertex_187_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_187_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_187_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_187_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_187_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_187_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_187_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_187_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_188_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_188_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_188_CB1((uint)(5)).xyz * BA_Vertex_188_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_188_CB1((uint)(4)).xyz * BA_Vertex_188_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_188_CB1((uint)(6)).xyz * BA_Vertex_188_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_188_CB1((uint)(7)).xyz * BA_Vertex_188_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_188_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_188_CB1((uint)(5)).xyz * BA_Vertex_188_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_188_CB1((uint)(4)).xyz * BA_Vertex_188_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_188_CB1((uint)(6)).xyz * BA_Vertex_188_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_188_CB1((uint)(7)).xyz * BA_Vertex_188_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_188_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_188_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_188_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_188_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_188_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_188_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_188_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_188_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_188_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_188_CB0((uint)(18)).x / BA_Vertex_188_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_188_CB0((uint)(125)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_188_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_188_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.y = dot(v1.xyz, BA_Vertex_188_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_188_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_188_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  r0.xyz = BA_Vertex_188_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_188_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_188_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_188_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_189_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_189_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_189_CB1((uint)(5)).xyz * BA_Vertex_189_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_189_CB1((uint)(4)).xyz * BA_Vertex_189_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_189_CB1((uint)(6)).xyz * BA_Vertex_189_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_189_CB1((uint)(7)).xyz * BA_Vertex_189_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_189_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_189_CB1((uint)(5)).xyz * BA_Vertex_189_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_189_CB1((uint)(4)).xyz * BA_Vertex_189_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_189_CB1((uint)(6)).xyz * BA_Vertex_189_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_189_CB1((uint)(7)).xyz * BA_Vertex_189_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_189_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_189_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_189_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_189_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_189_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_189_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_189_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_189_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_189_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_189_CB0((uint)(18)).x / BA_Vertex_189_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_189_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_189_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_189_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.y = dot(v1.xyz, BA_Vertex_189_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_189_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_189_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  r0.xyz = BA_Vertex_189_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_189_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_189_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_189_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_190_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_190_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_190_CB1((uint)(5)).xyz * BA_Vertex_190_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_190_CB1((uint)(4)).xyz * BA_Vertex_190_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_190_CB1((uint)(6)).xyz * BA_Vertex_190_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_190_CB1((uint)(7)).xyz * BA_Vertex_190_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_190_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_190_CB1((uint)(5)).xyz * BA_Vertex_190_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_190_CB1((uint)(4)).xyz * BA_Vertex_190_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_190_CB1((uint)(6)).xyz * BA_Vertex_190_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_190_CB1((uint)(7)).xyz * BA_Vertex_190_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_190_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_190_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_190_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_190_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_190_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_190_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_190_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_190_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_190_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_190_CB0((uint)(18)).x / BA_Vertex_190_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_190_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_190_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_190_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_190_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  o2.x = 0;
  r0.x = dot(v1.xyz, BA_Vertex_190_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_190_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_190_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_190_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_190_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_190_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o4.xyz = BA_Vertex_190_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_191_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_191_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_191_CB1((uint)(5)).xyz * BA_Vertex_191_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_191_CB1((uint)(4)).xyz * BA_Vertex_191_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_191_CB1((uint)(6)).xyz * BA_Vertex_191_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_191_CB1((uint)(7)).xyz * BA_Vertex_191_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_191_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_191_CB1((uint)(5)).xyz * BA_Vertex_191_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_191_CB1((uint)(4)).xyz * BA_Vertex_191_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_191_CB1((uint)(6)).xyz * BA_Vertex_191_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_191_CB1((uint)(7)).xyz * BA_Vertex_191_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_191_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_191_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_191_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_191_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_191_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_191_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_191_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_191_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_191_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_191_CB0((uint)(18)).x / BA_Vertex_191_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_191_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_191_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_191_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_191_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  o2.x = 0;
  r0.x = dot(v1.xyz, BA_Vertex_191_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_191_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_191_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_191_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_191_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_191_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o4.xyz = BA_Vertex_191_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_192_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_192_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 128u) value = float4(_CrushScale, _NoiseDir.x, _NoiseDir.y, _NoiseDir.z);
  if (i == 129u) value = float4(_Damage, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_192_CB1((uint)(5)).xyz * BA_Vertex_192_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_192_CB1((uint)(4)).xyz * BA_Vertex_192_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_192_CB1((uint)(6)).xyz * BA_Vertex_192_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_192_CB1((uint)(7)).xyz * BA_Vertex_192_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_192_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_192_CB1((uint)(5)).xyz * BA_Vertex_192_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_192_CB1((uint)(4)).xyz * BA_Vertex_192_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_192_CB1((uint)(6)).xyz * BA_Vertex_192_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_192_CB1((uint)(7)).xyz * BA_Vertex_192_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_192_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_192_CB0((uint)(128)).xx * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_192_CB0((uint)(128)).yzw * r0.zzz;
  r1.xyz = BA_Vertex_192_CB0((uint)(129)).xxx * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_192_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_192_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_192_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_192_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_192_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_192_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_192_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_192_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_192_CB0((uint)(18)).x / BA_Vertex_192_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r2.xy + r0.xz;
  o0.z = BA_Vertex_192_CB0((uint)(125)).y + r2.z;
  o0.w = r2.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_192_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_192_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.y = dot(v1.xyz, BA_Vertex_192_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_192_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_192_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  r0.xyz = BA_Vertex_192_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_192_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_192_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o3.xyz = BA_Vertex_192_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_193_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_193_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 129u) value = float4(_CrushScale, _NoiseDir.x, _NoiseDir.y, _NoiseDir.z);
  if (i == 130u) value = float4(_Damage, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_193_CB1((uint)(5)).xyz * BA_Vertex_193_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_193_CB1((uint)(4)).xyz * BA_Vertex_193_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_193_CB1((uint)(6)).xyz * BA_Vertex_193_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_193_CB1((uint)(7)).xyz * BA_Vertex_193_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_193_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_193_CB1((uint)(5)).xyz * BA_Vertex_193_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_193_CB1((uint)(4)).xyz * BA_Vertex_193_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_193_CB1((uint)(6)).xyz * BA_Vertex_193_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_193_CB1((uint)(7)).xyz * BA_Vertex_193_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_193_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_193_CB0((uint)(129)).xx * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_193_CB0((uint)(129)).yzw * r0.zzz;
  r1.xyz = BA_Vertex_193_CB0((uint)(130)).xxx * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_193_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_193_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_193_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_193_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_193_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_193_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_193_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_193_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_193_CB0((uint)(18)).x / BA_Vertex_193_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r2.xy + r0.xz;
  o0.z = BA_Vertex_193_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_193_CB0((uint)(125)).xwyz * r0.xwyz;
  r2.xyz = BA_Vertex_193_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r2.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.y = dot(v1.xyz, BA_Vertex_193_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_193_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_193_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  r0.xyz = BA_Vertex_193_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_193_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_193_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o3.xyz = BA_Vertex_193_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_194_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_194_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 129u) value = float4(_CrushScale, _NoiseDir.x, _NoiseDir.y, _NoiseDir.z);
  if (i == 130u) value = float4(_Damage, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_194_CB1((uint)(5)).xyz * BA_Vertex_194_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_194_CB1((uint)(4)).xyz * BA_Vertex_194_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_194_CB1((uint)(6)).xyz * BA_Vertex_194_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_194_CB1((uint)(7)).xyz * BA_Vertex_194_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_194_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_194_CB1((uint)(5)).xyz * BA_Vertex_194_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_194_CB1((uint)(4)).xyz * BA_Vertex_194_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_194_CB1((uint)(6)).xyz * BA_Vertex_194_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_194_CB1((uint)(7)).xyz * BA_Vertex_194_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_194_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_194_CB0((uint)(129)).xx * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_194_CB0((uint)(129)).yzw * r0.zzz;
  r1.xyz = BA_Vertex_194_CB0((uint)(130)).xxx * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_194_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_194_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_194_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_194_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_194_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_194_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_194_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_194_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_194_CB0((uint)(18)).x / BA_Vertex_194_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_194_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r2.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_194_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_194_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_194_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  o2.x = 0;
  r0.x = dot(v1.xyz, BA_Vertex_194_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_194_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_194_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_194_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_194_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_194_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o4.xyz = BA_Vertex_194_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_195_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_195_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 129u) value = float4(_CrushScale, _NoiseDir.x, _NoiseDir.y, _NoiseDir.z);
  if (i == 130u) value = float4(_Damage, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_195_CB1((uint)(5)).xyz * BA_Vertex_195_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_195_CB1((uint)(4)).xyz * BA_Vertex_195_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_195_CB1((uint)(6)).xyz * BA_Vertex_195_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_195_CB1((uint)(7)).xyz * BA_Vertex_195_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_195_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_195_CB1((uint)(5)).xyz * BA_Vertex_195_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_195_CB1((uint)(4)).xyz * BA_Vertex_195_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_195_CB1((uint)(6)).xyz * BA_Vertex_195_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_195_CB1((uint)(7)).xyz * BA_Vertex_195_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_195_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_195_CB0((uint)(129)).xx * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_195_CB0((uint)(129)).yzw * r0.zzz;
  r1.xyz = BA_Vertex_195_CB0((uint)(130)).xxx * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_195_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_195_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_195_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_195_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_195_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_195_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_195_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_195_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_195_CB0((uint)(18)).x / BA_Vertex_195_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_195_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r2.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_195_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_195_CB0((uint)(125)).xwyz * r0.xwyz;
  r2.xyz = BA_Vertex_195_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r2.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  o2.x = 0;
  r0.x = dot(v1.xyz, BA_Vertex_195_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_195_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_195_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_195_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_195_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_195_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o4.xyz = BA_Vertex_195_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_196_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_196_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_196_CB1((uint)(5)).xyz * BA_Vertex_196_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_196_CB1((uint)(4)).xyz * BA_Vertex_196_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_196_CB1((uint)(6)).xyz * BA_Vertex_196_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_196_CB1((uint)(7)).xyz * BA_Vertex_196_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_196_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_196_CB1((uint)(5)).xyz * BA_Vertex_196_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_196_CB1((uint)(4)).xyz * BA_Vertex_196_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_196_CB1((uint)(6)).xyz * BA_Vertex_196_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_196_CB1((uint)(7)).xyz * BA_Vertex_196_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_196_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_196_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_196_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_196_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_196_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_196_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_196_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_196_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_196_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_196_CB0((uint)(18)).x / BA_Vertex_196_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_196_CB0((uint)(125)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_196_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_196_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_196_CB0((uint)(55)).z + BA_Vertex_196_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_196_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_196_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.y = dot(v1.xyz, BA_Vertex_196_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_196_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_196_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_196_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_196_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_196_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_196_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_197_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_197_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_197_CB1((uint)(5)).xyz * BA_Vertex_197_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_197_CB1((uint)(4)).xyz * BA_Vertex_197_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_197_CB1((uint)(6)).xyz * BA_Vertex_197_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_197_CB1((uint)(7)).xyz * BA_Vertex_197_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_197_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_197_CB1((uint)(5)).xyz * BA_Vertex_197_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_197_CB1((uint)(4)).xyz * BA_Vertex_197_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_197_CB1((uint)(6)).xyz * BA_Vertex_197_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_197_CB1((uint)(7)).xyz * BA_Vertex_197_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_197_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_197_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_197_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_197_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_197_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_197_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_197_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_197_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_197_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_197_CB0((uint)(18)).x / BA_Vertex_197_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_197_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_197_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_197_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_197_CB0((uint)(55)).z + BA_Vertex_197_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_197_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_197_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.y = dot(v1.xyz, BA_Vertex_197_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_197_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_197_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_197_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_197_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_197_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_197_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_198_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_198_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_198_CB1((uint)(5)).xyz * BA_Vertex_198_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_198_CB1((uint)(4)).xyz * BA_Vertex_198_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_198_CB1((uint)(6)).xyz * BA_Vertex_198_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_198_CB1((uint)(7)).xyz * BA_Vertex_198_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_198_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_198_CB1((uint)(5)).xyz * BA_Vertex_198_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_198_CB1((uint)(4)).xyz * BA_Vertex_198_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_198_CB1((uint)(6)).xyz * BA_Vertex_198_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_198_CB1((uint)(7)).xyz * BA_Vertex_198_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_198_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_198_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_198_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_198_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_198_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_198_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_198_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_198_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_198_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_198_CB0((uint)(18)).x / BA_Vertex_198_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_198_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_198_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_198_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_198_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_198_CB0((uint)(55)).z + BA_Vertex_198_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_198_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_198_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.x = dot(v1.xyz, BA_Vertex_198_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_198_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_198_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_198_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_198_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_198_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o4.xyz = BA_Vertex_198_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_199_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_199_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_199_CB1((uint)(5)).xyz * BA_Vertex_199_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_199_CB1((uint)(4)).xyz * BA_Vertex_199_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_199_CB1((uint)(6)).xyz * BA_Vertex_199_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_199_CB1((uint)(7)).xyz * BA_Vertex_199_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_199_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_199_CB1((uint)(5)).xyz * BA_Vertex_199_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_199_CB1((uint)(4)).xyz * BA_Vertex_199_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_199_CB1((uint)(6)).xyz * BA_Vertex_199_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_199_CB1((uint)(7)).xyz * BA_Vertex_199_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_199_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_199_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_199_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_199_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_199_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_199_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_199_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_199_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_199_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_199_CB0((uint)(18)).x / BA_Vertex_199_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_199_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_199_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_199_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_199_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_199_CB0((uint)(55)).z + BA_Vertex_199_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_199_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_199_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.x = dot(v1.xyz, BA_Vertex_199_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_199_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_199_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_199_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_199_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_199_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o4.xyz = BA_Vertex_199_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_200_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_200_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 128u) value = float4(_CrushScale, _NoiseDir.x, _NoiseDir.y, _NoiseDir.z);
  if (i == 129u) value = float4(_Damage, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_200_CB1((uint)(5)).xyz * BA_Vertex_200_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_200_CB1((uint)(4)).xyz * BA_Vertex_200_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_200_CB1((uint)(6)).xyz * BA_Vertex_200_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_200_CB1((uint)(7)).xyz * BA_Vertex_200_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_200_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_200_CB1((uint)(5)).xyz * BA_Vertex_200_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_200_CB1((uint)(4)).xyz * BA_Vertex_200_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_200_CB1((uint)(6)).xyz * BA_Vertex_200_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_200_CB1((uint)(7)).xyz * BA_Vertex_200_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_200_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_200_CB0((uint)(128)).xx * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_200_CB0((uint)(128)).yzw * r0.zzz;
  r1.xyz = BA_Vertex_200_CB0((uint)(129)).xxx * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_200_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_200_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_200_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_200_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_200_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_200_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_200_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_200_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_200_CB0((uint)(18)).x / BA_Vertex_200_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r2.xy + r0.xz;
  o0.z = BA_Vertex_200_CB0((uint)(125)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_200_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_200_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_200_CB0((uint)(55)).z + BA_Vertex_200_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_200_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_200_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.y = dot(v1.xyz, BA_Vertex_200_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_200_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_200_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_200_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_200_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_200_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o3.xyz = BA_Vertex_200_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_201_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_201_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 129u) value = float4(_CrushScale, _NoiseDir.x, _NoiseDir.y, _NoiseDir.z);
  if (i == 130u) value = float4(_Damage, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_201_CB1((uint)(5)).xyz * BA_Vertex_201_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_201_CB1((uint)(4)).xyz * BA_Vertex_201_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_201_CB1((uint)(6)).xyz * BA_Vertex_201_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_201_CB1((uint)(7)).xyz * BA_Vertex_201_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_201_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_201_CB1((uint)(5)).xyz * BA_Vertex_201_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_201_CB1((uint)(4)).xyz * BA_Vertex_201_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_201_CB1((uint)(6)).xyz * BA_Vertex_201_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_201_CB1((uint)(7)).xyz * BA_Vertex_201_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_201_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_201_CB0((uint)(129)).xx * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_201_CB0((uint)(129)).yzw * r0.zzz;
  r1.xyz = BA_Vertex_201_CB0((uint)(130)).xxx * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_201_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_201_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_201_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_201_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_201_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_201_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_201_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_201_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_201_CB0((uint)(18)).x / BA_Vertex_201_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r2.xy + r0.xz;
  o0.z = BA_Vertex_201_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_201_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_201_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_201_CB0((uint)(55)).z + BA_Vertex_201_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_201_CB0((uint)(125)).xwyz * r0.xwyz;
  r2.xyz = BA_Vertex_201_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r2.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.y = dot(v1.xyz, BA_Vertex_201_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_201_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_201_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_201_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_201_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_201_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o3.xyz = BA_Vertex_201_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_202_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_202_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 129u) value = float4(_CrushScale, _NoiseDir.x, _NoiseDir.y, _NoiseDir.z);
  if (i == 130u) value = float4(_Damage, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_202_CB1((uint)(5)).xyz * BA_Vertex_202_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_202_CB1((uint)(4)).xyz * BA_Vertex_202_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_202_CB1((uint)(6)).xyz * BA_Vertex_202_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_202_CB1((uint)(7)).xyz * BA_Vertex_202_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_202_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_202_CB1((uint)(5)).xyz * BA_Vertex_202_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_202_CB1((uint)(4)).xyz * BA_Vertex_202_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_202_CB1((uint)(6)).xyz * BA_Vertex_202_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_202_CB1((uint)(7)).xyz * BA_Vertex_202_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_202_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_202_CB0((uint)(129)).xx * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_202_CB0((uint)(129)).yzw * r0.zzz;
  r1.xyz = BA_Vertex_202_CB0((uint)(130)).xxx * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_202_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_202_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_202_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_202_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_202_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_202_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_202_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_202_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_202_CB0((uint)(18)).x / BA_Vertex_202_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_202_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r2.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_202_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_202_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_202_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_202_CB0((uint)(55)).z + BA_Vertex_202_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_202_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_202_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.x = dot(v1.xyz, BA_Vertex_202_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_202_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_202_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_202_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_202_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_202_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o4.xyz = BA_Vertex_202_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_203_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_203_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 129u) value = float4(_CrushScale, _NoiseDir.x, _NoiseDir.y, _NoiseDir.z);
  if (i == 130u) value = float4(_Damage, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_203_CB1((uint)(5)).xyz * BA_Vertex_203_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_203_CB1((uint)(4)).xyz * BA_Vertex_203_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_203_CB1((uint)(6)).xyz * BA_Vertex_203_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_203_CB1((uint)(7)).xyz * BA_Vertex_203_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_203_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_203_CB1((uint)(5)).xyz * BA_Vertex_203_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_203_CB1((uint)(4)).xyz * BA_Vertex_203_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_203_CB1((uint)(6)).xyz * BA_Vertex_203_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_203_CB1((uint)(7)).xyz * BA_Vertex_203_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_203_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_203_CB0((uint)(129)).xx * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_203_CB0((uint)(129)).yzw * r0.zzz;
  r1.xyz = BA_Vertex_203_CB0((uint)(130)).xxx * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_203_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_203_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_203_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_203_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_203_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_203_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_203_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_203_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_203_CB0((uint)(18)).x / BA_Vertex_203_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_203_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r2.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_203_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_203_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_203_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_203_CB0((uint)(55)).z + BA_Vertex_203_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_203_CB0((uint)(125)).xwyz * r0.xwyz;
  r2.xyz = BA_Vertex_203_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r2.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.x = dot(v1.xyz, BA_Vertex_203_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_203_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_203_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_203_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_203_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_203_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o4.xyz = BA_Vertex_203_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_204_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_204_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_204_CB1((uint)(5)).xyz * BA_Vertex_204_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_204_CB1((uint)(4)).xyz * BA_Vertex_204_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_204_CB1((uint)(6)).xyz * BA_Vertex_204_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_204_CB1((uint)(7)).xyz * BA_Vertex_204_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_204_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_204_CB1((uint)(5)).xyz * BA_Vertex_204_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_204_CB1((uint)(4)).xyz * BA_Vertex_204_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_204_CB1((uint)(6)).xyz * BA_Vertex_204_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_204_CB1((uint)(7)).xyz * BA_Vertex_204_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_204_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_204_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_204_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_204_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_204_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_204_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_204_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_204_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_204_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_204_CB0((uint)(18)).x / BA_Vertex_204_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_204_CB0((uint)(125)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_204_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_204_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_204_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_204_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_204_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.y = dot(v1.xyz, BA_Vertex_204_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_204_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_204_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_204_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_204_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_204_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_204_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_205_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_205_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_205_CB1((uint)(5)).xyz * BA_Vertex_205_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_205_CB1((uint)(4)).xyz * BA_Vertex_205_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_205_CB1((uint)(6)).xyz * BA_Vertex_205_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_205_CB1((uint)(7)).xyz * BA_Vertex_205_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_205_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_205_CB1((uint)(5)).xyz * BA_Vertex_205_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_205_CB1((uint)(4)).xyz * BA_Vertex_205_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_205_CB1((uint)(6)).xyz * BA_Vertex_205_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_205_CB1((uint)(7)).xyz * BA_Vertex_205_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_205_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_205_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_205_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_205_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_205_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_205_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_205_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_205_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_205_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_205_CB0((uint)(18)).x / BA_Vertex_205_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_205_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_205_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_205_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_205_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_205_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_205_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.y = dot(v1.xyz, BA_Vertex_205_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_205_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_205_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_205_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_205_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_205_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_205_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_206_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_206_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_206_CB1((uint)(5)).xyz * BA_Vertex_206_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_206_CB1((uint)(4)).xyz * BA_Vertex_206_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_206_CB1((uint)(6)).xyz * BA_Vertex_206_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_206_CB1((uint)(7)).xyz * BA_Vertex_206_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_206_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_206_CB1((uint)(5)).xyz * BA_Vertex_206_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_206_CB1((uint)(4)).xyz * BA_Vertex_206_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_206_CB1((uint)(6)).xyz * BA_Vertex_206_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_206_CB1((uint)(7)).xyz * BA_Vertex_206_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_206_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_206_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_206_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_206_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_206_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_206_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_206_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_206_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_206_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_206_CB0((uint)(18)).x / BA_Vertex_206_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_206_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_206_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_206_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_206_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_206_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_206_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_206_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.x = dot(v1.xyz, BA_Vertex_206_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_206_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_206_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_206_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_206_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_206_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o4.xyz = BA_Vertex_206_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_207_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_207_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_207_CB1((uint)(5)).xyz * BA_Vertex_207_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_207_CB1((uint)(4)).xyz * BA_Vertex_207_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_207_CB1((uint)(6)).xyz * BA_Vertex_207_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_207_CB1((uint)(7)).xyz * BA_Vertex_207_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_207_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_207_CB1((uint)(5)).xyz * BA_Vertex_207_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_207_CB1((uint)(4)).xyz * BA_Vertex_207_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_207_CB1((uint)(6)).xyz * BA_Vertex_207_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_207_CB1((uint)(7)).xyz * BA_Vertex_207_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_207_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_207_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_207_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_207_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_207_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_207_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_207_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_207_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_207_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_207_CB0((uint)(18)).x / BA_Vertex_207_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_207_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_207_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_207_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_207_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_207_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_207_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_207_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.x = dot(v1.xyz, BA_Vertex_207_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_207_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_207_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_207_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_207_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_207_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o4.xyz = BA_Vertex_207_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_208_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_208_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 128u) value = float4(_CrushScale, _NoiseDir.x, _NoiseDir.y, _NoiseDir.z);
  if (i == 129u) value = float4(_Damage, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_208_CB1((uint)(5)).xyz * BA_Vertex_208_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_208_CB1((uint)(4)).xyz * BA_Vertex_208_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_208_CB1((uint)(6)).xyz * BA_Vertex_208_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_208_CB1((uint)(7)).xyz * BA_Vertex_208_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_208_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_208_CB1((uint)(5)).xyz * BA_Vertex_208_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_208_CB1((uint)(4)).xyz * BA_Vertex_208_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_208_CB1((uint)(6)).xyz * BA_Vertex_208_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_208_CB1((uint)(7)).xyz * BA_Vertex_208_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_208_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_208_CB0((uint)(128)).xx * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_208_CB0((uint)(128)).yzw * r0.zzz;
  r1.xyz = BA_Vertex_208_CB0((uint)(129)).xxx * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_208_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_208_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_208_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_208_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_208_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_208_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_208_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_208_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_208_CB0((uint)(18)).x / BA_Vertex_208_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r2.xy + r0.xz;
  o0.z = BA_Vertex_208_CB0((uint)(125)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_208_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_208_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_208_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_208_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_208_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.y = dot(v1.xyz, BA_Vertex_208_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_208_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_208_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_208_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_208_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_208_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o3.xyz = BA_Vertex_208_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_209_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_209_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 129u) value = float4(_CrushScale, _NoiseDir.x, _NoiseDir.y, _NoiseDir.z);
  if (i == 130u) value = float4(_Damage, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_209_CB1((uint)(5)).xyz * BA_Vertex_209_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_209_CB1((uint)(4)).xyz * BA_Vertex_209_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_209_CB1((uint)(6)).xyz * BA_Vertex_209_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_209_CB1((uint)(7)).xyz * BA_Vertex_209_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_209_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_209_CB1((uint)(5)).xyz * BA_Vertex_209_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_209_CB1((uint)(4)).xyz * BA_Vertex_209_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_209_CB1((uint)(6)).xyz * BA_Vertex_209_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_209_CB1((uint)(7)).xyz * BA_Vertex_209_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_209_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_209_CB0((uint)(129)).xx * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_209_CB0((uint)(129)).yzw * r0.zzz;
  r1.xyz = BA_Vertex_209_CB0((uint)(130)).xxx * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_209_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_209_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_209_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_209_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_209_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_209_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_209_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_209_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_209_CB0((uint)(18)).x / BA_Vertex_209_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r2.xy + r0.xz;
  o0.z = BA_Vertex_209_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_209_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_209_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_209_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_209_CB0((uint)(125)).xwyz * r0.xwyz;
  r2.xyz = BA_Vertex_209_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r2.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.y = dot(v1.xyz, BA_Vertex_209_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_209_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_209_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_209_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_209_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_209_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o3.xyz = BA_Vertex_209_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_210_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_210_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 129u) value = float4(_CrushScale, _NoiseDir.x, _NoiseDir.y, _NoiseDir.z);
  if (i == 130u) value = float4(_Damage, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_210_CB1((uint)(5)).xyz * BA_Vertex_210_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_210_CB1((uint)(4)).xyz * BA_Vertex_210_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_210_CB1((uint)(6)).xyz * BA_Vertex_210_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_210_CB1((uint)(7)).xyz * BA_Vertex_210_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_210_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_210_CB1((uint)(5)).xyz * BA_Vertex_210_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_210_CB1((uint)(4)).xyz * BA_Vertex_210_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_210_CB1((uint)(6)).xyz * BA_Vertex_210_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_210_CB1((uint)(7)).xyz * BA_Vertex_210_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_210_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_210_CB0((uint)(129)).xx * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_210_CB0((uint)(129)).yzw * r0.zzz;
  r1.xyz = BA_Vertex_210_CB0((uint)(130)).xxx * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_210_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_210_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_210_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_210_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_210_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_210_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_210_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_210_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_210_CB0((uint)(18)).x / BA_Vertex_210_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_210_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r2.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_210_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_210_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_210_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_210_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_210_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_210_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.x = dot(v1.xyz, BA_Vertex_210_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_210_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_210_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_210_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_210_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_210_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o4.xyz = BA_Vertex_210_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_211_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_211_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 129u) value = float4(_CrushScale, _NoiseDir.x, _NoiseDir.y, _NoiseDir.z);
  if (i == 130u) value = float4(_Damage, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_211_CB1((uint)(5)).xyz * BA_Vertex_211_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_211_CB1((uint)(4)).xyz * BA_Vertex_211_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_211_CB1((uint)(6)).xyz * BA_Vertex_211_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_211_CB1((uint)(7)).xyz * BA_Vertex_211_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_211_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_211_CB1((uint)(5)).xyz * BA_Vertex_211_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_211_CB1((uint)(4)).xyz * BA_Vertex_211_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_211_CB1((uint)(6)).xyz * BA_Vertex_211_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_211_CB1((uint)(7)).xyz * BA_Vertex_211_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_211_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_211_CB0((uint)(129)).xx * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_211_CB0((uint)(129)).yzw * r0.zzz;
  r1.xyz = BA_Vertex_211_CB0((uint)(130)).xxx * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_211_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_211_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_211_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_211_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_211_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_211_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_211_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_211_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_211_CB0((uint)(18)).x / BA_Vertex_211_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_211_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r2.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_211_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_211_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_211_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_211_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_211_CB0((uint)(125)).xwyz * r0.xwyz;
  r2.xyz = BA_Vertex_211_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r2.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.x = dot(v1.xyz, BA_Vertex_211_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_211_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_211_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_211_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_211_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_211_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o4.xyz = BA_Vertex_211_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_212_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_212_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_212_CB1((uint)(5)).xyz * BA_Vertex_212_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_212_CB1((uint)(4)).xyz * BA_Vertex_212_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_212_CB1((uint)(6)).xyz * BA_Vertex_212_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_212_CB1((uint)(7)).xyz * BA_Vertex_212_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_212_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_212_CB1((uint)(5)).xyz * BA_Vertex_212_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_212_CB1((uint)(4)).xyz * BA_Vertex_212_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_212_CB1((uint)(6)).xyz * BA_Vertex_212_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_212_CB1((uint)(7)).xyz * BA_Vertex_212_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_212_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_212_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_212_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_212_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_212_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_212_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_212_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_212_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_212_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_212_CB0((uint)(18)).x / BA_Vertex_212_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_212_CB0((uint)(125)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_212_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_212_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.y = dot(v1.xyz, BA_Vertex_212_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_212_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_212_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  r0.xyz = BA_Vertex_212_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_212_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_212_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_212_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_213_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_213_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_213_CB1((uint)(5)).xyz * BA_Vertex_213_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_213_CB1((uint)(4)).xyz * BA_Vertex_213_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_213_CB1((uint)(6)).xyz * BA_Vertex_213_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_213_CB1((uint)(7)).xyz * BA_Vertex_213_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_213_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_213_CB1((uint)(5)).xyz * BA_Vertex_213_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_213_CB1((uint)(4)).xyz * BA_Vertex_213_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_213_CB1((uint)(6)).xyz * BA_Vertex_213_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_213_CB1((uint)(7)).xyz * BA_Vertex_213_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_213_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_213_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_213_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_213_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_213_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_213_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_213_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_213_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_213_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_213_CB0((uint)(18)).x / BA_Vertex_213_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_213_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_213_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_213_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.y = dot(v1.xyz, BA_Vertex_213_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_213_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_213_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  r0.xyz = BA_Vertex_213_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_213_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_213_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_213_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_214_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_214_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_214_CB1((uint)(5)).xyz * BA_Vertex_214_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_214_CB1((uint)(4)).xyz * BA_Vertex_214_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_214_CB1((uint)(6)).xyz * BA_Vertex_214_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_214_CB1((uint)(7)).xyz * BA_Vertex_214_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_214_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_214_CB1((uint)(5)).xyz * BA_Vertex_214_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_214_CB1((uint)(4)).xyz * BA_Vertex_214_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_214_CB1((uint)(6)).xyz * BA_Vertex_214_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_214_CB1((uint)(7)).xyz * BA_Vertex_214_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_214_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_214_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_214_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_214_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_214_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_214_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_214_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_214_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_214_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_214_CB0((uint)(18)).x / BA_Vertex_214_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_214_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_214_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_214_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_214_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  o2.x = 0;
  r0.x = dot(v1.xyz, BA_Vertex_214_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_214_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_214_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_214_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_214_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_214_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o4.xyz = BA_Vertex_214_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_215_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_215_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_215_CB1((uint)(5)).xyz * BA_Vertex_215_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_215_CB1((uint)(4)).xyz * BA_Vertex_215_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_215_CB1((uint)(6)).xyz * BA_Vertex_215_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_215_CB1((uint)(7)).xyz * BA_Vertex_215_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_215_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_215_CB1((uint)(5)).xyz * BA_Vertex_215_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_215_CB1((uint)(4)).xyz * BA_Vertex_215_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_215_CB1((uint)(6)).xyz * BA_Vertex_215_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_215_CB1((uint)(7)).xyz * BA_Vertex_215_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_215_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_215_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_215_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_215_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_215_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_215_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_215_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_215_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_215_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_215_CB0((uint)(18)).x / BA_Vertex_215_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_215_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_215_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_215_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_215_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  o2.x = 0;
  r0.x = dot(v1.xyz, BA_Vertex_215_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_215_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_215_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_215_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_215_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_215_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o4.xyz = BA_Vertex_215_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_216_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_216_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 129u) value = float4(0.0, 0.0, _CrushScale, 0.0);
  if (i == 130u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_216_CB1((uint)(5)).xyz * BA_Vertex_216_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_216_CB1((uint)(4)).xyz * BA_Vertex_216_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_216_CB1((uint)(6)).xyz * BA_Vertex_216_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_216_CB1((uint)(7)).xyz * BA_Vertex_216_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_216_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_216_CB1((uint)(5)).xyz * BA_Vertex_216_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_216_CB1((uint)(4)).xyz * BA_Vertex_216_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_216_CB1((uint)(6)).xyz * BA_Vertex_216_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_216_CB1((uint)(7)).xyz * BA_Vertex_216_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_216_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_216_CB0((uint)(129)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_216_CB0((uint)(130)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_216_CB0((uint)(130)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_216_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_216_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_216_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_216_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_216_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_216_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_216_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_216_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_216_CB0((uint)(18)).x / BA_Vertex_216_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r2.xy + r0.xz;
  o0.z = BA_Vertex_216_CB0((uint)(125)).y + r2.z;
  o0.w = r2.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_216_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_216_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.y = dot(v1.xyz, BA_Vertex_216_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_216_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_216_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  r0.xyz = BA_Vertex_216_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_216_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_216_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o3.xyz = BA_Vertex_216_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_217_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_217_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 130u) value = float4(0.0, 0.0, _CrushScale, 0.0);
  if (i == 131u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_217_CB1((uint)(5)).xyz * BA_Vertex_217_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_217_CB1((uint)(4)).xyz * BA_Vertex_217_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_217_CB1((uint)(6)).xyz * BA_Vertex_217_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_217_CB1((uint)(7)).xyz * BA_Vertex_217_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_217_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_217_CB1((uint)(5)).xyz * BA_Vertex_217_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_217_CB1((uint)(4)).xyz * BA_Vertex_217_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_217_CB1((uint)(6)).xyz * BA_Vertex_217_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_217_CB1((uint)(7)).xyz * BA_Vertex_217_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_217_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_217_CB0((uint)(130)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_217_CB0((uint)(131)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_217_CB0((uint)(131)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_217_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_217_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_217_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_217_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_217_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_217_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_217_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_217_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_217_CB0((uint)(18)).x / BA_Vertex_217_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r2.xy + r0.xz;
  o0.z = BA_Vertex_217_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_217_CB0((uint)(125)).xwyz * r0.xwyz;
  r2.xyz = BA_Vertex_217_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r2.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.y = dot(v1.xyz, BA_Vertex_217_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_217_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_217_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  o2.x = 0;
  r0.xyz = BA_Vertex_217_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_217_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_217_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o3.xyz = BA_Vertex_217_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_218_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_218_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 130u) value = float4(0.0, 0.0, _CrushScale, 0.0);
  if (i == 131u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_218_CB1((uint)(5)).xyz * BA_Vertex_218_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_218_CB1((uint)(4)).xyz * BA_Vertex_218_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_218_CB1((uint)(6)).xyz * BA_Vertex_218_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_218_CB1((uint)(7)).xyz * BA_Vertex_218_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_218_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_218_CB1((uint)(5)).xyz * BA_Vertex_218_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_218_CB1((uint)(4)).xyz * BA_Vertex_218_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_218_CB1((uint)(6)).xyz * BA_Vertex_218_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_218_CB1((uint)(7)).xyz * BA_Vertex_218_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_218_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_218_CB0((uint)(130)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_218_CB0((uint)(131)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_218_CB0((uint)(131)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_218_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_218_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_218_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_218_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_218_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_218_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_218_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_218_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_218_CB0((uint)(18)).x / BA_Vertex_218_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_218_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r2.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_218_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_218_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_218_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  o2.x = 0;
  r0.x = dot(v1.xyz, BA_Vertex_218_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_218_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_218_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_218_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_218_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_218_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o4.xyz = BA_Vertex_218_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_219_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_219_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 130u) value = float4(0.0, 0.0, _CrushScale, 0.0);
  if (i == 131u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_219_CB1((uint)(5)).xyz * BA_Vertex_219_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_219_CB1((uint)(4)).xyz * BA_Vertex_219_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_219_CB1((uint)(6)).xyz * BA_Vertex_219_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_219_CB1((uint)(7)).xyz * BA_Vertex_219_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_219_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_219_CB1((uint)(5)).xyz * BA_Vertex_219_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_219_CB1((uint)(4)).xyz * BA_Vertex_219_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_219_CB1((uint)(6)).xyz * BA_Vertex_219_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_219_CB1((uint)(7)).xyz * BA_Vertex_219_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_219_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_219_CB0((uint)(130)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_219_CB0((uint)(131)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_219_CB0((uint)(131)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_219_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_219_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_219_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_219_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_219_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_219_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_219_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_219_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_219_CB0((uint)(18)).x / BA_Vertex_219_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_219_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r2.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_219_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_219_CB0((uint)(125)).xwyz * r0.xwyz;
  r2.xyz = BA_Vertex_219_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r2.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  o2.x = 0;
  r0.x = dot(v1.xyz, BA_Vertex_219_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_219_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_219_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_219_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_219_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_219_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o4.xyz = BA_Vertex_219_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_220_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_220_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_220_CB1((uint)(5)).xyz * BA_Vertex_220_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_220_CB1((uint)(4)).xyz * BA_Vertex_220_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_220_CB1((uint)(6)).xyz * BA_Vertex_220_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_220_CB1((uint)(7)).xyz * BA_Vertex_220_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_220_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_220_CB1((uint)(5)).xyz * BA_Vertex_220_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_220_CB1((uint)(4)).xyz * BA_Vertex_220_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_220_CB1((uint)(6)).xyz * BA_Vertex_220_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_220_CB1((uint)(7)).xyz * BA_Vertex_220_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_220_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_220_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_220_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_220_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_220_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_220_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_220_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_220_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_220_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_220_CB0((uint)(18)).x / BA_Vertex_220_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_220_CB0((uint)(125)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_220_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_220_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_220_CB0((uint)(55)).z + BA_Vertex_220_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_220_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_220_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.y = dot(v1.xyz, BA_Vertex_220_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_220_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_220_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_220_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_220_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_220_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_220_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_221_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_221_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_221_CB1((uint)(5)).xyz * BA_Vertex_221_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_221_CB1((uint)(4)).xyz * BA_Vertex_221_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_221_CB1((uint)(6)).xyz * BA_Vertex_221_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_221_CB1((uint)(7)).xyz * BA_Vertex_221_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_221_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_221_CB1((uint)(5)).xyz * BA_Vertex_221_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_221_CB1((uint)(4)).xyz * BA_Vertex_221_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_221_CB1((uint)(6)).xyz * BA_Vertex_221_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_221_CB1((uint)(7)).xyz * BA_Vertex_221_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_221_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_221_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_221_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_221_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_221_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_221_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_221_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_221_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_221_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_221_CB0((uint)(18)).x / BA_Vertex_221_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_221_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_221_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_221_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_221_CB0((uint)(55)).z + BA_Vertex_221_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_221_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_221_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.y = dot(v1.xyz, BA_Vertex_221_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_221_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_221_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_221_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_221_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_221_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_221_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_222_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_222_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_222_CB1((uint)(5)).xyz * BA_Vertex_222_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_222_CB1((uint)(4)).xyz * BA_Vertex_222_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_222_CB1((uint)(6)).xyz * BA_Vertex_222_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_222_CB1((uint)(7)).xyz * BA_Vertex_222_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_222_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_222_CB1((uint)(5)).xyz * BA_Vertex_222_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_222_CB1((uint)(4)).xyz * BA_Vertex_222_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_222_CB1((uint)(6)).xyz * BA_Vertex_222_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_222_CB1((uint)(7)).xyz * BA_Vertex_222_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_222_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_222_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_222_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_222_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_222_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_222_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_222_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_222_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_222_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_222_CB0((uint)(18)).x / BA_Vertex_222_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_222_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_222_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_222_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_222_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_222_CB0((uint)(55)).z + BA_Vertex_222_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_222_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_222_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.x = dot(v1.xyz, BA_Vertex_222_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_222_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_222_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_222_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_222_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_222_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o4.xyz = BA_Vertex_222_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_223_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_223_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_223_CB1((uint)(5)).xyz * BA_Vertex_223_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_223_CB1((uint)(4)).xyz * BA_Vertex_223_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_223_CB1((uint)(6)).xyz * BA_Vertex_223_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_223_CB1((uint)(7)).xyz * BA_Vertex_223_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_223_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_223_CB1((uint)(5)).xyz * BA_Vertex_223_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_223_CB1((uint)(4)).xyz * BA_Vertex_223_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_223_CB1((uint)(6)).xyz * BA_Vertex_223_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_223_CB1((uint)(7)).xyz * BA_Vertex_223_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_223_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_223_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_223_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_223_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_223_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_223_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_223_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_223_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_223_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_223_CB0((uint)(18)).x / BA_Vertex_223_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_223_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_223_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_223_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_223_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_223_CB0((uint)(55)).z + BA_Vertex_223_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_223_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_223_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.x = dot(v1.xyz, BA_Vertex_223_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_223_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_223_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_223_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_223_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_223_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o4.xyz = BA_Vertex_223_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_224_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_224_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 129u) value = float4(0.0, 0.0, _CrushScale, 0.0);
  if (i == 130u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_224_CB1((uint)(5)).xyz * BA_Vertex_224_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_224_CB1((uint)(4)).xyz * BA_Vertex_224_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_224_CB1((uint)(6)).xyz * BA_Vertex_224_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_224_CB1((uint)(7)).xyz * BA_Vertex_224_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_224_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_224_CB1((uint)(5)).xyz * BA_Vertex_224_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_224_CB1((uint)(4)).xyz * BA_Vertex_224_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_224_CB1((uint)(6)).xyz * BA_Vertex_224_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_224_CB1((uint)(7)).xyz * BA_Vertex_224_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_224_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_224_CB0((uint)(129)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_224_CB0((uint)(130)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_224_CB0((uint)(130)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_224_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_224_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_224_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_224_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_224_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_224_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_224_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_224_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_224_CB0((uint)(18)).x / BA_Vertex_224_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r2.xy + r0.xz;
  o0.z = BA_Vertex_224_CB0((uint)(125)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_224_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_224_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_224_CB0((uint)(55)).z + BA_Vertex_224_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_224_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_224_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.y = dot(v1.xyz, BA_Vertex_224_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_224_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_224_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_224_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_224_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_224_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o3.xyz = BA_Vertex_224_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_225_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_225_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 130u) value = float4(0.0, 0.0, _CrushScale, 0.0);
  if (i == 131u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_225_CB1((uint)(5)).xyz * BA_Vertex_225_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_225_CB1((uint)(4)).xyz * BA_Vertex_225_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_225_CB1((uint)(6)).xyz * BA_Vertex_225_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_225_CB1((uint)(7)).xyz * BA_Vertex_225_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_225_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_225_CB1((uint)(5)).xyz * BA_Vertex_225_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_225_CB1((uint)(4)).xyz * BA_Vertex_225_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_225_CB1((uint)(6)).xyz * BA_Vertex_225_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_225_CB1((uint)(7)).xyz * BA_Vertex_225_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_225_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_225_CB0((uint)(130)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_225_CB0((uint)(131)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_225_CB0((uint)(131)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_225_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_225_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_225_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_225_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_225_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_225_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_225_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_225_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_225_CB0((uint)(18)).x / BA_Vertex_225_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r2.xy + r0.xz;
  o0.z = BA_Vertex_225_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_225_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_225_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_225_CB0((uint)(55)).z + BA_Vertex_225_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_225_CB0((uint)(125)).xwyz * r0.xwyz;
  r2.xyz = BA_Vertex_225_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r2.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.y = dot(v1.xyz, BA_Vertex_225_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_225_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_225_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_225_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_225_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_225_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o3.xyz = BA_Vertex_225_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_226_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_226_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 130u) value = float4(0.0, 0.0, _CrushScale, 0.0);
  if (i == 131u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_226_CB1((uint)(5)).xyz * BA_Vertex_226_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_226_CB1((uint)(4)).xyz * BA_Vertex_226_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_226_CB1((uint)(6)).xyz * BA_Vertex_226_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_226_CB1((uint)(7)).xyz * BA_Vertex_226_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_226_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_226_CB1((uint)(5)).xyz * BA_Vertex_226_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_226_CB1((uint)(4)).xyz * BA_Vertex_226_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_226_CB1((uint)(6)).xyz * BA_Vertex_226_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_226_CB1((uint)(7)).xyz * BA_Vertex_226_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_226_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_226_CB0((uint)(130)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_226_CB0((uint)(131)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_226_CB0((uint)(131)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_226_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_226_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_226_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_226_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_226_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_226_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_226_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_226_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_226_CB0((uint)(18)).x / BA_Vertex_226_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_226_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r2.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_226_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_226_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_226_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_226_CB0((uint)(55)).z + BA_Vertex_226_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_226_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_226_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.x = dot(v1.xyz, BA_Vertex_226_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_226_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_226_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_226_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_226_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_226_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o4.xyz = BA_Vertex_226_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_227_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_227_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 130u) value = float4(0.0, 0.0, _CrushScale, 0.0);
  if (i == 131u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_227_CB1((uint)(5)).xyz * BA_Vertex_227_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_227_CB1((uint)(4)).xyz * BA_Vertex_227_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_227_CB1((uint)(6)).xyz * BA_Vertex_227_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_227_CB1((uint)(7)).xyz * BA_Vertex_227_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_227_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_227_CB1((uint)(5)).xyz * BA_Vertex_227_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_227_CB1((uint)(4)).xyz * BA_Vertex_227_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_227_CB1((uint)(6)).xyz * BA_Vertex_227_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_227_CB1((uint)(7)).xyz * BA_Vertex_227_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_227_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_227_CB0((uint)(130)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_227_CB0((uint)(131)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_227_CB0((uint)(131)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_227_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_227_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_227_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_227_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_227_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_227_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_227_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_227_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_227_CB0((uint)(18)).x / BA_Vertex_227_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_227_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r2.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_227_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_227_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_227_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_227_CB0((uint)(55)).z + BA_Vertex_227_CB0((uint)(55)).w);
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_227_CB0((uint)(125)).xwyz * r0.xwyz;
  r2.xyz = BA_Vertex_227_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r2.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.x = dot(v1.xyz, BA_Vertex_227_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_227_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_227_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_227_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_227_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_227_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o4.xyz = BA_Vertex_227_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_228_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_228_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_228_CB1((uint)(5)).xyz * BA_Vertex_228_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_228_CB1((uint)(4)).xyz * BA_Vertex_228_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_228_CB1((uint)(6)).xyz * BA_Vertex_228_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_228_CB1((uint)(7)).xyz * BA_Vertex_228_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_228_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_228_CB1((uint)(5)).xyz * BA_Vertex_228_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_228_CB1((uint)(4)).xyz * BA_Vertex_228_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_228_CB1((uint)(6)).xyz * BA_Vertex_228_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_228_CB1((uint)(7)).xyz * BA_Vertex_228_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_228_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_228_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_228_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_228_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_228_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_228_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_228_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_228_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_228_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_228_CB0((uint)(18)).x / BA_Vertex_228_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_228_CB0((uint)(125)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_228_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_228_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_228_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_228_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_228_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.y = dot(v1.xyz, BA_Vertex_228_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_228_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_228_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_228_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_228_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_228_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_228_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_229_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_229_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_229_CB1((uint)(5)).xyz * BA_Vertex_229_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_229_CB1((uint)(4)).xyz * BA_Vertex_229_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_229_CB1((uint)(6)).xyz * BA_Vertex_229_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_229_CB1((uint)(7)).xyz * BA_Vertex_229_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_229_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_229_CB1((uint)(5)).xyz * BA_Vertex_229_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_229_CB1((uint)(4)).xyz * BA_Vertex_229_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_229_CB1((uint)(6)).xyz * BA_Vertex_229_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_229_CB1((uint)(7)).xyz * BA_Vertex_229_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_229_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_229_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_229_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_229_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_229_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_229_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_229_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_229_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_229_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_229_CB0((uint)(18)).x / BA_Vertex_229_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_229_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_229_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_229_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_229_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_229_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_229_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.y = dot(v1.xyz, BA_Vertex_229_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_229_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_229_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_229_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_229_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_229_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o3.xyz = BA_Vertex_229_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_230_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_230_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_230_CB1((uint)(5)).xyz * BA_Vertex_230_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_230_CB1((uint)(4)).xyz * BA_Vertex_230_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_230_CB1((uint)(6)).xyz * BA_Vertex_230_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_230_CB1((uint)(7)).xyz * BA_Vertex_230_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_230_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_230_CB1((uint)(5)).xyz * BA_Vertex_230_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_230_CB1((uint)(4)).xyz * BA_Vertex_230_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_230_CB1((uint)(6)).xyz * BA_Vertex_230_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_230_CB1((uint)(7)).xyz * BA_Vertex_230_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_230_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_230_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_230_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_230_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_230_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_230_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_230_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_230_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_230_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_230_CB0((uint)(18)).x / BA_Vertex_230_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_230_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_230_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_230_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_230_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_230_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_230_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_230_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.x = dot(v1.xyz, BA_Vertex_230_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_230_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_230_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_230_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_230_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_230_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o4.xyz = BA_Vertex_230_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_231_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_231_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_231_CB1((uint)(5)).xyz * BA_Vertex_231_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_231_CB1((uint)(4)).xyz * BA_Vertex_231_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_231_CB1((uint)(6)).xyz * BA_Vertex_231_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_231_CB1((uint)(7)).xyz * BA_Vertex_231_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_231_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_231_CB1((uint)(5)).xyz * BA_Vertex_231_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_231_CB1((uint)(4)).xyz * BA_Vertex_231_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_231_CB1((uint)(6)).xyz * BA_Vertex_231_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_231_CB1((uint)(7)).xyz * BA_Vertex_231_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_231_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyzw = BA_Vertex_231_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_231_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_231_CB1((uint)(2)).xyzw * v0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_231_CB1((uint)(3)).xyzw + r1.xyzw;
  r2.xyzw = BA_Vertex_231_CB0((uint)(74)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_231_CB0((uint)(73)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_231_CB0((uint)(75)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_231_CB0((uint)(76)).xyzw * r1.wwww + r2.xyzw;
  r0.z = v2.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_231_CB0((uint)(18)).x / BA_Vertex_231_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_231_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_231_CB0((uint)(126)).y + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_231_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_231_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_231_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_231_CB0((uint)(125)).xwyz * r0.xwyz;
  r1.xyz = BA_Vertex_231_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.x = dot(v1.xyz, BA_Vertex_231_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_231_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_231_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_231_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_231_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_231_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  o4.xyz = BA_Vertex_231_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_232_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_232_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 125u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 129u) value = float4(0.0, 0.0, _CrushScale, 0.0);
  if (i == 130u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_232_CB1((uint)(5)).xyz * BA_Vertex_232_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_232_CB1((uint)(4)).xyz * BA_Vertex_232_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_232_CB1((uint)(6)).xyz * BA_Vertex_232_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_232_CB1((uint)(7)).xyz * BA_Vertex_232_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_232_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_232_CB1((uint)(5)).xyz * BA_Vertex_232_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_232_CB1((uint)(4)).xyz * BA_Vertex_232_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_232_CB1((uint)(6)).xyz * BA_Vertex_232_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_232_CB1((uint)(7)).xyz * BA_Vertex_232_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_232_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_232_CB0((uint)(129)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_232_CB0((uint)(130)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_232_CB0((uint)(130)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_232_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_232_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_232_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_232_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_232_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_232_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_232_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_232_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_232_CB0((uint)(18)).x / BA_Vertex_232_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r2.xy + r0.xz;
  o0.z = BA_Vertex_232_CB0((uint)(125)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_232_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_232_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_232_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_232_CB0((uint)(124)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_232_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.y = dot(v1.xyz, BA_Vertex_232_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_232_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_232_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_232_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_232_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_232_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o3.xyz = BA_Vertex_232_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_233_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_233_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 130u) value = float4(0.0, 0.0, _CrushScale, 0.0);
  if (i == 131u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float3 p2 : NORMAL0,
  out float3 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;
  o3 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_233_CB1((uint)(5)).xyz * BA_Vertex_233_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_233_CB1((uint)(4)).xyz * BA_Vertex_233_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_233_CB1((uint)(6)).xyz * BA_Vertex_233_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_233_CB1((uint)(7)).xyz * BA_Vertex_233_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_233_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_233_CB1((uint)(5)).xyz * BA_Vertex_233_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_233_CB1((uint)(4)).xyz * BA_Vertex_233_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_233_CB1((uint)(6)).xyz * BA_Vertex_233_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_233_CB1((uint)(7)).xyz * BA_Vertex_233_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_233_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_233_CB0((uint)(130)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_233_CB0((uint)(131)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_233_CB0((uint)(131)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_233_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_233_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_233_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_233_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_233_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_233_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_233_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_233_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_233_CB0((uint)(18)).x / BA_Vertex_233_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r2.xy + r0.xz;
  o0.z = BA_Vertex_233_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_233_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_233_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_233_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_233_CB0((uint)(125)).xwyz * r0.xwyz;
  r2.xyz = BA_Vertex_233_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r2.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.y = dot(v1.xyz, BA_Vertex_233_CB1((uint)(4)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_233_CB1((uint)(5)).xyz);
  r0.w = dot(v1.xyz, BA_Vertex_233_CB1((uint)(6)).xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  p2.xyz = r0.yzw * r0.xxx;
  r0.xyz = BA_Vertex_233_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_233_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_233_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o3.xyz = BA_Vertex_233_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_234_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_234_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 130u) value = float4(0.0, 0.0, _CrushScale, 0.0);
  if (i == 131u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_234_CB1((uint)(5)).xyz * BA_Vertex_234_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_234_CB1((uint)(4)).xyz * BA_Vertex_234_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_234_CB1((uint)(6)).xyz * BA_Vertex_234_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_234_CB1((uint)(7)).xyz * BA_Vertex_234_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_234_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_234_CB1((uint)(5)).xyz * BA_Vertex_234_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_234_CB1((uint)(4)).xyz * BA_Vertex_234_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_234_CB1((uint)(6)).xyz * BA_Vertex_234_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_234_CB1((uint)(7)).xyz * BA_Vertex_234_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_234_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_234_CB0((uint)(130)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_234_CB0((uint)(131)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_234_CB0((uint)(131)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_234_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_234_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_234_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_234_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_234_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_234_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_234_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_234_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_234_CB0((uint)(18)).x / BA_Vertex_234_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_234_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r2.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_234_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_234_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_234_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_234_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_234_CB0((uint)(125)).xyzw * r0.xyzw;
  o1.xyz = BA_Vertex_234_CB0((uint)(6)).xyz * r0.xyz;
  o1.w = r0.w;
  r0.x = dot(v1.xyz, BA_Vertex_234_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_234_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_234_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_234_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_234_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_234_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o4.xyz = BA_Vertex_234_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_235_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value;
}

float4 BA_Vertex_235_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 57u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 58u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 65u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 66u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 125u) value = float4(_OutlineTint.x, _OutlineTint.y, _OutlineTint.z, _OutlineTint.w);
  if (i == 126u) value = float4(0.0, _OutlineZCorrection, 0.0, 0.0);
  if (i == 130u) value = float4(0.0, 0.0, _CrushScale, 0.0);
  if (i == 131u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TANGENT0,
  float2 v4 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float2 o2 : TEXCOORD0,
  out float3 o3 : NORMAL0,
  out float3 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_235_CB1((uint)(5)).xyz * BA_Vertex_235_CB0((uint)(65)).yyy;
  r0.xyz = BA_Vertex_235_CB1((uint)(4)).xyz * BA_Vertex_235_CB0((uint)(65)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_235_CB1((uint)(6)).xyz * BA_Vertex_235_CB0((uint)(65)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_235_CB1((uint)(7)).xyz * BA_Vertex_235_CB0((uint)(65)).www + r0.xyz;
  r0.x = dot(r0.xyz, v3.xyz);
  r0.x = BA_Vertex_235_CB0((uint)(57)).x * r0.x;
  r1.xyz = BA_Vertex_235_CB1((uint)(5)).xyz * BA_Vertex_235_CB0((uint)(66)).yyy;
  r1.xyz = BA_Vertex_235_CB1((uint)(4)).xyz * BA_Vertex_235_CB0((uint)(66)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_235_CB1((uint)(6)).xyz * BA_Vertex_235_CB0((uint)(66)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_235_CB1((uint)(7)).xyz * BA_Vertex_235_CB0((uint)(66)).www + r1.xyz;
  r0.z = dot(r1.xyz, v3.xyz);
  r0.y = BA_Vertex_235_CB0((uint)(58)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r0.zw = BA_Vertex_235_CB0((uint)(130)).zz * v0.xz;
  r1.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.zw, 0).xyzw;
  r0.z = r1.x * 2 + -1;
  r1.xyz = BA_Vertex_235_CB0((uint)(131)).xyz * r0.zzz;
  r1.xyz = BA_Vertex_235_CB0((uint)(131)).www * r1.xyz;
  r1.xyz = r1.xyz * v0.zzz + v0.xyz;
  r2.xyzw = BA_Vertex_235_CB1((uint)(1)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_235_CB1((uint)(0)).xyzw * r1.xxxx + r2.xyzw;
  r2.xyzw = BA_Vertex_235_CB1((uint)(2)).xyzw * r1.zzzz + r2.xyzw;
  r2.xyzw = BA_Vertex_235_CB1((uint)(3)).xyzw + r2.xyzw;
  r3.xyzw = BA_Vertex_235_CB0((uint)(74)).xyzw * r2.yyyy;
  r3.xyzw = BA_Vertex_235_CB0((uint)(73)).xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = BA_Vertex_235_CB0((uint)(75)).xyzw * r2.zzzz + r3.xyzw;
  r2.xyzw = BA_Vertex_235_CB0((uint)(76)).xyzw * r2.wwww + r3.xyzw;
  r0.z = v2.w * r2.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_235_CB0((uint)(18)).x / BA_Vertex_235_CB0((uint)(18)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r2.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_235_CB0((uint)(17)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r2.w;
  o2.y = 0.5 + r0.x;
  o0.z = BA_Vertex_235_CB0((uint)(126)).y + r2.z;
  o0.w = r2.w;
  r0.x = r2.z / BA_Vertex_235_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_235_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_235_CB0((uint)(55)).x * r0.x;
  r0.xyzw = _mainTex.SampleLevel(sampler_mainTex, v4.xy, 0).xyzw;
  r0.xyzw = BA_Vertex_235_CB0((uint)(125)).xwyz * r0.xwyz;
  r2.xyz = BA_Vertex_235_CB0((uint)(6)).xyz * r0.xzw;
  r0.x = dot(r2.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.xyzw = r0.xxxy;
  r0.x = dot(v1.xyz, BA_Vertex_235_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_235_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_235_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  r0.xyz = BA_Vertex_235_CB1((uint)(1)).xyz * r1.yyy;
  r0.xyz = BA_Vertex_235_CB1((uint)(0)).xyz * r1.xxx + r0.xyz;
  r0.xyz = BA_Vertex_235_CB1((uint)(2)).xyz * r1.zzz + r0.xyz;
  o4.xyz = BA_Vertex_235_CB1((uint)(3)).xyz + r0.xyz;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_255_CB0(uint i)
{
  float4 value = 0;
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_255_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_256_CB0(uint i)
{
  float4 value = 0;
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_256_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_259_CB0(uint i)
{
  float4 value = 0;
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_259_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_260_CB0(uint i)
{
  float4 value = 0;
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_260_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_261_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = -BA_Fragment_261_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_261_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_262_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = -BA_Fragment_262_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_262_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_263_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_263_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_263_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_263_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_264_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_264_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_264_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_264_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_265_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = -BA_Fragment_265_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_265_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_266_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = -BA_Fragment_266_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_266_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_267_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_267_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_267_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_267_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_268_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_268_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_268_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_268_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_269_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_269_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_269_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_270_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_270_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_270_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_271_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_271_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_271_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_271_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_272_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_272_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_272_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_272_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_273_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_273_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_273_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_274_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_274_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_274_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_275_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_275_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_275_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_275_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_276_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_276_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_276_CB0((uint)(56)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_276_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_277_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 126u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 127u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_277_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_277_CB0((uint)(16)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_277_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_277_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_277_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_277_CB0((uint)(127)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_277_CB0((uint)(126)).xyz * r0.yyy;
  r1.y = BA_Fragment_277_CB0((uint)(127)).w * BA_Fragment_277_CB0((uint)(127)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_278_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_278_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_278_CB0((uint)(16)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_278_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_278_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_278_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_278_CB0((uint)(128)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_278_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_278_CB0((uint)(128)).w * BA_Fragment_278_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_279_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_279_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_279_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_279_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_279_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_279_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_279_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_279_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_279_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_279_CB0((uint)(128)).w * BA_Fragment_279_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_280_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_280_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_280_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_280_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_280_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_280_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_280_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_280_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_280_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_280_CB0((uint)(128)).w * BA_Fragment_280_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_281_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 126u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 127u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_281_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_281_CB0((uint)(16)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_281_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_281_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_281_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_281_CB0((uint)(127)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_281_CB0((uint)(126)).xyz * r0.yyy;
  r1.y = BA_Fragment_281_CB0((uint)(127)).w * BA_Fragment_281_CB0((uint)(127)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_282_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_282_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_282_CB0((uint)(16)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_282_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_282_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_282_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_282_CB0((uint)(128)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_282_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_282_CB0((uint)(128)).w * BA_Fragment_282_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_283_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_283_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_283_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_283_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_283_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_283_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_283_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_283_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_283_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_283_CB0((uint)(128)).w * BA_Fragment_283_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_284_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_284_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_284_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_284_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_284_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_284_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_284_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_284_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_284_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_284_CB0((uint)(128)).w * BA_Fragment_284_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_285_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 126u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 127u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_285_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_285_CB0((uint)(16)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_285_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_285_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_285_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_285_CB0((uint)(127)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_285_CB0((uint)(126)).xyz * r0.yyy;
  r1.y = BA_Fragment_285_CB0((uint)(127)).w * BA_Fragment_285_CB0((uint)(127)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_285_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_285_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_286_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_286_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_286_CB0((uint)(16)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_286_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_286_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_286_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_286_CB0((uint)(128)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_286_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_286_CB0((uint)(128)).w * BA_Fragment_286_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_286_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_286_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_287_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_287_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_287_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_287_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_287_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_287_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_287_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_287_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_287_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_287_CB0((uint)(128)).w * BA_Fragment_287_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_287_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_287_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_288_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_288_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_288_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_288_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_288_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_288_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_288_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_288_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_288_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_288_CB0((uint)(128)).w * BA_Fragment_288_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_288_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_288_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_289_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 126u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 127u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_289_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_289_CB0((uint)(16)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_289_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_289_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_289_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_289_CB0((uint)(127)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_289_CB0((uint)(126)).xyz * r0.yyy;
  r1.y = BA_Fragment_289_CB0((uint)(127)).w * BA_Fragment_289_CB0((uint)(127)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_289_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_289_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_290_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_290_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_290_CB0((uint)(16)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_290_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_290_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_290_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_290_CB0((uint)(128)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_290_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_290_CB0((uint)(128)).w * BA_Fragment_290_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_290_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_290_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_291_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_291_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_291_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_291_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_291_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_291_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_291_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_291_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_291_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_291_CB0((uint)(128)).w * BA_Fragment_291_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_291_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_291_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_292_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_292_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_292_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_292_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_292_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_292_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_292_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_292_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_292_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_292_CB0((uint)(128)).w * BA_Fragment_292_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_292_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_292_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_293_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 126u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 127u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_293_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_293_CB0((uint)(16)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_293_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_293_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_293_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_293_CB0((uint)(127)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_293_CB0((uint)(126)).xyz * r0.yyy;
  r1.y = BA_Fragment_293_CB0((uint)(127)).w * BA_Fragment_293_CB0((uint)(127)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_293_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_293_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_294_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_294_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_294_CB0((uint)(16)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_294_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_294_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_294_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_294_CB0((uint)(128)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_294_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_294_CB0((uint)(128)).w * BA_Fragment_294_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_294_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_294_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_295_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_295_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_295_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_295_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_295_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_295_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_295_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_295_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_295_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_295_CB0((uint)(128)).w * BA_Fragment_295_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_295_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_295_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_296_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_296_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_296_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_296_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_296_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_296_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_296_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_296_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_296_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_296_CB0((uint)(128)).w * BA_Fragment_296_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_296_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_296_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_297_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 126u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 127u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_297_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_297_CB0((uint)(16)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_297_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_297_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_297_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_297_CB0((uint)(127)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_297_CB0((uint)(126)).xyz * r0.yyy;
  r1.y = BA_Fragment_297_CB0((uint)(127)).w * BA_Fragment_297_CB0((uint)(127)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_297_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_297_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_298_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(BA_Fragment_298_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_298_CB0((uint)(16)).xyz + -v3.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_298_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_298_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_298_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-w2.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_298_CB0((uint)(128)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_298_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_298_CB0((uint)(128)).w * BA_Fragment_298_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_298_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_298_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_299_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_299_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_299_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_299_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_299_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_299_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_299_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_299_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_299_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_299_CB0((uint)(128)).w * BA_Fragment_299_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_299_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_299_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(OUTLINE_RIM_LIGHT_POINT) && !defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_300_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_300_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = cmp(BA_Fragment_300_CB0((uint)(21)).w == 0.000000);
  r0.yzw = BA_Fragment_300_CB0((uint)(16)).xyz + -v4.xyz;
  r1.x = r0.x ? r0.y : BA_Fragment_300_CB0((uint)(61)).z;
  r1.y = r0.x ? r0.z : BA_Fragment_300_CB0((uint)(62)).z;
  r1.z = r0.x ? r0.w : BA_Fragment_300_CB0((uint)(63)).z;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  r0.x = saturate(dot(-v3.xyz, r0.xyz));
  r0.x = 1 + -r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r0.x;
  r0.yzw = BA_Fragment_300_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_300_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = BA_Fragment_300_CB0((uint)(128)).w * BA_Fragment_300_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.yzw = r1.xxx * r0.yzw;
  r0.xyz = r0.yzw * r0.xxx + v1.xyz;
  r0.xyz = -BA_Fragment_300_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_300_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_301_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 126u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 127u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 128u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 129u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_301_CB0((uint)(129)).x + -BA_Fragment_301_CB0((uint)(129)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_301_CB0((uint)(127)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_301_CB0((uint)(128)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_301_CB0((uint)(126)).xyz * r0.yyy;
  r1.y = -BA_Fragment_301_CB0((uint)(129)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_301_CB0((uint)(127)).w * BA_Fragment_301_CB0((uint)(127)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_301_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_301_CB0((uint)(16)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_301_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_301_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_301_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_302_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_302_CB0((uint)(130)).x + -BA_Fragment_302_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_302_CB0((uint)(128)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_302_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_302_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_302_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_302_CB0((uint)(128)).w * BA_Fragment_302_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_302_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_302_CB0((uint)(16)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_302_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_302_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_302_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_303_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_303_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_303_CB0((uint)(130)).x + -BA_Fragment_303_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_303_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_303_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_303_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_303_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_303_CB0((uint)(128)).w * BA_Fragment_303_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_303_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_303_CB0((uint)(16)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_303_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_303_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_303_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_304_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_304_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_304_CB0((uint)(130)).x + -BA_Fragment_304_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_304_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_304_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_304_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_304_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_304_CB0((uint)(128)).w * BA_Fragment_304_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_304_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_304_CB0((uint)(16)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_304_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_304_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_304_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_305_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 126u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 127u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 128u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 129u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_305_CB0((uint)(129)).x + -BA_Fragment_305_CB0((uint)(129)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_305_CB0((uint)(127)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_305_CB0((uint)(128)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_305_CB0((uint)(126)).xyz * r0.yyy;
  r1.y = -BA_Fragment_305_CB0((uint)(129)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_305_CB0((uint)(127)).w * BA_Fragment_305_CB0((uint)(127)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_305_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_305_CB0((uint)(16)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_305_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_305_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_305_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_306_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_306_CB0((uint)(130)).x + -BA_Fragment_306_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_306_CB0((uint)(128)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_306_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_306_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_306_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_306_CB0((uint)(128)).w * BA_Fragment_306_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_306_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_306_CB0((uint)(16)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_306_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_306_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_306_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_307_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_307_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_307_CB0((uint)(130)).x + -BA_Fragment_307_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_307_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_307_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_307_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_307_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_307_CB0((uint)(128)).w * BA_Fragment_307_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_307_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_307_CB0((uint)(16)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_307_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_307_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_307_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_308_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_308_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_308_CB0((uint)(130)).x + -BA_Fragment_308_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_308_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_308_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_308_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_308_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_308_CB0((uint)(128)).w * BA_Fragment_308_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_308_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_308_CB0((uint)(16)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_308_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_308_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_308_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www + v1.xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_309_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 126u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 127u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 128u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 129u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_309_CB0((uint)(129)).x + -BA_Fragment_309_CB0((uint)(129)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_309_CB0((uint)(127)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_309_CB0((uint)(128)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_309_CB0((uint)(126)).xyz * r0.yyy;
  r1.y = -BA_Fragment_309_CB0((uint)(129)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_309_CB0((uint)(127)).w * BA_Fragment_309_CB0((uint)(127)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_309_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_309_CB0((uint)(16)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_309_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_309_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_309_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_309_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_309_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_310_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_310_CB0((uint)(130)).x + -BA_Fragment_310_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_310_CB0((uint)(128)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_310_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_310_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_310_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_310_CB0((uint)(128)).w * BA_Fragment_310_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_310_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_310_CB0((uint)(16)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_310_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_310_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_310_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_310_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_310_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_311_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_311_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_311_CB0((uint)(130)).x + -BA_Fragment_311_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_311_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_311_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_311_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_311_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_311_CB0((uint)(128)).w * BA_Fragment_311_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_311_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_311_CB0((uint)(16)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_311_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_311_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_311_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_311_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_311_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_312_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_312_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_312_CB0((uint)(130)).x + -BA_Fragment_312_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_312_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_312_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_312_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_312_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_312_CB0((uint)(128)).w * BA_Fragment_312_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_312_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_312_CB0((uint)(16)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_312_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_312_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_312_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_312_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_312_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_313_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 126u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 127u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 128u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 129u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_313_CB0((uint)(129)).x + -BA_Fragment_313_CB0((uint)(129)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_313_CB0((uint)(127)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_313_CB0((uint)(128)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_313_CB0((uint)(126)).xyz * r0.yyy;
  r1.y = -BA_Fragment_313_CB0((uint)(129)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_313_CB0((uint)(127)).w * BA_Fragment_313_CB0((uint)(127)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_313_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_313_CB0((uint)(16)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_313_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_313_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_313_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_313_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_313_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_314_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_314_CB0((uint)(130)).x + -BA_Fragment_314_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_314_CB0((uint)(128)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_314_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_314_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_314_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_314_CB0((uint)(128)).w * BA_Fragment_314_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_314_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_314_CB0((uint)(16)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_314_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_314_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_314_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_314_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_314_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_315_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_315_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_315_CB0((uint)(130)).x + -BA_Fragment_315_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_315_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_315_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_315_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_315_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_315_CB0((uint)(128)).w * BA_Fragment_315_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_315_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_315_CB0((uint)(16)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_315_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_315_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_315_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_315_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_315_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_316_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_316_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_316_CB0((uint)(130)).x + -BA_Fragment_316_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_316_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_316_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_316_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_316_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_316_CB0((uint)(128)).w * BA_Fragment_316_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_316_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_316_CB0((uint)(16)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_316_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_316_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_316_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_316_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_316_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_317_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 126u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 127u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 128u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 129u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_317_CB0((uint)(129)).x + -BA_Fragment_317_CB0((uint)(129)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_317_CB0((uint)(127)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_317_CB0((uint)(128)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_317_CB0((uint)(126)).xyz * r0.yyy;
  r1.y = -BA_Fragment_317_CB0((uint)(129)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_317_CB0((uint)(127)).w * BA_Fragment_317_CB0((uint)(127)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_317_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_317_CB0((uint)(16)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_317_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_317_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_317_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_317_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_317_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_318_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_318_CB0((uint)(130)).x + -BA_Fragment_318_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_318_CB0((uint)(128)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_318_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_318_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_318_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_318_CB0((uint)(128)).w * BA_Fragment_318_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_318_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_318_CB0((uint)(16)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_318_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_318_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_318_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_318_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_318_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_319_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_319_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_319_CB0((uint)(130)).x + -BA_Fragment_319_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_319_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_319_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_319_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_319_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_319_CB0((uint)(128)).w * BA_Fragment_319_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_319_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_319_CB0((uint)(16)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_319_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_319_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_319_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_319_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_319_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_320_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_320_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_320_CB0((uint)(130)).x + -BA_Fragment_320_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_320_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_320_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_320_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_320_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_320_CB0((uint)(128)).w * BA_Fragment_320_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_320_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_320_CB0((uint)(16)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_320_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_320_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_320_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_320_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_320_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_321_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 126u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 127u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 128u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 129u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_321_CB0((uint)(129)).x + -BA_Fragment_321_CB0((uint)(129)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_321_CB0((uint)(127)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_321_CB0((uint)(128)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_321_CB0((uint)(126)).xyz * r0.yyy;
  r1.y = -BA_Fragment_321_CB0((uint)(129)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_321_CB0((uint)(127)).w * BA_Fragment_321_CB0((uint)(127)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_321_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_321_CB0((uint)(16)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_321_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_321_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_321_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_321_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_321_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_322_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float3 w2 : NORMAL0,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_322_CB0((uint)(130)).x + -BA_Fragment_322_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_322_CB0((uint)(128)).xyz + -v3.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_322_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(w2.xyz, r0.yzw));
  r0.yzw = BA_Fragment_322_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_322_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_322_CB0((uint)(128)).w * BA_Fragment_322_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_322_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_322_CB0((uint)(16)).xyz + -v3.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_322_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_322_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_322_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-w2.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_322_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_322_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_323_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_323_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_323_CB0((uint)(130)).x + -BA_Fragment_323_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_323_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_323_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_323_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_323_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_323_CB0((uint)(128)).w * BA_Fragment_323_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_323_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_323_CB0((uint)(16)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_323_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_323_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_323_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_323_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_323_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(OUTLINE_RIM_LIGHT_POINT) && defined(OUTLINE_RIM_LIGHT_SPOT) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_324_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  if (i == 127u) value = float4(_MxOutlineRimLightColor.x, _MxOutlineRimLightColor.y, _MxOutlineRimLightColor.z, _MxOutlineRimLightColor.w);
  if (i == 128u) value = float4(_MxOutRimLightPosRange.x, _MxOutRimLightPosRange.y, _MxOutRimLightPosRange.z, _MxOutRimLightPosRange.w);
  if (i == 129u) value = float4(_MxOutRimLightDir.x, _MxOutRimLightDir.y, _MxOutRimLightDir.z, 0.0);
  if (i == 130u) value = float4(_MxOutlineRimLightSpotAngle.x, _MxOutlineRimLightSpotAngle.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float3 v3 : NORMAL0,
  float3 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v2.y;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_324_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = BA_Fragment_324_CB0((uint)(130)).x + -BA_Fragment_324_CB0((uint)(130)).y;
  r0.x = 1 / r0.x;
  r0.yzw = BA_Fragment_324_CB0((uint)(128)).xyz + -v4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.y = rsqrt(r1.x);
  r0.yzw = r1.yyy * r0.yzw;
  r1.y = dot(r0.yzw, BA_Fragment_324_CB0((uint)(129)).xyz);
  r0.y = saturate(dot(v3.xyz, r0.yzw));
  r0.yzw = BA_Fragment_324_CB0((uint)(127)).xyz * r0.yyy;
  r1.y = -BA_Fragment_324_CB0((uint)(130)).y + r1.y;
  r0.x = saturate(r1.y * r0.x);
  r1.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.y * r0.x;
  r1.y = BA_Fragment_324_CB0((uint)(128)).w * BA_Fragment_324_CB0((uint)(128)).w;
  r1.x = r1.x / r1.y;
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = r1.x * r1.x;
  r0.x = r1.x * r0.x;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = cmp(BA_Fragment_324_CB0((uint)(21)).w == 0.000000);
  r1.xyz = BA_Fragment_324_CB0((uint)(16)).xyz + -v4.xyz;
  r2.x = r0.w ? r1.x : BA_Fragment_324_CB0((uint)(61)).z;
  r2.y = r0.w ? r1.y : BA_Fragment_324_CB0((uint)(62)).z;
  r2.z = r0.w ? r1.z : BA_Fragment_324_CB0((uint)(63)).z;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.w = saturate(dot(-v3.xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * r0.w;
  r0.xyz = r0.xyz * r0.www + v1.xyz;
  r0.xyz = -BA_Fragment_324_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.x);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_324_CB0((uint)(56)).xyz;
  o0.w = v1.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
