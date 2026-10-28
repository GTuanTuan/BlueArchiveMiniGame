// Exact names and types from the original compiled parameter metadata.
float4 _DeepWaterColor;
float _DeepWaterGradientCentroid;
float _DeepWaterGradientLimitFactor;
float _DepthLimit;
float _DepthTransparentAlpha;
float _DistortionScale;
float4 _FoamTint;
float4 _PatternTex_ST;
float _RufflePatternAlpha;
float _RufflePatternCutOff;
float _RufflePatternDistortionStrength;
float _RufflePatternFlowSpeed;
float4 _SandLineColor;
float4 _SwallowWaterColor;
float _SwallowWaterGradientCentroid;
float _SwallowWaterGradientLimitFactor;
float _TotalAlphaGradientCentroid;
float _TotalAlphaLimitFactor;
float _WaveDistortionStrength;
float _WaveFlowSpeed;
float _WavePatternAlpha;
float _WavePatternDistortionStrength;
float _WavePatternFlowSpeed;
float4 _WaveTex_ST;
float _WaveVertexHeight;
Texture2D<float4> _CameraDepthTexture;
Texture2D<float4> _PatternTex;
Texture2D<float4> _WaveTex;
SamplerState sampler_CameraDepthTexture;
SamplerState sampler_PatternTex;
SamplerState sampler_WaveTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR)
float4 BA_Vertex_2_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, 0.0, _TotalAlphaLimitFactor);
  if (i == 4u) value = float4(0.0, _SwallowWaterGradientLimitFactor, 0.0, _DeepWaterGradientLimitFactor);
  if (i == 5u) value = float4(_DeepWaterGradientCentroid, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_WaveTex_ST.x, _WaveTex_ST.y, _WaveTex_ST.z, _WaveTex_ST.w);
  if (i == 10u) value = float4(0.0, _WaveFlowSpeed, 0.0, _WaveVertexHeight);
  return value;
}

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
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.yz = v1.xy * BA_Vertex_2_CB2((uint)(6)).xy + BA_Vertex_2_CB2((uint)(6)).zw;
  r0.x = BA_Vertex_2_CB0((uint)(11)).y * BA_Vertex_2_CB2((uint)(10)).y + r0.y;
  r0.xyzw = _WaveTex.SampleLevel(sampler_WaveTex, r0.xz, 0).xyzw;
  r0.yz = float2(1,1) + -BA_Vertex_2_CB2((uint)(4)).yw;
  r0.yz = v1.xx + -r0.yz;
  r0.w = r0.z / BA_Vertex_2_CB2((uint)(5)).x;
  o3.yz = r0.yz;
  r0.y = saturate(1 + -r0.w);
  r0.y = BA_Vertex_2_CB2((uint)(10)).w * r0.y;
  r0.x = r0.x * r0.y + v0.z;
  r1.xyzw = BA_Vertex_2_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_2_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_2_CB1((uint)(2)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_2_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.y = BA_Vertex_2_CB0((uint)(17)).x * r0.y;
  r1.xzw = float3(0.5,0.5,0.5) * r0.xwy;
  o1.zw = r0.zw;
  o1.xy = r1.xw + r1.zz;
  r0.xy = BA_Vertex_2_CB1((uint)(1)).xz * v0.yy;
  r0.xy = BA_Vertex_2_CB1((uint)(0)).xz * v0.xx + r0.xy;
  r0.xy = BA_Vertex_2_CB1((uint)(2)).xz * v0.zz + r0.xy;
  o2.zw = BA_Vertex_2_CB1((uint)(3)).xz + r0.xy;
  o2.xy = v1.xy;
  r0.x = 1 + -BA_Vertex_2_CB2((uint)(3)).w;
  o3.x = v1.x + -r0.x;
  o3.w = 0;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR)
