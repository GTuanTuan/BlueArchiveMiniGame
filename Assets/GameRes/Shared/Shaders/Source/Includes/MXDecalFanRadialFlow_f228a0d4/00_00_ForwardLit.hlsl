// Exact names and types from the original compiled parameter metadata.
float _FadeStartHeight;
float _FanAngle;
float _FanBorderUVWeight;
float _FlowSpeed;
float4 _Tint;
float4 _invMatrixMVP0;
float4 _invMatrixMVP1;
float4 _invMatrixMVP2;
float4 _invMatrixMVP3;
Texture2D<float4> _CameraDepthTexture;
Texture2D<float4> _FlowTex;
Texture2D<float4> _MainTex;
SamplerState sampler_CameraDepthTexture;
SamplerState sampler_FlowTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON)
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
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

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
  o1.xyzw = r0.xyzw;
  r0.y = BA_Vertex_4_CB0((uint)(17)).x * r0.y;
  r1.xzw = float3(0.5,0.5,0.5) * r0.xwy;
  o2.w = r0.w;
  o2.xy = r1.xw + r1.zz;
  o2.z = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON)
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

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
  o1.xyzw = r0.xyzw;
  r0.y = BA_Vertex_5_CB0((uint)(17)).x * r0.y;
  r1.xzw = float3(0.5,0.5,0.5) * r0.xwy;
  o2.xy = r1.xw + r1.zz;
  r0.x = r0.z / BA_Vertex_5_CB0((uint)(17)).y;
  o2.w = r0.w;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_5_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.z = saturate(r0.x * BA_Vertex_5_CB0((uint)(55)).z + BA_Vertex_5_CB0((uint)(55)).w);
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON)
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_6_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_6_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_6_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_6_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_6_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_6_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_6_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw + r0.xyzw;
  o0.xyzw = r0.xyzw;
  o1.xyzw = r0.xyzw;
  r0.y = BA_Vertex_6_CB0((uint)(17)).x * r0.y;
  r1.xzw = float3(0.5,0.5,0.5) * r0.xwy;
  o2.xy = r1.xw + r1.zz;
  r0.x = r0.z / BA_Vertex_6_CB0((uint)(17)).y;
  o2.w = r0.w;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_6_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.z = BA_Vertex_6_CB0((uint)(55)).x * r0.x;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON)
float4 BA_Vertex_7_CB2(uint i)
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

float4 BA_Vertex_7_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_7_CB0(uint i)
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
  uint v1 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out uint o3 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_7_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r0.yzw = BA_Vertex_7_CB2((uint)(r0.x+1)).xyz * v0.yyy;
  r0.yzw = BA_Vertex_7_CB2((uint)(r0.x+0)).xyz * v0.xxx + r0.yzw;
  r0.yzw = BA_Vertex_7_CB2((uint)(r0.x+2)).xyz * v0.zzz + r0.yzw;
  r0.xyz = BA_Vertex_7_CB2((uint)(r0.x+3)).xyz + r0.yzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_7_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_7_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw + r0.xyzw;
  o0.xyzw = r0.xyzw;
  o1.xyzw = r0.xyzw;
  r0.y = BA_Vertex_7_CB0((uint)(17)).x * r0.y;
  r1.xzw = float3(0.5,0.5,0.5) * r0.xwy;
  o2.w = r0.w;
  o2.xy = r1.xw + r1.zz;
  o2.z = 0;
  o3.x = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON)
float4 BA_Vertex_8_CB2(uint i)
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

float4 BA_Vertex_8_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_8_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
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
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out uint o3 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_8_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r0.yzw = BA_Vertex_8_CB2((uint)(r0.x+1)).xyz * v0.yyy;
  r0.yzw = BA_Vertex_8_CB2((uint)(r0.x+0)).xyz * v0.xxx + r0.yzw;
  r0.yzw = BA_Vertex_8_CB2((uint)(r0.x+2)).xyz * v0.zzz + r0.yzw;
  r0.xyz = BA_Vertex_8_CB2((uint)(r0.x+3)).xyz + r0.yzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_8_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_8_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw + r0.xyzw;
  o0.xyzw = r0.xyzw;
  o1.xyzw = r0.xyzw;
  r0.y = BA_Vertex_8_CB0((uint)(17)).x * r0.y;
  r1.xzw = float3(0.5,0.5,0.5) * r0.xwy;
  o2.xy = r1.xw + r1.zz;
  r0.x = r0.z / BA_Vertex_8_CB0((uint)(17)).y;
  o2.w = r0.w;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_8_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.z = saturate(r0.x * BA_Vertex_8_CB0((uint)(55)).z + BA_Vertex_8_CB0((uint)(55)).w);
  o3.x = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON)
