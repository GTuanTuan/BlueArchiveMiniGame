using UnityEngine;
using System.Collections.Generic;

public class SimpleShadowCollider : MonoBehaviour
{
    [Header("References")]
    public Camera shadowCamera;
    public RenderTexture shadowRT;
    public PolygonCollider2D polygonCollider;

    [Header("Settings")]
    [Range(0f, 1f)]
    public float shadowThreshold = 0.3f;
    public int downSample = 4; // 降低采样率提高性能
    public float minShadowSize = 0.1f; // 最小阴影尺寸

    private Texture2D processedTexture;
    private bool[,] shadowGrid;

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

        // 渲染阴影
        shadowCamera.Render();

        // 读取纹理
        RenderTexture.active = shadowRT;
        processedTexture.ReadPixels(new Rect(0, 0, shadowRT.width, shadowRT.height), 0, 0);
        processedTexture.Apply();
        RenderTexture.active = null;

        // 生成碰撞体
        GenerateColliderFromTexture();
    }

    void GenerateColliderFromTexture()
    {
        int width = processedTexture.width / downSample;
        int height = processedTexture.height / downSample;

        // 创建阴影网格
        shadowGrid = new bool[width, height];

        // 采样纹理
        for (int x = 0; x < width; x++)
        {
            for (int y = 0; y < height; y++)
            {
                int texX = x * downSample;
                int texY = y * downSample;
                Color pixel = processedTexture.GetPixel(texX, texY);
                shadowGrid[x, y] = pixel.grayscale < shadowThreshold;
            }
        }

        // 找到所有阴影区域
        List<List<Vector2>> shadowRegions = FindShadowRegions();

        // 设置碰撞器路径
        if (shadowRegions.Count > 0)
        {
            polygonCollider.pathCount = shadowRegions.Count;
            for (int i = 0; i < shadowRegions.Count; i++)
            {
                List<Vector2> worldPoints = ConvertToWorldCoordinates(shadowRegions[i]);
                polygonCollider.SetPath(i, worldPoints);
            }
            Debug.Log($"Generated {shadowRegions.Count} shadow colliders");
        }
        else
        {
            polygonCollider.pathCount = 0;
            Debug.Log("No shadow regions found");
        }
    }

    List<List<Vector2>> FindShadowRegions()
    {
        List<List<Vector2>> regions = new List<List<Vector2>>();
        bool[,] visited = new bool[shadowGrid.GetLength(0), shadowGrid.GetLength(1)];

        for (int x = 0; x < shadowGrid.GetLength(0); x++)
        {
            for (int y = 0; y < shadowGrid.GetLength(1); y++)
            {
                if (shadowGrid[x, y] && !visited[x, y])
                {
                    // 找到连续的阴影区域
                    List<Vector2Int> regionPixels = FloodFill(x, y, visited);

                    if (regionPixels.Count >= minShadowSize * (shadowGrid.GetLength(0) * shadowGrid.GetLength(1)))
                    {
                        // 转换为边界框
                        List<Vector2> bounds = GetBoundingBox(regionPixels);
                        regions.Add(bounds);
                    }
                }
            }
        }

        return regions;
    }

    List<Vector2Int> FloodFill(int startX, int startY, bool[,] visited)
    {
        List<Vector2Int> region = new List<Vector2Int>();
        Queue<Vector2Int> queue = new Queue<Vector2Int>();

        queue.Enqueue(new Vector2Int(startX, startY));
        visited[startX, startY] = true;

        while (queue.Count > 0)
        {
            Vector2Int current = queue.Dequeue();
            region.Add(current);

            // 检查4个方向的邻居
            CheckNeighbor(current.x + 1, current.y, visited, queue);
            CheckNeighbor(current.x - 1, current.y, visited, queue);
            CheckNeighbor(current.x, current.y + 1, visited, queue);
            CheckNeighbor(current.x, current.y - 1, visited, queue);
        }

        return region;
    }

    void CheckNeighbor(int x, int y, bool[,] visited, Queue<Vector2Int> queue)
    {
        if (x >= 0 && x < shadowGrid.GetLength(0) && y >= 0 && y < shadowGrid.GetLength(1))
        {
            if (shadowGrid[x, y] && !visited[x, y])
            {
                visited[x, y] = true;
                queue.Enqueue(new Vector2Int(x, y));
            }
        }
    }

    List<Vector2> GetBoundingBox(List<Vector2Int> pixels)
    {
        if (pixels.Count == 0) return new List<Vector2>();

        // 找到边界
        int minX = int.MaxValue, maxX = int.MinValue;
        int minY = int.MaxValue, maxY = int.MinValue;

        foreach (Vector2Int pixel in pixels)
        {
            if (pixel.x < minX) minX = pixel.x;
            if (pixel.x > maxX) maxX = pixel.x;
            if (pixel.y < minY) minY = pixel.y;
            if (pixel.y > maxY) maxY = pixel.y;
        }

        // 创建矩形边界
        List<Vector2> bounds = new List<Vector2>
        {
            new Vector2(minX * downSample, minY * downSample),
            new Vector2(maxX * downSample, minY * downSample),
            new Vector2(maxX * downSample, maxY * downSample),
            new Vector2(minX * downSample, maxY * downSample)
        };

        return bounds;
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

    // 调试：在Scene视图中显示阴影区域
    void OnDrawGizmosSelected()
    {
        if (shadowGrid == null) return;

        Gizmos.color = Color.red;
        float cellSizeX = 1f / shadowGrid.GetLength(0);
        float cellSizeY = 1f / shadowGrid.GetLength(1);

        for (int x = 0; x < shadowGrid.GetLength(0); x++)
        {
            for (int y = 0; y < shadowGrid.GetLength(1); y++)
            {
                if (shadowGrid[x, y])
                {
                    Vector3 viewportPos = new Vector3(
                        (x + 0.5f) * cellSizeX,
                        (y + 0.5f) * cellSizeY,
                        shadowCamera.nearClipPlane
                    );
                    Vector3 worldPos = shadowCamera.ViewportToWorldPoint(viewportPos);
                    Gizmos.DrawWireCube(worldPos, new Vector3(cellSizeX, cellSizeY, 0.1f));
                }
            }
        }
    }

    [ContextMenu("Debug Shadow Info")]
    void DebugShadowInfo()
    {
        shadowCamera.Render();
        RenderTexture.active = shadowRT;
        processedTexture.ReadPixels(new Rect(0, 0, shadowRT.width, shadowRT.height), 0, 0);
        processedTexture.Apply();
        RenderTexture.active = null;

        int shadowPixels = 0;
        int totalPixels = processedTexture.width * processedTexture.height;

        for (int x = 0; x < processedTexture.width; x += 10)
        {
            for (int y = 0; y < processedTexture.height; y += 10)
            {
                if (processedTexture.GetPixel(x, y).grayscale < shadowThreshold)
                    shadowPixels++;
            }
        }

        Debug.Log($"Shadow coverage: {shadowPixels}/{(totalPixels / 100)} ({(float)shadowPixels / (totalPixels / 100) * 100f:F1}%)");
        Debug.Log($"Texture size: {processedTexture.width}x{processedTexture.height}");
    }
}