float4 BA_Vertex_3_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, 0.0, _TotalAlphaLimitFactor);
  if (i == 4u) value = float4(0.0, _SwallowWaterGradientLimitFactor, 0.0, _DeepWaterGradientLimitFactor);
  if (i == 5u) value = float4(_DeepWaterGradientCentroid, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_WaveTex_ST.x, _WaveTex_ST.y, _WaveTex_ST.z, _WaveTex_ST.w);
  if (i == 10u) value = float4(0.0, _WaveFlowSpeed, 0.0, _WaveVertexHeight);
  return value;
}

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
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.yz = v1.xy * BA_Vertex_3_CB2((uint)(6)).xy + BA_Vertex_3_CB2((uint)(6)).zw;
  r0.x = BA_Vertex_3_CB0((uint)(11)).y * BA_Vertex_3_CB2((uint)(10)).y + r0.y;
  r0.xyzw = _WaveTex.SampleLevel(sampler_WaveTex, r0.xz, 0).xyzw;
  r0.yz = float2(1,1) + -BA_Vertex_3_CB2((uint)(4)).yw;
  r0.yz = v1.xx + -r0.yz;
  r0.w = r0.z / BA_Vertex_3_CB2((uint)(5)).x;
  o3.yz = r0.yz;
  r0.y = saturate(1 + -r0.w);
  r0.y = BA_Vertex_3_CB2((uint)(10)).w * r0.y;
  r0.x = r0.x * r0.y + v0.z;
  r1.xyzw = BA_Vertex_3_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_3_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(2)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.y = BA_Vertex_3_CB0((uint)(17)).x * r0.y;
  r1.xzw = float3(0.5,0.5,0.5) * r0.xwy;
  o1.xy = r1.xw + r1.zz;
  o1.zw = r0.zw;
  r0.x = r0.z / BA_Vertex_3_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_3_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o3.w = saturate(r0.x * BA_Vertex_3_CB0((uint)(55)).z + BA_Vertex_3_CB0((uint)(55)).w);
  r0.xy = BA_Vertex_3_CB1((uint)(1)).xz * v0.yy;
  r0.xy = BA_Vertex_3_CB1((uint)(0)).xz * v0.xx + r0.xy;
  r0.xy = BA_Vertex_3_CB1((uint)(2)).xz * v0.zz + r0.xy;
  o2.zw = BA_Vertex_3_CB1((uint)(3)).xz + r0.xy;
  o2.xy = v1.xy;
  r0.x = 1 + -BA_Vertex_3_CB2((uint)(3)).w;
  o3.x = v1.x + -r0.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR)
float4 BA_Vertex_4_CB2(uint i)
{
  float4 value = 0;
  if (i == 3u) value = float4(0.0, 0.0, 0.0, _TotalAlphaLimitFactor);
  if (i == 4u) value = float4(0.0, _SwallowWaterGradientLimitFactor, 0.0, _DeepWaterGradientLimitFactor);
  if (i == 5u) value = float4(_DeepWaterGradientCentroid, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_WaveTex_ST.x, _WaveTex_ST.y, _WaveTex_ST.z, _WaveTex_ST.w);
  if (i == 10u) value = float4(0.0, _WaveFlowSpeed, 0.0, _WaveVertexHeight);
  return value;
}

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
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
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
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.yz = v1.xy * BA_Vertex_4_CB2((uint)(6)).xy + BA_Vertex_4_CB2((uint)(6)).zw;
  r0.x = BA_Vertex_4_CB0((uint)(11)).y * BA_Vertex_4_CB2((uint)(10)).y + r0.y;
  r0.xyzw = _WaveTex.SampleLevel(sampler_WaveTex, r0.xz, 0).xyzw;
  r0.yz = float2(1,1) + -BA_Vertex_4_CB2((uint)(4)).yw;
  r0.yz = v1.xx + -r0.yz;
  r0.w = r0.z / BA_Vertex_4_CB2((uint)(5)).x;
  o3.yz = r0.yz;
  r0.y = saturate(1 + -r0.w);
  r0.y = BA_Vertex_4_CB2((uint)(10)).w * r0.y;
  r0.x = r0.x * r0.y + v0.z;
  r1.xyzw = BA_Vertex_4_CB1((uint)(1)).xyzw * v0.yyyy;
  r1.xyzw = BA_Vertex_4_CB1((uint)(0)).xyzw * v0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(2)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  r0.y = BA_Vertex_4_CB0((uint)(17)).x * r0.y;
  r1.xzw = float3(0.5,0.5,0.5) * r0.xwy;
  o1.xy = r1.xw + r1.zz;
  o1.zw = r0.zw;
  r0.x = r0.z / BA_Vertex_4_CB0((uint)(17)).y;
  r0.x = 1 + -r0.x;
  r0.x = BA_Vertex_4_CB0((uint)(17)).z * r0.x;
  r0.x = max(0, r0.x);
  o3.w = BA_Vertex_4_CB0((uint)(55)).x * r0.x;
  r0.xy = BA_Vertex_4_CB1((uint)(1)).xz * v0.yy;
  r0.xy = BA_Vertex_4_CB1((uint)(0)).xz * v0.xx + r0.xy;
  r0.xy = BA_Vertex_4_CB1((uint)(2)).xz * v0.zz + r0.xy;
  o2.zw = BA_Vertex_4_CB1((uint)(3)).xz + r0.xy;
  o2.xy = v1.xy;
  r0.x = 1 + -BA_Vertex_4_CB2((uint)(3)).w;
  o3.x = v1.x + -r0.x;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR)
