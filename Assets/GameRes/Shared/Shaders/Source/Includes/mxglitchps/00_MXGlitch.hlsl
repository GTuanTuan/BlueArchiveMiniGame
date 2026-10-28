// Exact names and types from the original compiled parameter metadata.
float4 _GlitchParamsA;
float4 _GlitchParamsB;
Texture2D<float4> _SourceTex;
SamplerState sampler_SourceTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && !defined(_MX_POST_GLITCH_VERTICAL) && !defined(_USE_DRAW_PROCEDURAL)
float4 BA_Vertex_2_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_2_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_2_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_2_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_2_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_2_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_2_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_2_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && !defined(_MX_POST_GLITCH_VERTICAL) && !defined(_USE_DRAW_PROCEDURAL)
float4 BA_Vertex_3_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_3_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_3_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_3_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_3_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_3_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_3_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_3_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && defined(_MX_POST_GLITCH_VERTICAL) && !defined(_USE_DRAW_PROCEDURAL)
float4 BA_Vertex_4_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_4_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_4_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_4_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_4_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_4_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_4_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_4_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && defined(_MX_POST_GLITCH_VERTICAL) && !defined(_USE_DRAW_PROCEDURAL)
float4 BA_Vertex_5_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_5_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_5_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_5_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_5_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_5_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xy = v1.xy;
  return;
}
#elif !defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && !defined(_MX_POST_GLITCH_VERTICAL) && defined(_USE_DRAW_PROCEDURAL)
float4 BA_Vertex_6_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_6_CB0((uint)(22)).xy + BA_Vertex_6_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && !defined(_MX_POST_GLITCH_VERTICAL) && defined(_USE_DRAW_PROCEDURAL)
float4 BA_Vertex_7_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_7_CB0((uint)(22)).xy + BA_Vertex_7_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif !defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && defined(_MX_POST_GLITCH_VERTICAL) && defined(_USE_DRAW_PROCEDURAL)
float4 BA_Vertex_8_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_8_CB0((uint)(22)).xy + BA_Vertex_8_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#elif defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && defined(_MX_POST_GLITCH_VERTICAL) && defined(_USE_DRAW_PROCEDURAL)
float4 BA_Vertex_9_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 22u) value = float4(_ScaleBias.x, _ScaleBias.y, _ScaleBias.z, _ScaleBias.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  uint v0 : SV_VertexID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  o0 = 0;
  o1 = 0;

float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v0.x & 1;
  r0.y = (uint)v0.x >> 1;
  r0.z = (int)-r0.x + (int)-r0.y;
  r0.x = (int)r0.x + (int)r0.y;
  r1.x = (uint)r0.y;
  r0.x = (int)r0.x & 1;
  r0.x = (uint)r0.x;
  r1.z = 1 + -r0.x;
  o1.xy = r1.xz * BA_Vertex_9_CB0((uint)(22)).xy + BA_Vertex_9_CB0((uint)(22)).zw;
  r0.x = (int)r0.z + 1;
  r0.x = (int)r0.x & 1;
  r1.y = (uint)r0.x;
  o0.xy = r1.xy * float2(2,-2) + float2(-1,1);
  o0.zw = float2(1,1);
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && !defined(_MX_POST_GLITCH_VERTICAL) && !defined(_USE_DRAW_PROCEDURAL)
float4 BA_Fragment_12_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 128u) value = float4(_GlitchParamsA.x, _GlitchParamsA.y, _GlitchParamsA.z, _GlitchParamsA.w);
  if (i == 129u) value = float4(_GlitchParamsB.x, _GlitchParamsB.y, _GlitchParamsB.z, _GlitchParamsB.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_12_CB0((uint)(11)).x;
  r0.y = 2;
  r0.x = dot(r0.xy, float2(12.9898005,78.2330017));
  r0.x = sin(r0.x);
  r0.x = 43758.5469 * r0.x;
  r0.x = frac(r0.x);
  r0.x = -0.5 + r0.x;
  r0.x = BA_Fragment_12_CB0((uint)(129)).x * r0.x;
  r0.y = BA_Fragment_12_CB0((uint)(128)).w * BA_Fragment_12_CB0((uint)(11)).x;
  r0.y = sin(r0.y);
  r0.y = 1 + r0.y;
  r1.x = 0.5 * r0.y;
  r1.y = 0.5 + v1.y;
  r0.y = dot(r1.xy, float2(12.9898005,78.2330017));
  r0.y = sin(r0.y);
  r0.y = 43758.5469 * r0.y;
  r0.y = frac(r0.y);
  r0.y = r0.y * 2 + -1;
  r0.z = cmp(abs(r0.y) >= BA_Fragment_12_CB0((uint)(128)).y);
  r0.z = r0.z ? 1.000000 : 0;
  r0.z = BA_Fragment_12_CB0((uint)(128)).x * r0.z;
  r0.x = r0.y * r0.z + r0.x;
  r0.x = v1.x + r0.x;
  r0.y = v1.y;
  o0.xyzw = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_12_CB0((uint)(19)).x).xyzw;
  return;
}
#elif defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && !defined(_MX_POST_GLITCH_VERTICAL) && !defined(_USE_DRAW_PROCEDURAL)
float4 BA_Fragment_13_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_13_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 128u) value = float4(_GlitchParamsA.x, _GlitchParamsA.y, _GlitchParamsA.z, _GlitchParamsA.w);
  if (i == 129u) value = float4(_GlitchParamsB.x, _GlitchParamsB.y, _GlitchParamsB.z, _GlitchParamsB.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_13_CB0((uint)(128)).w * BA_Fragment_13_CB0((uint)(11)).y;
  r0.x = floor(r0.x);
  r0.x = max(0.00100000005, r0.x);
  r0.x = r0.x / BA_Fragment_13_CB0((uint)(128)).w;
  r0.y = 2.79299998 + r0.x;
  r0.zw = BA_Fragment_13_CB1((uint)(3)).yy * BA_Fragment_13_CB0((uint)(62)).xy;
  r0.zw = BA_Fragment_13_CB0((uint)(61)).xy * BA_Fragment_13_CB1((uint)(3)).xx + r0.zw;
  r0.zw = BA_Fragment_13_CB0((uint)(63)).xy * BA_Fragment_13_CB1((uint)(3)).zz + r0.zw;
  r0.zw = BA_Fragment_13_CB0((uint)(64)).xy * BA_Fragment_13_CB1((uint)(3)).ww + r0.zw;
  r0.xy = r0.xy + r0.zz;
  r0.y = r0.y + r0.w;
  r1.x = dot(r0.yy, float2(12.9898005,78.2330017));
  r0.y = dot(-r0.yy, float2(12.9898005,78.2330017));
  r0.y = sin(r0.y);
  r0.y = 43758.5469 * r0.y;
  r1.x = sin(r1.x);
  r1.x = 43758.5469 * r1.x;
  r1.x = frac(r1.x);
  r1.x = r1.x / BA_Fragment_13_CB0((uint)(128)).x;
  r1.x = v1.y / r1.x;
  r1.x = floor(r1.x);
  r2.z = r0.x + r0.w;
  r2.xy = -r2.zz;
  r0.xz = r2.xz + r1.xx;
  r0.w = dot(r2.yz, float2(12.9898005,78.2330017));
  r1.x = dot(r2.xx, float2(12.9898005,78.2330017));
  r1.x = sin(r1.x);
  r1.x = 43758.5469 * r1.x;
  r1.x = frac(r1.x);
  r1.x = -0.5 + r1.x;
  r0.w = sin(r0.w);
  r0.w = 43758.5469 * r0.w;
  r0.yw = frac(r0.yw);
  r0.x = dot(r0.xz, float2(12.9898005,78.2330017));
  r0.x = sin(r0.x);
  r0.x = 43758.5469 * r0.x;
  r0.x = frac(r0.x);
  r0.xyw = float3(-0.5,-0.5,-0.5) + r0.xyw;
  r0.x = max(0, r0.x);
  r0.x = BA_Fragment_13_CB0((uint)(128)).z * r0.x;
  r0.z = frac(BA_Fragment_13_CB0((uint)(11)).y);
  r0.z = cmp(BA_Fragment_13_CB0((uint)(129)).y >= r0.z);
  r0.z = r0.z ? 1.000000 : 0;
  r2.x = r0.x * r0.z + v1.x;
  r0.x = BA_Fragment_13_CB0((uint)(128)).z * r0.z;
  r2.y = v1.y;
  r0.zw = r0.xx * r0.ww + r2.xy;
  r0.zw = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_13_CB0((uint)(19)).x).xw;
  r1.xy = r0.xx * r1.xx + r2.xy;
  r0.xy = r0.xx * r0.yy + r2.xy;
  r0.xy = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_13_CB0((uint)(19)).x).zw;
  r1.xy = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_13_CB0((uint)(19)).x).yw;
  r0.w = r1.y + r0.w;
  o0.y = r1.x;
  r0.y = r0.w + r0.y;
  o0.xz = r0.zx;
  o0.w = 0.333333343 * r0.y;
  return;
}
#elif !defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && defined(_MX_POST_GLITCH_VERTICAL) && !defined(_USE_DRAW_PROCEDURAL)
float4 BA_Fragment_14_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 128u) value = float4(_GlitchParamsA.x, _GlitchParamsA.y, _GlitchParamsA.z, _GlitchParamsA.w);
  if (i == 129u) value = float4(_GlitchParamsB.x, _GlitchParamsB.y, _GlitchParamsB.z, _GlitchParamsB.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_14_CB0((uint)(11)).x;
  r0.y = 2;
  r0.x = dot(r0.xy, float2(12.9898005,78.2330017));
  r0.x = sin(r0.x);
  r0.x = 43758.5469 * r0.x;
  r0.x = frac(r0.x);
  r0.x = -0.5 + r0.x;
  r0.x = BA_Fragment_14_CB0((uint)(129)).x * r0.x;
  r0.y = BA_Fragment_14_CB0((uint)(128)).w * BA_Fragment_14_CB0((uint)(11)).x;
  r0.y = sin(r0.y);
  r0.y = 1 + r0.y;
  r1.x = 0.5 * r0.y;
  r1.y = 0.5 + v1.x;
  r0.y = dot(r1.xy, float2(12.9898005,78.2330017));
  r0.y = sin(r0.y);
  r0.y = 43758.5469 * r0.y;
  r0.y = frac(r0.y);
  r0.y = r0.y * 2 + -1;
  r0.z = cmp(abs(r0.y) >= BA_Fragment_14_CB0((uint)(128)).y);
  r0.z = r0.z ? 1.000000 : 0;
  r0.z = BA_Fragment_14_CB0((uint)(128)).x * r0.z;
  r0.x = r0.y * r0.z + r0.x;
  r0.y = v1.y + r0.x;
  r0.x = v1.x;
  o0.xyzw = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_14_CB0((uint)(19)).x).xyzw;
  return;
}
#elif defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && defined(_MX_POST_GLITCH_VERTICAL) && !defined(_USE_DRAW_PROCEDURAL)
float4 BA_Fragment_15_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_15_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 128u) value = float4(_GlitchParamsA.x, _GlitchParamsA.y, _GlitchParamsA.z, _GlitchParamsA.w);
  if (i == 129u) value = float4(_GlitchParamsB.x, _GlitchParamsB.y, _GlitchParamsB.z, _GlitchParamsB.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_15_CB0((uint)(128)).w * BA_Fragment_15_CB0((uint)(11)).y;
  r0.x = floor(r0.x);
  r0.x = max(0.00100000005, r0.x);
  r0.x = r0.x / BA_Fragment_15_CB0((uint)(128)).w;
  r0.y = 2.79299998 + r0.x;
  r0.zw = BA_Fragment_15_CB1((uint)(3)).yy * BA_Fragment_15_CB0((uint)(62)).xy;
  r0.zw = BA_Fragment_15_CB0((uint)(61)).xy * BA_Fragment_15_CB1((uint)(3)).xx + r0.zw;
  r0.zw = BA_Fragment_15_CB0((uint)(63)).xy * BA_Fragment_15_CB1((uint)(3)).zz + r0.zw;
  r0.zw = BA_Fragment_15_CB0((uint)(64)).xy * BA_Fragment_15_CB1((uint)(3)).ww + r0.zw;
  r0.xy = r0.xy + r0.zz;
  r0.y = r0.y + r0.w;
  r1.x = dot(r0.yy, float2(12.9898005,78.2330017));
  r0.y = dot(-r0.yy, float2(12.9898005,78.2330017));
  r0.y = sin(r0.y);
  r0.y = 43758.5469 * r0.y;
  r1.x = sin(r1.x);
  r1.x = 43758.5469 * r1.x;
  r1.x = frac(r1.x);
  r1.x = r1.x / BA_Fragment_15_CB0((uint)(128)).x;
  r1.x = v1.y / r1.x;
  r1.x = floor(r1.x);
  r2.z = r0.x + r0.w;
  r2.xy = -r2.zz;
  r0.xz = r2.xz + r1.xx;
  r0.w = dot(r2.yz, float2(12.9898005,78.2330017));
  r1.x = dot(r2.xx, float2(12.9898005,78.2330017));
  r1.x = sin(r1.x);
  r1.x = 43758.5469 * r1.x;
  r1.x = frac(r1.x);
  r1.x = -0.5 + r1.x;
  r0.w = sin(r0.w);
  r0.w = 43758.5469 * r0.w;
  r0.yw = frac(r0.yw);
  r0.x = dot(r0.xz, float2(12.9898005,78.2330017));
  r0.x = sin(r0.x);
  r0.x = 43758.5469 * r0.x;
  r0.x = frac(r0.x);
  r0.xyw = float3(-0.5,-0.5,-0.5) + r0.xyw;
  r0.x = max(0, r0.x);
  r0.x = BA_Fragment_15_CB0((uint)(128)).z * r0.x;
  r0.z = frac(BA_Fragment_15_CB0((uint)(11)).y);
  r0.z = cmp(BA_Fragment_15_CB0((uint)(129)).y >= r0.z);
  r0.z = r0.z ? 1.000000 : 0;
  r2.x = r0.x * r0.z + v1.x;
  r0.x = BA_Fragment_15_CB0((uint)(128)).z * r0.z;
  r2.y = v1.y;
  r0.zw = r0.xx * r0.ww + r2.xy;
  r0.zw = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_15_CB0((uint)(19)).x).xw;
  r1.xy = r0.xx * r1.xx + r2.xy;
  r0.xy = r0.xx * r0.yy + r2.xy;
  r0.xy = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_15_CB0((uint)(19)).x).zw;
  r1.xy = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_15_CB0((uint)(19)).x).yw;
  r0.w = r1.y + r0.w;
  o0.y = r1.x;
  r0.y = r0.w + r0.y;
  o0.xz = r0.zx;
  o0.w = 0.333333343 * r0.y;
  return;
}
#elif !defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && !defined(_MX_POST_GLITCH_VERTICAL) && defined(_USE_DRAW_PROCEDURAL)
float4 BA_Fragment_16_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 128u) value = float4(_GlitchParamsA.x, _GlitchParamsA.y, _GlitchParamsA.z, _GlitchParamsA.w);
  if (i == 129u) value = float4(_GlitchParamsB.x, _GlitchParamsB.y, _GlitchParamsB.z, _GlitchParamsB.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_16_CB0((uint)(11)).x;
  r0.y = 2;
  r0.x = dot(r0.xy, float2(12.9898005,78.2330017));
  r0.x = sin(r0.x);
  r0.x = 43758.5469 * r0.x;
  r0.x = frac(r0.x);
  r0.x = -0.5 + r0.x;
  r0.x = BA_Fragment_16_CB0((uint)(129)).x * r0.x;
  r0.y = BA_Fragment_16_CB0((uint)(128)).w * BA_Fragment_16_CB0((uint)(11)).x;
  r0.y = sin(r0.y);
  r0.y = 1 + r0.y;
  r1.x = 0.5 * r0.y;
  r1.y = 0.5 + v1.y;
  r0.y = dot(r1.xy, float2(12.9898005,78.2330017));
  r0.y = sin(r0.y);
  r0.y = 43758.5469 * r0.y;
  r0.y = frac(r0.y);
  r0.y = r0.y * 2 + -1;
  r0.z = cmp(abs(r0.y) >= BA_Fragment_16_CB0((uint)(128)).y);
  r0.z = r0.z ? 1.000000 : 0;
  r0.z = BA_Fragment_16_CB0((uint)(128)).x * r0.z;
  r0.x = r0.y * r0.z + r0.x;
  r0.x = v1.x + r0.x;
  r0.y = v1.y;
  o0.xyzw = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_16_CB0((uint)(19)).x).xyzw;
  return;
}
#elif defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && !defined(_MX_POST_GLITCH_VERTICAL) && defined(_USE_DRAW_PROCEDURAL)
float4 BA_Fragment_17_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_17_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 128u) value = float4(_GlitchParamsA.x, _GlitchParamsA.y, _GlitchParamsA.z, _GlitchParamsA.w);
  if (i == 129u) value = float4(_GlitchParamsB.x, _GlitchParamsB.y, _GlitchParamsB.z, _GlitchParamsB.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_17_CB0((uint)(128)).w * BA_Fragment_17_CB0((uint)(11)).y;
  r0.x = floor(r0.x);
  r0.x = max(0.00100000005, r0.x);
  r0.x = r0.x / BA_Fragment_17_CB0((uint)(128)).w;
  r0.y = 2.79299998 + r0.x;
  r0.zw = BA_Fragment_17_CB1((uint)(3)).yy * BA_Fragment_17_CB0((uint)(62)).xy;
  r0.zw = BA_Fragment_17_CB0((uint)(61)).xy * BA_Fragment_17_CB1((uint)(3)).xx + r0.zw;
  r0.zw = BA_Fragment_17_CB0((uint)(63)).xy * BA_Fragment_17_CB1((uint)(3)).zz + r0.zw;
  r0.zw = BA_Fragment_17_CB0((uint)(64)).xy * BA_Fragment_17_CB1((uint)(3)).ww + r0.zw;
  r0.xy = r0.xy + r0.zz;
  r0.y = r0.y + r0.w;
  r1.x = dot(r0.yy, float2(12.9898005,78.2330017));
  r0.y = dot(-r0.yy, float2(12.9898005,78.2330017));
  r0.y = sin(r0.y);
  r0.y = 43758.5469 * r0.y;
  r1.x = sin(r1.x);
  r1.x = 43758.5469 * r1.x;
  r1.x = frac(r1.x);
  r1.x = r1.x / BA_Fragment_17_CB0((uint)(128)).x;
  r1.x = v1.y / r1.x;
  r1.x = floor(r1.x);
  r2.z = r0.x + r0.w;
  r2.xy = -r2.zz;
  r0.xz = r2.xz + r1.xx;
  r0.w = dot(r2.yz, float2(12.9898005,78.2330017));
  r1.x = dot(r2.xx, float2(12.9898005,78.2330017));
  r1.x = sin(r1.x);
  r1.x = 43758.5469 * r1.x;
  r1.x = frac(r1.x);
  r1.x = -0.5 + r1.x;
  r0.w = sin(r0.w);
  r0.w = 43758.5469 * r0.w;
  r0.yw = frac(r0.yw);
  r0.x = dot(r0.xz, float2(12.9898005,78.2330017));
  r0.x = sin(r0.x);
  r0.x = 43758.5469 * r0.x;
  r0.x = frac(r0.x);
  r0.xyw = float3(-0.5,-0.5,-0.5) + r0.xyw;
  r0.x = max(0, r0.x);
  r0.x = BA_Fragment_17_CB0((uint)(128)).z * r0.x;
  r0.z = frac(BA_Fragment_17_CB0((uint)(11)).y);
  r0.z = cmp(BA_Fragment_17_CB0((uint)(129)).y >= r0.z);
  r0.z = r0.z ? 1.000000 : 0;
  r2.x = r0.x * r0.z + v1.x;
  r0.x = BA_Fragment_17_CB0((uint)(128)).z * r0.z;
  r2.y = v1.y;
  r0.zw = r0.xx * r0.ww + r2.xy;
  r0.zw = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_17_CB0((uint)(19)).x).xw;
  r1.xy = r0.xx * r1.xx + r2.xy;
  r0.xy = r0.xx * r0.yy + r2.xy;
  r0.xy = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_17_CB0((uint)(19)).x).zw;
  r1.xy = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_17_CB0((uint)(19)).x).yw;
  r0.w = r1.y + r0.w;
  o0.y = r1.x;
  r0.y = r0.w + r0.y;
  o0.xz = r0.zx;
  o0.w = 0.333333343 * r0.y;
  return;
}
#elif !defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && defined(_MX_POST_GLITCH_VERTICAL) && defined(_USE_DRAW_PROCEDURAL)
float4 BA_Fragment_18_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 128u) value = float4(_GlitchParamsA.x, _GlitchParamsA.y, _GlitchParamsA.z, _GlitchParamsA.w);
  if (i == 129u) value = float4(_GlitchParamsB.x, _GlitchParamsB.y, _GlitchParamsB.z, _GlitchParamsB.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_18_CB0((uint)(11)).x;
  r0.y = 2;
  r0.x = dot(r0.xy, float2(12.9898005,78.2330017));
  r0.x = sin(r0.x);
  r0.x = 43758.5469 * r0.x;
  r0.x = frac(r0.x);
  r0.x = -0.5 + r0.x;
  r0.x = BA_Fragment_18_CB0((uint)(129)).x * r0.x;
  r0.y = BA_Fragment_18_CB0((uint)(128)).w * BA_Fragment_18_CB0((uint)(11)).x;
  r0.y = sin(r0.y);
  r0.y = 1 + r0.y;
  r1.x = 0.5 * r0.y;
  r1.y = 0.5 + v1.x;
  r0.y = dot(r1.xy, float2(12.9898005,78.2330017));
  r0.y = sin(r0.y);
  r0.y = 43758.5469 * r0.y;
  r0.y = frac(r0.y);
  r0.y = r0.y * 2 + -1;
  r0.z = cmp(abs(r0.y) >= BA_Fragment_18_CB0((uint)(128)).y);
  r0.z = r0.z ? 1.000000 : 0;
  r0.z = BA_Fragment_18_CB0((uint)(128)).x * r0.z;
  r0.x = r0.y * r0.z + r0.x;
  r0.y = v1.y + r0.x;
  r0.x = v1.x;
  o0.xyzw = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_18_CB0((uint)(19)).x).xyzw;
  return;
}
#elif defined(_MX_POST_GLITCH_CHROMATIC_ABERRATION) && defined(_MX_POST_GLITCH_VERTICAL) && defined(_USE_DRAW_PROCEDURAL)
float4 BA_Fragment_19_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_19_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 128u) value = float4(_GlitchParamsA.x, _GlitchParamsA.y, _GlitchParamsA.z, _GlitchParamsA.w);
  if (i == 129u) value = float4(_GlitchParamsB.x, _GlitchParamsB.y, _GlitchParamsB.z, _GlitchParamsB.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_19_CB0((uint)(128)).w * BA_Fragment_19_CB0((uint)(11)).y;
  r0.x = floor(r0.x);
  r0.x = max(0.00100000005, r0.x);
  r0.x = r0.x / BA_Fragment_19_CB0((uint)(128)).w;
  r0.y = 2.79299998 + r0.x;
  r0.zw = BA_Fragment_19_CB1((uint)(3)).yy * BA_Fragment_19_CB0((uint)(62)).xy;
  r0.zw = BA_Fragment_19_CB0((uint)(61)).xy * BA_Fragment_19_CB1((uint)(3)).xx + r0.zw;
  r0.zw = BA_Fragment_19_CB0((uint)(63)).xy * BA_Fragment_19_CB1((uint)(3)).zz + r0.zw;
  r0.zw = BA_Fragment_19_CB0((uint)(64)).xy * BA_Fragment_19_CB1((uint)(3)).ww + r0.zw;
  r0.xy = r0.xy + r0.zz;
  r0.y = r0.y + r0.w;
  r1.x = dot(r0.yy, float2(12.9898005,78.2330017));
  r0.y = dot(-r0.yy, float2(12.9898005,78.2330017));
  r0.y = sin(r0.y);
  r0.y = 43758.5469 * r0.y;
  r1.x = sin(r1.x);
  r1.x = 43758.5469 * r1.x;
  r1.x = frac(r1.x);
  r1.x = r1.x / BA_Fragment_19_CB0((uint)(128)).x;
  r1.x = v1.y / r1.x;
  r1.x = floor(r1.x);
  r2.z = r0.x + r0.w;
  r2.xy = -r2.zz;
  r0.xz = r2.xz + r1.xx;
  r0.w = dot(r2.yz, float2(12.9898005,78.2330017));
  r1.x = dot(r2.xx, float2(12.9898005,78.2330017));
  r1.x = sin(r1.x);
  r1.x = 43758.5469 * r1.x;
  r1.x = frac(r1.x);
  r1.x = -0.5 + r1.x;
  r0.w = sin(r0.w);
  r0.w = 43758.5469 * r0.w;
  r0.yw = frac(r0.yw);
  r0.x = dot(r0.xz, float2(12.9898005,78.2330017));
  r0.x = sin(r0.x);
  r0.x = 43758.5469 * r0.x;
  r0.x = frac(r0.x);
  r0.xyw = float3(-0.5,-0.5,-0.5) + r0.xyw;
  r0.x = max(0, r0.x);
  r0.x = BA_Fragment_19_CB0((uint)(128)).z * r0.x;
  r0.z = frac(BA_Fragment_19_CB0((uint)(11)).y);
  r0.z = cmp(BA_Fragment_19_CB0((uint)(129)).y >= r0.z);
  r0.z = r0.z ? 1.000000 : 0;
  r2.x = r0.x * r0.z + v1.x;
  r0.x = BA_Fragment_19_CB0((uint)(128)).z * r0.z;
  r2.y = v1.y;
  r0.zw = r0.xx * r0.ww + r2.xy;
  r0.zw = _SourceTex.SampleBias(sampler_SourceTex, r0.zw, BA_Fragment_19_CB0((uint)(19)).x).xw;
  r1.xy = r0.xx * r1.xx + r2.xy;
  r0.xy = r0.xx * r0.yy + r2.xy;
  r0.xy = _SourceTex.SampleBias(sampler_SourceTex, r0.xy, BA_Fragment_19_CB0((uint)(19)).x).zw;
  r1.xy = _SourceTex.SampleBias(sampler_SourceTex, r1.xy, BA_Fragment_19_CB0((uint)(19)).x).yw;
  r0.w = r1.y + r0.w;
  o0.y = r1.x;
  r0.y = r0.w + r0.y;
  o0.xz = r0.zx;
  o0.w = 0.333333343 * r0.y;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
