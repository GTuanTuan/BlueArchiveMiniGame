// Exact names and types from the original compiled parameter metadata.
float _DissolveFactor;
float _DissolveLineThickness;
float _DissolveUVChannel;
float _InlineArea;
float _InlineSharpness;
float4 _LineColor;
float _RimArea;
float _RimSharpness;
float _RimStrength;
float4 _Tint;
Texture2D<float4> _InlineDissolveTex;
Texture2D<float4> _MainTex;
SamplerState sampler_InlineDissolveTex;
SamplerState sampler_MainTex;
#ifndef cmp
#define cmp -
#endif

#if 1
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
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TEXCOORD0,
  float2 v3 : TEXCOORD1,
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

  r0.xyz = BA_Vertex_11_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_11_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_11_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_11_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_11_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_11_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_11_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyz = BA_Vertex_11_CB0((uint)(16)).xyz + -r0.xyz;
  o0.xyzw = BA_Vertex_11_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xy = v2.xy;
  o1.zw = v3.xy;
  r1.x = dot(v1.xyz, BA_Vertex_11_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_11_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_11_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r1.xyz * r0.www;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o3.xyz = r0.xyz * r0.www;
  o3.w = 0;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_13_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tint.x, _Tint.y, _Tint.z, _Tint.w);
  if (i == 1u) value = float4(_LineColor.x, _LineColor.y, _LineColor.z, _LineColor.w);
  if (i == 2u) value = float4(_RimStrength, _RimArea, _RimSharpness, _InlineArea);
  if (i == 3u) value = float4(_InlineSharpness, _DissolveUVChannel, _DissolveFactor, _DissolveLineThickness);
  return value;
}

float4 BA_Fragment_13_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 1 + -BA_Fragment_13_CB1((uint)(2)).z;
  r0.x = 1 / r0.x;
  r0.y = dot(v2.xyz, v3.xyz);
  r0.z = 1 + -r0.y;
  r0.y = r0.y * BA_Fragment_13_CB1((uint)(2)).w + -BA_Fragment_13_CB1((uint)(3)).x;
  r0.z = saturate(BA_Fragment_13_CB1((uint)(2)).y * r0.z);
  r0.z = -BA_Fragment_13_CB1((uint)(2)).z + r0.z;
  r0.x = saturate(r0.z * r0.x);
  r0.z = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.z * r0.x;
  r1.xyzw = _MainTex.SampleBias(sampler_MainTex, v1.xy, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  r1.xyz = BA_Fragment_13_CB1((uint)(0)).xyz * r1.xyz;
  r0.xzw = r0.xxx * BA_Fragment_13_CB1((uint)(2)).xxx + r1.xyz;
  r1.x = 1 + -BA_Fragment_13_CB1((uint)(3)).x;
  r1.x = 1 / r1.x;
  r0.y = saturate(r1.x * r0.y);
  r1.x = r0.y * -2 + 3;
  r0.y = r0.y * r0.y;
  r0.y = r1.x * r0.y;
  r2.xyzw = _InlineDissolveTex.SampleBias(sampler_InlineDissolveTex, v1.xy, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  r0.y = r0.y * r2.y + r2.x;
  r1.x = cmp(BA_Fragment_13_CB1((uint)(3)).y == 0.000000);
  r1.xy = r1.xx ? v1.xy : v1.zw;
  r2.xyzw = _InlineDissolveTex.SampleBias(sampler_InlineDissolveTex, r1.xy, BA_Fragment_13_CB0((uint)(19)).x).xyzw;
  r1.x = cmp(r2.z >= BA_Fragment_13_CB1((uint)(3)).z);
  r1.x = r1.x ? -1 : -0;
  r1.y = BA_Fragment_13_CB1((uint)(3)).z + -BA_Fragment_13_CB1((uint)(3)).w;
  r1.y = cmp(r2.z >= r1.y);
  r1.y = r1.y ? 1.000000 : 0;
  r1.x = r1.y + r1.x;
  r0.y = saturate(r1.x + r0.y);
  r1.x = 1 + -r0.y;
  r2.xyz = BA_Fragment_13_CB1((uint)(1)).xyz * r0.yyy;
  r0.y = saturate(BA_Fragment_13_CB1((uint)(0)).w * r1.w + r0.y);
  o0.w = r0.y * r1.y;
  o0.xyz = r0.xzw * r1.xxx + r2.xyz;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
