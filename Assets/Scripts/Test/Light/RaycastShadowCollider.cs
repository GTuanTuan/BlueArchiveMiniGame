using UnityEngine;
using System.Collections.Generic;

public class RaycastShadowCollider : MonoBehaviour
{
    public Light spotLight;
    public List<GameObject> shadowCasters = new List<GameObject>();
    public LayerMask shadowCasterLayer;
    public LayerMask shadowReceiverLayer;
    public float maxShadowDistance = 10f;
    public PolygonCollider2D shadowCollider;

    void Start()
    {
        UpdateShadowColliders();
    }

    void Update()
    {
        //UpdateShadowCollider();
    }
    void UpdateShadowColliders()
    {
        foreach (var shadowCaster in shadowCasters)
        {
            UpdateShadowCollider(shadowCaster);
        }
    }
    void UpdateShadowCollider(GameObject shadowCaster)
    {
        List<Vector2> shadowPoints = new List<Vector2>();

        // 获取阴影投射器的边界点（世界坐标）
        Vector3[] worldBoundPoints = GetBoundPoints(shadowCaster);

        foreach (Vector3 worldPoint in worldBoundPoints)
        {
            // 方向：从灯光指向边界点
            Vector3 toPoint = (worldPoint - spotLight.transform.position).normalized;

            // 创建从灯光位置发出的射线
            Ray ray = new Ray(spotLight.transform.position, toPoint);
            RaycastHit hit;

            // 调试：显示射线方向
            Debug.DrawRay(spotLight.transform.position, toPoint * maxShadowDistance, Color.yellow);

            if (Physics.Raycast(ray, out hit, maxShadowDistance, shadowReceiverLayer))
            {
                // 检查是否击中了阴影投射器
                if (hit.collider.gameObject == gameObject)
                {
                    // 将世界坐标的碰撞点转换到阴影碰撞器的本地坐标
                    Vector3 localHit = shadowCollider.transform.InverseTransformPoint(hit.point);
                    shadowPoints.Add(new Vector2(localHit.x, localHit.y));

                    // 调试：在碰撞点创建小球
                   // GameObject sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere);
                    //sphere.transform.position = hit.point;
                   // sphere.transform.localScale = Vector3.one * 0.1f;
                    //Destroy(sphere, 0.1f);
                }
            }
            //else
            //{
            //    // 如果没有击中，使用最大距离的点
            //    Vector3 maxPoint = spotLight.transform.position + toPoint * maxShadowDistance;
            //    Vector3 localMaxPoint = shadowCollider.transform.InverseTransformPoint(maxPoint);
            //    shadowPoints.Add(new Vector2(localMaxPoint.x, localMaxPoint.y));

            //    // 调试：在最大距离点创建小球
            //    GameObject sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere);
            //    sphere.transform.position = maxPoint;
            //    sphere.transform.localScale = Vector3.one * 0.1f;
            //    sphere.GetComponent<Renderer>().material.color = Color.blue;
            //    Destroy(sphere, 0.1f);
            //}
        }

        // 设置碰撞器路径
        if (shadowPoints.Count > 2)
        {
            // 对点进行排序以确保正确的多边形
            shadowPoints = SortShadowPoints(shadowPoints);
            shadowCollider.SetPath(0, shadowPoints);
        }
        else
        {
            shadowCollider.pathCount = 0;
        }
    }

    Vector3[] GetBoundPoints(GameObject target)
    {

        Bounds bounds = target.GetComponent<MeshRenderer>().bounds;
        return new Vector3[]
        {
                bounds.min,
                bounds.max,
                new Vector3(bounds.min.x, bounds.min.y, bounds.max.z),
                new Vector3(bounds.min.x, bounds.max.y, bounds.min.z),
                new Vector3(bounds.max.x, bounds.min.y, bounds.min.z),
                new Vector3(bounds.min.x, bounds.max.y, bounds.max.z),
                new Vector3(bounds.max.x, bounds.min.y, bounds.max.z),
                new Vector3(bounds.max.x, bounds.max.y, bounds.min.z)
        };
    }

    //List<Vector2> SortPointsClockwise(List<Vector2> points)
    //{
    //    if (points.Count < 3) return points;

    //    // 计算中心点
    //    Vector2 center = Vector2.zero;
    //    foreach (Vector2 point in points)
    //    {
    //        center += point;
    //    }
    //    center /= points.Count;

