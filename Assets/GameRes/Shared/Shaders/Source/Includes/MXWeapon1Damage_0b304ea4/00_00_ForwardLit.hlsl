// Exact names and types from the original compiled parameter metadata.
float _AdditionalLightSharpness;
float _AdditionalLightStrength;
float4 _CodeAddColor;
float4 _CodeAddRimColor;
float4 _CodeMultiplyColor;
float4 _Color;
float _CrushScale;
float _Damage;
float _DitherThreshold;
float4 _DmgCol;
float4 _FakeLightDir;
float _Fire;
float _FireBackCol_Str;
float4 _FireCol;
float _FireValue;
float4 _GlowMaskColor0;
float _GlowStrength0;
float _GlowStrictness0;
float4 _GlowTint0;
float _LightStrong;
float _LightValue;
float4 _MxCharLightData;
float3 _MxCharLightTone;
float3 _MxCharShadowTone;
float _NoiseColStrong;
float4 _NoiseDir;
float4 _NoiseTex_ST;
float _ShadowStrong;
float _ShadowThreshold;
float4 _ShadowTint;
float4 _SpecColor;
float _SpecStrong;
float4 _mainTex_ST;
Texture2D<float4> _NoiseTex;
Texture2D<float4> _mainTex;
Texture2D<float4> _sourceTex;
SamplerState sampler_NoiseTex;
SamplerState sampler_mainTex;
SamplerState sampler_sourceTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_6_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_6_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_6_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_6_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_6_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_6_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_6_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_6_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_6_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_6_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_6_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_6_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_6_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_6_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r1.xyz);
  p1.x = dot(r2.xyz, r0.xyz);
  o1.xy = v2.xy * BA_Vertex_6_CB0((uint)(139)).xy + BA_Vertex_6_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_6_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_6_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_6_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_6_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_6_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_6_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_6_CB1((uint)(27)).xyzw, r2.xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o4.w = 0;
  o5.xyz = BA_Vertex_6_CB0((uint)(133)).xyz * BA_Vertex_6_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 25u) value = float4(unity_SHAr.x, unity_SHAr.y, unity_SHAr.z, unity_SHAr.w);
  if (i == 26u) value = float4(unity_SHAg.x, unity_SHAg.y, unity_SHAg.z, unity_SHAg.w);
  if (i == 27u) value = float4(unity_SHAb.x, unity_SHAb.y, unity_SHAb.z, unity_SHAb.w);
  if (i == 28u) value = float4(unity_SHBr.x, unity_SHBr.y, unity_SHBr.z, unity_SHBr.w);
  if (i == 29u) value = float4(unity_SHBg.x, unity_SHBg.y, unity_SHBg.z, unity_SHBg.w);
  if (i == 30u) value = float4(unity_SHBb.x, unity_SHBb.y, unity_SHBb.z, unity_SHBb.w);
  if (i == 31u) value = float4(unity_SHC.x, unity_SHC.y, unity_SHC.z, unity_SHC.w);
  return value;
}

