using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FallingObj : MonoBehaviour
{
    public float delay;
    public Vector3 force;
    public void Init(float delay, Vector3 force)
    {
        this.delay = delay;
        this.force = force;
        StartCoroutine(Falling());
    }
    IEnumerator Falling()
    {
        yield return new WaitForSeconds(delay);
        gameObject.AddComponent<MeshCollider>().convex = true;
        //gameObject.AddComponent<Rigidbody>().useGravity = false;
        gameObject.AddComponent<Rigidbody>().AddForce(force,ForceMode.Impulse);
    }
}
