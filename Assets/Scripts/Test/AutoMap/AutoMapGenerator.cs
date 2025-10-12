// Assets/Scripts/Test/AutoMap/AutoMapGenerator.cs
using UnityEngine;
using UnityEngine.Networking;
using System.Collections;
using System.Collections.Generic;
using System.Resources;

public class AutoMapGenerator : MonoBehaviour
{
    [Header("地图区域设置")]
    public string areaName = "目标区域";
    public double southLat = 39.9100;
    public double northLat = 39.9300;
    public double westLon = 116.3800;
    public double eastLon = 116.4100;

    [Header("资源引用 - 如为空将自动创建")]
    public Material buildingMaterial;
    public Material roadMaterial;
    public Material parkMaterial;
    public Material waterMaterial;
    public Material groundMaterial;

    [Header("生成设置")]
    public float buildingHeight = 8f;
    public float roadWidth = 6f;

    [Header("调试选项")]
    public bool showDebugInfo = true;
    public bool logMissingBuildings = true;
    public bool includeAllWays = true; // 新增

    private OSMParser osmParser;
    private ResourceManager resourceManager;

    void Start()
    {
        InitializeComponents();
        StartCoroutine(DownloadAndGenerateMap());
    }

    void InitializeComponents()
    {
        // 确保有必要的组件
        osmParser = GetComponent<OSMParser>();
        if (osmParser == null) osmParser = gameObject.AddComponent<OSMParser>();

        // 设置解析器选项
        osmParser.includeAllWays = includeAllWays;

        // 初始化资源管理器
        resourceManager = new ResourceManager();
        resourceManager.InitializeResources(this);
        // 调试：显示现有材质
        if (showDebugInfo)
        {
            resourceManager.LogExistingMaterials();
        }
    }

    // 添加一个编辑器菜单项来清理和重新创建材质
    [ContextMenu("重新初始化材质")]
    public void ReinitializeMaterials()
    {
#if UNITY_EDITOR
        Debug.Log("重新初始化材质...");

        // 强制重新创建所有材质
        resourceManager = new ResourceManager();

        // 清空现有材质引用
        buildingMaterial = null;
        roadMaterial = null;
        parkMaterial = null;
        waterMaterial = null;
        groundMaterial = null;

        // 重新初始化
        resourceManager.InitializeResources(this);

        Debug.Log("材质重新初始化完成");
#endif
    }

    // 添加一个方法来检查材质状态
    [ContextMenu("检查材质状态")]
    public void CheckMaterialStatus()
    {
        Debug.Log("=== 材质状态检查 ===");
        Debug.Log($"建筑材质: {buildingMaterial?.name ?? "未设置"}");
        Debug.Log($"道路材质: {roadMaterial?.name ?? "未设置"}");
        Debug.Log($"公园材质: {parkMaterial?.name ?? "未设置"}");
        Debug.Log($"水域材质: {waterMaterial?.name ?? "未设置"}");
        Debug.Log($"地面材质: {groundMaterial?.name ?? "未设置"}");

        resourceManager.LogExistingMaterials();
    }

    IEnumerator DownloadAndGenerateMap()
    {
        Debug.Log($"开始下载 {areaName} 地图数据...");

        string overpassQuery = BuildOverpassQuery();
        string encodedQuery = UnityWebRequest.EscapeURL(overpassQuery);
        string url = $"https://overpass-api.de/api/interpreter?data={encodedQuery}";

        if (showDebugInfo)
        {
            Debug.Log($"目标区域: {areaName}");
            Debug.Log($"经纬度范围: {southLat},{westLon} 到 {northLat},{eastLon}");
        }

        using (UnityWebRequest request = UnityWebRequest.Get(url))
        {
            yield return request.SendWebRequest();

            if (request.result == UnityWebRequest.Result.Success)
            {
                string osmData = request.downloadHandler.text;
                Debug.Log($"成功下载地图数据! 长度: {osmData.Length} 字符");
                GenerateMap(osmData);
            }
            else
            {
                Debug.LogError($"下载失败: {request.error}");
                CreateTestMap();
            }
        }
    }

    string BuildOverpassQuery()
    {
        return $@"
            [out:xml][timeout:45];
            (
                way[""building""]({southLat},{westLon},{northLat},{eastLon});
                way[""highway""]({southLat},{westLon},{northLat},{eastLon});
                way[""leisure""]({southLat},{westLon},{northLat},{eastLon});
                way[""waterway""]({southLat},{westLon},{northLat},{eastLon});
                way[""natural""][""natural""~""water""]({southLat},{westLon},{northLat},{eastLon});
            );
            (._;>;);
            out body;";
    }

    void GenerateMap(string osmData)
    {
        ClearExistingMap();

        if (string.IsNullOrEmpty(osmData) || osmData.Length < 100)
        {
            Debug.LogError("OSM数据无效，创建测试地图");
            CreateTestMap();
            return;
        }

        OSMData parsedData = osmParser.ParseOSMXML(osmData);
        CreateMapElements(parsedData);

        Debug.Log("地图生成完成！");
    }

