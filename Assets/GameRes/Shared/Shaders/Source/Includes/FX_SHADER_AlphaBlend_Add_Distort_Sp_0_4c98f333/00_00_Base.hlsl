// Exact names and types from the original compiled parameter metadata.
float4 _Color;
float _Custom_Data_Distort_Power_Use;
float _Custom_Data_MainMask_Offset_Use;
float _Dis_Speed_X;
float _Dis_Speed_Y;
float _Distortion_Power_X;
float _Distortion_Power_Y;
float _Main_Distortion_Use;
float _Main_Speed_X;
float _Main_Speed_Y;
float _Mask_Distortion_Use;
float _Mask_Speed_X;
float _Mask_Speed_Y;
float _Multiply;
float _RGBRGBA;
float _SoftParticlesInvFN;
float _SoftParticlesN;
float4 _Tex_Distort_ST;
float4 _Tex_Main_ST;
float4 _Tex_Mask_ST;
Texture2D<float4> _CameraDepthTexture;
Texture2D<float4> _Tex_Distort;
Texture2D<float4> _Tex_Main;
Texture2D<float4> _Tex_Mask;
SamplerState sampler_CameraDepthTexture;
SamplerState sampler_Tex_Distort;
SamplerState sampler_Tex_Main;
SamplerState sampler_Tex_Mask;
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
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD0,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Position0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : COLOR0)
{
  o0 = 0;
  o1 = 0;
  o2 = 0;
  o3 = 0;
  o4 = 0;
  o5 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_1_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_1_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_1_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_1_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_1_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_1_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  r0.xyzw = BA_Vertex_1_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  o0.xyzw = r0.xyzw;
  o1.xyzw = v2.xyzw;
  o2.xyzw = v3.xyzw;
  o3.xy = v4.xy;
  o3.zw = float2(0,0);
  r0.y = BA_Vertex_1_CB0((uint)(17)).x * r0.y;
  r1.xzw = float3(0.5,0.5,0.5) * r0.xwy;
  o4.zw = r0.zw;
  o4.xy = r1.xw + r1.zz;
  o5.xyzw = v5.xyzw;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1
float4 BA_Fragment_3_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(_Custom_Data_MainMask_Offset_Use, _Main_Speed_X, _Main_Speed_Y, _Main_Distortion_Use);
  if (i == 1u) value = float4(_Custom_Data_Distort_Power_Use, _Distortion_Power_X, _Distortion_Power_Y, 0.0);
  if (i == 2u) value = float4(_Tex_Distort_ST.x, _Tex_Distort_ST.y, _Tex_Distort_ST.z, _Tex_Distort_ST.w);
  if (i == 3u) value = float4(_Dis_Speed_X, _Dis_Speed_Y, 0.0, 0.0);
  if (i == 4u) value = float4(_Tex_Main_ST.x, _Tex_Main_ST.y, _Tex_Main_ST.z, _Tex_Main_ST.w);
  if (i == 5u) value = float4(_Color.x, _Color.y, _Color.z, _Color.w);
  if (i == 6u) value = float4(_RGBRGBA, _Mask_Speed_X, _Mask_Speed_Y, 0.0);
  if (i == 7u) value = float4(_Tex_Mask_ST.x, _Tex_Mask_ST.y, _Tex_Mask_ST.z, _Tex_Mask_ST.w);
  if (i == 8u) value = float4(_Mask_Distortion_Use, _Multiply, _SoftParticlesN, _SoftParticlesInvFN);
  return value;
}

float4 BA_Fragment_3_CB0(uint i)
{
  float4 value = 0;
  if (i == 11u) value = float4(_Time.x, _Time.y, _Time.z, _Time.w);
  if (i == 17u) value = float4(_ProjectionParams.x, _ProjectionParams.y, _ProjectionParams.z, _ProjectionParams.w);
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  if (i == 20u) value = float4(_ZBufferParams.x, _ZBufferParams.y, _ZBufferParams.z, _ZBufferParams.w);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  return value;
}

