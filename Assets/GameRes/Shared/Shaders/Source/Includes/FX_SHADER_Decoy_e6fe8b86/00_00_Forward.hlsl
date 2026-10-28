// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float4 _Color_Inside;
float _Disappear;
float4 _MainTexture_ST;
float _NoiseScale;
float _RampPow;
Texture2D<float4> _MainTexture;
SamplerState sampler_MainTexture;
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
  if (i == 4u) value = float4(transpose(unity_WorldToObject)[0].x, transpose(unity_WorldToObject)[0].y, transpose(unity_WorldToObject)[0].z, transpose(unity_WorldToObject)[0].w);
  if (i == 5u) value = float4(transpose(unity_WorldToObject)[1].x, transpose(unity_WorldToObject)[1].y, transpose(unity_WorldToObject)[1].z, transpose(unity_WorldToObject)[1].w);
  if (i == 6u) value = float4(transpose(unity_WorldToObject)[2].x, transpose(unity_WorldToObject)[2].y, transpose(unity_WorldToObject)[2].z, transpose(unity_WorldToObject)[2].w);
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
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_1_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_1_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_1_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_1_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_1_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_1_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o1.xyz = r0.xyz;
  o0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw + r1.xyzw;
  r0.x = dot(v1.xyz, BA_Vertex_1_CB1((uint)(4)).xyz);
  r0.y = dot(v1.xyz, BA_Vertex_1_CB1((uint)(5)).xyz);
  r0.z = dot(v1.xyz, BA_Vertex_1_CB1((uint)(6)).xyz);
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o2.xyz = r0.xyz * r0.www;
  o2.w = 0;
  o3.xy = v2.xy;
  o3.zw = float2(0,0);
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_3_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Color_Inside.x, _Color_Inside.y, _Color_Inside.z, _Color_Inside.w);
  if (i == 1u) value = float4(_MainTexture_ST.x, _MainTexture_ST.y, _MainTexture_ST.z, _MainTexture_ST.w);
  if (i == 2u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 3u) value = float4(_RampPow, _NoiseScale, _Disappear, 0.0);
  return value;
}

float4 BA_Fragment_3_CB0(uint i)
{
  float4 value = 0;
  if (i == 6u) value = float4(_MainLightColor.x, _MainLightColor.y, _MainLightColor.z, _MainLightColor.w);
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  uint v4 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = BA_Fragment_3_CB1((uint)(3)).yy * v3.xy;
  r0.x = dot(r0.xy, float2(0.366025418,0.366025418));
  r0.xy = v3.xy * BA_Fragment_3_CB1((uint)(3)).yy + r0.xx;
  r0.xy = floor(r0.xy);
  r0.zw = float2(0.00346020772,0.00346020772) * r0.xy;
  r0.zw = floor(r0.zw);
  r0.zw = -r0.zw * float2(289,289) + r0.xy;
  r1.xz = float2(0,1);
  r2.xy = v3.xy * BA_Fragment_3_CB1((uint)(3)).yy + -r0.xy;
  r0.x = dot(r0.xy, float2(0.211324871,0.211324871));
  r0.xy = r2.xy + r0.xx;
  r1.w = cmp(r0.y < r0.x);
  r2.xyzw = r1.wwww ? float4(1,0,-1,-0) : float4(0,1,-0,-1);
  r1.y = r2.y;
  r1.xyz = r1.xyz + r0.www;
  r3.xyz = r1.xyz * float3(34,34,34) + float3(1,1,1);
  r1.xyz = r3.xyz * r1.xyz;
  r3.xyz = float3(0.00346020772,0.00346020772,0.00346020772) * r1.xyz;
  r3.xyz = floor(r3.xyz);
  r1.xyz = -r3.xyz * float3(289,289,289) + r1.xyz;
  r1.xyz = r1.xyz + r0.zzz;
  r3.xz = float2(0,1);
  r3.y = r2.x;
  r1.xyz = r3.xyz + r1.xyz;
  r3.xyz = r1.xyz * float3(34,34,34) + float3(1,1,1);
  r1.xyz = r3.xyz * r1.xyz;
  r3.xyz = float3(0.00346020772,0.00346020772,0.00346020772) * r1.xyz;
  r3.xyz = floor(r3.xyz);
  r1.xyz = -r3.xyz * float3(289,289,289) + r1.xyz;
  r1.xyz = float3(0.024390243,0.024390243,0.024390243) * r1.xyz;
  r1.xyz = frac(r1.xyz);
  r3.xyz = r1.xyz * float3(2,2,2) + float3(-0.5,-0.5,-0.5);
  r1.xyz = r1.xyz * float3(2,2,2) + float3(-1,-1,-1);
  r3.xyz = floor(r3.xyz);
  r3.xyz = -r3.xyz + r1.xyz;
  r1.xyz = float3(-0.5,-0.5,-0.5) + abs(r1.xyz);
  r4.xyz = r1.xyz * r1.xyz;
  r4.xyz = r3.xyz * r3.xyz + r4.xyz;
  r4.xyz = -r4.xyz * float3(0.853734732,0.853734732,0.853734732) + float3(1.79284286,1.79284286,1.79284286);
  r5.x = dot(r0.xy, r0.xy);
  r6.xyzw = float4(0.211324871,0.211324871,-0.577350259,-0.577350259) + r0.xyxy;
  r6.xy = r6.xy + r2.zw;
  r5.y = dot(r6.xy, r6.xy);
  r5.z = dot(r6.zw, r6.zw);
  r2.xyz = float3(0.5,0.5,0.5) + -r5.xyz;
  r2.xyz = max(float3(0,0,0), r2.xyz);
  r2.xyz = r2.xyz * r2.xyz;
  r2.xyz = r2.xyz * r2.xyz;
  r2.xyz = r2.xyz * r4.xyz;
  r0.y = r1.x * r0.y;
  r0.zw = r6.yw * r1.yz;
  r1.yz = r3.yz * r6.xz + r0.zw;
  r1.x = r3.x * r0.x + r0.y;
  r0.x = dot(r2.xyz, r1.xyz);
  r0.x = -r0.x * 130 + BA_Fragment_3_CB1((uint)(3)).z;
  r0.x = 1 + r0.x;
  r0.x = -r0.x * BA_Fragment_3_CB1((uint)(3)).z + 1;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyz = BA_Fragment_3_CB0((uint)(16)).xyz + -v1.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.x = dot(r0.xyz, v2.xyz);
  r0.x = saturate(BA_Fragment_3_CB1((uint)(3)).x * r0.x);
  r0.y = 1;
  r0.xyzw = _MainTexture.Sample(sampler_MainTexture, r0.xy).xyzw;
  r1.xy = v3.xy * BA_Fragment_3_CB1((uint)(1)).xy + BA_Fragment_3_CB1((uint)(1)).zw;
  r1.xyzw = _MainTexture.Sample(sampler_MainTexture, r1.xy).xyzw;
  r1.xyz = -BA_Fragment_3_CB1((uint)(0)).xyz + r1.xyz;
  r0.w = v4.x ? 1 : 0.5;
  r1.xyz = r0.www * r1.xyz + BA_Fragment_3_CB1((uint)(0)).xyz;
  r0.xyz = r1.xyz * r0.xyz;
  r0.xyz = BA_Fragment_3_CB0((uint)(6)).xyz * r0.xyz;
  o0.xyz = BA_Fragment_3_CB1((uint)(2)).xyz * r0.xyz;
  o0.w = 1;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
