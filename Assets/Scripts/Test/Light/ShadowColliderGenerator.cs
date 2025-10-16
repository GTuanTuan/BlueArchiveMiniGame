using UnityEngine;
using System.Collections.Generic;
using System.Linq;

public class ShadowColliderGenerator : MonoBehaviour
{
    public Camera shadowCamera;
    public RenderTexture shadowRT;

    [Range(0f, 1f)]
    public float shadowThreshold = 0.1f;
    public int gridSize = 2; // 网格大小，越小越精确
    public float simplifyTolerance = 1f;

    private Texture2D processedTexture;

    void Start()
    {
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

        ReadRenderTexture();

    }
    void ReadRenderTexture()
    {
        if (shadowCamera == null || shadowRT == null) return;
        shadowCamera.Render();
        RenderTexture.active = shadowRT;
        processedTexture.ReadPixels(new Rect(0, 0, shadowRT.width, shadowRT.height), 0, 0);
        processedTexture.Apply();
        RenderTexture.active = null;
        Color[] pixels = processedTexture.GetPixels();
        float[,] grid = new float[shadowRT.width, shadowRT.height];
        for (int y = 0; y < shadowRT.height; y++)
        {
            for (int x = 0; x < shadowRT.width; x++)
            {
                // 只取R通道（因为是灰度图，RGB值相同）
                grid[x, y] = pixels[y * shadowRT.width + x].r;
            }
        }

        Debug.Log($"{grid[0, shadowRT.height - 1]:F3}, {grid[shadowRT.width - 1, 0]:F3}");
        AnalyzeWithMarchingSquares(grid, shadowThreshold);
    }
    void AnalyzeWithMarchingSquares(float[,] grid, float checkValue)
    {
        //List<Vector2> allEdgePoints = CollectAllEdgePoints(grid, checkValue);
        //List<Vector2> contour = ImprovedContourConnection(allEdgePoints);
        //UpdatePolygonCollider(allEdgePoints, grid.GetLength(0), grid.GetLength(1));

        //Debug.Log("Marching Squares处理完成");

        // 使用正确的轮廓跟踪
        int width = grid.GetLength(0);
        int height = grid.GetLength(1);

        // 使用正确的轮廓跟踪
        List<List<Vector2>> contours = GenerateContours(grid, checkValue, width, height);

        // 过滤掉点太少的轮廓
        List<List<Vector2>> validContours = contours;
        //List<List<Vector2>> validContours = contours.Where(c => c.Count > 10).ToList();

        Debug.Log($"生成 {contours.Count} 个轮廓，有效轮廓 {validContours.Count} 个");

        // 显示每个轮廓的信息
        for (int i = 0; i < Mathf.Min(5, validContours.Count); i++) // 只显示前5个
        {
            Debug.Log($"轮廓 {i}: {validContours[i].Count} 个点");
        }

        // 使用所有有效轮廓创建碰撞体
        UpdatePolygonCollider(validContours, width, height);

        Debug.Log("Marching Squares处理完成");
    }

    List<Vector2> ConvertToWorldCoordinates(List<Vector2> texturePoints, int textureWidth, int textureHeight)
    {
        List<Vector2> worldPoints = new List<Vector2>();

        foreach (Vector2 texCoord in texturePoints)
        {
            // 将纹理坐标归一化到 [0,1] 范围
            Vector2 normalizedCoord = new Vector2(
                texCoord.x / textureWidth,
                texCoord.y / textureHeight
            );

            // 将归一化坐标转换到世界坐标
            // 假设墙的本地坐标范围是 [0,0] 到 [1,1]
            Vector2 worldPoint = normalizedCoord;

            worldPoints.Add(worldPoint);
        }

        return worldPoints;
    }

    /// <summary>
    /// 创建或更新PolygonCollider2D（支持多个轮廓）
    /// </summary>
    void UpdatePolygonCollider(List<List<Vector2>> contours, int textureWidth, int textureHeight)
    {
        // 获取或添加PolygonCollider2D组件
        PolygonCollider2D polygonCollider = GetComponent<PolygonCollider2D>();
        if (polygonCollider == null)
        {
            polygonCollider = gameObject.AddComponent<PolygonCollider2D>();
            Debug.Log("添加PolygonCollider2D组件");
        }

        if (contours.Count > 0)
        {
            // 设置轮廓数量
            polygonCollider.pathCount = contours.Count;

            int totalPoints = 0;

            for (int i = 0; i < contours.Count; i++)
            {
                if (contours[i].Count > 2)
                {
                    // 转换坐标
                    List<Vector2> worldPoints = ConvertToWorldCoordinates(contours[i], textureWidth, textureHeight);

                    // 设置当前轮廓路径
                    polygonCollider.SetPath(i, worldPoints);

                    totalPoints += worldPoints.Count;

                    Debug.Log($"轮廓 {i}: {worldPoints.Count} 个点");
                }
                else
                {
                    // 点太少，设置空路径
                    polygonCollider.SetPath(i, new Vector2[0]);
                }
            }

            Debug.Log($"碰撞体创建成功: {contours.Count} 个轮廓，共 {totalPoints} 个顶点");

            // 显示碰撞体边界信息
            Bounds bounds = polygonCollider.bounds;
            Debug.Log($"碰撞体边界: 中心({bounds.center.x:F2}, {bounds.center.y:F2}), 大小({bounds.size.x:F2}, {bounds.size.y:F2})");
        }
        else
        {
            polygonCollider.pathCount = 0;
            Debug.Log("没有有效轮廓，清除碰撞体");
        }
    }
    List<Vector2> ImprovedContourConnection(List<Vector2> points)
    {
        if (points.Count < 3)
        {
            Debug.Log("点太少，无法形成轮廓");
            return new List<Vector2>();
        }

        // 方法1：直接返回原始点（按细胞顺序）
        Debug.Log($"直接返回 {points.Count} 个点（未排序）");
        return points;

        // 或者方法2：简单的按Y然后X排序
        // List<Vector2> sorted = points.OrderBy(p => p.y).ThenBy(p => p.x).ToList();
        // return sorted;
    }
   
