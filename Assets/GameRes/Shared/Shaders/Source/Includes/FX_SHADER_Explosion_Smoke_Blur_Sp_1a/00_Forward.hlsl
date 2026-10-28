// Exact names and types from the original compiled parameter metadata.
float _Alphaclip_Value;
float _BStep_Glow_Value;
float _BStep_Value;
float4 _CustomData_DistortOffset_CD1XYXY;
float4 _CustomData_DistortOffset_CD2XYXY;
float4 _CustomData_DistortPower_CD2XYXY;
float4 _CustomData_DistortTiling_CD1XYXY;
float4 _CustomData_DistortTiling_CD2XYXY;
float4 _CustomData_MainOffset_CD1XYXY;
float4 _CustomData_MainOffset_CD2XYXY;
float4 _CustomData_MainTiling_CD1XYXY;
float4 _CustomData_MainTiling_CD2XYXY;
float4 _CustomData_ShadingOffset_CD2_GColorOffsetXYXY;
float4 _CustomData_ShadingOffset_CD2_ShadowOffsetXYXY;
float4 _CustomData_ShadingPower_CD1_GColorShadowXYXY;
float4 _CustomData_StepValue_CD1XYXY;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Distortion_Power_X;
float _Distortion_Power_Y;
float4 _GColor;
float _GColor_Glow_Value;
float _GColor_Offset_X;
float _GColor_Offset_Y;
float _GColor_Power;
float _GStep_Value;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mutiply;
float4 _RColor;
float _Shadow_Color_Multiply;
float _Shadow_Glow_Value;
float _Shadow_Offset_X;
float _Shadow_Offset_Y;
float _Shadow_Power;
float _SoftParticleFarFade;
float _SoftParticleNearFade;
float4 _Tex_Distort_ST;
float4 _Tex_Main_ST;
Texture2D<float4> _CameraDepthTexture;
Texture2D<float4> _Tex_Distort;
Texture2D<float4> _Tex_Main;
SamplerState sampler_CameraDepthTexture;
SamplerState sampler_Tex_Distort;
SamplerState sampler_Tex_Main;
#ifndef cmp
#define cmp -
#endif