float4 BA_Fragment_7_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_DepthLimit, _DepthTransparentAlpha, 0.0, 0.0);
  if (i == 1u) value = float4(_SandLineColor.x, _SandLineColor.y, _SandLineColor.z, 0.0);
  if (i == 2u) value = float4(_SwallowWaterColor.x, _SwallowWaterColor.y, _SwallowWaterColor.z, 0.0);
  if (i == 3u) value = float4(_DeepWaterColor.x, _DeepWaterColor.y, _DeepWaterColor.z, 0.0);
  if (i == 4u) value = float4(_TotalAlphaGradientCentroid, 0.0, _SwallowWaterGradientCentroid, 0.0);
  if (i == 5u) value = float4(_DeepWaterGradientCentroid, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_WaveTex_ST.x, _WaveTex_ST.y, _WaveTex_ST.z, _WaveTex_ST.w);
  if (i == 7u) value = float4(_PatternTex_ST.x, _PatternTex_ST.y, _PatternTex_ST.z, _PatternTex_ST.w);
  if (i == 8u) value = float4(_WavePatternFlowSpeed, _WavePatternDistortionStrength, _WavePatternAlpha, 0.0);
  if (i == 9u) value = float4(_DistortionScale, _RufflePatternFlowSpeed, _RufflePatternDistortionStrength, _RufflePatternAlpha);
  if (i == 10u) value = float4(_RufflePatternCutOff, _WaveFlowSpeed, _WaveDistortionStrength, 0.0);
  if (i == 11u) value = float4(_FoamTint.x, _FoamTint.y, _FoamTint.z, _FoamTint.w);
  return value;
}

float4 BA_Fragment_7_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.yz = v2.xy * BA_Fragment_7_CB1((uint)(6)).xy + BA_Fragment_7_CB1((uint)(6)).zw;
  r0.x = BA_Fragment_7_CB0((uint)(11)).y * BA_Fragment_7_CB1((uint)(10)).y + r0.y;
  r0.yw = BA_Fragment_7_CB1((uint)(9)).xx * v2.zw;
  r1.xyzw = _PatternTex.SampleBias(sampler_PatternTex, r0.yw, BA_Fragment_7_CB0((uint)(19)).x).xyzw;
  r0.xy = r1.yy * BA_Fragment_7_CB1((uint)(10)).zz + r0.xz;
  r0.xyzw = _WaveTex.SampleBias(sampler_WaveTex, r0.xy, BA_Fragment_7_CB0((uint)(19)).x).xyzw;
  r2.zw = v2.zw * BA_Fragment_7_CB1((uint)(7)).xy + BA_Fragment_7_CB1((uint)(7)).zw;
  r2.y = BA_Fragment_7_CB0((uint)(11)).y * BA_Fragment_7_CB1((uint)(8)).x + r2.z;
  r0.zw = r1.yy * BA_Fragment_7_CB1((uint)(8)).yy + r2.yw;
  r3.xyzw = _PatternTex.SampleBias(sampler_PatternTex, r0.zw, BA_Fragment_7_CB0((uint)(19)).x).xyzw;
  r0.z = BA_Fragment_7_CB1((uint)(8)).z * r3.x;
  r0.x = r0.z * r0.x + r0.y;
  r2.x = BA_Fragment_7_CB0((uint)(11)).y * BA_Fragment_7_CB1((uint)(9)).y + r2.z;
  r0.yz = r1.yy * BA_Fragment_7_CB1((uint)(9)).zz + r2.xw;
  r1.xyzw = _PatternTex.SampleBias(sampler_PatternTex, r0.yz, BA_Fragment_7_CB0((uint)(19)).x).xyzw;
  r0.y = saturate(v3.z / BA_Fragment_7_CB1((uint)(5)).x);
  r0.z = r1.z * r0.y;
  r0.z = cmp(r0.z >= BA_Fragment_7_CB1((uint)(10)).x);
  r0.z = r0.z ? 1.000000 : 0;
  r0.z = r1.z * r0.y + r0.z;
  r0.z = BA_Fragment_7_CB1((uint)(9)).w * r0.z;
  r0.w = 1 + -r0.y;
  r0.w = BA_Fragment_7_CB1((uint)(11)).w * r0.w;
  r0.x = r0.x * r0.w + r0.z;
  r1.xyz = BA_Fragment_7_CB1((uint)(2)).xyz + -BA_Fragment_7_CB1((uint)(1)).xyz;
  r0.zw = saturate(v3.xy / BA_Fragment_7_CB1((uint)(4)).xz);
  r1.xyz = r0.www * r1.xyz + BA_Fragment_7_CB1((uint)(1)).xyz;
  r2.xyz = BA_Fragment_7_CB1((uint)(3)).xyz + -r1.xyz;
  r1.xyz = r0.yyy * r2.xyz + r1.xyz;
  o0.xyz = r0.xxx * BA_Fragment_7_CB1((uint)(11)).xyz + r1.xyz;
  r0.xyw = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_7_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_7_CB0((uint)(20)).z * r0.w + BA_Fragment_7_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.y = BA_Fragment_7_CB0((uint)(20)).z * r1.x + BA_Fragment_7_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.x = r0.y + -r0.x;
  r0.x = saturate(r0.x / BA_Fragment_7_CB1((uint)(0)).x);
  r0.y = 1 + -r0.x;
  r0.x = BA_Fragment_7_CB1((uint)(0)).y * r0.y + r0.x;
  o0.w = r0.z * r0.x;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR)
