using DestroyIt;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    public float speed;
    public float damage;
    public Vector3 dir;
    // Start is called before the first frame update
    void Start()
    {
        GetComponent<Rigidbody>().velocity = transform.forward * speed;
        dir = transform.forward;
    }

    // Update is called once per frame
    void Update()
    {

    }
    private void OnCollisionEnter(Collision collision)
    {
        GetComponent<Rigidbody>().velocity = dir * speed;
        transform.forward = dir;
        if (collision.gameObject.GetComponent<Destructible>())
        {
            HitEffects hitEffects = collision.gameObject.GetComponentInParent<HitEffects>();
            if (hitEffects != null && hitEffects.effects.Count > 0)
                hitEffects.PlayEffect(HitBy.Bullet, transform.position, transform.forward);
            DestroyIt.Destructible destructible = collision.gameObject.GetComponent<DestroyIt.Destructible>();
            destructible.ApplyDamage(damage);
            if (destructible.CurrentHitPoints > 0)
            {
                Destroy(gameObject);
            }
        }
    }
}