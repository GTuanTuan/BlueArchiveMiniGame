// Exact names and types from the original compiled parameter metadata.
float4 _CodeAddColor;
float4 _CodeAddRimColor;
float4 _CodeMultiplyColor;
float _DissolveDirection;
float _DissolveLineThinness;
float _DissolveStartHeight;
float4 _DissolveTex_TexelSize;
float _DitherThreshold;
float _FxSpeed;
float _FxStrength;
float4 _FxTex_ST;
float4 _FxTint;
float _GlowStrength;
float4 _GlowTint;
float _GrayBrightness;
float _MaskGSensitivity;
float4 _MxCharLightData;
float3 _MxCharLightDir;
float3 _MxCharLightTone;
float3 _MxCharShadowTone;
float _RimAreaLeveler;
float _RimAreaMultiplier;
float _RimStrength;
float _ShadowThreshold;
float4 _ShadowTint;
float4 _Tint;
float _ViewOffset;
float _ViewPower;
float _ViewStrength;
Texture2D<float4> _DissolveTex;
Texture2D<float4> _FxTex;
Texture2D<float4> _MainTex;
Texture2D<float4> _MaskTex;
SamplerState sampler_DissolveTex;
SamplerState sampler_FxTex;
SamplerState sampler_MainTex;
SamplerState sampler_MaskTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_4_CB2(uint i)
{
  float4 value = 0;
  if (i == 7u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 8u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 10u) value = float4(_FxTex_ST.x, _FxTex_ST.y, _FxTex_ST.z, _FxTex_ST.w);
  return value;
}

float4 BA_Vertex_4_CB1(uint i)
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

