using UnityEngine;
using System.Collections.Generic;
using System.Linq;

public class MarchingSquaresShadowCollider : MonoBehaviour
{
    [Header("References")]
    public Camera shadowCamera;
    public RenderTexture shadowRT;
    public PolygonCollider2D polygonCollider;

    [Header("Settings")]
    [Range(0f, 1f)]
    public float shadowThreshold = 0.5f;
    public int gridResolution = 40;
    public float minContourArea = 50f;
    public float maxGapDistance = 20f;

    private Texture2D processedTexture;
    private List<List<Vector2>> separateContours = new List<List<Vector2>>();

    void Start()
    {
        if (polygonCollider == null)
            polygonCollider = GetComponent<PolygonCollider2D>();

        processedTexture = new Texture2D(shadowRT.width, shadowRT.height, TextureFormat.RGBA32, false);
        GenerateCollider();
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            GenerateCollider();
        }
    }

    [ContextMenu("Generate Collider")]
    public void GenerateCollider()
    {
        if (shadowCamera == null || shadowRT == null) return;

        // 渲染并读取纹理
        shadowCamera.Render();
        RenderTexture.active = shadowRT;
        processedTexture.ReadPixels(new Rect(0, 0, shadowRT.width, shadowRT.height), 0, 0);
        processedTexture.Apply();
        RenderTexture.active = null;

        // 找到所有独立的轮廓
        separateContours = FindSeparateContours();

        // 设置多边形碰撞器路径
        if (separateContours.Count > 0)
        {
            polygonCollider.pathCount = separateContours.Count;

            for (int i = 0; i < separateContours.Count; i++)
            {
                List<Vector2> worldPoints = ConvertToWorldCoordinates(separateContours[i]);
                polygonCollider.SetPath(i, worldPoints);
            }

            Debug.Log($"Created {separateContours.Count} separate collider paths");
        }
        else
        {
            polygonCollider.pathCount = 0;
            Debug.LogWarning("No contours found");
        }
    }

    List<List<Vector2>> FindSeparateContours()
    {
        List<Vector2> allEdgePoints = ExtractEdgePoints();
        List<List<Vector2>> contours = new List<List<Vector2>>();

        // 使用区域生长算法找到独立的轮廓
        List<Vector2> unassignedPoints = new List<Vector2>(allEdgePoints);

        while (unassignedPoints.Count > 0)
        {
            List<Vector2> currentContour = new List<Vector2>();
            Queue<Vector2> pointsToProcess = new Queue<Vector2>();

            // 从第一个未分配的点开始
            pointsToProcess.Enqueue(unassignedPoints[0]);
            unassignedPoints.RemoveAt(0);

            while (pointsToProcess.Count > 0)
            {
                Vector2 current = pointsToProcess.Dequeue();
                currentContour.Add(current);

                // 查找附近的点
                for (int i = unassignedPoints.Count - 1; i >= 0; i--)
                {
                    if (Vector2.Distance(current, unassignedPoints[i]) <= maxGapDistance)
                    {
                        pointsToProcess.Enqueue(unassignedPoints[i]);
                        unassignedPoints.RemoveAt(i);
                    }
                }
            }

            // 连接轮廓点并过滤小区域
            if (currentContour.Count > 3)
            {
                List<Vector2> connectedContour = ConnectContourPoints(currentContour);
                float area = CalculateContourArea(connectedContour);

                if (area >= minContourArea)
                {
                    contours.Add(connectedContour);
                }
            }
        }

        Debug.Log($"Found {contours.Count} separate contours");
        return contours;
    }

    List<Vector2> ExtractEdgePoints()
    {
        List<Vector2> points = new List<Vector2>();
        int width = processedTexture.width;
        int height = processedTexture.height;
        int step = Mathf.Max(width, height) / gridResolution;

        // 扫描整个纹理寻找阴影边缘
        for (int x = step; x < width - step; x += step)
        {
            for (int y = step; y < height - step; y += step)
            {
                if (IsEdgePoint(x, y, step))
                {
                    points.Add(new Vector2(x, y));
                }
            }
        }

        Debug.Log($"Found {points.Count} edge points");
        return points;
    }

    bool IsEdgePoint(int x, int y, int step)
    {
        Color center = processedTexture.GetPixel(x, y);
        bool isShadow = center.grayscale < shadowThreshold;

        if (!isShadow) return false;

        // 检查8邻域是否有非阴影点
        for (int dx = -step; dx <= step; dx += step)
        {
            for (int dy = -step; dy <= step; dy += step)
            {
                if (dx == 0 && dy == 0) continue;

                int nx = x + dx;
                int ny = y + dy;

                if (nx >= 0 && nx < processedTexture.width && ny >= 0 && ny < processedTexture.height)
                {
                    Color neighbor = processedTexture.GetPixel(nx, ny);
                    if (neighbor.grayscale >= shadowThreshold)
                    {
                        return true;
                    }
                }
            }
        }

        return false;
    }

    List<Vector2> ConnectContourPoints(List<Vector2> points)
    {
        if (points.Count < 3) return points;

        List<Vector2> connected = new List<Vector2>();
        List<Vector2> remaining = new List<Vector2>(points);

        // 找到最左边的点作为起点
        Vector2 start = remaining.OrderBy(p => p.x).First();
        connected.Add(start);
        remaining.Remove(start);

        Vector2 current = start;

        // 按顺时针方向连接点
        while (remaining.Count > 0)
        {
            // 找到与当前点角度变化最小的点
            float bestAngle = float.MaxValue;
            Vector2 bestPoint = remaining[0];
            int bestIndex = 0;

            Vector2 prevDir = connected.Count > 1 ?
                (current - connected[connected.Count - 2]).normalized :
                Vector2.right;

            for (int i = 0; i < remaining.Count; i++)
            {
                Vector2 toNext = (remaining[i] - current).normalized;
                float angle = Vector2.SignedAngle(prevDir, toNext);

                // 优先选择向右转的点（顺时针）
                if (angle < bestAngle && angle >= 0)
                {
                    bestAngle = angle;
                    bestPoint = remaining[i];
                    bestIndex = i;
                }
            }

            // 如果没有找到合适的点，选择最近的点
            if (bestAngle == float.MaxValue)
            {
                bestPoint = remaining.OrderBy(p => Vector2.Distance(current, p)).First();
                bestIndex = remaining.IndexOf(bestPoint);
            }

            connected.Add(bestPoint);
            remaining.RemoveAt(bestIndex);
            current = bestPoint;
        }

        // 确保轮廓闭合
        if (Vector2.Distance(connected[0], connected[connected.Count - 1]) > maxGapDistance)
        {
            connected.Add(connected[0]);
        }

        return connected;
    }

    float CalculateContourArea(List<Vector2> points)
    {
        if (points.Count < 3) return 0f;

        float area = 0f;
        int n = points.Count;

        for (int i = 0; i < n; i++)
        {
            Vector2 current = points[i];
            Vector2 next = points[(i + 1) % n];
            area += (current.x * next.y) - (next.x * current.y);
        }

        return Mathf.Abs(area / 2f);
    }

    List<Vector2> ConvertToWorldCoordinates(List<Vector2> texturePoints)
    {
        List<Vector2> worldPoints = new List<Vector2>();

        foreach (Vector2 texCoord in texturePoints)
        {
            Vector3 viewportPos = new Vector3(
                texCoord.x / processedTexture.width,
                texCoord.y / processedTexture.height,
                shadowCamera.nearClipPlane
            );

            Vector3 worldPos = shadowCamera.ViewportToWorldPoint(viewportPos);
            worldPoints.Add(new Vector2(worldPos.x, worldPos.y));
        }

        return worldPoints;
    }

    // 调试可视化
    void OnDrawGizmosSelected()
    {
        if (separateContours == null) return;

        Color[] colors = { Color.red, Color.green, Color.blue, Color.yellow, Color.cyan, Color.magenta };

        for (int i = 0; i < separateContours.Count; i++)
        {
            Gizmos.color = colors[i % colors.Length];
            List<Vector2> contour = separateContours[i];

            foreach (Vector2 point in contour)
            {
                Vector3 viewportPos = new Vector3(
                    point.x / processedTexture.width,
                    point.y / processedTexture.height,
                    shadowCamera.nearClipPlane
                );
                Vector3 worldPos = shadowCamera.ViewportToWorldPoint(viewportPos);
                Gizmos.DrawSphere(worldPos, 0.05f);
            }

            // 绘制轮廓线
            if (contour.Count > 1)
            {
                for (int j = 0; j < contour.Count; j++)
                {
                    Vector2 start = contour[j];
                    Vector2 end = contour[(j + 1) % contour.Count];

                    Vector3 startWorld = shadowCamera.ViewportToWorldPoint(new Vector3(
                        start.x / processedTexture.width,
                        start.y / processedTexture.height,
                        shadowCamera.nearClipPlane
                    ));
                    Vector3 endWorld = shadowCamera.ViewportToWorldPoint(new Vector3(
                        end.x / processedTexture.width,
                        end.y / processedTexture.height,
                        shadowCamera.nearClipPlane
                    ));

                    Gizmos.DrawLine(startWorld, endWorld);
                }
            }
        }
    }

    [ContextMenu("Debug Contour Info")]
    void DebugContourInfo()
    {
        shadowCamera.Render();
        RenderTexture.active = shadowRT;
        processedTexture.ReadPixels(new Rect(0, 0, shadowRT.width, shadowRT.height), 0, 0);
        processedTexture.Apply();
        RenderTexture.active = null;

        List<List<Vector2>> contours = FindSeparateContours();

        for (int i = 0; i < contours.Count; i++)
        {
            float area = CalculateContourArea(contours[i]);
            Debug.Log($"Contour {i}: {contours[i].Count} points, area: {area}");
        }
    }
}