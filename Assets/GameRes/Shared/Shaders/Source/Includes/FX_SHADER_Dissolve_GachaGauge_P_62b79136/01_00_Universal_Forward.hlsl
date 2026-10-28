// Exact names and types from the original compiled parameter metadata.
float4 Color_D20A2F66;
Texture2D<float4> Texture2D_59799BE;
Texture2D<float4> Texture2D_AD649FB;
SamplerState samplerTexture2D_59799BE;
SamplerState samplerTexture2D_AD649FB;
#ifndef cmp
#define cmp -
#endif

#if !defined(DIRLIGHTMAP_COMBINED) && !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON)
float4 BA_Vertex_29_CB1(uint i)
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

float4 BA_Vertex_29_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float3 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TANGENT0,
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : INTERP0,
  out float4 o2 : INTERP1,
  out float3 o3 : INTERP2,
  out float3 o4 : INTERP3,
  out float3 o5 : INTERP4)
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

  r0.xyz = BA_Vertex_29_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_29_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_29_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_29_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_29_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_29_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_29_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_29_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v3.xyzw;
  o2.xyzw = v4.xyzw;
  o3.xyz = r0.xyz;
  r0.xyz = BA_Vertex_29_CB0((uint)(16)).xyz + -r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_29_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_29_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_29_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r1.xyz * r0.www;
  r0.w = cmp(BA_Vertex_29_CB0((uint)(21)).w == 0.000000);
  o5.x = r0.w ? r0.x : BA_Vertex_29_CB0((uint)(61)).z;
  o5.y = r0.w ? r0.y : BA_Vertex_29_CB0((uint)(62)).z;
  o5.z = r0.w ? r0.z : BA_Vertex_29_CB0((uint)(63)).z;
  return;
}
#elif !defined(DIRLIGHTMAP_COMBINED) && !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON)
float4 BA_Vertex_30_CB1(uint i)
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

float4 BA_Vertex_30_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float3 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TANGENT0,
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : INTERP0,
  out float4 o2 : INTERP1,
  out float3 o3 : INTERP2,
  out float3 o4 : INTERP3,
  out float3 o5 : INTERP4)
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

  r0.xyz = BA_Vertex_30_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_30_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_30_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_30_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_30_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_30_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_30_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_30_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v3.xyzw;
  o2.xyzw = v4.xyzw;
  o3.xyz = r0.xyz;
  r0.xyz = BA_Vertex_30_CB0((uint)(16)).xyz + -r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_30_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_30_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_30_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r1.xyz * r0.www;
  r0.w = cmp(BA_Vertex_30_CB0((uint)(21)).w == 0.000000);
  o5.x = r0.w ? r0.x : BA_Vertex_30_CB0((uint)(61)).z;
  o5.y = r0.w ? r0.y : BA_Vertex_30_CB0((uint)(62)).z;
  o5.z = r0.w ? r0.z : BA_Vertex_30_CB0((uint)(63)).z;
  return;
}
#elif !defined(DIRLIGHTMAP_COMBINED) && defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON)
float4 BA_Vertex_31_CB1(uint i)
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

float4 BA_Vertex_31_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float3 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TANGENT0,
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : INTERP0,
  out float4 o2 : INTERP1,
  out float3 o3 : INTERP2,
  out float3 o4 : INTERP3,
  out float3 o5 : INTERP4)
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

  r0.xyz = BA_Vertex_31_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_31_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_31_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_31_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_31_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_31_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_31_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_31_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v3.xyzw;
  o2.xyzw = v4.xyzw;
  o3.xyz = r0.xyz;
  r0.xyz = BA_Vertex_31_CB0((uint)(16)).xyz + -r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_31_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_31_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_31_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r1.xyz * r0.www;
  r0.w = cmp(BA_Vertex_31_CB0((uint)(21)).w == 0.000000);
  o5.x = r0.w ? r0.x : BA_Vertex_31_CB0((uint)(61)).z;
  o5.y = r0.w ? r0.y : BA_Vertex_31_CB0((uint)(62)).z;
  o5.z = r0.w ? r0.z : BA_Vertex_31_CB0((uint)(63)).z;
  return;
}
#elif !defined(DIRLIGHTMAP_COMBINED) && !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON)
float4 BA_Vertex_32_CB1(uint i)
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

