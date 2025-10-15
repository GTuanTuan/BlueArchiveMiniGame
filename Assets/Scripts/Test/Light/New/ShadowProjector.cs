using UnityEngine;
using System.Collections.Generic;

[System.Serializable]
public class ShadowProjector
{
    public Light lightSource;
    public Transform projectionWall;
    public LayerMask obstacleMask;

    private Vector3 wallNormal;
    private Vector3 wallPosition;

    public ShadowProjector(Light light, Transform wall, LayerMask obstacleMask)
    {
        this.lightSource = light;
        this.projectionWall = wall;
        this.obstacleMask = obstacleMask;
        CalculateWallPlane();
    }

    public ProjectedMesh ProjectMeshToWall(GameObject shadowCaster)
    {
        var meshFilter = shadowCaster.GetComponent<MeshFilter>();
        if (meshFilter == null) return new ProjectedMesh();

        var mesh = meshFilter.mesh;
        var vertices = mesh.vertices;
        var triangles = mesh.triangles;

        List<Vector3> projectedVertices = new List<Vector3>();
        List<int> projectedTriangles = new List<int>();

        // 投影每个顶点
        for (int i = 0; i < vertices.Length; i++)
        {
            Vector3 worldVertex = shadowCaster.transform.TransformPoint(vertices[i]);
            Vector3 projectedVertex = ProjectPoint(worldVertex);

            if (!IsObstructed(worldVertex, projectedVertex))
            {
                projectedVertices.Add(projectedVertex);
            }
        }

        // 重新构建三角形（简化版本）
        // 实际应该使用更复杂的三角化算法
        for (int i = 0; i < triangles.Length; i += 3)
        {
            if (IsValidTriangle(projectedVertices, triangles, i))
            {
                projectedTriangles.Add(triangles[i]);
                projectedTriangles.Add(triangles[i + 1]);
                projectedTriangles.Add(triangles[i + 2]);
            }
        }

        return new ProjectedMesh
        {
            vertices = projectedVertices,
            triangles = projectedTriangles.ToArray(),
            sourceObject = shadowCaster
        };
    }

    Vector3 ProjectPoint(Vector3 worldPoint)
    {
        Vector3 lightDirection = GetLightDirection(worldPoint);
        return IntersectWithWall(worldPoint, lightDirection);
    }

    Vector3 GetLightDirection(Vector3 targetPoint)
    {
        if (lightSource.type == LightType.Directional)
        {
            return -lightSource.transform.forward;
        }
        else
        {
            return (targetPoint - lightSource.transform.position).normalized;
        }
    }

    Vector3 IntersectWithWall(Vector3 point, Vector3 direction)
    {
        float denominator = Vector3.Dot(direction, wallNormal);

        if (Mathf.Abs(denominator) < 0.0001f)
            return point;

        float t = Vector3.Dot(wallPosition - point, wallNormal) / denominator;
        return point + direction * t;
    }

    bool IsObstructed(Vector3 start, Vector3 end)
    {
        Vector3 direction = (end - start).normalized;
        float distance = Vector3.Distance(start, end);

        RaycastHit hit;
        if (Physics.Raycast(start, direction, out hit, distance, obstacleMask))
        {
            return hit.collider.gameObject != projectionWall.gameObject;
        }

        return false;
    }

    bool IsValidTriangle(List<Vector3> vertices, int[] triangles, int startIndex)
    {
        int i1 = triangles[startIndex];
        int i2 = triangles[startIndex + 1];
        int i3 = triangles[startIndex + 2];

        return i1 < vertices.Count && i2 < vertices.Count && i3 < vertices.Count;
    }

    void CalculateWallPlane()
    {
        if (projectionWall != null)
        {
            wallPosition = projectionWall.position;
            wallNormal = -projectionWall.forward;
        }
    }
}

[System.Serializable]
public struct ProjectedMesh
{
    public List<Vector3> vertices;
    public int[] triangles;
    public GameObject sourceObject;

    public bool IsValid => vertices != null && vertices.Count >= 3;
}