float4 BA_Vertex_9_CB2(uint i)
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

float4 BA_Vertex_9_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_9_CB0(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
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
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out uint o3 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v1);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v1.x + asint(BA_Vertex_9_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r0.yzw = BA_Vertex_9_CB2((uint)(r0.x+1)).xyz * v0.yyy;
  r0.yzw = BA_Vertex_9_CB2((uint)(r0.x+0)).xyz * v0.xxx + r0.yzw;
  r0.yzw = BA_Vertex_9_CB2((uint)(r0.x+2)).xyz * v0.zzz + r0.yzw;
  r0.xyz = BA_Vertex_9_CB2((uint)(r0.x+3)).xyz + r0.yzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_9_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_9_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw + r0.xyzw;
  o0.xyzw = r0.xyzw;
  o1.xyzw = r0.xyzw;
  r0.y = BA_Vertex_9_CB0((uint)(17)).x * r0.y;
  r1.xzw = float3(0.5,0.5,0.5) * r0.xwy;
  o2.xy = r1.xw + r1.zz;
  r0.x = r0.z / BA_Vertex_9_CB0((uint)(17)).y;
  o2.w = r0.w;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_9_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o2.z = BA_Vertex_9_CB0((uint)(55)).x * r0.x;
  o3.x = 0;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON)
float4 BA_Fragment_11_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_FanAngle, _FanBorderUVWeight, _FlowSpeed, _FadeStartHeight);
  if (i == 3u) value = float4(_invMatrixMVP0.x, _invMatrixMVP0.y, _invMatrixMVP0.z, _invMatrixMVP0.w);
  if (i == 4u) value = float4(_invMatrixMVP1.x, _invMatrixMVP1.y, _invMatrixMVP1.z, _invMatrixMVP1.w);
  if (i == 5u) value = float4(_invMatrixMVP2.x, _invMatrixMVP2.y, _invMatrixMVP2.z, _invMatrixMVP2.w);
  if (i == 6u) value = float4(_invMatrixMVP3.x, _invMatrixMVP3.y, _invMatrixMVP3.z, _invMatrixMVP3.w);
  return value;
}

float4 BA_Fragment_11_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy / v2.ww;
  r0.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_11_CB0((uint)(19)).x).yzxw;
  r0.xy = v1.xy / v1.ww;
  r0.w = 1;
  r1.x = dot(BA_Fragment_11_CB1((uint)(3)).xyzw, r0.xyzw);
  r1.y = dot(BA_Fragment_11_CB1((uint)(4)).xyzw, r0.xyzw);
  r1.z = dot(BA_Fragment_11_CB1((uint)(5)).xyzw, r0.xyzw);
  r0.x = dot(BA_Fragment_11_CB1((uint)(6)).xyzw, r0.xyzw);
  r0.xyz = r1.xyz / r0.xxx;
  r0.w = cmp(0 < r0.x);
  r1.x = cmp(r0.x < 0);
  r0.w = (int)r0.w + (int)-r1.x;
  r0.w = (int)r0.w;
  r0.x = dot(r0.xz, r0.xz);
  r0.x = sqrt(r0.x);
  r0.z = r0.z / r0.x;
  r1.x = abs(r0.z) * -0.0187292993 + 0.0742610022;
  r1.x = r1.x * abs(r0.z) + -0.212114394;
  r1.x = r1.x * abs(r0.z) + 1.57072878;
  r1.y = 1 + -abs(r0.z);
  r0.z = cmp(r0.z < -r0.z);
  r1.y = sqrt(r1.y);
  r1.z = r1.x * r1.y;
  r1.z = r1.z * -2 + 3.14159274;
  r0.z = r0.z ? r1.z : 0;
  r0.z = r1.x * r1.y + r0.z;
  r1.xy = float2(0.318309963,0.5) * BA_Fragment_11_CB1((uint)(2)).xx;
  r0.z = r0.w * r0.z + r1.y;
  r1.x = saturate(r1.x);
  r0.w = cmp(r0.z >= 0);
  r0.w = r0.w ? 1.000000 : 0;
  r1.y = cmp(1 >= abs(r0.y));
  r0.y = 1 + -r0.y;
  r1.z = cmp(0.495000005 >= r0.x);
  r1.yz = r1.yz ? float2(1,1) : 0;
  r1.y = r1.z * r1.y;
  r0.w = r1.y * r0.w;
  r1.y = cmp(BA_Fragment_11_CB1((uint)(2)).x >= r0.z);
  r1.y = r1.y ? 1.000000 : 0;
  r0.w = r0.w * r1.y + -0.5;
  r0.w = cmp(r0.w < 0);
  if (r0.w != 0) discard;
  r0.w = 1.57079601 / BA_Fragment_11_CB1((uint)(2)).x;
  r1.y = r0.z * r0.w;
  r0.z = r0.z * r0.w + -BA_Fragment_11_CB1((uint)(2)).y;
  r0.w = BA_Fragment_11_CB1((uint)(2)).y * -2 + 1.57079601;
  r0.w = 1 / r0.w;
  r0.z = saturate(r0.z * r0.w);
  r0.w = r0.z * -2 + 3;
  r0.z = r0.z * r0.z;
  r0.z = r0.w * r0.z;
  r0.zw = float2(1.57079601,-3.14159203) * r0.zz;
  r0.w = r1.y * 2 + r0.w;
  r0.z = r1.x * r0.w + r0.z;
  sincos(r0.z, r1.x, r2.x);
  r0.z = 2.01200008 * r0.x;
  r2.x = r0.z * r2.x;
  r2.y = r0.z * r1.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r2.xy, BA_Fragment_11_CB0((uint)(19)).x).xyzw;
  r0.z = BA_Fragment_11_CB1((uint)(2)).z * BA_Fragment_11_CB0((uint)(11)).y;
  r0.z = frac(r0.z);
  r2.y = r0.x * 2.01200008 + r0.z;
  r2.x = 0.5;
  r2.xyzw = _FlowTex.SampleBias(sampler_FlowTex, r2.xy, BA_Fragment_11_CB0((uint)(19)).x).xyzw;
  r0.xzw = r2.xyz * r1.www;
  r0.xzw = max(r1.xyz, r0.xzw);
  r1.x = 1 + -BA_Fragment_11_CB1((uint)(2)).w;
  r0.y = saturate(r0.y / r1.x);
  r0.xyz = r0.xzw * r0.yyy;
  o0.xyz = BA_Fragment_11_CB1((uint)(1)).xyz * r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(INSTANCING_ON)