    void CreateMapElements(OSMData data)
    {
        // 创建地面
        CreateGround(data);

        int totalBuildings = 0;
        int generatedBuildings = 0;
        int skippedBuildings = 0;

        // 创建各种地图元素
        foreach (var way in data.ways)
        {
            var points = GetWayPoints(way, data);

            if (way.IsBuilding)
            {
                totalBuildings++;

                // 放宽建筑生成条件
                if (points.Count >= 3)
                {
                    CreateBuilding(way, points);
                    generatedBuildings++;
                }
                else if (points.Count == 2)
                {
                    // 对于只有2个点的建筑，创建简化版本
                    CreateSimpleBuilding(way, points);
                    generatedBuildings++;
                }
                else
                {
                    Debug.LogWarning($"跳过建筑 {way.id}: 只有 {points.Count} 个点");
                    skippedBuildings++;
                }
            }
            else if (way.IsRoad && points.Count >= 2)
            {
                CreateRoad(way, points);
            }
            else if (way.IsPark && points.Count >= 3)
            {
                CreatePark(way, points);
            }
            else if (way.IsWater && points.Count >= 3)
            {
                CreateWater(way, points);
            }
        }

        Debug.Log($"建筑生成统计: 总计{totalBuildings}, 生成{generatedBuildings}, 跳过{skippedBuildings}");
    }

    // 创建简化建筑（用于只有2个点的情况）
    void CreateSimpleBuilding(OSMWay way, List<Vector3> points)
    {
        if (points.Count != 2) return;

        GameObject building = new GameObject($"SimpleBuilding_{way.id}");
        building.transform.SetParent(transform);

        // 计算矩形的四个点
        Vector3 direction = (points[1] - points[0]).normalized;
        Vector3 perpendicular = new Vector3(-direction.z, 0, direction.x); // 垂直方向

        float width = 10f; // 默认宽度
        List<Vector3> footprint = new List<Vector3>
    {
        points[0] - perpendicular * width * 0.5f,
        points[1] - perpendicular * width * 0.5f,
        points[1] + perpendicular * width * 0.5f,
        points[0] + perpendicular * width * 0.5f
    };

        var meshFilter = building.AddComponent<MeshFilter>();
        var renderer = building.AddComponent<MeshRenderer>();

        meshFilter.mesh = CreateBuildingMesh(footprint, buildingHeight);
        renderer.material = buildingMaterial;
        building.AddComponent<MeshCollider>();

        Debug.Log($"创建简化建筑: {way.id} (从{points.Count}个点生成)");
    }

    // 改进的节点获取方法
    List<Vector3> GetWayPoints(OSMWay way, OSMData data)
    {
        var points = new List<Vector3>();
        var nodeDict = CreateNodeDictionary(data);

        int foundNodes = 0;
        foreach (long nodeId in way.nodeRefs)
        {
            if (nodeDict.ContainsKey(nodeId))
            {
                points.Add(nodeDict[nodeId].unityPosition);
                foundNodes++;
            }
        }

        if (foundNodes < way.nodeRefs.Count && way.IsBuilding)
        {
            Debug.LogWarning($"建筑 {way.id}: 引用 {way.nodeRefs.Count} 个节点，只找到 {foundNodes} 个");
        }

        return points;
    }

    Dictionary<long, OSMNode> CreateNodeDictionary(OSMData data)
    {
        var dict = new Dictionary<long, OSMNode>();
        foreach (var node in data.nodes)
            dict[node.id] = node;
        return dict;
    }

    void CreateGround(OSMData data)
    {
        if (data.nodes.Count == 0) return;

        GameObject ground = GameObject.CreatePrimitive(PrimitiveType.Plane);
        ground.name = "MapGround";
        ground.transform.SetParent(transform);

        Bounds bounds = CalculateBounds(data);
        ground.transform.position = new Vector3(bounds.center.x, -0.1f, bounds.center.z);
        ground.transform.localScale = new Vector3(bounds.size.x / 10f, 1, bounds.size.z / 10f);

        ground.GetComponent<Renderer>().material = groundMaterial;
    }

    void CreateBuilding(OSMWay way, List<Vector3> footprint)
    {
        GameObject building = new GameObject($"Building_{way.id}");
        building.transform.SetParent(transform);

        var meshFilter = building.AddComponent<MeshFilter>();
        var renderer = building.AddComponent<MeshRenderer>();

        meshFilter.mesh = CreateBuildingMesh(footprint, buildingHeight);
        renderer.material = buildingMaterial;
        building.AddComponent<MeshCollider>();
    }