    List<Vector2> CollectAllEdgePoints(float[,] grid, float checkValue)
    {
        List<Vector2> allEdgePoints = new List<Vector2>();
        for (int y = 0; y < grid.GetLength(1) - 1; y++)
        {
            for (int x = 0; x < grid.GetLength(0) - 1; x++)
            {
                int cellstate = CalculateCellState(x, y, grid, checkValue);
                if (cellstate != 0 && cellstate != 15)
                {
                    List<Vector2> edgePoints = FindEdgePointsInCell(x, y, cellstate, grid, checkValue);
                    allEdgePoints.AddRange(edgePoints);
                }
            }
        }
        Debug.Log($"收集到 {allEdgePoints.Count} 个等值点");

        // 显示前10个点作为示例
        for (int i = 0; i < Mathf.Min(10, allEdgePoints.Count); i++)
        {
            Debug.Log($"点 {i}: ({allEdgePoints[i].x:F2}, {allEdgePoints[i].y:F2})");
        }
        return allEdgePoints;
    }
    List<Vector2> FindEdgePointsInCell(int x, int y, int cellState, float[,] grid, float checkValue)
    {
        List<Vector2> edges = new List<Vector2>();
        bool p0 = (cellState & 1) != 0;
        bool p1 = (cellState & 2) != 0;
        bool p2 = (cellState & 4) != 0;
        bool p3 = (cellState & 8) != 0;
        if (p0 != p1)
        {
            Vector2 point = CalculateEdgePoint(x, y,CellEdge.Bottom, grid, checkValue);
            edges.Add(point);
        }
        if (p1 != p2)
        {
            Vector2 point = CalculateEdgePoint(x, y, CellEdge.Right, grid, checkValue);
            edges.Add(point);
        }
        if (p2 != p3)
        {
            Vector2 point = CalculateEdgePoint(x, y, CellEdge.Top, grid, checkValue);
            edges.Add(point);
        }
        if (p3 != p0)
        {
            Vector2 point = CalculateEdgePoint(x, y, CellEdge.Left, grid, checkValue);
            edges.Add(point);
        }
        return edges;
    }
    Vector2 CalculateEdgePoint(int x, int y, CellEdge cellEdge, float[,] grid, float checkValue)
    {
        Vector2 p1 = Vector2.zero, p2 = Vector2.zero;
        float v1 = 0, v2 = 0;
        switch (cellEdge)
        {
            case CellEdge.Bottom:
                p1 = new Vector2(x, y);
                p2 = new Vector2(x+1, y);
                v1 = grid[x, y];
                v2 = grid[x+1, y];
                break;
            case CellEdge.Right:
                p1 = new Vector2(x+1, y);
                p2 = new Vector2(x + 1, y+1);
                v1 = grid[x + 1, y];
                v2 = grid[x + 1, y + 1];
                break;
            case CellEdge.Top:
                p1 = new Vector2(x + 1, y + 1);
                p2 = new Vector2(x , y + 1);
                v1 = grid[x + 1, y + 1];
                v2 = grid[x, y + 1];
                break;
            case CellEdge.Left:
                p1 = new Vector2(x, y + 1);
                p2 = new Vector2(x , y);
                v1 = grid[x, y + 1];
                v2 = grid[x , y];
                break;
            default:
                break;
        }
        float t = (checkValue-v1)/(v2 - v1);
        return Vector2.Lerp(p1, p2, t);
    }
    int CalculateCellState(int x,int y, float[,] grid,float checkValue )
    {
        int state = 0;
        if (grid[x, y] <= checkValue) state |= 1;
        if (grid[x+1, y] <= checkValue) state |= 2;
        if (grid[x+1, y+1] <= checkValue) state |= 4;
        if (grid[x, y + 1] <= checkValue) state |= 8;
        return state;
    }
    /// <summary>
    /// 正确的Marching Squares轮廓生成（带方向跟踪）
    /// </summary>
    List<List<Vector2>> GenerateContours(float[,] grid, float isoLevel, int width, int height)
    {
        List<List<Vector2>> contours = new List<List<Vector2>>();
        bool[,] visited = new bool[width - 1, height - 1];

        for (int y = 0; y < height - 1; y++)
        {
            for (int x = 0; x < width - 1; x++)
            {
                if (visited[x, y]) continue;

                int cellState = CalculateCellState(x, y, grid, isoLevel);

                // 只处理有边界穿过的细胞
                if (cellState > 0 && cellState < 15)
                {
                    List<Vector2> contour = TraceContour(x, y, grid, isoLevel, width, height, visited);
                    if (contour != null && contour.Count > 2)
                    {
                        contours.Add(contour);
                    }
                }
            }
        }

        return contours;
    }

