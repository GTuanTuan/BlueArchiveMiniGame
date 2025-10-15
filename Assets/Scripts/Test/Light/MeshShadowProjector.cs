using UnityEngine;
using System.Collections.Generic;

public class MeshShadowProjector : MonoBehaviour
{
    [Header("投影设置")]
    public Light shadowLight;
    public Transform shadowWall;
    public string shadowLayerName = "Shadow";

    [Header("Mesh设置")]
    public bool keepOriginalMesh = true; // 是否保留原始mesh
    public float shadowIntensity = 0.5f; // 阴影强度

    private List<GameObject> modifiedObjects = new List<GameObject>();
    private Vector3 wallNormal;
    private Vector3 wallPosition;

    void Start()
    {
        if (shadowLight == null) shadowLight = FindObjectOfType<Light>();
        if (shadowWall == null) shadowWall = FindMainWall();

        CalculateWallPlane();
        GenerateAllShadowMeshes();
    }

    [ContextMenu("生成所有阴影Mesh")]
    public void GenerateAllShadowMeshes()
    {
        ClearAllShadowMeshes();

        var shadowObjects = FindObjectsInLayer(shadowLayerName);
        foreach (GameObject obj in shadowObjects)
        {
            GenerateShadowMesh(obj);
        }

        Debug.Log($"为 {modifiedObjects.Count} 个物体生成了阴影Mesh");
    }

    void GenerateShadowMesh(GameObject shadowCaster)
    {
        MeshFilter meshFilter = shadowCaster.GetComponent<MeshFilter>();
        if (meshFilter == null) return;

        // 获取原始mesh
        Mesh originalMesh = meshFilter.mesh;

        // 创建新的mesh（组合原始mesh + 投影mesh）
        Mesh combinedMesh = CreateCombinedMesh(originalMesh, shadowCaster.transform);

        // 应用新mesh
        if (keepOriginalMesh)
        {
            // 创建新物体来存放阴影mesh
            CreateShadowObject(shadowCaster, combinedMesh);
        }
        else
        {
            // 直接修改原物体
            meshFilter.mesh = combinedMesh;
            UpdateMeshCollider(shadowCaster, combinedMesh);
            modifiedObjects.Add(shadowCaster);
        }
    }

    Mesh CreateCombinedMesh(Mesh originalMesh, Transform objectTransform)
    {
        // 创建新mesh
        Mesh newMesh = new Mesh();

        List<Vector3> vertices = new List<Vector3>();
        List<int> triangles = new List<int>();
        List<Vector3> normals = new List<Vector3>();
        List<Vector2> uv = new List<Vector2>();

        // 1. 添加原始mesh的顶点和三角形
        vertices.AddRange(originalMesh.vertices);
        triangles.AddRange(originalMesh.triangles);

        // 复制原始法线和UV
        if (originalMesh.normals.Length == originalMesh.vertices.Length)
            normals.AddRange(originalMesh.normals);
        else
            for (int i = 0; i < originalMesh.vertices.Length; i++)
                normals.Add(Vector3.up);

        if (originalMesh.uv.Length == originalMesh.vertices.Length)
            uv.AddRange(originalMesh.uv);
        else
            for (int i = 0; i < originalMesh.vertices.Length; i++)
                uv.Add(Vector2.zero);

        // 2. 添加投影到墙面的顶点
        int originalVertexCount = vertices.Count;
        List<Vector3> projectedVertices = new List<Vector3>();
        List<int> projectedTriangles = new List<int>();

        // 投影每个顶点到墙面
        foreach (Vector3 localVertex in originalMesh.vertices)
        {
            Vector3 worldVertex = objectTransform.TransformPoint(localVertex);
            Vector3 projectedWorld = ProjectPointToWall(worldVertex);
            Vector3 projectedLocal = objectTransform.InverseTransformPoint(projectedWorld);

            projectedVertices.Add(projectedLocal);
        }

        // 添加投影顶点
        vertices.AddRange(projectedVertices);

        // 为投影顶点添加法线和UV
        for (int i = 0; i < projectedVertices.Count; i++)
        {
            normals.Add(-objectTransform.forward); // 面向墙面
            uv.Add(new Vector2(1, 1)); // 使用不同的UV区域
        }

        // 3. 创建连接原始mesh和投影mesh的侧面三角形
        for (int i = 0; i < originalMesh.triangles.Length; i += 3)
        {
            int v1 = originalMesh.triangles[i];
            int v2 = originalMesh.triangles[i + 1];
            int v3 = originalMesh.triangles[i + 2];

            // 对应的投影顶点索引
            int p1 = v1 + originalVertexCount;
            int p2 = v2 + originalVertexCount;
            int p3 = v3 + originalVertexCount;

            // 创建侧面四边形（两个三角形）
            // 三角形1
            projectedTriangles.Add(v1);
            projectedTriangles.Add(p1);
            projectedTriangles.Add(v2);

            projectedTriangles.Add(v2);
            projectedTriangles.Add(p1);
            projectedTriangles.Add(p2);

            // 三角形2
            projectedTriangles.Add(v2);
            projectedTriangles.Add(p2);
            projectedTriangles.Add(v3);

            projectedTriangles.Add(v3);
            projectedTriangles.Add(p2);
            projectedTriangles.Add(p3);

            // 三角形3
            projectedTriangles.Add(v3);
            projectedTriangles.Add(p3);
            projectedTriangles.Add(v1);

            projectedTriangles.Add(v1);
            projectedTriangles.Add(p3);
            projectedTriangles.Add(p1);
        }

        // 4. 添加投影面的三角形（反转原始三角形）
        int[] originalTriangles = originalMesh.triangles;
        for (int i = 0; i < originalTriangles.Length; i += 3)
        {
            // 反转 winding order
            projectedTriangles.Add(originalTriangles[i + 2] + originalVertexCount);
            projectedTriangles.Add(originalTriangles[i + 1] + originalVertexCount);
            projectedTriangles.Add(originalTriangles[i] + originalVertexCount);
        }

        // 5. 合并所有三角形
        triangles.AddRange(projectedTriangles);

        // 6. 应用到新mesh
        newMesh.vertices = vertices.ToArray();
        newMesh.triangles = triangles.ToArray();
        newMesh.normals = normals.ToArray();
        newMesh.uv = uv.ToArray();

        newMesh.RecalculateBounds();
        newMesh.RecalculateTangents();

        return newMesh;
    }

