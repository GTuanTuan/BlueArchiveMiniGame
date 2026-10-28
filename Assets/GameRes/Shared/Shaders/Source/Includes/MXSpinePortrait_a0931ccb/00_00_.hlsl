// Exact names and types from the original compiled parameter metadata.
float4 _Black;
float4 _Color;
float4 _ColorFilterB;
float4 _ColorFilterG;
float4 _ColorFilterR;
float _ColorIntensity;
float4 _ThresholdParams;
Texture2D<float4> _MainTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if !defined(_COLOR_FILTER_MODE)
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float4 v2 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float4 o2 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2,r3;
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
  r0.xyz = v2.xyz / v2.www;
  r1.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + r0.xyz;
  r1.xyz = float3(0.947867334,0.947867334,0.947867334) * r1.xyz;
  r1.xyz = log2(abs(r1.xyz));
  r1.xyz = float3(2.4000001,2.4000001,2.4000001) * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * r0.xyz;
  r0.xyz = cmp(float3(0.0404499993,0.0404499993,0.0404499993) >= r0.xyz);
  r0.xyz = r0.xyz ? r2.xyz : r1.xyz;
  r0.xyz = v2.www * r0.xyz;
  r1.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + v2.xyz;
  r1.xyz = float3(0.947867334,0.947867334,0.947867334) * r1.xyz;
  r1.xyz = log2(abs(r1.xyz));
  r1.xyz = float3(2.4000001,2.4000001,2.4000001) * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * v2.xyz;
  r3.xyz = cmp(float3(0.0404499993,0.0404499993,0.0404499993) >= v2.xyz);
  r1.xyz = r3.xyz ? r2.xyz : r1.xyz;
  r2.x = cmp(v2.w == 0.000000);
  r1.w = 0;
  r0.w = v2.w;
  o2.xyzw = r2.xxxx ? r1.xyzw : r0.xyzw;
  return;
}
#elif defined(_COLOR_FILTER_MODE)
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
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float2 v1 : TEXCOORD0,
  float4 v2 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0,
  out float4 o2 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;

  float4 r0,r1,r2,r3;
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
  r0.xyz = v2.xyz / v2.www;
  r1.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + r0.xyz;
  r1.xyz = float3(0.947867334,0.947867334,0.947867334) * r1.xyz;
  r1.xyz = log2(abs(r1.xyz));
  r1.xyz = float3(2.4000001,2.4000001,2.4000001) * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * r0.xyz;
  r0.xyz = cmp(float3(0.0404499993,0.0404499993,0.0404499993) >= r0.xyz);
  r0.xyz = r0.xyz ? r2.xyz : r1.xyz;
  r0.xyz = v2.www * r0.xyz;
  r1.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + v2.xyz;
  r1.xyz = float3(0.947867334,0.947867334,0.947867334) * r1.xyz;
  r1.xyz = log2(abs(r1.xyz));
  r1.xyz = float3(2.4000001,2.4000001,2.4000001) * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * v2.xyz;
  r3.xyz = cmp(float3(0.0404499993,0.0404499993,0.0404499993) >= v2.xyz);
  r1.xyz = r3.xyz ? r2.xyz : r1.xyz;
  r2.x = cmp(v2.w == 0.000000);
  r1.w = 0;
  r0.w = v2.w;
  o2.xyzw = r2.xxxx ? r1.xyzw : r0.xyzw;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(_COLOR_FILTER_MODE)
float4 BA_Fragment_6_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Black.x, _Black.y, _Black.z, 0.0);
  return value;
}

float4 BA_Fragment_6_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float4 v2 : COLOR0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_6_CB0((uint)(19)).x).xyzw;
  r1.xyz = float3(1,1,1) + -r0.xyz;
  r2.xyzw = BA_Fragment_6_CB1((uint)(0)).xyzw * r0.xyzw;
  r0.x = v2.w * r0.w;
  o0.w = BA_Fragment_6_CB1((uint)(0)).w * r0.x;
  r0.xyz = r1.xyz * BA_Fragment_6_CB1((uint)(1)).xyz + r2.xyz;
  r0.xyz = v2.xyz * r0.xyz;
  o0.xyz = r0.xyz * r2.www;
  return;
}
#elif defined(_COLOR_FILTER_MODE)
float4 BA_Fragment_7_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 1u) value = float4(_Black.x, _Black.y, _Black.z, 0.0);
  return value;
}

float4 BA_Fragment_7_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 124u) value = float4(_ColorFilterR.x, _ColorFilterR.y, _ColorFilterR.z, _ColorFilterR.w);
  if (i == 125u) value = float4(_ColorFilterG.x, _ColorFilterG.y, _ColorFilterG.z, _ColorFilterG.w);
  if (i == 126u) value = float4(_ColorFilterB.x, _ColorFilterB.y, _ColorFilterB.z, _ColorFilterB.w);
  if (i == 127u) value = float4(_ColorIntensity, 0.0, 0.0, 0.0);
  if (i == 128u) value = float4(_ThresholdParams.x, _ThresholdParams.y, _ThresholdParams.z, _ThresholdParams.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float4 v2 : COLOR0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_7_CB0((uint)(19)).x).xyzw;
  r1.xyz = float3(1,1,1) + -r0.xyz;
  r2.xyzw = BA_Fragment_7_CB1((uint)(0)).xyzw * r0.xyzw;
  r0.x = v2.w * r0.w;
  o0.w = BA_Fragment_7_CB1((uint)(0)).w * r0.x;
  r0.xyz = r1.xyz * BA_Fragment_7_CB1((uint)(1)).xyz + r2.xyz;
  r0.xyz = v2.xyz * r0.xyz;
  r0.xyz = r0.xyz * r2.www;
  r1.y = dot(BA_Fragment_7_CB0((uint)(125)).xyz, r0.xyz);
  r1.z = dot(BA_Fragment_7_CB0((uint)(126)).xyz, r0.xyz);
  r1.x = dot(BA_Fragment_7_CB0((uint)(124)).xyz, r0.xyz);
  r0.xyz = BA_Fragment_7_CB0((uint)(127)).xxx * r1.xyz;
  r0.w = -BA_Fragment_7_CB0((uint)(128)).z + r1.x;
  r1.x = BA_Fragment_7_CB0((uint)(128)).y * BA_Fragment_7_CB0((uint)(128)).x;
  r0.xyz = r1.xxx * -r0.xyz + r0.xyz;
  r1.xyz = float3(1,1,1) + -r0.xyz;
  r1.w = BA_Fragment_7_CB0((uint)(128)).w + -BA_Fragment_7_CB0((uint)(128)).z;
  r0.w = r0.w / r1.w;
  r0.w = saturate(BA_Fragment_7_CB0((uint)(128)).x * r0.w);
  o0.xyz = r0.www * r1.xyz + r0.xyz;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
