// Exact names and types from the original compiled parameter metadata.
#ifndef cmp
#define cmp -
#endif

#if 1
float4 BA_Vertex_124_CB1(uint i)
{
  float4 value = 0;
  if (i == 0u) value = float4(transpose(unity_ObjectToWorld)[0].x, transpose(unity_ObjectToWorld)[0].y, transpose(unity_ObjectToWorld)[0].z, transpose(unity_ObjectToWorld)[0].w);
  if (i == 1u) value = float4(transpose(unity_ObjectToWorld)[1].x, transpose(unity_ObjectToWorld)[1].y, transpose(unity_ObjectToWorld)[1].z, transpose(unity_ObjectToWorld)[1].w);
  if (i == 2u) value = float4(transpose(unity_ObjectToWorld)[2].x, transpose(unity_ObjectToWorld)[2].y, transpose(unity_ObjectToWorld)[2].z, transpose(unity_ObjectToWorld)[2].w);
  if (i == 3u) value = float4(transpose(unity_ObjectToWorld)[3].x, transpose(unity_ObjectToWorld)[3].y, transpose(unity_ObjectToWorld)[3].z, transpose(unity_ObjectToWorld)[3].w);
  return value;
}

float4 BA_Vertex_124_CB0(uint i)
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
  out float4 o0 : SV_POSITION0)
{
  o0 = 0;

  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = BA_Vertex_124_CB1((uint)(1)).xyzw * v0.yyyy;
  r0.xyzw = BA_Vertex_124_CB1((uint)(0)).xyzw * v0.xxxx + r0.xyzw;
  r0.xyzw = BA_Vertex_124_CB1((uint)(2)).xyzw * v0.zzzz + r0.xyzw;
  r0.xyzw = BA_Vertex_124_CB1((uint)(3)).xyzw + r0.xyzw;
  r1.xyzw = BA_Vertex_124_CB0((uint)(74)).xyzw * r0.yyyy;
  r1.xyzw = BA_Vertex_124_CB0((uint)(73)).xyzw * r0.xxxx + r1.xyzw;
  r1.xyzw = BA_Vertex_124_CB0((uint)(75)).xyzw * r0.zzzz + r1.xyzw;
  o0.xyzw = BA_Vertex_124_CB0((uint)(76)).xyzw * r0.wwww + r1.xyzw;
  return;
}
#else
#error Unavailable original progVertex keyword combination
#endif

#if 1

void BA_Frag(
  float4 v0 : SV_POSITION0,
  out float4 o0 : SV_TARGET0)
{
  o0 = 0;

  o0.xyzw = float4(0,0,0,0);
  return;
}
#else
#error Unavailable original progFragment keyword combination
#endif