float4 BA_Vertex_32_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float3 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TANGENT0,
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : INTERP0,
  out float4 o2 : INTERP1,
  out float3 o3 : INTERP2,
  out float3 o4 : INTERP3,
  out float3 o5 : INTERP4)
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

  r0.xyz = BA_Vertex_32_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_32_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_32_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_32_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_32_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_32_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_32_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_32_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v3.xyzw;
  o2.xyzw = v4.xyzw;
  o3.xyz = r0.xyz;
  r0.xyz = BA_Vertex_32_CB0((uint)(16)).xyz + -r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_32_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_32_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_32_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r1.xyz * r0.www;
  r0.w = cmp(BA_Vertex_32_CB0((uint)(21)).w == 0.000000);
  o5.x = r0.w ? r0.x : BA_Vertex_32_CB0((uint)(61)).z;
  o5.y = r0.w ? r0.y : BA_Vertex_32_CB0((uint)(62)).z;
  o5.z = r0.w ? r0.z : BA_Vertex_32_CB0((uint)(63)).z;
  return;
}
#elif !defined(DIRLIGHTMAP_COMBINED) && !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(LIGHTMAP_ON)
float4 BA_Vertex_33_CB1(uint i)
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

float4 BA_Vertex_33_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float3 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TANGENT0,
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : INTERP0,
  out float4 o2 : INTERP1,
  out float3 o3 : INTERP2,
  out float3 o4 : INTERP3,
  out float3 o5 : INTERP4)
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

  r0.xyz = BA_Vertex_33_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_33_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_33_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_33_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_33_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_33_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_33_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_33_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v3.xyzw;
  o2.xyzw = v4.xyzw;
  o3.xyz = r0.xyz;
  r0.xyz = BA_Vertex_33_CB0((uint)(16)).xyz + -r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_33_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_33_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_33_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r1.xyz * r0.www;
  r0.w = cmp(BA_Vertex_33_CB0((uint)(21)).w == 0.000000);
  o5.x = r0.w ? r0.x : BA_Vertex_33_CB0((uint)(61)).z;
  o5.y = r0.w ? r0.y : BA_Vertex_33_CB0((uint)(62)).z;
  o5.z = r0.w ? r0.z : BA_Vertex_33_CB0((uint)(63)).z;
  return;
}
#elif !defined(DIRLIGHTMAP_COMBINED) && defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON)
float4 BA_Vertex_34_CB1(uint i)
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

float4 BA_Vertex_34_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float3 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TANGENT0,
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : INTERP0,
  out float4 o2 : INTERP1,
  out float3 o3 : INTERP2,
  out float3 o4 : INTERP3,
  out float3 o5 : INTERP4)
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

  r0.xyz = BA_Vertex_34_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_34_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_34_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_34_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_34_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_34_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_34_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_34_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v3.xyzw;
  o2.xyzw = v4.xyzw;
  o3.xyz = r0.xyz;
  r0.xyz = BA_Vertex_34_CB0((uint)(16)).xyz + -r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_34_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_34_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_34_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r1.xyz * r0.www;
  r0.w = cmp(BA_Vertex_34_CB0((uint)(21)).w == 0.000000);
  o5.x = r0.w ? r0.x : BA_Vertex_34_CB0((uint)(61)).z;
  o5.y = r0.w ? r0.y : BA_Vertex_34_CB0((uint)(62)).z;
  o5.z = r0.w ? r0.z : BA_Vertex_34_CB0((uint)(63)).z;
  return;
}
#elif defined(DIRLIGHTMAP_COMBINED) && !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON)
float4 BA_Vertex_35_CB1(uint i)
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

