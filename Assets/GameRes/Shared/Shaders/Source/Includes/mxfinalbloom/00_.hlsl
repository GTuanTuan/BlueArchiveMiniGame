// Exact names and types from the original compiled parameter metadata.
Texture2D<float4> _MainTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if 1

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
  o1.xy = (r0.xyzw * float4(0.5,-0.5,0.5,-0.5) + float4(0,1,0,1)).xy;
  p1 = o1; // Original DXBC packs TEXCOORD0.xy and TEXCOORD1.zw in the same register.
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_3_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  o0.xyzw = _MainTex.SampleBias(sampler_MainTex, w1.xy, BA_Fragment_3_CB0((uint)(19)).x).xyzw;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
