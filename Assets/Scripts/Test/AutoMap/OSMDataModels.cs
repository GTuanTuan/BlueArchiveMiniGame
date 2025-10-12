// Assets/Scripts/Test/AutoMap/OSMDataModels.cs
using System;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class OSMData
{
    public List<OSMNode> nodes = new List<OSMNode>();
    public List<OSMWay> ways = new List<OSMWay>();
}

[Serializable]
public class OSMNode
{
    public long id;
    public double lat;
    public double lon;
    public Vector3 unityPosition;
}

[Serializable]
public class OSMWay
{
    public long id;
    public List<long> nodeRefs = new List<long>();
    public Dictionary<string, string> tags = new Dictionary<string, string>();

    public bool IsBuilding => tags.ContainsKey("building");
    public bool IsRoad => tags.ContainsKey("highway");
    public bool IsPark => tags.ContainsKey("leisure") || (tags.ContainsKey("landuse") && tags["landuse"] == "park");
    public bool IsWater => tags.ContainsKey("waterway") || (tags.ContainsKey("natural") && tags["natural"] == "water");
    public string RoadType => IsRoad ? tags["highway"] : "";
}