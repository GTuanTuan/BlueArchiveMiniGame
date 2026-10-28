// Exact names and types from the original compiled parameter metadata.
float _Custom_Data_Main_Offset_Use;
float3 _LightDirection;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Multiply;
float4 _ShadowBias;
float4 _ShadowCoordModifier;
float _Step_Custom_DataVertex_color_Use;
float _Step_Scroll_Use;
float _Step_Value;
float4 _Tex_Main_ST;
float _Vertex_Alpha_Use;
Texture2D<float4> _Tex_Main;
SamplerState sampler_Tex_Main;
#ifndef cmp
#define cmp -
#endif

#if 1
float4 BA_Vertex_5_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_5_CB0(uint i)
{
  float4 value = 0;
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  if (i == 124u) value = float4(_ShadowBias.x, _ShadowBias.y, _ShadowBias.z, _ShadowBias.w);
  if (i == 125u) value = float4(_LightDirection.x, _LightDirection.y, _LightDirection.z, 0.0);
  if (i == 127u) value = float4(_ShadowCoordModifier.x, _ShadowCoordModifier.y, _ShadowCoordModifier.z, _ShadowCoordModifier.w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD2,
  out float4 o3 : TEXCOORD3,
  out float4 o4 : TEXCOORD4)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = BA_Vertex_5_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_5_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_5_CB1((uint)(3)).xyz + r0.xyz;
  r0.xyz = BA_Vertex_5_CB0((uint)(125)).xyz * BA_Vertex_5_CB0((uint)(124)).xxx + r0.xyz;
  r1.xyz = BA_Vertex_5_CB1((uint)(1)).xyz * v1.yyy;
  r1.xyz = BA_Vertex_5_CB1((uint)(0)).xyz * v1.xxx + r1.xyz;
  r1.xyz = BA_Vertex_5_CB1((uint)(2)).xyz * v1.zzz + r1.xyz;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r0.w = saturate(dot(BA_Vertex_5_CB0((uint)(125)).xyz, r1.xyz));
  r0.w = 1 + -r0.w;
  r0.w = BA_Vertex_5_CB0((uint)(124)).y * r0.w;
  r0.xyz = r1.xyz * r0.www + r0.xyz;
  r1.xyzw = BA_Vertex_5_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_5_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_5_CB0((uint)(76)).xyzw + r0.xyzw;
  r1.xy = BA_Vertex_5_CB0((uint)(127)).yy * BA_Vertex_5_CB0((uint)(74)).xy;
  r1.xy = BA_Vertex_5_CB0((uint)(73)).xy * BA_Vertex_5_CB0((uint)(127)).xx + r1.xy;
  r1.xy = BA_Vertex_5_CB0((uint)(75)).xy * BA_Vertex_5_CB0((uint)(127)).zz + r1.xy;
  r1.xy = BA_Vertex_5_CB0((uint)(76)).xy + r1.xy;
  r1.z = saturate(BA_Vertex_5_CB0((uint)(127)).w);
  r0.xy = -r1.xy * r1.zz + r0.xy;
  r1.x = max(1, BA_Vertex_5_CB0((uint)(127)).w);
  o0.xy = r1.xx * r0.xy;
  o0.z = min(1, r0.z);
  o0.w = r0.w;
  o1.xyzw = v2.xyzw;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xy = v5.xy;
  o4.zw = float2(0,0);
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_7_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 1u) value = float4(0.0, 0.0, _Multiply, _Main_Speed_X);
  if (i == 2u) value = float4(_Main_Speed_Y, _Custom_Data_Main_Offset_Use, 0.0, _Step_Scroll_Use);
  if (i == 3u) value = float4(_Step_Value, _Step_Custom_DataVertex_color_Use, 0.0, _Vertex_Alpha_Use);
  return value;
}

float4 BA_Fragment_7_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_7_CB1((uint)(1)).w * BA_Fragment_7_CB0((uint)(11)).y;
  r0.y = BA_Fragment_7_CB1((uint)(2)).x * BA_Fragment_7_CB0((uint)(11)).y;
  r0.zw = v2.xy * BA_Fragment_7_CB1((uint)(0)).xy + BA_Fragment_7_CB1((uint)(0)).zw;
  r0.xy = r0.xy + r0.zw;
  r0.zw = cmp(float2(0,0) != BA_Fragment_7_CB1((uint)(2)).yw);
  r1.xy = r0.zz ? v3.xy : 0;
  r0.xy = r1.xy + r0.xy;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.xy).xyzw;
  r0.x = 1 + -v1.w;
  r0.yz = cmp(float2(0,0) != BA_Fragment_7_CB1((uint)(3)).wy);
  r0.x = r0.z ? r0.x : v4.x;
  r0.y = r0.y ? 1 : v1.w;
  r0.y = r0.y * r1.w;
  r0.x = r0.w ? r0.x : BA_Fragment_7_CB1((uint)(3)).x;
  r0.x = cmp(r1.y >= r0.x);
  r0.x = r0.x ? 1.000000 : 0;
  r0.x = r0.y * r0.x;
  r0.x = saturate(BA_Fragment_7_CB1((uint)(1)).z * r0.x);
  r0.x = -0.100000001 + r0.x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = float4(0,0,0,0);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
