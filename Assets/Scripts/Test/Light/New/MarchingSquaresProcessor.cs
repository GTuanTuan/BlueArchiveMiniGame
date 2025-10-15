using UnityEngine;
using System.Collections.Generic;

[System.Serializable]
public class MarchingSquaresProcessor
{
    [Header("Marching Squares设置")]
    public float isoLevel = 0.5f;
    public bool smoothEdges = true;
    public float smoothness = 0.1f;

    // Marching Squares查找表
    private static readonly int[,] transitionTable = new int[,]
    {
        {-1, -1, -1, -1}, // 0: 空单元格
        { 0,  3, -1, -1}, // 1: 只有左下角
        { 1,  0, -1, -1}, // 2: 只有右下角  
        { 1,  3, -1, -1}, // 3: 下边
        { 2,  1, -1, -1}, // 4: 只有右上角
        { 0,  3,  2,  1}, // 5: S形状
        { 2,  0, -1, -1}, // 6: 右边
        { 2,  3, -1, -1}, // 7: 右下三角
        { 3,  2, -1, -1}, // 8: 只有左上角
        { 0,  2, -1, -1}, // 9: 左边
        { 0,  1,  3,  2}, // 10: S形状（反转）
        { 1,  2, -1, -1}, // 11: 左下三角
        { 3,  1, -1, -1}, // 12: 上边
        { 3,  0, -1, -1}, // 13: 右上三角
        { 1,  3, -1, -1}, // 14: 左上三角
        {-1, -1, -1, -1}  // 15: 全满
    };

    public List<List<Vector2>> ExtractContours(DensityGrid grid)
    {
        var contours = new List<List<Vector2>>();
        bool[,] visited = new bool[grid.Width, grid.Height];

        for (int x = 0; x < grid.Width - 1; x++)
        {
            for (int y = 0; y < grid.Height - 1; y++)
            {
                if (!visited[x, y] && IsBoundaryCell(grid, x, y))
                {
                    var contour = MarchCell(grid, x, y, visited);
                    if (contour != null && contour.Count >= 3)
                    {
                        if (smoothEdges)
                            contour = SmoothContour(contour);
                        contours.Add(contour);
                    }
                }
            }
        }

        return contours;
    }

    List<Vector2> MarchCell(DensityGrid grid, int startX, int startY, bool[,] visited)
    {
        var contour = new List<Vector2>();
        int x = startX, y = startY;
        int step = 0;
        int maxSteps = grid.Width * grid.Height; // 防止无限循环

        do
        {
            // 边界检查
            if (x < 0 || x >= grid.Width - 1 || y < 0 || y >= grid.Height - 1)
                break;

            if (visited[x, y])
                break;

            visited[x, y] = true;

            int config = GetCellConfiguration(grid, x, y);
            var edgePoints = GetEdgePoints(grid, x, y, config);

            // 只添加有效的点
            foreach (var point in edgePoints)
            {
                if (!contour.Contains(point)) // 简单的去重
                    contour.Add(point);
            }

            // 移动到下一个单元格
            if (!MoveToNextCell(config, ref x, ref y))
                break;

            step++;

        } while ((x != startX || y != startY) && step < maxSteps);

        return contour;
    }

    int GetCellConfiguration(DensityGrid grid, int x, int y)
    {
        int config = 0;

        // 安全地获取值，处理边界情况
        float a = GetSafeValue(grid, x, y);
        float b = GetSafeValue(grid, x + 1, y);
        float c = GetSafeValue(grid, x + 1, y + 1);
        float d = GetSafeValue(grid, x, y + 1);

        if (a >= isoLevel) config |= 1;
        if (b >= isoLevel) config |= 2;
        if (c >= isoLevel) config |= 4;
        if (d >= isoLevel) config |= 8;

        return config;
    }

    float GetSafeValue(DensityGrid grid, int x, int y)
    {
        if (x < 0 || x >= grid.Width || y < 0 || y >= grid.Height)
            return 0f;
        return grid.GetValue(x, y);
    }