float4 BA_Fragment_12_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_FanAngle, _FanBorderUVWeight, _FlowSpeed, _FadeStartHeight);
  if (i == 3u) value = float4(_invMatrixMVP0.x, _invMatrixMVP0.y, _invMatrixMVP0.z, _invMatrixMVP0.w);
  if (i == 4u) value = float4(_invMatrixMVP1.x, _invMatrixMVP1.y, _invMatrixMVP1.z, _invMatrixMVP1.w);
  if (i == 5u) value = float4(_invMatrixMVP2.x, _invMatrixMVP2.y, _invMatrixMVP2.z, _invMatrixMVP2.w);
  if (i == 6u) value = float4(_invMatrixMVP3.x, _invMatrixMVP3.y, _invMatrixMVP3.z, _invMatrixMVP3.w);
  return value;
}

float4 BA_Fragment_12_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy / v2.ww;
  r0.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_12_CB0((uint)(19)).x).yzxw;
  r0.xy = v1.xy / v1.ww;
  r0.w = 1;
  r1.x = dot(BA_Fragment_12_CB1((uint)(3)).xyzw, r0.xyzw);
  r1.y = dot(BA_Fragment_12_CB1((uint)(4)).xyzw, r0.xyzw);
  r1.z = dot(BA_Fragment_12_CB1((uint)(5)).xyzw, r0.xyzw);
  r0.x = dot(BA_Fragment_12_CB1((uint)(6)).xyzw, r0.xyzw);
  r0.xyz = r1.xyz / r0.xxx;
  r0.w = cmp(0 < r0.x);
  r1.x = cmp(r0.x < 0);
  r0.w = (int)r0.w + (int)-r1.x;
  r0.w = (int)r0.w;
  r0.x = dot(r0.xz, r0.xz);
  r0.x = sqrt(r0.x);
  r0.z = r0.z / r0.x;
  r1.x = abs(r0.z) * -0.0187292993 + 0.0742610022;
  r1.x = r1.x * abs(r0.z) + -0.212114394;
  r1.x = r1.x * abs(r0.z) + 1.57072878;
  r1.y = 1 + -abs(r0.z);
  r0.z = cmp(r0.z < -r0.z);
  r1.y = sqrt(r1.y);
  r1.z = r1.x * r1.y;
  r1.z = r1.z * -2 + 3.14159274;
  r0.z = r0.z ? r1.z : 0;
  r0.z = r1.x * r1.y + r0.z;
  r1.xy = float2(0.318309963,0.5) * BA_Fragment_12_CB1((uint)(2)).xx;
  r0.z = r0.w * r0.z + r1.y;
  r1.x = saturate(r1.x);
  r0.w = cmp(r0.z >= 0);
  r0.w = r0.w ? 1.000000 : 0;
  r1.y = cmp(1 >= abs(r0.y));
  r0.y = 1 + -r0.y;
  r1.z = cmp(0.495000005 >= r0.x);
  r1.yz = r1.yz ? float2(1,1) : 0;
  r1.y = r1.z * r1.y;
  r0.w = r1.y * r0.w;
  r1.y = cmp(BA_Fragment_12_CB1((uint)(2)).x >= r0.z);
  r1.y = r1.y ? 1.000000 : 0;
  r0.w = r0.w * r1.y + -0.5;
  r0.w = cmp(r0.w < 0);
  if (r0.w != 0) discard;
  r0.w = 1.57079601 / BA_Fragment_12_CB1((uint)(2)).x;
  r1.y = r0.z * r0.w;
  r0.z = r0.z * r0.w + -BA_Fragment_12_CB1((uint)(2)).y;
  r0.w = BA_Fragment_12_CB1((uint)(2)).y * -2 + 1.57079601;
  r0.w = 1 / r0.w;
  r0.z = saturate(r0.z * r0.w);
  r0.w = r0.z * -2 + 3;
  r0.z = r0.z * r0.z;
  r0.z = r0.w * r0.z;
  r0.zw = float2(1.57079601,-3.14159203) * r0.zz;
  r0.w = r1.y * 2 + r0.w;
  r0.z = r1.x * r0.w + r0.z;
  sincos(r0.z, r1.x, r2.x);
  r0.z = 2.01200008 * r0.x;
  r2.x = r0.z * r2.x;
  r2.y = r0.z * r1.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r2.xy, BA_Fragment_12_CB0((uint)(19)).x).xyzw;
  r0.z = BA_Fragment_12_CB1((uint)(2)).z * BA_Fragment_12_CB0((uint)(11)).y;
  r0.z = frac(r0.z);
  r2.y = r0.x * 2.01200008 + r0.z;
  r2.x = 0.5;
  r2.xyzw = _FlowTex.SampleBias(sampler_FlowTex, r2.xy, BA_Fragment_12_CB0((uint)(19)).x).xyzw;
  r0.xzw = r2.xyz * r1.www;
  r0.xzw = max(r1.xyz, r0.xzw);
  r1.x = 1 + -BA_Fragment_12_CB1((uint)(2)).w;
  r0.y = saturate(r0.y / r1.x);
  r0.xyz = r0.xzw * r0.yyy;
  r0.xyz = BA_Fragment_12_CB1((uint)(1)).xyz * r0.xyz;
  o0.xyz = v2.zzz * r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(INSTANCING_ON)