void BA_Frag(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : COLOR0,
  out float4 o0 : SV_Target0)
{
  o0 = 0;

  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v3.xy * BA_Fragment_3_CB1((uint)(2)).xy + BA_Fragment_3_CB1((uint)(2)).zw;
  r0.zw = BA_Fragment_3_CB1((uint)(1)).xx * v2.xy + BA_Fragment_3_CB1((uint)(1)).yz;
  r0.xy = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(3)).xy + r0.xy;
  r1.xyzw = _Tex_Distort.Sample(sampler_Tex_Distort, r0.xy).xyzw;
  r0.xy = r1.xy * r0.zw;
  r0.zw = v3.xy * BA_Fragment_3_CB1((uint)(4)).xy + BA_Fragment_3_CB1((uint)(4)).zw;
  r1.xyzw = BA_Fragment_3_CB1((uint)(0)).xxxx * v1.xyzw;
  r1.xy = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(0)).yz + r1.xy;
  r1.xy = BA_Fragment_3_CB1((uint)(0)).ww * r0.xy + r1.xy;
  r0.zw = r1.xy + r0.zw;
  r2.xyzw = _Tex_Main.Sample(sampler_Tex_Main, r0.zw).xyzw;
  r0.zw = v3.xy * BA_Fragment_3_CB1((uint)(7)).xy + BA_Fragment_3_CB1((uint)(7)).zw;
  r1.xy = BA_Fragment_3_CB0((uint)(11)).yy * BA_Fragment_3_CB1((uint)(6)).yz + r1.zw;
  r0.zw = r1.xy + r0.zw;
  r0.xy = BA_Fragment_3_CB1((uint)(8)).xx * r0.xy + r0.zw;
  r0.xyzw = _Tex_Mask.Sample(sampler_Tex_Mask, r0.xy).xyzw;
  r0.yzw = v5.xyz * r2.xyz;
  r0.yzw = BA_Fragment_3_CB1((uint)(5)).xyz * r0.yzw;
  r1.xyz = r2.www + -r2.xyz;
  r1.xyz = BA_Fragment_3_CB1((uint)(6)).xxx * r1.xyz + r2.xyz;
  r0.yzw = r1.xyz * r0.yzw;
  r0.yzw = r0.yzw * r0.xxx;
  r2.xyz = BA_Fragment_3_CB1((uint)(8)).yyy * r0.yzw;
  r0.y = v5.w * v5.w;
  r0.y = r1.x * r0.y;
  r0.y = BA_Fragment_3_CB1((uint)(5)).w * r0.y;
  r0.x = r0.y * r0.x;
  r2.w = saturate(BA_Fragment_3_CB1((uint)(8)).y * r0.x);
  r0.xy = cmp(float2(0,0) < BA_Fragment_3_CB1((uint)(8)).zw);
  r0.x = (int)r0.y | (int)r0.x;
  if (r0.x != 0) {
    r0.xyz = v4.xyz / v4.www;
    r1.xyzw = _CameraDepthTexture.SampleBias(sampler_CameraDepthTexture, r0.xy, BA_Fragment_3_CB0((uint)(19)).x).xyzw;
    r0.x = cmp(BA_Fragment_3_CB0((uint)(21)).w == 0.000000);
    r0.y = BA_Fragment_3_CB0((uint)(20)).z * r1.x + BA_Fragment_3_CB0((uint)(20)).w;
    r0.y = 1 / r0.y;
    r0.w = BA_Fragment_3_CB0((uint)(17)).z + -BA_Fragment_3_CB0((uint)(17)).y;
    r0.w = -r0.w * r1.x + BA_Fragment_3_CB0((uint)(17)).z;
    r0.x = r0.x ? r0.y : r0.w;
    r0.y = BA_Fragment_3_CB0((uint)(20)).z * r0.z + BA_Fragment_3_CB0((uint)(20)).w;
    r0.y = 1 / r0.y;
    r0.x = -BA_Fragment_3_CB1((uint)(8)).z + r0.x;
    r0.x = r0.x + -r0.y;
    r0.x = saturate(BA_Fragment_3_CB1((uint)(8)).w * r0.x);
  } else {
    r0.x = 1;
  }
  o0.xyzw = r2.xyzw * r0.xxxx;
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