float4 BA_Vertex_35_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float3 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TANGENT0,
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : INTERP0,
  out float4 o2 : INTERP1,
  out float3 o3 : INTERP2,
  out float3 o4 : INTERP3,
  out float3 o5 : INTERP4)
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

  r0.xyz = BA_Vertex_35_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_35_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_35_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_35_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_35_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_35_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_35_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_35_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v3.xyzw;
  o2.xyzw = v4.xyzw;
  o3.xyz = r0.xyz;
  r0.xyz = BA_Vertex_35_CB0((uint)(16)).xyz + -r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_35_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_35_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_35_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r1.xyz * r0.www;
  r0.w = cmp(BA_Vertex_35_CB0((uint)(21)).w == 0.000000);
  o5.x = r0.w ? r0.x : BA_Vertex_35_CB0((uint)(61)).z;
  o5.y = r0.w ? r0.y : BA_Vertex_35_CB0((uint)(62)).z;
  o5.z = r0.w ? r0.z : BA_Vertex_35_CB0((uint)(63)).z;
  return;
}
#elif defined(DIRLIGHTMAP_COMBINED) && !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(LIGHTMAP_ON)
float4 BA_Vertex_36_CB1(uint i)
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

float4 BA_Vertex_36_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float3 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TANGENT0,
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : INTERP0,
  out float4 o2 : INTERP1,
  out float3 o3 : INTERP2,
  out float3 o4 : INTERP3,
  out float3 o5 : INTERP4)
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

  r0.xyz = BA_Vertex_36_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_36_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_36_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_36_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_36_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_36_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_36_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_36_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v3.xyzw;
  o2.xyzw = v4.xyzw;
  o3.xyz = r0.xyz;
  r0.xyz = BA_Vertex_36_CB0((uint)(16)).xyz + -r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_36_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_36_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_36_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r1.xyz * r0.www;
  r0.w = cmp(BA_Vertex_36_CB0((uint)(21)).w == 0.000000);
  o5.x = r0.w ? r0.x : BA_Vertex_36_CB0((uint)(61)).z;
  o5.y = r0.w ? r0.y : BA_Vertex_36_CB0((uint)(62)).z;
  o5.z = r0.w ? r0.z : BA_Vertex_36_CB0((uint)(63)).z;
  return;
}
#elif defined(DIRLIGHTMAP_COMBINED) && defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON)
float4 BA_Vertex_37_CB1(uint i)
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

float4 BA_Vertex_37_CB0(uint i)
{
  float4 value = 0;
  if (i == 16u) value = float4(_WorldSpaceCameraPos.x, _WorldSpaceCameraPos.y, _WorldSpaceCameraPos.z, 0.0);
  if (i == 21u) value = float4(unity_OrthoParams.x, unity_OrthoParams.y, unity_OrthoParams.z, unity_OrthoParams.w);
  if (i == 61u) value = float4(transpose(unity_MatrixV)[0].x, transpose(unity_MatrixV)[0].y, transpose(unity_MatrixV)[0].z, transpose(unity_MatrixV)[0].w);
  if (i == 62u) value = float4(transpose(unity_MatrixV)[1].x, transpose(unity_MatrixV)[1].y, transpose(unity_MatrixV)[1].z, transpose(unity_MatrixV)[1].w);
  if (i == 63u) value = float4(transpose(unity_MatrixV)[2].x, transpose(unity_MatrixV)[2].y, transpose(unity_MatrixV)[2].z, transpose(unity_MatrixV)[2].w);
  if (i == 73u) value = float4(transpose(unity_MatrixVP)[0].x, transpose(unity_MatrixVP)[0].y, transpose(unity_MatrixVP)[0].z, transpose(unity_MatrixVP)[0].w);
  if (i == 74u) value = float4(transpose(unity_MatrixVP)[1].x, transpose(unity_MatrixVP)[1].y, transpose(unity_MatrixVP)[1].z, transpose(unity_MatrixVP)[1].w);
  if (i == 75u) value = float4(transpose(unity_MatrixVP)[2].x, transpose(unity_MatrixVP)[2].y, transpose(unity_MatrixVP)[2].z, transpose(unity_MatrixVP)[2].w);
  if (i == 76u) value = float4(transpose(unity_MatrixVP)[3].x, transpose(unity_MatrixVP)[3].y, transpose(unity_MatrixVP)[3].z, transpose(unity_MatrixVP)[3].w);
  return value;
}

