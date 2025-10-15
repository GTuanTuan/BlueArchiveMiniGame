using UnityEngine;
using System.Collections.Generic;

public class Dynamic3DTo2DCollider : MonoBehaviour
{
    public Camera mainCamera;
    public GameObject model3D;
    [Range(4, 32)] public int edgeSegments = 16;

    void Start()
    {
        if (mainCamera == null)
            mainCamera = Camera.main;

        Convert3DTo2DCollider();
    }

    void Convert3DTo2DCollider()
    {
        MeshFilter meshFilter = model3D.GetComponent<MeshFilter>();
        if (meshFilter == null) return;

        // 获取网格的所有顶点
        Vector3[] vertices = meshFilter.mesh.vertices;
        int[] triangles = meshFilter.mesh.triangles;

        // 收集所有在轮廓边缘的顶点
        List<Vector2> silhouettePoints = GetSilhouettePoints(vertices, triangles);

        if (silhouettePoints.Count > 2)
        {
            // 创建2D碰撞器
            GameObject obj = new GameObject(gameObject.name + "2D");
            PolygonCollider2D collider2D = obj.AddComponent<PolygonCollider2D>();
            collider2D.points = silhouettePoints.ToArray();

            // 禁用3D碰撞器
            Collider collider3D = model3D.GetComponent<Collider>();
            if (collider3D != null) collider3D.enabled = false;
        }
    }

    List<Vector2> GetSilhouettePoints(Vector3[] vertices, int[] triangles)
    {
        List<Vector2> screenPoints = new List<Vector2>();
        HashSet<Vector2> uniquePoints = new HashSet<Vector2>();

        // 转换所有顶点到屏幕空间
        for (int i = 0; i < vertices.Length; i++)
        {
            Vector3 worldPos = model3D.transform.TransformPoint(vertices[i]);
            Vector2 screenPos = mainCamera.WorldToScreenPoint(worldPos);

            // 只添加在相机前方的点
            if (IsInFrontOfCamera(worldPos))
            {
                uniquePoints.Add(screenPos);
            }
        }

        screenPoints.AddRange(uniquePoints);

        // 计算凸包来获得轮廓
        return CalculateConvexHull(screenPoints);
    }

    bool IsInFrontOfCamera(Vector3 worldPos)
    {
        Vector3 viewportPos = mainCamera.WorldToViewportPoint(worldPos);
        return viewportPos.z > 0;
    }

    // 计算凸包的Graham Scan算法
    List<Vector2> CalculateConvexHull(List<Vector2> points)
    {
        if (points.Count < 3) return points;

        // 找到最左下角的点
        Vector2 pivot = points[0];
        for (int i = 1; i < points.Count; i++)
        {
            if (points[i].y < pivot.y || (points[i].y == pivot.y && points[i].x < pivot.x))
                pivot = points[i];
        }

        // 按极角排序
        points.Sort((a, b) =>
        {
            float angleA = Mathf.Atan2(a.y - pivot.y, a.x - pivot.x);
            float angleB = Mathf.Atan2(b.y - pivot.y, b.x - pivot.x);

            if (angleA < angleB) return -1;
            if (angleA > angleB) return 1;

            // 如果角度相同，按距离排序
            float distA = (a - pivot).sqrMagnitude;
            float distB = (b - pivot).sqrMagnitude;
            return distA.CompareTo(distB);
        });

        // Graham Scan算法
        List<Vector2> hull = new List<Vector2>();
        hull.Add(points[0]);
        hull.Add(points[1]);

        for (int i = 2; i < points.Count; i++)
        {
            while (hull.Count >= 2)
            {
                Vector2 a = hull[hull.Count - 2];
                Vector2 b = hull[hull.Count - 1];
                Vector2 c = points[i];

                if (Cross(b - a, c - b) <= 0)
                    hull.RemoveAt(hull.Count - 1);
                else
                    break;
            }
            hull.Add(points[i]);
        }

        return hull;
    }

    float Cross(Vector2 a, Vector2 b)
    {
        return a.x * b.y - a.y * b.x;
    }
}