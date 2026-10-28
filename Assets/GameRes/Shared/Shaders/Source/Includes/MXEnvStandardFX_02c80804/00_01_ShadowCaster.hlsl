// Exact names and types from the original compiled parameter metadata.
float _Cutoff;
float3 _LightDirection;
float4 _MainTex_ST;
float4 _ShadowBias;
float4 _ShadowCoordModifier;
Texture2D<float4> _MainTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(INSTANCING_ON) && !defined(_ENV_CUTOUT_MODE)
float4 BA_Vertex_302_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_302_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_ShadowBias.x, _ShadowBias.y, _ShadowBias.z, _ShadowBias.w);
  if (i == 125u) value = float4(_LightDirection.x, _LightDirection.y, _LightDirection.z, 0.0);
  if (i == 127u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  out float4 o0 : SV_POSITION0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_302_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_302_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_302_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_302_CB1((uint)(3)).xyz + r0.xyz;
  r0.xyz = BA_Vertex_302_CB0((uint)(125)).xyz * BA_Vertex_302_CB0((uint)(124)).xxx + r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_302_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_302_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_302_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = saturate(dot(BA_Vertex_302_CB0((uint)(125)).xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_302_CB0((uint)(124)).y * r0.w;
  r0.xyz = r1.xyz * r0.www + r0.xyz;
  r1.xyzw = BA_Vertex_302_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_302_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_302_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_302_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.xy = BA_Vertex_302_CB0((uint)(127)).yy * BA_Vertex_302_CB0((uint)(74)).xy;
  r1.xy = BA_Vertex_302_CB0((uint)(73)).xy * BA_Vertex_302_CB0((uint)(127)).xx + r1.xy;
  r1.xy = BA_Vertex_302_CB0((uint)(75)).xy * BA_Vertex_302_CB0((uint)(127)).zz + r1.xy;
  r1.xy = BA_Vertex_302_CB0((uint)(76)).xy + r1.xy;
  r1.z = saturate(BA_Vertex_302_CB0((uint)(127)).w);
  r0.xy = -r1.xy * r1.zz + r0.xy;
  r1.x = max(1, BA_Vertex_302_CB0((uint)(127)).w);
  o0.xy = r1.xx * r0.xy;
  o0.z = min(1, r0.z);
  o0.w = r0.w;
  return;
}
#elif !defined(INSTANCING_ON) && defined(_ENV_CUTOUT_MODE)
float4 BA_Vertex_303_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value;
}

float4 BA_Vertex_303_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_303_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_ShadowBias.x, _ShadowBias.y, _ShadowBias.z, _ShadowBias.w);
  if (i == 125u) value = float4(_LightDirection.x, _LightDirection.y, _LightDirection.z, 0.0);
  if (i == 127u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  out float2 o0 : TEXCOORD0,
  out float4 o1 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_303_CB1((uint)(0)).xy + BA_Vertex_303_CB1((uint)(0)).zw;
  r0.xyz = BA_Vertex_303_CB2((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_303_CB2((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_303_CB2((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_303_CB2((uint)(3)).xyz + r0.xyz;
  r0.xyz = BA_Vertex_303_CB0((uint)(125)).xyz * BA_Vertex_303_CB0((uint)(124)).xxx + r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_303_CB2((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_303_CB2((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_303_CB2((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = saturate(dot(BA_Vertex_303_CB0((uint)(125)).xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_303_CB0((uint)(124)).y * r0.w;
  r0.xyz = r1.xyz * r0.www + r0.xyz;
  r1.xyzw = BA_Vertex_303_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_303_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_303_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_303_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.xy = BA_Vertex_303_CB0((uint)(127)).yy * BA_Vertex_303_CB0((uint)(74)).xy;
  r1.xy = BA_Vertex_303_CB0((uint)(73)).xy * BA_Vertex_303_CB0((uint)(127)).xx + r1.xy;
  r1.xy = BA_Vertex_303_CB0((uint)(75)).xy * BA_Vertex_303_CB0((uint)(127)).zz + r1.xy;
  r1.xy = BA_Vertex_303_CB0((uint)(76)).xy + r1.xy;
  r1.z = saturate(BA_Vertex_303_CB0((uint)(127)).w);
  r0.xy = -r1.xy * r1.zz + r0.xy;
  r1.x = max(1, BA_Vertex_303_CB0((uint)(127)).w);
  o1.xy = r1.xx * r0.xy;
  o1.z = min(1, r0.z);
  o1.w = r0.w;
  return;
}
#elif defined(INSTANCING_ON) && !defined(_ENV_CUTOUT_MODE)
float4 BA_Vertex_304_CB2(uint i)
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

float4 BA_Vertex_304_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_304_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_ShadowBias.x, _ShadowBias.y, _ShadowBias.z, _ShadowBias.w);
  if (i == 125u) value = float4(_LightDirection.x, _LightDirection.y, _LightDirection.z, 0.0);
  if (i == 127u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  uint v2 : SV_InstanceID0,
  out float4 o0 : SV_POSITION0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v2);
#endif
  o0 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v2.x + asint(BA_Vertex_304_CB1((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.x = dot(v1.xyz, BA_Vertex_304_CB2((uint)(r0.x+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_304_CB2((uint)(r0.x+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_304_CB2((uint)(r0.x+6)).xyz);
  r0.y = dot(r1.xyz, r1.xyz);
  r0.y = max(1.17549435e-038, r0.y);
  r0.y = rsqrt(r0.y);
  r0.yzw = r1.xyz * r0.yyy;
  r1.x = saturate(dot(BA_Vertex_304_CB0((uint)(125)).xyz, r0.yzw));
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_304_CB0((uint)(124)).y * r1.x;
  r1.yzw = BA_Vertex_304_CB2((uint)(r0.x+1)).xyz * v0.yyy;
  r1.yzw = BA_Vertex_304_CB2((uint)(r0.x+0)).xyz * v0.xxx + r1.yzw;
  r1.yzw = BA_Vertex_304_CB2((uint)(r0.x+2)).xyz * v0.zzz + r1.yzw;
  r1.yzw = BA_Vertex_304_CB2((uint)(r0.x+3)).xyz + r1.yzw;
  r1.yzw = BA_Vertex_304_CB0((uint)(125)).xyz * BA_Vertex_304_CB0((uint)(124)).xxx + r1.yzw;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r1.xyzw = BA_Vertex_304_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_304_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_304_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_304_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.xy = BA_Vertex_304_CB0((uint)(127)).yy * BA_Vertex_304_CB0((uint)(74)).xy;
  r1.xy = BA_Vertex_304_CB0((uint)(73)).xy * BA_Vertex_304_CB0((uint)(127)).xx + r1.xy;
  r1.xy = BA_Vertex_304_CB0((uint)(75)).xy * BA_Vertex_304_CB0((uint)(127)).zz + r1.xy;
  r1.xy = BA_Vertex_304_CB0((uint)(76)).xy + r1.xy;
  r1.z = saturate(BA_Vertex_304_CB0((uint)(127)).w);
  r0.xy = -r1.xy * r1.zz + r0.xy;
  r1.x = max(1, BA_Vertex_304_CB0((uint)(127)).w);
  o0.xy = r1.xx * r0.xy;
  o0.z = min(1, r0.z);
  o0.w = r0.w;
  return;
}
#elif defined(INSTANCING_ON) && defined(_ENV_CUTOUT_MODE)
float4 BA_Vertex_305_CB3(uint i)
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

float4 BA_Vertex_305_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(asfloat(unity_BaseInstanceID), 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_305_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_MainTex_ST.x, _MainTex_ST.y, _MainTex_ST.z, _MainTex_ST.w);
  return value;
}

float4 BA_Vertex_305_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_ShadowBias.x, _ShadowBias.y, _ShadowBias.z, _ShadowBias.w);
  if (i == 125u) value = float4(_LightDirection.x, _LightDirection.y, _LightDirection.z, 0.0);
  if (i == 127u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float2 v2 : TEXCOORD0,
  uint v3 : SV_InstanceID0,
  out float2 o0 : TEXCOORD0,
  out float4 o1 : SV_POSITION0)
{
#if defined(UNITY_INSTANCING_ENABLED)
  UnitySetupInstanceID(v3);
#endif
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v2.xy * BA_Vertex_305_CB1((uint)(0)).xy + BA_Vertex_305_CB1((uint)(0)).zw;
  r0.x = (int)v3.x + asint(BA_Vertex_305_CB2((uint)(0)).x);
  r0.x = (uint)r0.x << 3;
  r1.x = dot(v1.xyz, BA_Vertex_305_CB3((uint)(r0.x+4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_305_CB3((uint)(r0.x+5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_305_CB3((uint)(r0.x+6)).xyz);
  r0.y = dot(r1.xyz, r1.xyz);
  r0.y = max(1.17549435e-038, r0.y);
  r0.y = rsqrt(r0.y);
  r0.yzw = r1.xyz * r0.yyy;
  r1.x = saturate(dot(BA_Vertex_305_CB0((uint)(125)).xyz, r0.yzw));
  r1.x = 1 + -r1.x;
  r1.x = BA_Vertex_305_CB0((uint)(124)).y * r1.x;
  r1.yzw = BA_Vertex_305_CB3((uint)(r0.x+1)).xyz * v0.yyy;
  r1.yzw = BA_Vertex_305_CB3((uint)(r0.x+0)).xyz * v0.xxx + r1.yzw;
  r1.yzw = BA_Vertex_305_CB3((uint)(r0.x+2)).xyz * v0.zzz + r1.yzw;
  r1.yzw = BA_Vertex_305_CB3((uint)(r0.x+3)).xyz + r1.yzw;
  r1.yzw = BA_Vertex_305_CB0((uint)(125)).xyz * BA_Vertex_305_CB0((uint)(124)).xxx + r1.yzw;
  r0.xyz = r0.yzw * r1.xxx + r1.yzw;
  r1.xyzw = BA_Vertex_305_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_305_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_305_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_305_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.xy = BA_Vertex_305_CB0((uint)(127)).yy * BA_Vertex_305_CB0((uint)(74)).xy;
  r1.xy = BA_Vertex_305_CB0((uint)(73)).xy * BA_Vertex_305_CB0((uint)(127)).xx + r1.xy;
  r1.xy = BA_Vertex_305_CB0((uint)(75)).xy * BA_Vertex_305_CB0((uint)(127)).zz + r1.xy;
  r1.xy = BA_Vertex_305_CB0((uint)(76)).xy + r1.xy;
  r1.z = saturate(BA_Vertex_305_CB0((uint)(127)).w);
  r0.xy = -r1.xy * r1.zz + r0.xy;
  r1.x = max(1, BA_Vertex_305_CB0((uint)(127)).w);
  o1.xy = r1.xx * r0.xy;
  o1.z = min(1, r0.z);
  o1.w = r0.w;
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
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = float4(0,0,0,0);
  return;
}
#elif defined(INSTANCING_ON) && defined(_ENV_CUTOUT_MODE)
float4 BA_Fragment_311_CB1(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_Cutoff, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_311_CB0(uint i)
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

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v0.xy, BA_Fragment_311_CB0((uint)(19)).x).xyzw;
  r0.x = -BA_Fragment_311_CB1((uint)(2)).x + r0.w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = float4(0,0,0,0);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