    /// <summary>
    /// 跟踪一个轮廓（按行进方向）
    /// </summary>
    List<Vector2> TraceContour(int startX, int startY, float[,] grid, float isoLevel, int width, int height, bool[,] visited)
    {
        List<Vector2> contour = new List<Vector2>();
        int x = startX;
        int y = startY;
        int entryEdge = 0; // 进入边，从下边开始

        do
        {
            if (x < 0 || x >= width - 1 || y < 0 || y >= height - 1) break;

            visited[x, y] = true;
            int cellState = CalculateCellState(x, y, grid, isoLevel);

            // 根据细胞状态和进入边决定出口边
            int exitEdge = GetExitEdge(cellState, entryEdge);

            if (exitEdge == -1) break;

            // 计算当前边的等值点
            Vector2 point = CalculateEdgePoint(x, y, (CellEdge)exitEdge, grid, isoLevel);
            contour.Add(point);

            // 移动到下一个细胞
            switch (exitEdge)
            {
                case 0: // 从下边出，向下移动
                    y--;
                    entryEdge = 2; // 进入上边
                    break;
                case 1: // 从右边出，向右移动
                    x++;
                    entryEdge = 3; // 进入左边
                    break;
                case 2: // 从上边出，向上移动
                    y++;
                    entryEdge = 0; // 进入下边
                    break;
                case 3: // 从左边出，向左移动
                    x--;
                    entryEdge = 1; // 进入右边
                    break;
            }

        } while (!(x == startX && y == startY) && contour.Count < 1000);

        return contour;
    }

    /// <summary>
    /// 根据细胞状态和进入边获取出口边
    /// </summary>
    int GetExitEdge(int cellState, int entryEdge)
    {
        // 简化的查找表 [细胞状态, 进入边] -> 出口边
        // 这是一个简化版本，实际需要完整的16x4查找表
        switch (cellState)
        {
            case 1:  // 0001
            case 14: // 1110
                return (entryEdge == 0) ? 3 : 0;
            case 2:  // 0010  
            case 13: // 1101
                return (entryEdge == 1) ? 0 : 1;
            case 4:  // 0100
            case 11: // 1011
                return (entryEdge == 2) ? 1 : 2;
            case 8:  // 1000
            case 7:  // 0111
                return (entryEdge == 3) ? 2 : 3;
            case 3:  // 0011
            case 12: // 1100
                return (entryEdge == 0) ? 1 : 0;
            case 6:  // 0110
            case 9:  // 1001
                return (entryEdge == 1) ? 2 : 1;
            default:
                return -1;
        }
    }
    // 在类末尾添加Gizmos方法（支持多个轮廓）
    void OnDrawGizmosSelected()
    {
        PolygonCollider2D polygonCollider = GetComponent<PolygonCollider2D>();
        if (polygonCollider != null && polygonCollider.pathCount > 0)
        {
            for (int pathIndex = 0; pathIndex < polygonCollider.pathCount; pathIndex++)
            {
                Vector2[] path = polygonCollider.GetPath(pathIndex);

                if (path.Length < 3) continue;

                // 每个轮廓用不同颜色
                Color[] colors = { Color.green, Color.blue, Color.yellow, Color.cyan, Color.magenta };
                Gizmos.color = colors[pathIndex % colors.Length];

                // 绘制轮廓线
                for (int i = 0; i < path.Length; i++)
                {
                    Vector3 start = transform.TransformPoint(path[i]);
                    Vector3 end = transform.TransformPoint(path[(i + 1) % path.Length]);
                    Gizmos.DrawLine(start, end);
                }

                // 显示顶点
                Gizmos.color = Color.red;
                foreach (Vector2 point in path)
                {
                    Vector3 worldPoint = transform.TransformPoint(point);
                    Gizmos.DrawSphere(worldPoint, 0.005f);
                }
            }

            Debug.Log($"Gizmos显示 {polygonCollider.pathCount} 个轮廓");
        }
    }
    enum CellEdge
    {
        Bottom = 0,  
        Right = 1,   
        Top = 2,    
        Left = 3    
    }
}