float4 BA_Fragment_13_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_FanAngle, _FanBorderUVWeight, _FlowSpeed, _FadeStartHeight);
  if (i == 3u) value = float4(_invMatrixMVP0.x, _invMatrixMVP0.y, _invMatrixMVP0.z, _invMatrixMVP0.w);
  if (i == 4u) value = float4(_invMatrixMVP1.x, _invMatrixMVP1.y, _invMatrixMVP1.z, _invMatrixMVP1.w);
  if (i == 5u) value = float4(_invMatrixMVP2.x, _invMatrixMVP2.y, _invMatrixMVP2.z, _invMatrixMVP2.w);
  if (i == 6u) value = float4(_invMatrixMVP3.x, _invMatrixMVP3.y, _invMatrixMVP3.z, _invMatrixMVP3.w);
  return value;
}

float4 BA_Fragment_13_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy / v2.ww;
  r0.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_13_CB0((uint)(19)).x).yzxw;
  r0.xy = v1.xy / v1.ww;
  r0.w = 1;
  r1.x = dot(BA_Fragment_13_CB1((uint)(3)).xyzw, r0.xyzw);
  r1.y = dot(BA_Fragment_13_CB1((uint)(4)).xyzw, r0.xyzw);
  r1.z = dot(BA_Fragment_13_CB1((uint)(5)).xyzw, r0.xyzw);
  r0.x = dot(BA_Fragment_13_CB1((uint)(6)).xyzw, r0.xyzw);
  r0.xyz = r1.xyz / r0.xxx;
  r0.w = cmp(0 < r0.x);
  r1.x = cmp(r0.x < 0);
  r0.w = (int)r0.w + (int)-r1.x;
  r0.w = (int)r0.w;
  r0.x = dot(r0.xz, r0.xz);
  r0.x = sqrt(r0.x);
  r0.z = r0.z / r0.x;
  r1.x = abs(r0.z) * -0.0187292993 + 0.0742610022;
  r1.x = r1.x * abs(r0.z) + -0.212114394;
  r1.x = r1.x * abs(r0.z) + 1.57072878;
  r1.y = 1 + -abs(r0.z);
  r0.z = cmp(r0.z < -r0.z);
  r1.y = sqrt(r1.y);
  r1.z = r1.x * r1.y;
  r1.z = r1.z * -2 + 3.14159274;
  r0.z = r0.z ? r1.z : 0;
  r0.z = r1.x * r1.y + r0.z;
  r1.xy = float2(0.318309963,0.5) * BA_Fragment_13_CB1((uint)(2)).xx;
  r0.z = r0.w * r0.z + r1.y;
  r1.x = saturate(r1.x);
  r0.w = cmp(r0.z >= 0);
  r0.w = r0.w ? 1.000000 : 0;
  r1.y = cmp(1 >= abs(r0.y));
  r0.y = 1 + -r0.y;
  r1.z = cmp(0.495000005 >= r0.x);
  r1.yz = r1.yz ? float2(1,1) : 0;
  r1.y = r1.z * r1.y;
  r0.w = r1.y * r0.w;
  r1.y = cmp(BA_Fragment_13_CB1((uint)(2)).x >= r0.z);
  r1.y = r1.y ? 1.000000 : 0;
  r0.w = r0.w * r1.y + -0.5;
  r0.w = cmp(r0.w < 0);
  if (r0.w != 0) discard;
  r0.w = 1.57079601 / BA_Fragment_13_CB1((uint)(2)).x;
  r1.y = r0.z * r0.w;
  r0.z = r0.z * r0.w + -BA_Fragment_13_CB1((uint)(2)).y;
  r0.w = BA_Fragment_13_CB1((uint)(2)).y * -2 + 1.57079601;
  r0.w = 1 / r0.w;
  r0.z = saturate(r0.z * r0.w);
  r0.w = r0.z * -2 + 3;
  r0.z = r0.z * r0.z;
  r0.z = r0.w * r0.z;
  r0.zw = float2(1.57079601,-3.14159203) * r0.zz;
  r0.w = r1.y * 2 + r0.w;
  r0.z = r1.x * r0.w + r0.z;
  sincos(r0.z, r1.x, r2.x);
  r0.z = 2.01200008 * r0.x;
  r2.x = r0.z * r2.x;
  r2.y = r0.z * r1.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r2.xy, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  r0.z = BA_Fragment_13_CB1((uint)(2)).z * BA_Fragment_13_CB0((uint)(11)).y;
  r0.z = frac(r0.z);
  r2.y = r0.x * 2.01200008 + r0.z;
  r2.x = 0.5;
  r2.xyzw = _FlowTex.SampleBias(sampler_FlowTex, r2.xy, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  r0.xzw = r2.xyz * r1.www;
  r0.xzw = max(r1.xyz, r0.xzw);
  r1.x = 1 + -BA_Fragment_13_CB1((uint)(2)).w;
  r0.y = saturate(r0.y / r1.x);
  r0.xyz = r0.xzw * r0.yyy;
  r0.xyz = BA_Fragment_13_CB1((uint)(1)).xyz * r0.xyz;
  r0.w = exp2(-v2.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON)
float4 BA_Fragment_14_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_FanAngle, _FanBorderUVWeight, _FlowSpeed, _FadeStartHeight);
  if (i == 3u) value = float4(_invMatrixMVP0.x, _invMatrixMVP0.y, _invMatrixMVP0.z, _invMatrixMVP0.w);
  if (i == 4u) value = float4(_invMatrixMVP1.x, _invMatrixMVP1.y, _invMatrixMVP1.z, _invMatrixMVP1.w);
  if (i == 5u) value = float4(_invMatrixMVP2.x, _invMatrixMVP2.y, _invMatrixMVP2.z, _invMatrixMVP2.w);
  if (i == 6u) value = float4(_invMatrixMVP3.x, _invMatrixMVP3.y, _invMatrixMVP3.z, _invMatrixMVP3.w);
  return value;
}