void BA_Vert(
  float3 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : TANGENT0,
  float4 v3 : TEXCOORD0,
  float4 v4 : COLOR0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : INTERP0,
  out float4 o2 : INTERP1,
  out float3 o3 : INTERP2,
  out float3 o4 : INTERP3,
  out float3 o5 : INTERP4)
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

  r0.xyz = BA_Vertex_37_CB1((uint)(1)).xyz * v0.yyy;
  r0.xyz = BA_Vertex_37_CB1((uint)(0)).xyz * v0.xxx + r0.xyz;
  r0.xyz = BA_Vertex_37_CB1((uint)(2)).xyz * v0.zzz + r0.xyz;
  r0.xyz = BA_Vertex_37_CB1((uint)(3)).xyz + r0.xyz;
  r1.xyzw = BA_Vertex_37_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_37_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_37_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_37_CB0((uint)(76)).xyzw + r1.xyzw;
  o1.xyzw = v3.xyzw;
  o2.xyzw = v4.xyzw;
  o3.xyz = r0.xyz;
  r0.xyz = BA_Vertex_37_CB0((uint)(16)).xyz + -r0.xyz;
  r1.x = dot(v1.xyz, BA_Vertex_37_CB1((uint)(4)).xyz);
  r1.y = dot(v1.xyz, BA_Vertex_37_CB1((uint)(5)).xyz);
  r1.z = dot(v1.xyz, BA_Vertex_37_CB1((uint)(6)).xyz);
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = max(1.17549435e-038, r0.w);
  r0.w = rsqrt(r0.w);
  o4.xyz = r1.xyz * r0.www;
  r0.w = cmp(BA_Vertex_37_CB0((uint)(21)).w == 0.000000);
  o5.x = r0.w ? r0.x : BA_Vertex_37_CB0((uint)(61)).z;
  o5.y = r0.w ? r0.y : BA_Vertex_37_CB0((uint)(62)).z;
  o5.z = r0.w ? r0.z : BA_Vertex_37_CB0((uint)(63)).z;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Vert(float4 position : POSITION, out float4 clip : SV_POSITION) { clip = TransformObjectToHClip(position.xyz); }
#endif

#if !defined(DIRLIGHTMAP_COMBINED) && !defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON)
float4 BA_Fragment_38_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(Color_D20A2F66.x, Color_D20A2F66.y, Color_D20A2F66.z, Color_D20A2F66.w);
  return value;
}

float4 BA_Fragment_38_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : INTERP0,
  float4 v2 : INTERP1,
  float3 v3 : INTERP2,
  float3 v4 : INTERP3,
  float3 v5 : INTERP4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = Texture2D_AD649FB.SampleBias(samplerTexture2D_AD649FB, v1.xy, BA_Fragment_38_CB0((uint)(19)).x).xyzw;
  r1.xyzw = Texture2D_59799BE.SampleBias(samplerTexture2D_59799BE, v1.xy, BA_Fragment_38_CB0((uint)(19)).x).xyzw;
  r0.x = r1.w * r0.w;
  r0.yzw = BA_Fragment_38_CB1((uint)(0)).xyz * r1.xyz;
  o0.xyz = v2.xyz * r0.yzw;
  r0.y = v2.w * r0.x + -v1.z;
  r0.x = v2.w * r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(DIRLIGHTMAP_COMBINED) && !defined(FOG_EXP) && defined(FOG_LINEAR) && !defined(LIGHTMAP_ON)
float4 BA_Fragment_39_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(Color_D20A2F66.x, Color_D20A2F66.y, Color_D20A2F66.z, Color_D20A2F66.w);
  return value;
}

float4 BA_Fragment_39_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : INTERP0,
  float4 v2 : INTERP1,
  float3 v3 : INTERP2,
  float3 v4 : INTERP3,
  float3 v5 : INTERP4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = Texture2D_AD649FB.SampleBias(samplerTexture2D_AD649FB, v1.xy, BA_Fragment_39_CB0((uint)(19)).x).xyzw;
  r1.xyzw = Texture2D_59799BE.SampleBias(samplerTexture2D_59799BE, v1.xy, BA_Fragment_39_CB0((uint)(19)).x).xyzw;
  r0.x = r1.w * r0.w;
  r0.yzw = BA_Fragment_39_CB1((uint)(0)).xyz * r1.xyz;
  o0.xyz = v2.xyz * r0.yzw;
  r0.y = v2.w * r0.x + -v1.z;
  r0.x = v2.w * r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(DIRLIGHTMAP_COMBINED) && defined(FOG_EXP) && !defined(FOG_LINEAR) && !defined(LIGHTMAP_ON)
