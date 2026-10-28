// Exact names and types from the original compiled parameter metadata.
float _DitherThreshold;
float3 _LightDirection;
float4 _ShadowBias;
float4 _ShadowCoordModifier;
#ifndef cmp
#define cmp -
#endif

#if !defined(_DITHER_HORIZONTAL_LINES)
float4 BA_Vertex_133_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_133_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(0.0, _LightDirection.x, _LightDirection.y, _LightDirection.z);
  if (i == 126u) value = float4(_ShadowBias.x, _ShadowBias.y, _ShadowBias.z, _ShadowBias.w);
  if (i == 127u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  out float4 o0 : SV_POSITION0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_133_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_133_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_133_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_133_CB1((uint)(3)).xyz + r0.xyz;
  r0.xyz = BA_Vertex_133_CB0((uint)(124)).yzw * BA_Vertex_133_CB0((uint)(126)).xxx + r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_133_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_133_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_133_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = saturate(dot(BA_Vertex_133_CB0((uint)(124)).yzw, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_133_CB0((uint)(126)).y * r0.w;
  r0.xyz = r1.xyz * r0.www + r0.xyz;
  r1.xyzw = BA_Vertex_133_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_133_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_133_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_133_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.xy = BA_Vertex_133_CB0((uint)(127)).yy * BA_Vertex_133_CB0((uint)(74)).xy;
  r1.xy = BA_Vertex_133_CB0((uint)(73)).xy * BA_Vertex_133_CB0((uint)(127)).xx + r1.xy;
  r1.xy = BA_Vertex_133_CB0((uint)(75)).xy * BA_Vertex_133_CB0((uint)(127)).zz + r1.xy;
  r1.xy = BA_Vertex_133_CB0((uint)(76)).xy + r1.xy;
  r1.z = saturate(BA_Vertex_133_CB0((uint)(127)).w);
  r0.xy = -r1.xy * r1.zz + r0.xy;
  r1.x = max(1, BA_Vertex_133_CB0((uint)(127)).w);
  o0.xy = r1.xx * r0.xy;
  o0.z = min(1, r0.z);
  o0.w = r0.w;
  return;
}
#elif defined(_DITHER_HORIZONTAL_LINES)
float4 BA_Vertex_134_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_134_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(0.0, _LightDirection.x, _LightDirection.y, _LightDirection.z);
  if (i == 126u) value = float4(_ShadowBias.x, _ShadowBias.y, _ShadowBias.z, _ShadowBias.w);
  if (i == 127u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  out float o0 : TEXCOORD1,
  out float4 o1 : SV_POSITION0)
{
  o0 = 0;
  o1 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_134_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_134_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_134_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_134_CB1((uint)(3)).xyz + r0.xyz;
  r0.xyz = BA_Vertex_134_CB0((uint)(124)).yzw * BA_Vertex_134_CB0((uint)(126)).xxx + r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_134_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_134_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_134_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = saturate(dot(BA_Vertex_134_CB0((uint)(124)).yzw, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_134_CB0((uint)(126)).y * r0.w;
  r0.xyz = r1.xyz * r0.www + r0.xyz;
  r1.xyzw = BA_Vertex_134_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_134_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_134_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_134_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.xy = BA_Vertex_134_CB0((uint)(127)).yy * BA_Vertex_134_CB0((uint)(74)).xy;
  r1.xy = BA_Vertex_134_CB0((uint)(73)).xy * BA_Vertex_134_CB0((uint)(127)).xx + r1.xy;
  r1.xy = BA_Vertex_134_CB0((uint)(75)).xy * BA_Vertex_134_CB0((uint)(127)).zz + r1.xy;
  r1.xy = BA_Vertex_134_CB0((uint)(76)).xy + r1.xy;
  r1.z = saturate(BA_Vertex_134_CB0((uint)(127)).w);
  r0.xy = -r1.xy * r1.zz + r0.xy;
  r1.x = max(1, BA_Vertex_134_CB0((uint)(127)).w);
  r0.xy = r1.xx * r0.xy;
  r1.x = BA_Vertex_134_CB0((uint)(17)).x * r0.y;
  o1.xyw = r0.xyw;
  r0.x = 0.5 * r1.x;
  r0.x = r0.x / r0.w;
  o0.x = 0.5 + r0.x;
  o1.z = min(1, r0.z);
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if !defined(_DITHER_HORIZONTAL_LINES)

void BA_Frag(
  float4 v0 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = float4(0,0,0,0);
  return;
}
#elif defined(_DITHER_HORIZONTAL_LINES)
float4 BA_Fragment_137_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 124u) value = float4(_DitherThreshold, 0.0, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float v0 : TEXCOORD1,
  float4 v1 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 333.333344 * v0.x;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 0.00300000003 * r0.x;
  r0.x = -BA_Fragment_137_CB0((uint)(124)).x * 0.00300000003 + abs(r0.x);
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = float4(0,0,0,0);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