float4 BA_Fragment_14_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  uint v3 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy / v2.ww;
  r0.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_14_CB0((uint)(19)).x).yzxw;
  r0.xy = v1.xy / v1.ww;
  r0.w = 1;
  r1.x = dot(BA_Fragment_14_CB1((uint)(3)).xyzw, r0.xyzw);
  r1.y = dot(BA_Fragment_14_CB1((uint)(4)).xyzw, r0.xyzw);
  r1.z = dot(BA_Fragment_14_CB1((uint)(5)).xyzw, r0.xyzw);
  r0.x = dot(BA_Fragment_14_CB1((uint)(6)).xyzw, r0.xyzw);
  r0.xyz = r1.xyz / r0.xxx;
  r0.w = cmp(0 < r0.x);
  r1.x = cmp(r0.x < 0);
  r0.w = (int)r0.w + (int)-r1.x;
  r0.w = (int)r0.w;
  r0.x = dot(r0.xz, r0.xz);
  r0.x = sqrt(r0.x);
  r0.z = r0.z / r0.x;
  r1.x = abs(r0.z) * -0.0187292993 + 0.0742610022;
  r1.x = r1.x * abs(r0.z) + -0.212114394;
  r1.x = r1.x * abs(r0.z) + 1.57072878;
  r1.y = 1 + -abs(r0.z);
  r0.z = cmp(r0.z < -r0.z);
  r1.y = sqrt(r1.y);
  r1.z = r1.x * r1.y;
  r1.z = r1.z * -2 + 3.14159274;
  r0.z = r0.z ? r1.z : 0;
  r0.z = r1.x * r1.y + r0.z;
  r1.xy = float2(0.318309963,0.5) * BA_Fragment_14_CB1((uint)(2)).xx;
  r0.z = r0.w * r0.z + r1.y;
  r1.x = saturate(r1.x);
  r0.w = cmp(r0.z >= 0);
  r0.w = r0.w ? 1.000000 : 0;
  r1.y = cmp(1 >= abs(r0.y));
  r0.y = 1 + -r0.y;
  r1.z = cmp(0.495000005 >= r0.x);
  r1.yz = r1.yz ? float2(1,1) : 0;
  r1.y = r1.z * r1.y;
  r0.w = r1.y * r0.w;
  r1.y = cmp(BA_Fragment_14_CB1((uint)(2)).x >= r0.z);
  r1.y = r1.y ? 1.000000 : 0;
  r0.w = r0.w * r1.y + -0.5;
  r0.w = cmp(r0.w < 0);
  if (r0.w != 0) discard;
  r0.w = 1.57079601 / BA_Fragment_14_CB1((uint)(2)).x;
  r1.y = r0.z * r0.w;
  r0.z = r0.z * r0.w + -BA_Fragment_14_CB1((uint)(2)).y;
  r0.w = BA_Fragment_14_CB1((uint)(2)).y * -2 + 1.57079601;
  r0.w = 1 / r0.w;
  r0.z = saturate(r0.z * r0.w);
  r0.w = r0.z * -2 + 3;
  r0.z = r0.z * r0.z;
  r0.z = r0.w * r0.z;
  r0.zw = float2(1.57079601,-3.14159203) * r0.zz;
  r0.w = r1.y * 2 + r0.w;
  r0.z = r1.x * r0.w + r0.z;
  sincos(r0.z, r1.x, r2.x);
  r0.z = 2.01200008 * r0.x;
  r2.x = r0.z * r2.x;
  r2.y = r0.z * r1.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r2.xy, BA_Fragment_14_CB0((uint)(19)).x).xyzw;
  r0.z = BA_Fragment_14_CB1((uint)(2)).z * BA_Fragment_14_CB0((uint)(11)).y;
  r0.z = frac(r0.z);
  r2.y = r0.x * 2.01200008 + r0.z;
  r2.x = 0.5;
  r2.xyzw = _FlowTex.SampleBias(sampler_FlowTex, r2.xy, BA_Fragment_14_CB0((uint)(19)).x).xyzw;
  r0.xzw = r2.xyz * r1.www;
  r0.xzw = max(r1.xyz, r0.xzw);
  r1.x = 1 + -BA_Fragment_14_CB1((uint)(2)).w;
  r0.y = saturate(r0.y / r1.x);
  r0.xyz = r0.xzw * r0.yyy;
  o0.xyz = BA_Fragment_14_CB1((uint)(1)).xyz * r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(INSTANCING_ON)
