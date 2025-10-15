using UnityEngine;
using System.Collections.Generic;
using System.Linq;
using UnityEngine.Rendering.Universal;

public class ShadowColliderSystem : MonoBehaviour
{
    [Header("系统设置")]
    public Light shadowLight;
    public Transform shadowWall;
    public string shadowLayerName = "Shadow";
    public LayerMask obstacleLayerMask = -1;

    [Header("生成设置")]
    public bool generateOnStart = true;
    public bool updateInRealTime = false;
    public float updateInterval = 0.1f;

    [Header("阴影碰撞器")]
    public List<ShadowCollider> shadowColliders = new List<ShadowCollider>();

    private ShadowProjector projector;
    private ShadowMeshGenerator meshGenerator;
    private MarchingSquaresProcessor marchingSquares;
    private float updateTimer;

    void Start()
    {
        InitializeComponents();

        if (generateOnStart)
        {
            GenerateAllShadowColliders();
        }
    }

    void Update()
    {
        if (updateInRealTime)
        {
            updateTimer += Time.deltaTime;
            if (updateTimer >= updateInterval)
            {
                UpdateAllShadowColliders();
                updateTimer = 0f;
            }
        }
    }

    void InitializeComponents()
    {
        // 自动查找必要的组件
        if (shadowLight == null) shadowLight = ShadowUtils.FindMainLight();
        if (shadowWall == null) shadowWall = ShadowUtils.FindMainWall();

        // 初始化子系统
        projector = new ShadowProjector(shadowLight, shadowWall, obstacleLayerMask);
        meshGenerator = new ShadowMeshGenerator();
        marchingSquares = new MarchingSquaresProcessor();
    }

    [ContextMenu("生成所有阴影碰撞器")]
    public void GenerateAllShadowColliders()
    {
        ClearAllShadowColliders();

        var shadowObjects = ShadowUtils.FindObjectsInLayer(shadowLayerName);
        foreach (GameObject obj in shadowObjects)
        {
            GenerateShadowCollider(obj);
        }

        Debug.Log($"生成了 {shadowColliders.Count} 个阴影碰撞器");
    }

    [ContextMenu("更新所有阴影碰撞器")]
    public void UpdateAllShadowColliders()
    {
        foreach (var shadowCollider in shadowColliders)
        {
            if (shadowCollider != null)
            {
                UpdateShadowCollider(shadowCollider);
            }
        }
    }

    public void GenerateShadowCollider(GameObject shadowCaster)
    {
        if (!IsValidShadowCaster(shadowCaster)) return;

        try
        {
            // 1. 投影网格到墙面
            var projectedMesh = projector.ProjectMeshToWall(shadowCaster);
            if (!projectedMesh.IsValid)
            {
                Debug.LogWarning($"无法为 {shadowCaster.name} 生成有效投影网格");
                return;
            }

            // 2. 生成阴影密度网格
            var densityGrid = meshGenerator.GenerateDensityGrid(projectedMesh, shadowWall);

            // 3. 使用Marching Squares提取轮廓
            var contours = marchingSquares.ExtractContours(densityGrid);
            if (contours == null || contours.Count == 0)
            {
                Debug.LogWarning($"无法为 {shadowCaster.name} 提取轮廓");
                return;
            }

            // 4. 创建阴影碰撞器对象
            var shadowCollider = CreateShadowColliderObject(shadowCaster.name, contours);
            shadowCollider.sourceObject = shadowCaster;
            shadowColliders.Add(shadowCollider);

            Debug.Log($"成功为 {shadowCaster.name} 生成阴影碰撞器，包含 {contours.Count} 个轮廓");
        }
        catch (System.Exception e)
        {
            Debug.LogError($"为 {shadowCaster.name} 生成阴影碰撞器时出错: {e.Message}");
        }
    }
    public void UpdateShadowCollider(ShadowCollider shadowCollider)
    {
        if (shadowCollider.sourceObject == null) return;

        var projectedMesh = projector.ProjectMeshToWall(shadowCollider.sourceObject);
        var densityGrid = meshGenerator.GenerateDensityGrid(projectedMesh, shadowWall);
        var contours = marchingSquares.ExtractContours(densityGrid);

        shadowCollider.UpdateCollider(contours);
    }

    [ContextMenu("清空所有阴影碰撞器")]
    public void ClearAllShadowColliders()
    {
        foreach (var collider in shadowColliders)
        {
            if (collider != null && collider.gameObject != null)
            {
                DestroyImmediate(collider.gameObject);
            }
        }
        shadowColliders.Clear();
    }

    bool IsValidShadowCaster(GameObject obj)
    {
        return obj != null &&
               obj.activeInHierarchy &&
               obj.GetComponent<MeshFilter>() != null;
    }

    ShadowCollider CreateShadowColliderObject(string name, List<List<Vector2>> contours)
    {
        GameObject colliderObj = new GameObject($"{name}_ShadowCollider");
        colliderObj.transform.SetParent(shadowWall);
        colliderObj.transform.localPosition = Vector3.zero;
        colliderObj.transform.localRotation = Quaternion.identity;

        var shadowCollider = colliderObj.AddComponent<ShadowCollider>();
        shadowCollider.Initialize(contours);

        return shadowCollider;
    }

    void OnDestroy()
    {
        ClearAllShadowColliders();
    }

#if UNITY_EDITOR
    void OnDrawGizmosSelected()
    {
        if (marchingSquares != null && shadowWall != null)
        {
            marchingSquares.DrawGridGizmos(shadowWall);
        }
    }
#endif
}