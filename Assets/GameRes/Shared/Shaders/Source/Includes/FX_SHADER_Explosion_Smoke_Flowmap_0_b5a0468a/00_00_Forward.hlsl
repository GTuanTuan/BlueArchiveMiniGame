// Exact names and types from the original compiled parameter metadata.
float _BCustom_Data_Use;
float _BDisappear_Offset;
float _Color_Custom_Data_Use;
float _FlowSpeed;
float4 _FlowTexRGB_ST;
float _Flowspeed_Data_Use;
float4 _GColor;
float _GColor_Sharpness;
float _GCustom_Data_Use;
float _GDisappear_Offset;
float _Mutiply;
float4 _RColor;
float _Shadow_Color_Multiply;
float _Shadow_Value;
float _Shadow_Value_Data_Use;
Texture2D<float4> _FlowTexRGB;
Texture2D<float4> _MainTexRGBA;
SamplerState sampler_FlowTexRGB;
SamplerState sampler_MainTexRGBA;
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
  float4 v3 : TEXCOORD1,
  float4 v4 : COLOR0,
  float4 v5 : TEXCOORD2,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD3,
  out float4 o2 : TEXCOORD4,
  out float4 o3 : COLOR0,
  out float4 o4 : TEXCOORD5)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;

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
  o1.xyzw = v2.xyzw;
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_3_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_FlowTexRGB_ST.x, _FlowTexRGB_ST.y, _FlowTexRGB_ST.z, _FlowTexRGB_ST.w);
  if (i == 1u) value = float4(_GColor.x, _GColor.y, _GColor.z, _GColor.w);
  if (i == 2u) value = float4(_RColor.x, _RColor.y, _RColor.z, _RColor.w);
  if (i == 3u) value = float4(0.0, _GDisappear_Offset, _GCustom_Data_Use, _Color_Custom_Data_Use);
  if (i == 4u) value = float4(_Shadow_Value, _Shadow_Value_Data_Use, _BDisappear_Offset, _BCustom_Data_Use);
  if (i == 5u) value = float4(_Shadow_Color_Multiply, _FlowSpeed, _Flowspeed_Data_Use, 0.0);
  if (i == 6u) value = float4(_GColor_Sharpness, _Mutiply, 0.0, 0.0);
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
  float4 v2 : TEXCOORD4,
  float4 v3 : COLOR0,
  float4 v4 : TEXCOORD5,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * BA_Fragment_3_CB1((uint)(0)).xy + BA_Fragment_3_CB1((uint)(0)).zw;
  r0.xyzw = _FlowTexRGB.Sample(sampler_FlowTexRGB, r0.xy).xyzw;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.z = cmp(0 != BA_Fragment_3_CB1((uint)(5)).z);
  r0.z = r0.z ? v2.y : BA_Fragment_3_CB1((uint)(5)).y;
  r0.xy = r0.xy * r0.zz;
  r0.z = 0.5 * BA_Fragment_3_CB0((uint)(11)).y;
  r0.z = frac(r0.z);
  r0.zw = -r0.xy * r0.zz + v1.xy;
  r1.xyzw = _MainTexRGBA.Sample(sampler_MainTexRGBA, r0.zw).xyzw;
  r0.z = BA_Fragment_3_CB0((uint)(11)).y * 0.5 + 0.5;
  r0.z = frac(r0.z);
  r0.xy = -r0.xy * r0.zz + v1.xy;
  r0.z = 0.5 + -r0.z;
  r0.z = r0.z + r0.z;
  r2.xyzw = _MainTexRGBA.Sample(sampler_MainTexRGBA, r0.xy).xyzw;
  r1.xyzw = -r2.xyzw + r1.xyzw;
  r0.xyzw = abs(r0.zzzz) * r1.xyzw + r2.xyzw;
  r1.xy = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(4)).wy);
  r1.xy = r1.xy ? v2.wx : BA_Fragment_3_CB1((uint)(4)).zx;
  r1.y = r1.y + r0.z;
  r1.y = cmp(r1.y >= r1.x);
  r0.z = cmp(r1.x >= r0.z);
  r0.z = r0.z ? 0 : 1;
  r0.z = r0.w * r0.z;
  r0.z = v3.w * r0.z;
  r0.z = BA_Fragment_3_CB1((uint)(2)).w * r0.z;
  o0.w = BA_Fragment_3_CB1((uint)(6)).y * r0.z;
  r0.z = r1.y ? 0 : 1;
  r0.w = BA_Fragment_3_CB1((uint)(5)).x + -r0.x;
  r0.x = r0.z * r0.w + r0.x;
  r0.xzw = v3.xyz * r0.xxx;
  r1.xyz = BA_Fragment_3_CB1((uint)(2)).xyz * r0.xzw;
  r2.xy = cmp(float2(0,0) != BA_Fragment_3_CB1((uint)(3)).wz);
  r2.xzw = r2.xxx ? v4.xyz : BA_Fragment_3_CB1((uint)(1)).xyz;
  r1.w = r2.y ? v2.z : BA_Fragment_3_CB1((uint)(3)).y;
  r0.y = -r1.w + r0.y;
  r0.y = saturate(BA_Fragment_3_CB1((uint)(6)).x * r0.y);
  r0.xzw = -r0.xzw * BA_Fragment_3_CB1((uint)(2)).xyz + r2.xzw;
  r0.xyz = r0.yyy * r0.xzw + r1.xyz;
  o0.xyz = BA_Fragment_3_CB1((uint)(6)).yyy * r0.xyz;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
