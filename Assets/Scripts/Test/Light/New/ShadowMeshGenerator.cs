using UnityEngine;
using System.Collections.Generic;

[System.Serializable]
public class ShadowMeshGenerator
{
    [Header("网格设置")]
    public int gridResolution = 64;
    public float gridSize = 1.0f;
    public float influenceRadius = 0.5f;

    public DensityGrid GenerateDensityGrid(ProjectedMesh mesh, Transform wall)
    {
        var bounds = CalculateMeshBounds(mesh);
        var grid = new DensityGrid(bounds, gridResolution, gridSize);

        // 为每个网格点计算密度
        for (int x = 0; x < grid.Width; x++)
        {
            for (int y = 0; y < grid.Height; y++)
            {
                Vector2 gridPos = grid.GridToLocalPosition(x, y);
                float density = CalculateDensityAtPoint(gridPos, mesh);
                grid.SetValue(x, y, density);
            }
        }

        return grid;
    }

    float CalculateDensityAtPoint(Vector2 point, ProjectedMesh mesh)
    {
        float totalDensity = 0f;
        int samples = 0;

        // 采样网格点周围的顶点影响
        foreach (var vertex in mesh.vertices)
        {
            Vector2 vertex2D = new Vector2(vertex.x, vertex.y);
            float distance = Vector2.Distance(point, vertex2D);

            if (distance < influenceRadius)
            {
                float influence = 1f - (distance / influenceRadius);
                totalDensity += influence;
                samples++;
            }
        }

        return samples > 0 ? totalDensity / samples : 0f;
    }

    Bounds CalculateMeshBounds(ProjectedMesh mesh)
    {
        if (mesh.vertices.Count == 0)
            return new Bounds(Vector3.zero, Vector3.one);

        Vector3 min = mesh.vertices[0];
        Vector3 max = mesh.vertices[0];

        foreach (var vertex in mesh.vertices)
        {
            min = Vector3.Min(min, vertex);
            max = Vector3.Max(max, vertex);
        }

        return new Bounds((min + max) * 0.5f, max - min);
    }
}

[System.Serializable]
public class DensityGrid
{
    public int Width { get; private set; }
    public int Height { get; private set; }
    public float CellSize { get; private set; }
    public Bounds WorldBounds { get; private set; }

    private float[,] values;
    private Vector3 gridOrigin;

    public DensityGrid(Bounds bounds, int resolution, float cellSize)
    {
        WorldBounds = bounds;
        CellSize = cellSize;
        Width = resolution;
        Height = resolution;

        gridOrigin = bounds.min;
        values = new float[Width, Height];
    }

    public void SetValue(int x, int y, float value)
    {
        if (x >= 0 && x < Width && y >= 0 && y < Height)
        {
            values[x, y] = Mathf.Clamp01(value);
        }
    }

    public float GetValue(int x, int y)
    {
        if (x >= 0 && x < Width && y >= 0 && y < Height)
        {
            return values[x, y];
        }
        return 0f;
    }

    public Vector2 GridToLocalPosition(int x, int y)
    {
        return new Vector2(
            x * CellSize + gridOrigin.x,
            y * CellSize + gridOrigin.y
        );
    }

    public Vector3 GridToWorldPosition(int x, int y, Transform wall)
    {
        Vector2 localPos = GridToLocalPosition(x, y);
        return wall.TransformPoint(new Vector3(localPos.x, localPos.y, 0));
    }
}