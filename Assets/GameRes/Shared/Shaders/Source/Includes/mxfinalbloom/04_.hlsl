// Exact names and types from the original compiled parameter metadata.
float4 _BloomTex_TexelSize;
float3 _Bloom_Color;
float2 _Bloom_Settings;
float4 _UVTransform;
Texture2D<float4> _BloomTex;
Texture2D<float4> _MainTex;
SamplerState sampler_BloomTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if 1
float4 BA_Vertex_7_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 132u) value = float4(_UVTransform.x, _UVTransform.y, _UVTransform.z, _UVTransform.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float3 v0 : POSITION0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float2 p1 : TEXCOORD1)
{
  o0 = 0;
  o1 = 0;
  p1 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.xy = v0.xy;
  o0.zw = float2(0,1);
  r0.xyzw = float4(1,1,1,1) + v0.xyxy;
  r0.xyzw = BA_Vertex_7_CB0((uint)(132)).xyxy * r0.xyzw;
  o1.xy = (r0.xyzw * float4(0.5,0.5,0.5,0.5) + BA_Vertex_7_CB0((uint)(132)).zwzw).xy;
  p1 = o1; // Original DXBC packs TEXCOORD0.xy and TEXCOORD1.zw in the same register.
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_8_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 129u) value = float4(_BloomTex_TexelSize.x, _BloomTex_TexelSize.y, _BloomTex_TexelSize.z, _BloomTex_TexelSize.w);
  if (i == 130u) value = float4(_Bloom_Settings.x, _Bloom_Settings.y, 0.0, 0.0);
  if (i == 131u) value = float4(_Bloom_Color.x, _Bloom_Color.y, _Bloom_Color.z, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = float4(-1,-1,1,1) * BA_Fragment_8_CB0((uint)(129)).xyxy;
  r1.x = 0.5 * BA_Fragment_8_CB0((uint)(130)).x;
  r2.xyzw = r0.xyzy * r1.xxxx + v1.xyxy;
  r0.xyzw = r0.xwzw * r1.xxxx + v1.xyxy;
  r1.xyzw = _BloomTex.SampleBias(sampler_BloomTex, r2.zw, BA_Fragment_8_CB0((uint)(19)).x).xyzw;
  r2.xyzw = _BloomTex.SampleBias(sampler_BloomTex, r2.xy, BA_Fragment_8_CB0((uint)(19)).x).xyzw;
  r1.xyz = float3(0.25,0.25,0.25) * r1.xyz;
  r1.xyz = r2.xyz * float3(0.25,0.25,0.25) + r1.xyz;
  r2.xyzw = _BloomTex.SampleBias(sampler_BloomTex, r0.xy, BA_Fragment_8_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _BloomTex.SampleBias(sampler_BloomTex, r0.zw, BA_Fragment_8_CB0((uint)(19)).x).xyzw;
  r1.xyz = r2.xyz * float3(0.25,0.25,0.25) + r1.xyz;
  r0.xyz = r0.xyz * float3(0.25,0.25,0.25) + r1.xyz;
  r0.xyz = BA_Fragment_8_CB0((uint)(130)).yyy * r0.xyz;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, w1.xy, BA_Fragment_8_CB0((uint)(19)).x).xyzw;
  o0.xyz = r0.xyz * BA_Fragment_8_CB0((uint)(131)).xyz + r1.xyz;
  o0.w = r1.w;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
