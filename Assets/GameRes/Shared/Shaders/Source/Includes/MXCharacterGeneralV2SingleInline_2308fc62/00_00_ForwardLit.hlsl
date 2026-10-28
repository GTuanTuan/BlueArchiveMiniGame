// Exact names and types from the original compiled parameter metadata.
float _AdditionalLightSharpness;
float _AdditionalLightStrength;
float _BaseBrightness;
float4 _CodeAddColor;
float4 _CodeAddRimColor;
float4 _CodeMultiplyColor;
float _Cutoff;
float _DissolveDirection;
float _DissolveLineThinness;
float _DissolveStartHeight;
float _DitherThreshold;
float _GlowStrength;
float4 _GlowTint;
float _GrayBrightness;
float _InlineAmount;
float4 _InlineTint;
float _InvViewPower;
float _InvViewStrength;
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
float4 _TwoSideTint;
float _ViewLightEdge;
float _ViewOffset;
float _ViewPower;
float _ViewStrength;
Texture2D<float4> _MainTex;
Texture2D<float4> _MaskTex;
SamplerState sampler_MainTex;
SamplerState sampler_MaskTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_8_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_8_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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

  float4 r0,r1,r2,r3;
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
  o0.xyzw = BA_Vertex_8_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_8_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_8_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_8_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_8_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_8_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_8_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_8_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_8_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_8_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_8_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_8_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_8_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_8_CB2((uint)(8)).xyz * BA_Vertex_8_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_9_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_9_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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

  float4 r0,r1,r2,r3;
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
  o0.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_9_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_9_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_9_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_9_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_9_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_9_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_9_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_9_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_9_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_9_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_9_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_9_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_9_CB2((uint)(8)).xyz * BA_Vertex_9_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_10_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_10_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_10_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_10_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_10_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_10_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_10_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_10_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_10_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_10_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_10_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_10_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_10_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_10_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_10_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_10_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_10_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_10_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_10_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_10_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_10_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_10_CB2((uint)(8)).xyz * BA_Vertex_10_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_11_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_11_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_11_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_11_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_11_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_11_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_11_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_11_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_11_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_11_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_11_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_11_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_11_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_11_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_11_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_11_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_11_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_11_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_11_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_11_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_11_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_11_CB2((uint)(8)).xyz * BA_Vertex_11_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_12_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_12_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_12_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_12_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_12_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_12_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_12_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_12_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_12_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_12_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_12_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_12_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_12_CB1((uint)(6)).xyz);
  r1.z = dot(r2.xyz, r2.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  r2.xyz = r2.xyz * r1.zzz;
  r1.z = r2.y * r2.y;
  r1.z = r2.x * r2.x + -r1.z;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_12_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_12_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_12_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_12_CB1((uint)(31)).xyz * r1.zzz + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_12_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_12_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_12_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r1.z = r2.x + r2.y;
  r1.z = r1.z + r2.z;
  r1.z = max(0.300000012, r1.z);
  r1.z = 0.300000012 / r1.z;
  o2.xyz = r2.xyz * r1.zzz;
  o2.w = 0;
  o3.w = v2.w;
  r0.xyz = BA_Vertex_12_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  o4.xyz = r1.zzz * r0.xyz;
  r0.x = 1 + -BA_Vertex_12_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_12_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_12_CB2((uint)(8)).xyz * BA_Vertex_12_CB0((uint)(128)).xyz;
  r0.x = BA_Vertex_12_CB2((uint)(10)).y + -r0.w;
  r0.x = BA_Vertex_12_CB2((uint)(10)).x * r0.x;
  r0.y = 1 + -BA_Vertex_12_CB2((uint)(10)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_12_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_12_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_12_CB2((uint)(10)).z * r0.x);
  r0.w = BA_Vertex_12_CB0((uint)(17)).x * r1.y;
  r0.z = r1.x;
  r0.xy = r0.zw + r1.ww;
  r0.z = 0.5 / r1.w;
  o6.zw = r0.xy * r0.zz;
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_13_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_13_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_13_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_13_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_13_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_13_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_13_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_13_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_13_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_13_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_13_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_13_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_13_CB1((uint)(6)).xyz);
  r1.z = dot(r2.xyz, r2.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  r2.xyz = r2.xyz * r1.zzz;
  r1.z = r2.y * r2.y;
  r1.z = r2.x * r2.x + -r1.z;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_13_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_13_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_13_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_13_CB1((uint)(31)).xyz * r1.zzz + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_13_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_13_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_13_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r1.z = r2.x + r2.y;
  r1.z = r1.z + r2.z;
  r1.z = max(0.300000012, r1.z);
  r1.z = 0.300000012 / r1.z;
  o2.xyz = r2.xyz * r1.zzz;
  o2.w = 0;
  o3.w = v2.w;
  r0.xyz = BA_Vertex_13_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  o4.xyz = r1.zzz * r0.xyz;
  r0.x = 1 + -BA_Vertex_13_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_13_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_13_CB2((uint)(8)).xyz * BA_Vertex_13_CB0((uint)(128)).xyz;
  r0.x = BA_Vertex_13_CB2((uint)(10)).y + -r0.w;
  r0.x = BA_Vertex_13_CB2((uint)(10)).x * r0.x;
  r0.y = 1 + -BA_Vertex_13_CB2((uint)(10)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_13_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_13_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_13_CB2((uint)(10)).z * r0.x);
  r0.w = BA_Vertex_13_CB0((uint)(17)).x * r1.y;
  r0.z = r1.x;
  r0.xy = r0.zw + r1.ww;
  r0.z = 0.5 / r1.w;
  o6.zw = r0.xy * r0.zz;
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_14_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_14_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4;
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
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_14_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_14_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_14_CB1((uint)(6)).xyz);
  r1.z = dot(r2.xyz, r2.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  r2.xyz = r2.xyz * r1.zzz;
  r1.z = r2.y * r2.y;
  r1.z = r2.x * r2.x + -r1.z;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_14_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_14_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_14_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_14_CB1((uint)(31)).xyz * r1.zzz + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_14_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_14_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_14_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r1.z = r2.x + r2.y;
  r1.z = r1.z + r2.z;
  r1.z = max(0.300000012, r1.z);
  r1.z = 0.300000012 / r1.z;
  o2.xyz = r2.xyz * r1.zzz;
  o2.w = 0;
  o3.w = v2.w;
  r0.xyz = BA_Vertex_14_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  o4.xyz = r1.zzz * r0.xyz;
  r0.x = 1 + -BA_Vertex_14_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_14_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_14_CB2((uint)(8)).xyz * BA_Vertex_14_CB0((uint)(128)).xyz;
  r0.x = BA_Vertex_14_CB2((uint)(10)).y + -r0.w;
  r0.x = BA_Vertex_14_CB2((uint)(10)).x * r0.x;
  r0.y = 1 + -BA_Vertex_14_CB2((uint)(10)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_14_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_14_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_14_CB2((uint)(10)).z * r0.x);
  r0.w = BA_Vertex_14_CB0((uint)(17)).x * r1.y;
  r0.z = r1.x;
  r0.xy = r0.zw + r1.ww;
  r0.z = 0.5 / r1.w;
  o6.zw = r0.xy * r0.zz;
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_15_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_15_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4;
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
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_15_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_15_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_15_CB1((uint)(6)).xyz);
  r1.z = dot(r2.xyz, r2.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  r2.xyz = r2.xyz * r1.zzz;
  r1.z = r2.y * r2.y;
  r1.z = r2.x * r2.x + -r1.z;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_15_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_15_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_15_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_15_CB1((uint)(31)).xyz * r1.zzz + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_15_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_15_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_15_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r1.z = r2.x + r2.y;
  r1.z = r1.z + r2.z;
  r1.z = max(0.300000012, r1.z);
  r1.z = 0.300000012 / r1.z;
  o2.xyz = r2.xyz * r1.zzz;
  o2.w = 0;
  o3.w = v2.w;
  r0.xyz = BA_Vertex_15_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  o4.xyz = r1.zzz * r0.xyz;
  r0.x = 1 + -BA_Vertex_15_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_15_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_15_CB2((uint)(8)).xyz * BA_Vertex_15_CB0((uint)(128)).xyz;
  r0.x = BA_Vertex_15_CB2((uint)(10)).y + -r0.w;
  r0.x = BA_Vertex_15_CB2((uint)(10)).x * r0.x;
  r0.y = 1 + -BA_Vertex_15_CB2((uint)(10)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_15_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_15_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_15_CB2((uint)(10)).z * r0.x);
  r0.w = BA_Vertex_15_CB0((uint)(17)).x * r1.y;
  r0.z = r1.x;
  r0.xy = r0.zw + r1.ww;
  r0.z = 0.5 / r1.w;
  o6.zw = r0.xy * r0.zz;
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_16_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_16_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_16_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_16_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_16_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_16_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_16_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_16_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_16_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_16_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_16_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_16_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_16_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_16_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_16_CB0((uint)(55)).z + BA_Vertex_16_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_16_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_16_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_16_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_16_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_16_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_16_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_16_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_16_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_16_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_16_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_16_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_16_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_16_CB2((uint)(8)).xyz * BA_Vertex_16_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_17_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_17_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_17_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_17_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_17_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_17_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_17_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_17_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_17_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_17_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_17_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_17_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_17_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_17_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_17_CB0((uint)(55)).z + BA_Vertex_17_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_17_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_17_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_17_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_17_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_17_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_17_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_17_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_17_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_17_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_17_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_17_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_17_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_17_CB2((uint)(8)).xyz * BA_Vertex_17_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_18_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_18_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_18_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_18_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_18_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_18_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_18_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_18_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_18_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_18_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_18_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_18_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_18_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_18_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_18_CB0((uint)(55)).z + BA_Vertex_18_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_18_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_18_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_18_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_18_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_18_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_18_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_18_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_18_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_18_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_18_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_18_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_18_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_18_CB2((uint)(8)).xyz * BA_Vertex_18_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_19_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_19_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_19_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_19_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_19_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_19_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_19_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_19_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_19_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_19_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_19_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_19_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_19_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_19_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_19_CB0((uint)(55)).z + BA_Vertex_19_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_19_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_19_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_19_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_19_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_19_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_19_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_19_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_19_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_19_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_19_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_19_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_19_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_19_CB2((uint)(8)).xyz * BA_Vertex_19_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_20_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_20_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_20_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_20_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_20_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_20_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_20_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_20_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_20_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_20_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_20_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_20_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_20_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_20_CB1((uint)(6)).xyz);
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = max(1.17549435e-038, r2.w);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  r3.x = r2.y * r2.y;
  r3.x = r2.x * r2.x + -r3.x;
  r4.xyzw = r2.xyzz * r2.yzzx;
  r5.x = dot(BA_Vertex_20_CB1((uint)(28)).xyzw, r4.xyzw);
  r5.y = dot(BA_Vertex_20_CB1((uint)(29)).xyzw, r4.xyzw);
  r5.z = dot(BA_Vertex_20_CB1((uint)(30)).xyzw, r4.xyzw);
  r3.xyz = BA_Vertex_20_CB1((uint)(31)).xyz * r3.xxx + r5.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_20_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_20_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_20_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r2.w = r2.x + r2.y;
  r2.w = r2.w + r2.z;
  r2.w = max(0.300000012, r2.w);
  r2.w = 0.300000012 / r2.w;
  o2.xyz = r2.xyz * r2.www;
  r1.z = r1.z / BA_Vertex_20_CB0((uint)(17)).y;
  r1.z = 1 + -r1.z;
  r1.z = BA_Vertex_20_CB0((uint)(17)).z * r1.z;
  r1.z = max(0, r1.z);
  o2.w = saturate(r1.z * BA_Vertex_20_CB0((uint)(55)).z + BA_Vertex_20_CB0((uint)(55)).w);
  o3.w = v2.w;
  r0.xyz = BA_Vertex_20_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  o4.xyz = r1.zzz * r0.xyz;
  r0.x = 1 + -BA_Vertex_20_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_20_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_20_CB2((uint)(8)).xyz * BA_Vertex_20_CB0((uint)(128)).xyz;
  r0.x = BA_Vertex_20_CB2((uint)(10)).y + -r0.w;
  r0.x = BA_Vertex_20_CB2((uint)(10)).x * r0.x;
  r0.y = 1 + -BA_Vertex_20_CB2((uint)(10)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_20_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_20_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_20_CB2((uint)(10)).z * r0.x);
  r0.w = BA_Vertex_20_CB0((uint)(17)).x * r1.y;
  r0.z = r1.x;
  r0.xy = r0.zw + r1.ww;
  r0.z = 0.5 / r1.w;
  o6.zw = r0.xy * r0.zz;
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_21_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_21_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_21_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_21_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_21_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_21_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_21_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_21_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_21_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_21_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_21_CB1((uint)(6)).xyz);
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = max(1.17549435e-038, r2.w);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  r3.x = r2.y * r2.y;
  r3.x = r2.x * r2.x + -r3.x;
  r4.xyzw = r2.xyzz * r2.yzzx;
  r5.x = dot(BA_Vertex_21_CB1((uint)(28)).xyzw, r4.xyzw);
  r5.y = dot(BA_Vertex_21_CB1((uint)(29)).xyzw, r4.xyzw);
  r5.z = dot(BA_Vertex_21_CB1((uint)(30)).xyzw, r4.xyzw);
  r3.xyz = BA_Vertex_21_CB1((uint)(31)).xyz * r3.xxx + r5.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_21_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_21_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_21_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r2.w = r2.x + r2.y;
  r2.w = r2.w + r2.z;
  r2.w = max(0.300000012, r2.w);
  r2.w = 0.300000012 / r2.w;
  o2.xyz = r2.xyz * r2.www;
  r1.z = r1.z / BA_Vertex_21_CB0((uint)(17)).y;
  r1.z = 1 + -r1.z;
  r1.z = BA_Vertex_21_CB0((uint)(17)).z * r1.z;
  r1.z = max(0, r1.z);
  o2.w = saturate(r1.z * BA_Vertex_21_CB0((uint)(55)).z + BA_Vertex_21_CB0((uint)(55)).w);
  o3.w = v2.w;
  r0.xyz = BA_Vertex_21_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  o4.xyz = r1.zzz * r0.xyz;
  r0.x = 1 + -BA_Vertex_21_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_21_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_21_CB2((uint)(8)).xyz * BA_Vertex_21_CB0((uint)(128)).xyz;
  r0.x = BA_Vertex_21_CB2((uint)(10)).y + -r0.w;
  r0.x = BA_Vertex_21_CB2((uint)(10)).x * r0.x;
  r0.y = 1 + -BA_Vertex_21_CB2((uint)(10)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_21_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_21_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_21_CB2((uint)(10)).z * r0.x);
  r0.w = BA_Vertex_21_CB0((uint)(17)).x * r1.y;
  r0.z = r1.x;
  r0.xy = r0.zw + r1.ww;
  r0.z = 0.5 / r1.w;
  o6.zw = r0.xy * r0.zz;
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_22_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_22_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_22_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_22_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_22_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_22_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_22_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_22_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_22_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_22_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_22_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_22_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_22_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_22_CB1((uint)(6)).xyz);
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = max(1.17549435e-038, r2.w);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  r3.x = r2.y * r2.y;
  r3.x = r2.x * r2.x + -r3.x;
  r4.xyzw = r2.xyzz * r2.yzzx;
  r5.x = dot(BA_Vertex_22_CB1((uint)(28)).xyzw, r4.xyzw);
  r5.y = dot(BA_Vertex_22_CB1((uint)(29)).xyzw, r4.xyzw);
  r5.z = dot(BA_Vertex_22_CB1((uint)(30)).xyzw, r4.xyzw);
  r3.xyz = BA_Vertex_22_CB1((uint)(31)).xyz * r3.xxx + r5.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_22_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_22_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_22_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r2.w = r2.x + r2.y;
  r2.w = r2.w + r2.z;
  r2.w = max(0.300000012, r2.w);
  r2.w = 0.300000012 / r2.w;
  o2.xyz = r2.xyz * r2.www;
  r1.z = r1.z / BA_Vertex_22_CB0((uint)(17)).y;
  r1.z = 1 + -r1.z;
  r1.z = BA_Vertex_22_CB0((uint)(17)).z * r1.z;
  r1.z = max(0, r1.z);
  o2.w = saturate(r1.z * BA_Vertex_22_CB0((uint)(55)).z + BA_Vertex_22_CB0((uint)(55)).w);
  o3.w = v2.w;
  r0.xyz = BA_Vertex_22_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  o4.xyz = r1.zzz * r0.xyz;
  r0.x = 1 + -BA_Vertex_22_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_22_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_22_CB2((uint)(8)).xyz * BA_Vertex_22_CB0((uint)(128)).xyz;
  r0.x = BA_Vertex_22_CB2((uint)(10)).y + -r0.w;
  r0.x = BA_Vertex_22_CB2((uint)(10)).x * r0.x;
  r0.y = 1 + -BA_Vertex_22_CB2((uint)(10)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_22_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_22_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_22_CB2((uint)(10)).z * r0.x);
  r0.w = BA_Vertex_22_CB0((uint)(17)).x * r1.y;
  r0.z = r1.x;
  r0.xy = r0.zw + r1.ww;
  r0.z = 0.5 / r1.w;
  o6.zw = r0.xy * r0.zz;
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_23_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_23_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_23_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_23_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_23_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_23_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_23_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_23_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_23_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_23_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_23_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_23_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_23_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_23_CB1((uint)(6)).xyz);
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = max(1.17549435e-038, r2.w);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  r3.x = r2.y * r2.y;
  r3.x = r2.x * r2.x + -r3.x;
  r4.xyzw = r2.xyzz * r2.yzzx;
  r5.x = dot(BA_Vertex_23_CB1((uint)(28)).xyzw, r4.xyzw);
  r5.y = dot(BA_Vertex_23_CB1((uint)(29)).xyzw, r4.xyzw);
  r5.z = dot(BA_Vertex_23_CB1((uint)(30)).xyzw, r4.xyzw);
  r3.xyz = BA_Vertex_23_CB1((uint)(31)).xyz * r3.xxx + r5.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_23_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_23_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_23_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r2.w = r2.x + r2.y;
  r2.w = r2.w + r2.z;
  r2.w = max(0.300000012, r2.w);
  r2.w = 0.300000012 / r2.w;
  o2.xyz = r2.xyz * r2.www;
  r1.z = r1.z / BA_Vertex_23_CB0((uint)(17)).y;
  r1.z = 1 + -r1.z;
  r1.z = BA_Vertex_23_CB0((uint)(17)).z * r1.z;
  r1.z = max(0, r1.z);
  o2.w = saturate(r1.z * BA_Vertex_23_CB0((uint)(55)).z + BA_Vertex_23_CB0((uint)(55)).w);
  o3.w = v2.w;
  r0.xyz = BA_Vertex_23_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  o4.xyz = r1.zzz * r0.xyz;
  r0.x = 1 + -BA_Vertex_23_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_23_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_23_CB2((uint)(8)).xyz * BA_Vertex_23_CB0((uint)(128)).xyz;
  r0.x = BA_Vertex_23_CB2((uint)(10)).y + -r0.w;
  r0.x = BA_Vertex_23_CB2((uint)(10)).x * r0.x;
  r0.y = 1 + -BA_Vertex_23_CB2((uint)(10)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_23_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_23_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_23_CB2((uint)(10)).z * r0.x);
  r0.w = BA_Vertex_23_CB0((uint)(17)).x * r1.y;
  r0.z = r1.x;
  r0.xy = r0.zw + r1.ww;
  r0.z = 0.5 / r1.w;
  o6.zw = r0.xy * r0.zz;
  o6.y = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_24_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_24_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_24_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_24_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_24_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_24_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_24_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_24_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_24_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_24_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_24_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_24_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_24_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_24_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_24_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_24_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_24_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_24_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_24_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_24_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_24_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_24_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_24_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_24_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_24_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_24_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_24_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_24_CB2((uint)(8)).xyz * BA_Vertex_24_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_25_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_25_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_25_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_25_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_25_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_25_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_25_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_25_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_25_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_25_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_25_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_25_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_25_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_25_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_25_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_25_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_25_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_25_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_25_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_25_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_25_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_25_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_25_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_25_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_25_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_25_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_25_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_25_CB2((uint)(8)).xyz * BA_Vertex_25_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_26_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_26_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_26_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_26_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_26_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_26_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_26_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_26_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_26_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_26_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_26_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_26_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_26_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_26_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_26_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_26_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_26_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_26_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_26_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_26_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_26_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_26_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_26_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_26_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_26_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_26_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_26_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_26_CB2((uint)(8)).xyz * BA_Vertex_26_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_27_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_27_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_27_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_27_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_27_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_27_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_27_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_27_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_27_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_27_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_27_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_27_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_27_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_27_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_27_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_27_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_27_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_27_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_27_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_27_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_27_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_27_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_27_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_27_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_27_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r0.xyz * r0.www;
  r0.x = 1 + -BA_Vertex_27_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_27_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_27_CB2((uint)(8)).xyz * BA_Vertex_27_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_28_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_28_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_28_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_28_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_28_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_28_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_28_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_28_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_28_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_28_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_28_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_28_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_28_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_28_CB1((uint)(6)).xyz);
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = max(1.17549435e-038, r2.w);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  r3.x = r2.y * r2.y;
  r3.x = r2.x * r2.x + -r3.x;
  r4.xyzw = r2.xyzz * r2.yzzx;
  r5.x = dot(BA_Vertex_28_CB1((uint)(28)).xyzw, r4.xyzw);
  r5.y = dot(BA_Vertex_28_CB1((uint)(29)).xyzw, r4.xyzw);
  r5.z = dot(BA_Vertex_28_CB1((uint)(30)).xyzw, r4.xyzw);
  r3.xyz = BA_Vertex_28_CB1((uint)(31)).xyz * r3.xxx + r5.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_28_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_28_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_28_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r2.w = r2.x + r2.y;
  r2.w = r2.w + r2.z;
  r2.w = max(0.300000012, r2.w);
  r2.w = 0.300000012 / r2.w;
  o2.xyz = r2.xyz * r2.www;
  r1.z = r1.z / BA_Vertex_28_CB0((uint)(17)).y;
  r1.z = 1 + -r1.z;
  r1.z = BA_Vertex_28_CB0((uint)(17)).z * r1.z;
  r1.z = max(0, r1.z);
  o2.w = BA_Vertex_28_CB0((uint)(55)).x * r1.z;
  o3.w = v2.w;
  r0.xyz = BA_Vertex_28_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  o4.xyz = r1.zzz * r0.xyz;
  r0.x = 1 + -BA_Vertex_28_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_28_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_28_CB2((uint)(8)).xyz * BA_Vertex_28_CB0((uint)(128)).xyz;
  r0.x = BA_Vertex_28_CB2((uint)(10)).y + -r0.w;
  r0.x = BA_Vertex_28_CB2((uint)(10)).x * r0.x;
  r0.y = 1 + -BA_Vertex_28_CB2((uint)(10)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_28_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_28_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_28_CB2((uint)(10)).z * r0.x);
  r0.w = BA_Vertex_28_CB0((uint)(17)).x * r1.y;
  r0.z = r1.x;
  r0.xy = r0.zw + r1.ww;
  r0.z = 0.5 / r1.w;
  o6.zw = r0.xy * r0.zz;
  o6.y = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_29_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_29_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_29_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_29_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_29_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_29_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_29_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_29_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_29_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_29_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_29_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_29_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_29_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_29_CB1((uint)(6)).xyz);
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = max(1.17549435e-038, r2.w);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  r3.x = r2.y * r2.y;
  r3.x = r2.x * r2.x + -r3.x;
  r4.xyzw = r2.xyzz * r2.yzzx;
  r5.x = dot(BA_Vertex_29_CB1((uint)(28)).xyzw, r4.xyzw);
  r5.y = dot(BA_Vertex_29_CB1((uint)(29)).xyzw, r4.xyzw);
  r5.z = dot(BA_Vertex_29_CB1((uint)(30)).xyzw, r4.xyzw);
  r3.xyz = BA_Vertex_29_CB1((uint)(31)).xyz * r3.xxx + r5.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_29_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_29_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_29_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r2.w = r2.x + r2.y;
  r2.w = r2.w + r2.z;
  r2.w = max(0.300000012, r2.w);
  r2.w = 0.300000012 / r2.w;
  o2.xyz = r2.xyz * r2.www;
  r1.z = r1.z / BA_Vertex_29_CB0((uint)(17)).y;
  r1.z = 1 + -r1.z;
  r1.z = BA_Vertex_29_CB0((uint)(17)).z * r1.z;
  r1.z = max(0, r1.z);
  o2.w = BA_Vertex_29_CB0((uint)(55)).x * r1.z;
  o3.w = v2.w;
  r0.xyz = BA_Vertex_29_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  o4.xyz = r1.zzz * r0.xyz;
  r0.x = 1 + -BA_Vertex_29_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_29_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_29_CB2((uint)(8)).xyz * BA_Vertex_29_CB0((uint)(128)).xyz;
  r0.x = BA_Vertex_29_CB2((uint)(10)).y + -r0.w;
  r0.x = BA_Vertex_29_CB2((uint)(10)).x * r0.x;
  r0.y = 1 + -BA_Vertex_29_CB2((uint)(10)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_29_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_29_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_29_CB2((uint)(10)).z * r0.x);
  r0.w = BA_Vertex_29_CB0((uint)(17)).x * r1.y;
  r0.z = r1.x;
  r0.xy = r0.zw + r1.ww;
  r0.z = 0.5 / r1.w;
  o6.zw = r0.xy * r0.zz;
  o6.y = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_30_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_30_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_30_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_30_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_30_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_30_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_30_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_30_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_30_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_30_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_30_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_30_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_30_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_30_CB1((uint)(6)).xyz);
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = max(1.17549435e-038, r2.w);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  r3.x = r2.y * r2.y;
  r3.x = r2.x * r2.x + -r3.x;
  r4.xyzw = r2.xyzz * r2.yzzx;
  r5.x = dot(BA_Vertex_30_CB1((uint)(28)).xyzw, r4.xyzw);
  r5.y = dot(BA_Vertex_30_CB1((uint)(29)).xyzw, r4.xyzw);
  r5.z = dot(BA_Vertex_30_CB1((uint)(30)).xyzw, r4.xyzw);
  r3.xyz = BA_Vertex_30_CB1((uint)(31)).xyz * r3.xxx + r5.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_30_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_30_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_30_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r2.w = r2.x + r2.y;
  r2.w = r2.w + r2.z;
  r2.w = max(0.300000012, r2.w);
  r2.w = 0.300000012 / r2.w;
  o2.xyz = r2.xyz * r2.www;
  r1.z = r1.z / BA_Vertex_30_CB0((uint)(17)).y;
  r1.z = 1 + -r1.z;
  r1.z = BA_Vertex_30_CB0((uint)(17)).z * r1.z;
  r1.z = max(0, r1.z);
  o2.w = BA_Vertex_30_CB0((uint)(55)).x * r1.z;
  o3.w = v2.w;
  r0.xyz = BA_Vertex_30_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  o4.xyz = r1.zzz * r0.xyz;
  r0.x = 1 + -BA_Vertex_30_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_30_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_30_CB2((uint)(8)).xyz * BA_Vertex_30_CB0((uint)(128)).xyz;
  r0.x = BA_Vertex_30_CB2((uint)(10)).y + -r0.w;
  r0.x = BA_Vertex_30_CB2((uint)(10)).x * r0.x;
  r0.y = 1 + -BA_Vertex_30_CB2((uint)(10)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_30_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_30_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_30_CB2((uint)(10)).z * r0.x);
  r0.w = BA_Vertex_30_CB0((uint)(17)).x * r1.y;
  r0.z = r1.x;
  r0.xy = r0.zw + r1.ww;
  r0.z = 0.5 / r1.w;
  o6.zw = r0.xy * r0.zz;
  o6.y = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_31_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_31_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_31_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_31_CB1((uint)(1)).xyzy * v0.yyyy;
  r0.xyzw = BA_Vertex_31_CB1((uint)(0)).xyzy * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_31_CB1((uint)(2)).xyzy * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_31_CB1((uint)(3)).xyzy + r0.xyzw;
  r1.xyzw = BA_Vertex_31_CB0((uint)(74)).xyzw * r0.wwww;
  r1.xyzw = BA_Vertex_31_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_31_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_31_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_31_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_31_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_31_CB1((uint)(6)).xyz);
  r2.w = dot(r2.xyz, r2.xyz);
  r2.w = max(1.17549435e-038, r2.w);
  r2.w = rsqrt(r2.w);
  r2.xyz = r2.xyz * r2.www;
  r3.x = r2.y * r2.y;
  r3.x = r2.x * r2.x + -r3.x;
  r4.xyzw = r2.xyzz * r2.yzzx;
  r5.x = dot(BA_Vertex_31_CB1((uint)(28)).xyzw, r4.xyzw);
  r5.y = dot(BA_Vertex_31_CB1((uint)(29)).xyzw, r4.xyzw);
  r5.z = dot(BA_Vertex_31_CB1((uint)(30)).xyzw, r4.xyzw);
  r3.xyz = BA_Vertex_31_CB1((uint)(31)).xyz * r3.xxx + r5.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_31_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_31_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_31_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r2.w = r2.x + r2.y;
  r2.w = r2.w + r2.z;
  r2.w = max(0.300000012, r2.w);
  r2.w = 0.300000012 / r2.w;
  o2.xyz = r2.xyz * r2.www;
  r1.z = r1.z / BA_Vertex_31_CB0((uint)(17)).y;
  r1.z = 1 + -r1.z;
  r1.z = BA_Vertex_31_CB0((uint)(17)).z * r1.z;
  r1.z = max(0, r1.z);
  o2.w = BA_Vertex_31_CB0((uint)(55)).x * r1.z;
  o3.w = v2.w;
  r0.xyz = BA_Vertex_31_CB0((uint)(16)).xyz + -r0.xyz;
  r1.z = dot(r0.xyz, r0.xyz);
  r1.z = max(1.17549435e-038, r1.z);
  r1.z = rsqrt(r1.z);
  o4.xyz = r1.zzz * r0.xyz;
  r0.x = 1 + -BA_Vertex_31_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_31_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_31_CB2((uint)(8)).xyz * BA_Vertex_31_CB0((uint)(128)).xyz;
  r0.x = BA_Vertex_31_CB2((uint)(10)).y + -r0.w;
  r0.x = BA_Vertex_31_CB2((uint)(10)).x * r0.x;
  r0.y = 1 + -BA_Vertex_31_CB2((uint)(10)).x;
  r0.x = r0.w * r0.y + r0.x;
  r0.x = r0.x / BA_Vertex_31_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_31_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_31_CB2((uint)(10)).z * r0.x);
  r0.w = BA_Vertex_31_CB0((uint)(17)).x * r1.y;
  r0.z = r1.x;
  r0.xy = r0.zw + r1.ww;
  r0.z = 0.5 / r1.w;
  o6.zw = r0.xy * r0.zz;
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_32_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_32_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_32_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float3 o6 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_32_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_32_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_32_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_32_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_32_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_32_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_32_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_32_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_32_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_32_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_32_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_32_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_32_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_32_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_32_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_32_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_32_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_32_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_32_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o4.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_32_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_32_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_32_CB2((uint)(8)).xyz * BA_Vertex_32_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_33_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_33_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_33_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float3 o6 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_33_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_33_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_33_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_33_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_33_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_33_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_33_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_33_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_33_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_33_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_33_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_33_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_33_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_33_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_33_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_33_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_33_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_33_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_33_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o4.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_33_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_33_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_33_CB2((uint)(8)).xyz * BA_Vertex_33_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_34_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_34_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_34_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float3 o6 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_34_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_34_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_34_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_34_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_34_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_34_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_34_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_34_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_34_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_34_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_34_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_34_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_34_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_34_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_34_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_34_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_34_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_34_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_34_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o4.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_34_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_34_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_34_CB2((uint)(8)).xyz * BA_Vertex_34_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_35_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_35_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_35_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float3 o6 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_35_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_35_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_35_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_35_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_35_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_35_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_35_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_35_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_35_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_35_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_35_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_35_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_35_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_35_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_35_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_35_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_35_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_35_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_35_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o4.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_35_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_35_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_35_CB2((uint)(8)).xyz * BA_Vertex_35_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_36_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_36_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_36_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7,
  out float3 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_36_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_36_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_36_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_36_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_36_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_36_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_36_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_36_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_36_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_36_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_36_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_36_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_36_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_36_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_36_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_36_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_36_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_36_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r0.w = r2.x + r2.y;
  r0.w = r0.w + r2.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r2.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r2.xyz = BA_Vertex_36_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r2.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_36_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_36_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_36_CB2((uint)(8)).xyz * BA_Vertex_36_CB0((uint)(128)).xyz;
  r2.w = BA_Vertex_36_CB0((uint)(17)).x * r1.y;
  r2.z = r1.x;
  r1.xy = r2.zw + r1.ww;
  r0.w = 0.5 / r1.w;
  o6.zw = r1.xy * r0.ww;
  r0.w = BA_Vertex_36_CB2((uint)(10)).y + -r0.y;
  r0.w = BA_Vertex_36_CB2((uint)(10)).x * r0.w;
  r1.x = 1 + -BA_Vertex_36_CB2((uint)(10)).x;
  r0.w = r0.y * r1.x + r0.w;
  o7.xyz = r0.xyz;
  r0.x = r0.w / BA_Vertex_36_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_36_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_36_CB2((uint)(10)).z * r0.x);
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_37_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_37_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_37_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7,
  out float3 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_37_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_37_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_37_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_37_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_37_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_37_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_37_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_37_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_37_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_37_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_37_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_37_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_37_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_37_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_37_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_37_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_37_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_37_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r0.w = r2.x + r2.y;
  r0.w = r0.w + r2.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r2.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r2.xyz = BA_Vertex_37_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r2.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_37_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_37_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_37_CB2((uint)(8)).xyz * BA_Vertex_37_CB0((uint)(128)).xyz;
  r2.w = BA_Vertex_37_CB0((uint)(17)).x * r1.y;
  r2.z = r1.x;
  r1.xy = r2.zw + r1.ww;
  r0.w = 0.5 / r1.w;
  o6.zw = r1.xy * r0.ww;
  r0.w = BA_Vertex_37_CB2((uint)(10)).y + -r0.y;
  r0.w = BA_Vertex_37_CB2((uint)(10)).x * r0.w;
  r1.x = 1 + -BA_Vertex_37_CB2((uint)(10)).x;
  r0.w = r0.y * r1.x + r0.w;
  o7.xyz = r0.xyz;
  r0.x = r0.w / BA_Vertex_37_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_37_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_37_CB2((uint)(10)).z * r0.x);
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_38_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_38_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_38_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7,
  out float3 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_38_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_38_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_38_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_38_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_38_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_38_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_38_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_38_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_38_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_38_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_38_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_38_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_38_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_38_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_38_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_38_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_38_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_38_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r0.w = r2.x + r2.y;
  r0.w = r0.w + r2.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r2.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r2.xyz = BA_Vertex_38_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r2.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_38_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_38_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_38_CB2((uint)(8)).xyz * BA_Vertex_38_CB0((uint)(128)).xyz;
  r2.w = BA_Vertex_38_CB0((uint)(17)).x * r1.y;
  r2.z = r1.x;
  r1.xy = r2.zw + r1.ww;
  r0.w = 0.5 / r1.w;
  o6.zw = r1.xy * r0.ww;
  r0.w = BA_Vertex_38_CB2((uint)(10)).y + -r0.y;
  r0.w = BA_Vertex_38_CB2((uint)(10)).x * r0.w;
  r1.x = 1 + -BA_Vertex_38_CB2((uint)(10)).x;
  r0.w = r0.y * r1.x + r0.w;
  o7.xyz = r0.xyz;
  r0.x = r0.w / BA_Vertex_38_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_38_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_38_CB2((uint)(10)).z * r0.x);
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_39_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_39_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_39_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7,
  out float3 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_39_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_39_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_39_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_39_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_39_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_39_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_39_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_39_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_39_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_39_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_39_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_39_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_39_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_39_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_39_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_39_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_39_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_39_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r0.w = r2.x + r2.y;
  r0.w = r0.w + r2.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r2.xyz * r0.www;
  o2.w = 0;
  o3.w = v2.w;
  r2.xyz = BA_Vertex_39_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r2.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_39_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_39_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_39_CB2((uint)(8)).xyz * BA_Vertex_39_CB0((uint)(128)).xyz;
  r2.w = BA_Vertex_39_CB0((uint)(17)).x * r1.y;
  r2.z = r1.x;
  r1.xy = r2.zw + r1.ww;
  r0.w = 0.5 / r1.w;
  o6.zw = r1.xy * r0.ww;
  r0.w = BA_Vertex_39_CB2((uint)(10)).y + -r0.y;
  r0.w = BA_Vertex_39_CB2((uint)(10)).x * r0.w;
  r1.x = 1 + -BA_Vertex_39_CB2((uint)(10)).x;
  r0.w = r0.y * r1.x + r0.w;
  o7.xyz = r0.xyz;
  r0.x = r0.w / BA_Vertex_39_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_39_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_39_CB2((uint)(10)).z * r0.x);
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_40_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_40_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_40_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float3 o6 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_40_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_40_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_40_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_40_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_40_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_40_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_40_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_40_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_40_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_40_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_40_CB0((uint)(55)).z + BA_Vertex_40_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_40_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_40_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_40_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_40_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_40_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_40_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_40_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_40_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_40_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_40_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_40_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o4.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_40_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_40_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_40_CB2((uint)(8)).xyz * BA_Vertex_40_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_41_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_41_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_41_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float3 o6 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_41_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_41_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_41_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_41_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_41_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_41_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_41_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_41_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_41_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_41_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_41_CB0((uint)(55)).z + BA_Vertex_41_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_41_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_41_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_41_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_41_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_41_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_41_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_41_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_41_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_41_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_41_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_41_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o4.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_41_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_41_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_41_CB2((uint)(8)).xyz * BA_Vertex_41_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_42_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_42_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_42_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float3 o6 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_42_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_42_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_42_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_42_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_42_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_42_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_42_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_42_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_42_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_42_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_42_CB0((uint)(55)).z + BA_Vertex_42_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_42_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_42_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_42_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_42_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_42_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_42_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_42_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_42_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_42_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_42_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_42_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o4.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_42_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_42_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_42_CB2((uint)(8)).xyz * BA_Vertex_42_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_43_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_43_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_43_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float3 o6 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_43_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_43_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_43_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_43_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_43_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_43_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_43_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_43_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_43_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_43_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_43_CB0((uint)(55)).z + BA_Vertex_43_CB0((uint)(55)).w);
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_43_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_43_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_43_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_43_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_43_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_43_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_43_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_43_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_43_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_43_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_43_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o4.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_43_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_43_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_43_CB2((uint)(8)).xyz * BA_Vertex_43_CB0((uint)(128)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_44_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_44_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_44_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7,
  out float3 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_44_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_44_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_44_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_44_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_44_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_44_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_44_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_44_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_44_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_44_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_44_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_44_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_44_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_44_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_44_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_44_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_44_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_44_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r0.w = r2.x + r2.y;
  r0.w = r0.w + r2.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r2.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_44_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_44_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_44_CB0((uint)(55)).z + BA_Vertex_44_CB0((uint)(55)).w);
  o3.w = v2.w;
  r2.xyz = BA_Vertex_44_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r2.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_44_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_44_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_44_CB2((uint)(8)).xyz * BA_Vertex_44_CB0((uint)(128)).xyz;
  r2.w = BA_Vertex_44_CB0((uint)(17)).x * r1.y;
  r2.z = r1.x;
  r1.xy = r2.zw + r1.ww;
  r0.w = 0.5 / r1.w;
  o6.zw = r1.xy * r0.ww;
  r0.w = BA_Vertex_44_CB2((uint)(10)).y + -r0.y;
  r0.w = BA_Vertex_44_CB2((uint)(10)).x * r0.w;
  r1.x = 1 + -BA_Vertex_44_CB2((uint)(10)).x;
  r0.w = r0.y * r1.x + r0.w;
  o7.xyz = r0.xyz;
  r0.x = r0.w / BA_Vertex_44_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_44_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_44_CB2((uint)(10)).z * r0.x);
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_45_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_45_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_45_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7,
  out float3 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_45_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_45_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_45_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_45_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_45_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_45_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_45_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_45_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_45_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_45_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_45_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_45_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_45_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_45_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_45_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_45_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_45_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_45_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r0.w = r2.x + r2.y;
  r0.w = r0.w + r2.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r2.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_45_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_45_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_45_CB0((uint)(55)).z + BA_Vertex_45_CB0((uint)(55)).w);
  o3.w = v2.w;
  r2.xyz = BA_Vertex_45_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r2.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_45_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_45_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_45_CB2((uint)(8)).xyz * BA_Vertex_45_CB0((uint)(128)).xyz;
  r2.w = BA_Vertex_45_CB0((uint)(17)).x * r1.y;
  r2.z = r1.x;
  r1.xy = r2.zw + r1.ww;
  r0.w = 0.5 / r1.w;
  o6.zw = r1.xy * r0.ww;
  r0.w = BA_Vertex_45_CB2((uint)(10)).y + -r0.y;
  r0.w = BA_Vertex_45_CB2((uint)(10)).x * r0.w;
  r1.x = 1 + -BA_Vertex_45_CB2((uint)(10)).x;
  r0.w = r0.y * r1.x + r0.w;
  o7.xyz = r0.xyz;
  r0.x = r0.w / BA_Vertex_45_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_45_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_45_CB2((uint)(10)).z * r0.x);
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_46_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_46_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_46_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7,
  out float3 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_46_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_46_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_46_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_46_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_46_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_46_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_46_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_46_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_46_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_46_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_46_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_46_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_46_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_46_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_46_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_46_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_46_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_46_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r0.w = r2.x + r2.y;
  r0.w = r0.w + r2.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r2.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_46_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_46_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_46_CB0((uint)(55)).z + BA_Vertex_46_CB0((uint)(55)).w);
  o3.w = v2.w;
  r2.xyz = BA_Vertex_46_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r2.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_46_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_46_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_46_CB2((uint)(8)).xyz * BA_Vertex_46_CB0((uint)(128)).xyz;
  r2.w = BA_Vertex_46_CB0((uint)(17)).x * r1.y;
  r2.z = r1.x;
  r1.xy = r2.zw + r1.ww;
  r0.w = 0.5 / r1.w;
  o6.zw = r1.xy * r0.ww;
  r0.w = BA_Vertex_46_CB2((uint)(10)).y + -r0.y;
  r0.w = BA_Vertex_46_CB2((uint)(10)).x * r0.w;
  r1.x = 1 + -BA_Vertex_46_CB2((uint)(10)).x;
  r0.w = r0.y * r1.x + r0.w;
  o7.xyz = r0.xyz;
  r0.x = r0.w / BA_Vertex_46_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_46_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_46_CB2((uint)(10)).z * r0.x);
  o6.y = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_47_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_47_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_47_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7,
  out float3 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_47_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_47_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_47_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_47_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_47_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_47_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_47_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_47_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_47_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_47_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_47_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_47_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_47_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_47_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_47_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_47_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_47_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_47_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r0.w = r2.x + r2.y;
  r0.w = r0.w + r2.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r2.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_47_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_47_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = saturate(r0.w * BA_Vertex_47_CB0((uint)(55)).z + BA_Vertex_47_CB0((uint)(55)).w);
  o3.w = v2.w;
  r2.xyz = BA_Vertex_47_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r2.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_47_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_47_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_47_CB2((uint)(8)).xyz * BA_Vertex_47_CB0((uint)(128)).xyz;
  r2.w = BA_Vertex_47_CB0((uint)(17)).x * r1.y;
  r2.z = r1.x;
  r1.xy = r2.zw + r1.ww;
  r0.w = 0.5 / r1.w;
  o6.zw = r1.xy * r0.ww;
  r0.w = BA_Vertex_47_CB2((uint)(10)).y + -r0.y;
  r0.w = BA_Vertex_47_CB2((uint)(10)).x * r0.w;
  r1.x = 1 + -BA_Vertex_47_CB2((uint)(10)).x;
  r0.w = r0.y * r1.x + r0.w;
  o7.xyz = r0.xyz;
  r0.x = r0.w / BA_Vertex_47_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_47_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_47_CB2((uint)(10)).z * r0.x);
  o6.y = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_48_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_48_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_48_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float3 o6 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_48_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_48_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_48_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_48_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_48_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_48_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_48_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_48_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_48_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_48_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_48_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_48_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_48_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_48_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_48_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_48_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_48_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_48_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_48_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_48_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_48_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_48_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o4.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_48_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_48_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_48_CB2((uint)(8)).xyz * BA_Vertex_48_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_49_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_49_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_49_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float3 o6 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_49_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_49_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_49_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_49_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_49_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_49_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_49_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_49_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_49_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_49_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_49_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_49_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_49_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_49_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_49_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_49_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_49_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_49_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_49_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_49_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_49_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_49_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o4.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_49_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_49_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_49_CB2((uint)(8)).xyz * BA_Vertex_49_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_50_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_50_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_50_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float3 o6 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_50_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_50_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_50_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_50_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_50_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_50_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_50_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_50_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_50_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_50_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_50_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_50_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_50_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_50_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_50_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_50_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_50_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_50_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_50_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_50_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_50_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_50_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o4.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_50_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_50_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_50_CB2((uint)(8)).xyz * BA_Vertex_50_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_51_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  return value;
}

