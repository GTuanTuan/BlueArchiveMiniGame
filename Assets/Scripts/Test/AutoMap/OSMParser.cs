// Assets/Scripts/Test/AutoMap/OSMParser.cs
using System.Collections.Generic;
using System.Xml;
using UnityEngine;

public class OSMParser : MonoBehaviour
{
    [Header("解析设置")]
    public bool includeAllWays = true; // 包含所有路径，即使没有标签
    public bool includeRelations = false; // 是否包含关系数据

    public OSMData ParseOSMXML(string xmlData)
    {
        OSMData osmData = new OSMData();
        XmlDocument xmlDoc = new XmlDocument();

        try
        {
            xmlDoc.LoadXml(xmlData);
            ParseNodes(xmlDoc, osmData);
            ParseWays(xmlDoc, osmData);

            if (includeRelations)
            {
                ParseRelations(xmlDoc, osmData);
            }

            Debug.Log($"解析完成: {osmData.nodes.Count} 节点, {osmData.ways.Count} 路径");

            // 分析数据
            AnalyzeParsedData(osmData);
        }
        catch (System.Exception e)
        {
            Debug.LogError($"解析OSM数据失败: {e.Message}");
        }

        return osmData;
    }

    void ParseNodes(XmlDocument xmlDoc, OSMData osmData)
    {
        XmlNodeList nodeList = xmlDoc.GetElementsByTagName("node");
        Debug.Log($"找到 {nodeList.Count} 个节点");

        int parsedCount = 0;
        int failedCount = 0;

        foreach (XmlNode node in nodeList)
        {
            try
            {
                var osmNode = new OSMNode
                {
                    id = long.Parse(node.Attributes["id"].Value),
                    lat = double.Parse(node.Attributes["lat"].Value),
                    lon = double.Parse(node.Attributes["lon"].Value)
                };

                // 解析标签（如果有）
                foreach (XmlNode child in node.ChildNodes)
                {
                    if (child.Name == "tag")
                    {
                        string key = child.Attributes["k"].Value;
                        string value = child.Attributes["v"].Value;
                        // 可以在这里存储节点标签
                    }
                }

                osmData.nodes.Add(osmNode);
                parsedCount++;
            }
            catch (System.Exception e)
            {
                Debug.LogWarning($"解析节点失败: {e.Message}");
                failedCount++;
            }
        }

        Debug.Log($"节点解析: 成功 {parsedCount}, 失败 {failedCount}");

        if (osmData.nodes.Count > 0)
        {
            ConvertToUnityCoordinates(osmData);
        }
    }

    void ParseWays(XmlDocument xmlDoc, OSMData osmData)
    {
        XmlNodeList wayList = xmlDoc.GetElementsByTagName("way");
        Debug.Log($"找到 {wayList.Count} 条路径");

        var nodeDict = CreateNodeDictionary(osmData);
        int waysAdded = 0;
        int waysSkipped = 0;

        foreach (XmlNode way in wayList)
        {
            try
            {
                var osmWay = new OSMWay { id = long.Parse(way.Attributes["id"].Value) };
                int validNodeRefs = 0;

                // 处理节点引用
                foreach (XmlNode child in way.ChildNodes)
                {
                    if (child.Name == "nd" && child.Attributes["ref"] != null)
                    {
                        long refId = long.Parse(child.Attributes["ref"].Value);
                        osmWay.nodeRefs.Add(refId);

                        if (nodeDict.ContainsKey(refId))
                        {
                            validNodeRefs++;
                        }
                    }
                    else if (child.Name == "tag")
                    {
                        string key = child.Attributes["k"].Value;
                        string value = child.Attributes["v"].Value;
                        osmWay.tags[key] = value;
                    }
                }

                // 放宽条件：只要有有效节点引用就添加
                bool shouldAdd = false;

                if (includeAllWays)
                {
                    // 包含所有有足够节点的路径
                    shouldAdd = validNodeRefs >= 2;
                }
                else
                {
                    // 只包含有标签的路径
                    shouldAdd = osmWay.tags.Count > 0 && validNodeRefs >= 2;
                }

                if (shouldAdd)
                {
                    osmData.ways.Add(osmWay);
                    waysAdded++;

                    // 调试信息
                    if (osmWay.IsBuilding && validNodeRefs < osmWay.nodeRefs.Count)
                    {
                        Debug.LogWarning($"建筑 {osmWay.id}: 引用 {osmWay.nodeRefs.Count} 个节点，找到 {validNodeRefs} 个");
                    }
                }
                else
                {
                    waysSkipped++;
                }
            }
            catch (System.Exception e)
            {
                Debug.LogWarning($"解析路径失败: {e.Message}");
            }
        }

        Debug.Log($"路径解析: 添加 {waysAdded}, 跳过 {waysSkipped}");
    }