float4 BA_Vertex_4_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 126u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_4_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_4_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_4_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_4_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_4_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_4_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_4_CB0((uint)(76)).yxzw + r1.yxzw;
  o0.xyzw = r1.yxzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_4_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_4_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_4_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  o1.w = dot(r2.xyz, r0.xyz);
  o3.xyz = r0.xyz;
  o1.z = dot(r2.xyz, BA_Vertex_4_CB0((uint)(124)).xyz);
  o2.xyz = r2.xyz;
  o1.xy = v3.xy;
  o2.w = v2.w;
  o3.w = 0;
  r1.z = BA_Vertex_4_CB0((uint)(17)).x * r1.x;
  r0.xy = r1.yz + r1.ww;
  r0.z = 0.5 / r1.w;
  r1.xyz = BA_Vertex_4_CB1((uint)(3)).yyy * BA_Vertex_4_CB0((uint)(74)).xyw;
  r1.xyz = BA_Vertex_4_CB0((uint)(73)).xyw * BA_Vertex_4_CB1((uint)(3)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_4_CB0((uint)(75)).xyw * BA_Vertex_4_CB1((uint)(3)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_4_CB0((uint)(76)).xyw * BA_Vertex_4_CB1((uint)(3)).www + r1.xyz;
  r1.w = BA_Vertex_4_CB0((uint)(17)).x * r1.y;
  r1.xy = r1.xw + r1.zz;
  r0.w = 0.5 / r1.z;
  r1.xy = r1.xy * r0.ww;
  r0.yz = r0.xy * r0.zz + -r1.xy;
  r0.w = BA_Vertex_4_CB0((uint)(18)).x / BA_Vertex_4_CB0((uint)(18)).y;
  r0.x = r0.y * r0.w;
  o4.xy = r0.xz * BA_Vertex_4_CB2((uint)(10)).xy + BA_Vertex_4_CB2((uint)(10)).zw;
  r0.x = 1 + -BA_Vertex_4_CB0((uint)(127)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_4_CB2((uint)(8)).x;
  o5.xyz = BA_Vertex_4_CB2((uint)(7)).xyz * BA_Vertex_4_CB0((uint)(126)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_5_CB2(uint i)
{
  float4 value = 0;
  if (i == 7u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 8u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 10u) value = float4(_FxTex_ST.x, _FxTex_ST.y, _FxTex_ST.z, _FxTex_ST.w);
  return value;
}

float4 BA_Vertex_5_CB1(uint i)
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

float4 BA_Vertex_5_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 126u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_5_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_5_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_5_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_5_CB0((uint)(76)).yxzw + r1.yxzw;
  o0.xyzw = r1.yxzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_5_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_5_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_5_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  o1.w = dot(r2.xyz, r0.xyz);
  o3.xyz = r0.xyz;
  o1.z = dot(r2.xyz, BA_Vertex_5_CB0((uint)(124)).xyz);
  o2.xyz = r2.xyz;
  o1.xy = v3.xy;
  o2.w = v2.w;
  o3.w = 0;
  r1.z = BA_Vertex_5_CB0((uint)(17)).x * r1.x;
  r0.xy = r1.yz + r1.ww;
  r0.z = 0.5 / r1.w;
  r1.xyz = BA_Vertex_5_CB1((uint)(3)).yyy * BA_Vertex_5_CB0((uint)(74)).xyw;
  r1.xyz = BA_Vertex_5_CB0((uint)(73)).xyw * BA_Vertex_5_CB1((uint)(3)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_5_CB0((uint)(75)).xyw * BA_Vertex_5_CB1((uint)(3)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_5_CB0((uint)(76)).xyw * BA_Vertex_5_CB1((uint)(3)).www + r1.xyz;
  r1.w = BA_Vertex_5_CB0((uint)(17)).x * r1.y;
  r1.xy = r1.xw + r1.zz;
  r0.w = 0.5 / r1.z;
  r1.xy = r1.xy * r0.ww;
  r0.yz = r0.xy * r0.zz + -r1.xy;
  r0.w = BA_Vertex_5_CB0((uint)(18)).x / BA_Vertex_5_CB0((uint)(18)).y;
  r0.x = r0.y * r0.w;
  o4.xy = r0.xz * BA_Vertex_5_CB2((uint)(10)).xy + BA_Vertex_5_CB2((uint)(10)).zw;
  r0.x = 1 + -BA_Vertex_5_CB0((uint)(127)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_5_CB2((uint)(8)).x;
  o5.xyz = BA_Vertex_5_CB2((uint)(7)).xyz * BA_Vertex_5_CB0((uint)(126)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_6_CB2(uint i)
{
  float4 value = 0;
  if (i == 7u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 10u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 11u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 13u) value = float4(_FxTex_ST.x, _FxTex_ST.y, _FxTex_ST.z, _FxTex_ST.w);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_6_CB1(uint i)
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

float4 BA_Vertex_6_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 126u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4,
  out float3 o6 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_6_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_6_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_6_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_6_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_6_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.xyz = BA_Vertex_6_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  r0.xyz = r1.zzz * r0.xyz;
  r2.x = dot(v1.xyz, BA_Vertex_6_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_6_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_6_CB1((uint)(6)).xyz);
  r1.z = dot(r2.xyz, r2.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  r2.xyz = r2.xyz * r1.zzz;
  o1.w = dot(r2.xyz, r0.xyz);
  o3.xyz = r0.xyz;
  o1.z = dot(r2.xyz, BA_Vertex_6_CB0((uint)(124)).xyz);
  o2.xyz = r2.xyz;
  o1.xy = v3.xy;
  o2.w = v2.w;
  o3.w = 0;
  r1.y = BA_Vertex_6_CB0((uint)(17)).x * r1.y;
  r0.xy = r1.xy + r1.ww;
  r0.z = 0.5 / r1.w;
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_6_CB1((uint)(3)).yyy * BA_Vertex_6_CB0((uint)(74)).xyw;
  r1.xyz = BA_Vertex_6_CB0((uint)(73)).xyw * BA_Vertex_6_CB1((uint)(3)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_6_CB0((uint)(75)).xyw * BA_Vertex_6_CB1((uint)(3)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_6_CB0((uint)(76)).xyw * BA_Vertex_6_CB1((uint)(3)).www + r1.xyz;
  r1.w = BA_Vertex_6_CB0((uint)(17)).x * r1.y;
  r1.xy = r1.xw + r1.zz;
  r0.z = 0.5 / r1.z;
  r1.yz = -r1.xy * r0.zz + r0.xy;
  o6.xy = r0.xy;
  r0.x = BA_Vertex_6_CB0((uint)(18)).x / BA_Vertex_6_CB0((uint)(18)).y;
  r1.x = r1.y * r0.x;
  o4.xy = r1.xz * BA_Vertex_6_CB2((uint)(13)).xy + BA_Vertex_6_CB2((uint)(13)).zw;
  r0.x = 1 + -BA_Vertex_6_CB0((uint)(127)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_6_CB2((uint)(11)).x;
  o5.xyz = BA_Vertex_6_CB2((uint)(10)).xyz * BA_Vertex_6_CB0((uint)(126)).xyz;
  r0.x = BA_Vertex_6_CB2((uint)(7)).y + -r0.w;
  r0.x = BA_Vertex_6_CB2((uint)(7)).x * r0.x;
  r0.y = 1 + -BA_Vertex_6_CB2((uint)(7)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_6_CB2((uint)(7)).y;
  r0.y = 1 + -BA_Vertex_6_CB2((uint)(17)).x;
  r0.x = r0.y + -r0.x;
  o6.z = saturate(BA_Vertex_6_CB2((uint)(7)).z * r0.x);
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_7_CB2(uint i)
{
  float4 value = 0;
  if (i == 7u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 10u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 11u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 13u) value = float4(_FxTex_ST.x, _FxTex_ST.y, _FxTex_ST.z, _FxTex_ST.w);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_7_CB1(uint i)
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

float4 BA_Vertex_7_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 126u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4,
  out float3 o6 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_7_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_7_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_7_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_7_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_7_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.xyz = BA_Vertex_7_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  r0.xyz = r1.zzz * r0.xyz;
  r2.x = dot(v1.xyz, BA_Vertex_7_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_7_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_7_CB1((uint)(6)).xyz);
  r1.z = dot(r2.xyz, r2.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  r2.xyz = r2.xyz * r1.zzz;
  o1.w = dot(r2.xyz, r0.xyz);
  o3.xyz = r0.xyz;
  o1.z = dot(r2.xyz, BA_Vertex_7_CB0((uint)(124)).xyz);
  o2.xyz = r2.xyz;
  o1.xy = v3.xy;
  o2.w = v2.w;
  o3.w = 0;
  r1.y = BA_Vertex_7_CB0((uint)(17)).x * r1.y;
  r0.xy = r1.xy + r1.ww;
  r0.z = 0.5 / r1.w;
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_7_CB1((uint)(3)).yyy * BA_Vertex_7_CB0((uint)(74)).xyw;
  r1.xyz = BA_Vertex_7_CB0((uint)(73)).xyw * BA_Vertex_7_CB1((uint)(3)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_7_CB0((uint)(75)).xyw * BA_Vertex_7_CB1((uint)(3)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_7_CB0((uint)(76)).xyw * BA_Vertex_7_CB1((uint)(3)).www + r1.xyz;
  r1.w = BA_Vertex_7_CB0((uint)(17)).x * r1.y;
  r1.xy = r1.xw + r1.zz;
  r0.z = 0.5 / r1.z;
  r1.yz = -r1.xy * r0.zz + r0.xy;
  o6.xy = r0.xy;
  r0.x = BA_Vertex_7_CB0((uint)(18)).x / BA_Vertex_7_CB0((uint)(18)).y;
  r1.x = r1.y * r0.x;
  o4.xy = r1.xz * BA_Vertex_7_CB2((uint)(13)).xy + BA_Vertex_7_CB2((uint)(13)).zw;
  r0.x = 1 + -BA_Vertex_7_CB0((uint)(127)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_7_CB2((uint)(11)).x;
  o5.xyz = BA_Vertex_7_CB2((uint)(10)).xyz * BA_Vertex_7_CB0((uint)(126)).xyz;
  r0.x = BA_Vertex_7_CB2((uint)(7)).y + -r0.w;
  r0.x = BA_Vertex_7_CB2((uint)(7)).x * r0.x;
  r0.y = 1 + -BA_Vertex_7_CB2((uint)(7)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_7_CB2((uint)(7)).y;
  r0.y = 1 + -BA_Vertex_7_CB2((uint)(17)).x;
  r0.x = r0.y + -r0.x;
  o6.z = saturate(BA_Vertex_7_CB2((uint)(7)).z * r0.x);
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_8_CB2(uint i)
{
  float4 value = 0;
  if (i == 7u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 8u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 10u) value = float4(_FxTex_ST.x, _FxTex_ST.y, _FxTex_ST.z, _FxTex_ST.w);
  return value;
}

float4 BA_Vertex_8_CB1(uint i)
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

float4 BA_Vertex_8_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 126u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_8_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_8_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_8_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_8_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_8_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_8_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_8_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_8_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_8_CB0((uint)(76)).yxzw + r1.yxzw;
  o0.xyzw = r1.yxzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_8_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_8_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_8_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  o1.w = dot(r2.xyz, r0.xyz);
  o3.xyz = r0.xyz;
  o1.z = dot(r2.xyz, BA_Vertex_8_CB0((uint)(124)).xyz);
  o2.xyz = r2.xyz;
  o1.xy = v3.xy;
  o2.w = v2.w;
  r0.x = r1.z / BA_Vertex_8_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_8_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o3.w = saturate(r0.x * BA_Vertex_8_CB0((uint)(55)).z + BA_Vertex_8_CB0((uint)(55)).w);
  r1.z = BA_Vertex_8_CB0((uint)(17)).x * r1.x;
  r0.xy = r1.yz + r1.ww;
  r0.z = 0.5 / r1.w;
  r1.xyz = BA_Vertex_8_CB1((uint)(3)).yyy * BA_Vertex_8_CB0((uint)(74)).xyw;
  r1.xyz = BA_Vertex_8_CB0((uint)(73)).xyw * BA_Vertex_8_CB1((uint)(3)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_8_CB0((uint)(75)).xyw * BA_Vertex_8_CB1((uint)(3)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_8_CB0((uint)(76)).xyw * BA_Vertex_8_CB1((uint)(3)).www + r1.xyz;
  r1.w = BA_Vertex_8_CB0((uint)(17)).x * r1.y;
  r1.xy = r1.xw + r1.zz;
  r0.w = 0.5 / r1.z;
  r1.xy = r1.xy * r0.ww;
  r0.yz = r0.xy * r0.zz + -r1.xy;
  r0.w = BA_Vertex_8_CB0((uint)(18)).x / BA_Vertex_8_CB0((uint)(18)).y;
  r0.x = r0.y * r0.w;
  o4.xy = r0.xz * BA_Vertex_8_CB2((uint)(10)).xy + BA_Vertex_8_CB2((uint)(10)).zw;
  r0.x = 1 + -BA_Vertex_8_CB0((uint)(127)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_8_CB2((uint)(8)).x;
  o5.xyz = BA_Vertex_8_CB2((uint)(7)).xyz * BA_Vertex_8_CB0((uint)(126)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_9_CB2(uint i)
{
  float4 value = 0;
  if (i == 7u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 8u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 10u) value = float4(_FxTex_ST.x, _FxTex_ST.y, _FxTex_ST.z, _FxTex_ST.w);
  return value;
}

float4 BA_Vertex_9_CB1(uint i)
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

float4 BA_Vertex_9_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 126u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_9_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_9_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_9_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_9_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_9_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_9_CB0((uint)(76)).yxzw + r1.yxzw;
  o0.xyzw = r1.yxzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_9_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_9_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_9_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  o1.w = dot(r2.xyz, r0.xyz);
  o3.xyz = r0.xyz;
  o1.z = dot(r2.xyz, BA_Vertex_9_CB0((uint)(124)).xyz);
  o2.xyz = r2.xyz;
  o1.xy = v3.xy;
  o2.w = v2.w;
  r0.x = r1.z / BA_Vertex_9_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_9_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o3.w = saturate(r0.x * BA_Vertex_9_CB0((uint)(55)).z + BA_Vertex_9_CB0((uint)(55)).w);
  r1.z = BA_Vertex_9_CB0((uint)(17)).x * r1.x;
  r0.xy = r1.yz + r1.ww;
  r0.z = 0.5 / r1.w;
  r1.xyz = BA_Vertex_9_CB1((uint)(3)).yyy * BA_Vertex_9_CB0((uint)(74)).xyw;
  r1.xyz = BA_Vertex_9_CB0((uint)(73)).xyw * BA_Vertex_9_CB1((uint)(3)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_9_CB0((uint)(75)).xyw * BA_Vertex_9_CB1((uint)(3)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_9_CB0((uint)(76)).xyw * BA_Vertex_9_CB1((uint)(3)).www + r1.xyz;
  r1.w = BA_Vertex_9_CB0((uint)(17)).x * r1.y;
  r1.xy = r1.xw + r1.zz;
  r0.w = 0.5 / r1.z;
  r1.xy = r1.xy * r0.ww;
  r0.yz = r0.xy * r0.zz + -r1.xy;
  r0.w = BA_Vertex_9_CB0((uint)(18)).x / BA_Vertex_9_CB0((uint)(18)).y;
  r0.x = r0.y * r0.w;
  o4.xy = r0.xz * BA_Vertex_9_CB2((uint)(10)).xy + BA_Vertex_9_CB2((uint)(10)).zw;
  r0.x = 1 + -BA_Vertex_9_CB0((uint)(127)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_9_CB2((uint)(8)).x;
  o5.xyz = BA_Vertex_9_CB2((uint)(7)).xyz * BA_Vertex_9_CB0((uint)(126)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_10_CB2(uint i)
{
  float4 value = 0;
  if (i == 7u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 10u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 11u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 13u) value = float4(_FxTex_ST.x, _FxTex_ST.y, _FxTex_ST.z, _FxTex_ST.w);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_10_CB1(uint i)
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

float4 BA_Vertex_10_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 126u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4,
  out float3 o6 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_10_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_10_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_10_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_10_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_10_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.xyz = BA_Vertex_10_CB0((uint)(16)).xyz + -r0.xyz;
  r2.x = dot(r0.xyz, r0.xyz);
  r2.x = max(1.17549435e-038, r2.x);
  r2.x = rsqrt(r2.x);
  r0.xyz = r2.xxx * r0.xyz;
  r2.x = dot(v1.xyz, BA_Vertex_10_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_10_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_10_CB1((uint)(6)).xyz);
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = max(1.17549435e-038, r2.w);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  o1.w = dot(r2.xyz, r0.xyz);
  o3.xyz = r0.xyz;
  o1.z = dot(r2.xyz, BA_Vertex_10_CB0((uint)(124)).xyz);
  o2.xyz = r2.xyz;
  o1.xy = v3.xy;
  o2.w = v2.w;
  r0.x = r1.z / BA_Vertex_10_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_10_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o3.w = saturate(r0.x * BA_Vertex_10_CB0((uint)(55)).z + BA_Vertex_10_CB0((uint)(55)).w);
  r1.y = BA_Vertex_10_CB0((uint)(17)).x * r1.y;
  r0.xy = r1.xy + r1.ww;
  r0.z = 0.5 / r1.w;
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_10_CB1((uint)(3)).yyy * BA_Vertex_10_CB0((uint)(74)).xyw;
  r1.xyz = BA_Vertex_10_CB0((uint)(73)).xyw * BA_Vertex_10_CB1((uint)(3)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_10_CB0((uint)(75)).xyw * BA_Vertex_10_CB1((uint)(3)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_10_CB0((uint)(76)).xyw * BA_Vertex_10_CB1((uint)(3)).www + r1.xyz;
  r1.w = BA_Vertex_10_CB0((uint)(17)).x * r1.y;
  r1.xy = r1.xw + r1.zz;
  r0.z = 0.5 / r1.z;
  r1.yz = -r1.xy * r0.zz + r0.xy;
  o6.xy = r0.xy;
  r0.x = BA_Vertex_10_CB0((uint)(18)).x / BA_Vertex_10_CB0((uint)(18)).y;
  r1.x = r1.y * r0.x;
  o4.xy = r1.xz * BA_Vertex_10_CB2((uint)(13)).xy + BA_Vertex_10_CB2((uint)(13)).zw;
  r0.x = 1 + -BA_Vertex_10_CB0((uint)(127)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_10_CB2((uint)(11)).x;
  o5.xyz = BA_Vertex_10_CB2((uint)(10)).xyz * BA_Vertex_10_CB0((uint)(126)).xyz;
  r0.x = BA_Vertex_10_CB2((uint)(7)).y + -r0.w;
  r0.x = BA_Vertex_10_CB2((uint)(7)).x * r0.x;
  r0.y = 1 + -BA_Vertex_10_CB2((uint)(7)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_10_CB2((uint)(7)).y;
  r0.y = 1 + -BA_Vertex_10_CB2((uint)(17)).x;
  r0.x = r0.y + -r0.x;
  o6.z = saturate(BA_Vertex_10_CB2((uint)(7)).z * r0.x);
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_11_CB2(uint i)
{
  float4 value = 0;
  if (i == 7u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 10u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 11u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 13u) value = float4(_FxTex_ST.x, _FxTex_ST.y, _FxTex_ST.z, _FxTex_ST.w);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_11_CB1(uint i)
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

float4 BA_Vertex_11_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 126u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4,
  out float3 o6 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_11_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_11_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_11_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_11_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_11_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.xyz = BA_Vertex_11_CB0((uint)(16)).xyz + -r0.xyz;
  r2.x = dot(r0.xyz, r0.xyz);
  r2.x = max(1.17549435e-038, r2.x);
  r2.x = rsqrt(r2.x);
  r0.xyz = r2.xxx * r0.xyz;
  r2.x = dot(v1.xyz, BA_Vertex_11_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_11_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_11_CB1((uint)(6)).xyz);
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = max(1.17549435e-038, r2.w);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  o1.w = dot(r2.xyz, r0.xyz);
  o3.xyz = r0.xyz;
  o1.z = dot(r2.xyz, BA_Vertex_11_CB0((uint)(124)).xyz);
  o2.xyz = r2.xyz;
  o1.xy = v3.xy;
  o2.w = v2.w;
  r0.x = r1.z / BA_Vertex_11_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_11_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o3.w = saturate(r0.x * BA_Vertex_11_CB0((uint)(55)).z + BA_Vertex_11_CB0((uint)(55)).w);
  r1.y = BA_Vertex_11_CB0((uint)(17)).x * r1.y;
  r0.xy = r1.xy + r1.ww;
  r0.z = 0.5 / r1.w;
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_11_CB1((uint)(3)).yyy * BA_Vertex_11_CB0((uint)(74)).xyw;
  r1.xyz = BA_Vertex_11_CB0((uint)(73)).xyw * BA_Vertex_11_CB1((uint)(3)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_11_CB0((uint)(75)).xyw * BA_Vertex_11_CB1((uint)(3)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_11_CB0((uint)(76)).xyw * BA_Vertex_11_CB1((uint)(3)).www + r1.xyz;
  r1.w = BA_Vertex_11_CB0((uint)(17)).x * r1.y;
  r1.xy = r1.xw + r1.zz;
  r0.z = 0.5 / r1.z;
  r1.yz = -r1.xy * r0.zz + r0.xy;
  o6.xy = r0.xy;
  r0.x = BA_Vertex_11_CB0((uint)(18)).x / BA_Vertex_11_CB0((uint)(18)).y;
  r1.x = r1.y * r0.x;
  o4.xy = r1.xz * BA_Vertex_11_CB2((uint)(13)).xy + BA_Vertex_11_CB2((uint)(13)).zw;
  r0.x = 1 + -BA_Vertex_11_CB0((uint)(127)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_11_CB2((uint)(11)).x;
  o5.xyz = BA_Vertex_11_CB2((uint)(10)).xyz * BA_Vertex_11_CB0((uint)(126)).xyz;
  r0.x = BA_Vertex_11_CB2((uint)(7)).y + -r0.w;
  r0.x = BA_Vertex_11_CB2((uint)(7)).x * r0.x;
  r0.y = 1 + -BA_Vertex_11_CB2((uint)(7)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_11_CB2((uint)(7)).y;
  r0.y = 1 + -BA_Vertex_11_CB2((uint)(17)).x;
  r0.x = r0.y + -r0.x;
  o6.z = saturate(BA_Vertex_11_CB2((uint)(7)).z * r0.x);
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_12_CB2(uint i)
{
  float4 value = 0;
  if (i == 7u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 8u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 10u) value = float4(_FxTex_ST.x, _FxTex_ST.y, _FxTex_ST.z, _FxTex_ST.w);
  return value;
}

float4 BA_Vertex_12_CB1(uint i)
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

float4 BA_Vertex_12_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 126u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_12_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_12_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_12_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_12_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_12_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_12_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_12_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_12_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_12_CB0((uint)(76)).yxzw + r1.yxzw;
  o0.xyzw = r1.yxzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_12_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_12_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_12_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  o1.w = dot(r2.xyz, r0.xyz);
  o3.xyz = r0.xyz;
  o1.z = dot(r2.xyz, BA_Vertex_12_CB0((uint)(124)).xyz);
  o2.xyz = r2.xyz;
  o1.xy = v3.xy;
  o2.w = v2.w;
  r0.x = r1.z / BA_Vertex_12_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_12_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o3.w = BA_Vertex_12_CB0((uint)(55)).x * r0.x;
  r1.z = BA_Vertex_12_CB0((uint)(17)).x * r1.x;
  r0.xy = r1.yz + r1.ww;
  r0.z = 0.5 / r1.w;
  r1.xyz = BA_Vertex_12_CB1((uint)(3)).yyy * BA_Vertex_12_CB0((uint)(74)).xyw;
  r1.xyz = BA_Vertex_12_CB0((uint)(73)).xyw * BA_Vertex_12_CB1((uint)(3)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_12_CB0((uint)(75)).xyw * BA_Vertex_12_CB1((uint)(3)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_12_CB0((uint)(76)).xyw * BA_Vertex_12_CB1((uint)(3)).www + r1.xyz;
  r1.w = BA_Vertex_12_CB0((uint)(17)).x * r1.y;
  r1.xy = r1.xw + r1.zz;
  r0.w = 0.5 / r1.z;
  r1.xy = r1.xy * r0.ww;
  r0.yz = r0.xy * r0.zz + -r1.xy;
  r0.w = BA_Vertex_12_CB0((uint)(18)).x / BA_Vertex_12_CB0((uint)(18)).y;
  r0.x = r0.y * r0.w;
  o4.xy = r0.xz * BA_Vertex_12_CB2((uint)(10)).xy + BA_Vertex_12_CB2((uint)(10)).zw;
  r0.x = 1 + -BA_Vertex_12_CB0((uint)(127)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_12_CB2((uint)(8)).x;
  o5.xyz = BA_Vertex_12_CB2((uint)(7)).xyz * BA_Vertex_12_CB0((uint)(126)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_13_CB2(uint i)
{
  float4 value = 0;
  if (i == 7u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 8u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 10u) value = float4(_FxTex_ST.x, _FxTex_ST.y, _FxTex_ST.z, _FxTex_ST.w);
  return value;
}

float4 BA_Vertex_13_CB1(uint i)
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

float4 BA_Vertex_13_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 126u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_13_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_13_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_13_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_13_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_13_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_13_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_13_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_13_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_13_CB0((uint)(76)).yxzw + r1.yxzw;
  o0.xyzw = r1.yxzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_13_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_13_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_13_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  o1.w = dot(r2.xyz, r0.xyz);
  o3.xyz = r0.xyz;
  o1.z = dot(r2.xyz, BA_Vertex_13_CB0((uint)(124)).xyz);
  o2.xyz = r2.xyz;
  o1.xy = v3.xy;
  o2.w = v2.w;
  r0.x = r1.z / BA_Vertex_13_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_13_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o3.w = BA_Vertex_13_CB0((uint)(55)).x * r0.x;
  r1.z = BA_Vertex_13_CB0((uint)(17)).x * r1.x;
  r0.xy = r1.yz + r1.ww;
  r0.z = 0.5 / r1.w;
  r1.xyz = BA_Vertex_13_CB1((uint)(3)).yyy * BA_Vertex_13_CB0((uint)(74)).xyw;
  r1.xyz = BA_Vertex_13_CB0((uint)(73)).xyw * BA_Vertex_13_CB1((uint)(3)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_13_CB0((uint)(75)).xyw * BA_Vertex_13_CB1((uint)(3)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_13_CB0((uint)(76)).xyw * BA_Vertex_13_CB1((uint)(3)).www + r1.xyz;
  r1.w = BA_Vertex_13_CB0((uint)(17)).x * r1.y;
  r1.xy = r1.xw + r1.zz;
  r0.w = 0.5 / r1.z;
  r1.xy = r1.xy * r0.ww;
  r0.yz = r0.xy * r0.zz + -r1.xy;
  r0.w = BA_Vertex_13_CB0((uint)(18)).x / BA_Vertex_13_CB0((uint)(18)).y;
  r0.x = r0.y * r0.w;
  o4.xy = r0.xz * BA_Vertex_13_CB2((uint)(10)).xy + BA_Vertex_13_CB2((uint)(10)).zw;
  r0.x = 1 + -BA_Vertex_13_CB0((uint)(127)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_13_CB2((uint)(8)).x;
  o5.xyz = BA_Vertex_13_CB2((uint)(7)).xyz * BA_Vertex_13_CB0((uint)(126)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_14_CB2(uint i)
{
  float4 value = 0;
  if (i == 7u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 10u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 11u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 13u) value = float4(_FxTex_ST.x, _FxTex_ST.y, _FxTex_ST.z, _FxTex_ST.w);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_14_CB1(uint i)
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

float4 BA_Vertex_14_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 126u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4,
  out float3 o6 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_14_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_14_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_14_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_14_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_14_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_14_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_14_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_14_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.xyz = BA_Vertex_14_CB0((uint)(16)).xyz + -r0.xyz;
  r2.x = dot(r0.xyz, r0.xyz);
  r2.x = max(1.17549435e-038, r2.x);
  r2.x = rsqrt(r2.x);
  r0.xyz = r2.xxx * r0.xyz;
  r2.x = dot(v1.xyz, BA_Vertex_14_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_14_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_14_CB1((uint)(6)).xyz);
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = max(1.17549435e-038, r2.w);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  o1.w = dot(r2.xyz, r0.xyz);
  o3.xyz = r0.xyz;
  o1.z = dot(r2.xyz, BA_Vertex_14_CB0((uint)(124)).xyz);
  o2.xyz = r2.xyz;
  o1.xy = v3.xy;
  o2.w = v2.w;
  r0.x = r1.z / BA_Vertex_14_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_14_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o3.w = BA_Vertex_14_CB0((uint)(55)).x * r0.x;
  r1.y = BA_Vertex_14_CB0((uint)(17)).x * r1.y;
  r0.xy = r1.xy + r1.ww;
  r0.z = 0.5 / r1.w;
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_14_CB1((uint)(3)).yyy * BA_Vertex_14_CB0((uint)(74)).xyw;
  r1.xyz = BA_Vertex_14_CB0((uint)(73)).xyw * BA_Vertex_14_CB1((uint)(3)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_14_CB0((uint)(75)).xyw * BA_Vertex_14_CB1((uint)(3)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_14_CB0((uint)(76)).xyw * BA_Vertex_14_CB1((uint)(3)).www + r1.xyz;
  r1.w = BA_Vertex_14_CB0((uint)(17)).x * r1.y;
  r1.xy = r1.xw + r1.zz;
  r0.z = 0.5 / r1.z;
  r1.yz = -r1.xy * r0.zz + r0.xy;
  o6.xy = r0.xy;
  r0.x = BA_Vertex_14_CB0((uint)(18)).x / BA_Vertex_14_CB0((uint)(18)).y;
  r1.x = r1.y * r0.x;
  o4.xy = r1.xz * BA_Vertex_14_CB2((uint)(13)).xy + BA_Vertex_14_CB2((uint)(13)).zw;
  r0.x = 1 + -BA_Vertex_14_CB0((uint)(127)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_14_CB2((uint)(11)).x;
  o5.xyz = BA_Vertex_14_CB2((uint)(10)).xyz * BA_Vertex_14_CB0((uint)(126)).xyz;
  r0.x = BA_Vertex_14_CB2((uint)(7)).y + -r0.w;
  r0.x = BA_Vertex_14_CB2((uint)(7)).x * r0.x;
  r0.y = 1 + -BA_Vertex_14_CB2((uint)(7)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_14_CB2((uint)(7)).y;
  r0.y = 1 + -BA_Vertex_14_CB2((uint)(17)).x;
  r0.x = r0.y + -r0.x;
  o6.z = saturate(BA_Vertex_14_CB2((uint)(7)).z * r0.x);
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_15_CB2(uint i)
{
  float4 value = 0;
  if (i == 7u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 10u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 11u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 13u) value = float4(_FxTex_ST.x, _FxTex_ST.y, _FxTex_ST.z, _FxTex_ST.w);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_15_CB1(uint i)
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

float4 BA_Vertex_15_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 126u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float2 v3 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD4,
  out float3 o6 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_15_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_15_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_15_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_15_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_15_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_15_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_15_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_15_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.xyz = BA_Vertex_15_CB0((uint)(16)).xyz + -r0.xyz;
  r2.x = dot(r0.xyz, r0.xyz);
  r2.x = max(1.17549435e-038, r2.x);
  r2.x = rsqrt(r2.x);
  r0.xyz = r2.xxx * r0.xyz;
  r2.x = dot(v1.xyz, BA_Vertex_15_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_15_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_15_CB1((uint)(6)).xyz);
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = max(1.17549435e-038, r2.w);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  o1.w = dot(r2.xyz, r0.xyz);
  o3.xyz = r0.xyz;
  o1.z = dot(r2.xyz, BA_Vertex_15_CB0((uint)(124)).xyz);
  o2.xyz = r2.xyz;
  o1.xy = v3.xy;
  o2.w = v2.w;
  r0.x = r1.z / BA_Vertex_15_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_15_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o3.w = BA_Vertex_15_CB0((uint)(55)).x * r0.x;
  r1.y = BA_Vertex_15_CB0((uint)(17)).x * r1.y;
  r0.xy = r1.xy + r1.ww;
  r0.z = 0.5 / r1.w;
  r0.xy = r0.xy * r0.zz;
  r1.xyz = BA_Vertex_15_CB1((uint)(3)).yyy * BA_Vertex_15_CB0((uint)(74)).xyw;
  r1.xyz = BA_Vertex_15_CB0((uint)(73)).xyw * BA_Vertex_15_CB1((uint)(3)).xxx + r1.xyz;
  r1.xyz = BA_Vertex_15_CB0((uint)(75)).xyw * BA_Vertex_15_CB1((uint)(3)).zzz + r1.xyz;
  r1.xyz = BA_Vertex_15_CB0((uint)(76)).xyw * BA_Vertex_15_CB1((uint)(3)).www + r1.xyz;
  r1.w = BA_Vertex_15_CB0((uint)(17)).x * r1.y;
  r1.xy = r1.xw + r1.zz;
  r0.z = 0.5 / r1.z;
  r1.yz = -r1.xy * r0.zz + r0.xy;
  o6.xy = r0.xy;
  r0.x = BA_Vertex_15_CB0((uint)(18)).x / BA_Vertex_15_CB0((uint)(18)).y;
  r1.x = r1.y * r0.x;
  o4.xy = r1.xz * BA_Vertex_15_CB2((uint)(13)).xy + BA_Vertex_15_CB2((uint)(13)).zw;
  r0.x = 1 + -BA_Vertex_15_CB0((uint)(127)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_15_CB2((uint)(11)).x;
  o5.xyz = BA_Vertex_15_CB2((uint)(10)).xyz * BA_Vertex_15_CB0((uint)(126)).xyz;
  r0.x = BA_Vertex_15_CB2((uint)(7)).y + -r0.w;
  r0.x = BA_Vertex_15_CB2((uint)(7)).x * r0.x;
  r0.y = 1 + -BA_Vertex_15_CB2((uint)(7)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_15_CB2((uint)(7)).y;
  r0.y = 1 + -BA_Vertex_15_CB2((uint)(17)).x;
  r0.x = r0.y + -r0.x;
  o6.z = saturate(BA_Vertex_15_CB2((uint)(7)).z * r0.x);
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_24_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(0.0, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 4u) value = float4(_FxTint.x, _FxTint.y, _FxTint.z, _FxStrength);
  if (i == 5u) value = float4(_FxSpeed, _GlowTint.x, _GlowTint.y, _GlowTint.z);
  if (i == 6u) value = float4(_GlowStrength, _RimAreaMultiplier, _RimStrength, _RimAreaLeveler);
  if (i == 11u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 12u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 13u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_24_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_24_CB0((uint)(124)).xyz * BA_Fragment_24_CB1((uint)(3)).yyy + v3.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(v2.xyz, r0.xyz);
  r0.x = cmp(r0.x >= BA_Fragment_24_CB1((uint)(3)).z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_24_CB1((uint)(3)).w * r0.x;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_24_CB0((uint)(19)).x).xyzw;
  r0.x = r1.x * r0.x;
  r0.y = 1 + -v1.w;
  r0.z = saturate(r0.y * BA_Fragment_24_CB1((uint)(6)).y + -BA_Fragment_24_CB1((uint)(6)).w);
  r0.y = r0.y * r0.y;
  r0.w = 1 + -r1.w;
  r0.w = v2.w * r0.w;
  r0.w = BA_Fragment_24_CB1((uint)(6)).z * r0.w;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = BA_Fragment_24_CB0((uint)(125)).xyz * r0.xxx;
  r1.x = v1.w * 0.769999981 + v1.z;
  r1.y = -r1.y * 2 + 1;
  r1.x = r1.y * BA_Fragment_24_CB1((uint)(1)).x + r1.x;
  r1.x = -v5.w + r1.x;
  r1.x = saturate(-10 * r1.x);
  r2.xyz = -BA_Fragment_24_CB0((uint)(125)).xyz + v5.www;
  r2.xyz = r1.xxx * r2.xyz + BA_Fragment_24_CB0((uint)(125)).xyz;
  r2.xyz = BA_Fragment_24_CB0((uint)(127)).xxx * r2.xyz;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_24_CB0((uint)(19)).x).xyzw;
  r3.xyzw = BA_Fragment_24_CB1((uint)(0)).xyzw * r3.xyzw;
  r0.xzw = r2.xyz * r3.xyz + r0.xzw;
  o0.w = r3.w;
  r1.x = BA_Fragment_24_CB1((uint)(6)).x * r1.z;
  r1.y = BA_Fragment_24_CB1((uint)(4)).w * r1.w;
  r0.xzw = r1.xxx * BA_Fragment_24_CB1((uint)(5)).yzw + r0.xzw;
  r1.x = BA_Fragment_24_CB1((uint)(5)).x * BA_Fragment_24_CB0((uint)(11)).y;
  r1.x = frac(r1.x);
  r2.y = v4.y + r1.x;
  r2.x = v4.x;
  r2.xyzw = _FxTex.SampleBias(sampler_FxTex, r2.xy, BA_Fragment_24_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.yyy;
  r0.xzw = r1.xyz * BA_Fragment_24_CB1((uint)(4)).xyz + r0.xzw;
  r0.xzw = r0.xzw * BA_Fragment_24_CB1((uint)(12)).xyz + BA_Fragment_24_CB1((uint)(11)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_24_CB1((uint)(13)).xyz + r0.xzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_25_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(0.0, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 4u) value = float4(_FxTint.x, _FxTint.y, _FxTint.z, _FxStrength);
  if (i == 5u) value = float4(_FxSpeed, _GlowTint.x, _GlowTint.y, _GlowTint.z);
  if (i == 6u) value = float4(_GlowStrength, _RimAreaMultiplier, _RimStrength, _RimAreaLeveler);
  if (i == 11u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 12u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 13u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  return value;
}

float4 BA_Fragment_25_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_25_CB0((uint)(124)).xyz * BA_Fragment_25_CB1((uint)(3)).yyy + v3.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(v2.xyz, r0.xyz);
  r0.x = cmp(r0.x >= BA_Fragment_25_CB1((uint)(3)).z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_25_CB1((uint)(3)).w * r0.x;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_25_CB0((uint)(19)).x).xyzw;
  r0.x = r1.x * r0.x;
  r0.y = 1 + -v1.w;
  r0.z = saturate(r0.y * BA_Fragment_25_CB1((uint)(6)).y + -BA_Fragment_25_CB1((uint)(6)).w);
  r0.y = r0.y * r0.y;
  r0.w = 1 + -r1.w;
  r0.w = v2.w * r0.w;
  r0.w = BA_Fragment_25_CB1((uint)(6)).z * r0.w;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = BA_Fragment_25_CB0((uint)(125)).xyz * r0.xxx;
  r1.x = v1.w * 0.769999981 + v1.z;
  r1.y = -r1.y * 2 + 1;
  r1.x = r1.y * BA_Fragment_25_CB1((uint)(1)).x + r1.x;
  r1.x = -v5.w + r1.x;
  r1.x = saturate(-10 * r1.x);
  r2.xyz = -BA_Fragment_25_CB0((uint)(125)).xyz + v5.www;
  r2.xyz = r1.xxx * r2.xyz + BA_Fragment_25_CB0((uint)(125)).xyz;
  r2.xyz = BA_Fragment_25_CB0((uint)(127)).xxx * r2.xyz;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_25_CB0((uint)(19)).x).xyzw;
  r3.xyzw = BA_Fragment_25_CB1((uint)(0)).xyzw * r3.xyzw;
  r0.xzw = r2.xyz * r3.xyz + r0.xzw;
  o0.w = r3.w;
  r1.x = BA_Fragment_25_CB1((uint)(6)).x * r1.z;
  r1.y = BA_Fragment_25_CB1((uint)(4)).w * r1.w;
  r0.xzw = r1.xxx * BA_Fragment_25_CB1((uint)(5)).yzw + r0.xzw;
  r1.x = BA_Fragment_25_CB1((uint)(5)).x * BA_Fragment_25_CB0((uint)(11)).y;
  r1.x = frac(r1.x);
  r2.y = v4.y + r1.x;
  r2.x = v4.x;
  r2.xyzw = _FxTex.SampleBias(sampler_FxTex, r2.xy, BA_Fragment_25_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.yyy;
  r0.xzw = r1.xyz * BA_Fragment_25_CB1((uint)(4)).xyz + r0.xzw;
  r0.x = dot(r0.xzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_25_CB1((uint)(13)).w * r0.x;
  r0.xzw = r0.xxx * BA_Fragment_25_CB1((uint)(12)).xyz + BA_Fragment_25_CB1((uint)(11)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_25_CB1((uint)(13)).xyz + r0.xzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_26_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(0.0, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 4u) value = float4(_FxTint.x, _FxTint.y, _FxTint.z, _FxStrength);
  if (i == 5u) value = float4(_FxSpeed, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_DissolveTex_TexelSize.x, _DissolveTex_TexelSize.y, _DissolveTex_TexelSize.z, _DissolveTex_TexelSize.w);
  if (i == 8u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 9u) value = float4(_RimAreaMultiplier, _RimStrength, _RimAreaLeveler, 0.0);
  if (i == 14u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 15u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 16u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_26_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD5,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_26_CB0((uint)(18)).xy * v6.xy;
  r0.xy = r0.xy / BA_Fragment_26_CB1((uint)(6)).zw;
  r0.xyzw = _DissolveTex.SampleBias(sampler_DissolveTex, r0.xy, BA_Fragment_26_CB0((uint)(19)).x).xyzw;
  r0.x = r0.x * v6.z + -BA_Fragment_26_CB1((uint)(17)).x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_26_CB0((uint)(124)).xyz * BA_Fragment_26_CB1((uint)(3)).yyy + v3.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(v2.xyz, r0.xyz);
  r0.x = cmp(r0.x >= BA_Fragment_26_CB1((uint)(3)).z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_26_CB1((uint)(3)).w * r0.x;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_26_CB0((uint)(19)).x).xyzw;
  r0.x = r1.x * r0.x;
  r0.y = 1 + -v1.w;
  r0.z = saturate(r0.y * BA_Fragment_26_CB1((uint)(9)).x + -BA_Fragment_26_CB1((uint)(9)).z);
  r0.y = r0.y * r0.y;
  r0.w = 1 + -r1.w;
  r0.w = v2.w * r0.w;
  r0.w = BA_Fragment_26_CB1((uint)(9)).y * r0.w;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = BA_Fragment_26_CB0((uint)(125)).xyz * r0.xxx;
  r1.x = v1.w * 0.769999981 + v1.z;
  r1.y = -r1.y * 2 + 1;
  r1.x = r1.y * BA_Fragment_26_CB1((uint)(1)).x + r1.x;
  r1.x = -v5.w + r1.x;
  r1.x = saturate(-10 * r1.x);
  r2.xyz = -BA_Fragment_26_CB0((uint)(125)).xyz + v5.www;
  r2.xyz = r1.xxx * r2.xyz + BA_Fragment_26_CB0((uint)(125)).xyz;
  r2.xyz = BA_Fragment_26_CB0((uint)(127)).xxx * r2.xyz;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_26_CB0((uint)(19)).x).xyzw;
  r3.xyzw = BA_Fragment_26_CB1((uint)(0)).xyzw * r3.xyzw;
  r0.xzw = r2.xyz * r3.xyz + r0.xzw;
  o0.w = r3.w;
  r1.x = BA_Fragment_26_CB1((uint)(8)).w * r1.z;
  r1.y = BA_Fragment_26_CB1((uint)(4)).w * r1.w;
  r0.xzw = r1.xxx * BA_Fragment_26_CB1((uint)(8)).xyz + r0.xzw;
  r1.x = BA_Fragment_26_CB1((uint)(5)).x * BA_Fragment_26_CB0((uint)(11)).y;
  r1.x = frac(r1.x);
  r2.y = v4.y + r1.x;
  r2.x = v4.x;
  r2.xyzw = _FxTex.SampleBias(sampler_FxTex, r2.xy, BA_Fragment_26_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.yyy;
  r0.xzw = r1.xyz * BA_Fragment_26_CB1((uint)(4)).xyz + r0.xzw;
  r0.xzw = r0.xzw * BA_Fragment_26_CB1((uint)(15)).xyz + BA_Fragment_26_CB1((uint)(14)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_26_CB1((uint)(16)).xyz + r0.xzw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_27_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(0.0, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 4u) value = float4(_FxTint.x, _FxTint.y, _FxTint.z, _FxStrength);
  if (i == 5u) value = float4(_FxSpeed, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_DissolveTex_TexelSize.x, _DissolveTex_TexelSize.y, _DissolveTex_TexelSize.z, _DissolveTex_TexelSize.w);
  if (i == 8u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 9u) value = float4(_RimAreaMultiplier, _RimStrength, _RimAreaLeveler, 0.0);
  if (i == 14u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 15u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 16u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_27_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD5,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_27_CB0((uint)(18)).xy * v6.xy;
  r0.xy = r0.xy / BA_Fragment_27_CB1((uint)(6)).zw;
  r0.xyzw = _DissolveTex.SampleBias(sampler_DissolveTex, r0.xy, BA_Fragment_27_CB0((uint)(19)).x).xyzw;
  r0.x = r0.x * v6.z + -BA_Fragment_27_CB1((uint)(17)).x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_27_CB0((uint)(124)).xyz * BA_Fragment_27_CB1((uint)(3)).yyy + v3.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(v2.xyz, r0.xyz);
  r0.x = cmp(r0.x >= BA_Fragment_27_CB1((uint)(3)).z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_27_CB1((uint)(3)).w * r0.x;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_27_CB0((uint)(19)).x).xyzw;
  r0.x = r1.x * r0.x;
  r0.y = 1 + -v1.w;
  r0.z = saturate(r0.y * BA_Fragment_27_CB1((uint)(9)).x + -BA_Fragment_27_CB1((uint)(9)).z);
  r0.y = r0.y * r0.y;
  r0.w = 1 + -r1.w;
  r0.w = v2.w * r0.w;
  r0.w = BA_Fragment_27_CB1((uint)(9)).y * r0.w;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = BA_Fragment_27_CB0((uint)(125)).xyz * r0.xxx;
  r1.x = v1.w * 0.769999981 + v1.z;
  r1.y = -r1.y * 2 + 1;
  r1.x = r1.y * BA_Fragment_27_CB1((uint)(1)).x + r1.x;
  r1.x = -v5.w + r1.x;
  r1.x = saturate(-10 * r1.x);
  r2.xyz = -BA_Fragment_27_CB0((uint)(125)).xyz + v5.www;
  r2.xyz = r1.xxx * r2.xyz + BA_Fragment_27_CB0((uint)(125)).xyz;
  r2.xyz = BA_Fragment_27_CB0((uint)(127)).xxx * r2.xyz;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_27_CB0((uint)(19)).x).xyzw;
  r3.xyzw = BA_Fragment_27_CB1((uint)(0)).xyzw * r3.xyzw;
  r0.xzw = r2.xyz * r3.xyz + r0.xzw;
  o0.w = r3.w;
  r1.x = BA_Fragment_27_CB1((uint)(8)).w * r1.z;
  r1.y = BA_Fragment_27_CB1((uint)(4)).w * r1.w;
  r0.xzw = r1.xxx * BA_Fragment_27_CB1((uint)(8)).xyz + r0.xzw;
  r1.x = BA_Fragment_27_CB1((uint)(5)).x * BA_Fragment_27_CB0((uint)(11)).y;
  r1.x = frac(r1.x);
  r2.y = v4.y + r1.x;
  r2.x = v4.x;
  r2.xyzw = _FxTex.SampleBias(sampler_FxTex, r2.xy, BA_Fragment_27_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.yyy;
  r0.xzw = r1.xyz * BA_Fragment_27_CB1((uint)(4)).xyz + r0.xzw;
  r0.x = dot(r0.xzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_27_CB1((uint)(16)).w * r0.x;
  r0.xzw = r0.xxx * BA_Fragment_27_CB1((uint)(15)).xyz + BA_Fragment_27_CB1((uint)(14)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_27_CB1((uint)(16)).xyz + r0.xzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_28_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(0.0, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 4u) value = float4(_FxTint.x, _FxTint.y, _FxTint.z, _FxStrength);
  if (i == 5u) value = float4(_FxSpeed, _GlowTint.x, _GlowTint.y, _GlowTint.z);
  if (i == 6u) value = float4(_GlowStrength, _RimAreaMultiplier, _RimStrength, _RimAreaLeveler);
  if (i == 11u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 12u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 13u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_28_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_28_CB0((uint)(124)).xyz * BA_Fragment_28_CB1((uint)(3)).yyy + v3.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(v2.xyz, r0.xyz);
  r0.x = cmp(r0.x >= BA_Fragment_28_CB1((uint)(3)).z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_28_CB1((uint)(3)).w * r0.x;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_28_CB0((uint)(19)).x).xyzw;
  r0.x = r1.x * r0.x;
  r0.y = 1 + -v1.w;
  r0.z = saturate(r0.y * BA_Fragment_28_CB1((uint)(6)).y + -BA_Fragment_28_CB1((uint)(6)).w);
  r0.y = r0.y * r0.y;
  r0.w = 1 + -r1.w;
  r0.w = v2.w * r0.w;
  r0.w = BA_Fragment_28_CB1((uint)(6)).z * r0.w;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = BA_Fragment_28_CB0((uint)(125)).xyz * r0.xxx;
  r1.x = v1.w * 0.769999981 + v1.z;
  r1.y = -r1.y * 2 + 1;
  r1.x = r1.y * BA_Fragment_28_CB1((uint)(1)).x + r1.x;
  r1.x = -v5.w + r1.x;
  r1.x = saturate(-10 * r1.x);
  r2.xyz = -BA_Fragment_28_CB0((uint)(125)).xyz + v5.www;
  r2.xyz = r1.xxx * r2.xyz + BA_Fragment_28_CB0((uint)(125)).xyz;
  r2.xyz = BA_Fragment_28_CB0((uint)(127)).xxx * r2.xyz;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_28_CB0((uint)(19)).x).xyzw;
  r3.xyzw = BA_Fragment_28_CB1((uint)(0)).xyzw * r3.xyzw;
  r0.xzw = r2.xyz * r3.xyz + r0.xzw;
  o0.w = r3.w;
  r1.x = BA_Fragment_28_CB1((uint)(6)).x * r1.z;
  r1.y = BA_Fragment_28_CB1((uint)(4)).w * r1.w;
  r0.xzw = r1.xxx * BA_Fragment_28_CB1((uint)(5)).yzw + r0.xzw;
  r1.x = BA_Fragment_28_CB1((uint)(5)).x * BA_Fragment_28_CB0((uint)(11)).y;
  r1.x = frac(r1.x);
  r2.y = v4.y + r1.x;
  r2.x = v4.x;
  r2.xyzw = _FxTex.SampleBias(sampler_FxTex, r2.xy, BA_Fragment_28_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.yyy;
  r0.xzw = r1.xyz * BA_Fragment_28_CB1((uint)(4)).xyz + r0.xzw;
  r0.xzw = r0.xzw * BA_Fragment_28_CB1((uint)(12)).xyz + BA_Fragment_28_CB1((uint)(11)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_28_CB1((uint)(13)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_28_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_28_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_29_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(0.0, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 4u) value = float4(_FxTint.x, _FxTint.y, _FxTint.z, _FxStrength);
  if (i == 5u) value = float4(_FxSpeed, _GlowTint.x, _GlowTint.y, _GlowTint.z);
  if (i == 6u) value = float4(_GlowStrength, _RimAreaMultiplier, _RimStrength, _RimAreaLeveler);
  if (i == 11u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 12u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 13u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  return value;
}

float4 BA_Fragment_29_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_29_CB0((uint)(124)).xyz * BA_Fragment_29_CB1((uint)(3)).yyy + v3.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(v2.xyz, r0.xyz);
  r0.x = cmp(r0.x >= BA_Fragment_29_CB1((uint)(3)).z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_29_CB1((uint)(3)).w * r0.x;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_29_CB0((uint)(19)).x).xyzw;
  r0.x = r1.x * r0.x;
  r0.y = 1 + -v1.w;
  r0.z = saturate(r0.y * BA_Fragment_29_CB1((uint)(6)).y + -BA_Fragment_29_CB1((uint)(6)).w);
  r0.y = r0.y * r0.y;
  r0.w = 1 + -r1.w;
  r0.w = v2.w * r0.w;
  r0.w = BA_Fragment_29_CB1((uint)(6)).z * r0.w;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = BA_Fragment_29_CB0((uint)(125)).xyz * r0.xxx;
  r1.x = v1.w * 0.769999981 + v1.z;
  r1.y = -r1.y * 2 + 1;
  r1.x = r1.y * BA_Fragment_29_CB1((uint)(1)).x + r1.x;
  r1.x = -v5.w + r1.x;
  r1.x = saturate(-10 * r1.x);
  r2.xyz = -BA_Fragment_29_CB0((uint)(125)).xyz + v5.www;
  r2.xyz = r1.xxx * r2.xyz + BA_Fragment_29_CB0((uint)(125)).xyz;
  r2.xyz = BA_Fragment_29_CB0((uint)(127)).xxx * r2.xyz;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_29_CB0((uint)(19)).x).xyzw;
  r3.xyzw = BA_Fragment_29_CB1((uint)(0)).xyzw * r3.xyzw;
  r0.xzw = r2.xyz * r3.xyz + r0.xzw;
  o0.w = r3.w;
  r1.x = BA_Fragment_29_CB1((uint)(6)).x * r1.z;
  r1.y = BA_Fragment_29_CB1((uint)(4)).w * r1.w;
  r0.xzw = r1.xxx * BA_Fragment_29_CB1((uint)(5)).yzw + r0.xzw;
  r1.x = BA_Fragment_29_CB1((uint)(5)).x * BA_Fragment_29_CB0((uint)(11)).y;
  r1.x = frac(r1.x);
  r2.y = v4.y + r1.x;
  r2.x = v4.x;
  r2.xyzw = _FxTex.SampleBias(sampler_FxTex, r2.xy, BA_Fragment_29_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.yyy;
  r0.xzw = r1.xyz * BA_Fragment_29_CB1((uint)(4)).xyz + r0.xzw;
  r0.x = dot(r0.xzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_29_CB1((uint)(13)).w * r0.x;
  r0.xzw = r0.xxx * BA_Fragment_29_CB1((uint)(12)).xyz + BA_Fragment_29_CB1((uint)(11)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_29_CB1((uint)(13)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_29_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_29_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_30_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(0.0, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 4u) value = float4(_FxTint.x, _FxTint.y, _FxTint.z, _FxStrength);
  if (i == 5u) value = float4(_FxSpeed, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_DissolveTex_TexelSize.x, _DissolveTex_TexelSize.y, _DissolveTex_TexelSize.z, _DissolveTex_TexelSize.w);
  if (i == 8u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 9u) value = float4(_RimAreaMultiplier, _RimStrength, _RimAreaLeveler, 0.0);
  if (i == 14u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 15u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 16u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_30_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD5,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_30_CB0((uint)(18)).xy * v6.xy;
  r0.xy = r0.xy / BA_Fragment_30_CB1((uint)(6)).zw;
  r0.xyzw = _DissolveTex.SampleBias(sampler_DissolveTex, r0.xy, BA_Fragment_30_CB0((uint)(19)).x).xyzw;
  r0.x = r0.x * v6.z + -BA_Fragment_30_CB1((uint)(17)).x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_30_CB0((uint)(124)).xyz * BA_Fragment_30_CB1((uint)(3)).yyy + v3.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(v2.xyz, r0.xyz);
  r0.x = cmp(r0.x >= BA_Fragment_30_CB1((uint)(3)).z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_30_CB1((uint)(3)).w * r0.x;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_30_CB0((uint)(19)).x).xyzw;
  r0.x = r1.x * r0.x;
  r0.y = 1 + -v1.w;
  r0.z = saturate(r0.y * BA_Fragment_30_CB1((uint)(9)).x + -BA_Fragment_30_CB1((uint)(9)).z);
  r0.y = r0.y * r0.y;
  r0.w = 1 + -r1.w;
  r0.w = v2.w * r0.w;
  r0.w = BA_Fragment_30_CB1((uint)(9)).y * r0.w;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = BA_Fragment_30_CB0((uint)(125)).xyz * r0.xxx;
  r1.x = v1.w * 0.769999981 + v1.z;
  r1.y = -r1.y * 2 + 1;
  r1.x = r1.y * BA_Fragment_30_CB1((uint)(1)).x + r1.x;
  r1.x = -v5.w + r1.x;
  r1.x = saturate(-10 * r1.x);
  r2.xyz = -BA_Fragment_30_CB0((uint)(125)).xyz + v5.www;
  r2.xyz = r1.xxx * r2.xyz + BA_Fragment_30_CB0((uint)(125)).xyz;
  r2.xyz = BA_Fragment_30_CB0((uint)(127)).xxx * r2.xyz;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_30_CB0((uint)(19)).x).xyzw;
  r3.xyzw = BA_Fragment_30_CB1((uint)(0)).xyzw * r3.xyzw;
  r0.xzw = r2.xyz * r3.xyz + r0.xzw;
  o0.w = r3.w;
  r1.x = BA_Fragment_30_CB1((uint)(8)).w * r1.z;
  r1.y = BA_Fragment_30_CB1((uint)(4)).w * r1.w;
  r0.xzw = r1.xxx * BA_Fragment_30_CB1((uint)(8)).xyz + r0.xzw;
  r1.x = BA_Fragment_30_CB1((uint)(5)).x * BA_Fragment_30_CB0((uint)(11)).y;
  r1.x = frac(r1.x);
  r2.y = v4.y + r1.x;
  r2.x = v4.x;
  r2.xyzw = _FxTex.SampleBias(sampler_FxTex, r2.xy, BA_Fragment_30_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.yyy;
  r0.xzw = r1.xyz * BA_Fragment_30_CB1((uint)(4)).xyz + r0.xzw;
  r0.xzw = r0.xzw * BA_Fragment_30_CB1((uint)(15)).xyz + BA_Fragment_30_CB1((uint)(14)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_30_CB1((uint)(16)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_30_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_30_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_31_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(0.0, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 4u) value = float4(_FxTint.x, _FxTint.y, _FxTint.z, _FxStrength);
  if (i == 5u) value = float4(_FxSpeed, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_DissolveTex_TexelSize.x, _DissolveTex_TexelSize.y, _DissolveTex_TexelSize.z, _DissolveTex_TexelSize.w);
  if (i == 8u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 9u) value = float4(_RimAreaMultiplier, _RimStrength, _RimAreaLeveler, 0.0);
  if (i == 14u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 15u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 16u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_31_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD5,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_31_CB0((uint)(18)).xy * v6.xy;
  r0.xy = r0.xy / BA_Fragment_31_CB1((uint)(6)).zw;
  r0.xyzw = _DissolveTex.SampleBias(sampler_DissolveTex, r0.xy, BA_Fragment_31_CB0((uint)(19)).x).xyzw;
  r0.x = r0.x * v6.z + -BA_Fragment_31_CB1((uint)(17)).x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_31_CB0((uint)(124)).xyz * BA_Fragment_31_CB1((uint)(3)).yyy + v3.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(v2.xyz, r0.xyz);
  r0.x = cmp(r0.x >= BA_Fragment_31_CB1((uint)(3)).z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_31_CB1((uint)(3)).w * r0.x;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_31_CB0((uint)(19)).x).xyzw;
  r0.x = r1.x * r0.x;
  r0.y = 1 + -v1.w;
  r0.z = saturate(r0.y * BA_Fragment_31_CB1((uint)(9)).x + -BA_Fragment_31_CB1((uint)(9)).z);
  r0.y = r0.y * r0.y;
  r0.w = 1 + -r1.w;
  r0.w = v2.w * r0.w;
  r0.w = BA_Fragment_31_CB1((uint)(9)).y * r0.w;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = BA_Fragment_31_CB0((uint)(125)).xyz * r0.xxx;
  r1.x = v1.w * 0.769999981 + v1.z;
  r1.y = -r1.y * 2 + 1;
  r1.x = r1.y * BA_Fragment_31_CB1((uint)(1)).x + r1.x;
  r1.x = -v5.w + r1.x;
  r1.x = saturate(-10 * r1.x);
  r2.xyz = -BA_Fragment_31_CB0((uint)(125)).xyz + v5.www;
  r2.xyz = r1.xxx * r2.xyz + BA_Fragment_31_CB0((uint)(125)).xyz;
  r2.xyz = BA_Fragment_31_CB0((uint)(127)).xxx * r2.xyz;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_31_CB0((uint)(19)).x).xyzw;
  r3.xyzw = BA_Fragment_31_CB1((uint)(0)).xyzw * r3.xyzw;
  r0.xzw = r2.xyz * r3.xyz + r0.xzw;
  o0.w = r3.w;
  r1.x = BA_Fragment_31_CB1((uint)(8)).w * r1.z;
  r1.y = BA_Fragment_31_CB1((uint)(4)).w * r1.w;
  r0.xzw = r1.xxx * BA_Fragment_31_CB1((uint)(8)).xyz + r0.xzw;
  r1.x = BA_Fragment_31_CB1((uint)(5)).x * BA_Fragment_31_CB0((uint)(11)).y;
  r1.x = frac(r1.x);
  r2.y = v4.y + r1.x;
  r2.x = v4.x;
  r2.xyzw = _FxTex.SampleBias(sampler_FxTex, r2.xy, BA_Fragment_31_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.yyy;
  r0.xzw = r1.xyz * BA_Fragment_31_CB1((uint)(4)).xyz + r0.xzw;
  r0.x = dot(r0.xzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_31_CB1((uint)(16)).w * r0.x;
  r0.xzw = r0.xxx * BA_Fragment_31_CB1((uint)(15)).xyz + BA_Fragment_31_CB1((uint)(14)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_31_CB1((uint)(16)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_31_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v3.www * r0.xyz + BA_Fragment_31_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_32_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(0.0, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 4u) value = float4(_FxTint.x, _FxTint.y, _FxTint.z, _FxStrength);
  if (i == 5u) value = float4(_FxSpeed, _GlowTint.x, _GlowTint.y, _GlowTint.z);
  if (i == 6u) value = float4(_GlowStrength, _RimAreaMultiplier, _RimStrength, _RimAreaLeveler);
  if (i == 11u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 12u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 13u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_32_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_32_CB0((uint)(124)).xyz * BA_Fragment_32_CB1((uint)(3)).yyy + v3.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(v2.xyz, r0.xyz);
  r0.x = cmp(r0.x >= BA_Fragment_32_CB1((uint)(3)).z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_32_CB1((uint)(3)).w * r0.x;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_32_CB0((uint)(19)).x).xyzw;
  r0.x = r1.x * r0.x;
  r0.y = 1 + -v1.w;
  r0.z = saturate(r0.y * BA_Fragment_32_CB1((uint)(6)).y + -BA_Fragment_32_CB1((uint)(6)).w);
  r0.y = r0.y * r0.y;
  r0.w = 1 + -r1.w;
  r0.w = v2.w * r0.w;
  r0.w = BA_Fragment_32_CB1((uint)(6)).z * r0.w;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = BA_Fragment_32_CB0((uint)(125)).xyz * r0.xxx;
  r1.x = v1.w * 0.769999981 + v1.z;
  r1.y = -r1.y * 2 + 1;
  r1.x = r1.y * BA_Fragment_32_CB1((uint)(1)).x + r1.x;
  r1.x = -v5.w + r1.x;
  r1.x = saturate(-10 * r1.x);
  r2.xyz = -BA_Fragment_32_CB0((uint)(125)).xyz + v5.www;
  r2.xyz = r1.xxx * r2.xyz + BA_Fragment_32_CB0((uint)(125)).xyz;
  r2.xyz = BA_Fragment_32_CB0((uint)(127)).xxx * r2.xyz;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_32_CB0((uint)(19)).x).xyzw;
  r3.xyzw = BA_Fragment_32_CB1((uint)(0)).xyzw * r3.xyzw;
  r0.xzw = r2.xyz * r3.xyz + r0.xzw;
  o0.w = r3.w;
  r1.x = BA_Fragment_32_CB1((uint)(6)).x * r1.z;
  r1.y = BA_Fragment_32_CB1((uint)(4)).w * r1.w;
  r0.xzw = r1.xxx * BA_Fragment_32_CB1((uint)(5)).yzw + r0.xzw;
  r1.x = BA_Fragment_32_CB1((uint)(5)).x * BA_Fragment_32_CB0((uint)(11)).y;
  r1.x = frac(r1.x);
  r2.y = v4.y + r1.x;
  r2.x = v4.x;
  r2.xyzw = _FxTex.SampleBias(sampler_FxTex, r2.xy, BA_Fragment_32_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.yyy;
  r0.xzw = r1.xyz * BA_Fragment_32_CB1((uint)(4)).xyz + r0.xzw;
  r0.xzw = r0.xzw * BA_Fragment_32_CB1((uint)(12)).xyz + BA_Fragment_32_CB1((uint)(11)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_32_CB1((uint)(13)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_32_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_32_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_33_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(0.0, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 4u) value = float4(_FxTint.x, _FxTint.y, _FxTint.z, _FxStrength);
  if (i == 5u) value = float4(_FxSpeed, _GlowTint.x, _GlowTint.y, _GlowTint.z);
  if (i == 6u) value = float4(_GlowStrength, _RimAreaMultiplier, _RimStrength, _RimAreaLeveler);
  if (i == 11u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 12u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 13u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  return value;
}

float4 BA_Fragment_33_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_33_CB0((uint)(124)).xyz * BA_Fragment_33_CB1((uint)(3)).yyy + v3.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(v2.xyz, r0.xyz);
  r0.x = cmp(r0.x >= BA_Fragment_33_CB1((uint)(3)).z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_33_CB1((uint)(3)).w * r0.x;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_33_CB0((uint)(19)).x).xyzw;
  r0.x = r1.x * r0.x;
  r0.y = 1 + -v1.w;
  r0.z = saturate(r0.y * BA_Fragment_33_CB1((uint)(6)).y + -BA_Fragment_33_CB1((uint)(6)).w);
  r0.y = r0.y * r0.y;
  r0.w = 1 + -r1.w;
  r0.w = v2.w * r0.w;
  r0.w = BA_Fragment_33_CB1((uint)(6)).z * r0.w;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = BA_Fragment_33_CB0((uint)(125)).xyz * r0.xxx;
  r1.x = v1.w * 0.769999981 + v1.z;
  r1.y = -r1.y * 2 + 1;
  r1.x = r1.y * BA_Fragment_33_CB1((uint)(1)).x + r1.x;
  r1.x = -v5.w + r1.x;
  r1.x = saturate(-10 * r1.x);
  r2.xyz = -BA_Fragment_33_CB0((uint)(125)).xyz + v5.www;
  r2.xyz = r1.xxx * r2.xyz + BA_Fragment_33_CB0((uint)(125)).xyz;
  r2.xyz = BA_Fragment_33_CB0((uint)(127)).xxx * r2.xyz;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_33_CB0((uint)(19)).x).xyzw;
  r3.xyzw = BA_Fragment_33_CB1((uint)(0)).xyzw * r3.xyzw;
  r0.xzw = r2.xyz * r3.xyz + r0.xzw;
  o0.w = r3.w;
  r1.x = BA_Fragment_33_CB1((uint)(6)).x * r1.z;
  r1.y = BA_Fragment_33_CB1((uint)(4)).w * r1.w;
  r0.xzw = r1.xxx * BA_Fragment_33_CB1((uint)(5)).yzw + r0.xzw;
  r1.x = BA_Fragment_33_CB1((uint)(5)).x * BA_Fragment_33_CB0((uint)(11)).y;
  r1.x = frac(r1.x);
  r2.y = v4.y + r1.x;
  r2.x = v4.x;
  r2.xyzw = _FxTex.SampleBias(sampler_FxTex, r2.xy, BA_Fragment_33_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.yyy;
  r0.xzw = r1.xyz * BA_Fragment_33_CB1((uint)(4)).xyz + r0.xzw;
  r0.x = dot(r0.xzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_33_CB1((uint)(13)).w * r0.x;
  r0.xzw = r0.xxx * BA_Fragment_33_CB1((uint)(12)).xyz + BA_Fragment_33_CB1((uint)(11)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_33_CB1((uint)(13)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_33_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_33_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_34_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(0.0, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 4u) value = float4(_FxTint.x, _FxTint.y, _FxTint.z, _FxStrength);
  if (i == 5u) value = float4(_FxSpeed, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_DissolveTex_TexelSize.x, _DissolveTex_TexelSize.y, _DissolveTex_TexelSize.z, _DissolveTex_TexelSize.w);
  if (i == 8u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 9u) value = float4(_RimAreaMultiplier, _RimStrength, _RimAreaLeveler, 0.0);
  if (i == 14u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 15u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 16u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_34_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD5,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_34_CB0((uint)(18)).xy * v6.xy;
  r0.xy = r0.xy / BA_Fragment_34_CB1((uint)(6)).zw;
  r0.xyzw = _DissolveTex.SampleBias(sampler_DissolveTex, r0.xy, BA_Fragment_34_CB0((uint)(19)).x).xyzw;
  r0.x = r0.x * v6.z + -BA_Fragment_34_CB1((uint)(17)).x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_34_CB0((uint)(124)).xyz * BA_Fragment_34_CB1((uint)(3)).yyy + v3.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(v2.xyz, r0.xyz);
  r0.x = cmp(r0.x >= BA_Fragment_34_CB1((uint)(3)).z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_34_CB1((uint)(3)).w * r0.x;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_34_CB0((uint)(19)).x).xyzw;
  r0.x = r1.x * r0.x;
  r0.y = 1 + -v1.w;
  r0.z = saturate(r0.y * BA_Fragment_34_CB1((uint)(9)).x + -BA_Fragment_34_CB1((uint)(9)).z);
  r0.y = r0.y * r0.y;
  r0.w = 1 + -r1.w;
  r0.w = v2.w * r0.w;
  r0.w = BA_Fragment_34_CB1((uint)(9)).y * r0.w;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = BA_Fragment_34_CB0((uint)(125)).xyz * r0.xxx;
  r1.x = v1.w * 0.769999981 + v1.z;
  r1.y = -r1.y * 2 + 1;
  r1.x = r1.y * BA_Fragment_34_CB1((uint)(1)).x + r1.x;
  r1.x = -v5.w + r1.x;
  r1.x = saturate(-10 * r1.x);
  r2.xyz = -BA_Fragment_34_CB0((uint)(125)).xyz + v5.www;
  r2.xyz = r1.xxx * r2.xyz + BA_Fragment_34_CB0((uint)(125)).xyz;
  r2.xyz = BA_Fragment_34_CB0((uint)(127)).xxx * r2.xyz;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_34_CB0((uint)(19)).x).xyzw;
  r3.xyzw = BA_Fragment_34_CB1((uint)(0)).xyzw * r3.xyzw;
  r0.xzw = r2.xyz * r3.xyz + r0.xzw;
  o0.w = r3.w;
  r1.x = BA_Fragment_34_CB1((uint)(8)).w * r1.z;
  r1.y = BA_Fragment_34_CB1((uint)(4)).w * r1.w;
  r0.xzw = r1.xxx * BA_Fragment_34_CB1((uint)(8)).xyz + r0.xzw;
  r1.x = BA_Fragment_34_CB1((uint)(5)).x * BA_Fragment_34_CB0((uint)(11)).y;
  r1.x = frac(r1.x);
  r2.y = v4.y + r1.x;
  r2.x = v4.x;
  r2.xyzw = _FxTex.SampleBias(sampler_FxTex, r2.xy, BA_Fragment_34_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.yyy;
  r0.xzw = r1.xyz * BA_Fragment_34_CB1((uint)(4)).xyz + r0.xzw;
  r0.xzw = r0.xzw * BA_Fragment_34_CB1((uint)(15)).xyz + BA_Fragment_34_CB1((uint)(14)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_34_CB1((uint)(16)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_34_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_34_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_35_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 3u) value = float4(0.0, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 4u) value = float4(_FxTint.x, _FxTint.y, _FxTint.z, _FxStrength);
  if (i == 5u) value = float4(_FxSpeed, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_DissolveTex_TexelSize.x, _DissolveTex_TexelSize.y, _DissolveTex_TexelSize.z, _DissolveTex_TexelSize.w);
  if (i == 8u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 9u) value = float4(_RimAreaMultiplier, _RimStrength, _RimAreaLeveler, 0.0);
  if (i == 14u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 15u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 16u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 17u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_35_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 18u) value = float4(_ScreenParams.x, _ScreenParams.y, _ScreenParams.z, _ScreenParams.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 124u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 125u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD5,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_35_CB0((uint)(18)).xy * v6.xy;
  r0.xy = r0.xy / BA_Fragment_35_CB1((uint)(6)).zw;
  r0.xyzw = _DissolveTex.SampleBias(sampler_DissolveTex, r0.xy, BA_Fragment_35_CB0((uint)(19)).x).xyzw;
  r0.x = r0.x * v6.z + -BA_Fragment_35_CB1((uint)(17)).x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_35_CB0((uint)(124)).xyz * BA_Fragment_35_CB1((uint)(3)).yyy + v3.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(v2.xyz, r0.xyz);
  r0.x = cmp(r0.x >= BA_Fragment_35_CB1((uint)(3)).z);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = BA_Fragment_35_CB1((uint)(3)).w * r0.x;
  r1.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_35_CB0((uint)(19)).x).xyzw;
  r0.x = r1.x * r0.x;
  r0.y = 1 + -v1.w;
  r0.z = saturate(r0.y * BA_Fragment_35_CB1((uint)(9)).x + -BA_Fragment_35_CB1((uint)(9)).z);
  r0.y = r0.y * r0.y;
  r0.w = 1 + -r1.w;
  r0.w = v2.w * r0.w;
  r0.w = BA_Fragment_35_CB1((uint)(9)).y * r0.w;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = BA_Fragment_35_CB0((uint)(125)).xyz * r0.xxx;
  r1.x = v1.w * 0.769999981 + v1.z;
  r1.y = -r1.y * 2 + 1;
  r1.x = r1.y * BA_Fragment_35_CB1((uint)(1)).x + r1.x;
  r1.x = -v5.w + r1.x;
  r1.x = saturate(-10 * r1.x);
  r2.xyz = -BA_Fragment_35_CB0((uint)(125)).xyz + v5.www;
  r2.xyz = r1.xxx * r2.xyz + BA_Fragment_35_CB0((uint)(125)).xyz;
  r2.xyz = BA_Fragment_35_CB0((uint)(127)).xxx * r2.xyz;
  r3.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_35_CB0((uint)(19)).x).xyzw;
  r3.xyzw = BA_Fragment_35_CB1((uint)(0)).xyzw * r3.xyzw;
  r0.xzw = r2.xyz * r3.xyz + r0.xzw;
  o0.w = r3.w;
  r1.x = BA_Fragment_35_CB1((uint)(8)).w * r1.z;
  r1.y = BA_Fragment_35_CB1((uint)(4)).w * r1.w;
  r0.xzw = r1.xxx * BA_Fragment_35_CB1((uint)(8)).xyz + r0.xzw;
  r1.x = BA_Fragment_35_CB1((uint)(5)).x * BA_Fragment_35_CB0((uint)(11)).y;
  r1.x = frac(r1.x);
  r2.y = v4.y + r1.x;
  r2.x = v4.x;
  r2.xyzw = _FxTex.SampleBias(sampler_FxTex, r2.xy, BA_Fragment_35_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * r1.yyy;
  r0.xzw = r1.xyz * BA_Fragment_35_CB1((uint)(4)).xyz + r0.xzw;
  r0.x = dot(r0.xzw, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_35_CB1((uint)(16)).w * r0.x;
  r0.xzw = r0.xxx * BA_Fragment_35_CB1((uint)(15)).xyz + BA_Fragment_35_CB1((uint)(14)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_35_CB1((uint)(16)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_35_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v3.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_35_CB0((uint)(56)).xyz;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