float4 BA_Vertex_51_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_51_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float3 o6 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_51_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_51_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_51_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_51_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_51_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_51_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_51_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_51_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_51_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_51_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_51_CB0((uint)(55)).x * r0.w;
  o1.xy = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_51_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_51_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_51_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = r1.y * r1.y;
  r0.w = r1.x * r1.x + -r0.w;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(BA_Vertex_51_CB1((uint)(28)).xyzw, r2.xyzw);
  r3.y = dot(BA_Vertex_51_CB1((uint)(29)).xyzw, r2.xyzw);
  r3.z = dot(BA_Vertex_51_CB1((uint)(30)).xyzw, r2.xyzw);
  r2.xyz = BA_Vertex_51_CB1((uint)(31)).xyz * r0.www + r3.xyz;
  r1.w = 1;
  r3.x = dot(BA_Vertex_51_CB1((uint)(25)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_51_CB1((uint)(26)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_51_CB1((uint)(27)).xyzw, r1.xyzw);
  o3.xyz = r1.xyz;
  r1.xyz = r3.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.w = r1.x + r1.y;
  r0.w = r0.w + r1.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r1.xyz * r0.www;
  o3.w = v2.w;
  r1.xyz = BA_Vertex_51_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  o4.xyz = r1.xyz * r0.xxx;
  r0.x = 1 + -BA_Vertex_51_CB0((uint)(129)).y;
  o5.w = r0.x * 0.150000006 + BA_Vertex_51_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_51_CB2((uint)(8)).xyz * BA_Vertex_51_CB0((uint)(128)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_52_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_52_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_52_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7,
  out float3 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_52_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_52_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_52_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_52_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_52_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_52_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_52_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_52_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_52_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_52_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_52_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_52_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_52_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_52_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_52_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_52_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_52_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_52_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r0.w = r2.x + r2.y;
  r0.w = r0.w + r2.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r2.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_52_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_52_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_52_CB0((uint)(55)).x * r0.w;
  o3.w = v2.w;
  r2.xyz = BA_Vertex_52_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r2.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_52_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_52_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_52_CB2((uint)(8)).xyz * BA_Vertex_52_CB0((uint)(128)).xyz;
  r2.w = BA_Vertex_52_CB0((uint)(17)).x * r1.y;
  r2.z = r1.x;
  r1.xy = r2.zw + r1.ww;
  r0.w = 0.5 / r1.w;
  o6.zw = r1.xy * r0.ww;
  r0.w = BA_Vertex_52_CB2((uint)(10)).y + -r0.y;
  r0.w = BA_Vertex_52_CB2((uint)(10)).x * r0.w;
  r1.x = 1 + -BA_Vertex_52_CB2((uint)(10)).x;
  r0.w = r0.y * r1.x + r0.w;
  o7.xyz = r0.xyz;
  r0.x = r0.w / BA_Vertex_52_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_52_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_52_CB2((uint)(10)).z * r0.x);
  o6.y = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Vertex_53_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_53_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_53_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7,
  out float3 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_53_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_53_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_53_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_53_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_53_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_53_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_53_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_53_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_53_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_53_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_53_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_53_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_53_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_53_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_53_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_53_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_53_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_53_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r0.w = r2.x + r2.y;
  r0.w = r0.w + r2.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r2.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_53_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_53_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_53_CB0((uint)(55)).x * r0.w;
  o3.w = v2.w;
  r2.xyz = BA_Vertex_53_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r2.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_53_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_53_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_53_CB2((uint)(8)).xyz * BA_Vertex_53_CB0((uint)(128)).xyz;
  r2.w = BA_Vertex_53_CB0((uint)(17)).x * r1.y;
  r2.z = r1.x;
  r1.xy = r2.zw + r1.ww;
  r0.w = 0.5 / r1.w;
  o6.zw = r1.xy * r0.ww;
  r0.w = BA_Vertex_53_CB2((uint)(10)).y + -r0.y;
  r0.w = BA_Vertex_53_CB2((uint)(10)).x * r0.w;
  r1.x = 1 + -BA_Vertex_53_CB2((uint)(10)).x;
  r0.w = r0.y * r1.x + r0.w;
  o7.xyz = r0.xyz;
  r0.x = r0.w / BA_Vertex_53_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_53_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_53_CB2((uint)(10)).z * r0.x);
  o6.y = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_54_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, _ShadowThreshold, 0.0, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_54_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_54_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7,
  out float3 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_54_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_54_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_54_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_54_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_54_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_54_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_54_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_54_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_54_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_54_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_54_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_54_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_54_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_54_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_54_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_54_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_54_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_54_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r0.w = r2.x + r2.y;
  r0.w = r0.w + r2.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r2.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_54_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_54_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_54_CB0((uint)(55)).x * r0.w;
  o3.w = v2.w;
  r2.xyz = BA_Vertex_54_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r2.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_54_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_54_CB2((uint)(3)).y;
  o5.xyz = BA_Vertex_54_CB2((uint)(8)).xyz * BA_Vertex_54_CB0((uint)(128)).xyz;
  r2.w = BA_Vertex_54_CB0((uint)(17)).x * r1.y;
  r2.z = r1.x;
  r1.xy = r2.zw + r1.ww;
  r0.w = 0.5 / r1.w;
  o6.zw = r1.xy * r0.ww;
  r0.w = BA_Vertex_54_CB2((uint)(10)).y + -r0.y;
  r0.w = BA_Vertex_54_CB2((uint)(10)).x * r0.w;
  r1.x = 1 + -BA_Vertex_54_CB2((uint)(10)).x;
  r0.w = r0.y * r1.x + r0.w;
  o7.xyz = r0.xyz;
  r0.x = r0.w / BA_Vertex_54_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_54_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_54_CB2((uint)(10)).z * r0.x);
  o6.y = 0;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Vertex_55_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, _ShadowThreshold, 0.0);
  if (i == 8u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 10u) value = float4(_DissolveDirection, _DissolveStartHeight, _DissolveLineThinness, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Vertex_55_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_55_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 128u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
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
  out float4 o6 : TEXCOORD7,
  out float3 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_55_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_55_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_55_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_55_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_55_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_55_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_55_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_55_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v3.xy;
  r2.x = dot(v1.xyz, BA_Vertex_55_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_55_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_55_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_55_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_55_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_55_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_55_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_55_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_55_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_55_CB1((uint)(27)).xyzw, r2.xyzw);
  o3.xyz = r2.xyz;
  r2.xyz = r4.xyz + r3.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r0.w = r2.x + r2.y;
  r0.w = r0.w + r2.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o2.xyz = r2.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_55_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_55_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o2.w = BA_Vertex_55_CB0((uint)(55)).x * r0.w;
  o3.w = v2.w;
  r2.xyz = BA_Vertex_55_CB0((uint)(16)).xyz + -r0.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r2.xyz * r0.www;
  r0.w = 1 + -BA_Vertex_55_CB0((uint)(129)).y;
  o5.w = r0.w * 0.150000006 + BA_Vertex_55_CB2((uint)(3)).z;
  o5.xyz = BA_Vertex_55_CB2((uint)(8)).xyz * BA_Vertex_55_CB0((uint)(128)).xyz;
  r2.w = BA_Vertex_55_CB0((uint)(17)).x * r1.y;
  r2.z = r1.x;
  r1.xy = r2.zw + r1.ww;
  r0.w = 0.5 / r1.w;
  o6.zw = r1.xy * r0.ww;
  r0.w = BA_Vertex_55_CB2((uint)(10)).y + -r0.y;
  r0.w = BA_Vertex_55_CB2((uint)(10)).x * r0.w;
  r1.x = 1 + -BA_Vertex_55_CB2((uint)(10)).x;
  r0.w = r0.y * r1.x + r0.w;
  o7.xyz = r0.xyz;
  r0.x = r0.w / BA_Vertex_55_CB2((uint)(10)).y;
  r0.y = 1 + -BA_Vertex_55_CB2((uint)(15)).x;
  r0.x = r0.y + -r0.x;
  o6.x = saturate(BA_Vertex_55_CB2((uint)(10)).z * r0.x);
  o6.y = 0;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_88_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_88_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  uint v6 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_88_CB0((uint)(126)).xyz * BA_Fragment_88_CB1((uint)(1)).xxx + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xy = v6.xx ? float2(1,0) : float2(-1,1);
  r1.xzw = v3.xyz * r1.xxx;
  r0.x = saturate(dot(r1.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_88_CB1((uint)(1)).y * r0.x;
  r0.x = exp2(r0.x);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_88_CB0((uint)(19)).x).xyzw;
  r0.y = -r2.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_88_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_88_CB1((uint)(2)).y * r0.z;
  r0.w = 1 + -BA_Fragment_88_CB1((uint)(2)).y;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_88_CB1((uint)(1)).z + 1);
  r2.y = dot(r1.xzw, BA_Fragment_88_CB0((uint)(126)).xyz);
  r1.x = dot(r1.xzw, v4.xyz);
  r1.z = r1.x * 0.769999981 + r2.y;
  r2.yw = r2.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r1.x = 1 + -r1.x;
  r1.z = r0.y * BA_Fragment_88_CB1((uint)(6)).x + r1.z;
  r1.z = -v5.w + r1.z;
  r1.z = saturate(-10 * r1.z);
  r1.w = r2.x * r1.z;
  r2.x = BA_Fragment_88_CB1((uint)(4)).w * r2.z;
  r3.xyz = BA_Fragment_88_CB1((uint)(4)).xyz * r2.xxx;
  r2.x = saturate(r1.x * BA_Fragment_88_CB1((uint)(2)).z + -BA_Fragment_88_CB1((uint)(3)).x);
  r2.x = v3.w * r2.x;
  r2.z = saturate(-r2.x * BA_Fragment_88_CB1((uint)(2)).w + 1);
  r2.x = BA_Fragment_88_CB1((uint)(2)).w * r2.x;
  r2.x = BA_Fragment_88_CB0((uint)(129)).x * r2.x;
  r1.w = r2.z * r1.w;
  r0.z = r1.w * r0.z;
  r1.w = saturate(r1.x);
  r1.x = r1.x * r1.x;
  r1.w = log2(r1.w);
  r1.w = BA_Fragment_88_CB1((uint)(1)).w * r1.w;
  r1.w = exp2(r1.w);
  r0.y = saturate(r0.y * BA_Fragment_88_CB1((uint)(6)).x + r1.w);
  r1.w = 4000 * r0.y;
  r1.w = min(1, r1.w);
  r1.w = BA_Fragment_88_CB1((uint)(2)).y * r1.w;
  r0.y = r0.w * r0.y + r1.w;
  r0.w = saturate(-r0.y * BA_Fragment_88_CB1((uint)(2)).x + 1);
  r0.y = BA_Fragment_88_CB1((uint)(2)).x * r0.y;
  r0.x = r0.x * BA_Fragment_88_CB1((uint)(1)).z + r0.y;
  r0.x = BA_Fragment_88_CB1((uint)(0)).w + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_88_CB1((uint)(5)).w * r0.y;
  r4.xyz = BA_Fragment_88_CB1((uint)(5)).xyz * BA_Fragment_88_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r4.xyz + float3(1,1,1);
  r4.xyz = -BA_Fragment_88_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r1.zzz * r4.xyz + BA_Fragment_88_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_88_CB0((uint)(129)).xxx + v2.xyz;
  r2.y = saturate(r2.y);
  r1.z = r2.y * 0.399999976 + 0.300000012;
  r5.xyz = BA_Fragment_88_CB0((uint)(127)).xyz * r1.zzz;
  r2.xyz = r2.xxx * r5.xyz + r4.xyz;
  r2.xyz = r0.xxx * BA_Fragment_88_CB0((uint)(127)).xyz + r2.xyz;
  r0.xyz = r2.xyz * r0.yzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_88_CB0((uint)(19)).x).xyzw;
  r4.xyzw = BA_Fragment_88_CB1((uint)(7)).xyzw * r4.xyzw;
  r0.xyz = r0.xyz * r4.xyz + r3.xyz;
  r0.w = asfloat((uint)v6.x & 0x3f800000u);
  r2.xyz = BA_Fragment_88_CB1((uint)(0)).xyz * r4.xyz;
  o0.w = r4.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = v5.xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r0.www * r0.xyz + r1.yzw;
  r0.xyz = r0.xyz * BA_Fragment_88_CB1((uint)(11)).xyz + BA_Fragment_88_CB1((uint)(10)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_88_CB1((uint)(12)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_89_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_89_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  uint v6 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_89_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_89_CB1((uint)(0)).x + r0.w;
  r0.xyzw = BA_Fragment_89_CB1((uint)(7)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.xyz = BA_Fragment_89_CB0((uint)(126)).xyz * BA_Fragment_89_CB1((uint)(1)).yyy + v4.xyz;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = max(1.17549435e-038, r1.w);
  r1.w = rsqrt(r1.w);
  r1.xyz = r1.xyz * r1.www;
  r2.xy = v6.xx ? float2(1,0) : float2(-1,1);
  r2.xzw = v3.xyz * r2.xxx;
  r1.x = saturate(dot(r2.xzw, r1.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_89_CB1((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_89_CB0((uint)(19)).x).xyzw;
  r1.y = -r3.y * 2 + 1;
  r1.x = saturate(r1.y * BA_Fragment_89_CB1((uint)(6)).x + r1.x);
  r1.z = -0.5 + r1.x;
  r1.z = saturate(10 * r1.z);
  r1.z = BA_Fragment_89_CB1((uint)(2)).z * r1.z;
  r1.w = 1 + -BA_Fragment_89_CB1((uint)(2)).z;
  r1.x = r1.w * r1.x + r1.z;
  r1.z = saturate(-r1.x * BA_Fragment_89_CB1((uint)(1)).w + 1);
  r3.y = dot(r2.xzw, BA_Fragment_89_CB0((uint)(126)).xyz);
  r2.x = dot(r2.xzw, v4.xyz);
  r2.z = r2.x * 0.769999981 + r3.y;
  r3.yw = r3.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r2.x = 1 + -r2.x;
  r2.z = r1.y * BA_Fragment_89_CB1((uint)(6)).x + r2.z;
  r2.z = -v5.w + r2.z;
  r2.z = saturate(-10 * r2.z);
  r2.w = r3.x * r2.z;
  r3.x = BA_Fragment_89_CB1((uint)(4)).w * r3.z;
  r4.xyz = BA_Fragment_89_CB1((uint)(4)).xyz * r3.xxx;
  r3.x = saturate(r2.x * BA_Fragment_89_CB1((uint)(2)).w + -BA_Fragment_89_CB1((uint)(3)).y);
  r3.x = v3.w * r3.x;
  r3.z = saturate(-r3.x * BA_Fragment_89_CB1((uint)(3)).x + 1);
  r3.x = BA_Fragment_89_CB1((uint)(3)).x * r3.x;
  r3.x = BA_Fragment_89_CB0((uint)(129)).x * r3.x;
  r2.w = r3.z * r2.w;
  r1.z = r2.w * r1.z;
  r2.w = saturate(r2.x);
  r2.x = r2.x * r2.x;
  r2.w = log2(r2.w);
  r2.w = BA_Fragment_89_CB1((uint)(2)).x * r2.w;
  r2.w = exp2(r2.w);
  r1.y = saturate(r1.y * BA_Fragment_89_CB1((uint)(6)).x + r2.w);
  r2.w = 4000 * r1.y;
  r2.w = min(1, r2.w);
  r2.w = BA_Fragment_89_CB1((uint)(2)).z * r2.w;
  r1.y = r1.w * r1.y + r2.w;
  r1.w = saturate(-r1.y * BA_Fragment_89_CB1((uint)(2)).y + 1);
  r1.y = BA_Fragment_89_CB1((uint)(2)).y * r1.y;
  r1.x = r1.x * BA_Fragment_89_CB1((uint)(1)).w + r1.y;
  r1.x = BA_Fragment_89_CB1((uint)(1)).x + r1.x;
  r1.y = r1.z * r1.w;
  r1.y = BA_Fragment_89_CB1((uint)(5)).w * r1.y;
  r5.xyz = BA_Fragment_89_CB1((uint)(5)).xyz * BA_Fragment_89_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.yzw = r1.yyy * r5.xyz + float3(1,1,1);
  r5.xyz = -BA_Fragment_89_CB0((uint)(127)).xyz + v5.xyz;
  r5.xyz = r2.zzz * r5.xyz + BA_Fragment_89_CB0((uint)(127)).xyz;
  r5.xyz = r5.xyz * BA_Fragment_89_CB0((uint)(129)).xxx + v2.xyz;
  r3.y = saturate(r3.y);
  r2.z = r3.y * 0.399999976 + 0.300000012;
  r6.xyz = BA_Fragment_89_CB0((uint)(127)).xyz * r2.zzz;
  r3.xyz = r3.xxx * r6.xyz + r5.xyz;
  r3.xyz = r1.xxx * BA_Fragment_89_CB0((uint)(127)).xyz + r3.xyz;
  r1.xyz = r3.xyz * r1.yzw;
  r1.xyz = r1.xyz * r0.xyz + r4.xyz;
  r1.w = asfloat((uint)v6.x & 0x3f800000u);
  r0.xyz = BA_Fragment_89_CB1((uint)(0)).yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = r0.xyz * r3.www;
  r0.xyz = v5.xyz * r0.xyz;
  r0.xyz = r2.yyy * r0.xyz;
  r0.xyz = r1.www * r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_89_CB1((uint)(11)).xyz + BA_Fragment_89_CB1((uint)(10)).xyz;
  o0.xyz = r2.xxx * BA_Fragment_89_CB1((uint)(12)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_90_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  return value;
}

float4 BA_Fragment_90_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  uint v6 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_90_CB0((uint)(126)).xyz * BA_Fragment_90_CB1((uint)(1)).xxx + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xy = v6.xx ? float2(1,0) : float2(-1,1);
  r1.xzw = v3.xyz * r1.xxx;
  r0.x = saturate(dot(r1.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_90_CB1((uint)(1)).y * r0.x;
  r0.x = exp2(r0.x);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_90_CB0((uint)(19)).x).xyzw;
  r0.y = -r2.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_90_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_90_CB1((uint)(2)).y * r0.z;
  r0.w = 1 + -BA_Fragment_90_CB1((uint)(2)).y;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_90_CB1((uint)(1)).z + 1);
  r2.y = dot(r1.xzw, BA_Fragment_90_CB0((uint)(126)).xyz);
  r1.x = dot(r1.xzw, v4.xyz);
  r1.z = r1.x * 0.769999981 + r2.y;
  r2.yw = r2.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r1.x = 1 + -r1.x;
  r1.z = r0.y * BA_Fragment_90_CB1((uint)(6)).x + r1.z;
  r1.z = -v5.w + r1.z;
  r1.z = saturate(-10 * r1.z);
  r1.w = r2.x * r1.z;
  r2.x = BA_Fragment_90_CB1((uint)(4)).w * r2.z;
  r3.xyz = BA_Fragment_90_CB1((uint)(4)).xyz * r2.xxx;
  r2.x = saturate(r1.x * BA_Fragment_90_CB1((uint)(2)).z + -BA_Fragment_90_CB1((uint)(3)).x);
  r2.x = v3.w * r2.x;
  r2.z = saturate(-r2.x * BA_Fragment_90_CB1((uint)(2)).w + 1);
  r2.x = BA_Fragment_90_CB1((uint)(2)).w * r2.x;
  r2.x = BA_Fragment_90_CB0((uint)(129)).x * r2.x;
  r1.w = r2.z * r1.w;
  r0.z = r1.w * r0.z;
  r1.w = saturate(r1.x);
  r1.x = r1.x * r1.x;
  r1.w = log2(r1.w);
  r1.w = BA_Fragment_90_CB1((uint)(1)).w * r1.w;
  r1.w = exp2(r1.w);
  r0.y = saturate(r0.y * BA_Fragment_90_CB1((uint)(6)).x + r1.w);
  r1.w = 4000 * r0.y;
  r1.w = min(1, r1.w);
  r1.w = BA_Fragment_90_CB1((uint)(2)).y * r1.w;
  r0.y = r0.w * r0.y + r1.w;
  r0.w = saturate(-r0.y * BA_Fragment_90_CB1((uint)(2)).x + 1);
  r0.y = BA_Fragment_90_CB1((uint)(2)).x * r0.y;
  r0.x = r0.x * BA_Fragment_90_CB1((uint)(1)).z + r0.y;
  r0.x = BA_Fragment_90_CB1((uint)(0)).w + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_90_CB1((uint)(5)).w * r0.y;
  r4.xyz = BA_Fragment_90_CB1((uint)(5)).xyz * BA_Fragment_90_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r4.xyz + float3(1,1,1);
  r4.xyz = -BA_Fragment_90_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r1.zzz * r4.xyz + BA_Fragment_90_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_90_CB0((uint)(129)).xxx + v2.xyz;
  r2.y = saturate(r2.y);
  r1.z = r2.y * 0.399999976 + 0.300000012;
  r5.xyz = BA_Fragment_90_CB0((uint)(127)).xyz * r1.zzz;
  r2.xyz = r2.xxx * r5.xyz + r4.xyz;
  r2.xyz = r0.xxx * BA_Fragment_90_CB0((uint)(127)).xyz + r2.xyz;
  r0.xyz = r2.xyz * r0.yzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_90_CB0((uint)(19)).x).xyzw;
  r4.xyzw = BA_Fragment_90_CB1((uint)(7)).xyzw * r4.xyzw;
  r0.xyz = r0.xyz * r4.xyz + r3.xyz;
  r0.w = asfloat((uint)v6.x & 0x3f800000u);
  r2.xyz = BA_Fragment_90_CB1((uint)(0)).xyz * r4.xyz;
  o0.w = r4.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = v5.xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r0.www * r0.xyz + r1.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_90_CB1((uint)(12)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_90_CB1((uint)(11)).xyz + BA_Fragment_90_CB1((uint)(10)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_90_CB1((uint)(12)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_91_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  return value;
}

float4 BA_Fragment_91_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  uint v6 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_91_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_91_CB1((uint)(0)).x + r0.w;
  r0.xyzw = BA_Fragment_91_CB1((uint)(7)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.xyz = BA_Fragment_91_CB0((uint)(126)).xyz * BA_Fragment_91_CB1((uint)(1)).yyy + v4.xyz;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = max(1.17549435e-038, r1.w);
  r1.w = rsqrt(r1.w);
  r1.xyz = r1.xyz * r1.www;
  r2.xy = v6.xx ? float2(1,0) : float2(-1,1);
  r2.xzw = v3.xyz * r2.xxx;
  r1.x = saturate(dot(r2.xzw, r1.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_91_CB1((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_91_CB0((uint)(19)).x).xyzw;
  r1.y = -r3.y * 2 + 1;
  r1.x = saturate(r1.y * BA_Fragment_91_CB1((uint)(6)).x + r1.x);
  r1.z = -0.5 + r1.x;
  r1.z = saturate(10 * r1.z);
  r1.z = BA_Fragment_91_CB1((uint)(2)).z * r1.z;
  r1.w = 1 + -BA_Fragment_91_CB1((uint)(2)).z;
  r1.x = r1.w * r1.x + r1.z;
  r1.z = saturate(-r1.x * BA_Fragment_91_CB1((uint)(1)).w + 1);
  r3.y = dot(r2.xzw, BA_Fragment_91_CB0((uint)(126)).xyz);
  r2.x = dot(r2.xzw, v4.xyz);
  r2.z = r2.x * 0.769999981 + r3.y;
  r3.yw = r3.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r2.x = 1 + -r2.x;
  r2.z = r1.y * BA_Fragment_91_CB1((uint)(6)).x + r2.z;
  r2.z = -v5.w + r2.z;
  r2.z = saturate(-10 * r2.z);
  r2.w = r3.x * r2.z;
  r3.x = BA_Fragment_91_CB1((uint)(4)).w * r3.z;
  r4.xyz = BA_Fragment_91_CB1((uint)(4)).xyz * r3.xxx;
  r3.x = saturate(r2.x * BA_Fragment_91_CB1((uint)(2)).w + -BA_Fragment_91_CB1((uint)(3)).y);
  r3.x = v3.w * r3.x;
  r3.z = saturate(-r3.x * BA_Fragment_91_CB1((uint)(3)).x + 1);
  r3.x = BA_Fragment_91_CB1((uint)(3)).x * r3.x;
  r3.x = BA_Fragment_91_CB0((uint)(129)).x * r3.x;
  r2.w = r3.z * r2.w;
  r1.z = r2.w * r1.z;
  r2.w = saturate(r2.x);
  r2.x = r2.x * r2.x;
  r2.w = log2(r2.w);
  r2.w = BA_Fragment_91_CB1((uint)(2)).x * r2.w;
  r2.w = exp2(r2.w);
  r1.y = saturate(r1.y * BA_Fragment_91_CB1((uint)(6)).x + r2.w);
  r2.w = 4000 * r1.y;
  r2.w = min(1, r2.w);
  r2.w = BA_Fragment_91_CB1((uint)(2)).z * r2.w;
  r1.y = r1.w * r1.y + r2.w;
  r1.w = saturate(-r1.y * BA_Fragment_91_CB1((uint)(2)).y + 1);
  r1.y = BA_Fragment_91_CB1((uint)(2)).y * r1.y;
  r1.x = r1.x * BA_Fragment_91_CB1((uint)(1)).w + r1.y;
  r1.x = BA_Fragment_91_CB1((uint)(1)).x + r1.x;
  r1.y = r1.z * r1.w;
  r1.y = BA_Fragment_91_CB1((uint)(5)).w * r1.y;
  r5.xyz = BA_Fragment_91_CB1((uint)(5)).xyz * BA_Fragment_91_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.yzw = r1.yyy * r5.xyz + float3(1,1,1);
  r5.xyz = -BA_Fragment_91_CB0((uint)(127)).xyz + v5.xyz;
  r5.xyz = r2.zzz * r5.xyz + BA_Fragment_91_CB0((uint)(127)).xyz;
  r5.xyz = r5.xyz * BA_Fragment_91_CB0((uint)(129)).xxx + v2.xyz;
  r3.y = saturate(r3.y);
  r2.z = r3.y * 0.399999976 + 0.300000012;
  r6.xyz = BA_Fragment_91_CB0((uint)(127)).xyz * r2.zzz;
  r3.xyz = r3.xxx * r6.xyz + r5.xyz;
  r3.xyz = r1.xxx * BA_Fragment_91_CB0((uint)(127)).xyz + r3.xyz;
  r1.xyz = r3.xyz * r1.yzw;
  r1.xyz = r1.xyz * r0.xyz + r4.xyz;
  r1.w = asfloat((uint)v6.x & 0x3f800000u);
  r0.xyz = BA_Fragment_91_CB1((uint)(0)).yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = r0.xyz * r3.www;
  r0.xyz = v5.xyz * r0.xyz;
  r0.xyz = r2.yyy * r0.xyz;
  r0.xyz = r1.www * r1.xyz + r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_91_CB1((uint)(12)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_91_CB1((uint)(11)).xyz + BA_Fragment_91_CB1((uint)(10)).xyz;
  o0.xyz = r2.xxx * BA_Fragment_91_CB1((uint)(12)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_92_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_92_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v6.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_92_CB1((uint)(15)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_92_CB0((uint)(126)).xyz * BA_Fragment_92_CB1((uint)(1)).xxx + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xy = v7.xx ? float2(1,0) : float2(-1,1);
  r1.xzw = v3.xyz * r1.xxx;
  r0.x = saturate(dot(r1.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_92_CB1((uint)(1)).y * r0.x;
  r0.x = exp2(r0.x);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_92_CB0((uint)(19)).x).xyzw;
  r0.y = -r2.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_92_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_92_CB1((uint)(2)).y * r0.z;
  r0.w = 1 + -BA_Fragment_92_CB1((uint)(2)).y;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_92_CB1((uint)(1)).z + 1);
  r2.y = dot(r1.xzw, BA_Fragment_92_CB0((uint)(126)).xyz);
  r1.x = dot(r1.xzw, v4.xyz);
  r1.z = r1.x * 0.769999981 + r2.y;
  r2.yw = r2.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r1.x = 1 + -r1.x;
  r1.z = r0.y * BA_Fragment_92_CB1((uint)(6)).x + r1.z;
  r1.z = -v5.w + r1.z;
  r1.z = saturate(-10 * r1.z);
  r1.w = r2.x * r1.z;
  r2.x = BA_Fragment_92_CB1((uint)(4)).w * r2.z;
  r3.xyz = BA_Fragment_92_CB1((uint)(4)).xyz * r2.xxx;
  r2.x = saturate(r1.x * BA_Fragment_92_CB1((uint)(2)).z + -BA_Fragment_92_CB1((uint)(3)).x);
  r2.x = v3.w * r2.x;
  r2.z = saturate(-r2.x * BA_Fragment_92_CB1((uint)(2)).w + 1);
  r2.x = BA_Fragment_92_CB1((uint)(2)).w * r2.x;
  r2.x = BA_Fragment_92_CB0((uint)(129)).x * r2.x;
  r1.w = r2.z * r1.w;
  r0.z = r1.w * r0.z;
  r1.w = saturate(r1.x);
  r1.x = r1.x * r1.x;
  r1.w = log2(r1.w);
  r1.w = BA_Fragment_92_CB1((uint)(1)).w * r1.w;
  r1.w = exp2(r1.w);
  r0.y = saturate(r0.y * BA_Fragment_92_CB1((uint)(6)).x + r1.w);
  r1.w = 4000 * r0.y;
  r1.w = min(1, r1.w);
  r1.w = BA_Fragment_92_CB1((uint)(2)).y * r1.w;
  r0.y = r0.w * r0.y + r1.w;
  r0.w = saturate(-r0.y * BA_Fragment_92_CB1((uint)(2)).x + 1);
  r0.y = BA_Fragment_92_CB1((uint)(2)).x * r0.y;
  r0.x = r0.x * BA_Fragment_92_CB1((uint)(1)).z + r0.y;
  r0.x = BA_Fragment_92_CB1((uint)(0)).w + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_92_CB1((uint)(5)).w * r0.y;
  r4.xyz = BA_Fragment_92_CB1((uint)(5)).xyz * BA_Fragment_92_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r4.xyz + float3(1,1,1);
  r4.xyz = -BA_Fragment_92_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r1.zzz * r4.xyz + BA_Fragment_92_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_92_CB0((uint)(129)).xxx + v2.xyz;
  r2.y = saturate(r2.y);
  r1.z = r2.y * 0.399999976 + 0.300000012;
  r5.xyz = BA_Fragment_92_CB0((uint)(127)).xyz * r1.zzz;
  r2.xyz = r2.xxx * r5.xyz + r4.xyz;
  r2.xyz = r0.xxx * BA_Fragment_92_CB0((uint)(127)).xyz + r2.xyz;
  r0.xyz = r2.xyz * r0.yzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_92_CB0((uint)(19)).x).xyzw;
  r4.xyzw = BA_Fragment_92_CB1((uint)(7)).xyzw * r4.xyzw;
  r0.xyz = r0.xyz * r4.xyz + r3.xyz;
  r0.w = asfloat((uint)v7.x & 0x3f800000u);
  r2.xyz = BA_Fragment_92_CB1((uint)(0)).xyz * r4.xyz;
  o0.w = r4.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = v5.xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r0.www * r0.xyz + r1.yzw;
  r0.xyz = r0.xyz * BA_Fragment_92_CB1((uint)(13)).xyz + BA_Fragment_92_CB1((uint)(12)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_92_CB1((uint)(14)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_93_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_93_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v6.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_93_CB1((uint)(15)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_93_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_93_CB1((uint)(0)).x + r1.w;
  r1.xyzw = BA_Fragment_93_CB1((uint)(7)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_93_CB0((uint)(126)).xyz * BA_Fragment_93_CB1((uint)(1)).yyy + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.xy = v7.xx ? float2(1,0) : float2(-1,1);
  r2.xzw = v3.xyz * r2.xxx;
  r0.x = saturate(dot(r2.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_93_CB1((uint)(1)).z * r0.x;
  r0.x = exp2(r0.x);
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_93_CB0((uint)(19)).x).xyzw;
  r0.y = -r3.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_93_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_93_CB1((uint)(2)).z * r0.z;
  r0.w = 1 + -BA_Fragment_93_CB1((uint)(2)).z;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_93_CB1((uint)(1)).w + 1);
  r3.y = dot(r2.xzw, BA_Fragment_93_CB0((uint)(126)).xyz);
  r2.x = dot(r2.xzw, v4.xyz);
  r2.z = r2.x * 0.769999981 + r3.y;
  r3.yw = r3.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r2.x = 1 + -r2.x;
  r2.z = r0.y * BA_Fragment_93_CB1((uint)(6)).x + r2.z;
  r2.z = -v5.w + r2.z;
  r2.z = saturate(-10 * r2.z);
  r2.w = r3.x * r2.z;
  r3.x = BA_Fragment_93_CB1((uint)(4)).w * r3.z;
  r4.xyz = BA_Fragment_93_CB1((uint)(4)).xyz * r3.xxx;
  r3.x = saturate(r2.x * BA_Fragment_93_CB1((uint)(2)).w + -BA_Fragment_93_CB1((uint)(3)).y);
  r3.x = v3.w * r3.x;
  r3.z = saturate(-r3.x * BA_Fragment_93_CB1((uint)(3)).x + 1);
  r3.x = BA_Fragment_93_CB1((uint)(3)).x * r3.x;
  r3.x = BA_Fragment_93_CB0((uint)(129)).x * r3.x;
  r2.w = r3.z * r2.w;
  r0.z = r2.w * r0.z;
  r2.w = saturate(r2.x);
  r2.x = r2.x * r2.x;
  r2.w = log2(r2.w);
  r2.w = BA_Fragment_93_CB1((uint)(2)).x * r2.w;
  r2.w = exp2(r2.w);
  r0.y = saturate(r0.y * BA_Fragment_93_CB1((uint)(6)).x + r2.w);
  r2.w = 4000 * r0.y;
  r2.w = min(1, r2.w);
  r2.w = BA_Fragment_93_CB1((uint)(2)).z * r2.w;
  r0.y = r0.w * r0.y + r2.w;
  r0.w = saturate(-r0.y * BA_Fragment_93_CB1((uint)(2)).y + 1);
  r0.y = BA_Fragment_93_CB1((uint)(2)).y * r0.y;
  r0.x = r0.x * BA_Fragment_93_CB1((uint)(1)).w + r0.y;
  r0.x = BA_Fragment_93_CB1((uint)(1)).x + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_93_CB1((uint)(5)).w * r0.y;
  r5.xyz = BA_Fragment_93_CB1((uint)(5)).xyz * BA_Fragment_93_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r5.xyz + float3(1,1,1);
  r5.xyz = -BA_Fragment_93_CB0((uint)(127)).xyz + v5.xyz;
  r5.xyz = r2.zzz * r5.xyz + BA_Fragment_93_CB0((uint)(127)).xyz;
  r5.xyz = r5.xyz * BA_Fragment_93_CB0((uint)(129)).xxx + v2.xyz;
  r3.y = saturate(r3.y);
  r2.z = r3.y * 0.399999976 + 0.300000012;
  r6.xyz = BA_Fragment_93_CB0((uint)(127)).xyz * r2.zzz;
  r3.xyz = r3.xxx * r6.xyz + r5.xyz;
  r3.xyz = r0.xxx * BA_Fragment_93_CB0((uint)(127)).xyz + r3.xyz;
  r0.xyz = r3.xyz * r0.yzw;
  r0.xyz = r0.xyz * r1.xyz + r4.xyz;
  r0.w = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyz = BA_Fragment_93_CB1((uint)(0)).yzw * r1.xyz;
  o0.w = r1.w;
  r1.xyz = r1.xyz * r3.www;
  r1.xyz = v5.xyz * r1.xyz;
  r1.xyz = r2.yyy * r1.xyz;
  r0.xyz = r0.www * r0.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_93_CB1((uint)(13)).xyz + BA_Fragment_93_CB1((uint)(12)).xyz;
  o0.xyz = r2.xxx * BA_Fragment_93_CB1((uint)(14)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_94_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_94_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v6.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_94_CB1((uint)(15)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_94_CB0((uint)(126)).xyz * BA_Fragment_94_CB1((uint)(1)).xxx + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xy = v7.xx ? float2(1,0) : float2(-1,1);
  r1.xzw = v3.xyz * r1.xxx;
  r0.x = saturate(dot(r1.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_94_CB1((uint)(1)).y * r0.x;
  r0.x = exp2(r0.x);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_94_CB0((uint)(19)).x).xyzw;
  r0.y = -r2.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_94_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_94_CB1((uint)(2)).y * r0.z;
  r0.w = 1 + -BA_Fragment_94_CB1((uint)(2)).y;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_94_CB1((uint)(1)).z + 1);
  r2.y = dot(r1.xzw, BA_Fragment_94_CB0((uint)(126)).xyz);
  r1.x = dot(r1.xzw, v4.xyz);
  r1.z = r1.x * 0.769999981 + r2.y;
  r2.yw = r2.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r1.x = 1 + -r1.x;
  r1.z = r0.y * BA_Fragment_94_CB1((uint)(6)).x + r1.z;
  r1.z = -v5.w + r1.z;
  r1.z = saturate(-10 * r1.z);
  r1.w = r2.x * r1.z;
  r2.x = BA_Fragment_94_CB1((uint)(4)).w * r2.z;
  r3.xyz = BA_Fragment_94_CB1((uint)(4)).xyz * r2.xxx;
  r2.x = saturate(r1.x * BA_Fragment_94_CB1((uint)(2)).z + -BA_Fragment_94_CB1((uint)(3)).x);
  r2.x = v3.w * r2.x;
  r2.z = saturate(-r2.x * BA_Fragment_94_CB1((uint)(2)).w + 1);
  r2.x = BA_Fragment_94_CB1((uint)(2)).w * r2.x;
  r2.x = BA_Fragment_94_CB0((uint)(129)).x * r2.x;
  r1.w = r2.z * r1.w;
  r0.z = r1.w * r0.z;
  r1.w = saturate(r1.x);
  r1.x = r1.x * r1.x;
  r1.w = log2(r1.w);
  r1.w = BA_Fragment_94_CB1((uint)(1)).w * r1.w;
  r1.w = exp2(r1.w);
  r0.y = saturate(r0.y * BA_Fragment_94_CB1((uint)(6)).x + r1.w);
  r1.w = 4000 * r0.y;
  r1.w = min(1, r1.w);
  r1.w = BA_Fragment_94_CB1((uint)(2)).y * r1.w;
  r0.y = r0.w * r0.y + r1.w;
  r0.w = saturate(-r0.y * BA_Fragment_94_CB1((uint)(2)).x + 1);
  r0.y = BA_Fragment_94_CB1((uint)(2)).x * r0.y;
  r0.x = r0.x * BA_Fragment_94_CB1((uint)(1)).z + r0.y;
  r0.x = BA_Fragment_94_CB1((uint)(0)).w + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_94_CB1((uint)(5)).w * r0.y;
  r4.xyz = BA_Fragment_94_CB1((uint)(5)).xyz * BA_Fragment_94_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r4.xyz + float3(1,1,1);
  r4.xyz = -BA_Fragment_94_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r1.zzz * r4.xyz + BA_Fragment_94_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_94_CB0((uint)(129)).xxx + v2.xyz;
  r2.y = saturate(r2.y);
  r1.z = r2.y * 0.399999976 + 0.300000012;
  r5.xyz = BA_Fragment_94_CB0((uint)(127)).xyz * r1.zzz;
  r2.xyz = r2.xxx * r5.xyz + r4.xyz;
  r2.xyz = r0.xxx * BA_Fragment_94_CB0((uint)(127)).xyz + r2.xyz;
  r0.xyz = r2.xyz * r0.yzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_94_CB0((uint)(19)).x).xyzw;
  r4.xyzw = BA_Fragment_94_CB1((uint)(7)).xyzw * r4.xyzw;
  r0.xyz = r0.xyz * r4.xyz + r3.xyz;
  r0.w = asfloat((uint)v7.x & 0x3f800000u);
  r2.xyz = BA_Fragment_94_CB1((uint)(0)).xyz * r4.xyz;
  o0.w = r4.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = v5.xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r0.www * r0.xyz + r1.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_94_CB1((uint)(14)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_94_CB1((uint)(13)).xyz + BA_Fragment_94_CB1((uint)(12)).xyz;
  o0.xyz = r1.xxx * BA_Fragment_94_CB1((uint)(14)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_95_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_95_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v6.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_95_CB1((uint)(15)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_95_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_95_CB1((uint)(0)).x + r1.w;
  r1.xyzw = BA_Fragment_95_CB1((uint)(7)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_95_CB0((uint)(126)).xyz * BA_Fragment_95_CB1((uint)(1)).yyy + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.xy = v7.xx ? float2(1,0) : float2(-1,1);
  r2.xzw = v3.xyz * r2.xxx;
  r0.x = saturate(dot(r2.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_95_CB1((uint)(1)).z * r0.x;
  r0.x = exp2(r0.x);
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_95_CB0((uint)(19)).x).xyzw;
  r0.y = -r3.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_95_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_95_CB1((uint)(2)).z * r0.z;
  r0.w = 1 + -BA_Fragment_95_CB1((uint)(2)).z;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_95_CB1((uint)(1)).w + 1);
  r3.y = dot(r2.xzw, BA_Fragment_95_CB0((uint)(126)).xyz);
  r2.x = dot(r2.xzw, v4.xyz);
  r2.z = r2.x * 0.769999981 + r3.y;
  r3.yw = r3.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r2.x = 1 + -r2.x;
  r2.z = r0.y * BA_Fragment_95_CB1((uint)(6)).x + r2.z;
  r2.z = -v5.w + r2.z;
  r2.z = saturate(-10 * r2.z);
  r2.w = r3.x * r2.z;
  r3.x = BA_Fragment_95_CB1((uint)(4)).w * r3.z;
  r4.xyz = BA_Fragment_95_CB1((uint)(4)).xyz * r3.xxx;
  r3.x = saturate(r2.x * BA_Fragment_95_CB1((uint)(2)).w + -BA_Fragment_95_CB1((uint)(3)).y);
  r3.x = v3.w * r3.x;
  r3.z = saturate(-r3.x * BA_Fragment_95_CB1((uint)(3)).x + 1);
  r3.x = BA_Fragment_95_CB1((uint)(3)).x * r3.x;
  r3.x = BA_Fragment_95_CB0((uint)(129)).x * r3.x;
  r2.w = r3.z * r2.w;
  r0.z = r2.w * r0.z;
  r2.w = saturate(r2.x);
  r2.x = r2.x * r2.x;
  r2.w = log2(r2.w);
  r2.w = BA_Fragment_95_CB1((uint)(2)).x * r2.w;
  r2.w = exp2(r2.w);
  r0.y = saturate(r0.y * BA_Fragment_95_CB1((uint)(6)).x + r2.w);
  r2.w = 4000 * r0.y;
  r2.w = min(1, r2.w);
  r2.w = BA_Fragment_95_CB1((uint)(2)).z * r2.w;
  r0.y = r0.w * r0.y + r2.w;
  r0.w = saturate(-r0.y * BA_Fragment_95_CB1((uint)(2)).y + 1);
  r0.y = BA_Fragment_95_CB1((uint)(2)).y * r0.y;
  r0.x = r0.x * BA_Fragment_95_CB1((uint)(1)).w + r0.y;
  r0.x = BA_Fragment_95_CB1((uint)(1)).x + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_95_CB1((uint)(5)).w * r0.y;
  r5.xyz = BA_Fragment_95_CB1((uint)(5)).xyz * BA_Fragment_95_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r5.xyz + float3(1,1,1);
  r5.xyz = -BA_Fragment_95_CB0((uint)(127)).xyz + v5.xyz;
  r5.xyz = r2.zzz * r5.xyz + BA_Fragment_95_CB0((uint)(127)).xyz;
  r5.xyz = r5.xyz * BA_Fragment_95_CB0((uint)(129)).xxx + v2.xyz;
  r3.y = saturate(r3.y);
  r2.z = r3.y * 0.399999976 + 0.300000012;
  r6.xyz = BA_Fragment_95_CB0((uint)(127)).xyz * r2.zzz;
  r3.xyz = r3.xxx * r6.xyz + r5.xyz;
  r3.xyz = r0.xxx * BA_Fragment_95_CB0((uint)(127)).xyz + r3.xyz;
  r0.xyz = r3.xyz * r0.yzw;
  r0.xyz = r0.xyz * r1.xyz + r4.xyz;
  r0.w = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyz = BA_Fragment_95_CB1((uint)(0)).yzw * r1.xyz;
  o0.w = r1.w;
  r1.xyz = r1.xyz * r3.www;
  r1.xyz = v5.xyz * r1.xyz;
  r1.xyz = r2.yyy * r1.xyz;
  r0.xyz = r0.www * r0.xyz + r1.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_95_CB1((uint)(14)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_95_CB1((uint)(13)).xyz + BA_Fragment_95_CB1((uint)(12)).xyz;
  o0.xyz = r2.xxx * BA_Fragment_95_CB1((uint)(14)).xyz + r0.xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_96_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_96_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  uint v6 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_96_CB0((uint)(126)).xyz * BA_Fragment_96_CB1((uint)(1)).xxx + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xy = v6.xx ? float2(1,0) : float2(-1,1);
  r1.xzw = v3.xyz * r1.xxx;
  r0.x = saturate(dot(r1.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_96_CB1((uint)(1)).y * r0.x;
  r0.x = exp2(r0.x);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_96_CB0((uint)(19)).x).xyzw;
  r0.y = -r2.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_96_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_96_CB1((uint)(2)).y * r0.z;
  r0.w = 1 + -BA_Fragment_96_CB1((uint)(2)).y;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_96_CB1((uint)(1)).z + 1);
  r2.y = dot(r1.xzw, BA_Fragment_96_CB0((uint)(126)).xyz);
  r1.x = dot(r1.xzw, v4.xyz);
  r1.z = r1.x * 0.769999981 + r2.y;
  r2.yw = r2.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r1.x = 1 + -r1.x;
  r1.z = r0.y * BA_Fragment_96_CB1((uint)(6)).x + r1.z;
  r1.z = -v5.w + r1.z;
  r1.z = saturate(-10 * r1.z);
  r1.w = r2.x * r1.z;
  r2.x = BA_Fragment_96_CB1((uint)(4)).w * r2.z;
  r3.xyz = BA_Fragment_96_CB1((uint)(4)).xyz * r2.xxx;
  r2.x = saturate(r1.x * BA_Fragment_96_CB1((uint)(2)).z + -BA_Fragment_96_CB1((uint)(3)).x);
  r2.x = v3.w * r2.x;
  r2.z = saturate(-r2.x * BA_Fragment_96_CB1((uint)(2)).w + 1);
  r2.x = BA_Fragment_96_CB1((uint)(2)).w * r2.x;
  r2.x = BA_Fragment_96_CB0((uint)(129)).x * r2.x;
  r1.w = r2.z * r1.w;
  r0.z = r1.w * r0.z;
  r1.w = saturate(r1.x);
  r1.x = r1.x * r1.x;
  r1.w = log2(r1.w);
  r1.w = BA_Fragment_96_CB1((uint)(1)).w * r1.w;
  r1.w = exp2(r1.w);
  r0.y = saturate(r0.y * BA_Fragment_96_CB1((uint)(6)).x + r1.w);
  r1.w = 4000 * r0.y;
  r1.w = min(1, r1.w);
  r1.w = BA_Fragment_96_CB1((uint)(2)).y * r1.w;
  r0.y = r0.w * r0.y + r1.w;
  r0.w = saturate(-r0.y * BA_Fragment_96_CB1((uint)(2)).x + 1);
  r0.y = BA_Fragment_96_CB1((uint)(2)).x * r0.y;
  r0.x = r0.x * BA_Fragment_96_CB1((uint)(1)).z + r0.y;
  r0.x = BA_Fragment_96_CB1((uint)(0)).w + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_96_CB1((uint)(5)).w * r0.y;
  r4.xyz = BA_Fragment_96_CB1((uint)(5)).xyz * BA_Fragment_96_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r4.xyz + float3(1,1,1);
  r4.xyz = -BA_Fragment_96_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r1.zzz * r4.xyz + BA_Fragment_96_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_96_CB0((uint)(129)).xxx + v2.xyz;
  r2.y = saturate(r2.y);
  r1.z = r2.y * 0.399999976 + 0.300000012;
  r5.xyz = BA_Fragment_96_CB0((uint)(127)).xyz * r1.zzz;
  r2.xyz = r2.xxx * r5.xyz + r4.xyz;
  r2.xyz = r0.xxx * BA_Fragment_96_CB0((uint)(127)).xyz + r2.xyz;
  r0.xyz = r2.xyz * r0.yzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_96_CB0((uint)(19)).x).xyzw;
  r4.xyzw = BA_Fragment_96_CB1((uint)(7)).xyzw * r4.xyzw;
  r0.xyz = r0.xyz * r4.xyz + r3.xyz;
  r0.w = asfloat((uint)v6.x & 0x3f800000u);
  r2.xyz = BA_Fragment_96_CB1((uint)(0)).xyz * r4.xyz;
  o0.w = r4.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = v5.xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r0.www * r0.xyz + r1.yzw;
  r0.xyz = r0.xyz * BA_Fragment_96_CB1((uint)(11)).xyz + BA_Fragment_96_CB1((uint)(10)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_96_CB1((uint)(12)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_96_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_96_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_97_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_97_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  uint v6 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_97_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_97_CB1((uint)(0)).x + r0.w;
  r0.xyzw = BA_Fragment_97_CB1((uint)(7)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.xyz = BA_Fragment_97_CB0((uint)(126)).xyz * BA_Fragment_97_CB1((uint)(1)).yyy + v4.xyz;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = max(1.17549435e-038, r1.w);
  r1.w = rsqrt(r1.w);
  r1.xyz = r1.xyz * r1.www;
  r2.xy = v6.xx ? float2(1,0) : float2(-1,1);
  r2.xzw = v3.xyz * r2.xxx;
  r1.x = saturate(dot(r2.xzw, r1.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_97_CB1((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_97_CB0((uint)(19)).x).xyzw;
  r1.y = -r3.y * 2 + 1;
  r1.x = saturate(r1.y * BA_Fragment_97_CB1((uint)(6)).x + r1.x);
  r1.z = -0.5 + r1.x;
  r1.z = saturate(10 * r1.z);
  r1.z = BA_Fragment_97_CB1((uint)(2)).z * r1.z;
  r1.w = 1 + -BA_Fragment_97_CB1((uint)(2)).z;
  r1.x = r1.w * r1.x + r1.z;
  r1.z = saturate(-r1.x * BA_Fragment_97_CB1((uint)(1)).w + 1);
  r3.y = dot(r2.xzw, BA_Fragment_97_CB0((uint)(126)).xyz);
  r2.x = dot(r2.xzw, v4.xyz);
  r2.z = r2.x * 0.769999981 + r3.y;
  r3.yw = r3.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r2.x = 1 + -r2.x;
  r2.z = r1.y * BA_Fragment_97_CB1((uint)(6)).x + r2.z;
  r2.z = -v5.w + r2.z;
  r2.z = saturate(-10 * r2.z);
  r2.w = r3.x * r2.z;
  r3.x = BA_Fragment_97_CB1((uint)(4)).w * r3.z;
  r4.xyz = BA_Fragment_97_CB1((uint)(4)).xyz * r3.xxx;
  r3.x = saturate(r2.x * BA_Fragment_97_CB1((uint)(2)).w + -BA_Fragment_97_CB1((uint)(3)).y);
  r3.x = v3.w * r3.x;
  r3.z = saturate(-r3.x * BA_Fragment_97_CB1((uint)(3)).x + 1);
  r3.x = BA_Fragment_97_CB1((uint)(3)).x * r3.x;
  r3.x = BA_Fragment_97_CB0((uint)(129)).x * r3.x;
  r2.w = r3.z * r2.w;
  r1.z = r2.w * r1.z;
  r2.w = saturate(r2.x);
  r2.x = r2.x * r2.x;
  r2.w = log2(r2.w);
  r2.w = BA_Fragment_97_CB1((uint)(2)).x * r2.w;
  r2.w = exp2(r2.w);
  r1.y = saturate(r1.y * BA_Fragment_97_CB1((uint)(6)).x + r2.w);
  r2.w = 4000 * r1.y;
  r2.w = min(1, r2.w);
  r2.w = BA_Fragment_97_CB1((uint)(2)).z * r2.w;
  r1.y = r1.w * r1.y + r2.w;
  r1.w = saturate(-r1.y * BA_Fragment_97_CB1((uint)(2)).y + 1);
  r1.y = BA_Fragment_97_CB1((uint)(2)).y * r1.y;
  r1.x = r1.x * BA_Fragment_97_CB1((uint)(1)).w + r1.y;
  r1.x = BA_Fragment_97_CB1((uint)(1)).x + r1.x;
  r1.y = r1.z * r1.w;
  r1.y = BA_Fragment_97_CB1((uint)(5)).w * r1.y;
  r5.xyz = BA_Fragment_97_CB1((uint)(5)).xyz * BA_Fragment_97_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.yzw = r1.yyy * r5.xyz + float3(1,1,1);
  r5.xyz = -BA_Fragment_97_CB0((uint)(127)).xyz + v5.xyz;
  r5.xyz = r2.zzz * r5.xyz + BA_Fragment_97_CB0((uint)(127)).xyz;
  r5.xyz = r5.xyz * BA_Fragment_97_CB0((uint)(129)).xxx + v2.xyz;
  r3.y = saturate(r3.y);
  r2.z = r3.y * 0.399999976 + 0.300000012;
  r6.xyz = BA_Fragment_97_CB0((uint)(127)).xyz * r2.zzz;
  r3.xyz = r3.xxx * r6.xyz + r5.xyz;
  r3.xyz = r1.xxx * BA_Fragment_97_CB0((uint)(127)).xyz + r3.xyz;
  r1.xyz = r3.xyz * r1.yzw;
  r1.xyz = r1.xyz * r0.xyz + r4.xyz;
  r1.w = asfloat((uint)v6.x & 0x3f800000u);
  r0.xyz = BA_Fragment_97_CB1((uint)(0)).yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = r0.xyz * r3.www;
  r0.xyz = v5.xyz * r0.xyz;
  r0.xyz = r2.yyy * r0.xyz;
  r0.xyz = r1.www * r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_97_CB1((uint)(11)).xyz + BA_Fragment_97_CB1((uint)(10)).xyz;
  r0.xyz = r2.xxx * BA_Fragment_97_CB1((uint)(12)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_97_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_97_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_98_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  return value;
}

float4 BA_Fragment_98_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  uint v6 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_98_CB0((uint)(126)).xyz * BA_Fragment_98_CB1((uint)(1)).xxx + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xy = v6.xx ? float2(1,0) : float2(-1,1);
  r1.xzw = v3.xyz * r1.xxx;
  r0.x = saturate(dot(r1.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_98_CB1((uint)(1)).y * r0.x;
  r0.x = exp2(r0.x);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_98_CB0((uint)(19)).x).xyzw;
  r0.y = -r2.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_98_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_98_CB1((uint)(2)).y * r0.z;
  r0.w = 1 + -BA_Fragment_98_CB1((uint)(2)).y;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_98_CB1((uint)(1)).z + 1);
  r2.y = dot(r1.xzw, BA_Fragment_98_CB0((uint)(126)).xyz);
  r1.x = dot(r1.xzw, v4.xyz);
  r1.z = r1.x * 0.769999981 + r2.y;
  r2.yw = r2.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r1.x = 1 + -r1.x;
  r1.z = r0.y * BA_Fragment_98_CB1((uint)(6)).x + r1.z;
  r1.z = -v5.w + r1.z;
  r1.z = saturate(-10 * r1.z);
  r1.w = r2.x * r1.z;
  r2.x = BA_Fragment_98_CB1((uint)(4)).w * r2.z;
  r3.xyz = BA_Fragment_98_CB1((uint)(4)).xyz * r2.xxx;
  r2.x = saturate(r1.x * BA_Fragment_98_CB1((uint)(2)).z + -BA_Fragment_98_CB1((uint)(3)).x);
  r2.x = v3.w * r2.x;
  r2.z = saturate(-r2.x * BA_Fragment_98_CB1((uint)(2)).w + 1);
  r2.x = BA_Fragment_98_CB1((uint)(2)).w * r2.x;
  r2.x = BA_Fragment_98_CB0((uint)(129)).x * r2.x;
  r1.w = r2.z * r1.w;
  r0.z = r1.w * r0.z;
  r1.w = saturate(r1.x);
  r1.x = r1.x * r1.x;
  r1.w = log2(r1.w);
  r1.w = BA_Fragment_98_CB1((uint)(1)).w * r1.w;
  r1.w = exp2(r1.w);
  r0.y = saturate(r0.y * BA_Fragment_98_CB1((uint)(6)).x + r1.w);
  r1.w = 4000 * r0.y;
  r1.w = min(1, r1.w);
  r1.w = BA_Fragment_98_CB1((uint)(2)).y * r1.w;
  r0.y = r0.w * r0.y + r1.w;
  r0.w = saturate(-r0.y * BA_Fragment_98_CB1((uint)(2)).x + 1);
  r0.y = BA_Fragment_98_CB1((uint)(2)).x * r0.y;
  r0.x = r0.x * BA_Fragment_98_CB1((uint)(1)).z + r0.y;
  r0.x = BA_Fragment_98_CB1((uint)(0)).w + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_98_CB1((uint)(5)).w * r0.y;
  r4.xyz = BA_Fragment_98_CB1((uint)(5)).xyz * BA_Fragment_98_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r4.xyz + float3(1,1,1);
  r4.xyz = -BA_Fragment_98_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r1.zzz * r4.xyz + BA_Fragment_98_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_98_CB0((uint)(129)).xxx + v2.xyz;
  r2.y = saturate(r2.y);
  r1.z = r2.y * 0.399999976 + 0.300000012;
  r5.xyz = BA_Fragment_98_CB0((uint)(127)).xyz * r1.zzz;
  r2.xyz = r2.xxx * r5.xyz + r4.xyz;
  r2.xyz = r0.xxx * BA_Fragment_98_CB0((uint)(127)).xyz + r2.xyz;
  r0.xyz = r2.xyz * r0.yzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_98_CB0((uint)(19)).x).xyzw;
  r4.xyzw = BA_Fragment_98_CB1((uint)(7)).xyzw * r4.xyzw;
  r0.xyz = r0.xyz * r4.xyz + r3.xyz;
  r0.w = asfloat((uint)v6.x & 0x3f800000u);
  r2.xyz = BA_Fragment_98_CB1((uint)(0)).xyz * r4.xyz;
  o0.w = r4.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = v5.xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r0.www * r0.xyz + r1.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_98_CB1((uint)(12)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_98_CB1((uint)(11)).xyz + BA_Fragment_98_CB1((uint)(10)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_98_CB1((uint)(12)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_98_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_98_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_99_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  return value;
}

float4 BA_Fragment_99_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  uint v6 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_99_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_99_CB1((uint)(0)).x + r0.w;
  r0.xyzw = BA_Fragment_99_CB1((uint)(7)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.xyz = BA_Fragment_99_CB0((uint)(126)).xyz * BA_Fragment_99_CB1((uint)(1)).yyy + v4.xyz;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = max(1.17549435e-038, r1.w);
  r1.w = rsqrt(r1.w);
  r1.xyz = r1.xyz * r1.www;
  r2.xy = v6.xx ? float2(1,0) : float2(-1,1);
  r2.xzw = v3.xyz * r2.xxx;
  r1.x = saturate(dot(r2.xzw, r1.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_99_CB1((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_99_CB0((uint)(19)).x).xyzw;
  r1.y = -r3.y * 2 + 1;
  r1.x = saturate(r1.y * BA_Fragment_99_CB1((uint)(6)).x + r1.x);
  r1.z = -0.5 + r1.x;
  r1.z = saturate(10 * r1.z);
  r1.z = BA_Fragment_99_CB1((uint)(2)).z * r1.z;
  r1.w = 1 + -BA_Fragment_99_CB1((uint)(2)).z;
  r1.x = r1.w * r1.x + r1.z;
  r1.z = saturate(-r1.x * BA_Fragment_99_CB1((uint)(1)).w + 1);
  r3.y = dot(r2.xzw, BA_Fragment_99_CB0((uint)(126)).xyz);
  r2.x = dot(r2.xzw, v4.xyz);
  r2.z = r2.x * 0.769999981 + r3.y;
  r3.yw = r3.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r2.x = 1 + -r2.x;
  r2.z = r1.y * BA_Fragment_99_CB1((uint)(6)).x + r2.z;
  r2.z = -v5.w + r2.z;
  r2.z = saturate(-10 * r2.z);
  r2.w = r3.x * r2.z;
  r3.x = BA_Fragment_99_CB1((uint)(4)).w * r3.z;
  r4.xyz = BA_Fragment_99_CB1((uint)(4)).xyz * r3.xxx;
  r3.x = saturate(r2.x * BA_Fragment_99_CB1((uint)(2)).w + -BA_Fragment_99_CB1((uint)(3)).y);
  r3.x = v3.w * r3.x;
  r3.z = saturate(-r3.x * BA_Fragment_99_CB1((uint)(3)).x + 1);
  r3.x = BA_Fragment_99_CB1((uint)(3)).x * r3.x;
  r3.x = BA_Fragment_99_CB0((uint)(129)).x * r3.x;
  r2.w = r3.z * r2.w;
  r1.z = r2.w * r1.z;
  r2.w = saturate(r2.x);
  r2.x = r2.x * r2.x;
  r2.w = log2(r2.w);
  r2.w = BA_Fragment_99_CB1((uint)(2)).x * r2.w;
  r2.w = exp2(r2.w);
  r1.y = saturate(r1.y * BA_Fragment_99_CB1((uint)(6)).x + r2.w);
  r2.w = 4000 * r1.y;
  r2.w = min(1, r2.w);
  r2.w = BA_Fragment_99_CB1((uint)(2)).z * r2.w;
  r1.y = r1.w * r1.y + r2.w;
  r1.w = saturate(-r1.y * BA_Fragment_99_CB1((uint)(2)).y + 1);
  r1.y = BA_Fragment_99_CB1((uint)(2)).y * r1.y;
  r1.x = r1.x * BA_Fragment_99_CB1((uint)(1)).w + r1.y;
  r1.x = BA_Fragment_99_CB1((uint)(1)).x + r1.x;
  r1.y = r1.z * r1.w;
  r1.y = BA_Fragment_99_CB1((uint)(5)).w * r1.y;
  r5.xyz = BA_Fragment_99_CB1((uint)(5)).xyz * BA_Fragment_99_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.yzw = r1.yyy * r5.xyz + float3(1,1,1);
  r5.xyz = -BA_Fragment_99_CB0((uint)(127)).xyz + v5.xyz;
  r5.xyz = r2.zzz * r5.xyz + BA_Fragment_99_CB0((uint)(127)).xyz;
  r5.xyz = r5.xyz * BA_Fragment_99_CB0((uint)(129)).xxx + v2.xyz;
  r3.y = saturate(r3.y);
  r2.z = r3.y * 0.399999976 + 0.300000012;
  r6.xyz = BA_Fragment_99_CB0((uint)(127)).xyz * r2.zzz;
  r3.xyz = r3.xxx * r6.xyz + r5.xyz;
  r3.xyz = r1.xxx * BA_Fragment_99_CB0((uint)(127)).xyz + r3.xyz;
  r1.xyz = r3.xyz * r1.yzw;
  r1.xyz = r1.xyz * r0.xyz + r4.xyz;
  r1.w = asfloat((uint)v6.x & 0x3f800000u);
  r0.xyz = BA_Fragment_99_CB1((uint)(0)).yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = r0.xyz * r3.www;
  r0.xyz = v5.xyz * r0.xyz;
  r0.xyz = r2.yyy * r0.xyz;
  r0.xyz = r1.www * r1.xyz + r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_99_CB1((uint)(12)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_99_CB1((uint)(11)).xyz + BA_Fragment_99_CB1((uint)(10)).xyz;
  r0.xyz = r2.xxx * BA_Fragment_99_CB1((uint)(12)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_99_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_99_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_100_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_100_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v6.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_100_CB1((uint)(15)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_100_CB0((uint)(126)).xyz * BA_Fragment_100_CB1((uint)(1)).xxx + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xy = v7.xx ? float2(1,0) : float2(-1,1);
  r1.xzw = v3.xyz * r1.xxx;
  r0.x = saturate(dot(r1.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_100_CB1((uint)(1)).y * r0.x;
  r0.x = exp2(r0.x);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_100_CB0((uint)(19)).x).xyzw;
  r0.y = -r2.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_100_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_100_CB1((uint)(2)).y * r0.z;
  r0.w = 1 + -BA_Fragment_100_CB1((uint)(2)).y;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_100_CB1((uint)(1)).z + 1);
  r2.y = dot(r1.xzw, BA_Fragment_100_CB0((uint)(126)).xyz);
  r1.x = dot(r1.xzw, v4.xyz);
  r1.z = r1.x * 0.769999981 + r2.y;
  r2.yw = r2.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r1.x = 1 + -r1.x;
  r1.z = r0.y * BA_Fragment_100_CB1((uint)(6)).x + r1.z;
  r1.z = -v5.w + r1.z;
  r1.z = saturate(-10 * r1.z);
  r1.w = r2.x * r1.z;
  r2.x = BA_Fragment_100_CB1((uint)(4)).w * r2.z;
  r3.xyz = BA_Fragment_100_CB1((uint)(4)).xyz * r2.xxx;
  r2.x = saturate(r1.x * BA_Fragment_100_CB1((uint)(2)).z + -BA_Fragment_100_CB1((uint)(3)).x);
  r2.x = v3.w * r2.x;
  r2.z = saturate(-r2.x * BA_Fragment_100_CB1((uint)(2)).w + 1);
  r2.x = BA_Fragment_100_CB1((uint)(2)).w * r2.x;
  r2.x = BA_Fragment_100_CB0((uint)(129)).x * r2.x;
  r1.w = r2.z * r1.w;
  r0.z = r1.w * r0.z;
  r1.w = saturate(r1.x);
  r1.x = r1.x * r1.x;
  r1.w = log2(r1.w);
  r1.w = BA_Fragment_100_CB1((uint)(1)).w * r1.w;
  r1.w = exp2(r1.w);
  r0.y = saturate(r0.y * BA_Fragment_100_CB1((uint)(6)).x + r1.w);
  r1.w = 4000 * r0.y;
  r1.w = min(1, r1.w);
  r1.w = BA_Fragment_100_CB1((uint)(2)).y * r1.w;
  r0.y = r0.w * r0.y + r1.w;
  r0.w = saturate(-r0.y * BA_Fragment_100_CB1((uint)(2)).x + 1);
  r0.y = BA_Fragment_100_CB1((uint)(2)).x * r0.y;
  r0.x = r0.x * BA_Fragment_100_CB1((uint)(1)).z + r0.y;
  r0.x = BA_Fragment_100_CB1((uint)(0)).w + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_100_CB1((uint)(5)).w * r0.y;
  r4.xyz = BA_Fragment_100_CB1((uint)(5)).xyz * BA_Fragment_100_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r4.xyz + float3(1,1,1);
  r4.xyz = -BA_Fragment_100_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r1.zzz * r4.xyz + BA_Fragment_100_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_100_CB0((uint)(129)).xxx + v2.xyz;
  r2.y = saturate(r2.y);
  r1.z = r2.y * 0.399999976 + 0.300000012;
  r5.xyz = BA_Fragment_100_CB0((uint)(127)).xyz * r1.zzz;
  r2.xyz = r2.xxx * r5.xyz + r4.xyz;
  r2.xyz = r0.xxx * BA_Fragment_100_CB0((uint)(127)).xyz + r2.xyz;
  r0.xyz = r2.xyz * r0.yzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_100_CB0((uint)(19)).x).xyzw;
  r4.xyzw = BA_Fragment_100_CB1((uint)(7)).xyzw * r4.xyzw;
  r0.xyz = r0.xyz * r4.xyz + r3.xyz;
  r0.w = asfloat((uint)v7.x & 0x3f800000u);
  r2.xyz = BA_Fragment_100_CB1((uint)(0)).xyz * r4.xyz;
  o0.w = r4.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = v5.xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r0.www * r0.xyz + r1.yzw;
  r0.xyz = r0.xyz * BA_Fragment_100_CB1((uint)(13)).xyz + BA_Fragment_100_CB1((uint)(12)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_100_CB1((uint)(14)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_100_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_100_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_101_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_101_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v6.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_101_CB1((uint)(15)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_101_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_101_CB1((uint)(0)).x + r1.w;
  r1.xyzw = BA_Fragment_101_CB1((uint)(7)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_101_CB0((uint)(126)).xyz * BA_Fragment_101_CB1((uint)(1)).yyy + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.xy = v7.xx ? float2(1,0) : float2(-1,1);
  r2.xzw = v3.xyz * r2.xxx;
  r0.x = saturate(dot(r2.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_101_CB1((uint)(1)).z * r0.x;
  r0.x = exp2(r0.x);
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_101_CB0((uint)(19)).x).xyzw;
  r0.y = -r3.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_101_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_101_CB1((uint)(2)).z * r0.z;
  r0.w = 1 + -BA_Fragment_101_CB1((uint)(2)).z;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_101_CB1((uint)(1)).w + 1);
  r3.y = dot(r2.xzw, BA_Fragment_101_CB0((uint)(126)).xyz);
  r2.x = dot(r2.xzw, v4.xyz);
  r2.z = r2.x * 0.769999981 + r3.y;
  r3.yw = r3.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r2.x = 1 + -r2.x;
  r2.z = r0.y * BA_Fragment_101_CB1((uint)(6)).x + r2.z;
  r2.z = -v5.w + r2.z;
  r2.z = saturate(-10 * r2.z);
  r2.w = r3.x * r2.z;
  r3.x = BA_Fragment_101_CB1((uint)(4)).w * r3.z;
  r4.xyz = BA_Fragment_101_CB1((uint)(4)).xyz * r3.xxx;
  r3.x = saturate(r2.x * BA_Fragment_101_CB1((uint)(2)).w + -BA_Fragment_101_CB1((uint)(3)).y);
  r3.x = v3.w * r3.x;
  r3.z = saturate(-r3.x * BA_Fragment_101_CB1((uint)(3)).x + 1);
  r3.x = BA_Fragment_101_CB1((uint)(3)).x * r3.x;
  r3.x = BA_Fragment_101_CB0((uint)(129)).x * r3.x;
  r2.w = r3.z * r2.w;
  r0.z = r2.w * r0.z;
  r2.w = saturate(r2.x);
  r2.x = r2.x * r2.x;
  r2.w = log2(r2.w);
  r2.w = BA_Fragment_101_CB1((uint)(2)).x * r2.w;
  r2.w = exp2(r2.w);
  r0.y = saturate(r0.y * BA_Fragment_101_CB1((uint)(6)).x + r2.w);
  r2.w = 4000 * r0.y;
  r2.w = min(1, r2.w);
  r2.w = BA_Fragment_101_CB1((uint)(2)).z * r2.w;
  r0.y = r0.w * r0.y + r2.w;
  r0.w = saturate(-r0.y * BA_Fragment_101_CB1((uint)(2)).y + 1);
  r0.y = BA_Fragment_101_CB1((uint)(2)).y * r0.y;
  r0.x = r0.x * BA_Fragment_101_CB1((uint)(1)).w + r0.y;
  r0.x = BA_Fragment_101_CB1((uint)(1)).x + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_101_CB1((uint)(5)).w * r0.y;
  r5.xyz = BA_Fragment_101_CB1((uint)(5)).xyz * BA_Fragment_101_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r5.xyz + float3(1,1,1);
  r5.xyz = -BA_Fragment_101_CB0((uint)(127)).xyz + v5.xyz;
  r5.xyz = r2.zzz * r5.xyz + BA_Fragment_101_CB0((uint)(127)).xyz;
  r5.xyz = r5.xyz * BA_Fragment_101_CB0((uint)(129)).xxx + v2.xyz;
  r3.y = saturate(r3.y);
  r2.z = r3.y * 0.399999976 + 0.300000012;
  r6.xyz = BA_Fragment_101_CB0((uint)(127)).xyz * r2.zzz;
  r3.xyz = r3.xxx * r6.xyz + r5.xyz;
  r3.xyz = r0.xxx * BA_Fragment_101_CB0((uint)(127)).xyz + r3.xyz;
  r0.xyz = r3.xyz * r0.yzw;
  r0.xyz = r0.xyz * r1.xyz + r4.xyz;
  r0.w = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyz = BA_Fragment_101_CB1((uint)(0)).yzw * r1.xyz;
  o0.w = r1.w;
  r1.xyz = r1.xyz * r3.www;
  r1.xyz = v5.xyz * r1.xyz;
  r1.xyz = r2.yyy * r1.xyz;
  r0.xyz = r0.www * r0.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_101_CB1((uint)(13)).xyz + BA_Fragment_101_CB1((uint)(12)).xyz;
  r0.xyz = r2.xxx * BA_Fragment_101_CB1((uint)(14)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_101_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_101_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_102_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_102_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v6.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_102_CB1((uint)(15)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_102_CB0((uint)(126)).xyz * BA_Fragment_102_CB1((uint)(1)).xxx + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xy = v7.xx ? float2(1,0) : float2(-1,1);
  r1.xzw = v3.xyz * r1.xxx;
  r0.x = saturate(dot(r1.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_102_CB1((uint)(1)).y * r0.x;
  r0.x = exp2(r0.x);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_102_CB0((uint)(19)).x).xyzw;
  r0.y = -r2.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_102_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_102_CB1((uint)(2)).y * r0.z;
  r0.w = 1 + -BA_Fragment_102_CB1((uint)(2)).y;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_102_CB1((uint)(1)).z + 1);
  r2.y = dot(r1.xzw, BA_Fragment_102_CB0((uint)(126)).xyz);
  r1.x = dot(r1.xzw, v4.xyz);
  r1.z = r1.x * 0.769999981 + r2.y;
  r2.yw = r2.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r1.x = 1 + -r1.x;
  r1.z = r0.y * BA_Fragment_102_CB1((uint)(6)).x + r1.z;
  r1.z = -v5.w + r1.z;
  r1.z = saturate(-10 * r1.z);
  r1.w = r2.x * r1.z;
  r2.x = BA_Fragment_102_CB1((uint)(4)).w * r2.z;
  r3.xyz = BA_Fragment_102_CB1((uint)(4)).xyz * r2.xxx;
  r2.x = saturate(r1.x * BA_Fragment_102_CB1((uint)(2)).z + -BA_Fragment_102_CB1((uint)(3)).x);
  r2.x = v3.w * r2.x;
  r2.z = saturate(-r2.x * BA_Fragment_102_CB1((uint)(2)).w + 1);
  r2.x = BA_Fragment_102_CB1((uint)(2)).w * r2.x;
  r2.x = BA_Fragment_102_CB0((uint)(129)).x * r2.x;
  r1.w = r2.z * r1.w;
  r0.z = r1.w * r0.z;
  r1.w = saturate(r1.x);
  r1.x = r1.x * r1.x;
  r1.w = log2(r1.w);
  r1.w = BA_Fragment_102_CB1((uint)(1)).w * r1.w;
  r1.w = exp2(r1.w);
  r0.y = saturate(r0.y * BA_Fragment_102_CB1((uint)(6)).x + r1.w);
  r1.w = 4000 * r0.y;
  r1.w = min(1, r1.w);
  r1.w = BA_Fragment_102_CB1((uint)(2)).y * r1.w;
  r0.y = r0.w * r0.y + r1.w;
  r0.w = saturate(-r0.y * BA_Fragment_102_CB1((uint)(2)).x + 1);
  r0.y = BA_Fragment_102_CB1((uint)(2)).x * r0.y;
  r0.x = r0.x * BA_Fragment_102_CB1((uint)(1)).z + r0.y;
  r0.x = BA_Fragment_102_CB1((uint)(0)).w + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_102_CB1((uint)(5)).w * r0.y;
  r4.xyz = BA_Fragment_102_CB1((uint)(5)).xyz * BA_Fragment_102_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r4.xyz + float3(1,1,1);
  r4.xyz = -BA_Fragment_102_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r1.zzz * r4.xyz + BA_Fragment_102_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_102_CB0((uint)(129)).xxx + v2.xyz;
  r2.y = saturate(r2.y);
  r1.z = r2.y * 0.399999976 + 0.300000012;
  r5.xyz = BA_Fragment_102_CB0((uint)(127)).xyz * r1.zzz;
  r2.xyz = r2.xxx * r5.xyz + r4.xyz;
  r2.xyz = r0.xxx * BA_Fragment_102_CB0((uint)(127)).xyz + r2.xyz;
  r0.xyz = r2.xyz * r0.yzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_102_CB0((uint)(19)).x).xyzw;
  r4.xyzw = BA_Fragment_102_CB1((uint)(7)).xyzw * r4.xyzw;
  r0.xyz = r0.xyz * r4.xyz + r3.xyz;
  r0.w = asfloat((uint)v7.x & 0x3f800000u);
  r2.xyz = BA_Fragment_102_CB1((uint)(0)).xyz * r4.xyz;
  o0.w = r4.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = v5.xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r0.www * r0.xyz + r1.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_102_CB1((uint)(14)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_102_CB1((uint)(13)).xyz + BA_Fragment_102_CB1((uint)(12)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_102_CB1((uint)(14)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_102_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_102_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_103_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_103_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v6.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_103_CB1((uint)(15)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_103_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_103_CB1((uint)(0)).x + r1.w;
  r1.xyzw = BA_Fragment_103_CB1((uint)(7)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_103_CB0((uint)(126)).xyz * BA_Fragment_103_CB1((uint)(1)).yyy + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.xy = v7.xx ? float2(1,0) : float2(-1,1);
  r2.xzw = v3.xyz * r2.xxx;
  r0.x = saturate(dot(r2.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_103_CB1((uint)(1)).z * r0.x;
  r0.x = exp2(r0.x);
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_103_CB0((uint)(19)).x).xyzw;
  r0.y = -r3.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_103_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_103_CB1((uint)(2)).z * r0.z;
  r0.w = 1 + -BA_Fragment_103_CB1((uint)(2)).z;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_103_CB1((uint)(1)).w + 1);
  r3.y = dot(r2.xzw, BA_Fragment_103_CB0((uint)(126)).xyz);
  r2.x = dot(r2.xzw, v4.xyz);
  r2.z = r2.x * 0.769999981 + r3.y;
  r3.yw = r3.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r2.x = 1 + -r2.x;
  r2.z = r0.y * BA_Fragment_103_CB1((uint)(6)).x + r2.z;
  r2.z = -v5.w + r2.z;
  r2.z = saturate(-10 * r2.z);
  r2.w = r3.x * r2.z;
  r3.x = BA_Fragment_103_CB1((uint)(4)).w * r3.z;
  r4.xyz = BA_Fragment_103_CB1((uint)(4)).xyz * r3.xxx;
  r3.x = saturate(r2.x * BA_Fragment_103_CB1((uint)(2)).w + -BA_Fragment_103_CB1((uint)(3)).y);
  r3.x = v3.w * r3.x;
  r3.z = saturate(-r3.x * BA_Fragment_103_CB1((uint)(3)).x + 1);
  r3.x = BA_Fragment_103_CB1((uint)(3)).x * r3.x;
  r3.x = BA_Fragment_103_CB0((uint)(129)).x * r3.x;
  r2.w = r3.z * r2.w;
  r0.z = r2.w * r0.z;
  r2.w = saturate(r2.x);
  r2.x = r2.x * r2.x;
  r2.w = log2(r2.w);
  r2.w = BA_Fragment_103_CB1((uint)(2)).x * r2.w;
  r2.w = exp2(r2.w);
  r0.y = saturate(r0.y * BA_Fragment_103_CB1((uint)(6)).x + r2.w);
  r2.w = 4000 * r0.y;
  r2.w = min(1, r2.w);
  r2.w = BA_Fragment_103_CB1((uint)(2)).z * r2.w;
  r0.y = r0.w * r0.y + r2.w;
  r0.w = saturate(-r0.y * BA_Fragment_103_CB1((uint)(2)).y + 1);
  r0.y = BA_Fragment_103_CB1((uint)(2)).y * r0.y;
  r0.x = r0.x * BA_Fragment_103_CB1((uint)(1)).w + r0.y;
  r0.x = BA_Fragment_103_CB1((uint)(1)).x + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_103_CB1((uint)(5)).w * r0.y;
  r5.xyz = BA_Fragment_103_CB1((uint)(5)).xyz * BA_Fragment_103_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r5.xyz + float3(1,1,1);
  r5.xyz = -BA_Fragment_103_CB0((uint)(127)).xyz + v5.xyz;
  r5.xyz = r2.zzz * r5.xyz + BA_Fragment_103_CB0((uint)(127)).xyz;
  r5.xyz = r5.xyz * BA_Fragment_103_CB0((uint)(129)).xxx + v2.xyz;
  r3.y = saturate(r3.y);
  r2.z = r3.y * 0.399999976 + 0.300000012;
  r6.xyz = BA_Fragment_103_CB0((uint)(127)).xyz * r2.zzz;
  r3.xyz = r3.xxx * r6.xyz + r5.xyz;
  r3.xyz = r0.xxx * BA_Fragment_103_CB0((uint)(127)).xyz + r3.xyz;
  r0.xyz = r3.xyz * r0.yzw;
  r0.xyz = r0.xyz * r1.xyz + r4.xyz;
  r0.w = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyz = BA_Fragment_103_CB1((uint)(0)).yzw * r1.xyz;
  o0.w = r1.w;
  r1.xyz = r1.xyz * r3.www;
  r1.xyz = v5.xyz * r1.xyz;
  r1.xyz = r2.yyy * r1.xyz;
  r0.xyz = r0.www * r0.xyz + r1.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_103_CB1((uint)(14)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_103_CB1((uint)(13)).xyz + BA_Fragment_103_CB1((uint)(12)).xyz;
  r0.xyz = r2.xxx * BA_Fragment_103_CB1((uint)(14)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_103_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_103_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_104_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_104_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  uint v6 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_104_CB0((uint)(126)).xyz * BA_Fragment_104_CB1((uint)(1)).xxx + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xy = v6.xx ? float2(1,0) : float2(-1,1);
  r1.xzw = v3.xyz * r1.xxx;
  r0.x = saturate(dot(r1.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_104_CB1((uint)(1)).y * r0.x;
  r0.x = exp2(r0.x);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_104_CB0((uint)(19)).x).xyzw;
  r0.y = -r2.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_104_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_104_CB1((uint)(2)).y * r0.z;
  r0.w = 1 + -BA_Fragment_104_CB1((uint)(2)).y;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_104_CB1((uint)(1)).z + 1);
  r2.y = dot(r1.xzw, BA_Fragment_104_CB0((uint)(126)).xyz);
  r1.x = dot(r1.xzw, v4.xyz);
  r1.z = r1.x * 0.769999981 + r2.y;
  r2.yw = r2.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r1.x = 1 + -r1.x;
  r1.z = r0.y * BA_Fragment_104_CB1((uint)(6)).x + r1.z;
  r1.z = -v5.w + r1.z;
  r1.z = saturate(-10 * r1.z);
  r1.w = r2.x * r1.z;
  r2.x = BA_Fragment_104_CB1((uint)(4)).w * r2.z;
  r3.xyz = BA_Fragment_104_CB1((uint)(4)).xyz * r2.xxx;
  r2.x = saturate(r1.x * BA_Fragment_104_CB1((uint)(2)).z + -BA_Fragment_104_CB1((uint)(3)).x);
  r2.x = v3.w * r2.x;
  r2.z = saturate(-r2.x * BA_Fragment_104_CB1((uint)(2)).w + 1);
  r2.x = BA_Fragment_104_CB1((uint)(2)).w * r2.x;
  r2.x = BA_Fragment_104_CB0((uint)(129)).x * r2.x;
  r1.w = r2.z * r1.w;
  r0.z = r1.w * r0.z;
  r1.w = saturate(r1.x);
  r1.x = r1.x * r1.x;
  r1.w = log2(r1.w);
  r1.w = BA_Fragment_104_CB1((uint)(1)).w * r1.w;
  r1.w = exp2(r1.w);
  r0.y = saturate(r0.y * BA_Fragment_104_CB1((uint)(6)).x + r1.w);
  r1.w = 4000 * r0.y;
  r1.w = min(1, r1.w);
  r1.w = BA_Fragment_104_CB1((uint)(2)).y * r1.w;
  r0.y = r0.w * r0.y + r1.w;
  r0.w = saturate(-r0.y * BA_Fragment_104_CB1((uint)(2)).x + 1);
  r0.y = BA_Fragment_104_CB1((uint)(2)).x * r0.y;
  r0.x = r0.x * BA_Fragment_104_CB1((uint)(1)).z + r0.y;
  r0.x = BA_Fragment_104_CB1((uint)(0)).w + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_104_CB1((uint)(5)).w * r0.y;
  r4.xyz = BA_Fragment_104_CB1((uint)(5)).xyz * BA_Fragment_104_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r4.xyz + float3(1,1,1);
  r4.xyz = -BA_Fragment_104_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r1.zzz * r4.xyz + BA_Fragment_104_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_104_CB0((uint)(129)).xxx + v2.xyz;
  r2.y = saturate(r2.y);
  r1.z = r2.y * 0.399999976 + 0.300000012;
  r5.xyz = BA_Fragment_104_CB0((uint)(127)).xyz * r1.zzz;
  r2.xyz = r2.xxx * r5.xyz + r4.xyz;
  r2.xyz = r0.xxx * BA_Fragment_104_CB0((uint)(127)).xyz + r2.xyz;
  r0.xyz = r2.xyz * r0.yzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_104_CB0((uint)(19)).x).xyzw;
  r4.xyzw = BA_Fragment_104_CB1((uint)(7)).xyzw * r4.xyzw;
  r0.xyz = r0.xyz * r4.xyz + r3.xyz;
  r0.w = asfloat((uint)v6.x & 0x3f800000u);
  r2.xyz = BA_Fragment_104_CB1((uint)(0)).xyz * r4.xyz;
  o0.w = r4.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = v5.xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r0.www * r0.xyz + r1.yzw;
  r0.xyz = r0.xyz * BA_Fragment_104_CB1((uint)(11)).xyz + BA_Fragment_104_CB1((uint)(10)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_104_CB1((uint)(12)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_104_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_104_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_105_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  return value;
}

float4 BA_Fragment_105_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  uint v6 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_105_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_105_CB1((uint)(0)).x + r0.w;
  r0.xyzw = BA_Fragment_105_CB1((uint)(7)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.xyz = BA_Fragment_105_CB0((uint)(126)).xyz * BA_Fragment_105_CB1((uint)(1)).yyy + v4.xyz;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = max(1.17549435e-038, r1.w);
  r1.w = rsqrt(r1.w);
  r1.xyz = r1.xyz * r1.www;
  r2.xy = v6.xx ? float2(1,0) : float2(-1,1);
  r2.xzw = v3.xyz * r2.xxx;
  r1.x = saturate(dot(r2.xzw, r1.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_105_CB1((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_105_CB0((uint)(19)).x).xyzw;
  r1.y = -r3.y * 2 + 1;
  r1.x = saturate(r1.y * BA_Fragment_105_CB1((uint)(6)).x + r1.x);
  r1.z = -0.5 + r1.x;
  r1.z = saturate(10 * r1.z);
  r1.z = BA_Fragment_105_CB1((uint)(2)).z * r1.z;
  r1.w = 1 + -BA_Fragment_105_CB1((uint)(2)).z;
  r1.x = r1.w * r1.x + r1.z;
  r1.z = saturate(-r1.x * BA_Fragment_105_CB1((uint)(1)).w + 1);
  r3.y = dot(r2.xzw, BA_Fragment_105_CB0((uint)(126)).xyz);
  r2.x = dot(r2.xzw, v4.xyz);
  r2.z = r2.x * 0.769999981 + r3.y;
  r3.yw = r3.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r2.x = 1 + -r2.x;
  r2.z = r1.y * BA_Fragment_105_CB1((uint)(6)).x + r2.z;
  r2.z = -v5.w + r2.z;
  r2.z = saturate(-10 * r2.z);
  r2.w = r3.x * r2.z;
  r3.x = BA_Fragment_105_CB1((uint)(4)).w * r3.z;
  r4.xyz = BA_Fragment_105_CB1((uint)(4)).xyz * r3.xxx;
  r3.x = saturate(r2.x * BA_Fragment_105_CB1((uint)(2)).w + -BA_Fragment_105_CB1((uint)(3)).y);
  r3.x = v3.w * r3.x;
  r3.z = saturate(-r3.x * BA_Fragment_105_CB1((uint)(3)).x + 1);
  r3.x = BA_Fragment_105_CB1((uint)(3)).x * r3.x;
  r3.x = BA_Fragment_105_CB0((uint)(129)).x * r3.x;
  r2.w = r3.z * r2.w;
  r1.z = r2.w * r1.z;
  r2.w = saturate(r2.x);
  r2.x = r2.x * r2.x;
  r2.w = log2(r2.w);
  r2.w = BA_Fragment_105_CB1((uint)(2)).x * r2.w;
  r2.w = exp2(r2.w);
  r1.y = saturate(r1.y * BA_Fragment_105_CB1((uint)(6)).x + r2.w);
  r2.w = 4000 * r1.y;
  r2.w = min(1, r2.w);
  r2.w = BA_Fragment_105_CB1((uint)(2)).z * r2.w;
  r1.y = r1.w * r1.y + r2.w;
  r1.w = saturate(-r1.y * BA_Fragment_105_CB1((uint)(2)).y + 1);
  r1.y = BA_Fragment_105_CB1((uint)(2)).y * r1.y;
  r1.x = r1.x * BA_Fragment_105_CB1((uint)(1)).w + r1.y;
  r1.x = BA_Fragment_105_CB1((uint)(1)).x + r1.x;
  r1.y = r1.z * r1.w;
  r1.y = BA_Fragment_105_CB1((uint)(5)).w * r1.y;
  r5.xyz = BA_Fragment_105_CB1((uint)(5)).xyz * BA_Fragment_105_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.yzw = r1.yyy * r5.xyz + float3(1,1,1);
  r5.xyz = -BA_Fragment_105_CB0((uint)(127)).xyz + v5.xyz;
  r5.xyz = r2.zzz * r5.xyz + BA_Fragment_105_CB0((uint)(127)).xyz;
  r5.xyz = r5.xyz * BA_Fragment_105_CB0((uint)(129)).xxx + v2.xyz;
  r3.y = saturate(r3.y);
  r2.z = r3.y * 0.399999976 + 0.300000012;
  r6.xyz = BA_Fragment_105_CB0((uint)(127)).xyz * r2.zzz;
  r3.xyz = r3.xxx * r6.xyz + r5.xyz;
  r3.xyz = r1.xxx * BA_Fragment_105_CB0((uint)(127)).xyz + r3.xyz;
  r1.xyz = r3.xyz * r1.yzw;
  r1.xyz = r1.xyz * r0.xyz + r4.xyz;
  r1.w = asfloat((uint)v6.x & 0x3f800000u);
  r0.xyz = BA_Fragment_105_CB1((uint)(0)).yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = r0.xyz * r3.www;
  r0.xyz = v5.xyz * r0.xyz;
  r0.xyz = r2.yyy * r0.xyz;
  r0.xyz = r1.www * r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_105_CB1((uint)(11)).xyz + BA_Fragment_105_CB1((uint)(10)).xyz;
  r0.xyz = r2.xxx * BA_Fragment_105_CB1((uint)(12)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_105_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_105_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_106_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  return value;
}

float4 BA_Fragment_106_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  uint v6 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Fragment_106_CB0((uint)(126)).xyz * BA_Fragment_106_CB1((uint)(1)).xxx + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xy = v6.xx ? float2(1,0) : float2(-1,1);
  r1.xzw = v3.xyz * r1.xxx;
  r0.x = saturate(dot(r1.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_106_CB1((uint)(1)).y * r0.x;
  r0.x = exp2(r0.x);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_106_CB0((uint)(19)).x).xyzw;
  r0.y = -r2.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_106_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_106_CB1((uint)(2)).y * r0.z;
  r0.w = 1 + -BA_Fragment_106_CB1((uint)(2)).y;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_106_CB1((uint)(1)).z + 1);
  r2.y = dot(r1.xzw, BA_Fragment_106_CB0((uint)(126)).xyz);
  r1.x = dot(r1.xzw, v4.xyz);
  r1.z = r1.x * 0.769999981 + r2.y;
  r2.yw = r2.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r1.x = 1 + -r1.x;
  r1.z = r0.y * BA_Fragment_106_CB1((uint)(6)).x + r1.z;
  r1.z = -v5.w + r1.z;
  r1.z = saturate(-10 * r1.z);
  r1.w = r2.x * r1.z;
  r2.x = BA_Fragment_106_CB1((uint)(4)).w * r2.z;
  r3.xyz = BA_Fragment_106_CB1((uint)(4)).xyz * r2.xxx;
  r2.x = saturate(r1.x * BA_Fragment_106_CB1((uint)(2)).z + -BA_Fragment_106_CB1((uint)(3)).x);
  r2.x = v3.w * r2.x;
  r2.z = saturate(-r2.x * BA_Fragment_106_CB1((uint)(2)).w + 1);
  r2.x = BA_Fragment_106_CB1((uint)(2)).w * r2.x;
  r2.x = BA_Fragment_106_CB0((uint)(129)).x * r2.x;
  r1.w = r2.z * r1.w;
  r0.z = r1.w * r0.z;
  r1.w = saturate(r1.x);
  r1.x = r1.x * r1.x;
  r1.w = log2(r1.w);
  r1.w = BA_Fragment_106_CB1((uint)(1)).w * r1.w;
  r1.w = exp2(r1.w);
  r0.y = saturate(r0.y * BA_Fragment_106_CB1((uint)(6)).x + r1.w);
  r1.w = 4000 * r0.y;
  r1.w = min(1, r1.w);
  r1.w = BA_Fragment_106_CB1((uint)(2)).y * r1.w;
  r0.y = r0.w * r0.y + r1.w;
  r0.w = saturate(-r0.y * BA_Fragment_106_CB1((uint)(2)).x + 1);
  r0.y = BA_Fragment_106_CB1((uint)(2)).x * r0.y;
  r0.x = r0.x * BA_Fragment_106_CB1((uint)(1)).z + r0.y;
  r0.x = BA_Fragment_106_CB1((uint)(0)).w + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_106_CB1((uint)(5)).w * r0.y;
  r4.xyz = BA_Fragment_106_CB1((uint)(5)).xyz * BA_Fragment_106_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r4.xyz + float3(1,1,1);
  r4.xyz = -BA_Fragment_106_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r1.zzz * r4.xyz + BA_Fragment_106_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_106_CB0((uint)(129)).xxx + v2.xyz;
  r2.y = saturate(r2.y);
  r1.z = r2.y * 0.399999976 + 0.300000012;
  r5.xyz = BA_Fragment_106_CB0((uint)(127)).xyz * r1.zzz;
  r2.xyz = r2.xxx * r5.xyz + r4.xyz;
  r2.xyz = r0.xxx * BA_Fragment_106_CB0((uint)(127)).xyz + r2.xyz;
  r0.xyz = r2.xyz * r0.yzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_106_CB0((uint)(19)).x).xyzw;
  r4.xyzw = BA_Fragment_106_CB1((uint)(7)).xyzw * r4.xyzw;
  r0.xyz = r0.xyz * r4.xyz + r3.xyz;
  r0.w = asfloat((uint)v6.x & 0x3f800000u);
  r2.xyz = BA_Fragment_106_CB1((uint)(0)).xyz * r4.xyz;
  o0.w = r4.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = v5.xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r0.www * r0.xyz + r1.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_106_CB1((uint)(12)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_106_CB1((uint)(11)).xyz + BA_Fragment_106_CB1((uint)(10)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_106_CB1((uint)(12)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_106_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_106_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_107_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  return value;
}

float4 BA_Fragment_107_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  uint v6 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_107_CB0((uint)(19)).x).xyzw;
  r1.x = -BA_Fragment_107_CB1((uint)(0)).x + r0.w;
  r0.xyzw = BA_Fragment_107_CB1((uint)(7)).xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.xyz = BA_Fragment_107_CB0((uint)(126)).xyz * BA_Fragment_107_CB1((uint)(1)).yyy + v4.xyz;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = max(1.17549435e-038, r1.w);
  r1.w = rsqrt(r1.w);
  r1.xyz = r1.xyz * r1.www;
  r2.xy = v6.xx ? float2(1,0) : float2(-1,1);
  r2.xzw = v3.xyz * r2.xxx;
  r1.x = saturate(dot(r2.xzw, r1.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_107_CB1((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_107_CB0((uint)(19)).x).xyzw;
  r1.y = -r3.y * 2 + 1;
  r1.x = saturate(r1.y * BA_Fragment_107_CB1((uint)(6)).x + r1.x);
  r1.z = -0.5 + r1.x;
  r1.z = saturate(10 * r1.z);
  r1.z = BA_Fragment_107_CB1((uint)(2)).z * r1.z;
  r1.w = 1 + -BA_Fragment_107_CB1((uint)(2)).z;
  r1.x = r1.w * r1.x + r1.z;
  r1.z = saturate(-r1.x * BA_Fragment_107_CB1((uint)(1)).w + 1);
  r3.y = dot(r2.xzw, BA_Fragment_107_CB0((uint)(126)).xyz);
  r2.x = dot(r2.xzw, v4.xyz);
  r2.z = r2.x * 0.769999981 + r3.y;
  r3.yw = r3.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r2.x = 1 + -r2.x;
  r2.z = r1.y * BA_Fragment_107_CB1((uint)(6)).x + r2.z;
  r2.z = -v5.w + r2.z;
  r2.z = saturate(-10 * r2.z);
  r2.w = r3.x * r2.z;
  r3.x = BA_Fragment_107_CB1((uint)(4)).w * r3.z;
  r4.xyz = BA_Fragment_107_CB1((uint)(4)).xyz * r3.xxx;
  r3.x = saturate(r2.x * BA_Fragment_107_CB1((uint)(2)).w + -BA_Fragment_107_CB1((uint)(3)).y);
  r3.x = v3.w * r3.x;
  r3.z = saturate(-r3.x * BA_Fragment_107_CB1((uint)(3)).x + 1);
  r3.x = BA_Fragment_107_CB1((uint)(3)).x * r3.x;
  r3.x = BA_Fragment_107_CB0((uint)(129)).x * r3.x;
  r2.w = r3.z * r2.w;
  r1.z = r2.w * r1.z;
  r2.w = saturate(r2.x);
  r2.x = r2.x * r2.x;
  r2.w = log2(r2.w);
  r2.w = BA_Fragment_107_CB1((uint)(2)).x * r2.w;
  r2.w = exp2(r2.w);
  r1.y = saturate(r1.y * BA_Fragment_107_CB1((uint)(6)).x + r2.w);
  r2.w = 4000 * r1.y;
  r2.w = min(1, r2.w);
  r2.w = BA_Fragment_107_CB1((uint)(2)).z * r2.w;
  r1.y = r1.w * r1.y + r2.w;
  r1.w = saturate(-r1.y * BA_Fragment_107_CB1((uint)(2)).y + 1);
  r1.y = BA_Fragment_107_CB1((uint)(2)).y * r1.y;
  r1.x = r1.x * BA_Fragment_107_CB1((uint)(1)).w + r1.y;
  r1.x = BA_Fragment_107_CB1((uint)(1)).x + r1.x;
  r1.y = r1.z * r1.w;
  r1.y = BA_Fragment_107_CB1((uint)(5)).w * r1.y;
  r5.xyz = BA_Fragment_107_CB1((uint)(5)).xyz * BA_Fragment_107_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.yzw = r1.yyy * r5.xyz + float3(1,1,1);
  r5.xyz = -BA_Fragment_107_CB0((uint)(127)).xyz + v5.xyz;
  r5.xyz = r2.zzz * r5.xyz + BA_Fragment_107_CB0((uint)(127)).xyz;
  r5.xyz = r5.xyz * BA_Fragment_107_CB0((uint)(129)).xxx + v2.xyz;
  r3.y = saturate(r3.y);
  r2.z = r3.y * 0.399999976 + 0.300000012;
  r6.xyz = BA_Fragment_107_CB0((uint)(127)).xyz * r2.zzz;
  r3.xyz = r3.xxx * r6.xyz + r5.xyz;
  r3.xyz = r1.xxx * BA_Fragment_107_CB0((uint)(127)).xyz + r3.xyz;
  r1.xyz = r3.xyz * r1.yzw;
  r1.xyz = r1.xyz * r0.xyz + r4.xyz;
  r1.w = asfloat((uint)v6.x & 0x3f800000u);
  r0.xyz = BA_Fragment_107_CB1((uint)(0)).yzw * r0.xyz;
  o0.w = r0.w;
  r0.xyz = r0.xyz * r3.www;
  r0.xyz = v5.xyz * r0.xyz;
  r0.xyz = r2.yyy * r0.xyz;
  r0.xyz = r1.www * r1.xyz + r0.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_107_CB1((uint)(12)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_107_CB1((uint)(11)).xyz + BA_Fragment_107_CB1((uint)(10)).xyz;
  r0.xyz = r2.xxx * BA_Fragment_107_CB1((uint)(12)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_107_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_107_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_108_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_108_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v6.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_108_CB1((uint)(15)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_108_CB0((uint)(126)).xyz * BA_Fragment_108_CB1((uint)(1)).xxx + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xy = v7.xx ? float2(1,0) : float2(-1,1);
  r1.xzw = v3.xyz * r1.xxx;
  r0.x = saturate(dot(r1.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_108_CB1((uint)(1)).y * r0.x;
  r0.x = exp2(r0.x);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_108_CB0((uint)(19)).x).xyzw;
  r0.y = -r2.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_108_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_108_CB1((uint)(2)).y * r0.z;
  r0.w = 1 + -BA_Fragment_108_CB1((uint)(2)).y;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_108_CB1((uint)(1)).z + 1);
  r2.y = dot(r1.xzw, BA_Fragment_108_CB0((uint)(126)).xyz);
  r1.x = dot(r1.xzw, v4.xyz);
  r1.z = r1.x * 0.769999981 + r2.y;
  r2.yw = r2.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r1.x = 1 + -r1.x;
  r1.z = r0.y * BA_Fragment_108_CB1((uint)(6)).x + r1.z;
  r1.z = -v5.w + r1.z;
  r1.z = saturate(-10 * r1.z);
  r1.w = r2.x * r1.z;
  r2.x = BA_Fragment_108_CB1((uint)(4)).w * r2.z;
  r3.xyz = BA_Fragment_108_CB1((uint)(4)).xyz * r2.xxx;
  r2.x = saturate(r1.x * BA_Fragment_108_CB1((uint)(2)).z + -BA_Fragment_108_CB1((uint)(3)).x);
  r2.x = v3.w * r2.x;
  r2.z = saturate(-r2.x * BA_Fragment_108_CB1((uint)(2)).w + 1);
  r2.x = BA_Fragment_108_CB1((uint)(2)).w * r2.x;
  r2.x = BA_Fragment_108_CB0((uint)(129)).x * r2.x;
  r1.w = r2.z * r1.w;
  r0.z = r1.w * r0.z;
  r1.w = saturate(r1.x);
  r1.x = r1.x * r1.x;
  r1.w = log2(r1.w);
  r1.w = BA_Fragment_108_CB1((uint)(1)).w * r1.w;
  r1.w = exp2(r1.w);
  r0.y = saturate(r0.y * BA_Fragment_108_CB1((uint)(6)).x + r1.w);
  r1.w = 4000 * r0.y;
  r1.w = min(1, r1.w);
  r1.w = BA_Fragment_108_CB1((uint)(2)).y * r1.w;
  r0.y = r0.w * r0.y + r1.w;
  r0.w = saturate(-r0.y * BA_Fragment_108_CB1((uint)(2)).x + 1);
  r0.y = BA_Fragment_108_CB1((uint)(2)).x * r0.y;
  r0.x = r0.x * BA_Fragment_108_CB1((uint)(1)).z + r0.y;
  r0.x = BA_Fragment_108_CB1((uint)(0)).w + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_108_CB1((uint)(5)).w * r0.y;
  r4.xyz = BA_Fragment_108_CB1((uint)(5)).xyz * BA_Fragment_108_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r4.xyz + float3(1,1,1);
  r4.xyz = -BA_Fragment_108_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r1.zzz * r4.xyz + BA_Fragment_108_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_108_CB0((uint)(129)).xxx + v2.xyz;
  r2.y = saturate(r2.y);
  r1.z = r2.y * 0.399999976 + 0.300000012;
  r5.xyz = BA_Fragment_108_CB0((uint)(127)).xyz * r1.zzz;
  r2.xyz = r2.xxx * r5.xyz + r4.xyz;
  r2.xyz = r0.xxx * BA_Fragment_108_CB0((uint)(127)).xyz + r2.xyz;
  r0.xyz = r2.xyz * r0.yzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_108_CB0((uint)(19)).x).xyzw;
  r4.xyzw = BA_Fragment_108_CB1((uint)(7)).xyzw * r4.xyzw;
  r0.xyz = r0.xyz * r4.xyz + r3.xyz;
  r0.w = asfloat((uint)v7.x & 0x3f800000u);
  r2.xyz = BA_Fragment_108_CB1((uint)(0)).xyz * r4.xyz;
  o0.w = r4.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = v5.xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r0.www * r0.xyz + r1.yzw;
  r0.xyz = r0.xyz * BA_Fragment_108_CB1((uint)(13)).xyz + BA_Fragment_108_CB1((uint)(12)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_108_CB1((uint)(14)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_108_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_108_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_109_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_109_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v6.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_109_CB1((uint)(15)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_109_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_109_CB1((uint)(0)).x + r1.w;
  r1.xyzw = BA_Fragment_109_CB1((uint)(7)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_109_CB0((uint)(126)).xyz * BA_Fragment_109_CB1((uint)(1)).yyy + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.xy = v7.xx ? float2(1,0) : float2(-1,1);
  r2.xzw = v3.xyz * r2.xxx;
  r0.x = saturate(dot(r2.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_109_CB1((uint)(1)).z * r0.x;
  r0.x = exp2(r0.x);
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_109_CB0((uint)(19)).x).xyzw;
  r0.y = -r3.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_109_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_109_CB1((uint)(2)).z * r0.z;
  r0.w = 1 + -BA_Fragment_109_CB1((uint)(2)).z;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_109_CB1((uint)(1)).w + 1);
  r3.y = dot(r2.xzw, BA_Fragment_109_CB0((uint)(126)).xyz);
  r2.x = dot(r2.xzw, v4.xyz);
  r2.z = r2.x * 0.769999981 + r3.y;
  r3.yw = r3.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r2.x = 1 + -r2.x;
  r2.z = r0.y * BA_Fragment_109_CB1((uint)(6)).x + r2.z;
  r2.z = -v5.w + r2.z;
  r2.z = saturate(-10 * r2.z);
  r2.w = r3.x * r2.z;
  r3.x = BA_Fragment_109_CB1((uint)(4)).w * r3.z;
  r4.xyz = BA_Fragment_109_CB1((uint)(4)).xyz * r3.xxx;
  r3.x = saturate(r2.x * BA_Fragment_109_CB1((uint)(2)).w + -BA_Fragment_109_CB1((uint)(3)).y);
  r3.x = v3.w * r3.x;
  r3.z = saturate(-r3.x * BA_Fragment_109_CB1((uint)(3)).x + 1);
  r3.x = BA_Fragment_109_CB1((uint)(3)).x * r3.x;
  r3.x = BA_Fragment_109_CB0((uint)(129)).x * r3.x;
  r2.w = r3.z * r2.w;
  r0.z = r2.w * r0.z;
  r2.w = saturate(r2.x);
  r2.x = r2.x * r2.x;
  r2.w = log2(r2.w);
  r2.w = BA_Fragment_109_CB1((uint)(2)).x * r2.w;
  r2.w = exp2(r2.w);
  r0.y = saturate(r0.y * BA_Fragment_109_CB1((uint)(6)).x + r2.w);
  r2.w = 4000 * r0.y;
  r2.w = min(1, r2.w);
  r2.w = BA_Fragment_109_CB1((uint)(2)).z * r2.w;
  r0.y = r0.w * r0.y + r2.w;
  r0.w = saturate(-r0.y * BA_Fragment_109_CB1((uint)(2)).y + 1);
  r0.y = BA_Fragment_109_CB1((uint)(2)).y * r0.y;
  r0.x = r0.x * BA_Fragment_109_CB1((uint)(1)).w + r0.y;
  r0.x = BA_Fragment_109_CB1((uint)(1)).x + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_109_CB1((uint)(5)).w * r0.y;
  r5.xyz = BA_Fragment_109_CB1((uint)(5)).xyz * BA_Fragment_109_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r5.xyz + float3(1,1,1);
  r5.xyz = -BA_Fragment_109_CB0((uint)(127)).xyz + v5.xyz;
  r5.xyz = r2.zzz * r5.xyz + BA_Fragment_109_CB0((uint)(127)).xyz;
  r5.xyz = r5.xyz * BA_Fragment_109_CB0((uint)(129)).xxx + v2.xyz;
  r3.y = saturate(r3.y);
  r2.z = r3.y * 0.399999976 + 0.300000012;
  r6.xyz = BA_Fragment_109_CB0((uint)(127)).xyz * r2.zzz;
  r3.xyz = r3.xxx * r6.xyz + r5.xyz;
  r3.xyz = r0.xxx * BA_Fragment_109_CB0((uint)(127)).xyz + r3.xyz;
  r0.xyz = r3.xyz * r0.yzw;
  r0.xyz = r0.xyz * r1.xyz + r4.xyz;
  r0.w = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyz = BA_Fragment_109_CB1((uint)(0)).yzw * r1.xyz;
  o0.w = r1.w;
  r1.xyz = r1.xyz * r3.www;
  r1.xyz = v5.xyz * r1.xyz;
  r1.xyz = r2.yyy * r1.xyz;
  r0.xyz = r0.www * r0.xyz + r1.xyz;
  r0.xyz = r0.xyz * BA_Fragment_109_CB1((uint)(13)).xyz + BA_Fragment_109_CB1((uint)(12)).xyz;
  r0.xyz = r2.xxx * BA_Fragment_109_CB1((uint)(14)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_109_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_109_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_110_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_110_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v6.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_110_CB1((uint)(15)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_110_CB0((uint)(126)).xyz * BA_Fragment_110_CB1((uint)(1)).xxx + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xy = v7.xx ? float2(1,0) : float2(-1,1);
  r1.xzw = v3.xyz * r1.xxx;
  r0.x = saturate(dot(r1.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_110_CB1((uint)(1)).y * r0.x;
  r0.x = exp2(r0.x);
  r2.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_110_CB0((uint)(19)).x).xyzw;
  r0.y = -r2.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_110_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_110_CB1((uint)(2)).y * r0.z;
  r0.w = 1 + -BA_Fragment_110_CB1((uint)(2)).y;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_110_CB1((uint)(1)).z + 1);
  r2.y = dot(r1.xzw, BA_Fragment_110_CB0((uint)(126)).xyz);
  r1.x = dot(r1.xzw, v4.xyz);
  r1.z = r1.x * 0.769999981 + r2.y;
  r2.yw = r2.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r1.x = 1 + -r1.x;
  r1.z = r0.y * BA_Fragment_110_CB1((uint)(6)).x + r1.z;
  r1.z = -v5.w + r1.z;
  r1.z = saturate(-10 * r1.z);
  r1.w = r2.x * r1.z;
  r2.x = BA_Fragment_110_CB1((uint)(4)).w * r2.z;
  r3.xyz = BA_Fragment_110_CB1((uint)(4)).xyz * r2.xxx;
  r2.x = saturate(r1.x * BA_Fragment_110_CB1((uint)(2)).z + -BA_Fragment_110_CB1((uint)(3)).x);
  r2.x = v3.w * r2.x;
  r2.z = saturate(-r2.x * BA_Fragment_110_CB1((uint)(2)).w + 1);
  r2.x = BA_Fragment_110_CB1((uint)(2)).w * r2.x;
  r2.x = BA_Fragment_110_CB0((uint)(129)).x * r2.x;
  r1.w = r2.z * r1.w;
  r0.z = r1.w * r0.z;
  r1.w = saturate(r1.x);
  r1.x = r1.x * r1.x;
  r1.w = log2(r1.w);
  r1.w = BA_Fragment_110_CB1((uint)(1)).w * r1.w;
  r1.w = exp2(r1.w);
  r0.y = saturate(r0.y * BA_Fragment_110_CB1((uint)(6)).x + r1.w);
  r1.w = 4000 * r0.y;
  r1.w = min(1, r1.w);
  r1.w = BA_Fragment_110_CB1((uint)(2)).y * r1.w;
  r0.y = r0.w * r0.y + r1.w;
  r0.w = saturate(-r0.y * BA_Fragment_110_CB1((uint)(2)).x + 1);
  r0.y = BA_Fragment_110_CB1((uint)(2)).x * r0.y;
  r0.x = r0.x * BA_Fragment_110_CB1((uint)(1)).z + r0.y;
  r0.x = BA_Fragment_110_CB1((uint)(0)).w + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_110_CB1((uint)(5)).w * r0.y;
  r4.xyz = BA_Fragment_110_CB1((uint)(5)).xyz * BA_Fragment_110_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r4.xyz + float3(1,1,1);
  r4.xyz = -BA_Fragment_110_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r1.zzz * r4.xyz + BA_Fragment_110_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_110_CB0((uint)(129)).xxx + v2.xyz;
  r2.y = saturate(r2.y);
  r1.z = r2.y * 0.399999976 + 0.300000012;
  r5.xyz = BA_Fragment_110_CB0((uint)(127)).xyz * r1.zzz;
  r2.xyz = r2.xxx * r5.xyz + r4.xyz;
  r2.xyz = r0.xxx * BA_Fragment_110_CB0((uint)(127)).xyz + r2.xyz;
  r0.xyz = r2.xyz * r0.yzw;
  r4.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_110_CB0((uint)(19)).x).xyzw;
  r4.xyzw = BA_Fragment_110_CB1((uint)(7)).xyzw * r4.xyzw;
  r0.xyz = r0.xyz * r4.xyz + r3.xyz;
  r0.w = asfloat((uint)v7.x & 0x3f800000u);
  r2.xyz = BA_Fragment_110_CB1((uint)(0)).xyz * r4.xyz;
  o0.w = r4.w;
  r2.xyz = r2.xyz * r2.www;
  r2.xyz = v5.xyz * r2.xyz;
  r1.yzw = r2.xyz * r1.yyy;
  r0.xyz = r0.www * r0.xyz + r1.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_110_CB1((uint)(14)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_110_CB1((uint)(13)).xyz + BA_Fragment_110_CB1((uint)(12)).xyz;
  r0.xyz = r1.xxx * BA_Fragment_110_CB1((uint)(14)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_110_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_110_CB0((uint)(56)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_111_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 15u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value;
}

float4 BA_Fragment_111_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v6.w;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_111_CB1((uint)(15)).x * 0.00300000003 + abs(r0.x);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_111_CB0((uint)(19)).x).xyzw;
  r0.y = -BA_Fragment_111_CB1((uint)(0)).x + r1.w;
  r1.xyzw = BA_Fragment_111_CB1((uint)(7)).xyzw * r1.xyzw;
  r0.x = min(r0.x, r0.y);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_111_CB0((uint)(126)).xyz * BA_Fragment_111_CB1((uint)(1)).yyy + v4.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r2.xy = v7.xx ? float2(1,0) : float2(-1,1);
  r2.xzw = v3.xyz * r2.xxx;
  r0.x = saturate(dot(r2.xzw, r0.xyz));
  r0.x = log2(r0.x);
  r0.x = BA_Fragment_111_CB1((uint)(1)).z * r0.x;
  r0.x = exp2(r0.x);
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_111_CB0((uint)(19)).x).xyzw;
  r0.y = -r3.y * 2 + 1;
  r0.x = saturate(r0.y * BA_Fragment_111_CB1((uint)(6)).x + r0.x);
  r0.z = -0.5 + r0.x;
  r0.z = saturate(10 * r0.z);
  r0.z = BA_Fragment_111_CB1((uint)(2)).z * r0.z;
  r0.w = 1 + -BA_Fragment_111_CB1((uint)(2)).z;
  r0.x = r0.w * r0.x + r0.z;
  r0.z = saturate(-r0.x * BA_Fragment_111_CB1((uint)(1)).w + 1);
  r3.y = dot(r2.xzw, BA_Fragment_111_CB0((uint)(126)).xyz);
  r2.x = dot(r2.xzw, v4.xyz);
  r2.z = r2.x * 0.769999981 + r3.y;
  r3.yw = r3.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r2.x = 1 + -r2.x;
  r2.z = r0.y * BA_Fragment_111_CB1((uint)(6)).x + r2.z;
  r2.z = -v5.w + r2.z;
  r2.z = saturate(-10 * r2.z);
  r2.w = r3.x * r2.z;
  r3.x = BA_Fragment_111_CB1((uint)(4)).w * r3.z;
  r4.xyz = BA_Fragment_111_CB1((uint)(4)).xyz * r3.xxx;
  r3.x = saturate(r2.x * BA_Fragment_111_CB1((uint)(2)).w + -BA_Fragment_111_CB1((uint)(3)).y);
  r3.x = v3.w * r3.x;
  r3.z = saturate(-r3.x * BA_Fragment_111_CB1((uint)(3)).x + 1);
  r3.x = BA_Fragment_111_CB1((uint)(3)).x * r3.x;
  r3.x = BA_Fragment_111_CB0((uint)(129)).x * r3.x;
  r2.w = r3.z * r2.w;
  r0.z = r2.w * r0.z;
  r2.w = saturate(r2.x);
  r2.x = r2.x * r2.x;
  r2.w = log2(r2.w);
  r2.w = BA_Fragment_111_CB1((uint)(2)).x * r2.w;
  r2.w = exp2(r2.w);
  r0.y = saturate(r0.y * BA_Fragment_111_CB1((uint)(6)).x + r2.w);
  r2.w = 4000 * r0.y;
  r2.w = min(1, r2.w);
  r2.w = BA_Fragment_111_CB1((uint)(2)).z * r2.w;
  r0.y = r0.w * r0.y + r2.w;
  r0.w = saturate(-r0.y * BA_Fragment_111_CB1((uint)(2)).y + 1);
  r0.y = BA_Fragment_111_CB1((uint)(2)).y * r0.y;
  r0.x = r0.x * BA_Fragment_111_CB1((uint)(1)).w + r0.y;
  r0.x = BA_Fragment_111_CB1((uint)(1)).x + r0.x;
  r0.y = r0.z * r0.w;
  r0.y = BA_Fragment_111_CB1((uint)(5)).w * r0.y;
  r5.xyz = BA_Fragment_111_CB1((uint)(5)).xyz * BA_Fragment_111_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r0.yzw = r0.yyy * r5.xyz + float3(1,1,1);
  r5.xyz = -BA_Fragment_111_CB0((uint)(127)).xyz + v5.xyz;
  r5.xyz = r2.zzz * r5.xyz + BA_Fragment_111_CB0((uint)(127)).xyz;
  r5.xyz = r5.xyz * BA_Fragment_111_CB0((uint)(129)).xxx + v2.xyz;
  r3.y = saturate(r3.y);
  r2.z = r3.y * 0.399999976 + 0.300000012;
  r6.xyz = BA_Fragment_111_CB0((uint)(127)).xyz * r2.zzz;
  r3.xyz = r3.xxx * r6.xyz + r5.xyz;
  r3.xyz = r0.xxx * BA_Fragment_111_CB0((uint)(127)).xyz + r3.xyz;
  r0.xyz = r3.xyz * r0.yzw;
  r0.xyz = r0.xyz * r1.xyz + r4.xyz;
  r0.w = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyz = BA_Fragment_111_CB1((uint)(0)).yzw * r1.xyz;
  o0.w = r1.w;
  r1.xyz = r1.xyz * r3.www;
  r1.xyz = v5.xyz * r1.xyz;
  r1.xyz = r2.yyy * r1.xyz;
  r0.xyz = r0.www * r0.xyz + r1.xyz;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_111_CB1((uint)(14)).w * r0.x;
  r0.xyz = r0.xxx * BA_Fragment_111_CB1((uint)(13)).xyz + BA_Fragment_111_CB1((uint)(12)).xyz;
  r0.xyz = r2.xxx * BA_Fragment_111_CB1((uint)(14)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_111_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_111_CB0((uint)(56)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_112_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 13u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_112_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_112_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_112_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD8,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_112_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_112_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.yz = v7.xx ? float2(1,0) : float2(-1,1);
  r2.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_112_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r2.xyz, BA_Fragment_112_CB0((uint)(126)).xyz);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_112_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_112_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_112_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_112_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_112_CB2((uint)(11)).y, BA_Fragment_112_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_112_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v6.xyz * BA_Fragment_112_CB1((uint)(r5.w+0)).www + BA_Fragment_112_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_112_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_112_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_112_CB1((uint)(r5.w+512)).z + BA_Fragment_112_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_112_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r2.xyz);
    r6.x = r3.y * BA_Fragment_112_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_112_CB3((uint)(13)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_112_CB3((uint)(13)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_112_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r2.w * BA_Fragment_112_CB3((uint)(2)).z + -BA_Fragment_112_CB3((uint)(3)).x);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_112_CB3((uint)(2)).w * r0.y;
  r4.w = 1 + -BA_Fragment_112_CB3((uint)(2)).y;
  r6.xyz = BA_Fragment_112_CB0((uint)(126)).xyz * BA_Fragment_112_CB3((uint)(1)).xxx + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r2.x = saturate(dot(r2.xyz, r6.xyz));
  r2.x = log2(r2.x);
  r2.x = BA_Fragment_112_CB3((uint)(1)).y * r2.x;
  r2.x = exp2(r2.x);
  r2.x = saturate(r3.y * BA_Fragment_112_CB3((uint)(6)).x + r2.x);
  r2.y = -0.5 + r2.x;
  r2.y = saturate(10 * r2.y);
  r2.y = BA_Fragment_112_CB3((uint)(2)).y * r2.y;
  r2.x = r4.w * r2.x + r2.y;
  r2.y = saturate(r2.w);
  r2.y = log2(r2.y);
  r2.y = BA_Fragment_112_CB3((uint)(1)).w * r2.y;
  r2.y = exp2(r2.y);
  r2.y = saturate(r3.y * BA_Fragment_112_CB3((uint)(6)).x + r2.y);
  r2.z = 4000 * r2.y;
  r2.z = min(1, r2.z);
  r2.z = BA_Fragment_112_CB3((uint)(2)).y * r2.z;
  r2.y = r4.w * r2.y + r2.z;
  r2.z = BA_Fragment_112_CB3((uint)(2)).x * r2.y;
  r3.y = BA_Fragment_112_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_112_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_112_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r2.z = r2.x * BA_Fragment_112_CB3((uint)(1)).z + r2.z;
  r2.z = BA_Fragment_112_CB3((uint)(0)).w + r2.z;
  r3.yzw = r2.zzz * BA_Fragment_112_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_112_CB3((uint)(2)).w + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r2.x * BA_Fragment_112_CB3((uint)(1)).z + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r2.y * BA_Fragment_112_CB3((uint)(2)).x + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_112_CB3((uint)(5)).w * r0.y;
  r2.xyz = BA_Fragment_112_CB3((uint)(5)).xyz * BA_Fragment_112_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r2.xyz = r0.yyy * r2.xyz + float3(1,1,1);
  r2.xyz = r3.yzw * r2.xyz;
  r2.xyz = r2.xyz * r1.xyz + r6.xyz;
  r1.xyz = BA_Fragment_112_CB3((uint)(0)).xyz * r1.xyz;
  r1.xyz = r1.xyz * r5.yyy;
  r1.xyz = v5.xyz * r1.xyz;
  r0.yzw = r1.xyz * r0.zzz;
  r0.xyz = r0.xxx * r2.xyz + r0.yzw;
  r0.w = r2.w * r2.w;
  r0.xyz = r0.xyz * BA_Fragment_112_CB3((uint)(11)).xyz + BA_Fragment_112_CB3((uint)(10)).xyz;
  o0.xyz = r0.www * BA_Fragment_112_CB3((uint)(12)).xyz + r0.xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_113_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 13u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_113_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_113_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_113_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD8,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_113_CB0((uint)(19)).x).xyzw;
  r2.xyzw = BA_Fragment_113_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.y = -BA_Fragment_113_CB3((uint)(0)).x + r1.w;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v7.xx ? float2(1,0) : float2(-1,1);
  r1.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_113_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r1.xyz, BA_Fragment_113_CB0((uint)(126)).xyz);
  r0.w = dot(r1.xyz, v4.xyz);
  r1.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_113_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_113_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_113_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_113_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_113_CB2((uint)(11)).y, BA_Fragment_113_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_113_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v6.xyz * BA_Fragment_113_CB1((uint)(r5.w+0)).www + BA_Fragment_113_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_113_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_113_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_113_CB1((uint)(r5.w+512)).z + BA_Fragment_113_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_113_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r1.xyz);
    r6.x = r3.y * BA_Fragment_113_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_113_CB3((uint)(13)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_113_CB3((uint)(13)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_113_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r1.w * BA_Fragment_113_CB3((uint)(2)).w + -BA_Fragment_113_CB3((uint)(3)).y);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_113_CB3((uint)(3)).x * r0.y;
  r4.w = 1 + -BA_Fragment_113_CB3((uint)(2)).z;
  r6.xyz = BA_Fragment_113_CB0((uint)(126)).xyz * BA_Fragment_113_CB3((uint)(1)).yyy + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r1.x = saturate(dot(r1.xyz, r6.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_113_CB3((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = saturate(r3.y * BA_Fragment_113_CB3((uint)(6)).x + r1.x);
  r1.y = -0.5 + r1.x;
  r1.y = saturate(10 * r1.y);
  r1.y = BA_Fragment_113_CB3((uint)(2)).z * r1.y;
  r1.x = r4.w * r1.x + r1.y;
  r1.y = saturate(r1.w);
  r1.y = log2(r1.y);
  r1.y = BA_Fragment_113_CB3((uint)(2)).x * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(r3.y * BA_Fragment_113_CB3((uint)(6)).x + r1.y);
  r1.z = 4000 * r1.y;
  r1.z = min(1, r1.z);
  r1.z = BA_Fragment_113_CB3((uint)(2)).z * r1.z;
  r1.y = r4.w * r1.y + r1.z;
  r1.z = BA_Fragment_113_CB3((uint)(2)).y * r1.y;
  r3.y = BA_Fragment_113_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_113_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_113_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r1.z = r1.x * BA_Fragment_113_CB3((uint)(1)).w + r1.z;
  r1.z = BA_Fragment_113_CB3((uint)(1)).x + r1.z;
  r3.yzw = r1.zzz * BA_Fragment_113_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_113_CB3((uint)(3)).x + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r1.x * BA_Fragment_113_CB3((uint)(1)).w + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r1.y * BA_Fragment_113_CB3((uint)(2)).y + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_113_CB3((uint)(5)).w * r0.y;
  r1.xyz = BA_Fragment_113_CB3((uint)(5)).xyz * BA_Fragment_113_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.xyz = r0.yyy * r1.xyz + float3(1,1,1);
  r1.xyz = r3.yzw * r1.xyz;
  r1.xyz = r1.xyz * r2.xyz + r6.xyz;
  r2.xyz = BA_Fragment_113_CB3((uint)(0)).yzw * r2.xyz;
  r2.xyz = r2.xyz * r5.yyy;
  r2.xyz = v5.xyz * r2.xyz;
  r0.yzw = r2.xyz * r0.zzz;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.w = r1.w * r1.w;
  r0.xyz = r0.xyz * BA_Fragment_113_CB3((uint)(11)).xyz + BA_Fragment_113_CB3((uint)(10)).xyz;
  o0.xyz = r0.www * BA_Fragment_113_CB3((uint)(12)).xyz + r0.xyz;
  o0.w = r2.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_114_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 13u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_114_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_114_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_114_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD8,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_114_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_114_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.yz = v7.xx ? float2(1,0) : float2(-1,1);
  r2.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_114_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r2.xyz, BA_Fragment_114_CB0((uint)(126)).xyz);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_114_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_114_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_114_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_114_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_114_CB2((uint)(11)).y, BA_Fragment_114_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_114_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v6.xyz * BA_Fragment_114_CB1((uint)(r5.w+0)).www + BA_Fragment_114_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_114_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_114_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_114_CB1((uint)(r5.w+512)).z + BA_Fragment_114_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_114_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r2.xyz);
    r6.x = r3.y * BA_Fragment_114_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_114_CB3((uint)(13)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_114_CB3((uint)(13)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_114_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r2.w * BA_Fragment_114_CB3((uint)(2)).z + -BA_Fragment_114_CB3((uint)(3)).x);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_114_CB3((uint)(2)).w * r0.y;
  r4.w = 1 + -BA_Fragment_114_CB3((uint)(2)).y;
  r6.xyz = BA_Fragment_114_CB0((uint)(126)).xyz * BA_Fragment_114_CB3((uint)(1)).xxx + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r2.x = saturate(dot(r2.xyz, r6.xyz));
  r2.x = log2(r2.x);
  r2.x = BA_Fragment_114_CB3((uint)(1)).y * r2.x;
  r2.x = exp2(r2.x);
  r2.x = saturate(r3.y * BA_Fragment_114_CB3((uint)(6)).x + r2.x);
  r2.y = -0.5 + r2.x;
  r2.y = saturate(10 * r2.y);
  r2.y = BA_Fragment_114_CB3((uint)(2)).y * r2.y;
  r2.x = r4.w * r2.x + r2.y;
  r2.y = saturate(r2.w);
  r2.y = log2(r2.y);
  r2.y = BA_Fragment_114_CB3((uint)(1)).w * r2.y;
  r2.y = exp2(r2.y);
  r2.y = saturate(r3.y * BA_Fragment_114_CB3((uint)(6)).x + r2.y);
  r2.z = 4000 * r2.y;
  r2.z = min(1, r2.z);
  r2.z = BA_Fragment_114_CB3((uint)(2)).y * r2.z;
  r2.y = r4.w * r2.y + r2.z;
  r2.z = BA_Fragment_114_CB3((uint)(2)).x * r2.y;
  r3.y = BA_Fragment_114_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_114_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_114_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r2.z = r2.x * BA_Fragment_114_CB3((uint)(1)).z + r2.z;
  r2.z = BA_Fragment_114_CB3((uint)(0)).w + r2.z;
  r3.yzw = r2.zzz * BA_Fragment_114_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_114_CB3((uint)(2)).w + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r2.x * BA_Fragment_114_CB3((uint)(1)).z + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r2.y * BA_Fragment_114_CB3((uint)(2)).x + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_114_CB3((uint)(5)).w * r0.y;
  r2.xyz = BA_Fragment_114_CB3((uint)(5)).xyz * BA_Fragment_114_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r2.xyz = r0.yyy * r2.xyz + float3(1,1,1);
  r2.xyz = r3.yzw * r2.xyz;
  r2.xyz = r2.xyz * r1.xyz + r6.xyz;
  r1.xyz = BA_Fragment_114_CB3((uint)(0)).xyz * r1.xyz;
  r1.xyz = r1.xyz * r5.yyy;
  r1.xyz = v5.xyz * r1.xyz;
  r0.yzw = r1.xyz * r0.zzz;
  r0.xyz = r0.xxx * r2.xyz + r0.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_114_CB3((uint)(12)).w * r0.x;
  r0.y = r2.w * r2.w;
  r0.xzw = r0.xxx * BA_Fragment_114_CB3((uint)(11)).xyz + BA_Fragment_114_CB3((uint)(10)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_114_CB3((uint)(12)).xyz + r0.xzw;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_115_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 13u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_115_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_115_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_115_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD8,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_115_CB0((uint)(19)).x).xyzw;
  r2.xyzw = BA_Fragment_115_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.y = -BA_Fragment_115_CB3((uint)(0)).x + r1.w;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v7.xx ? float2(1,0) : float2(-1,1);
  r1.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_115_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r1.xyz, BA_Fragment_115_CB0((uint)(126)).xyz);
  r0.w = dot(r1.xyz, v4.xyz);
  r1.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_115_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_115_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_115_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_115_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_115_CB2((uint)(11)).y, BA_Fragment_115_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_115_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v6.xyz * BA_Fragment_115_CB1((uint)(r5.w+0)).www + BA_Fragment_115_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_115_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_115_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_115_CB1((uint)(r5.w+512)).z + BA_Fragment_115_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_115_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r1.xyz);
    r6.x = r3.y * BA_Fragment_115_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_115_CB3((uint)(13)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_115_CB3((uint)(13)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_115_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r1.w * BA_Fragment_115_CB3((uint)(2)).w + -BA_Fragment_115_CB3((uint)(3)).y);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_115_CB3((uint)(3)).x * r0.y;
  r4.w = 1 + -BA_Fragment_115_CB3((uint)(2)).z;
  r6.xyz = BA_Fragment_115_CB0((uint)(126)).xyz * BA_Fragment_115_CB3((uint)(1)).yyy + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r1.x = saturate(dot(r1.xyz, r6.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_115_CB3((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = saturate(r3.y * BA_Fragment_115_CB3((uint)(6)).x + r1.x);
  r1.y = -0.5 + r1.x;
  r1.y = saturate(10 * r1.y);
  r1.y = BA_Fragment_115_CB3((uint)(2)).z * r1.y;
  r1.x = r4.w * r1.x + r1.y;
  r1.y = saturate(r1.w);
  r1.y = log2(r1.y);
  r1.y = BA_Fragment_115_CB3((uint)(2)).x * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(r3.y * BA_Fragment_115_CB3((uint)(6)).x + r1.y);
  r1.z = 4000 * r1.y;
  r1.z = min(1, r1.z);
  r1.z = BA_Fragment_115_CB3((uint)(2)).z * r1.z;
  r1.y = r4.w * r1.y + r1.z;
  r1.z = BA_Fragment_115_CB3((uint)(2)).y * r1.y;
  r3.y = BA_Fragment_115_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_115_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_115_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r1.z = r1.x * BA_Fragment_115_CB3((uint)(1)).w + r1.z;
  r1.z = BA_Fragment_115_CB3((uint)(1)).x + r1.z;
  r3.yzw = r1.zzz * BA_Fragment_115_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_115_CB3((uint)(3)).x + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r1.x * BA_Fragment_115_CB3((uint)(1)).w + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r1.y * BA_Fragment_115_CB3((uint)(2)).y + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_115_CB3((uint)(5)).w * r0.y;
  r1.xyz = BA_Fragment_115_CB3((uint)(5)).xyz * BA_Fragment_115_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.xyz = r0.yyy * r1.xyz + float3(1,1,1);
  r1.xyz = r3.yzw * r1.xyz;
  r1.xyz = r1.xyz * r2.xyz + r6.xyz;
  r2.xyz = BA_Fragment_115_CB3((uint)(0)).yzw * r2.xyz;
  r2.xyz = r2.xyz * r5.yyy;
  r2.xyz = v5.xyz * r2.xyz;
  r0.yzw = r2.xyz * r0.zzz;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_115_CB3((uint)(12)).w * r0.x;
  r0.y = r1.w * r1.w;
  r0.xzw = r0.xxx * BA_Fragment_115_CB3((uint)(11)).xyz + BA_Fragment_115_CB3((uint)(10)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_115_CB3((uint)(12)).xyz + r0.xzw;
  o0.w = r2.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_116_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_116_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_116_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_116_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  float3 v7 : TEXCOORD8,
  uint v8 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v8.x & 0x3f800000u);
  r0.y = 333.333344 * v6.w;
  r0.z = cmp(r0.y >= -r0.y);
  r0.y = frac(abs(r0.y));
  r0.y = r0.z ? r0.y : -r0.y;
  r0.y = 0.00300000003 * r0.y;
  r0.y = -BA_Fragment_116_CB3((uint)(15)).x * 0.00300000003 + abs(r0.y);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_116_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_116_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v8.xx ? float2(1,0) : float2(-1,1);
  r2.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_116_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r2.xyz, BA_Fragment_116_CB0((uint)(126)).xyz);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_116_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_116_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_116_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_116_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_116_CB2((uint)(11)).y, BA_Fragment_116_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_116_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v7.xyz * BA_Fragment_116_CB1((uint)(r5.w+0)).www + BA_Fragment_116_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_116_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_116_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_116_CB1((uint)(r5.w+512)).z + BA_Fragment_116_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_116_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r2.xyz);
    r6.x = r3.y * BA_Fragment_116_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_116_CB3((uint)(15)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_116_CB3((uint)(15)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_116_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r2.w * BA_Fragment_116_CB3((uint)(2)).z + -BA_Fragment_116_CB3((uint)(3)).x);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_116_CB3((uint)(2)).w * r0.y;
  r4.w = 1 + -BA_Fragment_116_CB3((uint)(2)).y;
  r6.xyz = BA_Fragment_116_CB0((uint)(126)).xyz * BA_Fragment_116_CB3((uint)(1)).xxx + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r2.x = saturate(dot(r2.xyz, r6.xyz));
  r2.x = log2(r2.x);
  r2.x = BA_Fragment_116_CB3((uint)(1)).y * r2.x;
  r2.x = exp2(r2.x);
  r2.x = saturate(r3.y * BA_Fragment_116_CB3((uint)(6)).x + r2.x);
  r2.y = -0.5 + r2.x;
  r2.y = saturate(10 * r2.y);
  r2.y = BA_Fragment_116_CB3((uint)(2)).y * r2.y;
  r2.x = r4.w * r2.x + r2.y;
  r2.y = saturate(r2.w);
  r2.y = log2(r2.y);
  r2.y = BA_Fragment_116_CB3((uint)(1)).w * r2.y;
  r2.y = exp2(r2.y);
  r2.y = saturate(r3.y * BA_Fragment_116_CB3((uint)(6)).x + r2.y);
  r2.z = 4000 * r2.y;
  r2.z = min(1, r2.z);
  r2.z = BA_Fragment_116_CB3((uint)(2)).y * r2.z;
  r2.y = r4.w * r2.y + r2.z;
  r2.z = BA_Fragment_116_CB3((uint)(2)).x * r2.y;
  r3.y = BA_Fragment_116_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_116_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_116_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r2.z = r2.x * BA_Fragment_116_CB3((uint)(1)).z + r2.z;
  r2.z = BA_Fragment_116_CB3((uint)(0)).w + r2.z;
  r3.yzw = r2.zzz * BA_Fragment_116_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_116_CB3((uint)(2)).w + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r2.x * BA_Fragment_116_CB3((uint)(1)).z + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r2.y * BA_Fragment_116_CB3((uint)(2)).x + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_116_CB3((uint)(5)).w * r0.y;
  r2.xyz = BA_Fragment_116_CB3((uint)(5)).xyz * BA_Fragment_116_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r2.xyz = r0.yyy * r2.xyz + float3(1,1,1);
  r2.xyz = r3.yzw * r2.xyz;
  r2.xyz = r2.xyz * r1.xyz + r6.xyz;
  r1.xyz = BA_Fragment_116_CB3((uint)(0)).xyz * r1.xyz;
  r1.xyz = r1.xyz * r5.yyy;
  r1.xyz = v5.xyz * r1.xyz;
  r0.yzw = r1.xyz * r0.zzz;
  r0.xyz = r0.xxx * r2.xyz + r0.yzw;
  r0.w = r2.w * r2.w;
  r0.xyz = r0.xyz * BA_Fragment_116_CB3((uint)(13)).xyz + BA_Fragment_116_CB3((uint)(12)).xyz;
  o0.xyz = r0.www * BA_Fragment_116_CB3((uint)(14)).xyz + r0.xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_117_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_117_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_117_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_117_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  float3 v7 : TEXCOORD8,
  uint v8 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v8.x & 0x3f800000u);
  r0.y = 333.333344 * v6.w;
  r0.z = cmp(r0.y >= -r0.y);
  r0.y = frac(abs(r0.y));
  r0.y = r0.z ? r0.y : -r0.y;
  r0.y = 0.00300000003 * r0.y;
  r0.y = -BA_Fragment_117_CB3((uint)(15)).x * 0.00300000003 + abs(r0.y);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_117_CB0((uint)(19)).x).xyzw;
  r2.xyzw = BA_Fragment_117_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.z = -BA_Fragment_117_CB3((uint)(0)).x + r1.w;
  r0.y = min(r0.y, r0.z);
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v8.xx ? float2(1,0) : float2(-1,1);
  r1.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_117_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r1.xyz, BA_Fragment_117_CB0((uint)(126)).xyz);
  r0.w = dot(r1.xyz, v4.xyz);
  r1.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_117_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_117_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_117_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_117_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_117_CB2((uint)(11)).y, BA_Fragment_117_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_117_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v7.xyz * BA_Fragment_117_CB1((uint)(r5.w+0)).www + BA_Fragment_117_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_117_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_117_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_117_CB1((uint)(r5.w+512)).z + BA_Fragment_117_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_117_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r1.xyz);
    r6.x = r3.y * BA_Fragment_117_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_117_CB3((uint)(15)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_117_CB3((uint)(15)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_117_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r1.w * BA_Fragment_117_CB3((uint)(2)).w + -BA_Fragment_117_CB3((uint)(3)).y);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_117_CB3((uint)(3)).x * r0.y;
  r4.w = 1 + -BA_Fragment_117_CB3((uint)(2)).z;
  r6.xyz = BA_Fragment_117_CB0((uint)(126)).xyz * BA_Fragment_117_CB3((uint)(1)).yyy + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r1.x = saturate(dot(r1.xyz, r6.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_117_CB3((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = saturate(r3.y * BA_Fragment_117_CB3((uint)(6)).x + r1.x);
  r1.y = -0.5 + r1.x;
  r1.y = saturate(10 * r1.y);
  r1.y = BA_Fragment_117_CB3((uint)(2)).z * r1.y;
  r1.x = r4.w * r1.x + r1.y;
  r1.y = saturate(r1.w);
  r1.y = log2(r1.y);
  r1.y = BA_Fragment_117_CB3((uint)(2)).x * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(r3.y * BA_Fragment_117_CB3((uint)(6)).x + r1.y);
  r1.z = 4000 * r1.y;
  r1.z = min(1, r1.z);
  r1.z = BA_Fragment_117_CB3((uint)(2)).z * r1.z;
  r1.y = r4.w * r1.y + r1.z;
  r1.z = BA_Fragment_117_CB3((uint)(2)).y * r1.y;
  r3.y = BA_Fragment_117_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_117_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_117_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r1.z = r1.x * BA_Fragment_117_CB3((uint)(1)).w + r1.z;
  r1.z = BA_Fragment_117_CB3((uint)(1)).x + r1.z;
  r3.yzw = r1.zzz * BA_Fragment_117_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_117_CB3((uint)(3)).x + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r1.x * BA_Fragment_117_CB3((uint)(1)).w + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r1.y * BA_Fragment_117_CB3((uint)(2)).y + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_117_CB3((uint)(5)).w * r0.y;
  r1.xyz = BA_Fragment_117_CB3((uint)(5)).xyz * BA_Fragment_117_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.xyz = r0.yyy * r1.xyz + float3(1,1,1);
  r1.xyz = r3.yzw * r1.xyz;
  r1.xyz = r1.xyz * r2.xyz + r6.xyz;
  r2.xyz = BA_Fragment_117_CB3((uint)(0)).yzw * r2.xyz;
  r2.xyz = r2.xyz * r5.yyy;
  r2.xyz = v5.xyz * r2.xyz;
  r0.yzw = r2.xyz * r0.zzz;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.w = r1.w * r1.w;
  r0.xyz = r0.xyz * BA_Fragment_117_CB3((uint)(13)).xyz + BA_Fragment_117_CB3((uint)(12)).xyz;
  o0.xyz = r0.www * BA_Fragment_117_CB3((uint)(14)).xyz + r0.xyz;
  o0.w = r2.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_118_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 15u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_118_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_118_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_118_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  float3 v7 : TEXCOORD8,
  uint v8 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v8.x & 0x3f800000u);
  r0.y = 333.333344 * v6.w;
  r0.z = cmp(r0.y >= -r0.y);
  r0.y = frac(abs(r0.y));
  r0.y = r0.z ? r0.y : -r0.y;
  r0.y = 0.00300000003 * r0.y;
  r0.y = -BA_Fragment_118_CB3((uint)(15)).x * 0.00300000003 + abs(r0.y);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_118_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_118_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v8.xx ? float2(1,0) : float2(-1,1);
  r2.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_118_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r2.xyz, BA_Fragment_118_CB0((uint)(126)).xyz);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_118_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_118_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_118_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_118_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_118_CB2((uint)(11)).y, BA_Fragment_118_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_118_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v7.xyz * BA_Fragment_118_CB1((uint)(r5.w+0)).www + BA_Fragment_118_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_118_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_118_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_118_CB1((uint)(r5.w+512)).z + BA_Fragment_118_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_118_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r2.xyz);
    r6.x = r3.y * BA_Fragment_118_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_118_CB3((uint)(15)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_118_CB3((uint)(15)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_118_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r2.w * BA_Fragment_118_CB3((uint)(2)).z + -BA_Fragment_118_CB3((uint)(3)).x);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_118_CB3((uint)(2)).w * r0.y;
  r4.w = 1 + -BA_Fragment_118_CB3((uint)(2)).y;
  r6.xyz = BA_Fragment_118_CB0((uint)(126)).xyz * BA_Fragment_118_CB3((uint)(1)).xxx + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r2.x = saturate(dot(r2.xyz, r6.xyz));
  r2.x = log2(r2.x);
  r2.x = BA_Fragment_118_CB3((uint)(1)).y * r2.x;
  r2.x = exp2(r2.x);
  r2.x = saturate(r3.y * BA_Fragment_118_CB3((uint)(6)).x + r2.x);
  r2.y = -0.5 + r2.x;
  r2.y = saturate(10 * r2.y);
  r2.y = BA_Fragment_118_CB3((uint)(2)).y * r2.y;
  r2.x = r4.w * r2.x + r2.y;
  r2.y = saturate(r2.w);
  r2.y = log2(r2.y);
  r2.y = BA_Fragment_118_CB3((uint)(1)).w * r2.y;
  r2.y = exp2(r2.y);
  r2.y = saturate(r3.y * BA_Fragment_118_CB3((uint)(6)).x + r2.y);
  r2.z = 4000 * r2.y;
  r2.z = min(1, r2.z);
  r2.z = BA_Fragment_118_CB3((uint)(2)).y * r2.z;
  r2.y = r4.w * r2.y + r2.z;
  r2.z = BA_Fragment_118_CB3((uint)(2)).x * r2.y;
  r3.y = BA_Fragment_118_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_118_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_118_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r2.z = r2.x * BA_Fragment_118_CB3((uint)(1)).z + r2.z;
  r2.z = BA_Fragment_118_CB3((uint)(0)).w + r2.z;
  r3.yzw = r2.zzz * BA_Fragment_118_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_118_CB3((uint)(2)).w + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r2.x * BA_Fragment_118_CB3((uint)(1)).z + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r2.y * BA_Fragment_118_CB3((uint)(2)).x + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_118_CB3((uint)(5)).w * r0.y;
  r2.xyz = BA_Fragment_118_CB3((uint)(5)).xyz * BA_Fragment_118_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r2.xyz = r0.yyy * r2.xyz + float3(1,1,1);
  r2.xyz = r3.yzw * r2.xyz;
  r2.xyz = r2.xyz * r1.xyz + r6.xyz;
  r1.xyz = BA_Fragment_118_CB3((uint)(0)).xyz * r1.xyz;
  r1.xyz = r1.xyz * r5.yyy;
  r1.xyz = v5.xyz * r1.xyz;
  r0.yzw = r1.xyz * r0.zzz;
  r0.xyz = r0.xxx * r2.xyz + r0.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_118_CB3((uint)(14)).w * r0.x;
  r0.y = r2.w * r2.w;
  r0.xzw = r0.xxx * BA_Fragment_118_CB3((uint)(13)).xyz + BA_Fragment_118_CB3((uint)(12)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_118_CB3((uint)(14)).xyz + r0.xzw;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_119_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 15u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_119_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_119_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_119_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  float3 v7 : TEXCOORD8,
  uint v8 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v8.x & 0x3f800000u);
  r0.y = 333.333344 * v6.w;
  r0.z = cmp(r0.y >= -r0.y);
  r0.y = frac(abs(r0.y));
  r0.y = r0.z ? r0.y : -r0.y;
  r0.y = 0.00300000003 * r0.y;
  r0.y = -BA_Fragment_119_CB3((uint)(15)).x * 0.00300000003 + abs(r0.y);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_119_CB0((uint)(19)).x).xyzw;
  r2.xyzw = BA_Fragment_119_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.z = -BA_Fragment_119_CB3((uint)(0)).x + r1.w;
  r0.y = min(r0.y, r0.z);
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v8.xx ? float2(1,0) : float2(-1,1);
  r1.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_119_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r1.xyz, BA_Fragment_119_CB0((uint)(126)).xyz);
  r0.w = dot(r1.xyz, v4.xyz);
  r1.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_119_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_119_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_119_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_119_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_119_CB2((uint)(11)).y, BA_Fragment_119_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_119_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v7.xyz * BA_Fragment_119_CB1((uint)(r5.w+0)).www + BA_Fragment_119_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_119_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_119_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_119_CB1((uint)(r5.w+512)).z + BA_Fragment_119_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_119_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r1.xyz);
    r6.x = r3.y * BA_Fragment_119_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_119_CB3((uint)(15)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_119_CB3((uint)(15)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_119_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r1.w * BA_Fragment_119_CB3((uint)(2)).w + -BA_Fragment_119_CB3((uint)(3)).y);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_119_CB3((uint)(3)).x * r0.y;
  r4.w = 1 + -BA_Fragment_119_CB3((uint)(2)).z;
  r6.xyz = BA_Fragment_119_CB0((uint)(126)).xyz * BA_Fragment_119_CB3((uint)(1)).yyy + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r1.x = saturate(dot(r1.xyz, r6.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_119_CB3((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = saturate(r3.y * BA_Fragment_119_CB3((uint)(6)).x + r1.x);
  r1.y = -0.5 + r1.x;
  r1.y = saturate(10 * r1.y);
  r1.y = BA_Fragment_119_CB3((uint)(2)).z * r1.y;
  r1.x = r4.w * r1.x + r1.y;
  r1.y = saturate(r1.w);
  r1.y = log2(r1.y);
  r1.y = BA_Fragment_119_CB3((uint)(2)).x * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(r3.y * BA_Fragment_119_CB3((uint)(6)).x + r1.y);
  r1.z = 4000 * r1.y;
  r1.z = min(1, r1.z);
  r1.z = BA_Fragment_119_CB3((uint)(2)).z * r1.z;
  r1.y = r4.w * r1.y + r1.z;
  r1.z = BA_Fragment_119_CB3((uint)(2)).y * r1.y;
  r3.y = BA_Fragment_119_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_119_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_119_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r1.z = r1.x * BA_Fragment_119_CB3((uint)(1)).w + r1.z;
  r1.z = BA_Fragment_119_CB3((uint)(1)).x + r1.z;
  r3.yzw = r1.zzz * BA_Fragment_119_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_119_CB3((uint)(3)).x + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r1.x * BA_Fragment_119_CB3((uint)(1)).w + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r1.y * BA_Fragment_119_CB3((uint)(2)).y + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_119_CB3((uint)(5)).w * r0.y;
  r1.xyz = BA_Fragment_119_CB3((uint)(5)).xyz * BA_Fragment_119_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.xyz = r0.yyy * r1.xyz + float3(1,1,1);
  r1.xyz = r3.yzw * r1.xyz;
  r1.xyz = r1.xyz * r2.xyz + r6.xyz;
  r2.xyz = BA_Fragment_119_CB3((uint)(0)).yzw * r2.xyz;
  r2.xyz = r2.xyz * r5.yyy;
  r2.xyz = v5.xyz * r2.xyz;
  r0.yzw = r2.xyz * r0.zzz;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_119_CB3((uint)(14)).w * r0.x;
  r0.y = r1.w * r1.w;
  r0.xzw = r0.xxx * BA_Fragment_119_CB3((uint)(13)).xyz + BA_Fragment_119_CB3((uint)(12)).xyz;
  o0.xyz = r0.yyy * BA_Fragment_119_CB3((uint)(14)).xyz + r0.xzw;
  o0.w = r2.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_120_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 13u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_120_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_120_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_120_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD8,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_120_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_120_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.yz = v7.xx ? float2(1,0) : float2(-1,1);
  r2.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_120_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r2.xyz, BA_Fragment_120_CB0((uint)(126)).xyz);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_120_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_120_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_120_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_120_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_120_CB2((uint)(11)).y, BA_Fragment_120_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_120_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v6.xyz * BA_Fragment_120_CB1((uint)(r5.w+0)).www + BA_Fragment_120_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_120_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_120_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_120_CB1((uint)(r5.w+512)).z + BA_Fragment_120_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_120_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r2.xyz);
    r6.x = r3.y * BA_Fragment_120_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_120_CB3((uint)(13)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_120_CB3((uint)(13)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_120_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r2.w * BA_Fragment_120_CB3((uint)(2)).z + -BA_Fragment_120_CB3((uint)(3)).x);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_120_CB3((uint)(2)).w * r0.y;
  r4.w = 1 + -BA_Fragment_120_CB3((uint)(2)).y;
  r6.xyz = BA_Fragment_120_CB0((uint)(126)).xyz * BA_Fragment_120_CB3((uint)(1)).xxx + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r2.x = saturate(dot(r2.xyz, r6.xyz));
  r2.x = log2(r2.x);
  r2.x = BA_Fragment_120_CB3((uint)(1)).y * r2.x;
  r2.x = exp2(r2.x);
  r2.x = saturate(r3.y * BA_Fragment_120_CB3((uint)(6)).x + r2.x);
  r2.y = -0.5 + r2.x;
  r2.y = saturate(10 * r2.y);
  r2.y = BA_Fragment_120_CB3((uint)(2)).y * r2.y;
  r2.x = r4.w * r2.x + r2.y;
  r2.y = saturate(r2.w);
  r2.y = log2(r2.y);
  r2.y = BA_Fragment_120_CB3((uint)(1)).w * r2.y;
  r2.y = exp2(r2.y);
  r2.y = saturate(r3.y * BA_Fragment_120_CB3((uint)(6)).x + r2.y);
  r2.z = 4000 * r2.y;
  r2.z = min(1, r2.z);
  r2.z = BA_Fragment_120_CB3((uint)(2)).y * r2.z;
  r2.y = r4.w * r2.y + r2.z;
  r2.z = BA_Fragment_120_CB3((uint)(2)).x * r2.y;
  r3.y = BA_Fragment_120_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_120_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_120_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r2.z = r2.x * BA_Fragment_120_CB3((uint)(1)).z + r2.z;
  r2.z = BA_Fragment_120_CB3((uint)(0)).w + r2.z;
  r3.yzw = r2.zzz * BA_Fragment_120_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_120_CB3((uint)(2)).w + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r2.x * BA_Fragment_120_CB3((uint)(1)).z + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r2.y * BA_Fragment_120_CB3((uint)(2)).x + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_120_CB3((uint)(5)).w * r0.y;
  r2.xyz = BA_Fragment_120_CB3((uint)(5)).xyz * BA_Fragment_120_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r2.xyz = r0.yyy * r2.xyz + float3(1,1,1);
  r2.xyz = r3.yzw * r2.xyz;
  r2.xyz = r2.xyz * r1.xyz + r6.xyz;
  r1.xyz = BA_Fragment_120_CB3((uint)(0)).xyz * r1.xyz;
  r1.xyz = r1.xyz * r5.yyy;
  r1.xyz = v5.xyz * r1.xyz;
  r0.yzw = r1.xyz * r0.zzz;
  r0.xyz = r0.xxx * r2.xyz + r0.yzw;
  r0.w = r2.w * r2.w;
  r0.xyz = r0.xyz * BA_Fragment_120_CB3((uint)(11)).xyz + BA_Fragment_120_CB3((uint)(10)).xyz;
  r0.xyz = r0.www * BA_Fragment_120_CB3((uint)(12)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_120_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_120_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_121_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 13u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_121_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_121_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_121_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD8,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_121_CB0((uint)(19)).x).xyzw;
  r2.xyzw = BA_Fragment_121_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.y = -BA_Fragment_121_CB3((uint)(0)).x + r1.w;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v7.xx ? float2(1,0) : float2(-1,1);
  r1.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_121_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r1.xyz, BA_Fragment_121_CB0((uint)(126)).xyz);
  r0.w = dot(r1.xyz, v4.xyz);
  r1.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_121_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_121_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_121_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_121_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_121_CB2((uint)(11)).y, BA_Fragment_121_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_121_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v6.xyz * BA_Fragment_121_CB1((uint)(r5.w+0)).www + BA_Fragment_121_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_121_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_121_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_121_CB1((uint)(r5.w+512)).z + BA_Fragment_121_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_121_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r1.xyz);
    r6.x = r3.y * BA_Fragment_121_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_121_CB3((uint)(13)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_121_CB3((uint)(13)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_121_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r1.w * BA_Fragment_121_CB3((uint)(2)).w + -BA_Fragment_121_CB3((uint)(3)).y);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_121_CB3((uint)(3)).x * r0.y;
  r4.w = 1 + -BA_Fragment_121_CB3((uint)(2)).z;
  r6.xyz = BA_Fragment_121_CB0((uint)(126)).xyz * BA_Fragment_121_CB3((uint)(1)).yyy + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r1.x = saturate(dot(r1.xyz, r6.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_121_CB3((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = saturate(r3.y * BA_Fragment_121_CB3((uint)(6)).x + r1.x);
  r1.y = -0.5 + r1.x;
  r1.y = saturate(10 * r1.y);
  r1.y = BA_Fragment_121_CB3((uint)(2)).z * r1.y;
  r1.x = r4.w * r1.x + r1.y;
  r1.y = saturate(r1.w);
  r1.y = log2(r1.y);
  r1.y = BA_Fragment_121_CB3((uint)(2)).x * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(r3.y * BA_Fragment_121_CB3((uint)(6)).x + r1.y);
  r1.z = 4000 * r1.y;
  r1.z = min(1, r1.z);
  r1.z = BA_Fragment_121_CB3((uint)(2)).z * r1.z;
  r1.y = r4.w * r1.y + r1.z;
  r1.z = BA_Fragment_121_CB3((uint)(2)).y * r1.y;
  r3.y = BA_Fragment_121_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_121_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_121_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r1.z = r1.x * BA_Fragment_121_CB3((uint)(1)).w + r1.z;
  r1.z = BA_Fragment_121_CB3((uint)(1)).x + r1.z;
  r3.yzw = r1.zzz * BA_Fragment_121_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_121_CB3((uint)(3)).x + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r1.x * BA_Fragment_121_CB3((uint)(1)).w + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r1.y * BA_Fragment_121_CB3((uint)(2)).y + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_121_CB3((uint)(5)).w * r0.y;
  r1.xyz = BA_Fragment_121_CB3((uint)(5)).xyz * BA_Fragment_121_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.xyz = r0.yyy * r1.xyz + float3(1,1,1);
  r1.xyz = r3.yzw * r1.xyz;
  r1.xyz = r1.xyz * r2.xyz + r6.xyz;
  r2.xyz = BA_Fragment_121_CB3((uint)(0)).yzw * r2.xyz;
  r2.xyz = r2.xyz * r5.yyy;
  r2.xyz = v5.xyz * r2.xyz;
  r0.yzw = r2.xyz * r0.zzz;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.w = r1.w * r1.w;
  r0.xyz = r0.xyz * BA_Fragment_121_CB3((uint)(11)).xyz + BA_Fragment_121_CB3((uint)(10)).xyz;
  r0.xyz = r0.www * BA_Fragment_121_CB3((uint)(12)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_121_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_121_CB0((uint)(56)).xyz;
  o0.w = r2.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_122_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 13u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_122_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_122_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_122_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD8,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_122_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_122_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.yz = v7.xx ? float2(1,0) : float2(-1,1);
  r2.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_122_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r2.xyz, BA_Fragment_122_CB0((uint)(126)).xyz);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_122_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_122_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_122_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_122_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_122_CB2((uint)(11)).y, BA_Fragment_122_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_122_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v6.xyz * BA_Fragment_122_CB1((uint)(r5.w+0)).www + BA_Fragment_122_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_122_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_122_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_122_CB1((uint)(r5.w+512)).z + BA_Fragment_122_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_122_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r2.xyz);
    r6.x = r3.y * BA_Fragment_122_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_122_CB3((uint)(13)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_122_CB3((uint)(13)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_122_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r2.w * BA_Fragment_122_CB3((uint)(2)).z + -BA_Fragment_122_CB3((uint)(3)).x);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_122_CB3((uint)(2)).w * r0.y;
  r4.w = 1 + -BA_Fragment_122_CB3((uint)(2)).y;
  r6.xyz = BA_Fragment_122_CB0((uint)(126)).xyz * BA_Fragment_122_CB3((uint)(1)).xxx + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r2.x = saturate(dot(r2.xyz, r6.xyz));
  r2.x = log2(r2.x);
  r2.x = BA_Fragment_122_CB3((uint)(1)).y * r2.x;
  r2.x = exp2(r2.x);
  r2.x = saturate(r3.y * BA_Fragment_122_CB3((uint)(6)).x + r2.x);
  r2.y = -0.5 + r2.x;
  r2.y = saturate(10 * r2.y);
  r2.y = BA_Fragment_122_CB3((uint)(2)).y * r2.y;
  r2.x = r4.w * r2.x + r2.y;
  r2.y = saturate(r2.w);
  r2.y = log2(r2.y);
  r2.y = BA_Fragment_122_CB3((uint)(1)).w * r2.y;
  r2.y = exp2(r2.y);
  r2.y = saturate(r3.y * BA_Fragment_122_CB3((uint)(6)).x + r2.y);
  r2.z = 4000 * r2.y;
  r2.z = min(1, r2.z);
  r2.z = BA_Fragment_122_CB3((uint)(2)).y * r2.z;
  r2.y = r4.w * r2.y + r2.z;
  r2.z = BA_Fragment_122_CB3((uint)(2)).x * r2.y;
  r3.y = BA_Fragment_122_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_122_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_122_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r2.z = r2.x * BA_Fragment_122_CB3((uint)(1)).z + r2.z;
  r2.z = BA_Fragment_122_CB3((uint)(0)).w + r2.z;
  r3.yzw = r2.zzz * BA_Fragment_122_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_122_CB3((uint)(2)).w + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r2.x * BA_Fragment_122_CB3((uint)(1)).z + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r2.y * BA_Fragment_122_CB3((uint)(2)).x + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_122_CB3((uint)(5)).w * r0.y;
  r2.xyz = BA_Fragment_122_CB3((uint)(5)).xyz * BA_Fragment_122_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r2.xyz = r0.yyy * r2.xyz + float3(1,1,1);
  r2.xyz = r3.yzw * r2.xyz;
  r2.xyz = r2.xyz * r1.xyz + r6.xyz;
  r1.xyz = BA_Fragment_122_CB3((uint)(0)).xyz * r1.xyz;
  r1.xyz = r1.xyz * r5.yyy;
  r1.xyz = v5.xyz * r1.xyz;
  r0.yzw = r1.xyz * r0.zzz;
  r0.xyz = r0.xxx * r2.xyz + r0.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_122_CB3((uint)(12)).w * r0.x;
  r0.y = r2.w * r2.w;
  r0.xzw = r0.xxx * BA_Fragment_122_CB3((uint)(11)).xyz + BA_Fragment_122_CB3((uint)(10)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_122_CB3((uint)(12)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_122_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_122_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_123_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 13u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_123_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_123_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_123_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD8,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_123_CB0((uint)(19)).x).xyzw;
  r2.xyzw = BA_Fragment_123_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.y = -BA_Fragment_123_CB3((uint)(0)).x + r1.w;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v7.xx ? float2(1,0) : float2(-1,1);
  r1.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_123_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r1.xyz, BA_Fragment_123_CB0((uint)(126)).xyz);
  r0.w = dot(r1.xyz, v4.xyz);
  r1.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_123_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_123_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_123_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_123_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_123_CB2((uint)(11)).y, BA_Fragment_123_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_123_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v6.xyz * BA_Fragment_123_CB1((uint)(r5.w+0)).www + BA_Fragment_123_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_123_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_123_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_123_CB1((uint)(r5.w+512)).z + BA_Fragment_123_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_123_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r1.xyz);
    r6.x = r3.y * BA_Fragment_123_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_123_CB3((uint)(13)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_123_CB3((uint)(13)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_123_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r1.w * BA_Fragment_123_CB3((uint)(2)).w + -BA_Fragment_123_CB3((uint)(3)).y);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_123_CB3((uint)(3)).x * r0.y;
  r4.w = 1 + -BA_Fragment_123_CB3((uint)(2)).z;
  r6.xyz = BA_Fragment_123_CB0((uint)(126)).xyz * BA_Fragment_123_CB3((uint)(1)).yyy + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r1.x = saturate(dot(r1.xyz, r6.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_123_CB3((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = saturate(r3.y * BA_Fragment_123_CB3((uint)(6)).x + r1.x);
  r1.y = -0.5 + r1.x;
  r1.y = saturate(10 * r1.y);
  r1.y = BA_Fragment_123_CB3((uint)(2)).z * r1.y;
  r1.x = r4.w * r1.x + r1.y;
  r1.y = saturate(r1.w);
  r1.y = log2(r1.y);
  r1.y = BA_Fragment_123_CB3((uint)(2)).x * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(r3.y * BA_Fragment_123_CB3((uint)(6)).x + r1.y);
  r1.z = 4000 * r1.y;
  r1.z = min(1, r1.z);
  r1.z = BA_Fragment_123_CB3((uint)(2)).z * r1.z;
  r1.y = r4.w * r1.y + r1.z;
  r1.z = BA_Fragment_123_CB3((uint)(2)).y * r1.y;
  r3.y = BA_Fragment_123_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_123_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_123_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r1.z = r1.x * BA_Fragment_123_CB3((uint)(1)).w + r1.z;
  r1.z = BA_Fragment_123_CB3((uint)(1)).x + r1.z;
  r3.yzw = r1.zzz * BA_Fragment_123_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_123_CB3((uint)(3)).x + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r1.x * BA_Fragment_123_CB3((uint)(1)).w + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r1.y * BA_Fragment_123_CB3((uint)(2)).y + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_123_CB3((uint)(5)).w * r0.y;
  r1.xyz = BA_Fragment_123_CB3((uint)(5)).xyz * BA_Fragment_123_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.xyz = r0.yyy * r1.xyz + float3(1,1,1);
  r1.xyz = r3.yzw * r1.xyz;
  r1.xyz = r1.xyz * r2.xyz + r6.xyz;
  r2.xyz = BA_Fragment_123_CB3((uint)(0)).yzw * r2.xyz;
  r2.xyz = r2.xyz * r5.yyy;
  r2.xyz = v5.xyz * r2.xyz;
  r0.yzw = r2.xyz * r0.zzz;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_123_CB3((uint)(12)).w * r0.x;
  r0.y = r1.w * r1.w;
  r0.xzw = r0.xxx * BA_Fragment_123_CB3((uint)(11)).xyz + BA_Fragment_123_CB3((uint)(10)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_123_CB3((uint)(12)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_123_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_123_CB0((uint)(56)).xyz;
  o0.w = r2.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_124_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_124_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_124_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_124_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  float3 v7 : TEXCOORD8,
  uint v8 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v8.x & 0x3f800000u);
  r0.y = 333.333344 * v6.w;
  r0.z = cmp(r0.y >= -r0.y);
  r0.y = frac(abs(r0.y));
  r0.y = r0.z ? r0.y : -r0.y;
  r0.y = 0.00300000003 * r0.y;
  r0.y = -BA_Fragment_124_CB3((uint)(15)).x * 0.00300000003 + abs(r0.y);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_124_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_124_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v8.xx ? float2(1,0) : float2(-1,1);
  r2.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_124_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r2.xyz, BA_Fragment_124_CB0((uint)(126)).xyz);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_124_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_124_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_124_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_124_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_124_CB2((uint)(11)).y, BA_Fragment_124_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_124_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v7.xyz * BA_Fragment_124_CB1((uint)(r5.w+0)).www + BA_Fragment_124_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_124_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_124_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_124_CB1((uint)(r5.w+512)).z + BA_Fragment_124_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_124_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r2.xyz);
    r6.x = r3.y * BA_Fragment_124_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_124_CB3((uint)(15)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_124_CB3((uint)(15)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_124_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r2.w * BA_Fragment_124_CB3((uint)(2)).z + -BA_Fragment_124_CB3((uint)(3)).x);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_124_CB3((uint)(2)).w * r0.y;
  r4.w = 1 + -BA_Fragment_124_CB3((uint)(2)).y;
  r6.xyz = BA_Fragment_124_CB0((uint)(126)).xyz * BA_Fragment_124_CB3((uint)(1)).xxx + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r2.x = saturate(dot(r2.xyz, r6.xyz));
  r2.x = log2(r2.x);
  r2.x = BA_Fragment_124_CB3((uint)(1)).y * r2.x;
  r2.x = exp2(r2.x);
  r2.x = saturate(r3.y * BA_Fragment_124_CB3((uint)(6)).x + r2.x);
  r2.y = -0.5 + r2.x;
  r2.y = saturate(10 * r2.y);
  r2.y = BA_Fragment_124_CB3((uint)(2)).y * r2.y;
  r2.x = r4.w * r2.x + r2.y;
  r2.y = saturate(r2.w);
  r2.y = log2(r2.y);
  r2.y = BA_Fragment_124_CB3((uint)(1)).w * r2.y;
  r2.y = exp2(r2.y);
  r2.y = saturate(r3.y * BA_Fragment_124_CB3((uint)(6)).x + r2.y);
  r2.z = 4000 * r2.y;
  r2.z = min(1, r2.z);
  r2.z = BA_Fragment_124_CB3((uint)(2)).y * r2.z;
  r2.y = r4.w * r2.y + r2.z;
  r2.z = BA_Fragment_124_CB3((uint)(2)).x * r2.y;
  r3.y = BA_Fragment_124_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_124_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_124_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r2.z = r2.x * BA_Fragment_124_CB3((uint)(1)).z + r2.z;
  r2.z = BA_Fragment_124_CB3((uint)(0)).w + r2.z;
  r3.yzw = r2.zzz * BA_Fragment_124_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_124_CB3((uint)(2)).w + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r2.x * BA_Fragment_124_CB3((uint)(1)).z + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r2.y * BA_Fragment_124_CB3((uint)(2)).x + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_124_CB3((uint)(5)).w * r0.y;
  r2.xyz = BA_Fragment_124_CB3((uint)(5)).xyz * BA_Fragment_124_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r2.xyz = r0.yyy * r2.xyz + float3(1,1,1);
  r2.xyz = r3.yzw * r2.xyz;
  r2.xyz = r2.xyz * r1.xyz + r6.xyz;
  r1.xyz = BA_Fragment_124_CB3((uint)(0)).xyz * r1.xyz;
  r1.xyz = r1.xyz * r5.yyy;
  r1.xyz = v5.xyz * r1.xyz;
  r0.yzw = r1.xyz * r0.zzz;
  r0.xyz = r0.xxx * r2.xyz + r0.yzw;
  r0.w = r2.w * r2.w;
  r0.xyz = r0.xyz * BA_Fragment_124_CB3((uint)(13)).xyz + BA_Fragment_124_CB3((uint)(12)).xyz;
  r0.xyz = r0.www * BA_Fragment_124_CB3((uint)(14)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_124_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_124_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_125_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_125_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_125_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_125_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  float3 v7 : TEXCOORD8,
  uint v8 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v8.x & 0x3f800000u);
  r0.y = 333.333344 * v6.w;
  r0.z = cmp(r0.y >= -r0.y);
  r0.y = frac(abs(r0.y));
  r0.y = r0.z ? r0.y : -r0.y;
  r0.y = 0.00300000003 * r0.y;
  r0.y = -BA_Fragment_125_CB3((uint)(15)).x * 0.00300000003 + abs(r0.y);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_125_CB0((uint)(19)).x).xyzw;
  r2.xyzw = BA_Fragment_125_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.z = -BA_Fragment_125_CB3((uint)(0)).x + r1.w;
  r0.y = min(r0.y, r0.z);
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v8.xx ? float2(1,0) : float2(-1,1);
  r1.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_125_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r1.xyz, BA_Fragment_125_CB0((uint)(126)).xyz);
  r0.w = dot(r1.xyz, v4.xyz);
  r1.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_125_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_125_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_125_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_125_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_125_CB2((uint)(11)).y, BA_Fragment_125_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_125_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v7.xyz * BA_Fragment_125_CB1((uint)(r5.w+0)).www + BA_Fragment_125_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_125_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_125_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_125_CB1((uint)(r5.w+512)).z + BA_Fragment_125_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_125_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r1.xyz);
    r6.x = r3.y * BA_Fragment_125_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_125_CB3((uint)(15)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_125_CB3((uint)(15)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_125_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r1.w * BA_Fragment_125_CB3((uint)(2)).w + -BA_Fragment_125_CB3((uint)(3)).y);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_125_CB3((uint)(3)).x * r0.y;
  r4.w = 1 + -BA_Fragment_125_CB3((uint)(2)).z;
  r6.xyz = BA_Fragment_125_CB0((uint)(126)).xyz * BA_Fragment_125_CB3((uint)(1)).yyy + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r1.x = saturate(dot(r1.xyz, r6.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_125_CB3((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = saturate(r3.y * BA_Fragment_125_CB3((uint)(6)).x + r1.x);
  r1.y = -0.5 + r1.x;
  r1.y = saturate(10 * r1.y);
  r1.y = BA_Fragment_125_CB3((uint)(2)).z * r1.y;
  r1.x = r4.w * r1.x + r1.y;
  r1.y = saturate(r1.w);
  r1.y = log2(r1.y);
  r1.y = BA_Fragment_125_CB3((uint)(2)).x * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(r3.y * BA_Fragment_125_CB3((uint)(6)).x + r1.y);
  r1.z = 4000 * r1.y;
  r1.z = min(1, r1.z);
  r1.z = BA_Fragment_125_CB3((uint)(2)).z * r1.z;
  r1.y = r4.w * r1.y + r1.z;
  r1.z = BA_Fragment_125_CB3((uint)(2)).y * r1.y;
  r3.y = BA_Fragment_125_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_125_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_125_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r1.z = r1.x * BA_Fragment_125_CB3((uint)(1)).w + r1.z;
  r1.z = BA_Fragment_125_CB3((uint)(1)).x + r1.z;
  r3.yzw = r1.zzz * BA_Fragment_125_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_125_CB3((uint)(3)).x + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r1.x * BA_Fragment_125_CB3((uint)(1)).w + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r1.y * BA_Fragment_125_CB3((uint)(2)).y + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_125_CB3((uint)(5)).w * r0.y;
  r1.xyz = BA_Fragment_125_CB3((uint)(5)).xyz * BA_Fragment_125_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.xyz = r0.yyy * r1.xyz + float3(1,1,1);
  r1.xyz = r3.yzw * r1.xyz;
  r1.xyz = r1.xyz * r2.xyz + r6.xyz;
  r2.xyz = BA_Fragment_125_CB3((uint)(0)).yzw * r2.xyz;
  r2.xyz = r2.xyz * r5.yyy;
  r2.xyz = v5.xyz * r2.xyz;
  r0.yzw = r2.xyz * r0.zzz;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.w = r1.w * r1.w;
  r0.xyz = r0.xyz * BA_Fragment_125_CB3((uint)(13)).xyz + BA_Fragment_125_CB3((uint)(12)).xyz;
  r0.xyz = r0.www * BA_Fragment_125_CB3((uint)(14)).xyz + r0.xyz;
  r0.xyz = -BA_Fragment_125_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_125_CB0((uint)(56)).xyz;
  o0.w = r2.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_126_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 15u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_126_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_126_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_126_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  float3 v7 : TEXCOORD8,
  uint v8 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v8.x & 0x3f800000u);
  r0.y = 333.333344 * v6.w;
  r0.z = cmp(r0.y >= -r0.y);
  r0.y = frac(abs(r0.y));
  r0.y = r0.z ? r0.y : -r0.y;
  r0.y = 0.00300000003 * r0.y;
  r0.y = -BA_Fragment_126_CB3((uint)(15)).x * 0.00300000003 + abs(r0.y);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_126_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_126_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v8.xx ? float2(1,0) : float2(-1,1);
  r2.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_126_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r2.xyz, BA_Fragment_126_CB0((uint)(126)).xyz);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_126_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_126_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_126_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_126_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_126_CB2((uint)(11)).y, BA_Fragment_126_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_126_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v7.xyz * BA_Fragment_126_CB1((uint)(r5.w+0)).www + BA_Fragment_126_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_126_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_126_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_126_CB1((uint)(r5.w+512)).z + BA_Fragment_126_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_126_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r2.xyz);
    r6.x = r3.y * BA_Fragment_126_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_126_CB3((uint)(15)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_126_CB3((uint)(15)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_126_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r2.w * BA_Fragment_126_CB3((uint)(2)).z + -BA_Fragment_126_CB3((uint)(3)).x);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_126_CB3((uint)(2)).w * r0.y;
  r4.w = 1 + -BA_Fragment_126_CB3((uint)(2)).y;
  r6.xyz = BA_Fragment_126_CB0((uint)(126)).xyz * BA_Fragment_126_CB3((uint)(1)).xxx + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r2.x = saturate(dot(r2.xyz, r6.xyz));
  r2.x = log2(r2.x);
  r2.x = BA_Fragment_126_CB3((uint)(1)).y * r2.x;
  r2.x = exp2(r2.x);
  r2.x = saturate(r3.y * BA_Fragment_126_CB3((uint)(6)).x + r2.x);
  r2.y = -0.5 + r2.x;
  r2.y = saturate(10 * r2.y);
  r2.y = BA_Fragment_126_CB3((uint)(2)).y * r2.y;
  r2.x = r4.w * r2.x + r2.y;
  r2.y = saturate(r2.w);
  r2.y = log2(r2.y);
  r2.y = BA_Fragment_126_CB3((uint)(1)).w * r2.y;
  r2.y = exp2(r2.y);
  r2.y = saturate(r3.y * BA_Fragment_126_CB3((uint)(6)).x + r2.y);
  r2.z = 4000 * r2.y;
  r2.z = min(1, r2.z);
  r2.z = BA_Fragment_126_CB3((uint)(2)).y * r2.z;
  r2.y = r4.w * r2.y + r2.z;
  r2.z = BA_Fragment_126_CB3((uint)(2)).x * r2.y;
  r3.y = BA_Fragment_126_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_126_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_126_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r2.z = r2.x * BA_Fragment_126_CB3((uint)(1)).z + r2.z;
  r2.z = BA_Fragment_126_CB3((uint)(0)).w + r2.z;
  r3.yzw = r2.zzz * BA_Fragment_126_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_126_CB3((uint)(2)).w + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r2.x * BA_Fragment_126_CB3((uint)(1)).z + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r2.y * BA_Fragment_126_CB3((uint)(2)).x + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_126_CB3((uint)(5)).w * r0.y;
  r2.xyz = BA_Fragment_126_CB3((uint)(5)).xyz * BA_Fragment_126_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r2.xyz = r0.yyy * r2.xyz + float3(1,1,1);
  r2.xyz = r3.yzw * r2.xyz;
  r2.xyz = r2.xyz * r1.xyz + r6.xyz;
  r1.xyz = BA_Fragment_126_CB3((uint)(0)).xyz * r1.xyz;
  r1.xyz = r1.xyz * r5.yyy;
  r1.xyz = v5.xyz * r1.xyz;
  r0.yzw = r1.xyz * r0.zzz;
  r0.xyz = r0.xxx * r2.xyz + r0.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_126_CB3((uint)(14)).w * r0.x;
  r0.y = r2.w * r2.w;
  r0.xzw = r0.xxx * BA_Fragment_126_CB3((uint)(13)).xyz + BA_Fragment_126_CB3((uint)(12)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_126_CB3((uint)(14)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_126_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_126_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_127_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 15u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_127_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_127_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_127_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  float3 v7 : TEXCOORD8,
  uint v8 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v8.x & 0x3f800000u);
  r0.y = 333.333344 * v6.w;
  r0.z = cmp(r0.y >= -r0.y);
  r0.y = frac(abs(r0.y));
  r0.y = r0.z ? r0.y : -r0.y;
  r0.y = 0.00300000003 * r0.y;
  r0.y = -BA_Fragment_127_CB3((uint)(15)).x * 0.00300000003 + abs(r0.y);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_127_CB0((uint)(19)).x).xyzw;
  r2.xyzw = BA_Fragment_127_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.z = -BA_Fragment_127_CB3((uint)(0)).x + r1.w;
  r0.y = min(r0.y, r0.z);
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v8.xx ? float2(1,0) : float2(-1,1);
  r1.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_127_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r1.xyz, BA_Fragment_127_CB0((uint)(126)).xyz);
  r0.w = dot(r1.xyz, v4.xyz);
  r1.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_127_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_127_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_127_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_127_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_127_CB2((uint)(11)).y, BA_Fragment_127_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_127_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v7.xyz * BA_Fragment_127_CB1((uint)(r5.w+0)).www + BA_Fragment_127_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_127_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_127_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_127_CB1((uint)(r5.w+512)).z + BA_Fragment_127_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_127_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r1.xyz);
    r6.x = r3.y * BA_Fragment_127_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_127_CB3((uint)(15)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_127_CB3((uint)(15)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_127_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r1.w * BA_Fragment_127_CB3((uint)(2)).w + -BA_Fragment_127_CB3((uint)(3)).y);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_127_CB3((uint)(3)).x * r0.y;
  r4.w = 1 + -BA_Fragment_127_CB3((uint)(2)).z;
  r6.xyz = BA_Fragment_127_CB0((uint)(126)).xyz * BA_Fragment_127_CB3((uint)(1)).yyy + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r1.x = saturate(dot(r1.xyz, r6.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_127_CB3((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = saturate(r3.y * BA_Fragment_127_CB3((uint)(6)).x + r1.x);
  r1.y = -0.5 + r1.x;
  r1.y = saturate(10 * r1.y);
  r1.y = BA_Fragment_127_CB3((uint)(2)).z * r1.y;
  r1.x = r4.w * r1.x + r1.y;
  r1.y = saturate(r1.w);
  r1.y = log2(r1.y);
  r1.y = BA_Fragment_127_CB3((uint)(2)).x * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(r3.y * BA_Fragment_127_CB3((uint)(6)).x + r1.y);
  r1.z = 4000 * r1.y;
  r1.z = min(1, r1.z);
  r1.z = BA_Fragment_127_CB3((uint)(2)).z * r1.z;
  r1.y = r4.w * r1.y + r1.z;
  r1.z = BA_Fragment_127_CB3((uint)(2)).y * r1.y;
  r3.y = BA_Fragment_127_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_127_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_127_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r1.z = r1.x * BA_Fragment_127_CB3((uint)(1)).w + r1.z;
  r1.z = BA_Fragment_127_CB3((uint)(1)).x + r1.z;
  r3.yzw = r1.zzz * BA_Fragment_127_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_127_CB3((uint)(3)).x + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r1.x * BA_Fragment_127_CB3((uint)(1)).w + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r1.y * BA_Fragment_127_CB3((uint)(2)).y + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_127_CB3((uint)(5)).w * r0.y;
  r1.xyz = BA_Fragment_127_CB3((uint)(5)).xyz * BA_Fragment_127_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.xyz = r0.yyy * r1.xyz + float3(1,1,1);
  r1.xyz = r3.yzw * r1.xyz;
  r1.xyz = r1.xyz * r2.xyz + r6.xyz;
  r2.xyz = BA_Fragment_127_CB3((uint)(0)).yzw * r2.xyz;
  r2.xyz = r2.xyz * r5.yyy;
  r2.xyz = v5.xyz * r2.xyz;
  r0.yzw = r2.xyz * r0.zzz;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_127_CB3((uint)(14)).w * r0.x;
  r0.y = r1.w * r1.w;
  r0.xzw = r0.xxx * BA_Fragment_127_CB3((uint)(13)).xyz + BA_Fragment_127_CB3((uint)(12)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_127_CB3((uint)(14)).xyz + r0.xzw;
  r0.xyz = -BA_Fragment_127_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v2.www * r0.xyz + BA_Fragment_127_CB0((uint)(56)).xyz;
  o0.w = r2.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_128_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 13u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_128_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_128_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_128_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD8,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_128_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_128_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.yz = v7.xx ? float2(1,0) : float2(-1,1);
  r2.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_128_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r2.xyz, BA_Fragment_128_CB0((uint)(126)).xyz);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_128_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_128_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_128_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_128_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_128_CB2((uint)(11)).y, BA_Fragment_128_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_128_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v6.xyz * BA_Fragment_128_CB1((uint)(r5.w+0)).www + BA_Fragment_128_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_128_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_128_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_128_CB1((uint)(r5.w+512)).z + BA_Fragment_128_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_128_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r2.xyz);
    r6.x = r3.y * BA_Fragment_128_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_128_CB3((uint)(13)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_128_CB3((uint)(13)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_128_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r2.w * BA_Fragment_128_CB3((uint)(2)).z + -BA_Fragment_128_CB3((uint)(3)).x);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_128_CB3((uint)(2)).w * r0.y;
  r4.w = 1 + -BA_Fragment_128_CB3((uint)(2)).y;
  r6.xyz = BA_Fragment_128_CB0((uint)(126)).xyz * BA_Fragment_128_CB3((uint)(1)).xxx + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r2.x = saturate(dot(r2.xyz, r6.xyz));
  r2.x = log2(r2.x);
  r2.x = BA_Fragment_128_CB3((uint)(1)).y * r2.x;
  r2.x = exp2(r2.x);
  r2.x = saturate(r3.y * BA_Fragment_128_CB3((uint)(6)).x + r2.x);
  r2.y = -0.5 + r2.x;
  r2.y = saturate(10 * r2.y);
  r2.y = BA_Fragment_128_CB3((uint)(2)).y * r2.y;
  r2.x = r4.w * r2.x + r2.y;
  r2.y = saturate(r2.w);
  r2.y = log2(r2.y);
  r2.y = BA_Fragment_128_CB3((uint)(1)).w * r2.y;
  r2.y = exp2(r2.y);
  r2.y = saturate(r3.y * BA_Fragment_128_CB3((uint)(6)).x + r2.y);
  r2.z = 4000 * r2.y;
  r2.z = min(1, r2.z);
  r2.z = BA_Fragment_128_CB3((uint)(2)).y * r2.z;
  r2.y = r4.w * r2.y + r2.z;
  r2.z = BA_Fragment_128_CB3((uint)(2)).x * r2.y;
  r3.y = BA_Fragment_128_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_128_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_128_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r2.z = r2.x * BA_Fragment_128_CB3((uint)(1)).z + r2.z;
  r2.z = BA_Fragment_128_CB3((uint)(0)).w + r2.z;
  r3.yzw = r2.zzz * BA_Fragment_128_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_128_CB3((uint)(2)).w + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r2.x * BA_Fragment_128_CB3((uint)(1)).z + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r2.y * BA_Fragment_128_CB3((uint)(2)).x + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_128_CB3((uint)(5)).w * r0.y;
  r2.xyz = BA_Fragment_128_CB3((uint)(5)).xyz * BA_Fragment_128_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r2.xyz = r0.yyy * r2.xyz + float3(1,1,1);
  r2.xyz = r3.yzw * r2.xyz;
  r2.xyz = r2.xyz * r1.xyz + r6.xyz;
  r1.xyz = BA_Fragment_128_CB3((uint)(0)).xyz * r1.xyz;
  r1.xyz = r1.xyz * r5.yyy;
  r1.xyz = v5.xyz * r1.xyz;
  r0.yzw = r1.xyz * r0.zzz;
  r0.xyz = r0.xxx * r2.xyz + r0.yzw;
  r0.w = r2.w * r2.w;
  r0.xyz = r0.xyz * BA_Fragment_128_CB3((uint)(11)).xyz + BA_Fragment_128_CB3((uint)(10)).xyz;
  r0.xyz = r0.www * BA_Fragment_128_CB3((uint)(12)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_128_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_128_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_129_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 13u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_129_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_129_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_129_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD8,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_129_CB0((uint)(19)).x).xyzw;
  r2.xyzw = BA_Fragment_129_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.y = -BA_Fragment_129_CB3((uint)(0)).x + r1.w;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v7.xx ? float2(1,0) : float2(-1,1);
  r1.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_129_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r1.xyz, BA_Fragment_129_CB0((uint)(126)).xyz);
  r0.w = dot(r1.xyz, v4.xyz);
  r1.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_129_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_129_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_129_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_129_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_129_CB2((uint)(11)).y, BA_Fragment_129_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_129_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v6.xyz * BA_Fragment_129_CB1((uint)(r5.w+0)).www + BA_Fragment_129_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_129_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_129_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_129_CB1((uint)(r5.w+512)).z + BA_Fragment_129_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_129_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r1.xyz);
    r6.x = r3.y * BA_Fragment_129_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_129_CB3((uint)(13)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_129_CB3((uint)(13)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_129_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r1.w * BA_Fragment_129_CB3((uint)(2)).w + -BA_Fragment_129_CB3((uint)(3)).y);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_129_CB3((uint)(3)).x * r0.y;
  r4.w = 1 + -BA_Fragment_129_CB3((uint)(2)).z;
  r6.xyz = BA_Fragment_129_CB0((uint)(126)).xyz * BA_Fragment_129_CB3((uint)(1)).yyy + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r1.x = saturate(dot(r1.xyz, r6.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_129_CB3((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = saturate(r3.y * BA_Fragment_129_CB3((uint)(6)).x + r1.x);
  r1.y = -0.5 + r1.x;
  r1.y = saturate(10 * r1.y);
  r1.y = BA_Fragment_129_CB3((uint)(2)).z * r1.y;
  r1.x = r4.w * r1.x + r1.y;
  r1.y = saturate(r1.w);
  r1.y = log2(r1.y);
  r1.y = BA_Fragment_129_CB3((uint)(2)).x * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(r3.y * BA_Fragment_129_CB3((uint)(6)).x + r1.y);
  r1.z = 4000 * r1.y;
  r1.z = min(1, r1.z);
  r1.z = BA_Fragment_129_CB3((uint)(2)).z * r1.z;
  r1.y = r4.w * r1.y + r1.z;
  r1.z = BA_Fragment_129_CB3((uint)(2)).y * r1.y;
  r3.y = BA_Fragment_129_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_129_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_129_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r1.z = r1.x * BA_Fragment_129_CB3((uint)(1)).w + r1.z;
  r1.z = BA_Fragment_129_CB3((uint)(1)).x + r1.z;
  r3.yzw = r1.zzz * BA_Fragment_129_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_129_CB3((uint)(3)).x + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r1.x * BA_Fragment_129_CB3((uint)(1)).w + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r1.y * BA_Fragment_129_CB3((uint)(2)).y + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_129_CB3((uint)(5)).w * r0.y;
  r1.xyz = BA_Fragment_129_CB3((uint)(5)).xyz * BA_Fragment_129_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.xyz = r0.yyy * r1.xyz + float3(1,1,1);
  r1.xyz = r3.yzw * r1.xyz;
  r1.xyz = r1.xyz * r2.xyz + r6.xyz;
  r2.xyz = BA_Fragment_129_CB3((uint)(0)).yzw * r2.xyz;
  r2.xyz = r2.xyz * r5.yyy;
  r2.xyz = v5.xyz * r2.xyz;
  r0.yzw = r2.xyz * r0.zzz;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.w = r1.w * r1.w;
  r0.xyz = r0.xyz * BA_Fragment_129_CB3((uint)(11)).xyz + BA_Fragment_129_CB3((uint)(10)).xyz;
  r0.xyz = r0.www * BA_Fragment_129_CB3((uint)(12)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_129_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_129_CB0((uint)(56)).xyz;
  o0.w = r2.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_130_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 13u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_130_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_130_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_130_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD8,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_130_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_130_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.yz = v7.xx ? float2(1,0) : float2(-1,1);
  r2.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_130_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r2.xyz, BA_Fragment_130_CB0((uint)(126)).xyz);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_130_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_130_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_130_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_130_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_130_CB2((uint)(11)).y, BA_Fragment_130_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_130_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v6.xyz * BA_Fragment_130_CB1((uint)(r5.w+0)).www + BA_Fragment_130_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_130_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_130_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_130_CB1((uint)(r5.w+512)).z + BA_Fragment_130_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_130_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r2.xyz);
    r6.x = r3.y * BA_Fragment_130_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_130_CB3((uint)(13)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_130_CB3((uint)(13)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_130_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r2.w * BA_Fragment_130_CB3((uint)(2)).z + -BA_Fragment_130_CB3((uint)(3)).x);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_130_CB3((uint)(2)).w * r0.y;
  r4.w = 1 + -BA_Fragment_130_CB3((uint)(2)).y;
  r6.xyz = BA_Fragment_130_CB0((uint)(126)).xyz * BA_Fragment_130_CB3((uint)(1)).xxx + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r2.x = saturate(dot(r2.xyz, r6.xyz));
  r2.x = log2(r2.x);
  r2.x = BA_Fragment_130_CB3((uint)(1)).y * r2.x;
  r2.x = exp2(r2.x);
  r2.x = saturate(r3.y * BA_Fragment_130_CB3((uint)(6)).x + r2.x);
  r2.y = -0.5 + r2.x;
  r2.y = saturate(10 * r2.y);
  r2.y = BA_Fragment_130_CB3((uint)(2)).y * r2.y;
  r2.x = r4.w * r2.x + r2.y;
  r2.y = saturate(r2.w);
  r2.y = log2(r2.y);
  r2.y = BA_Fragment_130_CB3((uint)(1)).w * r2.y;
  r2.y = exp2(r2.y);
  r2.y = saturate(r3.y * BA_Fragment_130_CB3((uint)(6)).x + r2.y);
  r2.z = 4000 * r2.y;
  r2.z = min(1, r2.z);
  r2.z = BA_Fragment_130_CB3((uint)(2)).y * r2.z;
  r2.y = r4.w * r2.y + r2.z;
  r2.z = BA_Fragment_130_CB3((uint)(2)).x * r2.y;
  r3.y = BA_Fragment_130_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_130_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_130_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r2.z = r2.x * BA_Fragment_130_CB3((uint)(1)).z + r2.z;
  r2.z = BA_Fragment_130_CB3((uint)(0)).w + r2.z;
  r3.yzw = r2.zzz * BA_Fragment_130_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_130_CB3((uint)(2)).w + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r2.x * BA_Fragment_130_CB3((uint)(1)).z + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r2.y * BA_Fragment_130_CB3((uint)(2)).x + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_130_CB3((uint)(5)).w * r0.y;
  r2.xyz = BA_Fragment_130_CB3((uint)(5)).xyz * BA_Fragment_130_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r2.xyz = r0.yyy * r2.xyz + float3(1,1,1);
  r2.xyz = r3.yzw * r2.xyz;
  r2.xyz = r2.xyz * r1.xyz + r6.xyz;
  r1.xyz = BA_Fragment_130_CB3((uint)(0)).xyz * r1.xyz;
  r1.xyz = r1.xyz * r5.yyy;
  r1.xyz = v5.xyz * r1.xyz;
  r0.yzw = r1.xyz * r0.zzz;
  r0.xyz = r0.xxx * r2.xyz + r0.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_130_CB3((uint)(12)).w * r0.x;
  r0.y = r2.w * r2.w;
  r0.xzw = r0.xxx * BA_Fragment_130_CB3((uint)(11)).xyz + BA_Fragment_130_CB3((uint)(10)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_130_CB3((uint)(12)).xyz + r0.xzw;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_130_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_130_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_131_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 10u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 11u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 12u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 13u) value = float4(0.0, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_131_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_131_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_131_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float3 v6 : TEXCOORD8,
  uint v7 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v7.x & 0x3f800000u);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_131_CB0((uint)(19)).x).xyzw;
  r2.xyzw = BA_Fragment_131_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.y = -BA_Fragment_131_CB3((uint)(0)).x + r1.w;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v7.xx ? float2(1,0) : float2(-1,1);
  r1.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_131_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r1.xyz, BA_Fragment_131_CB0((uint)(126)).xyz);
  r0.w = dot(r1.xyz, v4.xyz);
  r1.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_131_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_131_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_131_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_131_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_131_CB2((uint)(11)).y, BA_Fragment_131_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_131_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v6.xyz * BA_Fragment_131_CB1((uint)(r5.w+0)).www + BA_Fragment_131_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_131_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_131_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_131_CB1((uint)(r5.w+512)).z + BA_Fragment_131_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_131_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r1.xyz);
    r6.x = r3.y * BA_Fragment_131_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_131_CB3((uint)(13)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_131_CB3((uint)(13)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_131_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r1.w * BA_Fragment_131_CB3((uint)(2)).w + -BA_Fragment_131_CB3((uint)(3)).y);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_131_CB3((uint)(3)).x * r0.y;
  r4.w = 1 + -BA_Fragment_131_CB3((uint)(2)).z;
  r6.xyz = BA_Fragment_131_CB0((uint)(126)).xyz * BA_Fragment_131_CB3((uint)(1)).yyy + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r1.x = saturate(dot(r1.xyz, r6.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_131_CB3((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = saturate(r3.y * BA_Fragment_131_CB3((uint)(6)).x + r1.x);
  r1.y = -0.5 + r1.x;
  r1.y = saturate(10 * r1.y);
  r1.y = BA_Fragment_131_CB3((uint)(2)).z * r1.y;
  r1.x = r4.w * r1.x + r1.y;
  r1.y = saturate(r1.w);
  r1.y = log2(r1.y);
  r1.y = BA_Fragment_131_CB3((uint)(2)).x * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(r3.y * BA_Fragment_131_CB3((uint)(6)).x + r1.y);
  r1.z = 4000 * r1.y;
  r1.z = min(1, r1.z);
  r1.z = BA_Fragment_131_CB3((uint)(2)).z * r1.z;
  r1.y = r4.w * r1.y + r1.z;
  r1.z = BA_Fragment_131_CB3((uint)(2)).y * r1.y;
  r3.y = BA_Fragment_131_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_131_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_131_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r1.z = r1.x * BA_Fragment_131_CB3((uint)(1)).w + r1.z;
  r1.z = BA_Fragment_131_CB3((uint)(1)).x + r1.z;
  r3.yzw = r1.zzz * BA_Fragment_131_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_131_CB3((uint)(3)).x + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r1.x * BA_Fragment_131_CB3((uint)(1)).w + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r1.y * BA_Fragment_131_CB3((uint)(2)).y + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_131_CB3((uint)(5)).w * r0.y;
  r1.xyz = BA_Fragment_131_CB3((uint)(5)).xyz * BA_Fragment_131_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.xyz = r0.yyy * r1.xyz + float3(1,1,1);
  r1.xyz = r3.yzw * r1.xyz;
  r1.xyz = r1.xyz * r2.xyz + r6.xyz;
  r2.xyz = BA_Fragment_131_CB3((uint)(0)).yzw * r2.xyz;
  r2.xyz = r2.xyz * r5.yyy;
  r2.xyz = v5.xyz * r2.xyz;
  r0.yzw = r2.xyz * r0.zzz;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_131_CB3((uint)(12)).w * r0.x;
  r0.y = r1.w * r1.w;
  r0.xzw = r0.xxx * BA_Fragment_131_CB3((uint)(11)).xyz + BA_Fragment_131_CB3((uint)(10)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_131_CB3((uint)(12)).xyz + r0.xzw;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_131_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_131_CB0((uint)(56)).xyz;
  o0.w = r2.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_132_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_132_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_132_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_132_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  float3 v7 : TEXCOORD8,
  uint v8 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v8.x & 0x3f800000u);
  r0.y = 333.333344 * v6.w;
  r0.z = cmp(r0.y >= -r0.y);
  r0.y = frac(abs(r0.y));
  r0.y = r0.z ? r0.y : -r0.y;
  r0.y = 0.00300000003 * r0.y;
  r0.y = -BA_Fragment_132_CB3((uint)(15)).x * 0.00300000003 + abs(r0.y);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_132_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_132_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v8.xx ? float2(1,0) : float2(-1,1);
  r2.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_132_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r2.xyz, BA_Fragment_132_CB0((uint)(126)).xyz);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_132_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_132_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_132_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_132_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_132_CB2((uint)(11)).y, BA_Fragment_132_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_132_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v7.xyz * BA_Fragment_132_CB1((uint)(r5.w+0)).www + BA_Fragment_132_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_132_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_132_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_132_CB1((uint)(r5.w+512)).z + BA_Fragment_132_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_132_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r2.xyz);
    r6.x = r3.y * BA_Fragment_132_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_132_CB3((uint)(15)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_132_CB3((uint)(15)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_132_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r2.w * BA_Fragment_132_CB3((uint)(2)).z + -BA_Fragment_132_CB3((uint)(3)).x);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_132_CB3((uint)(2)).w * r0.y;
  r4.w = 1 + -BA_Fragment_132_CB3((uint)(2)).y;
  r6.xyz = BA_Fragment_132_CB0((uint)(126)).xyz * BA_Fragment_132_CB3((uint)(1)).xxx + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r2.x = saturate(dot(r2.xyz, r6.xyz));
  r2.x = log2(r2.x);
  r2.x = BA_Fragment_132_CB3((uint)(1)).y * r2.x;
  r2.x = exp2(r2.x);
  r2.x = saturate(r3.y * BA_Fragment_132_CB3((uint)(6)).x + r2.x);
  r2.y = -0.5 + r2.x;
  r2.y = saturate(10 * r2.y);
  r2.y = BA_Fragment_132_CB3((uint)(2)).y * r2.y;
  r2.x = r4.w * r2.x + r2.y;
  r2.y = saturate(r2.w);
  r2.y = log2(r2.y);
  r2.y = BA_Fragment_132_CB3((uint)(1)).w * r2.y;
  r2.y = exp2(r2.y);
  r2.y = saturate(r3.y * BA_Fragment_132_CB3((uint)(6)).x + r2.y);
  r2.z = 4000 * r2.y;
  r2.z = min(1, r2.z);
  r2.z = BA_Fragment_132_CB3((uint)(2)).y * r2.z;
  r2.y = r4.w * r2.y + r2.z;
  r2.z = BA_Fragment_132_CB3((uint)(2)).x * r2.y;
  r3.y = BA_Fragment_132_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_132_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_132_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r2.z = r2.x * BA_Fragment_132_CB3((uint)(1)).z + r2.z;
  r2.z = BA_Fragment_132_CB3((uint)(0)).w + r2.z;
  r3.yzw = r2.zzz * BA_Fragment_132_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_132_CB3((uint)(2)).w + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r2.x * BA_Fragment_132_CB3((uint)(1)).z + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r2.y * BA_Fragment_132_CB3((uint)(2)).x + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_132_CB3((uint)(5)).w * r0.y;
  r2.xyz = BA_Fragment_132_CB3((uint)(5)).xyz * BA_Fragment_132_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r2.xyz = r0.yyy * r2.xyz + float3(1,1,1);
  r2.xyz = r3.yzw * r2.xyz;
  r2.xyz = r2.xyz * r1.xyz + r6.xyz;
  r1.xyz = BA_Fragment_132_CB3((uint)(0)).xyz * r1.xyz;
  r1.xyz = r1.xyz * r5.yyy;
  r1.xyz = v5.xyz * r1.xyz;
  r0.yzw = r1.xyz * r0.zzz;
  r0.xyz = r0.xxx * r2.xyz + r0.yzw;
  r0.w = r2.w * r2.w;
  r0.xyz = r0.xyz * BA_Fragment_132_CB3((uint)(13)).xyz + BA_Fragment_132_CB3((uint)(12)).xyz;
  r0.xyz = r0.www * BA_Fragment_132_CB3((uint)(14)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_132_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_132_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GRAYSCALE_MODE)
float4 BA_Fragment_133_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 15u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_133_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_133_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_133_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  float3 v7 : TEXCOORD8,
  uint v8 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v8.x & 0x3f800000u);
  r0.y = 333.333344 * v6.w;
  r0.z = cmp(r0.y >= -r0.y);
  r0.y = frac(abs(r0.y));
  r0.y = r0.z ? r0.y : -r0.y;
  r0.y = 0.00300000003 * r0.y;
  r0.y = -BA_Fragment_133_CB3((uint)(15)).x * 0.00300000003 + abs(r0.y);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_133_CB0((uint)(19)).x).xyzw;
  r2.xyzw = BA_Fragment_133_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.z = -BA_Fragment_133_CB3((uint)(0)).x + r1.w;
  r0.y = min(r0.y, r0.z);
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v8.xx ? float2(1,0) : float2(-1,1);
  r1.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_133_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r1.xyz, BA_Fragment_133_CB0((uint)(126)).xyz);
  r0.w = dot(r1.xyz, v4.xyz);
  r1.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_133_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_133_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_133_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_133_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_133_CB2((uint)(11)).y, BA_Fragment_133_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_133_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v7.xyz * BA_Fragment_133_CB1((uint)(r5.w+0)).www + BA_Fragment_133_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_133_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_133_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_133_CB1((uint)(r5.w+512)).z + BA_Fragment_133_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_133_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r1.xyz);
    r6.x = r3.y * BA_Fragment_133_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_133_CB3((uint)(15)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_133_CB3((uint)(15)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_133_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r1.w * BA_Fragment_133_CB3((uint)(2)).w + -BA_Fragment_133_CB3((uint)(3)).y);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_133_CB3((uint)(3)).x * r0.y;
  r4.w = 1 + -BA_Fragment_133_CB3((uint)(2)).z;
  r6.xyz = BA_Fragment_133_CB0((uint)(126)).xyz * BA_Fragment_133_CB3((uint)(1)).yyy + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r1.x = saturate(dot(r1.xyz, r6.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_133_CB3((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = saturate(r3.y * BA_Fragment_133_CB3((uint)(6)).x + r1.x);
  r1.y = -0.5 + r1.x;
  r1.y = saturate(10 * r1.y);
  r1.y = BA_Fragment_133_CB3((uint)(2)).z * r1.y;
  r1.x = r4.w * r1.x + r1.y;
  r1.y = saturate(r1.w);
  r1.y = log2(r1.y);
  r1.y = BA_Fragment_133_CB3((uint)(2)).x * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(r3.y * BA_Fragment_133_CB3((uint)(6)).x + r1.y);
  r1.z = 4000 * r1.y;
  r1.z = min(1, r1.z);
  r1.z = BA_Fragment_133_CB3((uint)(2)).z * r1.z;
  r1.y = r4.w * r1.y + r1.z;
  r1.z = BA_Fragment_133_CB3((uint)(2)).y * r1.y;
  r3.y = BA_Fragment_133_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_133_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_133_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r1.z = r1.x * BA_Fragment_133_CB3((uint)(1)).w + r1.z;
  r1.z = BA_Fragment_133_CB3((uint)(1)).x + r1.z;
  r3.yzw = r1.zzz * BA_Fragment_133_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_133_CB3((uint)(3)).x + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r1.x * BA_Fragment_133_CB3((uint)(1)).w + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r1.y * BA_Fragment_133_CB3((uint)(2)).y + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_133_CB3((uint)(5)).w * r0.y;
  r1.xyz = BA_Fragment_133_CB3((uint)(5)).xyz * BA_Fragment_133_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.xyz = r0.yyy * r1.xyz + float3(1,1,1);
  r1.xyz = r3.yzw * r1.xyz;
  r1.xyz = r1.xyz * r2.xyz + r6.xyz;
  r2.xyz = BA_Fragment_133_CB3((uint)(0)).yzw * r2.xyz;
  r2.xyz = r2.xyz * r5.yyy;
  r2.xyz = v5.xyz * r2.xyz;
  r0.yzw = r2.xyz * r0.zzz;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.w = r1.w * r1.w;
  r0.xyz = r0.xyz * BA_Fragment_133_CB3((uint)(13)).xyz + BA_Fragment_133_CB3((uint)(12)).xyz;
  r0.xyz = r0.www * BA_Fragment_133_CB3((uint)(14)).xyz + r0.xyz;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_133_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_133_CB0((uint)(56)).xyz;
  o0.w = r2.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_134_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z, _BaseBrightness);
  if (i == 1u) value = float4(_ViewOffset, _ViewPower, _ViewStrength, _InvViewPower);
  if (i == 2u) value = float4(_InvViewStrength, _ViewLightEdge, _RimAreaMultiplier, _RimStrength);
  if (i == 3u) value = float4(_RimAreaLeveler, 0.0, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 15u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_134_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_134_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_134_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  float3 v7 : TEXCOORD8,
  uint v8 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v8.x & 0x3f800000u);
  r0.y = 333.333344 * v6.w;
  r0.z = cmp(r0.y >= -r0.y);
  r0.y = frac(abs(r0.y));
  r0.y = r0.z ? r0.y : -r0.y;
  r0.y = 0.00300000003 * r0.y;
  r0.y = -BA_Fragment_134_CB3((uint)(15)).x * 0.00300000003 + abs(r0.y);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_134_CB0((uint)(19)).x).xyzw;
  r1.xyzw = BA_Fragment_134_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v8.xx ? float2(1,0) : float2(-1,1);
  r2.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_134_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r2.xyz, BA_Fragment_134_CB0((uint)(126)).xyz);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_134_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_134_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_134_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_134_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_134_CB2((uint)(11)).y, BA_Fragment_134_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_134_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v7.xyz * BA_Fragment_134_CB1((uint)(r5.w+0)).www + BA_Fragment_134_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_134_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_134_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_134_CB1((uint)(r5.w+512)).z + BA_Fragment_134_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_134_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r2.xyz);
    r6.x = r3.y * BA_Fragment_134_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_134_CB3((uint)(15)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_134_CB3((uint)(15)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_134_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r2.w * BA_Fragment_134_CB3((uint)(2)).z + -BA_Fragment_134_CB3((uint)(3)).x);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_134_CB3((uint)(2)).w * r0.y;
  r4.w = 1 + -BA_Fragment_134_CB3((uint)(2)).y;
  r6.xyz = BA_Fragment_134_CB0((uint)(126)).xyz * BA_Fragment_134_CB3((uint)(1)).xxx + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r2.x = saturate(dot(r2.xyz, r6.xyz));
  r2.x = log2(r2.x);
  r2.x = BA_Fragment_134_CB3((uint)(1)).y * r2.x;
  r2.x = exp2(r2.x);
  r2.x = saturate(r3.y * BA_Fragment_134_CB3((uint)(6)).x + r2.x);
  r2.y = -0.5 + r2.x;
  r2.y = saturate(10 * r2.y);
  r2.y = BA_Fragment_134_CB3((uint)(2)).y * r2.y;
  r2.x = r4.w * r2.x + r2.y;
  r2.y = saturate(r2.w);
  r2.y = log2(r2.y);
  r2.y = BA_Fragment_134_CB3((uint)(1)).w * r2.y;
  r2.y = exp2(r2.y);
  r2.y = saturate(r3.y * BA_Fragment_134_CB3((uint)(6)).x + r2.y);
  r2.z = 4000 * r2.y;
  r2.z = min(1, r2.z);
  r2.z = BA_Fragment_134_CB3((uint)(2)).y * r2.z;
  r2.y = r4.w * r2.y + r2.z;
  r2.z = BA_Fragment_134_CB3((uint)(2)).x * r2.y;
  r3.y = BA_Fragment_134_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_134_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_134_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r2.z = r2.x * BA_Fragment_134_CB3((uint)(1)).z + r2.z;
  r2.z = BA_Fragment_134_CB3((uint)(0)).w + r2.z;
  r3.yzw = r2.zzz * BA_Fragment_134_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_134_CB3((uint)(2)).w + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r2.x * BA_Fragment_134_CB3((uint)(1)).z + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r2.y * BA_Fragment_134_CB3((uint)(2)).x + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_134_CB3((uint)(5)).w * r0.y;
  r2.xyz = BA_Fragment_134_CB3((uint)(5)).xyz * BA_Fragment_134_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r2.xyz = r0.yyy * r2.xyz + float3(1,1,1);
  r2.xyz = r3.yzw * r2.xyz;
  r2.xyz = r2.xyz * r1.xyz + r6.xyz;
  r1.xyz = BA_Fragment_134_CB3((uint)(0)).xyz * r1.xyz;
  r1.xyz = r1.xyz * r5.yyy;
  r1.xyz = v5.xyz * r1.xyz;
  r0.yzw = r1.xyz * r0.zzz;
  r0.xyz = r0.xxx * r2.xyz + r0.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_134_CB3((uint)(14)).w * r0.x;
  r0.y = r2.w * r2.w;
  r0.xzw = r0.xxx * BA_Fragment_134_CB3((uint)(13)).xyz + BA_Fragment_134_CB3((uint)(12)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_134_CB3((uint)(14)).xyz + r0.xzw;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_134_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_134_CB0((uint)(56)).xyz;
  o0.w = r1.w;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_CHAR_CUTOUT_MODE) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GRAYSCALE_MODE)
float4 BA_Fragment_135_CB3(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Cutoff, _TwoSideTint.x, _TwoSideTint.y, _TwoSideTint.z);
  if (i == 1u) value = float4(_BaseBrightness, _ViewOffset, _ViewPower, _ViewStrength);
  if (i == 2u) value = float4(_InvViewPower, _InvViewStrength, _ViewLightEdge, _RimAreaMultiplier);
  if (i == 3u) value = float4(_RimStrength, _RimAreaLeveler, 0.0, 0.0);
  if (i == 4u) value = float4(_GlowTint.x, _GlowTint.y, _GlowTint.z, _GlowStrength);
  if (i == 5u) value = float4(_InlineTint.x, _InlineTint.y, _InlineTint.z, _InlineAmount);
  if (i == 6u) value = float4(_MaskGSensitivity, 0.0, 0.0, 0.0);
  if (i == 7u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 12u) value = float4(_CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z, 0.0);
  if (i == 13u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 14u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _GrayBrightness);
  if (i == 15u) value = float4(_DitherThreshold, _AdditionalLightSharpness, _AdditionalLightStrength, 0.0);
  return value;
}

float4 BA_Fragment_135_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_135_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_135_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightDir.x, _MxCharLightDir.y, _MxCharLightDir.z, 0.0);
  if (i == 127u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 129u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD7,
  float3 v7 : TEXCOORD8,
  uint v8 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = asfloat((uint)v8.x & 0x3f800000u);
  r0.y = 333.333344 * v6.w;
  r0.z = cmp(r0.y >= -r0.y);
  r0.y = frac(abs(r0.y));
  r0.y = r0.z ? r0.y : -r0.y;
  r0.y = 0.00300000003 * r0.y;
  r0.y = -BA_Fragment_135_CB3((uint)(15)).x * 0.00300000003 + abs(r0.y);
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_135_CB0((uint)(19)).x).xyzw;
  r2.xyzw = BA_Fragment_135_CB3((uint)(7)).xyzw * r1.xyzw;
  r0.z = -BA_Fragment_135_CB3((uint)(0)).x + r1.w;
  r0.y = min(r0.y, r0.z);
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yz = v8.xx ? float2(1,0) : float2(-1,1);
  r1.xyz = v3.xyz * r0.yyy;
  r3.xyzw = _MaskTex.SampleBias(sampler_MaskTex, v1.xy, BA_Fragment_135_CB0((uint)(19)).x).xyzw;
  r0.y = dot(r1.xyz, BA_Fragment_135_CB0((uint)(126)).xyz);
  r0.w = dot(r1.xyz, v4.xyz);
  r1.w = 1 + -r0.w;
  r3.y = -r3.y * 2 + 1;
  r0.w = r0.w * 0.769999981 + r0.y;
  r0.w = r3.y * BA_Fragment_135_CB3((uint)(6)).x + r0.w;
  r0.w = -v5.w + r0.w;
  r0.w = saturate(-10 * r0.w);
  r4.xyz = -BA_Fragment_135_CB0((uint)(127)).xyz + v5.xyz;
  r4.xyz = r0.www * r4.xyz + BA_Fragment_135_CB0((uint)(127)).xyz;
  r4.xyz = r4.xyz * BA_Fragment_135_CB0((uint)(129)).xxx + v2.xyz;
  r3.w = min(BA_Fragment_135_CB2((uint)(11)).y, BA_Fragment_135_CB0((uint)(10)).x);
  r3.w = (int)r3.w;
  r5.xyz = float3(0,0,0);
  r4.w = 0;
  while (true) {
    r5.w = cmp((int)r4.w >= (int)r3.w);
    if (r5.w != 0) break;
    r5.w = (uint)r4.w >> 2;
    r6.x = (int)r4.w & 3;
    r5.w = dot(BA_Fragment_135_CB2((uint)(r5.w+12)).xyzw, icb[r6.x+0].xyzw);
    r5.w = (int)r5.w;
    r6.xyz = -v7.xyz * BA_Fragment_135_CB1((uint)(r5.w+0)).www + BA_Fragment_135_CB1((uint)(r5.w+0)).xyz;
    r6.w = dot(r6.xyz, r6.xyz);
    r6.w = max(6.10351563e-005, r6.w);
    r7.x = rsqrt(r6.w);
    r6.xyz = r7.xxx * r6.xyz;
    r7.x = 1 / r6.w;
    r6.w = BA_Fragment_135_CB1((uint)(r5.w+512)).x * r6.w;
    r6.w = -r6.w * r6.w + 1;
    r6.w = max(0, r6.w);
    r6.w = r6.w * r6.w;
    r6.w = r7.x * r6.w;
    r7.x = dot(BA_Fragment_135_CB1((uint)(r5.w+768)).xyz, r6.xyz);
    r7.x = saturate(r7.x * BA_Fragment_135_CB1((uint)(r5.w+512)).z + BA_Fragment_135_CB1((uint)(r5.w+512)).w);
    r7.x = r7.x * r7.x;
    r6.w = r7.x * r6.w;
    r7.xyz = BA_Fragment_135_CB1((uint)(r5.w+256)).xyz * r6.www;
    r5.w = dot(r6.xyz, r1.xyz);
    r6.x = r3.y * BA_Fragment_135_CB3((uint)(6)).x + r5.w;
    r5.w = saturate(r6.x * BA_Fragment_135_CB3((uint)(15)).y + r5.w);
    r5.xyz = r5.www * r7.xyz + r5.xyz;
    r4.w = (int)r4.w + 1;
  }
  r4.xyz = r5.xyz * BA_Fragment_135_CB3((uint)(15)).zzz + r4.xyz;
  r5.xy = r0.yy * float2(4,0.330000013) + float2(0.25,0.5);
  r5.x = saturate(r5.x);
  r0.y = r5.x * 0.399999976 + 0.300000012;
  r5.xzw = BA_Fragment_135_CB0((uint)(127)).xyz * r0.yyy;
  r0.y = saturate(r1.w * BA_Fragment_135_CB3((uint)(2)).w + -BA_Fragment_135_CB3((uint)(3)).y);
  r0.y = v3.w * r0.y;
  r3.w = BA_Fragment_135_CB3((uint)(3)).x * r0.y;
  r4.w = 1 + -BA_Fragment_135_CB3((uint)(2)).z;
  r6.xyz = BA_Fragment_135_CB0((uint)(126)).xyz * BA_Fragment_135_CB3((uint)(1)).yyy + v4.xyz;
  r6.w = dot(r6.xyz, r6.xyz);
  r6.w = max(1.17549435e-038, r6.w);
  r6.w = rsqrt(r6.w);
  r6.xyz = r6.xyz * r6.www;
  r1.x = saturate(dot(r1.xyz, r6.xyz));
  r1.x = log2(r1.x);
  r1.x = BA_Fragment_135_CB3((uint)(1)).z * r1.x;
  r1.x = exp2(r1.x);
  r1.x = saturate(r3.y * BA_Fragment_135_CB3((uint)(6)).x + r1.x);
  r1.y = -0.5 + r1.x;
  r1.y = saturate(10 * r1.y);
  r1.y = BA_Fragment_135_CB3((uint)(2)).z * r1.y;
  r1.x = r4.w * r1.x + r1.y;
  r1.y = saturate(r1.w);
  r1.y = log2(r1.y);
  r1.y = BA_Fragment_135_CB3((uint)(2)).x * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(r3.y * BA_Fragment_135_CB3((uint)(6)).x + r1.y);
  r1.z = 4000 * r1.y;
  r1.z = min(1, r1.z);
  r1.z = BA_Fragment_135_CB3((uint)(2)).z * r1.z;
  r1.y = r4.w * r1.y + r1.z;
  r1.z = BA_Fragment_135_CB3((uint)(2)).y * r1.y;
  r3.y = BA_Fragment_135_CB3((uint)(4)).w * r3.z;
  r6.xyz = BA_Fragment_135_CB3((uint)(4)).xyz * r3.yyy;
  r3.y = BA_Fragment_135_CB0((uint)(129)).x * r3.w;
  r3.yzw = r3.yyy * r5.xzw + r4.xyz;
  r1.z = r1.x * BA_Fragment_135_CB3((uint)(1)).w + r1.z;
  r1.z = BA_Fragment_135_CB3((uint)(1)).x + r1.z;
  r3.yzw = r1.zzz * BA_Fragment_135_CB0((uint)(127)).xyz + r3.yzw;
  r0.w = r3.x * r0.w;
  r0.y = saturate(-r0.y * BA_Fragment_135_CB3((uint)(3)).x + 1);
  r0.y = r0.w * r0.y;
  r0.w = saturate(-r1.x * BA_Fragment_135_CB3((uint)(1)).w + 1);
  r0.y = r0.y * r0.w;
  r0.w = saturate(-r1.y * BA_Fragment_135_CB3((uint)(2)).y + 1);
  r0.y = r0.y * r0.w;
  r0.y = BA_Fragment_135_CB3((uint)(5)).w * r0.y;
  r1.xyz = BA_Fragment_135_CB3((uint)(5)).xyz * BA_Fragment_135_CB0((uint)(6)).xyz + float3(-1,-1,-1);
  r1.xyz = r0.yyy * r1.xyz + float3(1,1,1);
  r1.xyz = r3.yzw * r1.xyz;
  r1.xyz = r1.xyz * r2.xyz + r6.xyz;
  r2.xyz = BA_Fragment_135_CB3((uint)(0)).yzw * r2.xyz;
  r2.xyz = r2.xyz * r5.yyy;
  r2.xyz = v5.xyz * r2.xyz;
  r0.yzw = r2.xyz * r0.zzz;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.x = BA_Fragment_135_CB3((uint)(14)).w * r0.x;
  r0.y = r1.w * r1.w;
  r0.xzw = r0.xxx * BA_Fragment_135_CB3((uint)(13)).xyz + BA_Fragment_135_CB3((uint)(12)).xyz;
  r0.xyz = r0.yyy * BA_Fragment_135_CB3((uint)(14)).xyz + r0.xzw;
  r0.w = exp2(-v2.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_135_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_135_CB0((uint)(56)).xyz;
  o0.w = r2.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