float4 BA_Fragment_8_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_DepthLimit, _DepthTransparentAlpha, 0.0, 0.0);
  if (i == 1u) value = float4(_SandLineColor.x, _SandLineColor.y, _SandLineColor.z, 0.0);
  if (i == 2u) value = float4(_SwallowWaterColor.x, _SwallowWaterColor.y, _SwallowWaterColor.z, 0.0);
  if (i == 3u) value = float4(_DeepWaterColor.x, _DeepWaterColor.y, _DeepWaterColor.z, 0.0);
  if (i == 4u) value = float4(_TotalAlphaGradientCentroid, 0.0, _SwallowWaterGradientCentroid, 0.0);
  if (i == 5u) value = float4(_DeepWaterGradientCentroid, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_WaveTex_ST.x, _WaveTex_ST.y, _WaveTex_ST.z, _WaveTex_ST.w);
  if (i == 7u) value = float4(_PatternTex_ST.x, _PatternTex_ST.y, _PatternTex_ST.z, _PatternTex_ST.w);
  if (i == 8u) value = float4(_WavePatternFlowSpeed, _WavePatternDistortionStrength, _WavePatternAlpha, 0.0);
  if (i == 9u) value = float4(_DistortionScale, _RufflePatternFlowSpeed, _RufflePatternDistortionStrength, _RufflePatternAlpha);
  if (i == 10u) value = float4(_RufflePatternCutOff, _WaveFlowSpeed, _WaveDistortionStrength, 0.0);
  if (i == 11u) value = float4(_FoamTint.x, _FoamTint.y, _FoamTint.z, _FoamTint.w);
  return value;
}

