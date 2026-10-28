// Exact names and types from the original compiled parameter metadata.
float _Cutoff;
float4 _MainTex_ST;
Texture2D<float4> _MainTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(INSTANCING_ON) && !defined(_ENV_CUTOUT_MODE)
float4 BA_Vertex_316_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_316_CB0(uint i)
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
  out float4 o0 : SV_POSITION0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_316_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_316_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_316_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_316_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_316_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_316_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_316_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_316_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  return;
}
#elif !defined(INSTANCING_ON) && defined(_ENV_CUTOUT_MODE)
float4 BA_Vertex_317_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_317_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_317_CB0(uint i)
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
  float2 v1 : TEXCOORD0,
  out float2 o0 : TEXCOORD0,
  out float4 o1 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v1.xy * BA_Vertex_317_CB1((uint)(0)).xy + BA_Vertex_317_CB1((uint)(0)).zw;
  r0.xyzw = BA_Vertex_317_CB2((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_317_CB2((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_317_CB2((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_317_CB2((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_317_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_317_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_317_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o1.xyzw = BA_Vertex_317_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  return;
}
#elif defined(INSTANCING_ON) && !defined(_ENV_CUTOUT_MODE)
float4 BA_Vertex_318_CB2(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_318_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_318_CB0(uint i)
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out uint o1 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_318_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_318_CB2((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_318_CB2((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_318_CB2((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_318_CB2((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_318_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_318_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_318_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_318_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.x = 0;
  return;
}
#elif defined(INSTANCING_ON) && defined(_ENV_CUTOUT_MODE)
float4 BA_Vertex_319_CB3(uint i)
{
  float4 value = 0;
  if (i >= 0u)
  {
    uint e = (i-0u)/8u;
    uint c = (i-0u)%8u;
    if (c >= 0u && c < 4u) value = transpose(unity_Builtins0Array[e].unity_ObjectToWorldArray)[c-0u];
    if (c >= 4u && c < 8u) value = transpose(unity_Builtins0Array[e].unity_WorldToObjectArray)[c-4u];
  }
  return value;
}

float4 BA_Vertex_319_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_319_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_319_CB0(uint i)
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
  float2 v1 : TEXCOORD0,
  uint v2 : SV_InstanceID0,
  out float2 o0 : TEXCOORD0,
  out float4 o1 : SV_POSITION0,
  out uint o2 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v1.xy * BA_Vertex_319_CB1((uint)(0)).xy + BA_Vertex_319_CB1((uint)(0)).zw;
  r0.x = (int)v2.x + asint(BA_Vertex_319_CB2((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.xyzw = BA_Vertex_319_CB3((uint)(r0.x+1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_319_CB3((uint)(r0.x+0)).xyzw * v0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_319_CB3((uint)(r0.x+2)).xyzw * v0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_319_CB3((uint)(r0.x+3)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_319_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_319_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_319_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o1.xyzw = BA_Vertex_319_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o2.x = 0;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(INSTANCING_ON) && !defined(_ENV_CUTOUT_MODE)

void BA_Frag(
  float4 v0 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = float4(0,0,0,0);
  return;
}
#elif !defined(INSTANCING_ON) && defined(_ENV_CUTOUT_MODE)
float4 BA_Fragment_309_CB1(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_Cutoff, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_309_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float2 v0 : TEXCOORD0,
  float4 v1 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_309_CB0((uint)(19)).x).xyzw;
  r0.x = -BA_Fragment_309_CB1((uint)(2)).x + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = float4(0,0,0,0);
  return;
}
#elif defined(INSTANCING_ON) && !defined(_ENV_CUTOUT_MODE)

void BA_Frag(
  float4 v0 : SV_POSITION0,
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;

  o0.xyzw = float4(0,0,0,0);
  return;
}
#elif defined(INSTANCING_ON) && defined(_ENV_CUTOUT_MODE)
float4 BA_Fragment_322_CB1(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_Cutoff, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_322_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float2 v0 : TEXCOORD0,
  float4 v1 : SV_POSITION0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_322_CB0((uint)(19)).x).xyzw;
  r0.x = -BA_Fragment_322_CB1((uint)(2)).x + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = float4(0,0,0,0);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