float4 BA_Fragment_40_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(Color_D20A2F66.x, Color_D20A2F66.y, Color_D20A2F66.z, Color_D20A2F66.w);
  return value;
}

float4 BA_Fragment_40_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : INTERP0,
  float4 v2 : INTERP1,
  float3 v3 : INTERP2,
  float3 v4 : INTERP3,
  float3 v5 : INTERP4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = Texture2D_AD649FB.SampleBias(samplerTexture2D_AD649FB, v1.xy, BA_Fragment_40_CB0((uint)(19)).x).xyzw;
  r1.xyzw = Texture2D_59799BE.SampleBias(samplerTexture2D_59799BE, v1.xy, BA_Fragment_40_CB0((uint)(19)).x).xyzw;
  r0.x = r1.w * r0.w;
  r0.yzw = BA_Fragment_40_CB1((uint)(0)).xyz * r1.xyz;
  o0.xyz = v2.xyz * r0.yzw;
  r0.y = v2.w * r0.x + -v1.z;
  r0.x = v2.w * r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif defined(DIRLIGHTMAP_COMBINED) && defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON)
float4 BA_Fragment_41_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(Color_D20A2F66.x, Color_D20A2F66.y, Color_D20A2F66.z, Color_D20A2F66.w);
  return value;
}

float4 BA_Fragment_41_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : INTERP0,
  float4 v2 : INTERP1,
  float3 v3 : INTERP2,
  float3 v4 : INTERP3,
  float3 v5 : INTERP4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = Texture2D_AD649FB.SampleBias(samplerTexture2D_AD649FB, v1.xy, BA_Fragment_41_CB0((uint)(19)).x).xyzw;
  r1.xyzw = Texture2D_59799BE.SampleBias(samplerTexture2D_59799BE, v1.xy, BA_Fragment_41_CB0((uint)(19)).x).xyzw;
  r0.x = r1.w * r0.w;
  r0.yzw = BA_Fragment_41_CB1((uint)(0)).xyz * r1.xyz;
  o0.xyz = v2.xyz * r0.yzw;
  r0.y = v2.w * r0.x + -v1.z;
  r0.x = v2.w * r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif defined(DIRLIGHTMAP_COMBINED) && !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(LIGHTMAP_ON)
float4 BA_Fragment_42_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(Color_D20A2F66.x, Color_D20A2F66.y, Color_D20A2F66.z, Color_D20A2F66.w);
  return value;
}

float4 BA_Fragment_42_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : INTERP0,
  float4 v2 : INTERP1,
  float3 v3 : INTERP2,
  float3 v4 : INTERP3,
  float3 v5 : INTERP4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = Texture2D_AD649FB.SampleBias(samplerTexture2D_AD649FB, v1.xy, BA_Fragment_42_CB0((uint)(19)).x).xyzw;
  r1.xyzw = Texture2D_59799BE.SampleBias(samplerTexture2D_59799BE, v1.xy, BA_Fragment_42_CB0((uint)(19)).x).xyzw;
  r0.x = r1.w * r0.w;
  r0.yzw = BA_Fragment_42_CB1((uint)(0)).xyz * r1.xyz;
  o0.xyz = v2.xyz * r0.yzw;
  r0.y = v2.w * r0.x + -v1.z;
  r0.x = v2.w * r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif defined(DIRLIGHTMAP_COMBINED) && !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON)
float4 BA_Fragment_43_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(Color_D20A2F66.x, Color_D20A2F66.y, Color_D20A2F66.z, Color_D20A2F66.w);
  return value;
}

float4 BA_Fragment_43_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : INTERP0,
  float4 v2 : INTERP1,
  float3 v3 : INTERP2,
  float3 v4 : INTERP3,
  float3 v5 : INTERP4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = Texture2D_AD649FB.SampleBias(samplerTexture2D_AD649FB, v1.xy, BA_Fragment_43_CB0((uint)(19)).x).xyzw;
  r1.xyzw = Texture2D_59799BE.SampleBias(samplerTexture2D_59799BE, v1.xy, BA_Fragment_43_CB0((uint)(19)).x).xyzw;
  r0.x = r1.w * r0.w;
  r0.yzw = BA_Fragment_43_CB1((uint)(0)).xyz * r1.xyz;
  o0.xyz = v2.xyz * r0.yzw;
  r0.y = v2.w * r0.x + -v1.z;
  r0.x = v2.w * r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(DIRLIGHTMAP_COMBINED) && defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON)
