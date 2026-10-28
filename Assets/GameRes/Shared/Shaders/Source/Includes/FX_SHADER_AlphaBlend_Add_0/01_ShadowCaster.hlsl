// Exact names and types from the original compiled parameter metadata.
float3 _LightDirection;
float4 _ShadowBias;
float4 _ShadowCoordModifier;
#ifndef cmp
#define cmp -
#endif

#if !defined(INSTANCING_ON)
float4 BA_Vertex_9_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_9_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_ShadowBias.x, _ShadowBias.y, _ShadowBias.z, _ShadowBias.w);
  if (i == 125u) value = float4(_LightDirection.x, _LightDirection.y, _LightDirection.z, 0.0);
  if (i == 127u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD1,
  float4 v4 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD2,
  out float4 o2 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_9_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_9_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(3)).xyz + r0.xyz;
  r0.xyz = BA_Vertex_9_CB0((uint)(125)).xyz * BA_Vertex_9_CB0((uint)(124)).xxx + r0.xyz;
  r1.xyz = BA_Vertex_9_CB1((uint)(1)).xyz * v1.yyy;
  r1.xyz = BA_Vertex_9_CB1((uint)(0)).xyz * v1.xxx + r1.xyz;
  r1.xyz = BA_Vertex_9_CB1((uint)(2)).xyz * v1.zzz + r1.xyz;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = saturate(dot(BA_Vertex_9_CB0((uint)(125)).xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_9_CB0((uint)(124)).y * r0.w;
  r0.xyz = r1.xyz * r0.www + r0.xyz;
  r1.xyzw = BA_Vertex_9_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_9_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_9_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.xy = BA_Vertex_9_CB0((uint)(127)).yy * BA_Vertex_9_CB0((uint)(74)).xy;
  r1.xy = BA_Vertex_9_CB0((uint)(73)).xy * BA_Vertex_9_CB0((uint)(127)).xx + r1.xy;
  r1.xy = BA_Vertex_9_CB0((uint)(75)).xy * BA_Vertex_9_CB0((uint)(127)).zz + r1.xy;
  r1.xy = BA_Vertex_9_CB0((uint)(76)).xy + r1.xy;
  r1.z = saturate(BA_Vertex_9_CB0((uint)(127)).w);
  r0.xy = -r1.xy * r1.zz + r0.xy;
  r1.x = max(1, BA_Vertex_9_CB0((uint)(127)).w);
  o0.xy = r1.xx * r0.xy;
  o0.z = min(1, r0.z);
  o0.w = r0.w;
  o1.xy = v2.xy;
  o1.zw = v3.xy;
  o2.xyzw = v4.xyzw;
  return;
}
#elif defined(INSTANCING_ON)
float4 BA_Vertex_10_CB2(uint i)
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

float4 BA_Vertex_10_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_10_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_ShadowBias.x, _ShadowBias.y, _ShadowBias.z, _ShadowBias.w);
  if (i == 125u) value = float4(_LightDirection.x, _LightDirection.y, _LightDirection.z, 0.0);
  if (i == 127u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD1,
  float4 v4 : COLOR0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD2,
  out float4 o2 : COLOR0,
  out uint o3 : SV_InstanceID0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v5);
#endif
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v5.x + asint(BA_Vertex_10_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r0.yzw = BA_Vertex_10_CB2((uint)(r0.x+1)).xyz * v1.yyy;
  r0.yzw = BA_Vertex_10_CB2((uint)(r0.x+0)).xyz * v1.xxx + r0.yzw;
  r0.yzw = BA_Vertex_10_CB2((uint)(r0.x+2)).xyz * v1.zzz + r0.yzw;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.x = max(1.17549435e-038, r1.x);
  r1.x = rsqrt(r1.x);
  r0.yzw = r1.xxx * r0.yzw;
  r1.x = saturate(dot(BA_Vertex_10_CB0((uint)(125)).xyz, r0.yzw));
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_10_CB0((uint)(124)).y * r1.x;
  r1.yzw = BA_Vertex_10_CB2((uint)(r0.x+1)).xyz * v0.yyy;
  r1.yzw = BA_Vertex_10_CB2((uint)(r0.x+0)).xyz * v0.xxx + r1.yzw;
  r1.yzw = BA_Vertex_10_CB2((uint)(r0.x+2)).xyz * v0.zzz + r1.yzw;
  r1.yzw = BA_Vertex_10_CB2((uint)(r0.x+3)).xyz + r1.yzw;
  r1.yzw = BA_Vertex_10_CB0((uint)(125)).xyz * BA_Vertex_10_CB0((uint)(124)).xxx + r1.yzw;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_10_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_10_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.xy = BA_Vertex_10_CB0((uint)(127)).yy * BA_Vertex_10_CB0((uint)(74)).xy;
  r1.xy = BA_Vertex_10_CB0((uint)(73)).xy * BA_Vertex_10_CB0((uint)(127)).xx + r1.xy;
  r1.xy = BA_Vertex_10_CB0((uint)(75)).xy * BA_Vertex_10_CB0((uint)(127)).zz + r1.xy;
  r1.xy = BA_Vertex_10_CB0((uint)(76)).xy + r1.xy;
  r1.z = saturate(BA_Vertex_10_CB0((uint)(127)).w);
  r0.xy = -r1.xy * r1.zz + r0.xy;
  r1.x = max(1, BA_Vertex_10_CB0((uint)(127)).w);
  o0.xy = r1.xx * r0.xy;
  o0.z = min(1, r0.z);
  o0.w = r0.w;
  o1.xy = v2.xy;
  o1.zw = v3.xy;
  o2.xyzw = v4.xyzw;
  o3.x = v5.x;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(INSTANCING_ON)

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD2,
  float4 v2 : COLOR0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = float4(0,0,0,0);
  return;
}
#elif defined(INSTANCING_ON)

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD2,
  float4 v2 : COLOR0,
  uint v3 : SV_InstanceID0,
  out float4 o0 : SV_TARGET0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;

  o0.xyzw = float4(0,0,0,0);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
