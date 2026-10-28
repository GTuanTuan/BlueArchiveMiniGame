// Exact names and types from the original compiled parameter metadata.
float _Cutoff;
float _DitherThreshold;
float4 _OutlineSolidColorTint;
float _OutlineZCorrection;
Texture2D<float4> _MainTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_224_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_224_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_224_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_224_CB1((uint)(5)).xyz * BA_Vertex_224_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_224_CB1((uint)(4)).xyz * BA_Vertex_224_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_224_CB1((uint)(6)).xyz * BA_Vertex_224_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_224_CB1((uint)(7)).xyz * BA_Vertex_224_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_224_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_224_CB1((uint)(5)).xyz * BA_Vertex_224_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_224_CB1((uint)(4)).xyz * BA_Vertex_224_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_224_CB1((uint)(6)).xyz * BA_Vertex_224_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_224_CB1((uint)(7)).xyz * BA_Vertex_224_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_224_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_224_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_224_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_224_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_224_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_224_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_224_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_224_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_224_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_224_CB0((uint)(22)).x / BA_Vertex_224_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_224_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  o1.xyz = BA_Vertex_224_CB2((uint)(3)).xyz * BA_Vertex_224_CB0((uint)(10)).xyz;
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_225_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_225_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_225_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_225_CB1((uint)(5)).xyz * BA_Vertex_225_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_225_CB1((uint)(4)).xyz * BA_Vertex_225_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_225_CB1((uint)(6)).xyz * BA_Vertex_225_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_225_CB1((uint)(7)).xyz * BA_Vertex_225_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_225_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_225_CB1((uint)(5)).xyz * BA_Vertex_225_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_225_CB1((uint)(4)).xyz * BA_Vertex_225_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_225_CB1((uint)(6)).xyz * BA_Vertex_225_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_225_CB1((uint)(7)).xyz * BA_Vertex_225_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_225_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_225_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_225_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_225_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_225_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_225_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_225_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_225_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_225_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_225_CB0((uint)(22)).x / BA_Vertex_225_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_225_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  o1.xyz = BA_Vertex_225_CB2((uint)(3)).xyz * BA_Vertex_225_CB0((uint)(10)).xyz;
  o1.w = 1;
  o2.x = 0;
  p2.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_226_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_226_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_226_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_226_CB1((uint)(5)).xyz * BA_Vertex_226_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_226_CB1((uint)(4)).xyz * BA_Vertex_226_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_226_CB1((uint)(6)).xyz * BA_Vertex_226_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_226_CB1((uint)(7)).xyz * BA_Vertex_226_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_226_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_226_CB1((uint)(5)).xyz * BA_Vertex_226_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_226_CB1((uint)(4)).xyz * BA_Vertex_226_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_226_CB1((uint)(6)).xyz * BA_Vertex_226_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_226_CB1((uint)(7)).xyz * BA_Vertex_226_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_226_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_226_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_226_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_226_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_226_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_226_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_226_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_226_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_226_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_226_CB0((uint)(22)).x / BA_Vertex_226_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_226_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyz = BA_Vertex_226_CB2((uint)(3)).xyz * BA_Vertex_226_CB0((uint)(10)).xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_227_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_227_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_227_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_227_CB1((uint)(5)).xyz * BA_Vertex_227_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_227_CB1((uint)(4)).xyz * BA_Vertex_227_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_227_CB1((uint)(6)).xyz * BA_Vertex_227_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_227_CB1((uint)(7)).xyz * BA_Vertex_227_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_227_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_227_CB1((uint)(5)).xyz * BA_Vertex_227_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_227_CB1((uint)(4)).xyz * BA_Vertex_227_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_227_CB1((uint)(6)).xyz * BA_Vertex_227_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_227_CB1((uint)(7)).xyz * BA_Vertex_227_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_227_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_227_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_227_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_227_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_227_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_227_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_227_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_227_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_227_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_227_CB0((uint)(22)).x / BA_Vertex_227_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_227_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyz = BA_Vertex_227_CB2((uint)(3)).xyz * BA_Vertex_227_CB0((uint)(10)).xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  p2.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_228_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_228_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_228_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_228_CB1((uint)(5)).xyz * BA_Vertex_228_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_228_CB1((uint)(4)).xyz * BA_Vertex_228_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_228_CB1((uint)(6)).xyz * BA_Vertex_228_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_228_CB1((uint)(7)).xyz * BA_Vertex_228_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_228_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_228_CB1((uint)(5)).xyz * BA_Vertex_228_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_228_CB1((uint)(4)).xyz * BA_Vertex_228_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_228_CB1((uint)(6)).xyz * BA_Vertex_228_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_228_CB1((uint)(7)).xyz * BA_Vertex_228_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_228_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_228_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_228_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_228_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_228_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_228_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_228_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_228_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_228_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_228_CB0((uint)(22)).x / BA_Vertex_228_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_228_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_228_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  o1.xyz = BA_Vertex_228_CB2((uint)(3)).xyz * BA_Vertex_228_CB0((uint)(10)).xyz;
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_229_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_229_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_229_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_229_CB1((uint)(5)).xyz * BA_Vertex_229_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_229_CB1((uint)(4)).xyz * BA_Vertex_229_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_229_CB1((uint)(6)).xyz * BA_Vertex_229_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_229_CB1((uint)(7)).xyz * BA_Vertex_229_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_229_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_229_CB1((uint)(5)).xyz * BA_Vertex_229_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_229_CB1((uint)(4)).xyz * BA_Vertex_229_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_229_CB1((uint)(6)).xyz * BA_Vertex_229_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_229_CB1((uint)(7)).xyz * BA_Vertex_229_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_229_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_229_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_229_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_229_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_229_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_229_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_229_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_229_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_229_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_229_CB0((uint)(22)).x / BA_Vertex_229_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_229_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_229_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  o1.xyz = BA_Vertex_229_CB2((uint)(3)).xyz * BA_Vertex_229_CB0((uint)(10)).xyz;
  o1.w = 1;
  BA_o2_x.x = 0;
  BA_o2_zw.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_230_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_230_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_230_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_230_CB1((uint)(5)).xyz * BA_Vertex_230_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_230_CB1((uint)(4)).xyz * BA_Vertex_230_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_230_CB1((uint)(6)).xyz * BA_Vertex_230_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_230_CB1((uint)(7)).xyz * BA_Vertex_230_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_230_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_230_CB1((uint)(5)).xyz * BA_Vertex_230_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_230_CB1((uint)(4)).xyz * BA_Vertex_230_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_230_CB1((uint)(6)).xyz * BA_Vertex_230_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_230_CB1((uint)(7)).xyz * BA_Vertex_230_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_230_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_230_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_230_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_230_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_230_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_230_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_230_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_230_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_230_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_230_CB0((uint)(22)).x / BA_Vertex_230_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_230_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_230_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyz = BA_Vertex_230_CB2((uint)(3)).xyz * BA_Vertex_230_CB0((uint)(10)).xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  o2.x = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_231_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_231_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_231_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_231_CB1((uint)(5)).xyz * BA_Vertex_231_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_231_CB1((uint)(4)).xyz * BA_Vertex_231_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_231_CB1((uint)(6)).xyz * BA_Vertex_231_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_231_CB1((uint)(7)).xyz * BA_Vertex_231_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_231_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_231_CB1((uint)(5)).xyz * BA_Vertex_231_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_231_CB1((uint)(4)).xyz * BA_Vertex_231_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_231_CB1((uint)(6)).xyz * BA_Vertex_231_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_231_CB1((uint)(7)).xyz * BA_Vertex_231_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_231_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_231_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_231_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_231_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_231_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_231_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_231_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_231_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_231_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_231_CB0((uint)(22)).x / BA_Vertex_231_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_231_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_231_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.xyz = BA_Vertex_231_CB2((uint)(3)).xyz * BA_Vertex_231_CB0((uint)(10)).xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  BA_o2_x.x = 0;
  BA_o2_zw.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_232_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_232_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_232_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_232_CB1((uint)(5)).xyz * BA_Vertex_232_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_232_CB1((uint)(4)).xyz * BA_Vertex_232_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_232_CB1((uint)(6)).xyz * BA_Vertex_232_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_232_CB1((uint)(7)).xyz * BA_Vertex_232_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_232_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_232_CB1((uint)(5)).xyz * BA_Vertex_232_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_232_CB1((uint)(4)).xyz * BA_Vertex_232_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_232_CB1((uint)(6)).xyz * BA_Vertex_232_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_232_CB1((uint)(7)).xyz * BA_Vertex_232_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_232_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_232_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_232_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_232_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_232_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_232_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_232_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_232_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_232_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_232_CB0((uint)(22)).x / BA_Vertex_232_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_232_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_232_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_232_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_232_CB0((uint)(59)).z + BA_Vertex_232_CB0((uint)(59)).w);
  o1.xyz = BA_Vertex_232_CB2((uint)(3)).xyz * BA_Vertex_232_CB0((uint)(10)).xyz;
  o1.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_233_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_233_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_233_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_233_CB1((uint)(5)).xyz * BA_Vertex_233_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_233_CB1((uint)(4)).xyz * BA_Vertex_233_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_233_CB1((uint)(6)).xyz * BA_Vertex_233_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_233_CB1((uint)(7)).xyz * BA_Vertex_233_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_233_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_233_CB1((uint)(5)).xyz * BA_Vertex_233_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_233_CB1((uint)(4)).xyz * BA_Vertex_233_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_233_CB1((uint)(6)).xyz * BA_Vertex_233_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_233_CB1((uint)(7)).xyz * BA_Vertex_233_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_233_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_233_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_233_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_233_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_233_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_233_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_233_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_233_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_233_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_233_CB0((uint)(22)).x / BA_Vertex_233_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_233_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_233_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_233_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_233_CB0((uint)(59)).z + BA_Vertex_233_CB0((uint)(59)).w);
  o1.xyz = BA_Vertex_233_CB2((uint)(3)).xyz * BA_Vertex_233_CB0((uint)(10)).xyz;
  o1.w = 1;
  p2.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_234_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_234_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_234_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_234_CB1((uint)(5)).xyz * BA_Vertex_234_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_234_CB1((uint)(4)).xyz * BA_Vertex_234_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_234_CB1((uint)(6)).xyz * BA_Vertex_234_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_234_CB1((uint)(7)).xyz * BA_Vertex_234_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_234_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_234_CB1((uint)(5)).xyz * BA_Vertex_234_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_234_CB1((uint)(4)).xyz * BA_Vertex_234_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_234_CB1((uint)(6)).xyz * BA_Vertex_234_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_234_CB1((uint)(7)).xyz * BA_Vertex_234_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_234_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_234_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_234_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_234_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_234_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_234_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_234_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_234_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_234_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_234_CB0((uint)(22)).x / BA_Vertex_234_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_234_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_234_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_234_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_234_CB0((uint)(59)).z + BA_Vertex_234_CB0((uint)(59)).w);
  r0.xyz = BA_Vertex_234_CB2((uint)(3)).xyz * BA_Vertex_234_CB0((uint)(10)).xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_235_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_235_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_235_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_235_CB1((uint)(5)).xyz * BA_Vertex_235_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_235_CB1((uint)(4)).xyz * BA_Vertex_235_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_235_CB1((uint)(6)).xyz * BA_Vertex_235_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_235_CB1((uint)(7)).xyz * BA_Vertex_235_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_235_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_235_CB1((uint)(5)).xyz * BA_Vertex_235_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_235_CB1((uint)(4)).xyz * BA_Vertex_235_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_235_CB1((uint)(6)).xyz * BA_Vertex_235_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_235_CB1((uint)(7)).xyz * BA_Vertex_235_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_235_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_235_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_235_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_235_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_235_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_235_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_235_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_235_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_235_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_235_CB0((uint)(22)).x / BA_Vertex_235_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_235_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_235_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_235_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_235_CB0((uint)(59)).z + BA_Vertex_235_CB0((uint)(59)).w);
  r0.xyz = BA_Vertex_235_CB2((uint)(3)).xyz * BA_Vertex_235_CB0((uint)(10)).xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  p2.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_236_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_236_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_236_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_236_CB1((uint)(5)).xyz * BA_Vertex_236_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_236_CB1((uint)(4)).xyz * BA_Vertex_236_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_236_CB1((uint)(6)).xyz * BA_Vertex_236_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_236_CB1((uint)(7)).xyz * BA_Vertex_236_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_236_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_236_CB1((uint)(5)).xyz * BA_Vertex_236_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_236_CB1((uint)(4)).xyz * BA_Vertex_236_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_236_CB1((uint)(6)).xyz * BA_Vertex_236_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_236_CB1((uint)(7)).xyz * BA_Vertex_236_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_236_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_236_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_236_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_236_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_236_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_236_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_236_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_236_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_236_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_236_CB0((uint)(22)).x / BA_Vertex_236_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_236_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_236_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_236_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_236_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_236_CB0((uint)(59)).z + BA_Vertex_236_CB0((uint)(59)).w);
  o1.xyz = BA_Vertex_236_CB2((uint)(3)).xyz * BA_Vertex_236_CB0((uint)(10)).xyz;
  o1.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_237_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_237_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_237_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_237_CB1((uint)(5)).xyz * BA_Vertex_237_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_237_CB1((uint)(4)).xyz * BA_Vertex_237_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_237_CB1((uint)(6)).xyz * BA_Vertex_237_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_237_CB1((uint)(7)).xyz * BA_Vertex_237_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_237_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_237_CB1((uint)(5)).xyz * BA_Vertex_237_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_237_CB1((uint)(4)).xyz * BA_Vertex_237_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_237_CB1((uint)(6)).xyz * BA_Vertex_237_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_237_CB1((uint)(7)).xyz * BA_Vertex_237_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_237_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_237_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_237_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_237_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_237_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_237_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_237_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_237_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_237_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_237_CB0((uint)(22)).x / BA_Vertex_237_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_237_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_237_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_237_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_237_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = saturate(r0.x * BA_Vertex_237_CB0((uint)(59)).z + BA_Vertex_237_CB0((uint)(59)).w);
  o1.xyz = BA_Vertex_237_CB2((uint)(3)).xyz * BA_Vertex_237_CB0((uint)(10)).xyz;
  o1.w = 1;
  BA_o2_zw.xy = v3.xy;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_238_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_238_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_238_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_238_CB1((uint)(5)).xyz * BA_Vertex_238_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_238_CB1((uint)(4)).xyz * BA_Vertex_238_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_238_CB1((uint)(6)).xyz * BA_Vertex_238_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_238_CB1((uint)(7)).xyz * BA_Vertex_238_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_238_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_238_CB1((uint)(5)).xyz * BA_Vertex_238_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_238_CB1((uint)(4)).xyz * BA_Vertex_238_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_238_CB1((uint)(6)).xyz * BA_Vertex_238_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_238_CB1((uint)(7)).xyz * BA_Vertex_238_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_238_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_238_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_238_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_238_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_238_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_238_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_238_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_238_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_238_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_238_CB0((uint)(22)).x / BA_Vertex_238_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_238_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_238_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_238_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_238_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = saturate(r0.x * BA_Vertex_238_CB0((uint)(59)).z + BA_Vertex_238_CB0((uint)(59)).w);
  r0.xyz = BA_Vertex_238_CB2((uint)(3)).xyz * BA_Vertex_238_CB0((uint)(10)).xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_239_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_239_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_239_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_239_CB1((uint)(5)).xyz * BA_Vertex_239_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_239_CB1((uint)(4)).xyz * BA_Vertex_239_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_239_CB1((uint)(6)).xyz * BA_Vertex_239_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_239_CB1((uint)(7)).xyz * BA_Vertex_239_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_239_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_239_CB1((uint)(5)).xyz * BA_Vertex_239_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_239_CB1((uint)(4)).xyz * BA_Vertex_239_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_239_CB1((uint)(6)).xyz * BA_Vertex_239_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_239_CB1((uint)(7)).xyz * BA_Vertex_239_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_239_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_239_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_239_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_239_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_239_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_239_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_239_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_239_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_239_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_239_CB0((uint)(22)).x / BA_Vertex_239_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_239_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_239_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_239_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_239_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = saturate(r0.x * BA_Vertex_239_CB0((uint)(59)).z + BA_Vertex_239_CB0((uint)(59)).w);
  r0.xyz = BA_Vertex_239_CB2((uint)(3)).xyz * BA_Vertex_239_CB0((uint)(10)).xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  BA_o2_zw.xy = v3.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_240_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_240_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_240_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_240_CB1((uint)(5)).xyz * BA_Vertex_240_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_240_CB1((uint)(4)).xyz * BA_Vertex_240_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_240_CB1((uint)(6)).xyz * BA_Vertex_240_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_240_CB1((uint)(7)).xyz * BA_Vertex_240_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_240_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_240_CB1((uint)(5)).xyz * BA_Vertex_240_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_240_CB1((uint)(4)).xyz * BA_Vertex_240_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_240_CB1((uint)(6)).xyz * BA_Vertex_240_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_240_CB1((uint)(7)).xyz * BA_Vertex_240_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_240_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_240_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_240_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_240_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_240_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_240_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_240_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_240_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_240_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_240_CB0((uint)(22)).x / BA_Vertex_240_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_240_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_240_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_240_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_240_CB0((uint)(59)).x * r0.x;
  o1.xyz = BA_Vertex_240_CB2((uint)(3)).xyz * BA_Vertex_240_CB0((uint)(10)).xyz;
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_241_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_241_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_241_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_241_CB1((uint)(5)).xyz * BA_Vertex_241_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_241_CB1((uint)(4)).xyz * BA_Vertex_241_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_241_CB1((uint)(6)).xyz * BA_Vertex_241_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_241_CB1((uint)(7)).xyz * BA_Vertex_241_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_241_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_241_CB1((uint)(5)).xyz * BA_Vertex_241_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_241_CB1((uint)(4)).xyz * BA_Vertex_241_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_241_CB1((uint)(6)).xyz * BA_Vertex_241_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_241_CB1((uint)(7)).xyz * BA_Vertex_241_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_241_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_241_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_241_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_241_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_241_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_241_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_241_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_241_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_241_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_241_CB0((uint)(22)).x / BA_Vertex_241_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_241_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_241_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_241_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_241_CB0((uint)(59)).x * r0.x;
  o1.xyz = BA_Vertex_241_CB2((uint)(3)).xyz * BA_Vertex_241_CB0((uint)(10)).xyz;
  o1.w = 1;
  p2.xy = v3.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_242_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_242_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_242_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_242_CB1((uint)(5)).xyz * BA_Vertex_242_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_242_CB1((uint)(4)).xyz * BA_Vertex_242_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_242_CB1((uint)(6)).xyz * BA_Vertex_242_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_242_CB1((uint)(7)).xyz * BA_Vertex_242_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_242_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_242_CB1((uint)(5)).xyz * BA_Vertex_242_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_242_CB1((uint)(4)).xyz * BA_Vertex_242_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_242_CB1((uint)(6)).xyz * BA_Vertex_242_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_242_CB1((uint)(7)).xyz * BA_Vertex_242_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_242_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_242_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_242_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_242_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_242_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_242_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_242_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_242_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_242_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_242_CB0((uint)(22)).x / BA_Vertex_242_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_242_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_242_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_242_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_242_CB0((uint)(59)).x * r0.x;
  r0.xyz = BA_Vertex_242_CB2((uint)(3)).xyz * BA_Vertex_242_CB0((uint)(10)).xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_243_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_243_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_243_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float2 p2 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_243_CB1((uint)(5)).xyz * BA_Vertex_243_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_243_CB1((uint)(4)).xyz * BA_Vertex_243_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_243_CB1((uint)(6)).xyz * BA_Vertex_243_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_243_CB1((uint)(7)).xyz * BA_Vertex_243_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_243_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_243_CB1((uint)(5)).xyz * BA_Vertex_243_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_243_CB1((uint)(4)).xyz * BA_Vertex_243_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_243_CB1((uint)(6)).xyz * BA_Vertex_243_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_243_CB1((uint)(7)).xyz * BA_Vertex_243_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_243_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_243_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_243_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_243_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_243_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_243_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_243_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_243_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_243_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_243_CB0((uint)(22)).x / BA_Vertex_243_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  o0.xy = r1.xy + r0.xz;
  o0.z = BA_Vertex_243_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_243_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_243_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_243_CB0((uint)(59)).x * r0.x;
  r0.xyz = BA_Vertex_243_CB2((uint)(3)).xyz * BA_Vertex_243_CB0((uint)(10)).xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  p2.xy = v3.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_244_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_244_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_244_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_244_CB1((uint)(5)).xyz * BA_Vertex_244_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_244_CB1((uint)(4)).xyz * BA_Vertex_244_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_244_CB1((uint)(6)).xyz * BA_Vertex_244_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_244_CB1((uint)(7)).xyz * BA_Vertex_244_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_244_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_244_CB1((uint)(5)).xyz * BA_Vertex_244_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_244_CB1((uint)(4)).xyz * BA_Vertex_244_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_244_CB1((uint)(6)).xyz * BA_Vertex_244_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_244_CB1((uint)(7)).xyz * BA_Vertex_244_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_244_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_244_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_244_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_244_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_244_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_244_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_244_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_244_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_244_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_244_CB0((uint)(22)).x / BA_Vertex_244_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_244_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_244_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_244_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_244_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_244_CB0((uint)(59)).x * r0.x;
  o1.xyz = BA_Vertex_244_CB2((uint)(3)).xyz * BA_Vertex_244_CB0((uint)(10)).xyz;
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_245_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_245_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_245_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_245_CB1((uint)(5)).xyz * BA_Vertex_245_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_245_CB1((uint)(4)).xyz * BA_Vertex_245_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_245_CB1((uint)(6)).xyz * BA_Vertex_245_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_245_CB1((uint)(7)).xyz * BA_Vertex_245_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_245_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_245_CB1((uint)(5)).xyz * BA_Vertex_245_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_245_CB1((uint)(4)).xyz * BA_Vertex_245_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_245_CB1((uint)(6)).xyz * BA_Vertex_245_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_245_CB1((uint)(7)).xyz * BA_Vertex_245_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_245_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_245_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_245_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_245_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_245_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_245_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_245_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_245_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_245_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_245_CB0((uint)(22)).x / BA_Vertex_245_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_245_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_245_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_245_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_245_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = BA_Vertex_245_CB0((uint)(59)).x * r0.x;
  o1.xyz = BA_Vertex_245_CB2((uint)(3)).xyz * BA_Vertex_245_CB0((uint)(10)).xyz;
  o1.w = 1;
  BA_o2_zw.xy = v3.xy;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_246_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_246_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_246_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float o2 : TEXCOORD0,
  out float p2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  p2 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_246_CB1((uint)(5)).xyz * BA_Vertex_246_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_246_CB1((uint)(4)).xyz * BA_Vertex_246_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_246_CB1((uint)(6)).xyz * BA_Vertex_246_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_246_CB1((uint)(7)).xyz * BA_Vertex_246_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_246_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_246_CB1((uint)(5)).xyz * BA_Vertex_246_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_246_CB1((uint)(4)).xyz * BA_Vertex_246_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_246_CB1((uint)(6)).xyz * BA_Vertex_246_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_246_CB1((uint)(7)).xyz * BA_Vertex_246_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_246_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_246_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_246_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_246_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_246_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_246_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_246_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_246_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_246_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_246_CB0((uint)(22)).x / BA_Vertex_246_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_246_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  p2.x = 0.5 + r0.x;
  o0.z = BA_Vertex_246_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_246_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_246_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.x = BA_Vertex_246_CB0((uint)(59)).x * r0.x;
  r0.xyz = BA_Vertex_246_CB2((uint)(3)).xyz * BA_Vertex_246_CB0((uint)(10)).xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_247_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 2u) value = float4(_OutlineZCorrection, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(_OutlineSolidColorTint.x, _OutlineSolidColorTint.y, _OutlineSolidColorTint.z, _OutlineSolidColorTint.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_247_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 7u) value = float4(transpose(unity_WorldToObject)[3].x, transpose(unity_WorldToObject)[3].y, transpose(unity_WorldToObject)[3].z, transpose(unity_WorldToObject)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_247_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 10u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 21u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 22u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 59u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 61u) value = float4(transpose(glstate_matrix_projection)[0].x, transpose(glstate_matrix_projection)[0].y, transpose(glstate_matrix_projection)[0].z, transpose(glstate_matrix_projection)[0].w);
  if (i == 62u) value = float4(transpose(glstate_matrix_projection)[1].x, transpose(glstate_matrix_projection)[1].y, transpose(glstate_matrix_projection)[1].z, transpose(glstate_matrix_projection)[1].w);
  if (i == 69u) value = float4(transpose(unity_MatrixInvV)[0].x, transpose(unity_MatrixInvV)[0].y, transpose(unity_MatrixInvV)[0].z, transpose(unity_MatrixInvV)[0].w);
  if (i == 70u) value = float4(transpose(unity_MatrixInvV)[1].x, transpose(unity_MatrixInvV)[1].y, transpose(unity_MatrixInvV)[1].z, transpose(unity_MatrixInvV)[1].w);
  if (i == 77u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 78u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 79u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 80u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TANGENT0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float BA_o2_x : TEXCOORD0,
  out float BA_o2_y : TEXCOORD1,
  out float2 BA_o2_zw : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  BA_o2_x = 0;
  BA_o2_y = 0;
  BA_o2_zw = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_247_CB1((uint)(5)).xyz * BA_Vertex_247_CB0((uint)(69)).yyy;
  r0.xyz = BA_Vertex_247_CB1((uint)(4)).xyz * BA_Vertex_247_CB0((uint)(69)).xxx + r0.xyz;
  r0.xyz = BA_Vertex_247_CB1((uint)(6)).xyz * BA_Vertex_247_CB0((uint)(69)).zzz + r0.xyz;
  r0.xyz = BA_Vertex_247_CB1((uint)(7)).xyz * BA_Vertex_247_CB0((uint)(69)).www + r0.xyz;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = BA_Vertex_247_CB0((uint)(61)).x * r0.x;
  r1.xyz = BA_Vertex_247_CB1((uint)(5)).xyz * BA_Vertex_247_CB0((uint)(70)).yyy;
  r1.xyz = BA_Vertex_247_CB1((uint)(4)).xyz * BA_Vertex_247_CB0((uint)(70)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_247_CB1((uint)(6)).xyz * BA_Vertex_247_CB0((uint)(70)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_247_CB1((uint)(7)).xyz * BA_Vertex_247_CB0((uint)(70)).www + r1.xyz;
  r0.z = dot(r1.xyz, v2.xyz);
  r0.y = BA_Vertex_247_CB0((uint)(62)).y * r0.z;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = max(6.10351563e-005, r0.z);
  r0.z = rsqrt(r0.z);
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_247_CB1((uint)(1)).xyz * v0.yyy;
  r1.xyz = BA_Vertex_247_CB1((uint)(0)).xyz * v0.xxx + r1.xyz;
  r1.xyz = BA_Vertex_247_CB1((uint)(2)).xyz * v0.zzz + r1.xyz;
  r1.xyz = BA_Vertex_247_CB1((uint)(3)).xyz + r1.xyz;
  r2.xyzw = BA_Vertex_247_CB0((uint)(78)).xyzw * r1.yyyy;
  r2.xyzw = BA_Vertex_247_CB0((uint)(77)).xyzw * r1.xxxx + r2.xyzw;
  r1.xyzw = BA_Vertex_247_CB0((uint)(79)).xyzw * r1.zzzz + r2.xyzw;
  r1.xyzw = BA_Vertex_247_CB0((uint)(80)).xyzw + r1.xyzw;
  r0.z = v1.w * r1.w;
  r0.z = 0.00200000009 * r0.z;
  r0.xy = r0.zz * r0.xy;
  r0.w = BA_Vertex_247_CB0((uint)(22)).x / BA_Vertex_247_CB0((uint)(22)).y;
  r0.z = r0.y * r0.w;
  r0.xy = r1.xy + r0.xz;
  o0.xy = r0.xy;
  r0.x = BA_Vertex_247_CB0((uint)(21)).x * r0.y;
  r0.x = 0.5 * r0.x;
  r0.x = r0.x / r1.w;
  BA_o2_y.x = 0.5 + r0.x;
  o0.z = BA_Vertex_247_CB2((uint)(2)).x + r1.z;
  o0.w = r1.w;
  r0.x = r1.z / BA_Vertex_247_CB0((uint)(21)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_247_CB0((uint)(21)).z * r0.x;
  r0.x = max(0, r0.x);
  BA_o2_x.x = BA_Vertex_247_CB0((uint)(59)).x * r0.x;
  r0.xyz = BA_Vertex_247_CB2((uint)(3)).xyz * BA_Vertex_247_CB0((uint)(10)).xyz;
  o1.xyz = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  o1.w = 1;
  BA_o2_zw.xy = v3.xy;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_252_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_252_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_252_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_252_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_253_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_253_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_253_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_253_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_190_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_190_CB0((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_254_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_254_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_254_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_254_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_254_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_191_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_191_CB0((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_255_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_255_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_255_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_255_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_255_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = v1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_192_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = -BA_Fragment_192_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_192_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_256_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_256_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_256_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_256_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_256_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_256_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_193_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = -BA_Fragment_193_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_193_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_257_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_257_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_257_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_257_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_257_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_257_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_194_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_194_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_194_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_194_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_194_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_258_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_258_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_258_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_258_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_258_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_258_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = BA_i2_x.xxx * r0.xyz + BA_Fragment_258_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_195_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_195_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_195_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_195_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = v2.xxx * r0.xyz + BA_Fragment_195_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_259_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_259_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_259_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_259_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_259_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = -BA_Fragment_259_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = BA_i2_x.xxx * r0.xyz + BA_Fragment_259_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_196_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
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
  r0.yzw = -BA_Fragment_196_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_196_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_260_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_260_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_260_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_260_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_260_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_260_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_197_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
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
  r0.yzw = -BA_Fragment_197_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_197_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_261_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_261_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, w2.xy, BA_Fragment_261_CB0((uint)(23)).x).xyzw;
  r0.x = -BA_Fragment_261_CB1((uint)(0)).z + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_261_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_261_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_198_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_198_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_198_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_198_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_198_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_262_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_262_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_262_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_262_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_262_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-BA_i2_x.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_262_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_262_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_199_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_199_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float v2 : TEXCOORD0,
  float w2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * w2.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_199_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-v2.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_199_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_199_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_263_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(0.0, 0.0, _Cutoff, 0.0);
  if (i == 4u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_263_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 23u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 60u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float BA_i2_x : TEXCOORD0,
  float BA_i2_y : TEXCOORD1,
  float2 BA_i2_zw : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * BA_i2_y.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_263_CB1((uint)(4)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, BA_i2_zw.xy, BA_Fragment_263_CB0((uint)(23)).x).xyzw;
  r0.y = -BA_Fragment_263_CB1((uint)(0)).z + r1.w;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = exp2(-BA_i2_x.x);
  r0.x = min(1, r0.x);
  r0.yzw = -BA_Fragment_263_CB0((uint)(60)).xyz + v1.xyz;
  o0.xyz = r0.xxx * r0.yzw + BA_Fragment_263_CB0((uint)(60)).xyz;
  o0.w = v1.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