    //    // 按角度排序
    //    points.Sort((a, b) =>
    //    {
    //        Vector2 dirA = a - center;
    //        Vector2 dirB = b - center;
    //        float angleA = Mathf.Atan2(dirA.y, dirA.x);
    //        float angleB = Mathf.Atan2(dirB.y, dirB.x);
    //        return angleA.CompareTo(angleB);
    //    });
    //    points.Add(points[points.Count-1]);
    //    return points;
    //}
    List<Vector2> SortPointsClockwise(List<Vector2> points)
    {
        if (points.Count < 3) return points;

        // 方法1：使用凸包算法（推荐）
        List<Vector2> convexHull = ComputeConvexHull(points);
        return convexHull;

        // 或者方法2：改进的角度排序（如果确定是凸多边形）
        // return ImprovedAngleSort(points);
    }

    // 计算凸包 - Graham Scan 算法
    List<Vector2> ComputeConvexHull(List<Vector2> points)
    {
        if (points.Count < 3) return points;

        // 找到最左下角的点作为起点
        Vector2 startPoint = points[0];
        foreach (Vector2 point in points)
        {
            if (point.y < startPoint.y || (point.y == startPoint.y && point.x < startPoint.x))
            {
                startPoint = point;
            }
        }

        // 按极角排序
        List<Vector2> sortedPoints = new List<Vector2>(points);
        sortedPoints.Sort((a, b) =>
        {
            if (a == startPoint) return -1;
            if (b == startPoint) return 1;

            Vector2 dirA = a - startPoint;
            Vector2 dirB = b - startPoint;

            float cross = Cross(dirA, dirB);
            if (Mathf.Abs(cross) < 0.001f) // 共线情况
            {
                return dirA.sqrMagnitude.CompareTo(dirB.sqrMagnitude);
            }
            return cross > 0 ? -1 : 1;
        });

        // 构建凸包
        List<Vector2> hull = new List<Vector2>();
        hull.Add(startPoint);
        hull.Add(sortedPoints[1]);

        for (int i = 2; i < sortedPoints.Count; i++)
        {
            while (hull.Count >= 2)
            {
                Vector2 a = hull[hull.Count - 2];
                Vector2 b = hull[hull.Count - 1];
                Vector2 c = sortedPoints[i];

                if (Cross(b - a, c - a) <= 0)
                {
                    hull.RemoveAt(hull.Count - 1);
                }
                else
                {
                    break;
                }
            }
            hull.Add(sortedPoints[i]);
        }

        return hull;
    }

    // 叉积计算
    float Cross(Vector2 a, Vector2 b)
    {
        return a.x * b.y - a.y * b.x;
    }

    // 改进的角度排序（仅适用于凸多边形）
    List<Vector2> ImprovedAngleSort(List<Vector2> points)
    {
        // 计算中心点
        Vector2 center = Vector2.zero;
        foreach (Vector2 point in points)
        {
            center += point;
        }
        center /= points.Count;

        // 按角度排序，处理相同角度的情况
        points.Sort((a, b) =>
        {
            Vector2 dirA = a - center;
            Vector2 dirB = b - center;

            float angleA = Mathf.Atan2(dirA.y, dirA.x);
            float angleB = Mathf.Atan2(dirB.y, dirB.x);

            // 处理角度接近的情况
            if (Mathf.Abs(angleA - angleB) < 0.001f)
            {
                return dirA.sqrMagnitude.CompareTo(dirB.sqrMagnitude);
            }

            return angleA.CompareTo(angleB);
        });

        return points;
    }

    // 专门为阴影投影点设计的排序方法
    List<Vector2> SortShadowPoints(List<Vector2> points)
    {
        if (points.Count < 3) return points;

        // 对于阴影点，通常形成凸多边形，使用凸包算法
        List<Vector2> hull = ComputeConvexHull(points);

        // 确保点是顺时针顺序（Unity碰撞器需要）
        if (!IsClockwise(hull))
        {
            hull.Reverse();
        }

        return hull;
    }

    // 检查多边形是否是顺时针顺序
    bool IsClockwise(List<Vector2> points)
    {
        float area = 0;
        for (int i = 0; i < points.Count; i++)
        {
            Vector2 current = points[i];
            Vector2 next = points[(i + 1) % points.Count];
            area += (next.x - current.x) * (next.y + current.y);
        }
        return area > 0;
    }
}