    void ParseRelations(XmlDocument xmlDoc, OSMData osmData)
    {
        // 处理关系数据（如建筑群、复杂结构）
        XmlNodeList relationList = xmlDoc.GetElementsByTagName("relation");
        Debug.Log($"找到 {relationList.Count} 个关系");

        // 这里可以添加关系解析逻辑
    }

    Dictionary<long, OSMNode> CreateNodeDictionary(OSMData data)
    {
        var dict = new Dictionary<long, OSMNode>();
        foreach (var node in data.nodes)
        {
            dict[node.id] = node;
        }
        return dict;
    }

    void ConvertToUnityCoordinates(OSMData osmData)
    {
        if (osmData.nodes.Count == 0) return;

        // 计算所有节点的中心点作为原点
        double minLat = double.MaxValue, maxLat = double.MinValue;
        double minLon = double.MaxValue, maxLon = double.MinValue;

        foreach (OSMNode node in osmData.nodes)
        {
            if (node.lat < minLat) minLat = node.lat;
            if (node.lat > maxLat) maxLat = node.lat;
            if (node.lon < minLon) minLon = node.lon;
            if (node.lon > maxLon) maxLon = node.lon;
        }

        double originLat = (minLat + maxLat) / 2;
        double originLon = (minLon + maxLon) / 2;

        Debug.Log($"坐标转换原点: ({originLat}, {originLon})");
        Debug.Log($"数据范围: 纬度[{minLat}~{maxLat}], 经度[{minLon}~{maxLon}]");

        foreach (OSMNode node in osmData.nodes)
        {
            node.unityPosition = LatLonToUnityPosition(node.lat, node.lon, originLat, originLon);
        }
    }

    Vector3 LatLonToUnityPosition(double lat, double lon, double originLat, double originLon)
    {
        float x = (float)((lon - originLon) * 111320 * Mathf.Cos((float)originLat * Mathf.Deg2Rad));
        float z = (float)((lat - originLat) * 110574);
        return new Vector3(x, 0, z);
    }

    void AnalyzeParsedData(OSMData data)
    {
        Debug.Log("=== 数据解析分析 ===");

        int buildingWays = 0;
        int roadWays = 0;
        int parkWays = 0;
        int waterWays = 0;
        int otherWays = 0;

        foreach (var way in data.ways)
        {
            if (way.IsBuilding) buildingWays++;
            else if (way.IsRoad) roadWays++;
            else if (way.IsPark) parkWays++;
            else if (way.IsWater) waterWays++;
            else otherWays++;
        }

        Debug.Log($"建筑路径: {buildingWays}");
        Debug.Log($"道路路径: {roadWays}");
        Debug.Log($"公园路径: {parkWays}");
        Debug.Log($"水域路径: {waterWays}");
        Debug.Log($"其他路径: {otherWays}");

        // 分析建筑数据质量
        int buildingsWithEnoughNodes = 0;
        foreach (var way in data.ways)
        {
            if (way.IsBuilding)
            {
                if (way.nodeRefs.Count >= 3)
                {
                    buildingsWithEnoughNodes++;
                }
                else
                {
                    Debug.LogWarning($"建筑 {way.id} 节点数不足: {way.nodeRefs.Count}");
                }
            }
        }

        Debug.Log($"可生成建筑: {buildingsWithEnoughNodes}/{buildingWays}");
    }
}