#if defined(_VERTEX_ALPHA_COLOR_OFF) && defined(_VERTEX_ALPHA_USE_OFF)
float4 BA_Vertex_1_CB2(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(_CustomData_DistortPower_CD2XYXY.x, _CustomData_DistortPower_CD2XYXY.y, _CustomData_DistortPower_CD2XYXY.z, _CustomData_DistortPower_CD2XYXY.w);
  if (i == 1u) value = float4(_CustomData_DistortOffset_CD2XYXY.x, _CustomData_DistortOffset_CD2XYXY.y, _CustomData_DistortOffset_CD2XYXY.z, _CustomData_DistortOffset_CD2XYXY.w);
  if (i == 2u) value = float4(_CustomData_DistortTiling_CD2XYXY.x, _CustomData_DistortTiling_CD2XYXY.y, _CustomData_DistortTiling_CD2XYXY.z, _CustomData_DistortTiling_CD2XYXY.w);
  if (i == 3u) value = float4(_CustomData_DistortOffset_CD1XYXY.x, _CustomData_DistortOffset_CD1XYXY.y, _CustomData_DistortOffset_CD1XYXY.z, _CustomData_DistortOffset_CD1XYXY.w);
  if (i == 4u) value = float4(_CustomData_DistortTiling_CD1XYXY.x, _CustomData_DistortTiling_CD1XYXY.y, _CustomData_DistortTiling_CD1XYXY.z, _CustomData_DistortTiling_CD1XYXY.w);
  if (i == 7u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 11u) value = float4(_CustomData_MainOffset_CD2XYXY.x, _CustomData_MainOffset_CD2XYXY.y, _CustomData_MainOffset_CD2XYXY.z, _CustomData_MainOffset_CD2XYXY.w);
  if (i == 12u) value = float4(_CustomData_MainOffset_CD1XYXY.x, _CustomData_MainOffset_CD1XYXY.y, _CustomData_MainOffset_CD1XYXY.z, _CustomData_MainOffset_CD1XYXY.w);
  if (i == 13u) value = float4(_CustomData_MainTiling_CD2XYXY.x, _CustomData_MainTiling_CD2XYXY.y, _CustomData_MainTiling_CD2XYXY.z, _CustomData_MainTiling_CD2XYXY.w);
  if (i == 14u) value = float4(_CustomData_MainTiling_CD1XYXY.x, _CustomData_MainTiling_CD1XYXY.y, _CustomData_MainTiling_CD1XYXY.z, _CustomData_MainTiling_CD1XYXY.w);
  if (i == 15u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_1_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Vertex_1_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 64u) value = float4(transpose(unity_MatrixV)[3].x, transpose(unity_MatrixV)[3].y, transpose(unity_MatrixV)[3].z, transpose(unity_MatrixV)[3].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value; // Padding stays zero and is never treated as a field.
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
  out float4 o2 : TEXCOORD3,
  out float4 o3 : TEXCOORD4,
  out float4 o4 : TEXCOORD5,
  out float4 o5 : TEXCOORD6,
  out float4 o6 : TEXCOORD7,
  out float4 o7 : TEXCOORD8)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;
  o6 = 0;
  o7 = 0;

  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_1_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_1_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_1_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_1_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_1_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw + r1.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o1.xyzw = v2.xyzw;
  r2.xyzw = BA_Vertex_1_CB2((uint)(14)).xyzw * v4.xyzw;
  r3.xyzw = v3.xyxy * BA_Vertex_1_CB2((uint)(15)).xyxy + BA_Vertex_1_CB2((uint)(15)).zwzw;
  r2.xyzw = r3.xyzw * r2.xyzw;
  r2.xy = r2.xy + r2.zw;
  r4.xyzw = BA_Vertex_1_CB2((uint)(13)).xyzw * v5.xyzw;
  r2.xy = r4.xy * r3.xy + r2.xy;
  r2.xy = r4.zw * r3.zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_1_CB2((uint)(12)).xy + r2.xy;
  r2.xy = v4.zw * BA_Vertex_1_CB2((uint)(12)).zw + r2.xy;
  r2.xy = v5.xy * BA_Vertex_1_CB2((uint)(11)).xy + r2.xy;
  o2.zw = v5.zw * BA_Vertex_1_CB2((uint)(11)).zw + r2.xy;
  o2.xy = v3.xy;
  r2.xyzw = BA_Vertex_1_CB2((uint)(2)).xyzw * v5.xyzw;
  r3.xy = BA_Vertex_1_CB2((uint)(3)).zw * v4.zw;
  r4.xyzw = BA_Vertex_1_CB2((uint)(4)).xyzw * v4.xyzw;
  r5.xyzw = v3.xyxy * BA_Vertex_1_CB2((uint)(7)).xyxy + BA_Vertex_1_CB2((uint)(7)).zwzw;
  r3.xy = r4.xy * r5.xy + r3.xy;
  r2.xy = r2.xy * r5.xy + r3.xy;
  r2.xy = v5.zw * BA_Vertex_1_CB2((uint)(1)).zw + r2.xy;
  r2.xy = r4.zw * r5.zw + r2.xy;
  r2.xy = v4.xy * BA_Vertex_1_CB2((uint)(3)).xy + r2.xy;
  r2.xy = r2.zw * r5.zw + r2.xy;
  o3.zw = v5.xy * BA_Vertex_1_CB2((uint)(1)).xy + r2.xy;
  r2.xyzw = BA_Vertex_1_CB2((uint)(0)).xyzw * v5.xyzw;
  o3.xy = r2.xy + r2.zw;
  o4.xyzw = v4.xyzw;
  o5.xyzw = v5.xyzw;
  r0.w = BA_Vertex_1_CB0((uint)(17)).x * r1.y;
  r2.w = 0.5 * r0.w;
  r2.xz = float2(0.5,0.5) * r1.xw;
  o6.zw = r1.zw;
  o6.xy = r2.xw + r2.zz;
  r0.y = BA_Vertex_1_CB0((uint)(62)).z * r0.y;
  r0.x = BA_Vertex_1_CB0((uint)(61)).z * r0.x + r0.y;
  r0.x = BA_Vertex_1_CB0((uint)(63)).z * r0.z + r0.x;
  r0.x = BA_Vertex_1_CB0((uint)(64)).z + r0.x;
  o7.x = -r0.x;
  o7.yzw = float3(0,0,0);
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if defined(_VERTEX_ALPHA_COLOR_OFF) && defined(_VERTEX_ALPHA_USE_OFF)
float4 BA_Fragment_3_CB1(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 5u) value = float4(_CustomData_ShadingOffset_CD2_ShadowOffsetXYXY.x, _CustomData_ShadingOffset_CD2_ShadowOffsetXYXY.y, _CustomData_ShadingOffset_CD2_ShadowOffsetXYXY.z, _CustomData_ShadingOffset_CD2_ShadowOffsetXYXY.w);
  if (i == 6u) value = float4(_CustomData_ShadingPower_CD1_GColorShadowXYXY.x, _CustomData_ShadingPower_CD1_GColorShadowXYXY.y, _CustomData_ShadingPower_CD1_GColorShadowXYXY.z, _CustomData_ShadingPower_CD1_GColorShadowXYXY.w);
  if (i == 7u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 8u) value = float4(_CustomData_StepValue_CD1XYXY.x, _CustomData_StepValue_CD1XYXY.y, _CustomData_StepValue_CD1XYXY.z, _CustomData_StepValue_CD1XYXY.w);
  if (i == 9u) value = float4(_CustomData_ShadingOffset_CD2_GColorOffsetXYXY.x, _CustomData_ShadingOffset_CD2_GColorOffsetXYXY.y, _CustomData_ShadingOffset_CD2_GColorOffsetXYXY.z, _CustomData_ShadingOffset_CD2_GColorOffsetXYXY.w);
  if (i == 10u) value = float4(_GColor.x, _GColor.y, _GColor.z, _GColor.w);
  if (i == 15u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 16u) value = float4(_RColor.x, _RColor.y, _RColor.z, _RColor.w);
  if (i == 17u) value = float4(_Shadow_Glow_Value, _Main_Speed_X, _GColor_Glow_Value, _GColor_Offset_Y);
  if (i == 18u) value = float4(_Mutiply, _BStep_Glow_Value, _SoftParticleNearFade, _GColor_Offset_X);
  if (i == 19u) value = float4(_Shadow_Offset_Y, _BStep_Value, _Shadow_Power, _GColor_Power);
  if (i == 20u) value = float4(_SoftParticleFarFade, _GStep_Value, _Shadow_Color_Multiply, _Dis_Speed_Y);
  if (i == 21u) value = float4(_Dis_Speed_X, _Distortion_Power_Y, _Distortion_Power_X, _Main_Speed_Y);
  if (i == 22u) value = float4(_Shadow_Offset_X, _Alphaclip_Value, 0.0, 0.0);
  return value; // Padding stays zero and is never treated as a field.
}