float4 BA_Fragment_8_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.yz = v2.xy * BA_Fragment_8_CB1((uint)(6)).xy + BA_Fragment_8_CB1((uint)(6)).zw;
  r0.x = BA_Fragment_8_CB0((uint)(11)).y * BA_Fragment_8_CB1((uint)(10)).y + r0.y;
  r0.yw = BA_Fragment_8_CB1((uint)(9)).xx * v2.zw;
  r1.xyzw = _PatternTex.SampleBias(sampler_PatternTex, r0.yw, BA_Fragment_8_CB0((uint)(19)).x).xyzw;
  r0.xy = r1.yy * BA_Fragment_8_CB1((uint)(10)).zz + r0.xz;
  r0.xyzw = _WaveTex.SampleBias(sampler_WaveTex, r0.xy, BA_Fragment_8_CB0((uint)(19)).x).xyzw;
  r2.zw = v2.zw * BA_Fragment_8_CB1((uint)(7)).xy + BA_Fragment_8_CB1((uint)(7)).zw;
  r2.y = BA_Fragment_8_CB0((uint)(11)).y * BA_Fragment_8_CB1((uint)(8)).x + r2.z;
  r0.zw = r1.yy * BA_Fragment_8_CB1((uint)(8)).yy + r2.yw;
  r3.xyzw = _PatternTex.SampleBias(sampler_PatternTex, r0.zw, BA_Fragment_8_CB0((uint)(19)).x).xyzw;
  r0.z = BA_Fragment_8_CB1((uint)(8)).z * r3.x;
  r0.x = r0.z * r0.x + r0.y;
  r2.x = BA_Fragment_8_CB0((uint)(11)).y * BA_Fragment_8_CB1((uint)(9)).y + r2.z;
  r0.yz = r1.yy * BA_Fragment_8_CB1((uint)(9)).zz + r2.xw;
  r1.xyzw = _PatternTex.SampleBias(sampler_PatternTex, r0.yz, BA_Fragment_8_CB0((uint)(19)).x).xyzw;
  r0.y = saturate(v3.z / BA_Fragment_8_CB1((uint)(5)).x);
  r0.z = r1.z * r0.y;
  r0.z = cmp(r0.z >= BA_Fragment_8_CB1((uint)(10)).x);
  r0.z = r0.z ? 1.000000 : 0;
  r0.z = r1.z * r0.y + r0.z;
  r0.z = BA_Fragment_8_CB1((uint)(9)).w * r0.z;
  r0.w = 1 + -r0.y;
  r0.w = BA_Fragment_8_CB1((uint)(11)).w * r0.w;
  r0.x = r0.x * r0.w + r0.z;
  r1.xyz = BA_Fragment_8_CB1((uint)(2)).xyz + -BA_Fragment_8_CB1((uint)(1)).xyz;
  r0.zw = saturate(v3.xy / BA_Fragment_8_CB1((uint)(4)).xz);
  r1.xyz = r0.www * r1.xyz + BA_Fragment_8_CB1((uint)(1)).xyz;
  r2.xyz = BA_Fragment_8_CB1((uint)(3)).xyz + -r1.xyz;
  r1.xyz = r0.yyy * r2.xyz + r1.xyz;
  r0.xyw = r0.xxx * BA_Fragment_8_CB1((uint)(11)).xyz + r1.xyz;
  r0.xyw = -BA_Fragment_8_CB0((uint)(56)).xyz + r0.xyw;
  o0.xyz = v3.www * r0.xyw + BA_Fragment_8_CB0((uint)(56)).xyz;
  r0.xyw = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_8_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_8_CB0((uint)(20)).z * r0.w + BA_Fragment_8_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.y = BA_Fragment_8_CB0((uint)(20)).z * r1.x + BA_Fragment_8_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.x = r0.y + -r0.x;
  r0.x = saturate(r0.x / BA_Fragment_8_CB1((uint)(0)).x);
  r0.y = 1 + -r0.x;
  r0.x = BA_Fragment_8_CB1((uint)(0)).y * r0.y + r0.x;
  o0.w = r0.z * r0.x;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR)
float4 BA_Fragment_9_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_DepthLimit, _DepthTransparentAlpha, 0.0, 0.0);
  if (i == 1u) value = float4(_SandLineColor.x, _SandLineColor.y, _SandLineColor.z, 0.0);
  if (i == 2u) value = float4(_SwallowWaterColor.x, _SwallowWaterColor.y, _SwallowWaterColor.z, 0.0);
  if (i == 3u) value = float4(_DeepWaterColor.x, _DeepWaterColor.y, _DeepWaterColor.z, 0.0);
  if (i == 4u) value = float4(_TotalAlphaGradientCentroid, 0.0, _SwallowWaterGradientCentroid, 0.0);
  if (i == 5u) value = float4(_DeepWaterGradientCentroid, 0.0, 0.0, 0.0);
  if (i == 6u) value = float4(_WaveTex_ST.x, _WaveTex_ST.y, _WaveTex_ST.z, _WaveTex_ST.w);
  if (i == 7u) value = float4(_PatternTex_ST.x, _PatternTex_ST.y, _PatternTex_ST.z, _PatternTex_ST.w);
  if (i == 8u) value = float4(_WavePatternFlowSpeed, _WavePatternDistortionStrength, _WavePatternAlpha, 0.0);
  if (i == 9u) value = float4(_DistortionScale, _RufflePatternFlowSpeed, _RufflePatternDistortionStrength, _RufflePatternAlpha);
  if (i == 10u) value = float4(_RufflePatternCutOff, _WaveFlowSpeed, _WaveDistortionStrength, 0.0);
  if (i == 11u) value = float4(_FoamTint.x, _FoamTint.y, _FoamTint.z, _FoamTint.w);
  return value;
}

