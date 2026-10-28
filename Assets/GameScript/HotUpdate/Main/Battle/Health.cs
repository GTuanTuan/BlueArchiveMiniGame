using System;
using UnityEngine;

namespace Game.Battle
{
    public sealed class Health : MonoBehaviour
    {
        [Min(1)] public float maximum = 300;
        public Transform aimPoint;
        public Transform headPoint;
        public Collider hitbox;
        public GameObject visual;
        public float Current { get; private set; }
        public float Maximum => maximum;
        public bool IsAlive => Current > 0;
        public Vector3 AimPosition => aimPoint ? aimPoint.position : transform.position + Vector3.up;
        public Vector3 GroundPosition => new Vector3(transform.position.x,
            hitbox ? hitbox.bounds.min.y : transform.position.y, transform.position.z);
        public event Action Died;

        // 原版骨骼编号：2 为头部，3 为身体，其余使用角色根节点。
        public Transform EffectAnchor(int bone) => bone == 2 ? headPoint : bone == 3 ? aimPoint : transform;

        void Awake() => ResetHealth();

        public void ResetHealth()
        {
            Current = maximum;
            if (hitbox) hitbox.enabled = true;
            if (visual) visual.SetActive(true);
        }

        // 本轮只有这里修改生命值；死亡靶不再参与选敌和命中。
        public void Damage(float amount)
        {
            if (!IsAlive || amount <= 0) return;
            Current = Mathf.Max(0, Current - amount);
            if (IsAlive) return;
            if (hitbox) hitbox.enabled = false;
            if (visual) visual.SetActive(false);
            Died?.Invoke();
        }
    }
}
