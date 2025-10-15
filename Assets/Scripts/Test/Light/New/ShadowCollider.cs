using UnityEngine;
using System.Collections.Generic;

public class ShadowCollider : MonoBehaviour
{
    [Header("阴影碰撞器")]
    public GameObject sourceObject;
    public PolygonCollider2D polygonCollider;

    [Header("调试")]
    public bool showGizmos = true;
    public Color gizmoColor = new Color(1, 0, 0, 0.3f);

    public void Initialize(List<List<Vector2>> contours)
    {
        polygonCollider = GetComponent<PolygonCollider2D>();
        if (polygonCollider == null)
            polygonCollider = gameObject.AddComponent<PolygonCollider2D>();

        UpdateCollider(contours);
    }

    public void UpdateCollider(List<List<Vector2>> contours)
    {
        if (polygonCollider == null) return;

        polygonCollider.pathCount = contours.Count;
        for (int i = 0; i < contours.Count; i++)
        {
            polygonCollider.SetPath(i, contours[i].ToArray());
        }
    }

#if UNITY_EDITOR
    void OnDrawGizmos()
    {
        if (!showGizmos || polygonCollider == null) return;

        Gizmos.color = gizmoColor;
        Vector3 offset = transform.forward * 0.01f;

        for (int pathIndex = 0; pathIndex < polygonCollider.pathCount; pathIndex++)
        {
            var path = polygonCollider.GetPath(pathIndex);
            for (int i = 0; i < path.Length; i++)
            {
                Vector3 point1 = transform.TransformPoint(path[i]);
                Vector3 point2 = transform.TransformPoint(path[(i + 1) % path.Length]);
                Gizmos.DrawLine(point1 + offset, point2 + offset);
            }
        }
    }
#endif
}