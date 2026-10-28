// Exact names and types from the original compiled parameter metadata.
float4 _MainTex_TexelSize;
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
float4 BA_Fragment_5_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 124u) value = float4(_MainTex_TexelSize.x, _MainTex_TexelSize.y, _MainTex_TexelSize.z, _MainTex_TexelSize.w);
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

  r0.xyzw = BA_Fragment_5_CB0((uint)(124)).xyxy * float4(-1,-1,1,-1) + v1.xyxy;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.zw, BA_Fragment_5_CB0((uint)(19)).x).xyzw;
  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, r0.xy, BA_Fragment_5_CB0((uint)(19)).x).xyzw;
  r1.xyzw = float4(0.25,0.25,0.25,0.25) * r1.xyzw;
  r0.xyzw = r0.xyzw * float4(0.25,0.25,0.25,0.25) + r1.xyzw;
  r1.xyzw = BA_Fragment_5_CB0((uint)(124)).xyxy * float4(-1,1,1,1) + v1.xyxy;
  r2.xyzw = _MainTex.SampleBias(sampler_MainTex, r1.xy, BA_Fragment_5_CB0((uint)(19)).x).xyzw;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, r1.zw, BA_Fragment_5_CB0((uint)(19)).x).xyzw;
  r0.xyzw = r2.xyzw * float4(0.25,0.25,0.25,0.25) + r0.xyzw;
  o0.xyzw = r1.xyzw * float4(0.25,0.25,0.25,0.25) + r0.xyzw;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
