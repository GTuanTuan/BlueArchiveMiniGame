// Exact names and types from the original compiled parameter metadata.
float _Glitch_value;
float _Jitter;
float _Shaking;
float _Speed_Value;
float _x;
float _y;
Texture2D<float4> _MainTex;
Texture2D<float4> _NoiseTex;
SamplerState sampler_MainTex;
SamplerState sampler_NoiseTex;
#ifndef cmp
#define cmp -
#endif

#if 1
float4 BA_Vertex_1_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_1_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_1_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_1_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_1_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_1_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_1_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_1_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_1_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw + r0.xyzw;
  o1.xy = v2.xy;
  o1.zw = float2(0,0);
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_3_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(0.0, _Speed_Value, _Shaking, _Jitter);
  if (i == 1u) value = float4(_Glitch_value, _x, _y, 0.0);
  return value;
}

float4 BA_Fragment_3_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD3,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = float2(2,3) * BA_Fragment_3_CB1((uint)(1)).yz;
  r0.zw = float2(1,1) / r0.xy;
  r0.zw = r0.zw * float2(0.5,0.5) + v1.xy;
  r0.zw = r0.zw * r0.xy;
  r0.zw = floor(r0.zw);
  r0.xy = r0.zw / r0.xy;
  r0.z = BA_Fragment_3_CB1((uint)(0)).y * BA_Fragment_3_CB0((uint)(11)).y;
  r0.zw = float2(2,1.5) * r0.zz;
  r0.zw = floor(r0.zw);
  r0.xy = -r0.zw * float2(0.200000003,0.200000003) + r0.xy;
  r1.xyzw = _NoiseTex.Sample(sampler_NoiseTex, r0.xy).xyzw;
  r0.xy = BA_Fragment_3_CB1((uint)(1)).yz * v1.xy;
  r0.xy = floor(r0.xy);
  r0.xy = r0.xy / BA_Fragment_3_CB1((uint)(1)).yz;
  r0.xy = r0.zw * float2(0.200000003,0.200000003) + r0.xy;
  r0.zw = r0.zw / BA_Fragment_3_CB1((uint)(0)).zz;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, r0.xy).xyzw;
  r0.x = max(r2.x, r1.x);
  r0.x = 0.330000013 + r0.x;
  r0.x = floor(r0.x);
  r0.x = 0.400000006 + r0.x;
  r1.xy = float2(0.435000002,0.136999995) + r0.zw;
  r2.xyzw = _NoiseTex.Sample(sampler_NoiseTex, r0.zw).xyzw;
  r0.y = -0.5 + r2.x;
  r1.xyzw = _NoiseTex.Sample(sampler_NoiseTex, r1.xy).xyzw;
  r0.z = BA_Fragment_3_CB1((uint)(0)).w + r1.x;
  r0.y = r1.x * r0.y;
  r0.z = floor(r0.z);
  r0.xw = r0.xy * r0.zz;
  r0.y = r0.y * r0.z + -0.200000003;
  r0.y = BA_Fragment_3_CB1((uint)(1)).x * r0.y;
  r1.z = r0.x * r0.y;
  r0.y = BA_Fragment_3_CB1((uint)(1)).x * r0.w;
  r1.x = r0.y * r0.x;
  r1.yw = float2(0,0);
  r0.xyzw = v1.xyxy + r1.xyzw;
  r1.xyzw = _MainTex.Sample(sampler_MainTex, r0.xy).xyzw;
  r0.xyzw = _MainTex.Sample(sampler_MainTex, r0.zw).xyzw;
  o0.z = r0.z;
  o0.x = r1.x;
  r0.xyzw = _MainTex.Sample(sampler_MainTex, v1.xy).xyzw;
  o0.y = r0.y;
  o0.w = 1;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