float4 BA_Fragment_44_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(Color_D20A2F66.x, Color_D20A2F66.y, Color_D20A2F66.z, Color_D20A2F66.w);
  return value;
}

float4 BA_Fragment_44_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : INTERP0,
  float4 v2 : INTERP1,
  float3 v3 : INTERP2,
  float3 v4 : INTERP3,
  float3 v5 : INTERP4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = Texture2D_AD649FB.SampleBias(samplerTexture2D_AD649FB, v1.xy, BA_Fragment_44_CB0((uint)(19)).x).xyzw;
  r1.xyzw = Texture2D_59799BE.SampleBias(samplerTexture2D_59799BE, v1.xy, BA_Fragment_44_CB0((uint)(19)).x).xyzw;
  r0.x = r1.w * r0.w;
  r0.yzw = BA_Fragment_44_CB1((uint)(0)).xyz * r1.xyz;
  o0.xyz = v2.xyz * r0.yzw;
  r0.y = v2.w * r0.x + -v1.z;
  r0.x = v2.w * r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(DIRLIGHTMAP_COMBINED) && !defined(FOG_EXP) && defined(FOG_LINEAR) && defined(LIGHTMAP_ON)
float4 BA_Fragment_45_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(Color_D20A2F66.x, Color_D20A2F66.y, Color_D20A2F66.z, Color_D20A2F66.w);
  return value;
}

float4 BA_Fragment_45_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : INTERP0,
  float4 v2 : INTERP1,
  float3 v3 : INTERP2,
  float3 v4 : INTERP3,
  float3 v5 : INTERP4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = Texture2D_AD649FB.SampleBias(samplerTexture2D_AD649FB, v1.xy, BA_Fragment_45_CB0((uint)(19)).x).xyzw;
  r1.xyzw = Texture2D_59799BE.SampleBias(samplerTexture2D_59799BE, v1.xy, BA_Fragment_45_CB0((uint)(19)).x).xyzw;
  r0.x = r1.w * r0.w;
  r0.yzw = BA_Fragment_45_CB1((uint)(0)).xyz * r1.xyz;
  o0.xyz = v2.xyz * r0.yzw;
  r0.y = v2.w * r0.x + -v1.z;
  r0.x = v2.w * r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#elif !defined(DIRLIGHTMAP_COMBINED) && !defined(FOG_EXP) && !defined(FOG_LINEAR) && defined(LIGHTMAP_ON)
float4 BA_Fragment_46_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(Color_D20A2F66.x, Color_D20A2F66.y, Color_D20A2F66.z, Color_D20A2F66.w);
  return value;
}

float4 BA_Fragment_46_CB0(uint i)
{
  float4 value = 0;
  if (i == 19u) value = float4(_GlobalMipBias.x, _GlobalMipBias.y, 0.0, 0.0);
  return value;
}

void BA_Frag(
  float4 v0 : SV_POSITION0,
  float4 v1 : INTERP0,
  float4 v2 : INTERP1,
  float3 v3 : INTERP2,
  float3 v4 : INTERP3,
  float3 v5 : INTERP4,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = Texture2D_AD649FB.SampleBias(samplerTexture2D_AD649FB, v1.xy, BA_Fragment_46_CB0((uint)(19)).x).xyzw;
  r1.xyzw = Texture2D_59799BE.SampleBias(samplerTexture2D_59799BE, v1.xy, BA_Fragment_46_CB0((uint)(19)).x).xyzw;
  r0.x = r1.w * r0.w;
  r0.yzw = BA_Fragment_46_CB1((uint)(0)).xyz * r1.xyz;
  o0.xyz = v2.xyz * r0.yzw;
  r0.y = v2.w * r0.x + -v1.z;
  r0.x = v2.w * r0.x;
  o0.w = r0.x;
  r0.x = cmp(r0.y < 0);
  if (r0.x != 0) discard;
  return;
}
#else
// UNAVAILABLE_ORIGINAL_COMBINATION: diagnostic only; stripped before player build.
void BA_Frag(out float4 color : SV_TARGET0) { color = float4(1,0,1,1); }
#endif