float4 BA_Fragment_15_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_FanAngle, _FanBorderUVWeight, _FlowSpeed, _FadeStartHeight);
  if (i == 3u) value = float4(_invMatrixMVP0.x, _invMatrixMVP0.y, _invMatrixMVP0.z, _invMatrixMVP0.w);
  if (i == 4u) value = float4(_invMatrixMVP1.x, _invMatrixMVP1.y, _invMatrixMVP1.z, _invMatrixMVP1.w);
  if (i == 5u) value = float4(_invMatrixMVP2.x, _invMatrixMVP2.y, _invMatrixMVP2.z, _invMatrixMVP2.w);
  if (i == 6u) value = float4(_invMatrixMVP3.x, _invMatrixMVP3.y, _invMatrixMVP3.z, _invMatrixMVP3.w);
  return value;
}

float4 BA_Fragment_15_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  uint v3 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy / v2.ww;
  r0.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_15_CB0((uint)(19)).x).yzxw;
  r0.xy = v1.xy / v1.ww;
  r0.w = 1;
  r1.x = dot(BA_Fragment_15_CB1((uint)(3)).xyzw, r0.xyzw);
  r1.y = dot(BA_Fragment_15_CB1((uint)(4)).xyzw, r0.xyzw);
  r1.z = dot(BA_Fragment_15_CB1((uint)(5)).xyzw, r0.xyzw);
  r0.x = dot(BA_Fragment_15_CB1((uint)(6)).xyzw, r0.xyzw);
  r0.xyz = r1.xyz / r0.xxx;
  r0.w = cmp(0 < r0.x);
  r1.x = cmp(r0.x < 0);
  r0.w = (int)r0.w + (int)-r1.x;
  r0.w = (int)r0.w;
  r0.x = dot(r0.xz, r0.xz);
  r0.x = sqrt(r0.x);
  r0.z = r0.z / r0.x;
  r1.x = abs(r0.z) * -0.0187292993 + 0.0742610022;
  r1.x = r1.x * abs(r0.z) + -0.212114394;
  r1.x = r1.x * abs(r0.z) + 1.57072878;
  r1.y = 1 + -abs(r0.z);
  r0.z = cmp(r0.z < -r0.z);
  r1.y = sqrt(r1.y);
  r1.z = r1.x * r1.y;
  r1.z = r1.z * -2 + 3.14159274;
  r0.z = r0.z ? r1.z : 0;
  r0.z = r1.x * r1.y + r0.z;
  r1.xy = float2(0.318309963,0.5) * BA_Fragment_15_CB1((uint)(2)).xx;
  r0.z = r0.w * r0.z + r1.y;
  r1.x = saturate(r1.x);
  r0.w = cmp(r0.z >= 0);
  r0.w = r0.w ? 1.000000 : 0;
  r1.y = cmp(1 >= abs(r0.y));
  r0.y = 1 + -r0.y;
  r1.z = cmp(0.495000005 >= r0.x);
  r1.yz = r1.yz ? float2(1,1) : 0;
  r1.y = r1.z * r1.y;
  r0.w = r1.y * r0.w;
  r1.y = cmp(BA_Fragment_15_CB1((uint)(2)).x >= r0.z);
  r1.y = r1.y ? 1.000000 : 0;
  r0.w = r0.w * r1.y + -0.5;
  r0.w = cmp(r0.w < 0);
  if (r0.w != 0) discard;
  r0.w = 1.57079601 / BA_Fragment_15_CB1((uint)(2)).x;
  r1.y = r0.z * r0.w;
  r0.z = r0.z * r0.w + -BA_Fragment_15_CB1((uint)(2)).y;
  r0.w = BA_Fragment_15_CB1((uint)(2)).y * -2 + 1.57079601;
  r0.w = 1 / r0.w;
  r0.z = saturate(r0.z * r0.w);
  r0.w = r0.z * -2 + 3;
  r0.z = r0.z * r0.z;
  r0.z = r0.w * r0.z;
  r0.zw = float2(1.57079601,-3.14159203) * r0.zz;
  r0.w = r1.y * 2 + r0.w;
  r0.z = r1.x * r0.w + r0.z;
  sincos(r0.z, r1.x, r2.x);
  r0.z = 2.01200008 * r0.x;
  r2.x = r0.z * r2.x;
  r2.y = r0.z * r1.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r2.xy, BA_Fragment_15_CB0((uint)(19)).x).xyzw;
  r0.z = BA_Fragment_15_CB1((uint)(2)).z * BA_Fragment_15_CB0((uint)(11)).y;
  r0.z = frac(r0.z);
  r2.y = r0.x * 2.01200008 + r0.z;
  r2.x = 0.5;
  r2.xyzw = _FlowTex.SampleBias(sampler_FlowTex, r2.xy, BA_Fragment_15_CB0((uint)(19)).x).xyzw;
  r0.xzw = r2.xyz * r1.www;
  r0.xzw = max(r1.xyz, r0.xzw);
  r1.x = 1 + -BA_Fragment_15_CB1((uint)(2)).w;
  r0.y = saturate(r0.y / r1.x);
  r0.xyz = r0.xzw * r0.yyy;
  r0.xyz = BA_Fragment_15_CB1((uint)(1)).xyz * r0.xyz;
  o0.xyz = v2.zzz * r0.xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(INSTANCING_ON)
