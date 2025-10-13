using UnityEngine;
using System.Collections.Generic;

public class ShadowColliderGenerator : MonoBehaviour
{
    public Camera shadowCamera;      // 专门渲染阴影的相机
    public RenderTexture shadowRT;   // 渲染纹理
    public LayerMask shadowCasterLayer; // 投射阴影的物体层
    public float colliderPrecision = 0.1f; // 碰撞体精度

    private Texture2D processedTexture;
    private PolygonCollider2D polygonCollider;

    void Start()
    {
        // 初始化渲染纹理
        shadowRT = new RenderTexture(512, 512, 24);
        shadowCamera.targetTexture = shadowRT;

        // 创建处理用的纹理
        processedTexture = new Texture2D(512, 512, TextureFormat.RGB24, false);

        polygonCollider = GetComponent<PolygonCollider2D>();
        if (polygonCollider == null)
            polygonCollider = gameObject.AddComponent<PolygonCollider2D>();
    }

    void Update()
    {
        GenerateShadowCollider();
    }

    void GenerateShadowCollider()
    {
        // 1. 渲染阴影到纹理
        shadowCamera.Render();

        // 2. 从GPU读取纹理到CPU
        RenderTexture.active = shadowRT;
        processedTexture.ReadPixels(new Rect(0, 0, shadowRT.width, shadowRT.height), 0, 0);
        processedTexture.Apply();
        RenderTexture.active = null;

        // 3. 检测阴影边缘
        List<Vector2> edgePoints = DetectEdges(processedTexture);

        // 4. 转换为世界坐标并设置碰撞体
        if (edgePoints.Count > 2)
        {
            List<Vector2> worldPoints = ConvertToWorldCoordinates(edgePoints);
            polygonCollider.SetPath(0, worldPoints);
        }
    }

    List<Vector2> DetectEdges(Texture2D texture)
    {
        List<Vector2> edges = new List<Vector2>();
        Color[] pixels = texture.GetPixels();

        int width = texture.width;
        int height = texture.height;

        // 简单的边缘检测算法
        for (int y = 1; y < height - 1; y += (int)(1f / colliderPrecision))
        {
            for (int x = 1; x < width - 1; x += (int)(1f / colliderPrecision))
            {
                int index = y * width + x;

                // 检查当前像素与周围像素的差异
                if (IsEdgePixel(pixels, index, width))
                {
                    edges.Add(new Vector2(x, y));
                }
            }
        }

        return edges;
    }

    bool IsEdgePixel(Color[] pixels, int index, int width)
    {
        Color current = pixels[index];
        float currentBrightness = current.r + current.g + current.b;

        // 检查上下左右像素
        float[] neighborBrightness = new float[4]
        {
            pixels[index - 1].r + pixels[index - 1].g + pixels[index - 1].b,    // 左
            pixels[index + 1].r + pixels[index + 1].g + pixels[index + 1].b,    // 右
            pixels[index - width].r + pixels[index - width].g + pixels[index - width].b, // 下
            pixels[index + width].r + pixels[index + width].g + pixels[index + width].b  // 上
        };

        // 如果当前像素与邻居差异较大，认为是边缘
        float threshold = 0.3f;
        for (int i = 0; i < 4; i++)
        {
            if (Mathf.Abs(currentBrightness - neighborBrightness[i]) > threshold)
                return true;
        }

        return false;
    }

    List<Vector2> ConvertToWorldCoordinates(List<Vector2> texturePoints)
    {
        List<Vector2> worldPoints = new List<Vector2>();
        Bounds wallBounds = GetComponent<Collider2D>().bounds;

        foreach (Vector2 point in texturePoints)
        {
            // 将纹理坐标转换为墙面局部坐标
            Vector2 localPoint = new Vector2(
                point.x / shadowRT.width * wallBounds.size.x - wallBounds.size.x * 0.5f,
                point.y / shadowRT.height * wallBounds.size.y - wallBounds.size.y * 0.5f
            );

            worldPoints.Add(localPoint);
        }

        return worldPoints;
    }
}