float4 BA_Fragment_3_CB0(uint i)
{
  float4 value = float4(0.0,0.0,0.0,0.0);
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  return value; // Padding stays zero and is never treated as a field.
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD3,
  float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  float4 v7 : TEXCOORD8,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v6.xy / v6.ww;
  r0.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_3_CB0((uint)(19)).x).xyzw;
  r0.x = BA_Fragment_3_CB0((uint)(20)).z * r0.x + BA_Fragment_3_CB0((uint)(20)).w;
  r0.x = 1 / r0.x;
  r0.x = -BA_Fragment_3_CB1((uint)(18)).z + r0.x;
  r0.x = -v7.x + r0.x;
  r0.y = BA_Fragment_3_CB1((uint)(20)).x + -BA_Fragment_3_CB1((uint)(18)).z;
  r0.y = 1 / r0.y;
  r0.x = saturate(r0.x * r0.y);
  r0.yz = v2.xy * BA_Fragment_3_CB1((uint)(7)).xy + BA_Fragment_3_CB1((uint)(7)).zw;
  r1.y = BA_Fragment_3_CB1((uint)(20)).w * BA_Fragment_3_CB0((uint)(11)).y;
  r1.xw = BA_Fragment_3_CB1((uint)(21)).xw * BA_Fragment_3_CB0((uint)(11)).yy;
  r1.xy = frac(r1.xy);
  r0.yz = r1.xy + r0.yz;
  r0.yz = v3.zw + r0.yz;
  r2.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.yz).xyzw;
  r0.yz = v2.xy * BA_Fragment_3_CB1((uint)(15)).xy + BA_Fragment_3_CB1((uint)(15)).zw;
  r1.z = BA_Fragment_3_CB1((uint)(17)).y * BA_Fragment_3_CB0((uint)(11)).y;
  r0.yz = r1.zw + r0.yz;
  r0.yz = v2.zw + r0.yz;
  r1.xy = BA_Fragment_3_CB1((uint)(21)).zy + v3.xy;
  r0.yz = r1.xy * r2.xy + r0.yz;
  r1.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.yz).xyzw;
  r2.xyzw = BA_Fragment_3_CB1((uint)(8)).xyzw * v4.xyzw;
  r2.xy = r2.xy + r2.zw;
  r3.x = BA_Fragment_3_CB1((uint)(20)).y + r2.x;
  r3.y = BA_Fragment_3_CB1((uint)(19)).y + r2.y;
  r1.yz = -r3.xy + r1.yz;
  r0.w = saturate(BA_Fragment_3_CB1((uint)(18)).y * r1.z);
  r1.y = saturate(BA_Fragment_3_CB1((uint)(17)).z * r1.y);
  r0.w = r1.w * r0.w;
  r0.w = BA_Fragment_3_CB1((uint)(16)).w * r0.w;
  r0.w = BA_Fragment_3_CB1((uint)(18)).x * r0.w;
  r0.w = v1.w * r0.w;
  r0.x = r0.w * r0.x;
  r0.w = saturate(r0.x);
  r1.z = -BA_Fragment_3_CB1((uint)(22)).y + r0.w;
  o0.w = r0.w;
  r0.w = cmp(r1.z < 0);
  if (r0.w != 0) discard;
  r2.xyzw = BA_Fragment_3_CB1((uint)(5)).xyzw * v5.xyzw;
  r1.zw = r2.xy + r2.zw;
  r1.zw = r1.zw + r0.yz;
  r2.x = BA_Fragment_3_CB1((uint)(22)).x + r1.z;
  r2.y = BA_Fragment_3_CB1((uint)(19)).x + r1.w;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r2.xy).xyzw;
  r4.xyzw = BA_Fragment_3_CB1((uint)(6)).xyzw * v4.xyzw;
  r1.zw = r4.xy + r4.zw;
  r1.zw = BA_Fragment_3_CB1((uint)(19)).wz + r1.zw;
  r0.w = r1.w + r2.z;
  r0.w = r3.y + -r0.w;
  r0.w = saturate(BA_Fragment_3_CB1((uint)(17)).x * r0.w);
  r1.w = BA_Fragment_3_CB1((uint)(20)).z + -r1.x;
  r0.w = r0.w * r1.w + r1.x;
  r2.xyz = v1.xyz * r0.www;
  r3.xzw = -v1.xyz * r0.www + BA_Fragment_3_CB1((uint)(10)).xyz;
  r4.xyzw = BA_Fragment_3_CB1((uint)(9)).xyzw * v5.xyzw;
  r1.xw = r4.xy + r4.zw;
  r0.yz = r1.xw + r0.yz;
  r4.x = BA_Fragment_3_CB1((uint)(18)).w + r0.y;
  r4.y = BA_Fragment_3_CB1((uint)(17)).w + r0.z;
  r4.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r4.xy).xyzw;
  r0.y = r4.z + r1.z;
  r0.y = r3.y + -r0.y;
  r0.y = saturate(BA_Fragment_3_CB1((uint)(17)).z * r0.y);
  r0.y = r0.y + r1.y;
  r0.y = min(1, r0.y);
  r0.yzw = r0.yyy * r3.xzw + r2.xyz;
  r0.yzw = BA_Fragment_3_CB1((uint)(18)).xxx * r0.yzw;
  r0.yzw = BA_Fragment_3_CB1((uint)(16)).xyz * r0.yzw;
  o0.xyz = r0.yzw * r0.xxx;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
