using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AttackController : MonoBehaviour
{
    public GameObject Bullet;
    public GameObject Root;
    public float CD;
    public float Timer;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    public void DoAttack()
    {
        GameObject go = Instantiate(Bullet);
        go.transform.position = Root.transform.position;
        go.transform.localScale = new Vector3(0.002f, 0.002f, 0.002f);
        go.transform.rotation = Root.transform.rotation;
        Timer = Time.time;
    }
}
