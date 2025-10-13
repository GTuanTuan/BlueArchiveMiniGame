using UnityEngine;
using System.Collections.Generic;

public class RaycastShadowCollider : MonoBehaviour
{
    public Light spotLight;          // 聚光灯
    public GameObject shadowCaster;  // 投射阴影的物体
    public int rayCount = 36;        // 光线数量
    public float maxShadowDistance = 10f;

    private PolygonCollider2D shadowCollider;

    void Start()
    {
        shadowCollider = GetComponent<PolygonCollider2D>();
        if (shadowCollider == null)
            shadowCollider = gameObject.AddComponent<PolygonCollider2D>();
    }

    void Update()
    {
        UpdateShadowCollider();
    }

    void UpdateShadowCollider()
    {
        List<Vector2> shadowPoints = new List<Vector2>();

        // 从物体边界点向灯光方向投射光线
        Bounds bounds = shadowCaster.GetComponent<Renderer>().bounds;
        Vector3[] boundPoints = GetBoundPoints(bounds);

        foreach (Vector3 point in boundPoints)
        {
            Vector3 toLight = (spotLight.transform.position - point).normalized;
            Ray ray = new Ray(point, toLight);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit, maxShadowDistance))
            {
                if (hit.collider.gameObject == gameObject) // 击中墙面
                {
                    // 转换到墙面的局部坐标系
                    Vector3 localHit = transform.InverseTransformPoint(hit.point);
                    shadowPoints.Add(new Vector2(localHit.x, localHit.y));
                }
            }
        }

        // 对点进行排序，形成凸包
        if (shadowPoints.Count > 2)
        {
            List<Vector2> convexHull = ComputeConvexHull(shadowPoints);
            shadowCollider.SetPath(0, convexHull);
        }
    }

    Vector3[] GetBoundPoints(Bounds bounds)
    {
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

    // 凸包算法（Graham Scan）
    List<Vector2> ComputeConvexHull(List<Vector2> points)
    {
        if (points.Count < 3) return points;

        // 实现凸包算法...
        // 这里可以使用Unity的Collider2D.CreatePrimitive或者第三方库
        return points; // 简化返回
    }
}