// Exact names and types from the original compiled parameter metadata.
float _AlphaClip_Value;
float _BColor_Sharpness;
float _BCustom_Data_Use;
float _BDisappear_Offset;
float _Custom_Data_Distort_Power_Offset_Use;
float _Custom_Data_MainRB_Offset_Use;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Distortion_Power_X;
float _Distortion_Power_Y;
float3 _LightDirection;
float4 _MainColor;
float _Main_Speed_X;
float _Main_Speed_Y;
float4 _Main_TexRGBA_ST;
float _Mutiply;
float4 _ShadowBias;
float4 _ShadowCoordModifier;
float4 _Tex_Distort_ST;
float4 _UV_Add_TilingOffset;
float _UV_Add_Use;
Texture2D<float4> _Main_TexRGBA;
Texture2D<float4> _Tex_Distort;
SamplerState sampler_Main_TexRGBA;
SamplerState sampler_Tex_Distort;
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
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD1,
  float4 v5 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD2,
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : COLOR0)
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
  o1.xy = v2.xy;
  o1.zw = float2(0,0);
  o2.xyzw = v3.xyzw;
  o3.xyzw = v4.xyzw;
  o4.xyzw = v5.xyzw;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_7_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Main_TexRGBA_ST.x, _Main_TexRGBA_ST.y, _Main_TexRGBA_ST.z, _Main_TexRGBA_ST.w);
  if (i == 1u) value = float4(_UV_Add_TilingOffset.x, _UV_Add_TilingOffset.y, _UV_Add_TilingOffset.z, _UV_Add_TilingOffset.w);
  if (i == 3u) value = float4(_MainColor.x, _MainColor.y, _MainColor.z, _MainColor.w);
  if (i == 4u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 7u) value = float4(_BCustom_Data_Use, _BDisappear_Offset, 0.0, 0.0);
  if (i == 8u) value = float4(0.0, _Mutiply, 0.0, 0.0);
  if (i == 9u) value = float4(_Main_Speed_Y, _Main_Speed_X, _Custom_Data_MainRB_Offset_Use, _UV_Add_Use);
  if (i == 10u) value = float4(_Distortion_Power_Y, _Distortion_Power_X, _Custom_Data_Distort_Power_Offset_Use, _Dis_Speed_Y);
  if (i == 11u) value = float4(_Dis_Speed_X, 0.0, 0.0, 0.0);
  if (i == 12u) value = float4(0.0, _BColor_Sharpness, _AlphaClip_Value, 0.0);
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
  float4 v1 : TEXCOORD2,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : COLOR0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = BA_Fragment_7_CB1((uint)(11)).x * BA_Fragment_7_CB0((uint)(11)).y;
  r0.y = BA_Fragment_7_CB1((uint)(10)).w * BA_Fragment_7_CB0((uint)(11)).y;
  r1.xy = v1.xy * BA_Fragment_7_CB1((uint)(4)).xy + BA_Fragment_7_CB1((uint)(4)).zw;
  r1.zw = float2(0,1);
  r0.xy = r1.zy + r0.xy;
  r0.xy = r1.xw + r0.xy;
  r0.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r0.z = cmp(0 != BA_Fragment_7_CB1((uint)(10)).z);
  r0.zw = r0.zz ? v2.zw : 0;
  r0.zw = BA_Fragment_7_CB1((uint)(10)).yx + r0.zw;
  r0.xy = r0.xy * r0.zw;
  r0.zw = BA_Fragment_7_CB1((uint)(9)).yx * BA_Fragment_7_CB0((uint)(11)).yy;
  r1.xy = cmp(float2(0,0) != BA_Fragment_7_CB1((uint)(9)).wz);
  r0.zw = r1.yy ? v2.xy : r0.zw;
  r2.yz = v1.xy * BA_Fragment_7_CB1((uint)(0)).xy + BA_Fragment_7_CB1((uint)(0)).zw;
  r2.x = v3.w * r2.y;
  r0.zw = r2.xz + r0.zw;
  r1.yz = v1.xy * BA_Fragment_7_CB1((uint)(1)).xy + BA_Fragment_7_CB1((uint)(1)).zw;
  r1.y = r1.y + r1.z;
  r1.x = r1.x ? r1.y : 1;
  r0.xy = r0.xy * r1.xx + r0.zw;
  r0.xyzw = _Main_TexRGBA.Sample(sampler_Main_TexRGBA, r0.xy).xyzw;
  r0.x = cmp(0 != BA_Fragment_7_CB1((uint)(7)).x);
  r0.x = r0.x ? v3.y : BA_Fragment_7_CB1((uint)(7)).y;
  r0.x = r0.z + -r0.x;
  r0.x = saturate(BA_Fragment_7_CB1((uint)(12)).y * r0.x);
  r0.x = BA_Fragment_7_CB1((uint)(8)).y * r0.x;
  r0.x = v4.w * r0.x;
  r0.x = BA_Fragment_7_CB1((uint)(3)).w * r0.x;
  r0.x = saturate(r0.x * r0.w);
  r0.x = -BA_Fragment_7_CB1((uint)(12)).z + r0.x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = float4(0,0,0,0);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