    void CreateShadowObject(GameObject original, Mesh shadowMesh)
    {
        GameObject shadowObject = new GameObject($"{original.name}_ShadowMesh");
        shadowObject.transform.SetParent(original.transform);
        shadowObject.transform.localPosition = Vector3.zero;
        shadowObject.transform.localRotation = Quaternion.identity;
        shadowObject.transform.localScale = Vector3.one;

        // 添加Mesh Filter
        MeshFilter meshFilter = shadowObject.AddComponent<MeshFilter>();
        meshFilter.mesh = shadowMesh;

        // 添加Mesh Collider
        MeshCollider meshCollider = shadowObject.AddComponent<MeshCollider>();
        meshCollider.sharedMesh = shadowMesh;
        meshCollider.convex = false; // 对于复杂mesh使用非凸体

        // 可选：添加材质用于可视化
        MeshRenderer renderer = shadowObject.AddComponent<MeshRenderer>();
        renderer.material = original.GetComponent<MeshRenderer>().material;

        modifiedObjects.Add(shadowObject);
    }

    void UpdateMeshCollider(GameObject obj, Mesh mesh)
    {
        MeshCollider meshCollider = obj.GetComponent<MeshCollider>();
        if (meshCollider == null)
            meshCollider = obj.AddComponent<MeshCollider>();

        meshCollider.sharedMesh = mesh;
        meshCollider.convex = false;
    }

    Material CreateShadowMaterial()
    {
        Material material = new Material(Shader.Find("Standard"));
        material.color = new Color(0, 0, 0, shadowIntensity);
        material.SetFloat("_Mode", 2); // Fade mode
        material.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
        material.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
        material.SetInt("_ZWrite", 0);
        material.DisableKeyword("_ALPHATEST_ON");
        material.EnableKeyword("_ALPHABLEND_ON");
        material.DisableKeyword("_ALPHAPREMULTIPLY_ON");
        material.renderQueue = 3000;
        return material;
    }

    Vector3 ProjectPointToWall(Vector3 worldPoint)
    {
        Vector3 lightDirection = GetLightDirection(worldPoint);
        return IntersectWithWall(worldPoint, lightDirection);
    }

    Vector3 GetLightDirection(Vector3 targetPoint)
    {
        if (shadowLight.type == LightType.Directional)
        {
            return -shadowLight.transform.forward;
        }
        else
        {
            return (targetPoint - shadowLight.transform.position).normalized;
        }
    }

    Vector3 IntersectWithWall(Vector3 point, Vector3 direction)
    {
        float denominator = Vector3.Dot(direction, wallNormal);

        if (Mathf.Abs(denominator) < 0.0001f)
            return point;

        float t = Vector3.Dot(wallPosition - point, wallNormal) / denominator;
        return point + direction * t;
    }

    void CalculateWallPlane()
    {
        if (shadowWall != null)
        {
            wallPosition = shadowWall.position;
            wallNormal = -shadowWall.forward;
        }
    }

    Transform FindMainWall()
    {
        BoxCollider[] colliders = FindObjectsOfType<BoxCollider>();
        return colliders.Length > 0 ? colliders[0].transform : transform;
    }

    List<GameObject> FindObjectsInLayer(string layerName)
    {
        int layer = LayerMask.NameToLayer(layerName);
        List<GameObject> result = new List<GameObject>();

        foreach (GameObject obj in FindObjectsOfType<GameObject>())
        {
            if (obj.activeInHierarchy && obj.layer == layer)
            {
                result.Add(obj);
            }
        }

        return result;
    }

    [ContextMenu("清空所有阴影Mesh")]
    void ClearAllShadowMeshes()
    {
        foreach (GameObject obj in modifiedObjects)
        {
            if (obj != null)
            {
                if (obj.name.EndsWith("_ShadowMesh"))
                    DestroyImmediate(obj);
                else
                    ResetOriginalMesh(obj);
            }
        }
        modifiedObjects.Clear();
    }

    void ResetOriginalMesh(GameObject obj)
    {
        MeshFilter meshFilter = obj.GetComponent<MeshFilter>();
        if (meshFilter != null && meshFilter.mesh != null)
        {
            // 重新加载原始mesh
            Mesh originalMesh = Instantiate(Resources.Load<Mesh>(obj.name)) ?? CreateSimpleMesh();
            meshFilter.mesh = originalMesh;

            MeshCollider collider = obj.GetComponent<MeshCollider>();
            if (collider != null)
                collider.sharedMesh = originalMesh;
        }
    }

    Mesh CreateSimpleMesh()
    {
        // 创建默认的立方体mesh
        return GameObject.CreatePrimitive(PrimitiveType.Cube).GetComponent<MeshFilter>().sharedMesh;
    }

    void OnDestroy()
    {
        ClearAllShadowMeshes();
    }
}