float4 BA_Fragment_16_CB1(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 2u) value = float4(_FanAngle, _FanBorderUVWeight, _FlowSpeed, _FadeStartHeight);
  if (i == 3u) value = float4(_invMatrixMVP0.x, _invMatrixMVP0.y, _invMatrixMVP0.z, _invMatrixMVP0.w);
  if (i == 4u) value = float4(_invMatrixMVP1.x, _invMatrixMVP1.y, _invMatrixMVP1.z, _invMatrixMVP1.w);
  if (i == 5u) value = float4(_invMatrixMVP2.x, _invMatrixMVP2.y, _invMatrixMVP2.z, _invMatrixMVP2.w);
  if (i == 6u) value = float4(_invMatrixMVP3.x, _invMatrixMVP3.y, _invMatrixMVP3.z, _invMatrixMVP3.w);
  return value;
}

float4 BA_Fragment_16_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  uint v3 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v2.xy / v2.ww;
  r0.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_16_CB0((uint)(19)).x).yzxw;
  r0.xy = v1.xy / v1.ww;
  r0.w = 1;
  r1.x = dot(BA_Fragment_16_CB1((uint)(3)).xyzw, r0.xyzw);
  r1.y = dot(BA_Fragment_16_CB1((uint)(4)).xyzw, r0.xyzw);
  r1.z = dot(BA_Fragment_16_CB1((uint)(5)).xyzw, r0.xyzw);
  r0.x = dot(BA_Fragment_16_CB1((uint)(6)).xyzw, r0.xyzw);
  r0.xyz = r1.xyz / r0.xxx;
  r0.w = cmp(0 < r0.x);
  r1.x = cmp(r0.x < 0);
  r0.w = (int)r0.w + (int)-r1.x;
  r0.w = (int)r0.w;
  r0.x = dot(r0.xz, r0.xz);
  r0.x = sqrt(r0.x);
  r0.z = r0.z / r0.x;
  r1.x = abs(r0.z) * -0.0187292993 + 0.0742610022;
  r1.x = r1.x * abs(r0.z) + -0.212114394;
  r1.x = r1.x * abs(r0.z) + 1.57072878;
  r1.y = 1 + -abs(r0.z);
  r0.z = cmp(r0.z < -r0.z);
  r1.y = sqrt(r1.y);
  r1.z = r1.x * r1.y;
  r1.z = r1.z * -2 + 3.14159274;
  r0.z = r0.z ? r1.z : 0;
  r0.z = r1.x * r1.y + r0.z;
  r1.xy = float2(0.318309963,0.5) * BA_Fragment_16_CB1((uint)(2)).xx;
  r0.z = r0.w * r0.z + r1.y;
  r1.x = saturate(r1.x);
  r0.w = cmp(r0.z >= 0);
  r0.w = r0.w ? 1.000000 : 0;
  r1.y = cmp(1 >= abs(r0.y));
  r0.y = 1 + -r0.y;
  r1.z = cmp(0.495000005 >= r0.x);
  r1.yz = r1.yz ? float2(1,1) : 0;
  r1.y = r1.z * r1.y;
  r0.w = r1.y * r0.w;
  r1.y = cmp(BA_Fragment_16_CB1((uint)(2)).x >= r0.z);
  r1.y = r1.y ? 1.000000 : 0;
  r0.w = r0.w * r1.y + -0.5;
  r0.w = cmp(r0.w < 0);
  if (r0.w != 0) discard;
  r0.w = 1.57079601 / BA_Fragment_16_CB1((uint)(2)).x;
  r1.y = r0.z * r0.w;
  r0.z = r0.z * r0.w + -BA_Fragment_16_CB1((uint)(2)).y;
  r0.w = BA_Fragment_16_CB1((uint)(2)).y * -2 + 1.57079601;
  r0.w = 1 / r0.w;
  r0.z = saturate(r0.z * r0.w);
  r0.w = r0.z * -2 + 3;
  r0.z = r0.z * r0.z;
  r0.z = r0.w * r0.z;
  r0.zw = float2(1.57079601,-3.14159203) * r0.zz;
  r0.w = r1.y * 2 + r0.w;
  r0.z = r1.x * r0.w + r0.z;
  sincos(r0.z, r1.x, r2.x);
  r0.z = 2.01200008 * r0.x;
  r2.x = r0.z * r2.x;
  r2.y = r0.z * r1.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r2.xy, BA_Fragment_16_CB0((uint)(19)).x).xyzw;
  r0.z = BA_Fragment_16_CB1((uint)(2)).z * BA_Fragment_16_CB0((uint)(11)).y;
  r0.z = frac(r0.z);
  r2.y = r0.x * 2.01200008 + r0.z;
  r2.x = 0.5;
  r2.xyzw = _FlowTex.SampleBias(sampler_FlowTex, r2.xy, BA_Fragment_16_CB0((uint)(19)).x).xyzw;
  r0.xzw = r2.xyz * r1.www;
  r0.xzw = max(r1.xyz, r0.xzw);
  r1.x = 1 + -BA_Fragment_16_CB1((uint)(2)).w;
  r0.y = saturate(r0.y / r1.x);
  r0.xyz = r0.xzw * r0.yyy;
  r0.xyz = BA_Fragment_16_CB1((uint)(1)).xyz * r0.xyz;
  r0.w = exp2(-v2.z);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz;
  o0.w = 1;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