    void CreateRoad(OSMWay way, List<Vector3> path)
    {
        GameObject road = new GameObject($"Road_{way.id}");
        road.transform.SetParent(transform);

        var lineRenderer = road.AddComponent<LineRenderer>();
        lineRenderer.positionCount = path.Count;
        lineRenderer.SetPositions(path.ToArray());
        lineRenderer.startWidth = roadWidth;
        lineRenderer.endWidth = roadWidth;
        lineRenderer.material = roadMaterial;
        lineRenderer.textureMode = LineTextureMode.Tile;
    }

    void CreatePark(OSMWay way, List<Vector3> area)
    {
        GameObject park = new GameObject($"Park_{way.id}");
        park.transform.SetParent(transform);

        var ground = GameObject.CreatePrimitive(PrimitiveType.Plane);
        ground.transform.SetParent(park.transform);
        ground.name = "ParkGround";

        Bounds bounds = CalculateBounds(area);
        ground.transform.position = bounds.center;
        ground.transform.localScale = new Vector3(bounds.size.x / 10f, 1, bounds.size.z / 10f);
        ground.GetComponent<Renderer>().material = parkMaterial;
    }

    void CreateWater(OSMWay way, List<Vector3> area)
    {
        GameObject water = new GameObject($"Water_{way.id}");
        water.transform.SetParent(transform);

        var surface = GameObject.CreatePrimitive(PrimitiveType.Plane);
        surface.transform.SetParent(water.transform);
        surface.name = "WaterSurface";

        Bounds bounds = CalculateBounds(area);
        surface.transform.position = bounds.center + Vector3.up * 0.1f;
        surface.transform.localScale = new Vector3(bounds.size.x / 10f, 1, bounds.size.z / 10f);
        surface.GetComponent<Renderer>().material = waterMaterial;
    }

    Mesh CreateBuildingMesh(List<Vector3> footprint, float height)
    {
        Mesh mesh = new Mesh();
        var vertices = new List<Vector3>();
        var triangles = new List<int>();

        int count = footprint.Count;

        // 底面顶点
        vertices.AddRange(footprint);
        // 顶面顶点
        foreach (var point in footprint)
            vertices.Add(point + Vector3.up * height);

        // 侧面
        for (int i = 0; i < count; i++)
        {
            int next = (i + 1) % count;
            triangles.Add(i); triangles.Add(next); triangles.Add(i + count);
            triangles.Add(next); triangles.Add(next + count); triangles.Add(i + count);
        }

        // 底面和顶面
        var bottomTris = TriangulatePolygon(footprint, false);
        var topTris = TriangulatePolygon(footprint, true);

        triangles.AddRange(bottomTris);
        foreach (int tri in topTris) triangles.Add(tri + count);

        mesh.vertices = vertices.ToArray();
        mesh.triangles = triangles.ToArray();
        mesh.RecalculateNormals();

        return mesh;
    }

    List<int> TriangulatePolygon(List<Vector3> vertices, bool clockwise)
    {
        var triangles = new List<int>();
        if (vertices.Count < 3) return triangles;

        for (int i = 1; i < vertices.Count - 1; i++)
        {
            if (clockwise)
            {
                triangles.Add(0); triangles.Add(i); triangles.Add(i + 1);
            }
            else
            {
                triangles.Add(0); triangles.Add(i + 1); triangles.Add(i);
            }
        }
        return triangles;
    }

    Bounds CalculateBounds(OSMData data)
    {
        if (data.nodes.Count == 0) return new Bounds();

        Bounds bounds = new Bounds(data.nodes[0].unityPosition, Vector3.zero);
        foreach (var node in data.nodes)
            bounds.Encapsulate(node.unityPosition);
        return bounds;
    }

    Bounds CalculateBounds(List<Vector3> points)
    {
        if (points.Count == 0) return new Bounds();

        Bounds bounds = new Bounds(points[0], Vector3.zero);
        foreach (var point in points)
            bounds.Encapsulate(point);
        return bounds;
    }

    void CreateTestMap()
    {
        Debug.Log("创建测试地图...");
        ClearExistingMap();

        // 创建测试地面
        GameObject ground = GameObject.CreatePrimitive(PrimitiveType.Plane);
        ground.name = "TestGround";
        ground.transform.SetParent(transform);
        ground.transform.localScale = new Vector3(10, 1, 10);
        ground.GetComponent<Renderer>().material = groundMaterial;

        // 创建几个测试建筑
        for (int i = 0; i < 5; i++)
        {
            var building = GameObject.CreatePrimitive(PrimitiveType.Cube);
            building.name = $"TestBuilding_{i}";
            building.transform.SetParent(transform);
            building.transform.position = new Vector3(i * 15, 4, 0);
            building.transform.localScale = new Vector3(10, 8, 10);
            building.GetComponent<Renderer>().material = buildingMaterial;
        }

        Debug.Log("测试地图创建完成！");
    }

    void ClearExistingMap()
    {
        foreach (Transform child in transform)
            DestroyImmediate(child.gameObject);
    }

    [ContextMenu("重新生成地图")]
    public void RegenerateMap()
    {
        StartCoroutine(DownloadAndGenerateMap());
    }
}