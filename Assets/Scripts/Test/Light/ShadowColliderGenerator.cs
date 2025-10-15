using UnityEngine;
using System.Collections.Generic;
using System.Linq;

public class ShadowColliderGenerator : MonoBehaviour
{
    [Header("References")]
    public Camera shadowCamera;
    public RenderTexture shadowRT;
    public PolygonCollider2D polygonCollider;

    [Header("Settings")]
    [Range(0f, 1f)]
    public float shadowThreshold = 0.3f;
    public int gridSize = 2; // 网格大小，越小越精确
    public float simplifyTolerance = 1f;

    private Texture2D processedTexture;

    void Start()
    {
        if (polygonCollider == null)
            polygonCollider = GetComponent<PolygonCollider2D>();

        processedTexture = new Texture2D(shadowRT.width, shadowRT.height, TextureFormat.R8, false);
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

        // 渲染阴影
        shadowCamera.Render();

        // 读取纹理
        RenderTexture.active = shadowRT;
        processedTexture.ReadPixels(new Rect(0, 0, shadowRT.width, shadowRT.height), 0, 0);
        processedTexture.Apply();
        RenderTexture.active = null;

        // 生成轮廓
        List<Vector2> contour = GenerateContourFromTexture();

        if (contour.Count > 2)
        {
            List<Vector2> worldPoints = ConvertToWorldCoordinates(contour);
            polygonCollider.SetPath(0, worldPoints);
            Debug.Log($"Collider generated with {worldPoints.Count} points");
        }
        else
        {
            polygonCollider.pathCount = 0;
            Debug.Log("No contour generated");
        }
    }

    List<Vector2> GenerateContourFromTexture()
    {
        int width = processedTexture.width;
        int height = processedTexture.height;

        // 创建二值化网格
        bool[,] grid = CreateBinaryGrid(width, height);

        // 找到所有边界点
        List<Vector2> boundaryPoints = FindBoundaryPoints(grid);

        // 连接边界点形成轮廓
        List<Vector2> contour = ConnectBoundaryPoints(boundaryPoints);

        return contour;
    }

    bool[,] CreateBinaryGrid(int width, int height)
    {
        bool[,] grid = new bool[width / gridSize, height / gridSize];

        for (int x = 0; x < grid.GetLength(0); x++)
        {
            for (int y = 0; y < grid.GetLength(1); y++)
            {
                int texX = x * gridSize;
                int texY = y * gridSize;
                Color pixel = processedTexture.GetPixel(texX, texY);
                grid[x, y] = pixel.grayscale < shadowThreshold;
            }
        }

        return grid;
    }

    List<Vector2> FindBoundaryPoints(bool[,] grid)
    {
        List<Vector2> boundaryPoints = new List<Vector2>();
        int width = grid.GetLength(0);
        int height = grid.GetLength(1);

        for (int x = 0; x < width; x++)
        {
            for (int y = 0; y < height; y++)
            {
                if (grid[x, y])
                {
                    // 检查是否是边界（有非阴影像素邻居）
                    bool isBoundary = false;

                    // 检查4邻域
                    if (x == 0 || !grid[x - 1, y]) isBoundary = true;
                    else if (x == width - 1 || !grid[x + 1, y]) isBoundary = true;
                    else if (y == 0 || !grid[x, y - 1]) isBoundary = true;
                    else if (y == height - 1 || !grid[x, y + 1]) isBoundary = true;

                    if (isBoundary)
                    {
                        boundaryPoints.Add(new Vector2(x * gridSize, y * gridSize));
                    }
                }
            }
        }

        Debug.Log($"Found {boundaryPoints.Count} boundary points");
        return boundaryPoints;
    }

    List<Vector2> ConnectBoundaryPoints(List<Vector2> points)
    {
        if (points.Count < 3) return points;

        List<Vector2> contour = new List<Vector2>();
        List<Vector2> remaining = new List<Vector2>(points);

        // 找到最左边的点作为起点
        Vector2 start = remaining.OrderBy(p => p.x).First();
        contour.Add(start);
        remaining.Remove(start);

        Vector2 current = start;
        Vector2 previousDirection = Vector2.right;

        int maxIterations = points.Count * 2;
        int iterations = 0;

        while (remaining.Count > 0 && iterations < maxIterations)
        {
            iterations++;

            // 找到与当前方向最一致的下一个点
            float bestScore = float.MinValue;
            Vector2 bestPoint = Vector2.zero;
            int bestIndex = -1;

            for (int i = 0; i < remaining.Count; i++)
            {
                Vector2 toPoint = (remaining[i] - current).normalized;
                float distance = Vector2.Distance(current, remaining[i]);

                // 评分：方向一致性 + 距离权重
                float directionScore = Vector2.Dot(previousDirection, toPoint);
                float distanceScore = 1f / (distance + 0.1f);
                float totalScore = directionScore + distanceScore * 0.1f;

                if (totalScore > bestScore && distance < 50f) // 距离限制
                {
                    bestScore = totalScore;
                    bestPoint = remaining[i];
                    bestIndex = i;
                }
            }

            if (bestIndex >= 0)
            {
                previousDirection = (bestPoint - current).normalized;
                contour.Add(bestPoint);
                remaining.RemoveAt(bestIndex);
                current = bestPoint;
            }
            else
            {
                break;
            }
        }

        // 确保轮廓闭合
        if (contour.Count > 2 && Vector2.Distance(contour[0], contour[contour.Count - 1]) > 30f)
        {
            contour.Add(contour[0]);
        }

        // 简化轮廓
        contour = SimplifyContour(contour);

        Debug.Log($"Connected {contour.Count} points into contour");
        return contour;
    }

    List<Vector2> SimplifyContour(List<Vector2> contour)
    {
        if (contour.Count <= 3) return contour;

        List<Vector2> simplified = new List<Vector2>();
        simplified.Add(contour[0]);

        for (int i = 1; i < contour.Count - 1; i++)
        {
            // 如果角度变化太大，保留这个点
            if (i > 1)
            {
                Vector2 prevDir = (contour[i] - contour[i - 1]).normalized;
                Vector2 nextDir = (contour[i + 1] - contour[i]).normalized;
                float angle = Vector2.Angle(prevDir, nextDir);

                if (angle > 30f) // 角度阈值
                {
                    simplified.Add(contour[i]);
                }
            }
        }

        simplified.Add(contour[contour.Count - 1]);

        return simplified;
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

    // 调试：显示边界点
    void OnDrawGizmosSelected()
    {
        if (processedTexture == null) return;

        Gizmos.color = Color.red;

        // 显示边界点
        bool[,] grid = CreateBinaryGrid(processedTexture.width, processedTexture.height);
        List<Vector2> boundaryPoints = FindBoundaryPoints(grid);

        foreach (Vector2 point in boundaryPoints)
        {
            Vector3 viewportPos = new Vector3(
                point.x / processedTexture.width,
                point.y / processedTexture.height,
                shadowCamera.nearClipPlane
            );
            Vector3 worldPos = shadowCamera.ViewportToWorldPoint(viewportPos);
            Gizmos.DrawSphere(worldPos, 0.02f);
        }

        // 显示碰撞器轮廓
        if (polygonCollider != null && polygonCollider.pathCount > 0)
        {
            Gizmos.color = Color.green;
            Vector2[] path = polygonCollider.GetPath(0);
            for (int i = 0; i < path.Length; i++)
            {
                Vector3 start = path[i];
                Vector3 end = path[(i + 1) % path.Length];
                Gizmos.DrawLine(start, end);
            }
        }
    }
}