float4 BA_Fragment_9_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  if (i == 56u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.yz = v2.xy * BA_Fragment_9_CB1((uint)(6)).xy + BA_Fragment_9_CB1((uint)(6)).zw;
  r0.x = BA_Fragment_9_CB0((uint)(11)).y * BA_Fragment_9_CB1((uint)(10)).y + r0.y;
  r0.yw = BA_Fragment_9_CB1((uint)(9)).xx * v2.zw;
  r1.xyzw = _PatternTex.SampleBias(sampler_PatternTex, r0.yw, BA_Fragment_9_CB0((uint)(19)).x).xyzw;
  r0.xy = r1.yy * BA_Fragment_9_CB1((uint)(10)).zz + r0.xz;
  r0.xyzw = _WaveTex.SampleBias(sampler_WaveTex, r0.xy, BA_Fragment_9_CB0((uint)(19)).x).xyzw;
  r2.zw = v2.zw * BA_Fragment_9_CB1((uint)(7)).xy + BA_Fragment_9_CB1((uint)(7)).zw;
  r2.y = BA_Fragment_9_CB0((uint)(11)).y * BA_Fragment_9_CB1((uint)(8)).x + r2.z;
  r0.zw = r1.yy * BA_Fragment_9_CB1((uint)(8)).yy + r2.yw;
  r3.xyzw = _PatternTex.SampleBias(sampler_PatternTex, r0.zw, BA_Fragment_9_CB0((uint)(19)).x).xyzw;
  r0.z = BA_Fragment_9_CB1((uint)(8)).z * r3.x;
  r0.x = r0.z * r0.x + r0.y;
  r2.x = BA_Fragment_9_CB0((uint)(11)).y * BA_Fragment_9_CB1((uint)(9)).y + r2.z;
  r0.yz = r1.yy * BA_Fragment_9_CB1((uint)(9)).zz + r2.xw;
  r1.xyzw = _PatternTex.SampleBias(sampler_PatternTex, r0.yz, BA_Fragment_9_CB0((uint)(19)).x).xyzw;
  r0.y = saturate(v3.z / BA_Fragment_9_CB1((uint)(5)).x);
  r0.z = r1.z * r0.y;
  r0.z = cmp(r0.z >= BA_Fragment_9_CB1((uint)(10)).x);
  r0.z = r0.z ? 1.000000 : 0;
  r0.z = r1.z * r0.y + r0.z;
  r0.z = BA_Fragment_9_CB1((uint)(9)).w * r0.z;
  r0.w = 1 + -r0.y;
  r0.w = BA_Fragment_9_CB1((uint)(11)).w * r0.w;
  r0.x = r0.x * r0.w + r0.z;
  r1.xyz = BA_Fragment_9_CB1((uint)(2)).xyz + -BA_Fragment_9_CB1((uint)(1)).xyz;
  r0.zw = saturate(v3.xy / BA_Fragment_9_CB1((uint)(4)).xz);
  r1.xyz = r0.www * r1.xyz + BA_Fragment_9_CB1((uint)(1)).xyz;
  r2.xyz = BA_Fragment_9_CB1((uint)(3)).xyz + -r1.xyz;
  r1.xyz = r0.yyy * r2.xyz + r1.xyz;
  r0.xyw = r0.xxx * BA_Fragment_9_CB1((uint)(11)).xyz + r1.xyz;
  r0.xyw = -BA_Fragment_9_CB0((uint)(56)).xyz + r0.xyw;
  r1.x = exp2(-v3.w);
  r1.x = min(1, r1.x);
  o0.xyz = r1.xxx * r0.xyw + BA_Fragment_9_CB0((uint)(56)).xyz;
  r0.xyw = v1.xyz / v1.www;
  r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_9_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_9_CB0((uint)(20)).z * r0.w + BA_Fragment_9_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.y = BA_Fragment_9_CB0((uint)(20)).z * r1.x + BA_Fragment_9_CB0((uint)(20)).w;
  r0.y = 1 / r0.y;
  r0.x = r0.y + -r0.x;
  r0.x = saturate(r0.x / BA_Fragment_9_CB1((uint)(0)).x);
  r0.y = 1 + -r0.x;
  r0.x = BA_Fragment_9_CB1((uint)(0)).y * r0.y + r0.x;
  o0.w = r0.z * r0.x;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
