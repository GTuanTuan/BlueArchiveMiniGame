// Exact names and types from the original compiled parameter metadata.
float4 _BaseColor;
float4 _DeepWaveColor;
float4 _FoamColor;
float4 _FoamMaskTex_ST;
float _FoamSpeed;
float4 _FoamTex_ST;
float _FoamValue;
float4 _MasterColor;
float4 _WaveColor;
float _WaveInt;
float _WaveSpeed_A;
float _WaveSpeed_B;
float4 _WaveTex_ST;
Texture2D<float4> _FoamMaskTex;
Texture2D<float4> _FoamTex;
Texture2D<float4> _WaveTex;
SamplerState sampler_FoamMaskTex;
SamplerState sampler_FoamTex;
SamplerState sampler_WaveTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR)
float4 BA_Vertex_2_CB3(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 18u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 19u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 20u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

float4 BA_Vertex_2_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_2_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

float4 BA_Vertex_2_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_FoamMaskTex_ST.x, _FoamMaskTex_ST.y, _FoamMaskTex_ST.z, _FoamMaskTex_ST.w);
  if (i == 3u) value = float4(_FoamTex_ST.x, _FoamTex_ST.y, _FoamTex_ST.z, _FoamTex_ST.w);
  if (i == 4u) value = float4(_WaveTex_ST.x, _WaveTex_ST.y, _WaveTex_ST.z, _WaveTex_ST.w);
  if (i == 10u) value = float4(0.0, 0.0, _FoamSpeed, _WaveSpeed_A);
  if (i == 11u) value = float4(_WaveSpeed_B, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : TEXCOORD0,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v1.xy * BA_Vertex_2_CB0((uint)(2)).xy + BA_Vertex_2_CB0((uint)(2)).zw;
  r0.x = 0.100000001 * BA_Vertex_2_CB1((uint)(0)).y;
  r1.xyz = -r0.xxx * BA_Vertex_2_CB0((uint)(10)).zzw + v1.yxx;
  r2.w = r1.x;
  r2.xyz = r0.xxx * BA_Vertex_2_CB0((uint)(10)).wzz + v1.xxy;
  o1.xy = r2.yw * BA_Vertex_2_CB0((uint)(3)).xy + BA_Vertex_2_CB0((uint)(3)).zw;
  r1.w = r2.z;
  o1.zw = r1.yw * BA_Vertex_2_CB0((uint)(3)).xy + BA_Vertex_2_CB0((uint)(3)).zw;
  r2.y = r0.x * BA_Vertex_2_CB0((uint)(11)).x + v1.y;
  r1.w = -r0.x * BA_Vertex_2_CB0((uint)(11)).x + v1.y;
  o2.zw = r1.zw * BA_Vertex_2_CB0((uint)(4)).xy + BA_Vertex_2_CB0((uint)(4)).zw;
  o2.xy = r2.xy * BA_Vertex_2_CB0((uint)(4)).xy + BA_Vertex_2_CB0((uint)(4)).zw;
  o3.xyzw = float4(0,0,0,0);
  r0.xyzw = BA_Vertex_2_CB2((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_2_CB2((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB2((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB2((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_2_CB3((uint)(18)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB3((uint)(17)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_2_CB3((uint)(19)).xyzw * r0.zzzz + r1.xyzw;
  o4.xyzw = BA_Vertex_2_CB3((uint)(20)).xyzw * r0.wwww + r1.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR)
float4 BA_Vertex_3_CB4(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  return value;
}

float4 BA_Vertex_3_CB3(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 18u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 19u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 20u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

float4 BA_Vertex_3_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_3_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 5u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  return value;
}

float4 BA_Vertex_3_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_FoamMaskTex_ST.x, _FoamMaskTex_ST.y, _FoamMaskTex_ST.z, _FoamMaskTex_ST.w);
  if (i == 3u) value = float4(_FoamTex_ST.x, _FoamTex_ST.y, _FoamTex_ST.z, _FoamTex_ST.w);
  if (i == 4u) value = float4(_WaveTex_ST.x, _WaveTex_ST.y, _WaveTex_ST.z, _WaveTex_ST.w);
  if (i == 10u) value = float4(0.0, 0.0, _FoamSpeed, _WaveSpeed_A);
  if (i == 11u) value = float4(_WaveSpeed_B, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float2 o0 : TEXCOORD0,
  out float p0 : TEXCOORD4,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  p0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_3_CB2((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_3_CB2((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB2((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB2((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_3_CB3((uint)(18)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB3((uint)(17)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_3_CB3((uint)(19)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_3_CB3((uint)(20)).xyzw * r0.wwww + r1.xyzw;
  r1.x = r0.z / BA_Vertex_3_CB1((uint)(5)).y;
  o4.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_3_CB1((uint)(5)).z * r0.x;
  r0.x = max(0, r0.x);
  p0.x = r0.x * BA_Vertex_3_CB4((uint)(1)).z + BA_Vertex_3_CB4((uint)(1)).w;
  o0.xy = v1.xy * BA_Vertex_3_CB0((uint)(2)).xy + BA_Vertex_3_CB0((uint)(2)).zw;
  r0.x = 0.100000001 * BA_Vertex_3_CB1((uint)(0)).y;
  r1.xyz = -r0.xxx * BA_Vertex_3_CB0((uint)(10)).zzw + v1.yxx;
  r2.w = r1.x;
  r2.xyz = r0.xxx * BA_Vertex_3_CB0((uint)(10)).wzz + v1.xxy;
  o1.xy = r2.yw * BA_Vertex_3_CB0((uint)(3)).xy + BA_Vertex_3_CB0((uint)(3)).zw;
  r1.w = r2.z;
  o1.zw = r1.yw * BA_Vertex_3_CB0((uint)(3)).xy + BA_Vertex_3_CB0((uint)(3)).zw;
  r2.y = r0.x * BA_Vertex_3_CB0((uint)(11)).x + v1.y;
  r1.w = -r0.x * BA_Vertex_3_CB0((uint)(11)).x + v1.y;
  o2.zw = r1.zw * BA_Vertex_3_CB0((uint)(4)).xy + BA_Vertex_3_CB0((uint)(4)).zw;
  o2.xy = r2.xy * BA_Vertex_3_CB0((uint)(4)).xy + BA_Vertex_3_CB0((uint)(4)).zw;
  o3.xyzw = float4(0,0,0,0);
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR)
float4 BA_Vertex_4_CB4(uint i)
{
  float4 value = 0;
  if (i == 1u) value = float4(unity_FogParams.x, unity_FogParams.y, unity_FogParams.z, unity_FogParams.w);
  return value;
}

float4 BA_Vertex_4_CB3(uint i)
{
  float4 value = 0;
  if (i == 17u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 18u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 19u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 20u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

float4 BA_Vertex_4_CB2(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_4_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 5u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  return value;
}

float4 BA_Vertex_4_CB0(uint i)
{
  float4 value = 0;
  if (i == 2u) value = float4(_FoamMaskTex_ST.x, _FoamMaskTex_ST.y, _FoamMaskTex_ST.z, _FoamMaskTex_ST.w);
  if (i == 3u) value = float4(_FoamTex_ST.x, _FoamTex_ST.y, _FoamTex_ST.z, _FoamTex_ST.w);
  if (i == 4u) value = float4(_WaveTex_ST.x, _WaveTex_ST.y, _WaveTex_ST.z, _WaveTex_ST.w);
  if (i == 10u) value = float4(0.0, 0.0, _FoamSpeed, _WaveSpeed_A);
  if (i == 11u) value = float4(_WaveSpeed_B, 0.0, 0.0, 0.0);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float2 o0 : TEXCOORD0,
  out float p0 : TEXCOORD4,
  out float4 o1 : TEXCOORD1,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : SV_POSITION0)
{
  o0 = 0;
  p0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_4_CB2((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_4_CB2((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB2((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB2((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_4_CB3((uint)(18)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB3((uint)(17)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_4_CB3((uint)(19)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_4_CB3((uint)(20)).xyzw * r0.wwww + r1.xyzw;
  r1.x = r0.z / BA_Vertex_4_CB1((uint)(5)).y;
  o4.xyzw = r0.xyzw;
  r0.x = 1 + -r1.x;
  r0.x = BA_Vertex_4_CB1((uint)(5)).z * r0.x;
  r0.x = max(0, r0.x);
  r0.x = BA_Vertex_4_CB4((uint)(1)).y * r0.x;
  p0.x = exp2(-r0.x);
  o0.xy = v1.xy * BA_Vertex_4_CB0((uint)(2)).xy + BA_Vertex_4_CB0((uint)(2)).zw;
  r0.x = 0.100000001 * BA_Vertex_4_CB1((uint)(0)).y;
  r1.xyz = -r0.xxx * BA_Vertex_4_CB0((uint)(10)).zzw + v1.yxx;
  r2.w = r1.x;
  r2.xyz = r0.xxx * BA_Vertex_4_CB0((uint)(10)).wzz + v1.xxy;
  o1.xy = r2.yw * BA_Vertex_4_CB0((uint)(3)).xy + BA_Vertex_4_CB0((uint)(3)).zw;
  r1.w = r2.z;
  o1.zw = r1.yw * BA_Vertex_4_CB0((uint)(3)).xy + BA_Vertex_4_CB0((uint)(3)).zw;
  r2.y = r0.x * BA_Vertex_4_CB0((uint)(11)).x + v1.y;
  r1.w = -r0.x * BA_Vertex_4_CB0((uint)(11)).x + v1.y;
  o2.zw = r1.zw * BA_Vertex_4_CB0((uint)(4)).xy + BA_Vertex_4_CB0((uint)(4)).zw;
  o2.xy = r2.xy * BA_Vertex_4_CB0((uint)(4)).xy + BA_Vertex_4_CB0((uint)(4)).zw;
  o3.xyzw = float4(0,0,0,0);
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(FOG_EXP) && !defined(FOG_LINEAR)
float4 BA_Fragment_7_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_BaseColor.x, _BaseColor.y, _BaseColor.z, _BaseColor.w);
  if (i == 6u) value = float4(_FoamColor.x, _FoamColor.y, _FoamColor.z, _FoamColor.w);
  if (i == 7u) value = float4(_WaveColor.x, _WaveColor.y, _WaveColor.z, _WaveColor.w);
  if (i == 8u) value = float4(_DeepWaveColor.x, _DeepWaveColor.y, _DeepWaveColor.z, _DeepWaveColor.w);
  if (i == 9u) value = float4(_MasterColor.x, _MasterColor.y, _MasterColor.z, _MasterColor.w);
  if (i == 10u) value = float4(_FoamValue, _WaveInt, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _WaveTex.Sample(sampler_WaveTex, v2.xy).xyzw;
  r0.x = BA_Fragment_7_CB0((uint)(10)).y * r0.z;
  r0.xyzw = r0.xxxx * float4(0.100000001,0.100000001,0.100000001,0.100000001) + v2.xyzw;
  r1.xyzw = _WaveTex.Sample(sampler_WaveTex, r0.xy).xyzw;
  r0.xyzw = _WaveTex.Sample(sampler_WaveTex, r0.zw).xyzw;
  r0.x = r1.x * r0.y;
  r0.yzw = BA_Fragment_7_CB0((uint)(8)).xyz * r0.yyy;
  r1.x = cmp(r0.x >= 0.200000003);
  r1.x = r1.x ? 1.000000 : 0;
  r0.x = r1.x * r0.x;
  r1.xyz = cmp(r0.yzw >= float3(0.100000001,0.100000001,0.100000001));
  r1.xyz = r1.xyz ? float3(1,1,1) : 0;
  r1.xyz = r1.xyz * r0.yzw;
  r1.w = 0;
  r0.xyzw = r0.xxxx * BA_Fragment_7_CB0((uint)(7)).xyzw + r1.xyzw;
  r1.xyzw = _FoamTex.Sample(sampler_FoamTex, v1.xy).xyzw;
  r2.xyzw = _FoamTex.Sample(sampler_FoamTex, v1.zw).xyzw;
  r1.x = r2.y * r1.x;
  r2.xyzw = _FoamMaskTex.Sample(sampler_FoamMaskTex, v0.xy).xyzw;
  r1.y = log2(r2.x);
  r1.y = BA_Fragment_7_CB0((uint)(10)).x * r1.y;
  r1.z = 0.600000024 * r1.y;
  r1.y = exp2(r1.y);
  r1.z = exp2(r1.z);
  r1.x = r1.x * r1.z + r1.y;
  r1.y = cmp(r1.x >= 0.200000003);
  r1.y = r1.y ? 1.000000 : 0;
  r1.x = r1.x * r1.y;
  r1.xyzw = saturate(r1.xxxx * BA_Fragment_7_CB0((uint)(6)).xyzw + BA_Fragment_7_CB0((uint)(5)).xyzw);
  r0.xyzw = r1.xyzw + r0.xyzw;
  o0.xyzw = BA_Fragment_7_CB0((uint)(9)).xyzw * r0.xyzw;
  return;
}
#elif !defined(FOG_EXP) && defined(FOG_LINEAR)
float4 BA_Fragment_8_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

float4 BA_Fragment_8_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_BaseColor.x, _BaseColor.y, _BaseColor.z, _BaseColor.w);
  if (i == 6u) value = float4(_FoamColor.x, _FoamColor.y, _FoamColor.z, _FoamColor.w);
  if (i == 7u) value = float4(_WaveColor.x, _WaveColor.y, _WaveColor.z, _WaveColor.w);
  if (i == 8u) value = float4(_DeepWaveColor.x, _DeepWaveColor.y, _DeepWaveColor.z, _DeepWaveColor.w);
  if (i == 9u) value = float4(_MasterColor.x, _MasterColor.y, _MasterColor.z, _MasterColor.w);
  if (i == 10u) value = float4(_FoamValue, _WaveInt, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float2 v0 : TEXCOORD0,
  float w0 : TEXCOORD4,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _WaveTex.Sample(sampler_WaveTex, v2.xy).xyzw;
  r0.x = BA_Fragment_8_CB0((uint)(10)).y * r0.z;
  r0.xyzw = r0.xxxx * float4(0.100000001,0.100000001,0.100000001,0.100000001) + v2.xyzw;
  r1.xyzw = _WaveTex.Sample(sampler_WaveTex, r0.xy).xyzw;
  r0.xyzw = _WaveTex.Sample(sampler_WaveTex, r0.zw).xyzw;
  r0.x = r1.x * r0.y;
  r0.yzw = BA_Fragment_8_CB0((uint)(8)).xyz * r0.yyy;
  r1.x = cmp(r0.x >= 0.200000003);
  r1.x = r1.x ? 1.000000 : 0;
  r0.x = r1.x * r0.x;
  r1.xyz = cmp(r0.yzw >= float3(0.100000001,0.100000001,0.100000001));
  r1.xyz = r1.xyz ? float3(1,1,1) : 0;
  r1.xyz = r1.xyz * r0.yzw;
  r1.w = 0;
  r0.xyzw = r0.xxxx * BA_Fragment_8_CB0((uint)(7)).xyzw + r1.xyzw;
  r1.xyzw = _FoamTex.Sample(sampler_FoamTex, v1.xy).xyzw;
  r2.xyzw = _FoamTex.Sample(sampler_FoamTex, v1.zw).xyzw;
  r1.x = r2.y * r1.x;
  r2.xyzw = _FoamMaskTex.Sample(sampler_FoamMaskTex, v0.xy).xyzw;
  r1.y = log2(r2.x);
  r1.y = BA_Fragment_8_CB0((uint)(10)).x * r1.y;
  r1.z = 0.600000024 * r1.y;
  r1.y = exp2(r1.y);
  r1.z = exp2(r1.z);
  r1.x = r1.x * r1.z + r1.y;
  r1.y = cmp(r1.x >= 0.200000003);
  r1.y = r1.y ? 1.000000 : 0;
  r1.x = r1.x * r1.y;
  r1.xyzw = saturate(r1.xxxx * BA_Fragment_8_CB0((uint)(6)).xyzw + BA_Fragment_8_CB0((uint)(5)).xyzw);
  r0.xyzw = r1.xyzw + r0.xyzw;
  r0.xyz = r0.xyz * BA_Fragment_8_CB0((uint)(9)).xyz + -BA_Fragment_8_CB1((uint)(0)).xyz;
  r0.w = BA_Fragment_8_CB0((uint)(9)).w * r0.w;
  o0.w = r0.w;
  r0.w = saturate(w0.x);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_8_CB1((uint)(0)).xyz;
  return;
}
#elif defined(FOG_EXP) && !defined(FOG_LINEAR)
float4 BA_Fragment_9_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(unity_FogColor.x, unity_FogColor.y, unity_FogColor.z, unity_FogColor.w);
  return value;
}

float4 BA_Fragment_9_CB0(uint i)
{
  float4 value = 0;
  if (i == 5u) value = float4(_BaseColor.x, _BaseColor.y, _BaseColor.z, _BaseColor.w);
  if (i == 6u) value = float4(_FoamColor.x, _FoamColor.y, _FoamColor.z, _FoamColor.w);
  if (i == 7u) value = float4(_WaveColor.x, _WaveColor.y, _WaveColor.z, _WaveColor.w);
  if (i == 8u) value = float4(_DeepWaveColor.x, _DeepWaveColor.y, _DeepWaveColor.z, _DeepWaveColor.w);
  if (i == 9u) value = float4(_MasterColor.x, _MasterColor.y, _MasterColor.z, _MasterColor.w);
  if (i == 10u) value = float4(_FoamValue, _WaveInt, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float2 v0 : TEXCOORD0,
  float w0 : TEXCOORD4,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : SV_POSITION0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _WaveTex.Sample(sampler_WaveTex, v2.xy).xyzw;
  r0.x = BA_Fragment_9_CB0((uint)(10)).y * r0.z;
  r0.xyzw = r0.xxxx * float4(0.100000001,0.100000001,0.100000001,0.100000001) + v2.xyzw;
  r1.xyzw = _WaveTex.Sample(sampler_WaveTex, r0.xy).xyzw;
  r0.xyzw = _WaveTex.Sample(sampler_WaveTex, r0.zw).xyzw;
  r0.x = r1.x * r0.y;
  r0.yzw = BA_Fragment_9_CB0((uint)(8)).xyz * r0.yyy;
  r1.x = cmp(r0.x >= 0.200000003);
  r1.x = r1.x ? 1.000000 : 0;
  r0.x = r1.x * r0.x;
  r1.xyz = cmp(r0.yzw >= float3(0.100000001,0.100000001,0.100000001));
  r1.xyz = r1.xyz ? float3(1,1,1) : 0;
  r1.xyz = r1.xyz * r0.yzw;
  r1.w = 0;
  r0.xyzw = r0.xxxx * BA_Fragment_9_CB0((uint)(7)).xyzw + r1.xyzw;
  r1.xyzw = _FoamTex.Sample(sampler_FoamTex, v1.xy).xyzw;
  r2.xyzw = _FoamTex.Sample(sampler_FoamTex, v1.zw).xyzw;
  r1.x = r2.y * r1.x;
  r2.xyzw = _FoamMaskTex.Sample(sampler_FoamMaskTex, v0.xy).xyzw;
  r1.y = log2(r2.x);
  r1.y = BA_Fragment_9_CB0((uint)(10)).x * r1.y;
  r1.z = 0.600000024 * r1.y;
  r1.y = exp2(r1.y);
  r1.z = exp2(r1.z);
  r1.x = r1.x * r1.z + r1.y;
  r1.y = cmp(r1.x >= 0.200000003);
  r1.y = r1.y ? 1.000000 : 0;
  r1.x = r1.x * r1.y;
  r1.xyzw = saturate(r1.xxxx * BA_Fragment_9_CB0((uint)(6)).xyzw + BA_Fragment_9_CB0((uint)(5)).xyzw);
  r0.xyzw = r1.xyzw + r0.xyzw;
  r0.xyz = r0.xyz * BA_Fragment_9_CB0((uint)(9)).xyz + -BA_Fragment_9_CB1((uint)(0)).xyz;
  r0.w = BA_Fragment_9_CB0((uint)(9)).w * r0.w;
  o0.w = r0.w;
  r0.w = saturate(w0.x);
  o0.xyz = r0.www * r0.xyz + BA_Fragment_9_CB1((uint)(0)).xyz;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
