using UnityEngine;
using System.Collections.Generic;
using System.Linq;

public static class ShadowUtils
{
    public static Light FindMainLight()
    {
        Light[] lights = Object.FindObjectsOfType<Light>();
        return lights.FirstOrDefault(l => l.type == LightType.Directional && l.enabled) ??
               lights.FirstOrDefault(l => l.type == LightType.Spot && l.enabled);
    }

    public static Transform FindMainWall()
    {
        var walls = Object.FindObjectsOfType<Collider>()
            .Where(c => c is BoxCollider)
            .OrderByDescending(c =>
            {
                var box = c as BoxCollider;
                var size = Vector3.Scale(box.size, c.transform.lossyScale);
                return size.x * size.y;
            });

        return walls.FirstOrDefault()?.transform;
    }

    public static List<GameObject> FindObjectsInLayer(string layerName)
    {
        int layer = LayerMask.NameToLayer(layerName);
        return Object.FindObjectsOfType<GameObject>()
            .Where(obj => obj.activeInHierarchy && obj.layer == layer)
            .ToList();
    }

    public static List<GameObject> FindObjectsInLayer(int layer)
    {
        return Object.FindObjectsOfType<GameObject>()
            .Where(obj => obj.activeInHierarchy && obj.layer == layer)
            .ToList();
    }
}