float4 BA_Vertex_7_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float3 o6 : TEXCOORD4)
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

  r0.xyz = BA_Vertex_7_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_7_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_7_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_7_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_7_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_7_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_7_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_7_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_7_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_7_CB0((uint)(139)).xy + BA_Vertex_7_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_7_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_7_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_7_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_7_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_7_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_7_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_7_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_7_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_7_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_7_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  o4.w = 0;
  r0.w = BA_Vertex_7_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_7_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  o5.x = dot(r2.xyz, r0.xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o6.xyz = BA_Vertex_7_CB0((uint)(133)).xyz * BA_Vertex_7_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
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
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_8_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_8_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_8_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_8_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r1.xyz);
  p1.x = dot(r2.xyz, r0.xyz);
  o1.xy = v2.xy * BA_Vertex_8_CB0((uint)(139)).xy + BA_Vertex_8_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_8_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_8_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_8_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_8_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_8_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_8_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_8_CB1((uint)(27)).xyzw, r2.xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o4.w = 0;
  o5.xyz = BA_Vertex_8_CB0((uint)(133)).xyz * BA_Vertex_8_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float3 o6 : TEXCOORD4)
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

  r0.xyz = BA_Vertex_9_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_9_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_9_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_9_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_9_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_9_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_9_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_9_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_9_CB0((uint)(139)).xy + BA_Vertex_9_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_9_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_9_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_9_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_9_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_9_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_9_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_9_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_9_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_9_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_9_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  o4.w = 0;
  r0.w = BA_Vertex_9_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_9_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  o5.x = dot(r2.xyz, r0.xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o6.xyz = BA_Vertex_9_CB0((uint)(133)).xyz * BA_Vertex_9_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float2 o6 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_10_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_10_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_10_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_10_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_10_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_10_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_10_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_10_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_10_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_10_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_10_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_10_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_10_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_10_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_10_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_10_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r1.xyz);
  p1.x = dot(r2.xyz, r0.xyz);
  o1.xy = v2.xy * BA_Vertex_10_CB0((uint)(139)).xy + BA_Vertex_10_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_10_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_10_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_10_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_10_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_10_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_10_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_10_CB1((uint)(27)).xyzw, r2.xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o4.w = 0;
  o5.xyz = BA_Vertex_10_CB0((uint)(133)).xyz * BA_Vertex_10_CB0((uint)(127)).xyz;
  o6.xy = v3.xy * BA_Vertex_10_CB0((uint)(147)).xy + BA_Vertex_10_CB0((uint)(147)).zw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD5,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float3 o6 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_11_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_11_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_11_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_11_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_11_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_11_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_11_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_11_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_11_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_11_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_11_CB0((uint)(139)).xy + BA_Vertex_11_CB0((uint)(139)).zw;
  p1.xy = v3.xy * BA_Vertex_11_CB0((uint)(147)).xy + BA_Vertex_11_CB0((uint)(147)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_11_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_11_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_11_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_11_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_11_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_11_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_11_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_11_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_11_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_11_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  o4.w = 0;
  r0.w = BA_Vertex_11_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_11_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  o5.x = dot(r2.xyz, r0.xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o6.xyz = BA_Vertex_11_CB0((uint)(133)).xyz * BA_Vertex_11_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float2 o6 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_12_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_12_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_12_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_12_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_12_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_12_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_12_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_12_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_12_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_12_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_12_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_12_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_12_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_12_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_12_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_12_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r1.xyz);
  p1.x = dot(r2.xyz, r0.xyz);
  o1.xy = v2.xy * BA_Vertex_12_CB0((uint)(139)).xy + BA_Vertex_12_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_12_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_12_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_12_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_12_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_12_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_12_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_12_CB1((uint)(27)).xyzw, r2.xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o4.w = 0;
  o5.xyz = BA_Vertex_12_CB0((uint)(133)).xyz * BA_Vertex_12_CB0((uint)(127)).xyz;
  o6.xy = v3.xy * BA_Vertex_12_CB0((uint)(147)).xy + BA_Vertex_12_CB0((uint)(147)).zw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD5,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float3 o6 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_13_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_13_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_13_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_13_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_13_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_13_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_13_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_13_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_13_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_13_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_13_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_13_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_13_CB0((uint)(139)).xy + BA_Vertex_13_CB0((uint)(139)).zw;
  p1.xy = v3.xy * BA_Vertex_13_CB0((uint)(147)).xy + BA_Vertex_13_CB0((uint)(147)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_13_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_13_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_13_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_13_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_13_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_13_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_13_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_13_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_13_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_13_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  o4.w = 0;
  r0.w = BA_Vertex_13_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_13_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  o5.x = dot(r2.xyz, r0.xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o6.xyz = BA_Vertex_13_CB0((uint)(133)).xyz * BA_Vertex_13_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_14_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_14_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_14_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_14_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_14_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_14_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_14_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_14_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_14_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_14_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_14_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = saturate(r0.w * BA_Vertex_14_CB0((uint)(55)).z + BA_Vertex_14_CB0((uint)(55)).w);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_14_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_14_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_14_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_14_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r1.xyz);
  p1.x = dot(r2.xyz, r0.xyz);
  o1.xy = v2.xy * BA_Vertex_14_CB0((uint)(139)).xy + BA_Vertex_14_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_14_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_14_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_14_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_14_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_14_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_14_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_14_CB1((uint)(27)).xyzw, r2.xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_14_CB0((uint)(133)).xyz * BA_Vertex_14_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float3 o6 : TEXCOORD4)
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

  r0.xyz = BA_Vertex_15_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_15_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_15_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_15_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_15_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_15_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_15_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_15_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_15_CB0((uint)(139)).xy + BA_Vertex_15_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_15_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_15_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_15_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_15_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_15_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_15_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_15_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_15_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_15_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_15_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_15_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_15_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = saturate(r0.w * BA_Vertex_15_CB0((uint)(55)).z + BA_Vertex_15_CB0((uint)(55)).w);
  r0.w = BA_Vertex_15_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_15_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  o5.x = dot(r2.xyz, r0.xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o6.xyz = BA_Vertex_15_CB0((uint)(133)).xyz * BA_Vertex_15_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
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
  o4.w = saturate(r0.w * BA_Vertex_16_CB0((uint)(55)).z + BA_Vertex_16_CB0((uint)(55)).w);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_16_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_16_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_16_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_16_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r1.xyz);
  p1.x = dot(r2.xyz, r0.xyz);
  o1.xy = v2.xy * BA_Vertex_16_CB0((uint)(139)).xy + BA_Vertex_16_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_16_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_16_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_16_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_16_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_16_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_16_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_16_CB1((uint)(27)).xyzw, r2.xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_16_CB0((uint)(133)).xyz * BA_Vertex_16_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float3 o6 : TEXCOORD4)
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
  o1.xy = v2.xy * BA_Vertex_17_CB0((uint)(139)).xy + BA_Vertex_17_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_17_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_17_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_17_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_17_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_17_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_17_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_17_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_17_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_17_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_17_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_17_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_17_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = saturate(r0.w * BA_Vertex_17_CB0((uint)(55)).z + BA_Vertex_17_CB0((uint)(55)).w);
  r0.w = BA_Vertex_17_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_17_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  o5.x = dot(r2.xyz, r0.xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o6.xyz = BA_Vertex_17_CB0((uint)(133)).xyz * BA_Vertex_17_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float2 o6 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_18_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_18_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_18_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_18_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_18_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_18_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
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
  o4.w = saturate(r0.w * BA_Vertex_18_CB0((uint)(55)).z + BA_Vertex_18_CB0((uint)(55)).w);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_18_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_18_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_18_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_18_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r1.xyz);
  p1.x = dot(r2.xyz, r0.xyz);
  o1.xy = v2.xy * BA_Vertex_18_CB0((uint)(139)).xy + BA_Vertex_18_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_18_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_18_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_18_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_18_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_18_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_18_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_18_CB1((uint)(27)).xyzw, r2.xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_18_CB0((uint)(133)).xyz * BA_Vertex_18_CB0((uint)(127)).xyz;
  o6.xy = v3.xy * BA_Vertex_18_CB0((uint)(147)).xy + BA_Vertex_18_CB0((uint)(147)).zw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD5,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float3 o6 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_19_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_19_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_19_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_19_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_19_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_19_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_19_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_19_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_19_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_19_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_19_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_19_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_19_CB0((uint)(139)).xy + BA_Vertex_19_CB0((uint)(139)).zw;
  p1.xy = v3.xy * BA_Vertex_19_CB0((uint)(147)).xy + BA_Vertex_19_CB0((uint)(147)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.w = r1.z / BA_Vertex_19_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_19_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = saturate(r0.w * BA_Vertex_19_CB0((uint)(55)).z + BA_Vertex_19_CB0((uint)(55)).w);
  r2.x = dot(v1.xyz, BA_Vertex_19_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_19_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_19_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_19_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_19_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_19_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_19_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_19_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_19_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_19_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = BA_Vertex_19_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_19_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  o5.x = dot(r2.xyz, r0.xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o6.xyz = BA_Vertex_19_CB0((uint)(133)).xyz * BA_Vertex_19_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float2 o6 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_20_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_20_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_20_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_20_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_20_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_20_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_20_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_20_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_20_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_20_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_20_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_20_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_20_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_20_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = saturate(r0.w * BA_Vertex_20_CB0((uint)(55)).z + BA_Vertex_20_CB0((uint)(55)).w);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_20_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_20_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_20_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_20_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r1.xyz);
  p1.x = dot(r2.xyz, r0.xyz);
  o1.xy = v2.xy * BA_Vertex_20_CB0((uint)(139)).xy + BA_Vertex_20_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_20_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_20_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_20_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_20_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_20_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_20_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_20_CB1((uint)(27)).xyzw, r2.xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_20_CB0((uint)(133)).xyz * BA_Vertex_20_CB0((uint)(127)).xyz;
  o6.xy = v3.xy * BA_Vertex_20_CB0((uint)(147)).xy + BA_Vertex_20_CB0((uint)(147)).zw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD5,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float3 o6 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_21_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_21_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_21_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_21_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_21_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_21_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_21_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_21_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_21_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_21_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_21_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_21_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_21_CB0((uint)(139)).xy + BA_Vertex_21_CB0((uint)(139)).zw;
  p1.xy = v3.xy * BA_Vertex_21_CB0((uint)(147)).xy + BA_Vertex_21_CB0((uint)(147)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.w = r1.z / BA_Vertex_21_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_21_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = saturate(r0.w * BA_Vertex_21_CB0((uint)(55)).z + BA_Vertex_21_CB0((uint)(55)).w);
  r2.x = dot(v1.xyz, BA_Vertex_21_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_21_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_21_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_21_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_21_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_21_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_21_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_21_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_21_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_21_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = BA_Vertex_21_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_21_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  o5.x = dot(r2.xyz, r0.xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o6.xyz = BA_Vertex_21_CB0((uint)(133)).xyz * BA_Vertex_21_CB0((uint)(127)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_22_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_22_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_22_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_22_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_22_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_22_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_22_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_22_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_22_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_22_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_22_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = BA_Vertex_22_CB0((uint)(55)).x * r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_22_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_22_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_22_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_22_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r1.xyz);
  p1.x = dot(r2.xyz, r0.xyz);
  o1.xy = v2.xy * BA_Vertex_22_CB0((uint)(139)).xy + BA_Vertex_22_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_22_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_22_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_22_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_22_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_22_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_22_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_22_CB1((uint)(27)).xyzw, r2.xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_22_CB0((uint)(133)).xyz * BA_Vertex_22_CB0((uint)(127)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float3 o6 : TEXCOORD4)
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

  r0.xyz = BA_Vertex_23_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_23_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_23_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_23_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_23_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_23_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_23_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_23_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_23_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_23_CB0((uint)(139)).xy + BA_Vertex_23_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_23_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_23_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_23_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_23_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_23_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_23_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_23_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_23_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_23_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_23_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_23_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_23_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = BA_Vertex_23_CB0((uint)(55)).x * r0.w;
  r0.w = BA_Vertex_23_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_23_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  o5.x = dot(r2.xyz, r0.xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o6.xyz = BA_Vertex_23_CB0((uint)(133)).xyz * BA_Vertex_23_CB0((uint)(127)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float3 o5 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
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
  o4.w = BA_Vertex_24_CB0((uint)(55)).x * r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_24_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_24_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_24_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_24_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r1.xyz);
  p1.x = dot(r2.xyz, r0.xyz);
  o1.xy = v2.xy * BA_Vertex_24_CB0((uint)(139)).xy + BA_Vertex_24_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_24_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_24_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_24_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_24_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_24_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_24_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_24_CB1((uint)(27)).xyzw, r2.xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_24_CB0((uint)(133)).xyz * BA_Vertex_24_CB0((uint)(127)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float3 o6 : TEXCOORD4)
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
  o1.xy = v2.xy * BA_Vertex_25_CB0((uint)(139)).xy + BA_Vertex_25_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_25_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_25_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_25_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_25_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_25_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_25_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_25_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_25_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_25_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_25_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_25_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_25_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = BA_Vertex_25_CB0((uint)(55)).x * r0.w;
  r0.w = BA_Vertex_25_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_25_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  o5.x = dot(r2.xyz, r0.xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o6.xyz = BA_Vertex_25_CB0((uint)(133)).xyz * BA_Vertex_25_CB0((uint)(127)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float2 o6 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_26_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_26_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_26_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_26_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_26_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_26_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
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
  o4.w = BA_Vertex_26_CB0((uint)(55)).x * r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_26_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_26_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_26_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_26_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r1.xyz);
  p1.x = dot(r2.xyz, r0.xyz);
  o1.xy = v2.xy * BA_Vertex_26_CB0((uint)(139)).xy + BA_Vertex_26_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_26_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_26_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_26_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_26_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_26_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_26_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_26_CB1((uint)(27)).xyzw, r2.xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_26_CB0((uint)(133)).xyz * BA_Vertex_26_CB0((uint)(127)).xyz;
  o6.xy = v3.xy * BA_Vertex_26_CB0((uint)(147)).xy + BA_Vertex_26_CB0((uint)(147)).zw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD5,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float3 o6 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_27_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_27_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_27_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_27_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_27_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_27_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_27_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_27_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_27_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_27_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_27_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_27_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_27_CB0((uint)(139)).xy + BA_Vertex_27_CB0((uint)(139)).zw;
  p1.xy = v3.xy * BA_Vertex_27_CB0((uint)(147)).xy + BA_Vertex_27_CB0((uint)(147)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.w = r1.z / BA_Vertex_27_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_27_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = BA_Vertex_27_CB0((uint)(55)).x * r0.w;
  r2.x = dot(v1.xyz, BA_Vertex_27_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_27_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_27_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_27_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_27_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_27_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_27_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_27_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_27_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_27_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = BA_Vertex_27_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_27_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  o5.x = dot(r2.xyz, r0.xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o6.xyz = BA_Vertex_27_CB0((uint)(133)).xyz * BA_Vertex_27_CB0((uint)(127)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float2 o6 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_28_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_28_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_28_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_28_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_28_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_28_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_28_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_28_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_28_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_28_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_28_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_28_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_28_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_28_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = BA_Vertex_28_CB0((uint)(55)).x * r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_28_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.x = dot(v1.xyz, BA_Vertex_28_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_28_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_28_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r1.xyz);
  p1.x = dot(r2.xyz, r0.xyz);
  o1.xy = v2.xy * BA_Vertex_28_CB0((uint)(139)).xy + BA_Vertex_28_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_28_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_28_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_28_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_28_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_28_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_28_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_28_CB1((uint)(27)).xyzw, r2.xyzw);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_28_CB0((uint)(133)).xyz * BA_Vertex_28_CB0((uint)(127)).xyz;
  o6.xy = v3.xy * BA_Vertex_28_CB0((uint)(147)).xy + BA_Vertex_28_CB0((uint)(147)).zw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD5,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float3 o6 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_29_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_29_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_29_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_29_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_29_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_29_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_29_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_29_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_29_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_29_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_29_CB0((uint)(16)).xyz + -r0.xyz;
  r1.xyzw = BA_Vertex_29_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_29_CB0((uint)(139)).xy + BA_Vertex_29_CB0((uint)(139)).zw;
  p1.xy = v3.xy * BA_Vertex_29_CB0((uint)(147)).xy + BA_Vertex_29_CB0((uint)(147)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.w = r1.z / BA_Vertex_29_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_29_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = BA_Vertex_29_CB0((uint)(55)).x * r0.w;
  r2.x = dot(v1.xyz, BA_Vertex_29_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_29_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_29_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_29_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_29_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_29_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_29_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_29_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_29_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_29_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = BA_Vertex_29_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r0.xyz * r0.www + BA_Vertex_29_CB0((uint)(144)).xyz;
  r0.xyz = r0.xyz * r0.www;
  o5.x = dot(r2.xyz, r0.xyz);
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r1.xyz * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o6.xyz = BA_Vertex_29_CB0((uint)(133)).xyz * BA_Vertex_29_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD6,
  out float3 o7 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_30_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_30_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_30_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_30_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_30_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_30_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_30_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_30_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_30_CB0((uint)(139)).xy + BA_Vertex_30_CB0((uint)(139)).zw;
  r1.xyz = BA_Vertex_30_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_30_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r2.x = dot(v1.xyz, BA_Vertex_30_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_30_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_30_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r0.xyz);
  p1.x = dot(r2.xyz, r1.xyz);
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_30_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_30_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_30_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_30_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_30_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_30_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_30_CB1((uint)(27)).xyzw, r2.xyzw);
  o7.xyz = r2.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o4.w = 0;
  o5.xyz = BA_Vertex_30_CB0((uint)(133)).xyz * BA_Vertex_30_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float4 o6 : TEXCOORD4,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_31_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_31_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_31_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_31_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_31_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_31_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_31_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_31_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_31_CB0((uint)(139)).xy + BA_Vertex_31_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_31_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_31_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_31_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_31_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_31_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_31_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_31_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_31_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_31_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_31_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  o4.w = 0;
  r0.w = BA_Vertex_31_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r1.xyz = BA_Vertex_31_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_31_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  o5.x = dot(r2.xyz, r1.xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o8.xyz = r2.xyz;
  o6.xyz = BA_Vertex_31_CB0((uint)(133)).xyz * BA_Vertex_31_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD6,
  out float3 o7 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

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
  o1.xy = v2.xy * BA_Vertex_32_CB0((uint)(139)).xy + BA_Vertex_32_CB0((uint)(139)).zw;
  r1.xyz = BA_Vertex_32_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_32_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r2.x = dot(v1.xyz, BA_Vertex_32_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_32_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_32_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r0.xyz);
  p1.x = dot(r2.xyz, r1.xyz);
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_32_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_32_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_32_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_32_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_32_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_32_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_32_CB1((uint)(27)).xyzw, r2.xyzw);
  o7.xyz = r2.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o4.w = 0;
  o5.xyz = BA_Vertex_32_CB0((uint)(133)).xyz * BA_Vertex_32_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float4 o6 : TEXCOORD4,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_33_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_33_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_33_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_33_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_33_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_33_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_33_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_33_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_33_CB0((uint)(139)).xy + BA_Vertex_33_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_33_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_33_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_33_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_33_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_33_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_33_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_33_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_33_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_33_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_33_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  o4.w = 0;
  r0.w = BA_Vertex_33_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r1.xyz = BA_Vertex_33_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_33_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  o5.x = dot(r2.xyz, r1.xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o8.xyz = r2.xyz;
  o6.xyz = BA_Vertex_33_CB0((uint)(133)).xyz * BA_Vertex_33_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD5,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_34_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_34_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_34_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_34_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_34_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_34_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_34_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_34_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_34_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_34_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_34_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyz = BA_Vertex_34_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_34_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r2.x = dot(v1.xyz, BA_Vertex_34_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_34_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_34_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r0.xyz);
  p1.x = dot(r2.xyz, r1.xyz);
  o1.xy = v2.xy * BA_Vertex_34_CB0((uint)(139)).xy + BA_Vertex_34_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_34_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_34_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_34_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_34_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_34_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_34_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_34_CB1((uint)(27)).xyzw, r2.xyzw);
  o8.xyz = r2.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o4.w = 0;
  o5.xyz = BA_Vertex_34_CB0((uint)(133)).xyz * BA_Vertex_34_CB0((uint)(127)).xyz;
  o6.xy = v3.xy * BA_Vertex_34_CB0((uint)(147)).xy + BA_Vertex_34_CB0((uint)(147)).zw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD5,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float4 o6 : TEXCOORD4,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_35_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_35_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_35_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_35_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_35_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_35_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_35_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_35_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_35_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_35_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_35_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_35_CB0((uint)(139)).xy + BA_Vertex_35_CB0((uint)(139)).zw;
  p1.xy = v3.xy * BA_Vertex_35_CB0((uint)(147)).xy + BA_Vertex_35_CB0((uint)(147)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_35_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_35_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_35_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_35_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_35_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_35_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_35_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_35_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_35_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_35_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  o4.w = 0;
  r0.w = BA_Vertex_35_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r1.xyz = BA_Vertex_35_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_35_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  o5.x = dot(r2.xyz, r1.xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o8.xyz = r2.xyz;
  o6.xyz = BA_Vertex_35_CB0((uint)(133)).xyz * BA_Vertex_35_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD5,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_36_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_36_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_36_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_36_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_36_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_36_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_36_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_36_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_36_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_36_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_36_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyz = BA_Vertex_36_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_36_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r2.x = dot(v1.xyz, BA_Vertex_36_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_36_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_36_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r0.xyz);
  p1.x = dot(r2.xyz, r1.xyz);
  o1.xy = v2.xy * BA_Vertex_36_CB0((uint)(139)).xy + BA_Vertex_36_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_36_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_36_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_36_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_36_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_36_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_36_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_36_CB1((uint)(27)).xyzw, r2.xyzw);
  o8.xyz = r2.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o4.w = 0;
  o5.xyz = BA_Vertex_36_CB0((uint)(133)).xyz * BA_Vertex_36_CB0((uint)(127)).xyz;
  o6.xy = v3.xy * BA_Vertex_36_CB0((uint)(147)).xy + BA_Vertex_36_CB0((uint)(147)).zw;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD5,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float4 o6 : TEXCOORD4,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_37_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_37_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_37_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_37_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_37_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_37_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_37_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_37_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_37_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_37_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_37_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_37_CB0((uint)(139)).xy + BA_Vertex_37_CB0((uint)(139)).zw;
  p1.xy = v3.xy * BA_Vertex_37_CB0((uint)(147)).xy + BA_Vertex_37_CB0((uint)(147)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
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
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  o4.w = 0;
  r0.w = BA_Vertex_37_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r1.xyz = BA_Vertex_37_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_37_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  o5.x = dot(r2.xyz, r1.xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o8.xyz = r2.xyz;
  o6.xyz = BA_Vertex_37_CB0((uint)(133)).xyz * BA_Vertex_37_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD6,
  out float3 o7 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3;
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
  r0.w = r1.z / BA_Vertex_38_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_38_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = saturate(r0.w * BA_Vertex_38_CB0((uint)(55)).z + BA_Vertex_38_CB0((uint)(55)).w);
  o1.xy = v2.xy * BA_Vertex_38_CB0((uint)(139)).xy + BA_Vertex_38_CB0((uint)(139)).zw;
  r1.xyz = BA_Vertex_38_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_38_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r2.x = dot(v1.xyz, BA_Vertex_38_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_38_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_38_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r0.xyz);
  p1.x = dot(r2.xyz, r1.xyz);
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_38_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_38_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_38_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_38_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_38_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_38_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_38_CB1((uint)(27)).xyzw, r2.xyzw);
  o7.xyz = r2.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_38_CB0((uint)(133)).xyz * BA_Vertex_38_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 55u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float4 o6 : TEXCOORD4,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

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
  o1.xy = v2.xy * BA_Vertex_39_CB0((uint)(139)).xy + BA_Vertex_39_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
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
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_39_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_39_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = saturate(r0.w * BA_Vertex_39_CB0((uint)(55)).z + BA_Vertex_39_CB0((uint)(55)).w);
  r0.w = BA_Vertex_39_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r1.xyz = BA_Vertex_39_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_39_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  o5.x = dot(r2.xyz, r1.xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o8.xyz = r2.xyz;
  o6.xyz = BA_Vertex_39_CB0((uint)(133)).xyz * BA_Vertex_39_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD6,
  out float3 o7 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

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
  o4.w = saturate(r0.w * BA_Vertex_40_CB0((uint)(55)).z + BA_Vertex_40_CB0((uint)(55)).w);
  o1.xy = v2.xy * BA_Vertex_40_CB0((uint)(139)).xy + BA_Vertex_40_CB0((uint)(139)).zw;
  r1.xyz = BA_Vertex_40_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_40_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r2.x = dot(v1.xyz, BA_Vertex_40_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_40_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_40_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r0.xyz);
  p1.x = dot(r2.xyz, r1.xyz);
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_40_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_40_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_40_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_40_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_40_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_40_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_40_CB1((uint)(27)).xyzw, r2.xyzw);
  o7.xyz = r2.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_40_CB0((uint)(133)).xyz * BA_Vertex_40_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float4 o6 : TEXCOORD4,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3,r4;
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
  o1.xy = v2.xy * BA_Vertex_41_CB0((uint)(139)).xy + BA_Vertex_41_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_41_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_41_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_41_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_41_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_41_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_41_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_41_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_41_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_41_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_41_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_41_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_41_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = saturate(r0.w * BA_Vertex_41_CB0((uint)(55)).z + BA_Vertex_41_CB0((uint)(55)).w);
  r0.w = BA_Vertex_41_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r1.xyz = BA_Vertex_41_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_41_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  o5.x = dot(r2.xyz, r1.xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o8.xyz = r2.xyz;
  o6.xyz = BA_Vertex_41_CB0((uint)(133)).xyz * BA_Vertex_41_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD5,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_42_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_42_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_42_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_42_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_42_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_42_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
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
  o4.w = saturate(r0.w * BA_Vertex_42_CB0((uint)(55)).z + BA_Vertex_42_CB0((uint)(55)).w);
  r1.xyz = BA_Vertex_42_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_42_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r2.x = dot(v1.xyz, BA_Vertex_42_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_42_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_42_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r0.xyz);
  p1.x = dot(r2.xyz, r1.xyz);
  o1.xy = v2.xy * BA_Vertex_42_CB0((uint)(139)).xy + BA_Vertex_42_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_42_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_42_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_42_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_42_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_42_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_42_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_42_CB1((uint)(27)).xyzw, r2.xyzw);
  o8.xyz = r2.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_42_CB0((uint)(133)).xyz * BA_Vertex_42_CB0((uint)(127)).xyz;
  o6.xy = v3.xy * BA_Vertex_42_CB0((uint)(147)).xy + BA_Vertex_42_CB0((uint)(147)).zw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD5,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float4 o6 : TEXCOORD4,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_43_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_43_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_43_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_43_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_43_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_43_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_43_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_43_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_43_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_43_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_43_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_43_CB0((uint)(139)).xy + BA_Vertex_43_CB0((uint)(139)).zw;
  p1.xy = v3.xy * BA_Vertex_43_CB0((uint)(147)).xy + BA_Vertex_43_CB0((uint)(147)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_43_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_43_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_43_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_43_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_43_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_43_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_43_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_43_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_43_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_43_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_43_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_43_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = saturate(r0.w * BA_Vertex_43_CB0((uint)(55)).z + BA_Vertex_43_CB0((uint)(55)).w);
  r0.w = BA_Vertex_43_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r1.xyz = BA_Vertex_43_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_43_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  o5.x = dot(r2.xyz, r1.xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o8.xyz = r2.xyz;
  o6.xyz = BA_Vertex_43_CB0((uint)(133)).xyz * BA_Vertex_43_CB0((uint)(127)).xyz;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD5,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_44_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_44_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_44_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_44_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_44_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_44_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_44_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_44_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_44_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_44_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_44_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_44_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_44_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = saturate(r0.w * BA_Vertex_44_CB0((uint)(55)).z + BA_Vertex_44_CB0((uint)(55)).w);
  r1.xyz = BA_Vertex_44_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_44_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r2.x = dot(v1.xyz, BA_Vertex_44_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_44_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_44_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r0.xyz);
  p1.x = dot(r2.xyz, r1.xyz);
  o1.xy = v2.xy * BA_Vertex_44_CB0((uint)(139)).xy + BA_Vertex_44_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_44_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_44_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_44_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_44_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_44_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_44_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_44_CB1((uint)(27)).xyzw, r2.xyzw);
  o8.xyz = r2.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_44_CB0((uint)(133)).xyz * BA_Vertex_44_CB0((uint)(127)).xyz;
  o6.xy = v3.xy * BA_Vertex_44_CB0((uint)(147)).xy + BA_Vertex_44_CB0((uint)(147)).zw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD5,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float4 o6 : TEXCOORD4,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_45_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_45_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_45_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_45_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_45_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_45_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_45_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_45_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_45_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_45_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_45_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_45_CB0((uint)(139)).xy + BA_Vertex_45_CB0((uint)(139)).zw;
  p1.xy = v3.xy * BA_Vertex_45_CB0((uint)(147)).xy + BA_Vertex_45_CB0((uint)(147)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
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
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_45_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_45_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = saturate(r0.w * BA_Vertex_45_CB0((uint)(55)).z + BA_Vertex_45_CB0((uint)(55)).w);
  r0.w = BA_Vertex_45_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r1.xyz = BA_Vertex_45_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_45_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  o5.x = dot(r2.xyz, r1.xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o8.xyz = r2.xyz;
  o6.xyz = BA_Vertex_45_CB0((uint)(133)).xyz * BA_Vertex_45_CB0((uint)(127)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD6,
  out float3 o7 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3;
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
  r0.w = r1.z / BA_Vertex_46_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_46_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = BA_Vertex_46_CB0((uint)(55)).x * r0.w;
  o1.xy = v2.xy * BA_Vertex_46_CB0((uint)(139)).xy + BA_Vertex_46_CB0((uint)(139)).zw;
  r1.xyz = BA_Vertex_46_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_46_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r2.x = dot(v1.xyz, BA_Vertex_46_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_46_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_46_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r0.xyz);
  p1.x = dot(r2.xyz, r1.xyz);
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_46_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_46_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_46_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_46_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_46_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_46_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_46_CB1((uint)(27)).xyzw, r2.xyzw);
  o7.xyz = r2.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_46_CB0((uint)(133)).xyz * BA_Vertex_46_CB0((uint)(127)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float4 o6 : TEXCOORD4,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

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
  o1.xy = v2.xy * BA_Vertex_47_CB0((uint)(139)).xy + BA_Vertex_47_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
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
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_47_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_47_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = BA_Vertex_47_CB0((uint)(55)).x * r0.w;
  r0.w = BA_Vertex_47_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r1.xyz = BA_Vertex_47_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_47_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  o5.x = dot(r2.xyz, r1.xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o8.xyz = r2.xyz;
  o6.xyz = BA_Vertex_47_CB0((uint)(133)).xyz * BA_Vertex_47_CB0((uint)(127)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD6,
  out float3 o7 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

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
  o4.w = BA_Vertex_48_CB0((uint)(55)).x * r0.w;
  o1.xy = v2.xy * BA_Vertex_48_CB0((uint)(139)).xy + BA_Vertex_48_CB0((uint)(139)).zw;
  r1.xyz = BA_Vertex_48_CB0((uint)(16)).xyz + -r0.xyz;
  o6.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_48_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r2.x = dot(v1.xyz, BA_Vertex_48_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_48_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_48_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r0.xyz);
  p1.x = dot(r2.xyz, r1.xyz);
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_48_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_48_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_48_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_48_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_48_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_48_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_48_CB1((uint)(27)).xyzw, r2.xyzw);
  o7.xyz = r2.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_48_CB0((uint)(133)).xyz * BA_Vertex_48_CB0((uint)(127)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float4 o6 : TEXCOORD4,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3,r4;
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
  o1.xy = v2.xy * BA_Vertex_49_CB0((uint)(139)).xy + BA_Vertex_49_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_49_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_49_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_49_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_49_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_49_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_49_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_49_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_49_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_49_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_49_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_49_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_49_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = BA_Vertex_49_CB0((uint)(55)).x * r0.w;
  r0.w = BA_Vertex_49_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r1.xyz = BA_Vertex_49_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_49_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  o5.x = dot(r2.xyz, r1.xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o8.xyz = r2.xyz;
  o6.xyz = BA_Vertex_49_CB0((uint)(133)).xyz * BA_Vertex_49_CB0((uint)(127)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD5,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_50_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_50_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_50_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_50_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_50_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_50_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
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
  o4.w = BA_Vertex_50_CB0((uint)(55)).x * r0.w;
  r1.xyz = BA_Vertex_50_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_50_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r2.x = dot(v1.xyz, BA_Vertex_50_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_50_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_50_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r0.xyz);
  p1.x = dot(r2.xyz, r1.xyz);
  o1.xy = v2.xy * BA_Vertex_50_CB0((uint)(139)).xy + BA_Vertex_50_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_50_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_50_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_50_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_50_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_50_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_50_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_50_CB1((uint)(27)).xyzw, r2.xyzw);
  o8.xyz = r2.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_50_CB0((uint)(133)).xyz * BA_Vertex_50_CB0((uint)(127)).xyz;
  o6.xy = v3.xy * BA_Vertex_50_CB0((uint)(147)).xy + BA_Vertex_50_CB0((uint)(147)).zw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD5,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float4 o6 : TEXCOORD4,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_51_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_51_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_51_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_51_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_51_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_51_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_51_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_51_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_51_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_51_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_51_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_51_CB0((uint)(139)).xy + BA_Vertex_51_CB0((uint)(139)).zw;
  p1.xy = v3.xy * BA_Vertex_51_CB0((uint)(147)).xy + BA_Vertex_51_CB0((uint)(147)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r2.x = dot(v1.xyz, BA_Vertex_51_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_51_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_51_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  r0.w = r2.y * r2.y;
  r0.w = r2.x * r2.x + -r0.w;
  r3.xyzw = r2.xyzz * r2.yzzx;
  r4.x = dot(BA_Vertex_51_CB1((uint)(28)).xyzw, r3.xyzw);
  r4.y = dot(BA_Vertex_51_CB1((uint)(29)).xyzw, r3.xyzw);
  r4.z = dot(BA_Vertex_51_CB1((uint)(30)).xyzw, r3.xyzw);
  r3.xyz = BA_Vertex_51_CB1((uint)(31)).xyz * r0.www + r4.xyz;
  r2.w = 1;
  r4.x = dot(BA_Vertex_51_CB1((uint)(25)).xyzw, r2.xyzw);
  r4.y = dot(BA_Vertex_51_CB1((uint)(26)).xyzw, r2.xyzw);
  r4.z = dot(BA_Vertex_51_CB1((uint)(27)).xyzw, r2.xyzw);
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_51_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_51_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = BA_Vertex_51_CB0((uint)(55)).x * r0.w;
  r0.w = BA_Vertex_51_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r1.xyz = BA_Vertex_51_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_51_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  o5.x = dot(r2.xyz, r1.xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o8.xyz = r2.xyz;
  o6.xyz = BA_Vertex_51_CB0((uint)(133)).xyz * BA_Vertex_51_CB0((uint)(127)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD3,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD4,
  out float4 o6 : TEXCOORD5,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_52_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_52_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_52_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_52_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_52_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_52_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_52_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_52_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_52_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_52_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_52_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  r0.w = r1.z / BA_Vertex_52_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_52_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = BA_Vertex_52_CB0((uint)(55)).x * r0.w;
  r1.xyz = BA_Vertex_52_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_52_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  r2.x = dot(v1.xyz, BA_Vertex_52_CB1((uint)(4)).xyz);
  r2.y = dot(v1.xyz, BA_Vertex_52_CB1((uint)(5)).xyz);
  r2.z = dot(v1.xyz, BA_Vertex_52_CB1((uint)(6)).xyz);
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r2.xyz = r2.xyz * r0.www;
  p1.y = dot(r2.xyz, r0.xyz);
  p1.x = dot(r2.xyz, r1.xyz);
  o1.xy = v2.xy * BA_Vertex_52_CB0((uint)(139)).xy + BA_Vertex_52_CB0((uint)(139)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
  r0.x = r2.y * r2.y;
  r0.x = r2.x * r2.x + -r0.x;
  r1.xyzw = r2.xyzz * r2.yzzx;
  r3.x = dot(BA_Vertex_52_CB1((uint)(28)).xyzw, r1.xyzw);
  r3.y = dot(BA_Vertex_52_CB1((uint)(29)).xyzw, r1.xyzw);
  r3.z = dot(BA_Vertex_52_CB1((uint)(30)).xyzw, r1.xyzw);
  r0.xyz = BA_Vertex_52_CB1((uint)(31)).xyz * r0.xxx + r3.xyz;
  r2.w = 1;
  r1.x = dot(BA_Vertex_52_CB1((uint)(25)).xyzw, r2.xyzw);
  r1.y = dot(BA_Vertex_52_CB1((uint)(26)).xyzw, r2.xyzw);
  r1.z = dot(BA_Vertex_52_CB1((uint)(27)).xyzw, r2.xyzw);
  o8.xyz = r2.xyz;
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r0.xyz * r0.www;
  o5.xyz = BA_Vertex_52_CB0((uint)(133)).xyz * BA_Vertex_52_CB0((uint)(127)).xyz;
  o6.xy = v3.xy * BA_Vertex_52_CB0((uint)(147)).xy + BA_Vertex_52_CB0((uint)(147)).zw;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 127u) value = float4(_MxCharShadowTone.x, _MxCharShadowTone.y, _MxCharShadowTone.z, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 139u) value = float4(_mainTex_ST.x, _mainTex_ST.y, _mainTex_ST.z, _mainTex_ST.w);
  if (i == 144u) value = float4(_FakeLightDir.x, _FakeLightDir.y, _FakeLightDir.z, _CrushScale);
  if (i == 145u) value = float4(_NoiseDir.x, _NoiseDir.y, _NoiseDir.z, _Damage);
  if (i == 147u) value = float4(_NoiseTex_ST.x, _NoiseTex_ST.y, _NoiseTex_ST.z, _NoiseTex_ST.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD5,
  out float3 o2 : NORMAL0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD2,
  out float4 o5 : TEXCOORD3,
  out float4 o6 : TEXCOORD4,
  out float4 o7 : TEXCOORD6,
  out float3 o8 : TEXCOORD7)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;
  o8 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Vertex_53_CB0((uint)(144)).ww * v0.xz;
  r0.xyzw = _NoiseTex.SampleLevel(sampler_NoiseTex, r0.xy, 0).xyzw;
  r0.x = r0.x * 2 + -1;
  r0.xyz = BA_Vertex_53_CB0((uint)(145)).xyz * r0.xxx;
  r0.xyz = BA_Vertex_53_CB0((uint)(145)).www * r0.xyz;
  r0.xyz = r0.xyz * v0.zzz + v0.xyz;
  r1.xyz = BA_Vertex_53_CB1((uint)(1)).xyz * r0.yyy;
  r0.xyw = BA_Vertex_53_CB1((uint)(0)).xyz * r0.xxx + r1.xyz;
  r0.xyz = BA_Vertex_53_CB1((uint)(2)).xyz * r0.zzz + r0.xyw;
  r0.xyz = BA_Vertex_53_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_53_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_53_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_53_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r1.xyzw = BA_Vertex_53_CB0((uint)(76)).xyzw + r1.xyzw;
  o0.xyzw = r1.xyzw;
  o1.xy = v2.xy * BA_Vertex_53_CB0((uint)(139)).xy + BA_Vertex_53_CB0((uint)(139)).zw;
  p1.xy = v3.xy * BA_Vertex_53_CB0((uint)(147)).xy + BA_Vertex_53_CB0((uint)(147)).zw;
  o2.xyz = v1.xyz;
  o3.xyzw = v0.xyzw;
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
  r3.xyz = r4.xyz + r3.xyz;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r0.w = r3.x + r3.y;
  r0.w = r0.w + r3.z;
  r0.w = max(0.300000012, r0.w);
  r0.w = 0.300000012 / r0.w;
  o4.xyz = r3.xyz * r0.www;
  r0.w = r1.z / BA_Vertex_53_CB0((uint)(17)).y;
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_53_CB0((uint)(17)).z * r0.w;
  r0.w = max(0, r0.w);
  o4.w = BA_Vertex_53_CB0((uint)(55)).x * r0.w;
  r0.w = BA_Vertex_53_CB0((uint)(17)).x * r1.y;
  r0.w = 0.5 * r0.w;
  r0.w = r0.w / r1.w;
  o5.z = 0.5 + r0.w;
  r1.xyz = BA_Vertex_53_CB0((uint)(16)).xyz + -r0.xyz;
  o7.xyz = r0.xyz;
  r0.x = dot(r1.xyz, r1.xyz);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.yzw = r1.xyz * r0.xxx + BA_Vertex_53_CB0((uint)(144)).xyz;
  r1.xyz = r1.xyz * r0.xxx;
  o5.x = dot(r2.xyz, r1.xyz);
  r0.x = dot(r0.yzw, r0.yzw);
  r0.x = max(1.17549435e-038, r0.x);
  r0.x = rsqrt(r0.x);
  r0.xyz = r0.yzw * r0.xxx;
  o5.y = dot(r2.xyz, r0.xyz);
  o8.xyz = r2.xyz;
  o6.xyz = BA_Vertex_53_CB0((uint)(133)).xyz * BA_Vertex_53_CB0((uint)(127)).xyz;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_86_CB0(uint i)
{
  float4 value = 0;
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = saturate(-BA_Fragment_86_CB0((uint)(132)).x + w1.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_86_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_86_CB0((uint)(133)).xyz * r1.zzz;
  r1.yzw = -r1.zzz * BA_Fragment_86_CB0((uint)(133)).xyz + float3(1,1,1);
  r1.x = r1.x * w1.x + -BA_Fragment_86_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_86_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_86_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_86_CB0((uint)(128)).x * r1.x;
  r2.xyz = BA_Fragment_86_CB0((uint)(142)).xyz * r1.xxx;
  r2.xyz = BA_Fragment_86_CB0((uint)(126)).xyz * r2.xyz;
  r0.yzw = r0.xxx * r1.yzw + r0.yzw;
  r1.xyz = BA_Fragment_86_CB0((uint)(126)).xyz + -v5.xyz;
  r1.xyz = r0.xxx * r1.xyz + v5.xyz;
  r1.xyz = r1.xyz * BA_Fragment_86_CB0((uint)(128)).xxx + v4.xyz;
  r0.xyz = r1.xyz * r0.yzw + r2.xyz;
  r1.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyz = BA_Fragment_86_CB0((uint)(138)).xyz * r1.xyz;
  r0.w = BA_Fragment_86_CB0((uint)(146)).z * BA_Fragment_86_CB0((uint)(146)).x;
  r0.xyz = r0.xyz * r1.xyz + -r0.www;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_86_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_86_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_86_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_86_CB0((uint)(136)).xyz + BA_Fragment_86_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_86_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_87_CB0(uint i)
{
  float4 value = 0;
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float3 v6 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_87_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = saturate(-BA_Fragment_87_CB0((uint)(132)).x + v5.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_87_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_87_CB0((uint)(133)).xyz * r1.zzz;
  r1.yzw = -r1.zzz * BA_Fragment_87_CB0((uint)(133)).xyz + float3(1,1,1);
  r1.x = r1.x * v5.x + -BA_Fragment_87_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_87_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_87_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_87_CB0((uint)(128)).x * r1.x;
  r2.xyz = BA_Fragment_87_CB0((uint)(142)).xyz * r1.xxx;
  r2.xyz = BA_Fragment_87_CB0((uint)(126)).xyz * r2.xyz;
  r0.yzw = r0.xxx * r1.yzw + r0.yzw;
  r1.xyz = BA_Fragment_87_CB0((uint)(126)).xyz + -v6.xyz;
  r1.xyz = r0.xxx * r1.xyz + v6.xyz;
  r1.xyz = r1.xyz * BA_Fragment_87_CB0((uint)(128)).xxx + v4.xyz;
  r0.xyz = r1.xyz * r0.yzw + r2.xyz;
  r1.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyz = BA_Fragment_87_CB0((uint)(138)).xyz * r1.xyz;
  r0.w = BA_Fragment_87_CB0((uint)(146)).z * BA_Fragment_87_CB0((uint)(146)).x;
  r0.xyz = r0.xyz * r1.xyz + -r0.www;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_87_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_87_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_87_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_87_CB0((uint)(136)).xyz + BA_Fragment_87_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_87_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
float4 BA_Fragment_88_CB0(uint i)
{
  float4 value = 0;
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 147u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 148u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = saturate(-BA_Fragment_88_CB0((uint)(132)).x + w1.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_88_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_88_CB0((uint)(133)).xyz * r1.zzz;
  r1.yzw = -r1.zzz * BA_Fragment_88_CB0((uint)(133)).xyz + float3(1,1,1);
  r1.x = r1.x * w1.x + -BA_Fragment_88_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_88_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_88_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_88_CB0((uint)(128)).x * r1.x;
  r2.xyz = BA_Fragment_88_CB0((uint)(142)).xyz * r1.xxx;
  r2.xyz = BA_Fragment_88_CB0((uint)(126)).xyz * r2.xyz;
  r0.yzw = r0.xxx * r1.yzw + r0.yzw;
  r1.xyz = BA_Fragment_88_CB0((uint)(126)).xyz + -v5.xyz;
  r1.xyz = r0.xxx * r1.xyz + v5.xyz;
  r1.xyz = r1.xyz * BA_Fragment_88_CB0((uint)(128)).xxx + v4.xyz;
  r0.xyz = r1.xyz * r0.yzw + r2.xyz;
  r1.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r2.xyz = BA_Fragment_88_CB0((uint)(147)).xyz + -r1.xyz;
  r1.xyz = BA_Fragment_88_CB0((uint)(138)).xyz * r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = saturate(BA_Fragment_88_CB0((uint)(147)).w * r0.w);
  r0.w = 1 + -r0.w;
  r0.w = BA_Fragment_88_CB0((uint)(148)).w * r0.w;
  r2.xyz = BA_Fragment_88_CB0((uint)(148)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_88_CB0((uint)(146)).zzz * BA_Fragment_88_CB0((uint)(146)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_88_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_88_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_88_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_88_CB0((uint)(136)).xyz + BA_Fragment_88_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_88_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
float4 BA_Fragment_89_CB0(uint i)
{
  float4 value = 0;
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 147u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 148u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float3 v6 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_89_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = saturate(-BA_Fragment_89_CB0((uint)(132)).x + v5.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_89_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_89_CB0((uint)(133)).xyz * r1.zzz;
  r1.yzw = -r1.zzz * BA_Fragment_89_CB0((uint)(133)).xyz + float3(1,1,1);
  r1.x = r1.x * v5.x + -BA_Fragment_89_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_89_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_89_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_89_CB0((uint)(128)).x * r1.x;
  r2.xyz = BA_Fragment_89_CB0((uint)(142)).xyz * r1.xxx;
  r2.xyz = BA_Fragment_89_CB0((uint)(126)).xyz * r2.xyz;
  r0.yzw = r0.xxx * r1.yzw + r0.yzw;
  r1.xyz = BA_Fragment_89_CB0((uint)(126)).xyz + -v6.xyz;
  r1.xyz = r0.xxx * r1.xyz + v6.xyz;
  r1.xyz = r1.xyz * BA_Fragment_89_CB0((uint)(128)).xxx + v4.xyz;
  r0.xyz = r1.xyz * r0.yzw + r2.xyz;
  r1.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r2.xyz = BA_Fragment_89_CB0((uint)(147)).xyz + -r1.xyz;
  r1.xyz = BA_Fragment_89_CB0((uint)(138)).xyz * r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = saturate(BA_Fragment_89_CB0((uint)(147)).w * r0.w);
  r0.w = 1 + -r0.w;
  r0.w = BA_Fragment_89_CB0((uint)(148)).w * r0.w;
  r2.xyz = BA_Fragment_89_CB0((uint)(148)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_89_CB0((uint)(146)).zzz * BA_Fragment_89_CB0((uint)(146)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_89_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_89_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_89_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_89_CB0((uint)(136)).xyz + BA_Fragment_89_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_89_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_90_CB0(uint i)
{
  float4 value = 0;
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float2 v6 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = saturate(-BA_Fragment_90_CB0((uint)(132)).x + w1.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_90_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_90_CB0((uint)(133)).xyz * r1.zzz;
  r2.xyz = -r1.zzz * BA_Fragment_90_CB0((uint)(133)).xyz + float3(1,1,1);
  r0.yzw = r0.xxx * r2.xyz + r0.yzw;
  r1.x = r1.x * w1.x + -BA_Fragment_90_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_90_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_90_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_90_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_90_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_90_CB0((uint)(126)).xyz * r1.xyw;
  r2.xyz = BA_Fragment_90_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.xxx * r2.xyz + v5.xyz;
  r2.xyz = r2.xyz * BA_Fragment_90_CB0((uint)(128)).xxx + v4.xyz;
  r0.yzw = r2.xyz * r0.yzw + r1.xyw;
  r2.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyw = BA_Fragment_90_CB0((uint)(138)).xyz * r2.xyz;
  r0.yzw = r1.xyw * r0.yzw;
  r1.xyw = BA_Fragment_90_CB0((uint)(133)).xyz * r2.xyz;
  r2.xyz = -r1.xyw * r1.zzz + r2.xyz;
  r1.xyz = r1.xyw * r1.zzz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_90_CB0((uint)(146)).xyz + -r0.yzw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, v6.xy).xyzw;
  r0.x = r2.x * 2 + -1;
  r0.x = saturate(BA_Fragment_90_CB0((uint)(148)).x * abs(r0.x));
  r0.x = r0.x + r0.x;
  r0.x = min(1, r0.x);
  r0.x = BA_Fragment_90_CB0((uint)(145)).w * r0.x;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.xyz = -BA_Fragment_90_CB0((uint)(150)).zzz * BA_Fragment_90_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_90_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_90_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_90_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_90_CB0((uint)(136)).xyz + BA_Fragment_90_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_90_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_91_CB0(uint i)
{
  float4 value = 0;
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD5,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float3 v6 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_91_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = saturate(-BA_Fragment_91_CB0((uint)(132)).x + v5.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_91_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_91_CB0((uint)(133)).xyz * r1.zzz;
  r2.xyz = -r1.zzz * BA_Fragment_91_CB0((uint)(133)).xyz + float3(1,1,1);
  r0.yzw = r0.xxx * r2.xyz + r0.yzw;
  r1.x = r1.x * v5.x + -BA_Fragment_91_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_91_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_91_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_91_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_91_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_91_CB0((uint)(126)).xyz * r1.xyw;
  r2.xyz = BA_Fragment_91_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.xxx * r2.xyz + v6.xyz;
  r2.xyz = r2.xyz * BA_Fragment_91_CB0((uint)(128)).xxx + v4.xyz;
  r0.yzw = r2.xyz * r0.yzw + r1.xyw;
  r2.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyw = BA_Fragment_91_CB0((uint)(138)).xyz * r2.xyz;
  r0.yzw = r1.xyw * r0.yzw;
  r1.xyw = BA_Fragment_91_CB0((uint)(133)).xyz * r2.xyz;
  r2.xyz = -r1.xyw * r1.zzz + r2.xyz;
  r1.xyz = r1.xyw * r1.zzz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_91_CB0((uint)(146)).xyz + -r0.yzw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, w1.xy).xyzw;
  r0.x = r2.x * 2 + -1;
  r0.x = saturate(BA_Fragment_91_CB0((uint)(148)).x * abs(r0.x));
  r0.x = r0.x + r0.x;
  r0.x = min(1, r0.x);
  r0.x = BA_Fragment_91_CB0((uint)(145)).w * r0.x;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.xyz = -BA_Fragment_91_CB0((uint)(150)).zzz * BA_Fragment_91_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_91_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_91_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_91_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_91_CB0((uint)(136)).xyz + BA_Fragment_91_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_91_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
float4 BA_Fragment_92_CB0(uint i)
{
  float4 value = 0;
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 151u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 152u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float2 v6 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = saturate(-BA_Fragment_92_CB0((uint)(132)).x + w1.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_92_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_92_CB0((uint)(133)).xyz * r1.zzz;
  r2.xyz = -r1.zzz * BA_Fragment_92_CB0((uint)(133)).xyz + float3(1,1,1);
  r0.yzw = r0.xxx * r2.xyz + r0.yzw;
  r1.x = r1.x * w1.x + -BA_Fragment_92_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_92_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_92_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_92_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_92_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_92_CB0((uint)(126)).xyz * r1.xyw;
  r2.xyz = BA_Fragment_92_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.xxx * r2.xyz + v5.xyz;
  r2.xyz = r2.xyz * BA_Fragment_92_CB0((uint)(128)).xxx + v4.xyz;
  r0.yzw = r2.xyz * r0.yzw + r1.xyw;
  r2.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyw = BA_Fragment_92_CB0((uint)(151)).xyz + -r2.xyz;
  r1.x = dot(r1.xyw, r1.xyw);
  r1.x = saturate(BA_Fragment_92_CB0((uint)(151)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_92_CB0((uint)(152)).w * r1.x;
  r1.xyw = BA_Fragment_92_CB0((uint)(152)).xyz * r1.xxx;
  r3.xyz = BA_Fragment_92_CB0((uint)(138)).xyz * r2.xyz;
  r0.yzw = r0.yzw * r3.xyz + r1.xyw;
  r1.xyw = BA_Fragment_92_CB0((uint)(133)).xyz * r2.xyz;
  r2.xyz = -r1.xyw * r1.zzz + r2.xyz;
  r1.xyz = r1.xyw * r1.zzz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_92_CB0((uint)(146)).xyz + -r0.yzw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, v6.xy).xyzw;
  r0.x = r2.x * 2 + -1;
  r0.x = saturate(BA_Fragment_92_CB0((uint)(148)).x * abs(r0.x));
  r0.x = r0.x + r0.x;
  r0.x = min(1, r0.x);
  r0.x = BA_Fragment_92_CB0((uint)(145)).w * r0.x;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.xyz = -BA_Fragment_92_CB0((uint)(150)).zzz * BA_Fragment_92_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_92_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_92_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_92_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_92_CB0((uint)(136)).xyz + BA_Fragment_92_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_92_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
float4 BA_Fragment_93_CB0(uint i)
{
  float4 value = 0;
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 151u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 152u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD5,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float3 v6 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_93_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = saturate(-BA_Fragment_93_CB0((uint)(132)).x + v5.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_93_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_93_CB0((uint)(133)).xyz * r1.zzz;
  r2.xyz = -r1.zzz * BA_Fragment_93_CB0((uint)(133)).xyz + float3(1,1,1);
  r0.yzw = r0.xxx * r2.xyz + r0.yzw;
  r1.x = r1.x * v5.x + -BA_Fragment_93_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_93_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_93_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_93_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_93_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_93_CB0((uint)(126)).xyz * r1.xyw;
  r2.xyz = BA_Fragment_93_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.xxx * r2.xyz + v6.xyz;
  r2.xyz = r2.xyz * BA_Fragment_93_CB0((uint)(128)).xxx + v4.xyz;
  r0.yzw = r2.xyz * r0.yzw + r1.xyw;
  r2.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyw = BA_Fragment_93_CB0((uint)(151)).xyz + -r2.xyz;
  r1.x = dot(r1.xyw, r1.xyw);
  r1.x = saturate(BA_Fragment_93_CB0((uint)(151)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_93_CB0((uint)(152)).w * r1.x;
  r1.xyw = BA_Fragment_93_CB0((uint)(152)).xyz * r1.xxx;
  r3.xyz = BA_Fragment_93_CB0((uint)(138)).xyz * r2.xyz;
  r0.yzw = r0.yzw * r3.xyz + r1.xyw;
  r1.xyw = BA_Fragment_93_CB0((uint)(133)).xyz * r2.xyz;
  r2.xyz = -r1.xyw * r1.zzz + r2.xyz;
  r1.xyz = r1.xyw * r1.zzz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_93_CB0((uint)(146)).xyz + -r0.yzw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, w1.xy).xyzw;
  r0.x = r2.x * 2 + -1;
  r0.x = saturate(BA_Fragment_93_CB0((uint)(148)).x * abs(r0.x));
  r0.x = r0.x + r0.x;
  r0.x = min(1, r0.x);
  r0.x = BA_Fragment_93_CB0((uint)(145)).w * r0.x;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.xyz = -BA_Fragment_93_CB0((uint)(150)).zzz * BA_Fragment_93_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_93_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_93_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_93_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_93_CB0((uint)(136)).xyz + BA_Fragment_93_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_93_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_94_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = saturate(-BA_Fragment_94_CB0((uint)(132)).x + w1.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_94_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_94_CB0((uint)(133)).xyz * r1.zzz;
  r1.yzw = -r1.zzz * BA_Fragment_94_CB0((uint)(133)).xyz + float3(1,1,1);
  r1.x = r1.x * w1.x + -BA_Fragment_94_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_94_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_94_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_94_CB0((uint)(128)).x * r1.x;
  r2.xyz = BA_Fragment_94_CB0((uint)(142)).xyz * r1.xxx;
  r2.xyz = BA_Fragment_94_CB0((uint)(126)).xyz * r2.xyz;
  r0.yzw = r0.xxx * r1.yzw + r0.yzw;
  r1.xyz = BA_Fragment_94_CB0((uint)(126)).xyz + -v5.xyz;
  r1.xyz = r0.xxx * r1.xyz + v5.xyz;
  r1.xyz = r1.xyz * BA_Fragment_94_CB0((uint)(128)).xxx + v4.xyz;
  r0.xyz = r1.xyz * r0.yzw + r2.xyz;
  r1.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyz = BA_Fragment_94_CB0((uint)(138)).xyz * r1.xyz;
  r0.w = BA_Fragment_94_CB0((uint)(146)).z * BA_Fragment_94_CB0((uint)(146)).x;
  r0.xyz = r0.xyz * r1.xyz + -r0.www;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_94_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_94_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_94_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_94_CB0((uint)(136)).xyz + BA_Fragment_94_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_94_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_94_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_94_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_95_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float3 v6 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_95_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = saturate(-BA_Fragment_95_CB0((uint)(132)).x + v5.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_95_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_95_CB0((uint)(133)).xyz * r1.zzz;
  r1.yzw = -r1.zzz * BA_Fragment_95_CB0((uint)(133)).xyz + float3(1,1,1);
  r1.x = r1.x * v5.x + -BA_Fragment_95_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_95_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_95_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_95_CB0((uint)(128)).x * r1.x;
  r2.xyz = BA_Fragment_95_CB0((uint)(142)).xyz * r1.xxx;
  r2.xyz = BA_Fragment_95_CB0((uint)(126)).xyz * r2.xyz;
  r0.yzw = r0.xxx * r1.yzw + r0.yzw;
  r1.xyz = BA_Fragment_95_CB0((uint)(126)).xyz + -v6.xyz;
  r1.xyz = r0.xxx * r1.xyz + v6.xyz;
  r1.xyz = r1.xyz * BA_Fragment_95_CB0((uint)(128)).xxx + v4.xyz;
  r0.xyz = r1.xyz * r0.yzw + r2.xyz;
  r1.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyz = BA_Fragment_95_CB0((uint)(138)).xyz * r1.xyz;
  r0.w = BA_Fragment_95_CB0((uint)(146)).z * BA_Fragment_95_CB0((uint)(146)).x;
  r0.xyz = r0.xyz * r1.xyz + -r0.www;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_95_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_95_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_95_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_95_CB0((uint)(136)).xyz + BA_Fragment_95_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_95_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_95_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_95_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
float4 BA_Fragment_96_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 147u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 148u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = saturate(-BA_Fragment_96_CB0((uint)(132)).x + w1.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_96_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_96_CB0((uint)(133)).xyz * r1.zzz;
  r1.yzw = -r1.zzz * BA_Fragment_96_CB0((uint)(133)).xyz + float3(1,1,1);
  r1.x = r1.x * w1.x + -BA_Fragment_96_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_96_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_96_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_96_CB0((uint)(128)).x * r1.x;
  r2.xyz = BA_Fragment_96_CB0((uint)(142)).xyz * r1.xxx;
  r2.xyz = BA_Fragment_96_CB0((uint)(126)).xyz * r2.xyz;
  r0.yzw = r0.xxx * r1.yzw + r0.yzw;
  r1.xyz = BA_Fragment_96_CB0((uint)(126)).xyz + -v5.xyz;
  r1.xyz = r0.xxx * r1.xyz + v5.xyz;
  r1.xyz = r1.xyz * BA_Fragment_96_CB0((uint)(128)).xxx + v4.xyz;
  r0.xyz = r1.xyz * r0.yzw + r2.xyz;
  r1.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r2.xyz = BA_Fragment_96_CB0((uint)(147)).xyz + -r1.xyz;
  r1.xyz = BA_Fragment_96_CB0((uint)(138)).xyz * r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = saturate(BA_Fragment_96_CB0((uint)(147)).w * r0.w);
  r0.w = 1 + -r0.w;
  r0.w = BA_Fragment_96_CB0((uint)(148)).w * r0.w;
  r2.xyz = BA_Fragment_96_CB0((uint)(148)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_96_CB0((uint)(146)).zzz * BA_Fragment_96_CB0((uint)(146)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_96_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_96_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_96_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_96_CB0((uint)(136)).xyz + BA_Fragment_96_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_96_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_96_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_96_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
float4 BA_Fragment_97_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 147u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 148u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float3 v6 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_97_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = saturate(-BA_Fragment_97_CB0((uint)(132)).x + v5.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_97_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_97_CB0((uint)(133)).xyz * r1.zzz;
  r1.yzw = -r1.zzz * BA_Fragment_97_CB0((uint)(133)).xyz + float3(1,1,1);
  r1.x = r1.x * v5.x + -BA_Fragment_97_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_97_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_97_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_97_CB0((uint)(128)).x * r1.x;
  r2.xyz = BA_Fragment_97_CB0((uint)(142)).xyz * r1.xxx;
  r2.xyz = BA_Fragment_97_CB0((uint)(126)).xyz * r2.xyz;
  r0.yzw = r0.xxx * r1.yzw + r0.yzw;
  r1.xyz = BA_Fragment_97_CB0((uint)(126)).xyz + -v6.xyz;
  r1.xyz = r0.xxx * r1.xyz + v6.xyz;
  r1.xyz = r1.xyz * BA_Fragment_97_CB0((uint)(128)).xxx + v4.xyz;
  r0.xyz = r1.xyz * r0.yzw + r2.xyz;
  r1.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r2.xyz = BA_Fragment_97_CB0((uint)(147)).xyz + -r1.xyz;
  r1.xyz = BA_Fragment_97_CB0((uint)(138)).xyz * r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = saturate(BA_Fragment_97_CB0((uint)(147)).w * r0.w);
  r0.w = 1 + -r0.w;
  r0.w = BA_Fragment_97_CB0((uint)(148)).w * r0.w;
  r2.xyz = BA_Fragment_97_CB0((uint)(148)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_97_CB0((uint)(146)).zzz * BA_Fragment_97_CB0((uint)(146)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_97_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_97_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_97_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_97_CB0((uint)(136)).xyz + BA_Fragment_97_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_97_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_97_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_97_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_98_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float2 v6 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = saturate(-BA_Fragment_98_CB0((uint)(132)).x + w1.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_98_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_98_CB0((uint)(133)).xyz * r1.zzz;
  r2.xyz = -r1.zzz * BA_Fragment_98_CB0((uint)(133)).xyz + float3(1,1,1);
  r0.yzw = r0.xxx * r2.xyz + r0.yzw;
  r1.x = r1.x * w1.x + -BA_Fragment_98_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_98_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_98_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_98_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_98_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_98_CB0((uint)(126)).xyz * r1.xyw;
  r2.xyz = BA_Fragment_98_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.xxx * r2.xyz + v5.xyz;
  r2.xyz = r2.xyz * BA_Fragment_98_CB0((uint)(128)).xxx + v4.xyz;
  r0.yzw = r2.xyz * r0.yzw + r1.xyw;
  r2.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyw = BA_Fragment_98_CB0((uint)(138)).xyz * r2.xyz;
  r0.yzw = r1.xyw * r0.yzw;
  r1.xyw = BA_Fragment_98_CB0((uint)(133)).xyz * r2.xyz;
  r2.xyz = -r1.xyw * r1.zzz + r2.xyz;
  r1.xyz = r1.xyw * r1.zzz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_98_CB0((uint)(146)).xyz + -r0.yzw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, v6.xy).xyzw;
  r0.x = r2.x * 2 + -1;
  r0.x = saturate(BA_Fragment_98_CB0((uint)(148)).x * abs(r0.x));
  r0.x = r0.x + r0.x;
  r0.x = min(1, r0.x);
  r0.x = BA_Fragment_98_CB0((uint)(145)).w * r0.x;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.xyz = -BA_Fragment_98_CB0((uint)(150)).zzz * BA_Fragment_98_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_98_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_98_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_98_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_98_CB0((uint)(136)).xyz + BA_Fragment_98_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_98_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_98_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_98_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_99_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD5,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float3 v6 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_99_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = saturate(-BA_Fragment_99_CB0((uint)(132)).x + v5.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_99_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_99_CB0((uint)(133)).xyz * r1.zzz;
  r2.xyz = -r1.zzz * BA_Fragment_99_CB0((uint)(133)).xyz + float3(1,1,1);
  r0.yzw = r0.xxx * r2.xyz + r0.yzw;
  r1.x = r1.x * v5.x + -BA_Fragment_99_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_99_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_99_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_99_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_99_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_99_CB0((uint)(126)).xyz * r1.xyw;
  r2.xyz = BA_Fragment_99_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.xxx * r2.xyz + v6.xyz;
  r2.xyz = r2.xyz * BA_Fragment_99_CB0((uint)(128)).xxx + v4.xyz;
  r0.yzw = r2.xyz * r0.yzw + r1.xyw;
  r2.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyw = BA_Fragment_99_CB0((uint)(138)).xyz * r2.xyz;
  r0.yzw = r1.xyw * r0.yzw;
  r1.xyw = BA_Fragment_99_CB0((uint)(133)).xyz * r2.xyz;
  r2.xyz = -r1.xyw * r1.zzz + r2.xyz;
  r1.xyz = r1.xyw * r1.zzz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_99_CB0((uint)(146)).xyz + -r0.yzw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, w1.xy).xyzw;
  r0.x = r2.x * 2 + -1;
  r0.x = saturate(BA_Fragment_99_CB0((uint)(148)).x * abs(r0.x));
  r0.x = r0.x + r0.x;
  r0.x = min(1, r0.x);
  r0.x = BA_Fragment_99_CB0((uint)(145)).w * r0.x;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.xyz = -BA_Fragment_99_CB0((uint)(150)).zzz * BA_Fragment_99_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_99_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_99_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_99_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_99_CB0((uint)(136)).xyz + BA_Fragment_99_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_99_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_99_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_99_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
float4 BA_Fragment_100_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 151u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 152u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float2 v6 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = saturate(-BA_Fragment_100_CB0((uint)(132)).x + w1.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_100_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_100_CB0((uint)(133)).xyz * r1.zzz;
  r2.xyz = -r1.zzz * BA_Fragment_100_CB0((uint)(133)).xyz + float3(1,1,1);
  r0.yzw = r0.xxx * r2.xyz + r0.yzw;
  r1.x = r1.x * w1.x + -BA_Fragment_100_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_100_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_100_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_100_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_100_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_100_CB0((uint)(126)).xyz * r1.xyw;
  r2.xyz = BA_Fragment_100_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.xxx * r2.xyz + v5.xyz;
  r2.xyz = r2.xyz * BA_Fragment_100_CB0((uint)(128)).xxx + v4.xyz;
  r0.yzw = r2.xyz * r0.yzw + r1.xyw;
  r2.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyw = BA_Fragment_100_CB0((uint)(151)).xyz + -r2.xyz;
  r1.x = dot(r1.xyw, r1.xyw);
  r1.x = saturate(BA_Fragment_100_CB0((uint)(151)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_100_CB0((uint)(152)).w * r1.x;
  r1.xyw = BA_Fragment_100_CB0((uint)(152)).xyz * r1.xxx;
  r3.xyz = BA_Fragment_100_CB0((uint)(138)).xyz * r2.xyz;
  r0.yzw = r0.yzw * r3.xyz + r1.xyw;
  r1.xyw = BA_Fragment_100_CB0((uint)(133)).xyz * r2.xyz;
  r2.xyz = -r1.xyw * r1.zzz + r2.xyz;
  r1.xyz = r1.xyw * r1.zzz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_100_CB0((uint)(146)).xyz + -r0.yzw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, v6.xy).xyzw;
  r0.x = r2.x * 2 + -1;
  r0.x = saturate(BA_Fragment_100_CB0((uint)(148)).x * abs(r0.x));
  r0.x = r0.x + r0.x;
  r0.x = min(1, r0.x);
  r0.x = BA_Fragment_100_CB0((uint)(145)).w * r0.x;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.xyz = -BA_Fragment_100_CB0((uint)(150)).zzz * BA_Fragment_100_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_100_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_100_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_100_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_100_CB0((uint)(136)).xyz + BA_Fragment_100_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_100_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_100_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_100_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
float4 BA_Fragment_101_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 151u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 152u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD5,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float3 v6 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_101_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = saturate(-BA_Fragment_101_CB0((uint)(132)).x + v5.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_101_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_101_CB0((uint)(133)).xyz * r1.zzz;
  r2.xyz = -r1.zzz * BA_Fragment_101_CB0((uint)(133)).xyz + float3(1,1,1);
  r0.yzw = r0.xxx * r2.xyz + r0.yzw;
  r1.x = r1.x * v5.x + -BA_Fragment_101_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_101_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_101_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_101_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_101_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_101_CB0((uint)(126)).xyz * r1.xyw;
  r2.xyz = BA_Fragment_101_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.xxx * r2.xyz + v6.xyz;
  r2.xyz = r2.xyz * BA_Fragment_101_CB0((uint)(128)).xxx + v4.xyz;
  r0.yzw = r2.xyz * r0.yzw + r1.xyw;
  r2.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyw = BA_Fragment_101_CB0((uint)(151)).xyz + -r2.xyz;
  r1.x = dot(r1.xyw, r1.xyw);
  r1.x = saturate(BA_Fragment_101_CB0((uint)(151)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_101_CB0((uint)(152)).w * r1.x;
  r1.xyw = BA_Fragment_101_CB0((uint)(152)).xyz * r1.xxx;
  r3.xyz = BA_Fragment_101_CB0((uint)(138)).xyz * r2.xyz;
  r0.yzw = r0.yzw * r3.xyz + r1.xyw;
  r1.xyw = BA_Fragment_101_CB0((uint)(133)).xyz * r2.xyz;
  r2.xyz = -r1.xyw * r1.zzz + r2.xyz;
  r1.xyz = r1.xyw * r1.zzz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_101_CB0((uint)(146)).xyz + -r0.yzw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, w1.xy).xyzw;
  r0.x = r2.x * 2 + -1;
  r0.x = saturate(BA_Fragment_101_CB0((uint)(148)).x * abs(r0.x));
  r0.x = r0.x + r0.x;
  r0.x = min(1, r0.x);
  r0.x = BA_Fragment_101_CB0((uint)(145)).w * r0.x;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.xyz = -BA_Fragment_101_CB0((uint)(150)).zzz * BA_Fragment_101_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_101_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_101_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_101_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_101_CB0((uint)(136)).xyz + BA_Fragment_101_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_101_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_101_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_101_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_102_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = saturate(-BA_Fragment_102_CB0((uint)(132)).x + w1.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_102_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_102_CB0((uint)(133)).xyz * r1.zzz;
  r1.yzw = -r1.zzz * BA_Fragment_102_CB0((uint)(133)).xyz + float3(1,1,1);
  r1.x = r1.x * w1.x + -BA_Fragment_102_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_102_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_102_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_102_CB0((uint)(128)).x * r1.x;
  r2.xyz = BA_Fragment_102_CB0((uint)(142)).xyz * r1.xxx;
  r2.xyz = BA_Fragment_102_CB0((uint)(126)).xyz * r2.xyz;
  r0.yzw = r0.xxx * r1.yzw + r0.yzw;
  r1.xyz = BA_Fragment_102_CB0((uint)(126)).xyz + -v5.xyz;
  r1.xyz = r0.xxx * r1.xyz + v5.xyz;
  r1.xyz = r1.xyz * BA_Fragment_102_CB0((uint)(128)).xxx + v4.xyz;
  r0.xyz = r1.xyz * r0.yzw + r2.xyz;
  r1.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyz = BA_Fragment_102_CB0((uint)(138)).xyz * r1.xyz;
  r0.w = BA_Fragment_102_CB0((uint)(146)).z * BA_Fragment_102_CB0((uint)(146)).x;
  r0.xyz = r0.xyz * r1.xyz + -r0.www;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_102_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_102_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_102_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_102_CB0((uint)(136)).xyz + BA_Fragment_102_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_102_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_102_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_102_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_103_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float3 v6 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_103_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = saturate(-BA_Fragment_103_CB0((uint)(132)).x + v5.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_103_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_103_CB0((uint)(133)).xyz * r1.zzz;
  r1.yzw = -r1.zzz * BA_Fragment_103_CB0((uint)(133)).xyz + float3(1,1,1);
  r1.x = r1.x * v5.x + -BA_Fragment_103_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_103_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_103_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_103_CB0((uint)(128)).x * r1.x;
  r2.xyz = BA_Fragment_103_CB0((uint)(142)).xyz * r1.xxx;
  r2.xyz = BA_Fragment_103_CB0((uint)(126)).xyz * r2.xyz;
  r0.yzw = r0.xxx * r1.yzw + r0.yzw;
  r1.xyz = BA_Fragment_103_CB0((uint)(126)).xyz + -v6.xyz;
  r1.xyz = r0.xxx * r1.xyz + v6.xyz;
  r1.xyz = r1.xyz * BA_Fragment_103_CB0((uint)(128)).xxx + v4.xyz;
  r0.xyz = r1.xyz * r0.yzw + r2.xyz;
  r1.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyz = BA_Fragment_103_CB0((uint)(138)).xyz * r1.xyz;
  r0.w = BA_Fragment_103_CB0((uint)(146)).z * BA_Fragment_103_CB0((uint)(146)).x;
  r0.xyz = r0.xyz * r1.xyz + -r0.www;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_103_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_103_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_103_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_103_CB0((uint)(136)).xyz + BA_Fragment_103_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_103_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_103_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_103_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
float4 BA_Fragment_104_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 147u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 148u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float3 v5 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = saturate(-BA_Fragment_104_CB0((uint)(132)).x + w1.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_104_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_104_CB0((uint)(133)).xyz * r1.zzz;
  r1.yzw = -r1.zzz * BA_Fragment_104_CB0((uint)(133)).xyz + float3(1,1,1);
  r1.x = r1.x * w1.x + -BA_Fragment_104_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_104_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_104_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_104_CB0((uint)(128)).x * r1.x;
  r2.xyz = BA_Fragment_104_CB0((uint)(142)).xyz * r1.xxx;
  r2.xyz = BA_Fragment_104_CB0((uint)(126)).xyz * r2.xyz;
  r0.yzw = r0.xxx * r1.yzw + r0.yzw;
  r1.xyz = BA_Fragment_104_CB0((uint)(126)).xyz + -v5.xyz;
  r1.xyz = r0.xxx * r1.xyz + v5.xyz;
  r1.xyz = r1.xyz * BA_Fragment_104_CB0((uint)(128)).xxx + v4.xyz;
  r0.xyz = r1.xyz * r0.yzw + r2.xyz;
  r1.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r2.xyz = BA_Fragment_104_CB0((uint)(147)).xyz + -r1.xyz;
  r1.xyz = BA_Fragment_104_CB0((uint)(138)).xyz * r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = saturate(BA_Fragment_104_CB0((uint)(147)).w * r0.w);
  r0.w = 1 + -r0.w;
  r0.w = BA_Fragment_104_CB0((uint)(148)).w * r0.w;
  r2.xyz = BA_Fragment_104_CB0((uint)(148)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_104_CB0((uint)(146)).zzz * BA_Fragment_104_CB0((uint)(146)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_104_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_104_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_104_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_104_CB0((uint)(136)).xyz + BA_Fragment_104_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_104_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_104_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_104_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
float4 BA_Fragment_105_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 147u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 148u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float3 v6 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_105_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = saturate(-BA_Fragment_105_CB0((uint)(132)).x + v5.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_105_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_105_CB0((uint)(133)).xyz * r1.zzz;
  r1.yzw = -r1.zzz * BA_Fragment_105_CB0((uint)(133)).xyz + float3(1,1,1);
  r1.x = r1.x * v5.x + -BA_Fragment_105_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_105_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_105_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_105_CB0((uint)(128)).x * r1.x;
  r2.xyz = BA_Fragment_105_CB0((uint)(142)).xyz * r1.xxx;
  r2.xyz = BA_Fragment_105_CB0((uint)(126)).xyz * r2.xyz;
  r0.yzw = r0.xxx * r1.yzw + r0.yzw;
  r1.xyz = BA_Fragment_105_CB0((uint)(126)).xyz + -v6.xyz;
  r1.xyz = r0.xxx * r1.xyz + v6.xyz;
  r1.xyz = r1.xyz * BA_Fragment_105_CB0((uint)(128)).xxx + v4.xyz;
  r0.xyz = r1.xyz * r0.yzw + r2.xyz;
  r1.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r2.xyz = BA_Fragment_105_CB0((uint)(147)).xyz + -r1.xyz;
  r1.xyz = BA_Fragment_105_CB0((uint)(138)).xyz * r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = saturate(BA_Fragment_105_CB0((uint)(147)).w * r0.w);
  r0.w = 1 + -r0.w;
  r0.w = BA_Fragment_105_CB0((uint)(148)).w * r0.w;
  r2.xyz = BA_Fragment_105_CB0((uint)(148)).xyz * r0.www;
  r0.xyz = r0.xyz * r1.xyz + r2.xyz;
  r0.xyz = -BA_Fragment_105_CB0((uint)(146)).zzz * BA_Fragment_105_CB0((uint)(146)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_105_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_105_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_105_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_105_CB0((uint)(136)).xyz + BA_Fragment_105_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_105_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_105_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_105_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_106_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float2 v6 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = saturate(-BA_Fragment_106_CB0((uint)(132)).x + w1.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_106_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_106_CB0((uint)(133)).xyz * r1.zzz;
  r2.xyz = -r1.zzz * BA_Fragment_106_CB0((uint)(133)).xyz + float3(1,1,1);
  r0.yzw = r0.xxx * r2.xyz + r0.yzw;
  r1.x = r1.x * w1.x + -BA_Fragment_106_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_106_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_106_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_106_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_106_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_106_CB0((uint)(126)).xyz * r1.xyw;
  r2.xyz = BA_Fragment_106_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.xxx * r2.xyz + v5.xyz;
  r2.xyz = r2.xyz * BA_Fragment_106_CB0((uint)(128)).xxx + v4.xyz;
  r0.yzw = r2.xyz * r0.yzw + r1.xyw;
  r2.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyw = BA_Fragment_106_CB0((uint)(138)).xyz * r2.xyz;
  r0.yzw = r1.xyw * r0.yzw;
  r1.xyw = BA_Fragment_106_CB0((uint)(133)).xyz * r2.xyz;
  r2.xyz = -r1.xyw * r1.zzz + r2.xyz;
  r1.xyz = r1.xyw * r1.zzz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_106_CB0((uint)(146)).xyz + -r0.yzw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, v6.xy).xyzw;
  r0.x = r2.x * 2 + -1;
  r0.x = saturate(BA_Fragment_106_CB0((uint)(148)).x * abs(r0.x));
  r0.x = r0.x + r0.x;
  r0.x = min(1, r0.x);
  r0.x = BA_Fragment_106_CB0((uint)(145)).w * r0.x;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.xyz = -BA_Fragment_106_CB0((uint)(150)).zzz * BA_Fragment_106_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_106_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_106_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_106_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_106_CB0((uint)(136)).xyz + BA_Fragment_106_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_106_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_106_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_106_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_107_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD5,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float3 v6 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_107_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = saturate(-BA_Fragment_107_CB0((uint)(132)).x + v5.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_107_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_107_CB0((uint)(133)).xyz * r1.zzz;
  r2.xyz = -r1.zzz * BA_Fragment_107_CB0((uint)(133)).xyz + float3(1,1,1);
  r0.yzw = r0.xxx * r2.xyz + r0.yzw;
  r1.x = r1.x * v5.x + -BA_Fragment_107_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_107_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_107_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_107_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_107_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_107_CB0((uint)(126)).xyz * r1.xyw;
  r2.xyz = BA_Fragment_107_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.xxx * r2.xyz + v6.xyz;
  r2.xyz = r2.xyz * BA_Fragment_107_CB0((uint)(128)).xxx + v4.xyz;
  r0.yzw = r2.xyz * r0.yzw + r1.xyw;
  r2.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyw = BA_Fragment_107_CB0((uint)(138)).xyz * r2.xyz;
  r0.yzw = r1.xyw * r0.yzw;
  r1.xyw = BA_Fragment_107_CB0((uint)(133)).xyz * r2.xyz;
  r2.xyz = -r1.xyw * r1.zzz + r2.xyz;
  r1.xyz = r1.xyw * r1.zzz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_107_CB0((uint)(146)).xyz + -r0.yzw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, w1.xy).xyzw;
  r0.x = r2.x * 2 + -1;
  r0.x = saturate(BA_Fragment_107_CB0((uint)(148)).x * abs(r0.x));
  r0.x = r0.x + r0.x;
  r0.x = min(1, r0.x);
  r0.x = BA_Fragment_107_CB0((uint)(145)).w * r0.x;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.xyz = -BA_Fragment_107_CB0((uint)(150)).zzz * BA_Fragment_107_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_107_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_107_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_107_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_107_CB0((uint)(136)).xyz + BA_Fragment_107_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_107_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_107_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_107_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
float4 BA_Fragment_108_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 151u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 152u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float2 v6 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = saturate(-BA_Fragment_108_CB0((uint)(132)).x + w1.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_108_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_108_CB0((uint)(133)).xyz * r1.zzz;
  r2.xyz = -r1.zzz * BA_Fragment_108_CB0((uint)(133)).xyz + float3(1,1,1);
  r0.yzw = r0.xxx * r2.xyz + r0.yzw;
  r1.x = r1.x * w1.x + -BA_Fragment_108_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_108_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_108_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_108_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_108_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_108_CB0((uint)(126)).xyz * r1.xyw;
  r2.xyz = BA_Fragment_108_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.xxx * r2.xyz + v5.xyz;
  r2.xyz = r2.xyz * BA_Fragment_108_CB0((uint)(128)).xxx + v4.xyz;
  r0.yzw = r2.xyz * r0.yzw + r1.xyw;
  r2.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyw = BA_Fragment_108_CB0((uint)(151)).xyz + -r2.xyz;
  r1.x = dot(r1.xyw, r1.xyw);
  r1.x = saturate(BA_Fragment_108_CB0((uint)(151)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_108_CB0((uint)(152)).w * r1.x;
  r1.xyw = BA_Fragment_108_CB0((uint)(152)).xyz * r1.xxx;
  r3.xyz = BA_Fragment_108_CB0((uint)(138)).xyz * r2.xyz;
  r0.yzw = r0.yzw * r3.xyz + r1.xyw;
  r1.xyw = BA_Fragment_108_CB0((uint)(133)).xyz * r2.xyz;
  r2.xyz = -r1.xyw * r1.zzz + r2.xyz;
  r1.xyz = r1.xyw * r1.zzz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_108_CB0((uint)(146)).xyz + -r0.yzw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, v6.xy).xyzw;
  r0.x = r2.x * 2 + -1;
  r0.x = saturate(BA_Fragment_108_CB0((uint)(148)).x * abs(r0.x));
  r0.x = r0.x + r0.x;
  r0.x = min(1, r0.x);
  r0.x = BA_Fragment_108_CB0((uint)(145)).w * r0.x;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.xyz = -BA_Fragment_108_CB0((uint)(150)).zzz * BA_Fragment_108_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_108_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_108_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_108_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_108_CB0((uint)(136)).xyz + BA_Fragment_108_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_108_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_108_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_108_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
float4 BA_Fragment_109_CB0(uint i)
{
  float4 value = 0;
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 135u) value = float4(0.0, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 151u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 152u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD5,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float3 v6 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_109_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = saturate(-BA_Fragment_109_CB0((uint)(132)).x + v5.y);
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.y = r1.y * 2 + -1;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(BA_Fragment_109_CB0((uint)(141)).x * r0.x);
  r0.yzw = BA_Fragment_109_CB0((uint)(133)).xyz * r1.zzz;
  r2.xyz = -r1.zzz * BA_Fragment_109_CB0((uint)(133)).xyz + float3(1,1,1);
  r0.yzw = r0.xxx * r2.xyz + r0.yzw;
  r1.x = r1.x * v5.x + -BA_Fragment_109_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_109_CB0((uint)(143)).y * r1.x);
  r1.x = BA_Fragment_109_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_109_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_109_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_109_CB0((uint)(126)).xyz * r1.xyw;
  r2.xyz = BA_Fragment_109_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.xxx * r2.xyz + v6.xyz;
  r2.xyz = r2.xyz * BA_Fragment_109_CB0((uint)(128)).xxx + v4.xyz;
  r0.yzw = r2.xyz * r0.yzw + r1.xyw;
  r2.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyw = BA_Fragment_109_CB0((uint)(151)).xyz + -r2.xyz;
  r1.x = dot(r1.xyw, r1.xyw);
  r1.x = saturate(BA_Fragment_109_CB0((uint)(151)).w * r1.x);
  r1.x = 1 + -r1.x;
  r1.x = BA_Fragment_109_CB0((uint)(152)).w * r1.x;
  r1.xyw = BA_Fragment_109_CB0((uint)(152)).xyz * r1.xxx;
  r3.xyz = BA_Fragment_109_CB0((uint)(138)).xyz * r2.xyz;
  r0.yzw = r0.yzw * r3.xyz + r1.xyw;
  r1.xyw = BA_Fragment_109_CB0((uint)(133)).xyz * r2.xyz;
  r2.xyz = -r1.xyw * r1.zzz + r2.xyz;
  r1.xyz = r1.xyw * r1.zzz;
  r1.xyz = r0.xxx * r2.xyz + r1.xyz;
  r1.xyz = r1.xyz * BA_Fragment_109_CB0((uint)(146)).xyz + -r0.yzw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, w1.xy).xyzw;
  r0.x = r2.x * 2 + -1;
  r0.x = saturate(BA_Fragment_109_CB0((uint)(148)).x * abs(r0.x));
  r0.x = r0.x + r0.x;
  r0.x = min(1, r0.x);
  r0.x = BA_Fragment_109_CB0((uint)(145)).w * r0.x;
  r0.xyz = r0.xxx * r1.xyz + r0.yzw;
  r0.xyz = -BA_Fragment_109_CB0((uint)(150)).zzz * BA_Fragment_109_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_109_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_109_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_109_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_109_CB0((uint)(136)).xyz + BA_Fragment_109_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_109_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_109_CB0((uint)(56)).xyz + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_109_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_110_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_110_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_110_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD6,
  float3 v7 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_110_CB0((uint)(132)).x + w1.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_110_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_110_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.www * r2.xyz + v5.xyz;
  r3.xyz = BA_Fragment_110_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_110_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r0.w = r1.x * w1.x + -BA_Fragment_110_CB0((uint)(143)).x;
  r0.w = saturate(BA_Fragment_110_CB0((uint)(143)).y * r0.w);
  r1.xzw = r2.xyz * BA_Fragment_110_CB0((uint)(128)).xxx + v4.xyz;
  r2.x = min(BA_Fragment_110_CB2((uint)(11)).y, BA_Fragment_110_CB0((uint)(10)).x);
  r2.x = (int)r2.x;
  r2.yzw = float3(0,0,0);
  r3.w = 0;
  while (true) {
    r4.x = cmp((int)r3.w >= (int)r2.x);
    if (r4.x != 0) break;
    r4.x = (uint)r3.w >> 2;
    r4.y = (int)r3.w & 3;
    r4.x = dot(BA_Fragment_110_CB2((uint)(r4.x+12)).xyzw, icb[r4.y+0].xyzw);
    r4.x = (int)r4.x;
    r4.yzw = -v6.xyz * BA_Fragment_110_CB1((uint)(r4.x+0)).www + BA_Fragment_110_CB1((uint)(r4.x+0)).xyz;
    r5.x = dot(r4.yzw, r4.yzw);
    r5.x = max(6.10351563e-005, r5.x);
    r5.y = rsqrt(r5.x);
    r4.yzw = r5.yyy * r4.yzw;
    r5.y = 1 / r5.x;
    r5.x = BA_Fragment_110_CB1((uint)(r4.x+512)).x * r5.x;
    r5.x = -r5.x * r5.x + 1;
    r5.x = max(0, r5.x);
    r5.x = r5.x * r5.x;
    r5.x = r5.y * r5.x;
    r5.y = dot(BA_Fragment_110_CB1((uint)(r4.x+768)).xyz, r4.yzw);
    r5.y = saturate(r5.y * BA_Fragment_110_CB1((uint)(r4.x+512)).z + BA_Fragment_110_CB1((uint)(r4.x+512)).w);
    r5.y = r5.y * r5.y;
    r5.x = r5.x * r5.y;
    r5.xyz = BA_Fragment_110_CB1((uint)(r4.x+256)).xyz * r5.xxx;
    r4.x = dot(r4.yzw, v7.xyz);
    r4.y = r4.x + -r1.y;
    r4.x = saturate(r4.y * BA_Fragment_110_CB0((uint)(135)).x + r4.x);
    r2.yzw = r4.xxx * r5.xyz + r2.yzw;
    r3.w = (int)r3.w + 1;
  }
  r1.xyz = r2.yzw * BA_Fragment_110_CB0((uint)(134)).www + r1.xzw;
  r0.w = BA_Fragment_110_CB0((uint)(143)).z * r0.w;
  r0.w = BA_Fragment_110_CB0((uint)(128)).x * r0.w;
  r2.xyz = BA_Fragment_110_CB0((uint)(142)).xyz * r0.www;
  r2.xyz = BA_Fragment_110_CB0((uint)(126)).xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r0.xyz = BA_Fragment_110_CB0((uint)(138)).xyz * r0.xyz;
  r0.w = BA_Fragment_110_CB0((uint)(146)).z * BA_Fragment_110_CB0((uint)(146)).x;
  r0.xyz = r1.xyz * r0.xyz + -r0.www;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_110_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_110_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_110_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_110_CB0((uint)(136)).xyz + BA_Fragment_110_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_110_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
float4 BA_Fragment_111_CB2(uint i)
{
  float4 value = 0;
  if (i >= 12u && i < 14u) value = unity_LightIndices[min(i-12u,1u)];
  if (i == 11u) value = float4(unity_LightData.x, unity_LightData.y, unity_LightData.z, unity_LightData.w);
  return value;
}

float4 BA_Fragment_111_CB1(uint i)
{
  float4 value = 0;
  if (i >= 0u && i < 256u) value = _AdditionalLightsPosition[min(i-0u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 256u && i < 512u) value = _AdditionalLightsColor[min(i-256u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 512u && i < 768u) value = _AdditionalLightsAttenuation[min(i-512u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  if (i >= 768u && i < 1024u) value = _AdditionalLightsSpotDir[min(i-768u,(uint)(MAX_VISIBLE_LIGHTS-1))];
  return value;
}

float4 BA_Fragment_111_CB0(uint i)
{
  float4 value = 0;
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_111_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_111_CB0((uint)(132)).x + v5.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_111_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_111_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.www * r2.xyz + v6.xyz;
  r3.xyz = BA_Fragment_111_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_111_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r0.w = r1.x * v5.x + -BA_Fragment_111_CB0((uint)(143)).x;
  r0.w = saturate(BA_Fragment_111_CB0((uint)(143)).y * r0.w);
  r1.xzw = r2.xyz * BA_Fragment_111_CB0((uint)(128)).xxx + v4.xyz;
  r2.x = min(BA_Fragment_111_CB2((uint)(11)).y, BA_Fragment_111_CB0((uint)(10)).x);
  r2.x = (int)r2.x;
  r2.yzw = float3(0,0,0);
  r3.w = 0;
  while (true) {
    r4.x = cmp((int)r3.w >= (int)r2.x);
    if (r4.x != 0) break;
    r4.x = (uint)r3.w >> 2;
    r4.y = (int)r3.w & 3;
    r4.x = dot(BA_Fragment_111_CB2((uint)(r4.x+12)).xyzw, icb[r4.y+0].xyzw);
    r4.x = (int)r4.x;
    r4.yzw = -v7.xyz * BA_Fragment_111_CB1((uint)(r4.x+0)).www + BA_Fragment_111_CB1((uint)(r4.x+0)).xyz;
    r5.x = dot(r4.yzw, r4.yzw);
    r5.x = max(6.10351563e-005, r5.x);
    r5.y = rsqrt(r5.x);
    r4.yzw = r5.yyy * r4.yzw;
    r5.y = 1 / r5.x;
    r5.x = BA_Fragment_111_CB1((uint)(r4.x+512)).x * r5.x;
    r5.x = -r5.x * r5.x + 1;
    r5.x = max(0, r5.x);
    r5.x = r5.x * r5.x;
    r5.x = r5.y * r5.x;
    r5.y = dot(BA_Fragment_111_CB1((uint)(r4.x+768)).xyz, r4.yzw);
    r5.y = saturate(r5.y * BA_Fragment_111_CB1((uint)(r4.x+512)).z + BA_Fragment_111_CB1((uint)(r4.x+512)).w);
    r5.y = r5.y * r5.y;
    r5.x = r5.x * r5.y;
    r5.xyz = BA_Fragment_111_CB1((uint)(r4.x+256)).xyz * r5.xxx;
    r4.x = dot(r4.yzw, v8.xyz);
    r4.y = r4.x + -r1.y;
    r4.x = saturate(r4.y * BA_Fragment_111_CB0((uint)(135)).x + r4.x);
    r2.yzw = r4.xxx * r5.xyz + r2.yzw;
    r3.w = (int)r3.w + 1;
  }
  r1.xyz = r2.yzw * BA_Fragment_111_CB0((uint)(134)).www + r1.xzw;
  r0.w = BA_Fragment_111_CB0((uint)(143)).z * r0.w;
  r0.w = BA_Fragment_111_CB0((uint)(128)).x * r0.w;
  r2.xyz = BA_Fragment_111_CB0((uint)(142)).xyz * r0.www;
  r2.xyz = BA_Fragment_111_CB0((uint)(126)).xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r0.xyz = BA_Fragment_111_CB0((uint)(138)).xyz * r0.xyz;
  r0.w = BA_Fragment_111_CB0((uint)(146)).z * BA_Fragment_111_CB0((uint)(146)).x;
  r0.xyz = r1.xyz * r0.xyz + -r0.www;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_111_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_111_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_111_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_111_CB0((uint)(136)).xyz + BA_Fragment_111_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_111_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 147u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 148u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD6,
  float3 v7 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_112_CB0((uint)(132)).x + w1.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_112_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_112_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.www * r2.xyz + v5.xyz;
  r3.xyz = BA_Fragment_112_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_112_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r0.w = r1.x * w1.x + -BA_Fragment_112_CB0((uint)(143)).x;
  r0.w = saturate(BA_Fragment_112_CB0((uint)(143)).y * r0.w);
  r1.xzw = r2.xyz * BA_Fragment_112_CB0((uint)(128)).xxx + v4.xyz;
  r2.x = min(BA_Fragment_112_CB2((uint)(11)).y, BA_Fragment_112_CB0((uint)(10)).x);
  r2.x = (int)r2.x;
  r2.yzw = float3(0,0,0);
  r3.w = 0;
  while (true) {
    r4.x = cmp((int)r3.w >= (int)r2.x);
    if (r4.x != 0) break;
    r4.x = (uint)r3.w >> 2;
    r4.y = (int)r3.w & 3;
    r4.x = dot(BA_Fragment_112_CB2((uint)(r4.x+12)).xyzw, icb[r4.y+0].xyzw);
    r4.x = (int)r4.x;
    r4.yzw = -v6.xyz * BA_Fragment_112_CB1((uint)(r4.x+0)).www + BA_Fragment_112_CB1((uint)(r4.x+0)).xyz;
    r5.x = dot(r4.yzw, r4.yzw);
    r5.x = max(6.10351563e-005, r5.x);
    r5.y = rsqrt(r5.x);
    r4.yzw = r5.yyy * r4.yzw;
    r5.y = 1 / r5.x;
    r5.x = BA_Fragment_112_CB1((uint)(r4.x+512)).x * r5.x;
    r5.x = -r5.x * r5.x + 1;
    r5.x = max(0, r5.x);
    r5.x = r5.x * r5.x;
    r5.x = r5.y * r5.x;
    r5.y = dot(BA_Fragment_112_CB1((uint)(r4.x+768)).xyz, r4.yzw);
    r5.y = saturate(r5.y * BA_Fragment_112_CB1((uint)(r4.x+512)).z + BA_Fragment_112_CB1((uint)(r4.x+512)).w);
    r5.y = r5.y * r5.y;
    r5.x = r5.x * r5.y;
    r5.xyz = BA_Fragment_112_CB1((uint)(r4.x+256)).xyz * r5.xxx;
    r4.x = dot(r4.yzw, v7.xyz);
    r4.y = r4.x + -r1.y;
    r4.x = saturate(r4.y * BA_Fragment_112_CB0((uint)(135)).x + r4.x);
    r2.yzw = r4.xxx * r5.xyz + r2.yzw;
    r3.w = (int)r3.w + 1;
  }
  r1.xyz = r2.yzw * BA_Fragment_112_CB0((uint)(134)).www + r1.xzw;
  r0.w = BA_Fragment_112_CB0((uint)(143)).z * r0.w;
  r0.w = BA_Fragment_112_CB0((uint)(128)).x * r0.w;
  r2.xyz = BA_Fragment_112_CB0((uint)(142)).xyz * r0.www;
  r2.xyz = BA_Fragment_112_CB0((uint)(126)).xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r2.xyz = BA_Fragment_112_CB0((uint)(138)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_112_CB0((uint)(147)).xyz + -r0.xyz;
  r0.x = dot(r0.xyz, r0.xyz);
  r0.x = saturate(BA_Fragment_112_CB0((uint)(147)).w * r0.x);
  r0.x = 1 + -r0.x;
  r0.x = BA_Fragment_112_CB0((uint)(148)).w * r0.x;
  r0.xyz = BA_Fragment_112_CB0((uint)(148)).xyz * r0.xxx;
  r0.xyz = r1.xyz * r2.xyz + r0.xyz;
  r0.xyz = -BA_Fragment_112_CB0((uint)(146)).zzz * BA_Fragment_112_CB0((uint)(146)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_112_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_112_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_112_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_112_CB0((uint)(136)).xyz + BA_Fragment_112_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_112_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 147u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 148u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_113_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_113_CB0((uint)(132)).x + v5.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_113_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_113_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.www * r2.xyz + v6.xyz;
  r3.xyz = BA_Fragment_113_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_113_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r0.w = r1.x * v5.x + -BA_Fragment_113_CB0((uint)(143)).x;
  r0.w = saturate(BA_Fragment_113_CB0((uint)(143)).y * r0.w);
  r1.xzw = r2.xyz * BA_Fragment_113_CB0((uint)(128)).xxx + v4.xyz;
  r2.x = min(BA_Fragment_113_CB2((uint)(11)).y, BA_Fragment_113_CB0((uint)(10)).x);
  r2.x = (int)r2.x;
  r2.yzw = float3(0,0,0);
  r3.w = 0;
  while (true) {
    r4.x = cmp((int)r3.w >= (int)r2.x);
    if (r4.x != 0) break;
    r4.x = (uint)r3.w >> 2;
    r4.y = (int)r3.w & 3;
    r4.x = dot(BA_Fragment_113_CB2((uint)(r4.x+12)).xyzw, icb[r4.y+0].xyzw);
    r4.x = (int)r4.x;
    r4.yzw = -v7.xyz * BA_Fragment_113_CB1((uint)(r4.x+0)).www + BA_Fragment_113_CB1((uint)(r4.x+0)).xyz;
    r5.x = dot(r4.yzw, r4.yzw);
    r5.x = max(6.10351563e-005, r5.x);
    r5.y = rsqrt(r5.x);
    r4.yzw = r5.yyy * r4.yzw;
    r5.y = 1 / r5.x;
    r5.x = BA_Fragment_113_CB1((uint)(r4.x+512)).x * r5.x;
    r5.x = -r5.x * r5.x + 1;
    r5.x = max(0, r5.x);
    r5.x = r5.x * r5.x;
    r5.x = r5.y * r5.x;
    r5.y = dot(BA_Fragment_113_CB1((uint)(r4.x+768)).xyz, r4.yzw);
    r5.y = saturate(r5.y * BA_Fragment_113_CB1((uint)(r4.x+512)).z + BA_Fragment_113_CB1((uint)(r4.x+512)).w);
    r5.y = r5.y * r5.y;
    r5.x = r5.x * r5.y;
    r5.xyz = BA_Fragment_113_CB1((uint)(r4.x+256)).xyz * r5.xxx;
    r4.x = dot(r4.yzw, v8.xyz);
    r4.y = r4.x + -r1.y;
    r4.x = saturate(r4.y * BA_Fragment_113_CB0((uint)(135)).x + r4.x);
    r2.yzw = r4.xxx * r5.xyz + r2.yzw;
    r3.w = (int)r3.w + 1;
  }
  r1.xyz = r2.yzw * BA_Fragment_113_CB0((uint)(134)).www + r1.xzw;
  r0.w = BA_Fragment_113_CB0((uint)(143)).z * r0.w;
  r0.w = BA_Fragment_113_CB0((uint)(128)).x * r0.w;
  r2.xyz = BA_Fragment_113_CB0((uint)(142)).xyz * r0.www;
  r2.xyz = BA_Fragment_113_CB0((uint)(126)).xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r2.xyz = BA_Fragment_113_CB0((uint)(138)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_113_CB0((uint)(147)).xyz + -r0.xyz;
  r0.x = dot(r0.xyz, r0.xyz);
  r0.x = saturate(BA_Fragment_113_CB0((uint)(147)).w * r0.x);
  r0.x = 1 + -r0.x;
  r0.x = BA_Fragment_113_CB0((uint)(148)).w * r0.x;
  r0.xyz = BA_Fragment_113_CB0((uint)(148)).xyz * r0.xxx;
  r0.xyz = r1.xyz * r2.xyz + r0.xyz;
  r0.xyz = -BA_Fragment_113_CB0((uint)(146)).zzz * BA_Fragment_113_CB0((uint)(146)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_113_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_113_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_113_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_113_CB0((uint)(136)).xyz + BA_Fragment_113_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_113_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_114_CB0((uint)(132)).x + w1.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_114_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_114_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.www * r2.xyz + v5.xyz;
  r3.xyz = BA_Fragment_114_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_114_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r1.x = r1.x * w1.x + -BA_Fragment_114_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_114_CB0((uint)(143)).y * r1.x);
  r2.xyz = r2.xyz * BA_Fragment_114_CB0((uint)(128)).xxx + v4.xyz;
  r1.w = min(BA_Fragment_114_CB2((uint)(11)).y, BA_Fragment_114_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r4.xyz = float3(0,0,0);
  r2.w = 0;
  while (true) {
    r3.w = cmp((int)r2.w >= (int)r1.w);
    if (r3.w != 0) break;
    r3.w = (uint)r2.w >> 2;
    r4.w = (int)r2.w & 3;
    r3.w = dot(BA_Fragment_114_CB2((uint)(r3.w+12)).xyzw, icb[r4.w+0].xyzw);
    r3.w = (int)r3.w;
    r5.xyz = -v7.xyz * BA_Fragment_114_CB1((uint)(r3.w+0)).www + BA_Fragment_114_CB1((uint)(r3.w+0)).xyz;
    r4.w = dot(r5.xyz, r5.xyz);
    r4.w = max(6.10351563e-005, r4.w);
    r5.w = rsqrt(r4.w);
    r5.xyz = r5.xyz * r5.www;
    r5.w = 1 / r4.w;
    r4.w = BA_Fragment_114_CB1((uint)(r3.w+512)).x * r4.w;
    r4.w = -r4.w * r4.w + 1;
    r4.w = max(0, r4.w);
    r4.w = r4.w * r4.w;
    r4.w = r5.w * r4.w;
    r5.w = dot(BA_Fragment_114_CB1((uint)(r3.w+768)).xyz, r5.xyz);
    r5.w = saturate(r5.w * BA_Fragment_114_CB1((uint)(r3.w+512)).z + BA_Fragment_114_CB1((uint)(r3.w+512)).w);
    r5.w = r5.w * r5.w;
    r4.w = r5.w * r4.w;
    r6.xyz = BA_Fragment_114_CB1((uint)(r3.w+256)).xyz * r4.www;
    r3.w = dot(r5.xyz, v8.xyz);
    r4.w = r3.w + -r1.y;
    r3.w = saturate(r4.w * BA_Fragment_114_CB0((uint)(135)).x + r3.w);
    r4.xyz = r3.www * r6.xyz + r4.xyz;
    r2.w = (int)r2.w + 1;
  }
  r2.xyz = r4.xyz * BA_Fragment_114_CB0((uint)(134)).www + r2.xyz;
  r1.x = BA_Fragment_114_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_114_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_114_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_114_CB0((uint)(126)).xyz * r1.xyw;
  r1.xyw = r2.xyz * r3.xyz + r1.xyw;
  r2.xyz = BA_Fragment_114_CB0((uint)(138)).xyz * r0.xyz;
  r1.xyw = r2.xyz * r1.xyw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, v6.xy).xyzw;
  r2.x = r2.x * 2 + -1;
  r2.x = saturate(BA_Fragment_114_CB0((uint)(148)).x * abs(r2.x));
  r2.x = r2.x + r2.x;
  r2.x = min(1, r2.x);
  r2.x = BA_Fragment_114_CB0((uint)(145)).w * r2.x;
  r2.yzw = BA_Fragment_114_CB0((uint)(133)).xyz * r0.xyz;
  r3.xyz = r2.yzw * r1.zzz;
  r0.xyz = -r2.yzw * r1.zzz + r0.xyz;
  r0.xyz = r0.www * r0.xyz + r3.xyz;
  r0.xyz = r0.xyz * BA_Fragment_114_CB0((uint)(146)).xyz + -r1.xyw;
  r0.xyz = r2.xxx * r0.xyz + r1.xyw;
  r0.xyz = -BA_Fragment_114_CB0((uint)(150)).zzz * BA_Fragment_114_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_114_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_114_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_114_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_114_CB0((uint)(136)).xyz + BA_Fragment_114_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_114_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD5,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_115_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_115_CB0((uint)(132)).x + v5.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_115_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_115_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.www * r2.xyz + v6.xyz;
  r3.xyz = BA_Fragment_115_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_115_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r1.x = r1.x * v5.x + -BA_Fragment_115_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_115_CB0((uint)(143)).y * r1.x);
  r2.xyz = r2.xyz * BA_Fragment_115_CB0((uint)(128)).xxx + v4.xyz;
  r1.w = min(BA_Fragment_115_CB2((uint)(11)).y, BA_Fragment_115_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r4.xyz = float3(0,0,0);
  r2.w = 0;
  while (true) {
    r3.w = cmp((int)r2.w >= (int)r1.w);
    if (r3.w != 0) break;
    r3.w = (uint)r2.w >> 2;
    r4.w = (int)r2.w & 3;
    r3.w = dot(BA_Fragment_115_CB2((uint)(r3.w+12)).xyzw, icb[r4.w+0].xyzw);
    r3.w = (int)r3.w;
    r5.xyz = -v7.xyz * BA_Fragment_115_CB1((uint)(r3.w+0)).www + BA_Fragment_115_CB1((uint)(r3.w+0)).xyz;
    r4.w = dot(r5.xyz, r5.xyz);
    r4.w = max(6.10351563e-005, r4.w);
    r5.w = rsqrt(r4.w);
    r5.xyz = r5.xyz * r5.www;
    r5.w = 1 / r4.w;
    r4.w = BA_Fragment_115_CB1((uint)(r3.w+512)).x * r4.w;
    r4.w = -r4.w * r4.w + 1;
    r4.w = max(0, r4.w);
    r4.w = r4.w * r4.w;
    r4.w = r5.w * r4.w;
    r5.w = dot(BA_Fragment_115_CB1((uint)(r3.w+768)).xyz, r5.xyz);
    r5.w = saturate(r5.w * BA_Fragment_115_CB1((uint)(r3.w+512)).z + BA_Fragment_115_CB1((uint)(r3.w+512)).w);
    r5.w = r5.w * r5.w;
    r4.w = r5.w * r4.w;
    r6.xyz = BA_Fragment_115_CB1((uint)(r3.w+256)).xyz * r4.www;
    r3.w = dot(r5.xyz, v8.xyz);
    r4.w = r3.w + -r1.y;
    r3.w = saturate(r4.w * BA_Fragment_115_CB0((uint)(135)).x + r3.w);
    r4.xyz = r3.www * r6.xyz + r4.xyz;
    r2.w = (int)r2.w + 1;
  }
  r2.xyz = r4.xyz * BA_Fragment_115_CB0((uint)(134)).www + r2.xyz;
  r1.x = BA_Fragment_115_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_115_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_115_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_115_CB0((uint)(126)).xyz * r1.xyw;
  r1.xyw = r2.xyz * r3.xyz + r1.xyw;
  r2.xyz = BA_Fragment_115_CB0((uint)(138)).xyz * r0.xyz;
  r1.xyw = r2.xyz * r1.xyw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, w1.xy).xyzw;
  r2.x = r2.x * 2 + -1;
  r2.x = saturate(BA_Fragment_115_CB0((uint)(148)).x * abs(r2.x));
  r2.x = r2.x + r2.x;
  r2.x = min(1, r2.x);
  r2.x = BA_Fragment_115_CB0((uint)(145)).w * r2.x;
  r2.yzw = BA_Fragment_115_CB0((uint)(133)).xyz * r0.xyz;
  r3.xyz = r2.yzw * r1.zzz;
  r0.xyz = -r2.yzw * r1.zzz + r0.xyz;
  r0.xyz = r0.www * r0.xyz + r3.xyz;
  r0.xyz = r0.xyz * BA_Fragment_115_CB0((uint)(146)).xyz + -r1.xyw;
  r0.xyz = r2.xxx * r0.xyz + r1.xyw;
  r0.xyz = -BA_Fragment_115_CB0((uint)(150)).zzz * BA_Fragment_115_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_115_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_115_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_115_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_115_CB0((uint)(136)).xyz + BA_Fragment_115_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_115_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 151u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 152u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_116_CB0((uint)(132)).x + w1.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_116_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_116_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.www * r2.xyz + v5.xyz;
  r3.xyz = BA_Fragment_116_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_116_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r1.x = r1.x * w1.x + -BA_Fragment_116_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_116_CB0((uint)(143)).y * r1.x);
  r2.xyz = r2.xyz * BA_Fragment_116_CB0((uint)(128)).xxx + v4.xyz;
  r1.w = min(BA_Fragment_116_CB2((uint)(11)).y, BA_Fragment_116_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r4.xyz = float3(0,0,0);
  r2.w = 0;
  while (true) {
    r3.w = cmp((int)r2.w >= (int)r1.w);
    if (r3.w != 0) break;
    r3.w = (uint)r2.w >> 2;
    r4.w = (int)r2.w & 3;
    r3.w = dot(BA_Fragment_116_CB2((uint)(r3.w+12)).xyzw, icb[r4.w+0].xyzw);
    r3.w = (int)r3.w;
    r5.xyz = -v7.xyz * BA_Fragment_116_CB1((uint)(r3.w+0)).www + BA_Fragment_116_CB1((uint)(r3.w+0)).xyz;
    r4.w = dot(r5.xyz, r5.xyz);
    r4.w = max(6.10351563e-005, r4.w);
    r5.w = rsqrt(r4.w);
    r5.xyz = r5.xyz * r5.www;
    r5.w = 1 / r4.w;
    r4.w = BA_Fragment_116_CB1((uint)(r3.w+512)).x * r4.w;
    r4.w = -r4.w * r4.w + 1;
    r4.w = max(0, r4.w);
    r4.w = r4.w * r4.w;
    r4.w = r5.w * r4.w;
    r5.w = dot(BA_Fragment_116_CB1((uint)(r3.w+768)).xyz, r5.xyz);
    r5.w = saturate(r5.w * BA_Fragment_116_CB1((uint)(r3.w+512)).z + BA_Fragment_116_CB1((uint)(r3.w+512)).w);
    r5.w = r5.w * r5.w;
    r4.w = r5.w * r4.w;
    r6.xyz = BA_Fragment_116_CB1((uint)(r3.w+256)).xyz * r4.www;
    r3.w = dot(r5.xyz, v8.xyz);
    r4.w = r3.w + -r1.y;
    r3.w = saturate(r4.w * BA_Fragment_116_CB0((uint)(135)).x + r3.w);
    r4.xyz = r3.www * r6.xyz + r4.xyz;
    r2.w = (int)r2.w + 1;
  }
  r2.xyz = r4.xyz * BA_Fragment_116_CB0((uint)(134)).www + r2.xyz;
  r1.x = BA_Fragment_116_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_116_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_116_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_116_CB0((uint)(126)).xyz * r1.xyw;
  r1.xyw = r2.xyz * r3.xyz + r1.xyw;
  r2.xyz = BA_Fragment_116_CB0((uint)(138)).xyz * r0.xyz;
  r3.xyz = BA_Fragment_116_CB0((uint)(151)).xyz + -r0.xyz;
  r2.w = dot(r3.xyz, r3.xyz);
  r2.w = saturate(BA_Fragment_116_CB0((uint)(151)).w * r2.w);
  r2.w = 1 + -r2.w;
  r2.w = BA_Fragment_116_CB0((uint)(152)).w * r2.w;
  r3.xyz = BA_Fragment_116_CB0((uint)(152)).xyz * r2.www;
  r1.xyw = r1.xyw * r2.xyz + r3.xyz;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, v6.xy).xyzw;
  r2.x = r2.x * 2 + -1;
  r2.x = saturate(BA_Fragment_116_CB0((uint)(148)).x * abs(r2.x));
  r2.x = r2.x + r2.x;
  r2.x = min(1, r2.x);
  r2.x = BA_Fragment_116_CB0((uint)(145)).w * r2.x;
  r2.yzw = BA_Fragment_116_CB0((uint)(133)).xyz * r0.xyz;
  r3.xyz = r2.yzw * r1.zzz;
  r0.xyz = -r2.yzw * r1.zzz + r0.xyz;
  r0.xyz = r0.www * r0.xyz + r3.xyz;
  r0.xyz = r0.xyz * BA_Fragment_116_CB0((uint)(146)).xyz + -r1.xyw;
  r0.xyz = r2.xxx * r0.xyz + r1.xyw;
  r0.xyz = -BA_Fragment_116_CB0((uint)(150)).zzz * BA_Fragment_116_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_116_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_116_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_116_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_116_CB0((uint)(136)).xyz + BA_Fragment_116_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_116_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 151u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 152u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD5,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_117_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_117_CB0((uint)(132)).x + v5.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_117_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_117_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.www * r2.xyz + v6.xyz;
  r3.xyz = BA_Fragment_117_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_117_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r1.x = r1.x * v5.x + -BA_Fragment_117_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_117_CB0((uint)(143)).y * r1.x);
  r2.xyz = r2.xyz * BA_Fragment_117_CB0((uint)(128)).xxx + v4.xyz;
  r1.w = min(BA_Fragment_117_CB2((uint)(11)).y, BA_Fragment_117_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r4.xyz = float3(0,0,0);
  r2.w = 0;
  while (true) {
    r3.w = cmp((int)r2.w >= (int)r1.w);
    if (r3.w != 0) break;
    r3.w = (uint)r2.w >> 2;
    r4.w = (int)r2.w & 3;
    r3.w = dot(BA_Fragment_117_CB2((uint)(r3.w+12)).xyzw, icb[r4.w+0].xyzw);
    r3.w = (int)r3.w;
    r5.xyz = -v7.xyz * BA_Fragment_117_CB1((uint)(r3.w+0)).www + BA_Fragment_117_CB1((uint)(r3.w+0)).xyz;
    r4.w = dot(r5.xyz, r5.xyz);
    r4.w = max(6.10351563e-005, r4.w);
    r5.w = rsqrt(r4.w);
    r5.xyz = r5.xyz * r5.www;
    r5.w = 1 / r4.w;
    r4.w = BA_Fragment_117_CB1((uint)(r3.w+512)).x * r4.w;
    r4.w = -r4.w * r4.w + 1;
    r4.w = max(0, r4.w);
    r4.w = r4.w * r4.w;
    r4.w = r5.w * r4.w;
    r5.w = dot(BA_Fragment_117_CB1((uint)(r3.w+768)).xyz, r5.xyz);
    r5.w = saturate(r5.w * BA_Fragment_117_CB1((uint)(r3.w+512)).z + BA_Fragment_117_CB1((uint)(r3.w+512)).w);
    r5.w = r5.w * r5.w;
    r4.w = r5.w * r4.w;
    r6.xyz = BA_Fragment_117_CB1((uint)(r3.w+256)).xyz * r4.www;
    r3.w = dot(r5.xyz, v8.xyz);
    r4.w = r3.w + -r1.y;
    r3.w = saturate(r4.w * BA_Fragment_117_CB0((uint)(135)).x + r3.w);
    r4.xyz = r3.www * r6.xyz + r4.xyz;
    r2.w = (int)r2.w + 1;
  }
  r2.xyz = r4.xyz * BA_Fragment_117_CB0((uint)(134)).www + r2.xyz;
  r1.x = BA_Fragment_117_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_117_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_117_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_117_CB0((uint)(126)).xyz * r1.xyw;
  r1.xyw = r2.xyz * r3.xyz + r1.xyw;
  r2.xyz = BA_Fragment_117_CB0((uint)(138)).xyz * r0.xyz;
  r3.xyz = BA_Fragment_117_CB0((uint)(151)).xyz + -r0.xyz;
  r2.w = dot(r3.xyz, r3.xyz);
  r2.w = saturate(BA_Fragment_117_CB0((uint)(151)).w * r2.w);
  r2.w = 1 + -r2.w;
  r2.w = BA_Fragment_117_CB0((uint)(152)).w * r2.w;
  r3.xyz = BA_Fragment_117_CB0((uint)(152)).xyz * r2.www;
  r1.xyw = r1.xyw * r2.xyz + r3.xyz;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, w1.xy).xyzw;
  r2.x = r2.x * 2 + -1;
  r2.x = saturate(BA_Fragment_117_CB0((uint)(148)).x * abs(r2.x));
  r2.x = r2.x + r2.x;
  r2.x = min(1, r2.x);
  r2.x = BA_Fragment_117_CB0((uint)(145)).w * r2.x;
  r2.yzw = BA_Fragment_117_CB0((uint)(133)).xyz * r0.xyz;
  r3.xyz = r2.yzw * r1.zzz;
  r0.xyz = -r2.yzw * r1.zzz + r0.xyz;
  r0.xyz = r0.www * r0.xyz + r3.xyz;
  r0.xyz = r0.xyz * BA_Fragment_117_CB0((uint)(146)).xyz + -r1.xyw;
  r0.xyz = r2.xxx * r0.xyz + r1.xyw;
  r0.xyz = -BA_Fragment_117_CB0((uint)(150)).zzz * BA_Fragment_117_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_117_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_117_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_117_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_117_CB0((uint)(136)).xyz + BA_Fragment_117_CB0((uint)(135)).yzw;
  o0.xyz = BA_Fragment_117_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD6,
  float3 v7 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_118_CB0((uint)(132)).x + w1.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_118_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_118_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.www * r2.xyz + v5.xyz;
  r3.xyz = BA_Fragment_118_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_118_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r0.w = r1.x * w1.x + -BA_Fragment_118_CB0((uint)(143)).x;
  r0.w = saturate(BA_Fragment_118_CB0((uint)(143)).y * r0.w);
  r1.xzw = r2.xyz * BA_Fragment_118_CB0((uint)(128)).xxx + v4.xyz;
  r2.x = min(BA_Fragment_118_CB2((uint)(11)).y, BA_Fragment_118_CB0((uint)(10)).x);
  r2.x = (int)r2.x;
  r2.yzw = float3(0,0,0);
  r3.w = 0;
  while (true) {
    r4.x = cmp((int)r3.w >= (int)r2.x);
    if (r4.x != 0) break;
    r4.x = (uint)r3.w >> 2;
    r4.y = (int)r3.w & 3;
    r4.x = dot(BA_Fragment_118_CB2((uint)(r4.x+12)).xyzw, icb[r4.y+0].xyzw);
    r4.x = (int)r4.x;
    r4.yzw = -v6.xyz * BA_Fragment_118_CB1((uint)(r4.x+0)).www + BA_Fragment_118_CB1((uint)(r4.x+0)).xyz;
    r5.x = dot(r4.yzw, r4.yzw);
    r5.x = max(6.10351563e-005, r5.x);
    r5.y = rsqrt(r5.x);
    r4.yzw = r5.yyy * r4.yzw;
    r5.y = 1 / r5.x;
    r5.x = BA_Fragment_118_CB1((uint)(r4.x+512)).x * r5.x;
    r5.x = -r5.x * r5.x + 1;
    r5.x = max(0, r5.x);
    r5.x = r5.x * r5.x;
    r5.x = r5.y * r5.x;
    r5.y = dot(BA_Fragment_118_CB1((uint)(r4.x+768)).xyz, r4.yzw);
    r5.y = saturate(r5.y * BA_Fragment_118_CB1((uint)(r4.x+512)).z + BA_Fragment_118_CB1((uint)(r4.x+512)).w);
    r5.y = r5.y * r5.y;
    r5.x = r5.x * r5.y;
    r5.xyz = BA_Fragment_118_CB1((uint)(r4.x+256)).xyz * r5.xxx;
    r4.x = dot(r4.yzw, v7.xyz);
    r4.y = r4.x + -r1.y;
    r4.x = saturate(r4.y * BA_Fragment_118_CB0((uint)(135)).x + r4.x);
    r2.yzw = r4.xxx * r5.xyz + r2.yzw;
    r3.w = (int)r3.w + 1;
  }
  r1.xyz = r2.yzw * BA_Fragment_118_CB0((uint)(134)).www + r1.xzw;
  r0.w = BA_Fragment_118_CB0((uint)(143)).z * r0.w;
  r0.w = BA_Fragment_118_CB0((uint)(128)).x * r0.w;
  r2.xyz = BA_Fragment_118_CB0((uint)(142)).xyz * r0.www;
  r2.xyz = BA_Fragment_118_CB0((uint)(126)).xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r0.xyz = BA_Fragment_118_CB0((uint)(138)).xyz * r0.xyz;
  r0.w = BA_Fragment_118_CB0((uint)(146)).z * BA_Fragment_118_CB0((uint)(146)).x;
  r0.xyz = r1.xyz * r0.xyz + -r0.www;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_118_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_118_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_118_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_118_CB0((uint)(136)).xyz + BA_Fragment_118_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_118_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_118_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_118_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_119_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_119_CB0((uint)(132)).x + v5.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_119_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_119_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.www * r2.xyz + v6.xyz;
  r3.xyz = BA_Fragment_119_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_119_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r0.w = r1.x * v5.x + -BA_Fragment_119_CB0((uint)(143)).x;
  r0.w = saturate(BA_Fragment_119_CB0((uint)(143)).y * r0.w);
  r1.xzw = r2.xyz * BA_Fragment_119_CB0((uint)(128)).xxx + v4.xyz;
  r2.x = min(BA_Fragment_119_CB2((uint)(11)).y, BA_Fragment_119_CB0((uint)(10)).x);
  r2.x = (int)r2.x;
  r2.yzw = float3(0,0,0);
  r3.w = 0;
  while (true) {
    r4.x = cmp((int)r3.w >= (int)r2.x);
    if (r4.x != 0) break;
    r4.x = (uint)r3.w >> 2;
    r4.y = (int)r3.w & 3;
    r4.x = dot(BA_Fragment_119_CB2((uint)(r4.x+12)).xyzw, icb[r4.y+0].xyzw);
    r4.x = (int)r4.x;
    r4.yzw = -v7.xyz * BA_Fragment_119_CB1((uint)(r4.x+0)).www + BA_Fragment_119_CB1((uint)(r4.x+0)).xyz;
    r5.x = dot(r4.yzw, r4.yzw);
    r5.x = max(6.10351563e-005, r5.x);
    r5.y = rsqrt(r5.x);
    r4.yzw = r5.yyy * r4.yzw;
    r5.y = 1 / r5.x;
    r5.x = BA_Fragment_119_CB1((uint)(r4.x+512)).x * r5.x;
    r5.x = -r5.x * r5.x + 1;
    r5.x = max(0, r5.x);
    r5.x = r5.x * r5.x;
    r5.x = r5.y * r5.x;
    r5.y = dot(BA_Fragment_119_CB1((uint)(r4.x+768)).xyz, r4.yzw);
    r5.y = saturate(r5.y * BA_Fragment_119_CB1((uint)(r4.x+512)).z + BA_Fragment_119_CB1((uint)(r4.x+512)).w);
    r5.y = r5.y * r5.y;
    r5.x = r5.x * r5.y;
    r5.xyz = BA_Fragment_119_CB1((uint)(r4.x+256)).xyz * r5.xxx;
    r4.x = dot(r4.yzw, v8.xyz);
    r4.y = r4.x + -r1.y;
    r4.x = saturate(r4.y * BA_Fragment_119_CB0((uint)(135)).x + r4.x);
    r2.yzw = r4.xxx * r5.xyz + r2.yzw;
    r3.w = (int)r3.w + 1;
  }
  r1.xyz = r2.yzw * BA_Fragment_119_CB0((uint)(134)).www + r1.xzw;
  r0.w = BA_Fragment_119_CB0((uint)(143)).z * r0.w;
  r0.w = BA_Fragment_119_CB0((uint)(128)).x * r0.w;
  r2.xyz = BA_Fragment_119_CB0((uint)(142)).xyz * r0.www;
  r2.xyz = BA_Fragment_119_CB0((uint)(126)).xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r0.xyz = BA_Fragment_119_CB0((uint)(138)).xyz * r0.xyz;
  r0.w = BA_Fragment_119_CB0((uint)(146)).z * BA_Fragment_119_CB0((uint)(146)).x;
  r0.xyz = r1.xyz * r0.xyz + -r0.www;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_119_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_119_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_119_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_119_CB0((uint)(136)).xyz + BA_Fragment_119_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_119_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_119_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_119_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 147u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 148u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD6,
  float3 v7 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_120_CB0((uint)(132)).x + w1.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_120_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_120_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.www * r2.xyz + v5.xyz;
  r3.xyz = BA_Fragment_120_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_120_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r0.w = r1.x * w1.x + -BA_Fragment_120_CB0((uint)(143)).x;
  r0.w = saturate(BA_Fragment_120_CB0((uint)(143)).y * r0.w);
  r1.xzw = r2.xyz * BA_Fragment_120_CB0((uint)(128)).xxx + v4.xyz;
  r2.x = min(BA_Fragment_120_CB2((uint)(11)).y, BA_Fragment_120_CB0((uint)(10)).x);
  r2.x = (int)r2.x;
  r2.yzw = float3(0,0,0);
  r3.w = 0;
  while (true) {
    r4.x = cmp((int)r3.w >= (int)r2.x);
    if (r4.x != 0) break;
    r4.x = (uint)r3.w >> 2;
    r4.y = (int)r3.w & 3;
    r4.x = dot(BA_Fragment_120_CB2((uint)(r4.x+12)).xyzw, icb[r4.y+0].xyzw);
    r4.x = (int)r4.x;
    r4.yzw = -v6.xyz * BA_Fragment_120_CB1((uint)(r4.x+0)).www + BA_Fragment_120_CB1((uint)(r4.x+0)).xyz;
    r5.x = dot(r4.yzw, r4.yzw);
    r5.x = max(6.10351563e-005, r5.x);
    r5.y = rsqrt(r5.x);
    r4.yzw = r5.yyy * r4.yzw;
    r5.y = 1 / r5.x;
    r5.x = BA_Fragment_120_CB1((uint)(r4.x+512)).x * r5.x;
    r5.x = -r5.x * r5.x + 1;
    r5.x = max(0, r5.x);
    r5.x = r5.x * r5.x;
    r5.x = r5.y * r5.x;
    r5.y = dot(BA_Fragment_120_CB1((uint)(r4.x+768)).xyz, r4.yzw);
    r5.y = saturate(r5.y * BA_Fragment_120_CB1((uint)(r4.x+512)).z + BA_Fragment_120_CB1((uint)(r4.x+512)).w);
    r5.y = r5.y * r5.y;
    r5.x = r5.x * r5.y;
    r5.xyz = BA_Fragment_120_CB1((uint)(r4.x+256)).xyz * r5.xxx;
    r4.x = dot(r4.yzw, v7.xyz);
    r4.y = r4.x + -r1.y;
    r4.x = saturate(r4.y * BA_Fragment_120_CB0((uint)(135)).x + r4.x);
    r2.yzw = r4.xxx * r5.xyz + r2.yzw;
    r3.w = (int)r3.w + 1;
  }
  r1.xyz = r2.yzw * BA_Fragment_120_CB0((uint)(134)).www + r1.xzw;
  r0.w = BA_Fragment_120_CB0((uint)(143)).z * r0.w;
  r0.w = BA_Fragment_120_CB0((uint)(128)).x * r0.w;
  r2.xyz = BA_Fragment_120_CB0((uint)(142)).xyz * r0.www;
  r2.xyz = BA_Fragment_120_CB0((uint)(126)).xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r2.xyz = BA_Fragment_120_CB0((uint)(138)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_120_CB0((uint)(147)).xyz + -r0.xyz;
  r0.x = dot(r0.xyz, r0.xyz);
  r0.x = saturate(BA_Fragment_120_CB0((uint)(147)).w * r0.x);
  r0.x = 1 + -r0.x;
  r0.x = BA_Fragment_120_CB0((uint)(148)).w * r0.x;
  r0.xyz = BA_Fragment_120_CB0((uint)(148)).xyz * r0.xxx;
  r0.xyz = r1.xyz * r2.xyz + r0.xyz;
  r0.xyz = -BA_Fragment_120_CB0((uint)(146)).zzz * BA_Fragment_120_CB0((uint)(146)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_120_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_120_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_120_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_120_CB0((uint)(136)).xyz + BA_Fragment_120_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_120_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_120_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_120_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 147u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 148u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_121_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_121_CB0((uint)(132)).x + v5.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_121_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_121_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.www * r2.xyz + v6.xyz;
  r3.xyz = BA_Fragment_121_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_121_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r0.w = r1.x * v5.x + -BA_Fragment_121_CB0((uint)(143)).x;
  r0.w = saturate(BA_Fragment_121_CB0((uint)(143)).y * r0.w);
  r1.xzw = r2.xyz * BA_Fragment_121_CB0((uint)(128)).xxx + v4.xyz;
  r2.x = min(BA_Fragment_121_CB2((uint)(11)).y, BA_Fragment_121_CB0((uint)(10)).x);
  r2.x = (int)r2.x;
  r2.yzw = float3(0,0,0);
  r3.w = 0;
  while (true) {
    r4.x = cmp((int)r3.w >= (int)r2.x);
    if (r4.x != 0) break;
    r4.x = (uint)r3.w >> 2;
    r4.y = (int)r3.w & 3;
    r4.x = dot(BA_Fragment_121_CB2((uint)(r4.x+12)).xyzw, icb[r4.y+0].xyzw);
    r4.x = (int)r4.x;
    r4.yzw = -v7.xyz * BA_Fragment_121_CB1((uint)(r4.x+0)).www + BA_Fragment_121_CB1((uint)(r4.x+0)).xyz;
    r5.x = dot(r4.yzw, r4.yzw);
    r5.x = max(6.10351563e-005, r5.x);
    r5.y = rsqrt(r5.x);
    r4.yzw = r5.yyy * r4.yzw;
    r5.y = 1 / r5.x;
    r5.x = BA_Fragment_121_CB1((uint)(r4.x+512)).x * r5.x;
    r5.x = -r5.x * r5.x + 1;
    r5.x = max(0, r5.x);
    r5.x = r5.x * r5.x;
    r5.x = r5.y * r5.x;
    r5.y = dot(BA_Fragment_121_CB1((uint)(r4.x+768)).xyz, r4.yzw);
    r5.y = saturate(r5.y * BA_Fragment_121_CB1((uint)(r4.x+512)).z + BA_Fragment_121_CB1((uint)(r4.x+512)).w);
    r5.y = r5.y * r5.y;
    r5.x = r5.x * r5.y;
    r5.xyz = BA_Fragment_121_CB1((uint)(r4.x+256)).xyz * r5.xxx;
    r4.x = dot(r4.yzw, v8.xyz);
    r4.y = r4.x + -r1.y;
    r4.x = saturate(r4.y * BA_Fragment_121_CB0((uint)(135)).x + r4.x);
    r2.yzw = r4.xxx * r5.xyz + r2.yzw;
    r3.w = (int)r3.w + 1;
  }
  r1.xyz = r2.yzw * BA_Fragment_121_CB0((uint)(134)).www + r1.xzw;
  r0.w = BA_Fragment_121_CB0((uint)(143)).z * r0.w;
  r0.w = BA_Fragment_121_CB0((uint)(128)).x * r0.w;
  r2.xyz = BA_Fragment_121_CB0((uint)(142)).xyz * r0.www;
  r2.xyz = BA_Fragment_121_CB0((uint)(126)).xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r2.xyz = BA_Fragment_121_CB0((uint)(138)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_121_CB0((uint)(147)).xyz + -r0.xyz;
  r0.x = dot(r0.xyz, r0.xyz);
  r0.x = saturate(BA_Fragment_121_CB0((uint)(147)).w * r0.x);
  r0.x = 1 + -r0.x;
  r0.x = BA_Fragment_121_CB0((uint)(148)).w * r0.x;
  r0.xyz = BA_Fragment_121_CB0((uint)(148)).xyz * r0.xxx;
  r0.xyz = r1.xyz * r2.xyz + r0.xyz;
  r0.xyz = -BA_Fragment_121_CB0((uint)(146)).zzz * BA_Fragment_121_CB0((uint)(146)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_121_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_121_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_121_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_121_CB0((uint)(136)).xyz + BA_Fragment_121_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_121_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_121_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_121_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_122_CB0((uint)(132)).x + w1.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_122_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_122_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.www * r2.xyz + v5.xyz;
  r3.xyz = BA_Fragment_122_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_122_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r1.x = r1.x * w1.x + -BA_Fragment_122_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_122_CB0((uint)(143)).y * r1.x);
  r2.xyz = r2.xyz * BA_Fragment_122_CB0((uint)(128)).xxx + v4.xyz;
  r1.w = min(BA_Fragment_122_CB2((uint)(11)).y, BA_Fragment_122_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r4.xyz = float3(0,0,0);
  r2.w = 0;
  while (true) {
    r3.w = cmp((int)r2.w >= (int)r1.w);
    if (r3.w != 0) break;
    r3.w = (uint)r2.w >> 2;
    r4.w = (int)r2.w & 3;
    r3.w = dot(BA_Fragment_122_CB2((uint)(r3.w+12)).xyzw, icb[r4.w+0].xyzw);
    r3.w = (int)r3.w;
    r5.xyz = -v7.xyz * BA_Fragment_122_CB1((uint)(r3.w+0)).www + BA_Fragment_122_CB1((uint)(r3.w+0)).xyz;
    r4.w = dot(r5.xyz, r5.xyz);
    r4.w = max(6.10351563e-005, r4.w);
    r5.w = rsqrt(r4.w);
    r5.xyz = r5.xyz * r5.www;
    r5.w = 1 / r4.w;
    r4.w = BA_Fragment_122_CB1((uint)(r3.w+512)).x * r4.w;
    r4.w = -r4.w * r4.w + 1;
    r4.w = max(0, r4.w);
    r4.w = r4.w * r4.w;
    r4.w = r5.w * r4.w;
    r5.w = dot(BA_Fragment_122_CB1((uint)(r3.w+768)).xyz, r5.xyz);
    r5.w = saturate(r5.w * BA_Fragment_122_CB1((uint)(r3.w+512)).z + BA_Fragment_122_CB1((uint)(r3.w+512)).w);
    r5.w = r5.w * r5.w;
    r4.w = r5.w * r4.w;
    r6.xyz = BA_Fragment_122_CB1((uint)(r3.w+256)).xyz * r4.www;
    r3.w = dot(r5.xyz, v8.xyz);
    r4.w = r3.w + -r1.y;
    r3.w = saturate(r4.w * BA_Fragment_122_CB0((uint)(135)).x + r3.w);
    r4.xyz = r3.www * r6.xyz + r4.xyz;
    r2.w = (int)r2.w + 1;
  }
  r2.xyz = r4.xyz * BA_Fragment_122_CB0((uint)(134)).www + r2.xyz;
  r1.x = BA_Fragment_122_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_122_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_122_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_122_CB0((uint)(126)).xyz * r1.xyw;
  r1.xyw = r2.xyz * r3.xyz + r1.xyw;
  r2.xyz = BA_Fragment_122_CB0((uint)(138)).xyz * r0.xyz;
  r1.xyw = r2.xyz * r1.xyw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, v6.xy).xyzw;
  r2.x = r2.x * 2 + -1;
  r2.x = saturate(BA_Fragment_122_CB0((uint)(148)).x * abs(r2.x));
  r2.x = r2.x + r2.x;
  r2.x = min(1, r2.x);
  r2.x = BA_Fragment_122_CB0((uint)(145)).w * r2.x;
  r2.yzw = BA_Fragment_122_CB0((uint)(133)).xyz * r0.xyz;
  r3.xyz = r2.yzw * r1.zzz;
  r0.xyz = -r2.yzw * r1.zzz + r0.xyz;
  r0.xyz = r0.www * r0.xyz + r3.xyz;
  r0.xyz = r0.xyz * BA_Fragment_122_CB0((uint)(146)).xyz + -r1.xyw;
  r0.xyz = r2.xxx * r0.xyz + r1.xyw;
  r0.xyz = -BA_Fragment_122_CB0((uint)(150)).zzz * BA_Fragment_122_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_122_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_122_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_122_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_122_CB0((uint)(136)).xyz + BA_Fragment_122_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_122_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_122_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_122_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD5,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_123_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_123_CB0((uint)(132)).x + v5.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_123_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_123_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.www * r2.xyz + v6.xyz;
  r3.xyz = BA_Fragment_123_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_123_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r1.x = r1.x * v5.x + -BA_Fragment_123_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_123_CB0((uint)(143)).y * r1.x);
  r2.xyz = r2.xyz * BA_Fragment_123_CB0((uint)(128)).xxx + v4.xyz;
  r1.w = min(BA_Fragment_123_CB2((uint)(11)).y, BA_Fragment_123_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r4.xyz = float3(0,0,0);
  r2.w = 0;
  while (true) {
    r3.w = cmp((int)r2.w >= (int)r1.w);
    if (r3.w != 0) break;
    r3.w = (uint)r2.w >> 2;
    r4.w = (int)r2.w & 3;
    r3.w = dot(BA_Fragment_123_CB2((uint)(r3.w+12)).xyzw, icb[r4.w+0].xyzw);
    r3.w = (int)r3.w;
    r5.xyz = -v7.xyz * BA_Fragment_123_CB1((uint)(r3.w+0)).www + BA_Fragment_123_CB1((uint)(r3.w+0)).xyz;
    r4.w = dot(r5.xyz, r5.xyz);
    r4.w = max(6.10351563e-005, r4.w);
    r5.w = rsqrt(r4.w);
    r5.xyz = r5.xyz * r5.www;
    r5.w = 1 / r4.w;
    r4.w = BA_Fragment_123_CB1((uint)(r3.w+512)).x * r4.w;
    r4.w = -r4.w * r4.w + 1;
    r4.w = max(0, r4.w);
    r4.w = r4.w * r4.w;
    r4.w = r5.w * r4.w;
    r5.w = dot(BA_Fragment_123_CB1((uint)(r3.w+768)).xyz, r5.xyz);
    r5.w = saturate(r5.w * BA_Fragment_123_CB1((uint)(r3.w+512)).z + BA_Fragment_123_CB1((uint)(r3.w+512)).w);
    r5.w = r5.w * r5.w;
    r4.w = r5.w * r4.w;
    r6.xyz = BA_Fragment_123_CB1((uint)(r3.w+256)).xyz * r4.www;
    r3.w = dot(r5.xyz, v8.xyz);
    r4.w = r3.w + -r1.y;
    r3.w = saturate(r4.w * BA_Fragment_123_CB0((uint)(135)).x + r3.w);
    r4.xyz = r3.www * r6.xyz + r4.xyz;
    r2.w = (int)r2.w + 1;
  }
  r2.xyz = r4.xyz * BA_Fragment_123_CB0((uint)(134)).www + r2.xyz;
  r1.x = BA_Fragment_123_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_123_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_123_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_123_CB0((uint)(126)).xyz * r1.xyw;
  r1.xyw = r2.xyz * r3.xyz + r1.xyw;
  r2.xyz = BA_Fragment_123_CB0((uint)(138)).xyz * r0.xyz;
  r1.xyw = r2.xyz * r1.xyw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, w1.xy).xyzw;
  r2.x = r2.x * 2 + -1;
  r2.x = saturate(BA_Fragment_123_CB0((uint)(148)).x * abs(r2.x));
  r2.x = r2.x + r2.x;
  r2.x = min(1, r2.x);
  r2.x = BA_Fragment_123_CB0((uint)(145)).w * r2.x;
  r2.yzw = BA_Fragment_123_CB0((uint)(133)).xyz * r0.xyz;
  r3.xyz = r2.yzw * r1.zzz;
  r0.xyz = -r2.yzw * r1.zzz + r0.xyz;
  r0.xyz = r0.www * r0.xyz + r3.xyz;
  r0.xyz = r0.xyz * BA_Fragment_123_CB0((uint)(146)).xyz + -r1.xyw;
  r0.xyz = r2.xxx * r0.xyz + r1.xyw;
  r0.xyz = -BA_Fragment_123_CB0((uint)(150)).zzz * BA_Fragment_123_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_123_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_123_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_123_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_123_CB0((uint)(136)).xyz + BA_Fragment_123_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_123_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_123_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_123_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 151u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 152u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_124_CB0((uint)(132)).x + w1.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_124_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_124_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.www * r2.xyz + v5.xyz;
  r3.xyz = BA_Fragment_124_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_124_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r1.x = r1.x * w1.x + -BA_Fragment_124_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_124_CB0((uint)(143)).y * r1.x);
  r2.xyz = r2.xyz * BA_Fragment_124_CB0((uint)(128)).xxx + v4.xyz;
  r1.w = min(BA_Fragment_124_CB2((uint)(11)).y, BA_Fragment_124_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r4.xyz = float3(0,0,0);
  r2.w = 0;
  while (true) {
    r3.w = cmp((int)r2.w >= (int)r1.w);
    if (r3.w != 0) break;
    r3.w = (uint)r2.w >> 2;
    r4.w = (int)r2.w & 3;
    r3.w = dot(BA_Fragment_124_CB2((uint)(r3.w+12)).xyzw, icb[r4.w+0].xyzw);
    r3.w = (int)r3.w;
    r5.xyz = -v7.xyz * BA_Fragment_124_CB1((uint)(r3.w+0)).www + BA_Fragment_124_CB1((uint)(r3.w+0)).xyz;
    r4.w = dot(r5.xyz, r5.xyz);
    r4.w = max(6.10351563e-005, r4.w);
    r5.w = rsqrt(r4.w);
    r5.xyz = r5.xyz * r5.www;
    r5.w = 1 / r4.w;
    r4.w = BA_Fragment_124_CB1((uint)(r3.w+512)).x * r4.w;
    r4.w = -r4.w * r4.w + 1;
    r4.w = max(0, r4.w);
    r4.w = r4.w * r4.w;
    r4.w = r5.w * r4.w;
    r5.w = dot(BA_Fragment_124_CB1((uint)(r3.w+768)).xyz, r5.xyz);
    r5.w = saturate(r5.w * BA_Fragment_124_CB1((uint)(r3.w+512)).z + BA_Fragment_124_CB1((uint)(r3.w+512)).w);
    r5.w = r5.w * r5.w;
    r4.w = r5.w * r4.w;
    r6.xyz = BA_Fragment_124_CB1((uint)(r3.w+256)).xyz * r4.www;
    r3.w = dot(r5.xyz, v8.xyz);
    r4.w = r3.w + -r1.y;
    r3.w = saturate(r4.w * BA_Fragment_124_CB0((uint)(135)).x + r3.w);
    r4.xyz = r3.www * r6.xyz + r4.xyz;
    r2.w = (int)r2.w + 1;
  }
  r2.xyz = r4.xyz * BA_Fragment_124_CB0((uint)(134)).www + r2.xyz;
  r1.x = BA_Fragment_124_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_124_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_124_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_124_CB0((uint)(126)).xyz * r1.xyw;
  r1.xyw = r2.xyz * r3.xyz + r1.xyw;
  r2.xyz = BA_Fragment_124_CB0((uint)(138)).xyz * r0.xyz;
  r3.xyz = BA_Fragment_124_CB0((uint)(151)).xyz + -r0.xyz;
  r2.w = dot(r3.xyz, r3.xyz);
  r2.w = saturate(BA_Fragment_124_CB0((uint)(151)).w * r2.w);
  r2.w = 1 + -r2.w;
  r2.w = BA_Fragment_124_CB0((uint)(152)).w * r2.w;
  r3.xyz = BA_Fragment_124_CB0((uint)(152)).xyz * r2.www;
  r1.xyw = r1.xyw * r2.xyz + r3.xyz;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, v6.xy).xyzw;
  r2.x = r2.x * 2 + -1;
  r2.x = saturate(BA_Fragment_124_CB0((uint)(148)).x * abs(r2.x));
  r2.x = r2.x + r2.x;
  r2.x = min(1, r2.x);
  r2.x = BA_Fragment_124_CB0((uint)(145)).w * r2.x;
  r2.yzw = BA_Fragment_124_CB0((uint)(133)).xyz * r0.xyz;
  r3.xyz = r2.yzw * r1.zzz;
  r0.xyz = -r2.yzw * r1.zzz + r0.xyz;
  r0.xyz = r0.www * r0.xyz + r3.xyz;
  r0.xyz = r0.xyz * BA_Fragment_124_CB0((uint)(146)).xyz + -r1.xyw;
  r0.xyz = r2.xxx * r0.xyz + r1.xyw;
  r0.xyz = -BA_Fragment_124_CB0((uint)(150)).zzz * BA_Fragment_124_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_124_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_124_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_124_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_124_CB0((uint)(136)).xyz + BA_Fragment_124_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_124_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_124_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_124_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 151u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 152u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD5,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_125_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_125_CB0((uint)(132)).x + v5.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_125_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_125_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.www * r2.xyz + v6.xyz;
  r3.xyz = BA_Fragment_125_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_125_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r1.x = r1.x * v5.x + -BA_Fragment_125_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_125_CB0((uint)(143)).y * r1.x);
  r2.xyz = r2.xyz * BA_Fragment_125_CB0((uint)(128)).xxx + v4.xyz;
  r1.w = min(BA_Fragment_125_CB2((uint)(11)).y, BA_Fragment_125_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r4.xyz = float3(0,0,0);
  r2.w = 0;
  while (true) {
    r3.w = cmp((int)r2.w >= (int)r1.w);
    if (r3.w != 0) break;
    r3.w = (uint)r2.w >> 2;
    r4.w = (int)r2.w & 3;
    r3.w = dot(BA_Fragment_125_CB2((uint)(r3.w+12)).xyzw, icb[r4.w+0].xyzw);
    r3.w = (int)r3.w;
    r5.xyz = -v7.xyz * BA_Fragment_125_CB1((uint)(r3.w+0)).www + BA_Fragment_125_CB1((uint)(r3.w+0)).xyz;
    r4.w = dot(r5.xyz, r5.xyz);
    r4.w = max(6.10351563e-005, r4.w);
    r5.w = rsqrt(r4.w);
    r5.xyz = r5.xyz * r5.www;
    r5.w = 1 / r4.w;
    r4.w = BA_Fragment_125_CB1((uint)(r3.w+512)).x * r4.w;
    r4.w = -r4.w * r4.w + 1;
    r4.w = max(0, r4.w);
    r4.w = r4.w * r4.w;
    r4.w = r5.w * r4.w;
    r5.w = dot(BA_Fragment_125_CB1((uint)(r3.w+768)).xyz, r5.xyz);
    r5.w = saturate(r5.w * BA_Fragment_125_CB1((uint)(r3.w+512)).z + BA_Fragment_125_CB1((uint)(r3.w+512)).w);
    r5.w = r5.w * r5.w;
    r4.w = r5.w * r4.w;
    r6.xyz = BA_Fragment_125_CB1((uint)(r3.w+256)).xyz * r4.www;
    r3.w = dot(r5.xyz, v8.xyz);
    r4.w = r3.w + -r1.y;
    r3.w = saturate(r4.w * BA_Fragment_125_CB0((uint)(135)).x + r3.w);
    r4.xyz = r3.www * r6.xyz + r4.xyz;
    r2.w = (int)r2.w + 1;
  }
  r2.xyz = r4.xyz * BA_Fragment_125_CB0((uint)(134)).www + r2.xyz;
  r1.x = BA_Fragment_125_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_125_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_125_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_125_CB0((uint)(126)).xyz * r1.xyw;
  r1.xyw = r2.xyz * r3.xyz + r1.xyw;
  r2.xyz = BA_Fragment_125_CB0((uint)(138)).xyz * r0.xyz;
  r3.xyz = BA_Fragment_125_CB0((uint)(151)).xyz + -r0.xyz;
  r2.w = dot(r3.xyz, r3.xyz);
  r2.w = saturate(BA_Fragment_125_CB0((uint)(151)).w * r2.w);
  r2.w = 1 + -r2.w;
  r2.w = BA_Fragment_125_CB0((uint)(152)).w * r2.w;
  r3.xyz = BA_Fragment_125_CB0((uint)(152)).xyz * r2.www;
  r1.xyw = r1.xyw * r2.xyz + r3.xyz;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, w1.xy).xyzw;
  r2.x = r2.x * 2 + -1;
  r2.x = saturate(BA_Fragment_125_CB0((uint)(148)).x * abs(r2.x));
  r2.x = r2.x + r2.x;
  r2.x = min(1, r2.x);
  r2.x = BA_Fragment_125_CB0((uint)(145)).w * r2.x;
  r2.yzw = BA_Fragment_125_CB0((uint)(133)).xyz * r0.xyz;
  r3.xyz = r2.yzw * r1.zzz;
  r0.xyz = -r2.yzw * r1.zzz + r0.xyz;
  r0.xyz = r0.www * r0.xyz + r3.xyz;
  r0.xyz = r0.xyz * BA_Fragment_125_CB0((uint)(146)).xyz + -r1.xyw;
  r0.xyz = r2.xxx * r0.xyz + r1.xyw;
  r0.xyz = -BA_Fragment_125_CB0((uint)(150)).zzz * BA_Fragment_125_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_125_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_125_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_125_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_125_CB0((uint)(136)).xyz + BA_Fragment_125_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_125_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.xyz = -BA_Fragment_125_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = v4.www * r0.xyz + BA_Fragment_125_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD6,
  float3 v7 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_126_CB0((uint)(132)).x + w1.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_126_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_126_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.www * r2.xyz + v5.xyz;
  r3.xyz = BA_Fragment_126_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_126_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r0.w = r1.x * w1.x + -BA_Fragment_126_CB0((uint)(143)).x;
  r0.w = saturate(BA_Fragment_126_CB0((uint)(143)).y * r0.w);
  r1.xzw = r2.xyz * BA_Fragment_126_CB0((uint)(128)).xxx + v4.xyz;
  r2.x = min(BA_Fragment_126_CB2((uint)(11)).y, BA_Fragment_126_CB0((uint)(10)).x);
  r2.x = (int)r2.x;
  r2.yzw = float3(0,0,0);
  r3.w = 0;
  while (true) {
    r4.x = cmp((int)r3.w >= (int)r2.x);
    if (r4.x != 0) break;
    r4.x = (uint)r3.w >> 2;
    r4.y = (int)r3.w & 3;
    r4.x = dot(BA_Fragment_126_CB2((uint)(r4.x+12)).xyzw, icb[r4.y+0].xyzw);
    r4.x = (int)r4.x;
    r4.yzw = -v6.xyz * BA_Fragment_126_CB1((uint)(r4.x+0)).www + BA_Fragment_126_CB1((uint)(r4.x+0)).xyz;
    r5.x = dot(r4.yzw, r4.yzw);
    r5.x = max(6.10351563e-005, r5.x);
    r5.y = rsqrt(r5.x);
    r4.yzw = r5.yyy * r4.yzw;
    r5.y = 1 / r5.x;
    r5.x = BA_Fragment_126_CB1((uint)(r4.x+512)).x * r5.x;
    r5.x = -r5.x * r5.x + 1;
    r5.x = max(0, r5.x);
    r5.x = r5.x * r5.x;
    r5.x = r5.y * r5.x;
    r5.y = dot(BA_Fragment_126_CB1((uint)(r4.x+768)).xyz, r4.yzw);
    r5.y = saturate(r5.y * BA_Fragment_126_CB1((uint)(r4.x+512)).z + BA_Fragment_126_CB1((uint)(r4.x+512)).w);
    r5.y = r5.y * r5.y;
    r5.x = r5.x * r5.y;
    r5.xyz = BA_Fragment_126_CB1((uint)(r4.x+256)).xyz * r5.xxx;
    r4.x = dot(r4.yzw, v7.xyz);
    r4.y = r4.x + -r1.y;
    r4.x = saturate(r4.y * BA_Fragment_126_CB0((uint)(135)).x + r4.x);
    r2.yzw = r4.xxx * r5.xyz + r2.yzw;
    r3.w = (int)r3.w + 1;
  }
  r1.xyz = r2.yzw * BA_Fragment_126_CB0((uint)(134)).www + r1.xzw;
  r0.w = BA_Fragment_126_CB0((uint)(143)).z * r0.w;
  r0.w = BA_Fragment_126_CB0((uint)(128)).x * r0.w;
  r2.xyz = BA_Fragment_126_CB0((uint)(142)).xyz * r0.www;
  r2.xyz = BA_Fragment_126_CB0((uint)(126)).xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r0.xyz = BA_Fragment_126_CB0((uint)(138)).xyz * r0.xyz;
  r0.w = BA_Fragment_126_CB0((uint)(146)).z * BA_Fragment_126_CB0((uint)(146)).x;
  r0.xyz = r1.xyz * r0.xyz + -r0.www;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_126_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_126_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_126_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_126_CB0((uint)(136)).xyz + BA_Fragment_126_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_126_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_126_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_126_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_127_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_127_CB0((uint)(132)).x + v5.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_127_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_127_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.www * r2.xyz + v6.xyz;
  r3.xyz = BA_Fragment_127_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_127_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r0.w = r1.x * v5.x + -BA_Fragment_127_CB0((uint)(143)).x;
  r0.w = saturate(BA_Fragment_127_CB0((uint)(143)).y * r0.w);
  r1.xzw = r2.xyz * BA_Fragment_127_CB0((uint)(128)).xxx + v4.xyz;
  r2.x = min(BA_Fragment_127_CB2((uint)(11)).y, BA_Fragment_127_CB0((uint)(10)).x);
  r2.x = (int)r2.x;
  r2.yzw = float3(0,0,0);
  r3.w = 0;
  while (true) {
    r4.x = cmp((int)r3.w >= (int)r2.x);
    if (r4.x != 0) break;
    r4.x = (uint)r3.w >> 2;
    r4.y = (int)r3.w & 3;
    r4.x = dot(BA_Fragment_127_CB2((uint)(r4.x+12)).xyzw, icb[r4.y+0].xyzw);
    r4.x = (int)r4.x;
    r4.yzw = -v7.xyz * BA_Fragment_127_CB1((uint)(r4.x+0)).www + BA_Fragment_127_CB1((uint)(r4.x+0)).xyz;
    r5.x = dot(r4.yzw, r4.yzw);
    r5.x = max(6.10351563e-005, r5.x);
    r5.y = rsqrt(r5.x);
    r4.yzw = r5.yyy * r4.yzw;
    r5.y = 1 / r5.x;
    r5.x = BA_Fragment_127_CB1((uint)(r4.x+512)).x * r5.x;
    r5.x = -r5.x * r5.x + 1;
    r5.x = max(0, r5.x);
    r5.x = r5.x * r5.x;
    r5.x = r5.y * r5.x;
    r5.y = dot(BA_Fragment_127_CB1((uint)(r4.x+768)).xyz, r4.yzw);
    r5.y = saturate(r5.y * BA_Fragment_127_CB1((uint)(r4.x+512)).z + BA_Fragment_127_CB1((uint)(r4.x+512)).w);
    r5.y = r5.y * r5.y;
    r5.x = r5.x * r5.y;
    r5.xyz = BA_Fragment_127_CB1((uint)(r4.x+256)).xyz * r5.xxx;
    r4.x = dot(r4.yzw, v8.xyz);
    r4.y = r4.x + -r1.y;
    r4.x = saturate(r4.y * BA_Fragment_127_CB0((uint)(135)).x + r4.x);
    r2.yzw = r4.xxx * r5.xyz + r2.yzw;
    r3.w = (int)r3.w + 1;
  }
  r1.xyz = r2.yzw * BA_Fragment_127_CB0((uint)(134)).www + r1.xzw;
  r0.w = BA_Fragment_127_CB0((uint)(143)).z * r0.w;
  r0.w = BA_Fragment_127_CB0((uint)(128)).x * r0.w;
  r2.xyz = BA_Fragment_127_CB0((uint)(142)).xyz * r0.www;
  r2.xyz = BA_Fragment_127_CB0((uint)(126)).xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r0.xyz = BA_Fragment_127_CB0((uint)(138)).xyz * r0.xyz;
  r0.w = BA_Fragment_127_CB0((uint)(146)).z * BA_Fragment_127_CB0((uint)(146)).x;
  r0.xyz = r1.xyz * r0.xyz + -r0.www;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_127_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_127_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_127_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_127_CB0((uint)(136)).xyz + BA_Fragment_127_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_127_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_127_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_127_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 147u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 148u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD6,
  float3 v7 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_128_CB0((uint)(132)).x + w1.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_128_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_128_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.www * r2.xyz + v5.xyz;
  r3.xyz = BA_Fragment_128_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_128_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r0.w = r1.x * w1.x + -BA_Fragment_128_CB0((uint)(143)).x;
  r0.w = saturate(BA_Fragment_128_CB0((uint)(143)).y * r0.w);
  r1.xzw = r2.xyz * BA_Fragment_128_CB0((uint)(128)).xxx + v4.xyz;
  r2.x = min(BA_Fragment_128_CB2((uint)(11)).y, BA_Fragment_128_CB0((uint)(10)).x);
  r2.x = (int)r2.x;
  r2.yzw = float3(0,0,0);
  r3.w = 0;
  while (true) {
    r4.x = cmp((int)r3.w >= (int)r2.x);
    if (r4.x != 0) break;
    r4.x = (uint)r3.w >> 2;
    r4.y = (int)r3.w & 3;
    r4.x = dot(BA_Fragment_128_CB2((uint)(r4.x+12)).xyzw, icb[r4.y+0].xyzw);
    r4.x = (int)r4.x;
    r4.yzw = -v6.xyz * BA_Fragment_128_CB1((uint)(r4.x+0)).www + BA_Fragment_128_CB1((uint)(r4.x+0)).xyz;
    r5.x = dot(r4.yzw, r4.yzw);
    r5.x = max(6.10351563e-005, r5.x);
    r5.y = rsqrt(r5.x);
    r4.yzw = r5.yyy * r4.yzw;
    r5.y = 1 / r5.x;
    r5.x = BA_Fragment_128_CB1((uint)(r4.x+512)).x * r5.x;
    r5.x = -r5.x * r5.x + 1;
    r5.x = max(0, r5.x);
    r5.x = r5.x * r5.x;
    r5.x = r5.y * r5.x;
    r5.y = dot(BA_Fragment_128_CB1((uint)(r4.x+768)).xyz, r4.yzw);
    r5.y = saturate(r5.y * BA_Fragment_128_CB1((uint)(r4.x+512)).z + BA_Fragment_128_CB1((uint)(r4.x+512)).w);
    r5.y = r5.y * r5.y;
    r5.x = r5.x * r5.y;
    r5.xyz = BA_Fragment_128_CB1((uint)(r4.x+256)).xyz * r5.xxx;
    r4.x = dot(r4.yzw, v7.xyz);
    r4.y = r4.x + -r1.y;
    r4.x = saturate(r4.y * BA_Fragment_128_CB0((uint)(135)).x + r4.x);
    r2.yzw = r4.xxx * r5.xyz + r2.yzw;
    r3.w = (int)r3.w + 1;
  }
  r1.xyz = r2.yzw * BA_Fragment_128_CB0((uint)(134)).www + r1.xzw;
  r0.w = BA_Fragment_128_CB0((uint)(143)).z * r0.w;
  r0.w = BA_Fragment_128_CB0((uint)(128)).x * r0.w;
  r2.xyz = BA_Fragment_128_CB0((uint)(142)).xyz * r0.www;
  r2.xyz = BA_Fragment_128_CB0((uint)(126)).xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r2.xyz = BA_Fragment_128_CB0((uint)(138)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_128_CB0((uint)(147)).xyz + -r0.xyz;
  r0.x = dot(r0.xyz, r0.xyz);
  r0.x = saturate(BA_Fragment_128_CB0((uint)(147)).w * r0.x);
  r0.x = 1 + -r0.x;
  r0.x = BA_Fragment_128_CB0((uint)(148)).w * r0.x;
  r0.xyz = BA_Fragment_128_CB0((uint)(148)).xyz * r0.xxx;
  r0.xyz = r1.xyz * r2.xyz + r0.xyz;
  r0.xyz = -BA_Fragment_128_CB0((uint)(146)).zzz * BA_Fragment_128_CB0((uint)(146)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_128_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_128_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_128_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_128_CB0((uint)(136)).xyz + BA_Fragment_128_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_128_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_128_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_128_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && !defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 146u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 147u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 148u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_129_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_129_CB0((uint)(132)).x + v5.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_129_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_129_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.www * r2.xyz + v6.xyz;
  r3.xyz = BA_Fragment_129_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_129_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r0.w = r1.x * v5.x + -BA_Fragment_129_CB0((uint)(143)).x;
  r0.w = saturate(BA_Fragment_129_CB0((uint)(143)).y * r0.w);
  r1.xzw = r2.xyz * BA_Fragment_129_CB0((uint)(128)).xxx + v4.xyz;
  r2.x = min(BA_Fragment_129_CB2((uint)(11)).y, BA_Fragment_129_CB0((uint)(10)).x);
  r2.x = (int)r2.x;
  r2.yzw = float3(0,0,0);
  r3.w = 0;
  while (true) {
    r4.x = cmp((int)r3.w >= (int)r2.x);
    if (r4.x != 0) break;
    r4.x = (uint)r3.w >> 2;
    r4.y = (int)r3.w & 3;
    r4.x = dot(BA_Fragment_129_CB2((uint)(r4.x+12)).xyzw, icb[r4.y+0].xyzw);
    r4.x = (int)r4.x;
    r4.yzw = -v7.xyz * BA_Fragment_129_CB1((uint)(r4.x+0)).www + BA_Fragment_129_CB1((uint)(r4.x+0)).xyz;
    r5.x = dot(r4.yzw, r4.yzw);
    r5.x = max(6.10351563e-005, r5.x);
    r5.y = rsqrt(r5.x);
    r4.yzw = r5.yyy * r4.yzw;
    r5.y = 1 / r5.x;
    r5.x = BA_Fragment_129_CB1((uint)(r4.x+512)).x * r5.x;
    r5.x = -r5.x * r5.x + 1;
    r5.x = max(0, r5.x);
    r5.x = r5.x * r5.x;
    r5.x = r5.y * r5.x;
    r5.y = dot(BA_Fragment_129_CB1((uint)(r4.x+768)).xyz, r4.yzw);
    r5.y = saturate(r5.y * BA_Fragment_129_CB1((uint)(r4.x+512)).z + BA_Fragment_129_CB1((uint)(r4.x+512)).w);
    r5.y = r5.y * r5.y;
    r5.x = r5.x * r5.y;
    r5.xyz = BA_Fragment_129_CB1((uint)(r4.x+256)).xyz * r5.xxx;
    r4.x = dot(r4.yzw, v8.xyz);
    r4.y = r4.x + -r1.y;
    r4.x = saturate(r4.y * BA_Fragment_129_CB0((uint)(135)).x + r4.x);
    r2.yzw = r4.xxx * r5.xyz + r2.yzw;
    r3.w = (int)r3.w + 1;
  }
  r1.xyz = r2.yzw * BA_Fragment_129_CB0((uint)(134)).www + r1.xzw;
  r0.w = BA_Fragment_129_CB0((uint)(143)).z * r0.w;
  r0.w = BA_Fragment_129_CB0((uint)(128)).x * r0.w;
  r2.xyz = BA_Fragment_129_CB0((uint)(142)).xyz * r0.www;
  r2.xyz = BA_Fragment_129_CB0((uint)(126)).xyz * r2.xyz;
  r1.xyz = r1.xyz * r3.xyz + r2.xyz;
  r2.xyz = BA_Fragment_129_CB0((uint)(138)).xyz * r0.xyz;
  r0.xyz = BA_Fragment_129_CB0((uint)(147)).xyz + -r0.xyz;
  r0.x = dot(r0.xyz, r0.xyz);
  r0.x = saturate(BA_Fragment_129_CB0((uint)(147)).w * r0.x);
  r0.x = 1 + -r0.x;
  r0.x = BA_Fragment_129_CB0((uint)(148)).w * r0.x;
  r0.xyz = BA_Fragment_129_CB0((uint)(148)).xyz * r0.xxx;
  r0.xyz = r1.xyz * r2.xyz + r0.xyz;
  r0.xyz = -BA_Fragment_129_CB0((uint)(146)).zzz * BA_Fragment_129_CB0((uint)(146)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_129_CB0((uint)(146)).y + r0.w);
  r1.xyz = BA_Fragment_129_CB0((uint)(145)).xyz * r0.www;
  r1.xyz = BA_Fragment_129_CB0((uint)(146)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_129_CB0((uint)(136)).xyz + BA_Fragment_129_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_129_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_129_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_129_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_130_CB0((uint)(132)).x + w1.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_130_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_130_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.www * r2.xyz + v5.xyz;
  r3.xyz = BA_Fragment_130_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_130_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r1.x = r1.x * w1.x + -BA_Fragment_130_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_130_CB0((uint)(143)).y * r1.x);
  r2.xyz = r2.xyz * BA_Fragment_130_CB0((uint)(128)).xxx + v4.xyz;
  r1.w = min(BA_Fragment_130_CB2((uint)(11)).y, BA_Fragment_130_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r4.xyz = float3(0,0,0);
  r2.w = 0;
  while (true) {
    r3.w = cmp((int)r2.w >= (int)r1.w);
    if (r3.w != 0) break;
    r3.w = (uint)r2.w >> 2;
    r4.w = (int)r2.w & 3;
    r3.w = dot(BA_Fragment_130_CB2((uint)(r3.w+12)).xyzw, icb[r4.w+0].xyzw);
    r3.w = (int)r3.w;
    r5.xyz = -v7.xyz * BA_Fragment_130_CB1((uint)(r3.w+0)).www + BA_Fragment_130_CB1((uint)(r3.w+0)).xyz;
    r4.w = dot(r5.xyz, r5.xyz);
    r4.w = max(6.10351563e-005, r4.w);
    r5.w = rsqrt(r4.w);
    r5.xyz = r5.xyz * r5.www;
    r5.w = 1 / r4.w;
    r4.w = BA_Fragment_130_CB1((uint)(r3.w+512)).x * r4.w;
    r4.w = -r4.w * r4.w + 1;
    r4.w = max(0, r4.w);
    r4.w = r4.w * r4.w;
    r4.w = r5.w * r4.w;
    r5.w = dot(BA_Fragment_130_CB1((uint)(r3.w+768)).xyz, r5.xyz);
    r5.w = saturate(r5.w * BA_Fragment_130_CB1((uint)(r3.w+512)).z + BA_Fragment_130_CB1((uint)(r3.w+512)).w);
    r5.w = r5.w * r5.w;
    r4.w = r5.w * r4.w;
    r6.xyz = BA_Fragment_130_CB1((uint)(r3.w+256)).xyz * r4.www;
    r3.w = dot(r5.xyz, v8.xyz);
    r4.w = r3.w + -r1.y;
    r3.w = saturate(r4.w * BA_Fragment_130_CB0((uint)(135)).x + r3.w);
    r4.xyz = r3.www * r6.xyz + r4.xyz;
    r2.w = (int)r2.w + 1;
  }
  r2.xyz = r4.xyz * BA_Fragment_130_CB0((uint)(134)).www + r2.xyz;
  r1.x = BA_Fragment_130_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_130_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_130_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_130_CB0((uint)(126)).xyz * r1.xyw;
  r1.xyw = r2.xyz * r3.xyz + r1.xyw;
  r2.xyz = BA_Fragment_130_CB0((uint)(138)).xyz * r0.xyz;
  r1.xyw = r2.xyz * r1.xyw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, v6.xy).xyzw;
  r2.x = r2.x * 2 + -1;
  r2.x = saturate(BA_Fragment_130_CB0((uint)(148)).x * abs(r2.x));
  r2.x = r2.x + r2.x;
  r2.x = min(1, r2.x);
  r2.x = BA_Fragment_130_CB0((uint)(145)).w * r2.x;
  r2.yzw = BA_Fragment_130_CB0((uint)(133)).xyz * r0.xyz;
  r3.xyz = r2.yzw * r1.zzz;
  r0.xyz = -r2.yzw * r1.zzz + r0.xyz;
  r0.xyz = r0.www * r0.xyz + r3.xyz;
  r0.xyz = r0.xyz * BA_Fragment_130_CB0((uint)(146)).xyz + -r1.xyw;
  r0.xyz = r2.xxx * r0.xyz + r1.xyw;
  r0.xyz = -BA_Fragment_130_CB0((uint)(150)).zzz * BA_Fragment_130_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_130_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_130_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_130_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_130_CB0((uint)(136)).xyz + BA_Fragment_130_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_130_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_130_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_130_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && !defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD5,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_131_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_131_CB0((uint)(132)).x + v5.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_131_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_131_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.www * r2.xyz + v6.xyz;
  r3.xyz = BA_Fragment_131_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_131_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r1.x = r1.x * v5.x + -BA_Fragment_131_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_131_CB0((uint)(143)).y * r1.x);
  r2.xyz = r2.xyz * BA_Fragment_131_CB0((uint)(128)).xxx + v4.xyz;
  r1.w = min(BA_Fragment_131_CB2((uint)(11)).y, BA_Fragment_131_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r4.xyz = float3(0,0,0);
  r2.w = 0;
  while (true) {
    r3.w = cmp((int)r2.w >= (int)r1.w);
    if (r3.w != 0) break;
    r3.w = (uint)r2.w >> 2;
    r4.w = (int)r2.w & 3;
    r3.w = dot(BA_Fragment_131_CB2((uint)(r3.w+12)).xyzw, icb[r4.w+0].xyzw);
    r3.w = (int)r3.w;
    r5.xyz = -v7.xyz * BA_Fragment_131_CB1((uint)(r3.w+0)).www + BA_Fragment_131_CB1((uint)(r3.w+0)).xyz;
    r4.w = dot(r5.xyz, r5.xyz);
    r4.w = max(6.10351563e-005, r4.w);
    r5.w = rsqrt(r4.w);
    r5.xyz = r5.xyz * r5.www;
    r5.w = 1 / r4.w;
    r4.w = BA_Fragment_131_CB1((uint)(r3.w+512)).x * r4.w;
    r4.w = -r4.w * r4.w + 1;
    r4.w = max(0, r4.w);
    r4.w = r4.w * r4.w;
    r4.w = r5.w * r4.w;
    r5.w = dot(BA_Fragment_131_CB1((uint)(r3.w+768)).xyz, r5.xyz);
    r5.w = saturate(r5.w * BA_Fragment_131_CB1((uint)(r3.w+512)).z + BA_Fragment_131_CB1((uint)(r3.w+512)).w);
    r5.w = r5.w * r5.w;
    r4.w = r5.w * r4.w;
    r6.xyz = BA_Fragment_131_CB1((uint)(r3.w+256)).xyz * r4.www;
    r3.w = dot(r5.xyz, v8.xyz);
    r4.w = r3.w + -r1.y;
    r3.w = saturate(r4.w * BA_Fragment_131_CB0((uint)(135)).x + r3.w);
    r4.xyz = r3.www * r6.xyz + r4.xyz;
    r2.w = (int)r2.w + 1;
  }
  r2.xyz = r4.xyz * BA_Fragment_131_CB0((uint)(134)).www + r2.xyz;
  r1.x = BA_Fragment_131_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_131_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_131_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_131_CB0((uint)(126)).xyz * r1.xyw;
  r1.xyw = r2.xyz * r3.xyz + r1.xyw;
  r2.xyz = BA_Fragment_131_CB0((uint)(138)).xyz * r0.xyz;
  r1.xyw = r2.xyz * r1.xyw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, w1.xy).xyzw;
  r2.x = r2.x * 2 + -1;
  r2.x = saturate(BA_Fragment_131_CB0((uint)(148)).x * abs(r2.x));
  r2.x = r2.x + r2.x;
  r2.x = min(1, r2.x);
  r2.x = BA_Fragment_131_CB0((uint)(145)).w * r2.x;
  r2.yzw = BA_Fragment_131_CB0((uint)(133)).xyz * r0.xyz;
  r3.xyz = r2.yzw * r1.zzz;
  r0.xyz = -r2.yzw * r1.zzz + r0.xyz;
  r0.xyz = r0.www * r0.xyz + r3.xyz;
  r0.xyz = r0.xyz * BA_Fragment_131_CB0((uint)(146)).xyz + -r1.xyw;
  r0.xyz = r2.xxx * r0.xyz + r1.xyw;
  r0.xyz = -BA_Fragment_131_CB0((uint)(150)).zzz * BA_Fragment_131_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_131_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_131_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_131_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_131_CB0((uint)(136)).xyz + BA_Fragment_131_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_131_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_131_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_131_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && !defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, 0.0);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 151u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 152u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD3,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_132_CB0((uint)(132)).x + w1.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_132_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_132_CB0((uint)(126)).xyz + -v5.xyz;
  r2.xyz = r0.www * r2.xyz + v5.xyz;
  r3.xyz = BA_Fragment_132_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_132_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r1.x = r1.x * w1.x + -BA_Fragment_132_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_132_CB0((uint)(143)).y * r1.x);
  r2.xyz = r2.xyz * BA_Fragment_132_CB0((uint)(128)).xxx + v4.xyz;
  r1.w = min(BA_Fragment_132_CB2((uint)(11)).y, BA_Fragment_132_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r4.xyz = float3(0,0,0);
  r2.w = 0;
  while (true) {
    r3.w = cmp((int)r2.w >= (int)r1.w);
    if (r3.w != 0) break;
    r3.w = (uint)r2.w >> 2;
    r4.w = (int)r2.w & 3;
    r3.w = dot(BA_Fragment_132_CB2((uint)(r3.w+12)).xyzw, icb[r4.w+0].xyzw);
    r3.w = (int)r3.w;
    r5.xyz = -v7.xyz * BA_Fragment_132_CB1((uint)(r3.w+0)).www + BA_Fragment_132_CB1((uint)(r3.w+0)).xyz;
    r4.w = dot(r5.xyz, r5.xyz);
    r4.w = max(6.10351563e-005, r4.w);
    r5.w = rsqrt(r4.w);
    r5.xyz = r5.xyz * r5.www;
    r5.w = 1 / r4.w;
    r4.w = BA_Fragment_132_CB1((uint)(r3.w+512)).x * r4.w;
    r4.w = -r4.w * r4.w + 1;
    r4.w = max(0, r4.w);
    r4.w = r4.w * r4.w;
    r4.w = r5.w * r4.w;
    r5.w = dot(BA_Fragment_132_CB1((uint)(r3.w+768)).xyz, r5.xyz);
    r5.w = saturate(r5.w * BA_Fragment_132_CB1((uint)(r3.w+512)).z + BA_Fragment_132_CB1((uint)(r3.w+512)).w);
    r5.w = r5.w * r5.w;
    r4.w = r5.w * r4.w;
    r6.xyz = BA_Fragment_132_CB1((uint)(r3.w+256)).xyz * r4.www;
    r3.w = dot(r5.xyz, v8.xyz);
    r4.w = r3.w + -r1.y;
    r3.w = saturate(r4.w * BA_Fragment_132_CB0((uint)(135)).x + r3.w);
    r4.xyz = r3.www * r6.xyz + r4.xyz;
    r2.w = (int)r2.w + 1;
  }
  r2.xyz = r4.xyz * BA_Fragment_132_CB0((uint)(134)).www + r2.xyz;
  r1.x = BA_Fragment_132_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_132_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_132_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_132_CB0((uint)(126)).xyz * r1.xyw;
  r1.xyw = r2.xyz * r3.xyz + r1.xyw;
  r2.xyz = BA_Fragment_132_CB0((uint)(138)).xyz * r0.xyz;
  r3.xyz = BA_Fragment_132_CB0((uint)(151)).xyz + -r0.xyz;
  r2.w = dot(r3.xyz, r3.xyz);
  r2.w = saturate(BA_Fragment_132_CB0((uint)(151)).w * r2.w);
  r2.w = 1 + -r2.w;
  r2.w = BA_Fragment_132_CB0((uint)(152)).w * r2.w;
  r3.xyz = BA_Fragment_132_CB0((uint)(152)).xyz * r2.www;
  r1.xyw = r1.xyw * r2.xyz + r3.xyz;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, v6.xy).xyzw;
  r2.x = r2.x * 2 + -1;
  r2.x = saturate(BA_Fragment_132_CB0((uint)(148)).x * abs(r2.x));
  r2.x = r2.x + r2.x;
  r2.x = min(1, r2.x);
  r2.x = BA_Fragment_132_CB0((uint)(145)).w * r2.x;
  r2.yzw = BA_Fragment_132_CB0((uint)(133)).xyz * r0.xyz;
  r3.xyz = r2.yzw * r1.zzz;
  r0.xyz = -r2.yzw * r1.zzz + r0.xyz;
  r0.xyz = r0.www * r0.xyz + r3.xyz;
  r0.xyz = r0.xyz * BA_Fragment_132_CB0((uint)(146)).xyz + -r1.xyw;
  r0.xyz = r2.xxx * r0.xyz + r1.xyw;
  r0.xyz = -BA_Fragment_132_CB0((uint)(150)).zzz * BA_Fragment_132_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_132_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_132_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_132_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_132_CB0((uint)(136)).xyz + BA_Fragment_132_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_132_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_132_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_132_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(_ADDITIONAL_LIGHTS) && defined(_DAMAGE_0) && defined(_DITHER_HORIZONTAL_LINES) && defined(_GLOW_0)
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
  if (i == 10u) value = float4(_AdditionalLightsCount.x, _AdditionalLightsCount.y, _AdditionalLightsCount.z, _AdditionalLightsCount.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  if (i == 126u) value = float4(_MxCharLightTone.x, _MxCharLightTone.y, _MxCharLightTone.z, 0.0);
  if (i == 128u) value = float4(_MxCharLightData.x, _MxCharLightData.y, _MxCharLightData.z, _MxCharLightData.w);
  if (i == 132u) value = float4(_ShadowThreshold, 0.0, 0.0, 0.0);
  if (i == 133u) value = float4(_ShadowTint.x, _ShadowTint.y, _ShadowTint.z, _ShadowTint.w);
  if (i == 134u) value = float4(0.0, 0.0, 0.0, _AdditionalLightStrength);
  if (i == 135u) value = float4(_AdditionalLightSharpness, _CodeAddColor.x, _CodeAddColor.y, _CodeAddColor.z);
  if (i == 136u) value = float4(_CodeMultiplyColor.x, _CodeMultiplyColor.y, _CodeMultiplyColor.z, 0.0);
  if (i == 137u) value = float4(_CodeAddRimColor.x, _CodeAddRimColor.y, _CodeAddRimColor.z, _DitherThreshold);
  if (i == 138u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 141u) value = float4(_ShadowStrong, 0.0, 0.0, 0.0);
  if (i == 142u) value = float4(_SpecColor.x, _SpecColor.y, _SpecColor.z, _SpecColor.w);
  if (i == 143u) value = float4(_LightValue, _LightStrong, _SpecStrong, 0.0);
  if (i == 145u) value = float4(0.0, 0.0, 0.0, _Damage);
  if (i == 146u) value = float4(_DmgCol.x, _DmgCol.y, _DmgCol.z, _DmgCol.w);
  if (i == 148u) value = float4(_NoiseColStrong, 0.0, 0.0, 0.0);
  if (i == 149u) value = float4(_FireCol.x, _FireCol.y, _FireCol.z, _FireCol.w);
  if (i == 150u) value = float4(_FireBackCol_Str, _FireValue, _Fire, 0.0);
  if (i == 151u) value = float4(_GlowMaskColor0.x, _GlowMaskColor0.y, _GlowMaskColor0.z, _GlowStrictness0);
  if (i == 152u) value = float4(_GlowTint0.x, _GlowTint0.y, _GlowTint0.z, _GlowStrength0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD5,
  float3 v2 : NORMAL0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  float3 v8 : TEXCOORD7,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v5.z;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_133_CB0((uint)(137)).w * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = _mainTex.Sample(sampler_mainTex, v1.xy).xyzw;
  r1.xyzw = _sourceTex.Sample(sampler_sourceTex, v1.xy).xyzw;
  r0.w = saturate(-BA_Fragment_133_CB0((uint)(132)).x + v5.y);
  r1.y = r1.y * 2 + -1;
  r0.w = -r1.y + r0.w;
  r0.w = saturate(BA_Fragment_133_CB0((uint)(141)).x * r0.w);
  r2.xyz = BA_Fragment_133_CB0((uint)(126)).xyz + -v6.xyz;
  r2.xyz = r0.www * r2.xyz + v6.xyz;
  r3.xyz = BA_Fragment_133_CB0((uint)(133)).xyz * r1.zzz;
  r4.xyz = -r1.zzz * BA_Fragment_133_CB0((uint)(133)).xyz + float3(1,1,1);
  r3.xyz = r0.www * r4.xyz + r3.xyz;
  r1.x = r1.x * v5.x + -BA_Fragment_133_CB0((uint)(143)).x;
  r1.x = saturate(BA_Fragment_133_CB0((uint)(143)).y * r1.x);
  r2.xyz = r2.xyz * BA_Fragment_133_CB0((uint)(128)).xxx + v4.xyz;
  r1.w = min(BA_Fragment_133_CB2((uint)(11)).y, BA_Fragment_133_CB0((uint)(10)).x);
  r1.w = (int)r1.w;
  r4.xyz = float3(0,0,0);
  r2.w = 0;
  while (true) {
    r3.w = cmp((int)r2.w >= (int)r1.w);
    if (r3.w != 0) break;
    r3.w = (uint)r2.w >> 2;
    r4.w = (int)r2.w & 3;
    r3.w = dot(BA_Fragment_133_CB2((uint)(r3.w+12)).xyzw, icb[r4.w+0].xyzw);
    r3.w = (int)r3.w;
    r5.xyz = -v7.xyz * BA_Fragment_133_CB1((uint)(r3.w+0)).www + BA_Fragment_133_CB1((uint)(r3.w+0)).xyz;
    r4.w = dot(r5.xyz, r5.xyz);
    r4.w = max(6.10351563e-005, r4.w);
    r5.w = rsqrt(r4.w);
    r5.xyz = r5.xyz * r5.www;
    r5.w = 1 / r4.w;
    r4.w = BA_Fragment_133_CB1((uint)(r3.w+512)).x * r4.w;
    r4.w = -r4.w * r4.w + 1;
    r4.w = max(0, r4.w);
    r4.w = r4.w * r4.w;
    r4.w = r5.w * r4.w;
    r5.w = dot(BA_Fragment_133_CB1((uint)(r3.w+768)).xyz, r5.xyz);
    r5.w = saturate(r5.w * BA_Fragment_133_CB1((uint)(r3.w+512)).z + BA_Fragment_133_CB1((uint)(r3.w+512)).w);
    r5.w = r5.w * r5.w;
    r4.w = r5.w * r4.w;
    r6.xyz = BA_Fragment_133_CB1((uint)(r3.w+256)).xyz * r4.www;
    r3.w = dot(r5.xyz, v8.xyz);
    r4.w = r3.w + -r1.y;
    r3.w = saturate(r4.w * BA_Fragment_133_CB0((uint)(135)).x + r3.w);
    r4.xyz = r3.www * r6.xyz + r4.xyz;
    r2.w = (int)r2.w + 1;
  }
  r2.xyz = r4.xyz * BA_Fragment_133_CB0((uint)(134)).www + r2.xyz;
  r1.x = BA_Fragment_133_CB0((uint)(143)).z * r1.x;
  r1.x = BA_Fragment_133_CB0((uint)(128)).x * r1.x;
  r1.xyw = BA_Fragment_133_CB0((uint)(142)).xyz * r1.xxx;
  r1.xyw = BA_Fragment_133_CB0((uint)(126)).xyz * r1.xyw;
  r1.xyw = r2.xyz * r3.xyz + r1.xyw;
  r2.xyz = BA_Fragment_133_CB0((uint)(138)).xyz * r0.xyz;
  r3.xyz = BA_Fragment_133_CB0((uint)(151)).xyz + -r0.xyz;
  r2.w = dot(r3.xyz, r3.xyz);
  r2.w = saturate(BA_Fragment_133_CB0((uint)(151)).w * r2.w);
  r2.w = 1 + -r2.w;
  r2.w = BA_Fragment_133_CB0((uint)(152)).w * r2.w;
  r3.xyz = BA_Fragment_133_CB0((uint)(152)).xyz * r2.www;
  r1.xyw = r1.xyw * r2.xyz + r3.xyz;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, w1.xy).xyzw;
  r2.x = r2.x * 2 + -1;
  r2.x = saturate(BA_Fragment_133_CB0((uint)(148)).x * abs(r2.x));
  r2.x = r2.x + r2.x;
  r2.x = min(1, r2.x);
  r2.x = BA_Fragment_133_CB0((uint)(145)).w * r2.x;
  r2.yzw = BA_Fragment_133_CB0((uint)(133)).xyz * r0.xyz;
  r3.xyz = r2.yzw * r1.zzz;
  r0.xyz = -r2.yzw * r1.zzz + r0.xyz;
  r0.xyz = r0.www * r0.xyz + r3.xyz;
  r0.xyz = r0.xyz * BA_Fragment_133_CB0((uint)(146)).xyz + -r1.xyw;
  r0.xyz = r2.xxx * r0.xyz + r1.xyw;
  r0.xyz = -BA_Fragment_133_CB0((uint)(150)).zzz * BA_Fragment_133_CB0((uint)(150)).xxx + r0.xyz;
  r0.w = 1 + -v2.x;
  r0.w = saturate(-BA_Fragment_133_CB0((uint)(150)).y + r0.w);
  r1.xyz = BA_Fragment_133_CB0((uint)(149)).xyz * r0.www;
  r1.xyz = BA_Fragment_133_CB0((uint)(150)).zzz * r1.xyz;
  r0.w = 1 + -v3.x;
  r1.xyz = saturate(r1.xyz * r0.www);
  r0.xyz = r1.xyz + r0.xyz;
  r0.xyz = r0.xyz * BA_Fragment_133_CB0((uint)(136)).xyz + BA_Fragment_133_CB0((uint)(135)).yzw;
  r0.xyz = BA_Fragment_133_CB0((uint)(137)).xyz * float3(0.5,0.5,0.5) + r0.xyz;
  r0.w = exp2(-v4.w);
  r0.w = min(1, r0.w);
  r0.xyz = -BA_Fragment_133_CB0((uint)(56)).xyz + r0.xyz;
  o0.xyz = r0.www * r0.xyz + BA_Fragment_133_CB0((uint)(56)).xyz;
  o0.w = 1;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