    Vector2[] GetEdgePoints(DensityGrid grid, int x, int y, int config)
    {
        var points = new List<Vector2>();

        // 根据配置添加边点
        switch (config)
        {
            case 1:
            case 14:
                points.Add(InterpolateEdge(grid, x, y, x, y + 1)); // 左边
                points.Add(InterpolateEdge(grid, x, y, x + 1, y)); // 底边
                break;
            case 2:
            case 13:
                points.Add(InterpolateEdge(grid, x, y, x + 1, y)); // 底边
                points.Add(InterpolateEdge(grid, x + 1, y, x + 1, y + 1)); // 右边
                break;
            case 3:
            case 12:
                points.Add(InterpolateEdge(grid, x, y, x, y + 1)); // 左边
                points.Add(InterpolateEdge(grid, x + 1, y, x + 1, y + 1)); // 右边
                break;
            case 4:
            case 11:
                points.Add(InterpolateEdge(grid, x + 1, y, x + 1, y + 1)); // 右边
                points.Add(InterpolateEdge(grid, x, y + 1, x + 1, y + 1)); // 顶边
                break;
            case 5:
                points.Add(InterpolateEdge(grid, x, y, x, y + 1)); // 左边
                points.Add(InterpolateEdge(grid, x, y, x + 1, y)); // 底边
                points.Add(InterpolateEdge(grid, x + 1, y, x + 1, y + 1)); // 右边
                points.Add(InterpolateEdge(grid, x, y + 1, x + 1, y + 1)); // 顶边
                break;
            case 6:
            case 9:
                points.Add(InterpolateEdge(grid, x, y, x + 1, y)); // 底边
                points.Add(InterpolateEdge(grid, x, y + 1, x + 1, y + 1)); // 顶边
                break;
            case 7:
            case 8:
                points.Add(InterpolateEdge(grid, x, y, x, y + 1)); // 左边
                points.Add(InterpolateEdge(grid, x, y + 1, x + 1, y + 1)); // 顶边
                break;
            case 10:
                points.Add(InterpolateEdge(grid, x, y, x, y + 1)); // 左边
                points.Add(InterpolateEdge(grid, x, y, x + 1, y)); // 底边
                points.Add(InterpolateEdge(grid, x + 1, y, x + 1, y + 1)); // 右边
                points.Add(InterpolateEdge(grid, x, y + 1, x + 1, y + 1)); // 顶边
                break;
        }

        return points.ToArray();
    }

    Vector2 InterpolateEdge(DensityGrid grid, int x1, int y1, int x2, int y2)
    {
        // 安全获取值
        float v1 = GetSafeValue(grid, x1, y1);
        float v2 = GetSafeValue(grid, x2, y2);

        if (Mathf.Abs(v1 - v2) < 0.001f)
            return grid.GridToLocalPosition(x1, y1);

        float t = (isoLevel - v1) / (v2 - v1);
        t = Mathf.Clamp01(t);

        Vector2 p1 = grid.GridToLocalPosition(x1, y1);
        Vector2 p2 = grid.GridToLocalPosition(x2, y2);

        return Vector2.Lerp(p1, p2, t);
    }

    bool MoveToNextCell(int config, ref int x, ref int y)
    {
        // 简化的移动逻辑 - 根据配置决定下一个单元格
        switch (config)
        {
            case 1:
            case 3:
            case 7:
            case 5:
                y++; break; // 向上移动
            case 2:
            case 6:
            case 10:
            case 14:
                x++; break; // 向右移动
            case 4:
            case 12:
            case 13:
            case 15:
                y--; break; // 向下移动
            case 8:
            case 9:
            case 11:
                x--; break; // 向左移动
            default:
                return false; // 无法移动
        }

        return true;
    }

    List<Vector2> SmoothContour(List<Vector2> contour)
    {
        if (contour.Count < 4) return contour;

        var smoothed = new List<Vector2>();
        for (int i = 0; i < contour.Count; i++)
        {
            Vector2 prev = contour[(i - 1 + contour.Count) % contour.Count];
            Vector2 current = contour[i];
            Vector2 next = contour[(i + 1) % contour.Count];

            Vector2 smoothedPoint = (prev + current * 2f + next) / 4f;
            smoothed.Add(smoothedPoint);
        }
        return smoothed;
    }

    bool IsBoundaryCell(DensityGrid grid, int x, int y)
    {
        // 安全检查
        if (x < 0 || x >= grid.Width - 1 || y < 0 || y >= grid.Height - 1)
            return false;

        float value = grid.GetValue(x, y);
        return value >= isoLevel && value < 1.0f; // 边界单元格
    }

    public void DrawGridGizmos(Transform wall)
    {
        // 调试可视化代码可以留空或简化
#if UNITY_EDITOR
        // 可选：添加网格可视化
#endif
    }
}