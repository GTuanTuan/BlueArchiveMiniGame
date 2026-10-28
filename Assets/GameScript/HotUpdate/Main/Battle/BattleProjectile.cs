using System;
using System.Collections.Generic;
using UnityEngine;

namespace Game.Battle
{
    // 纯逻辑弹体。画面由角色原有特效播放，生命周期属于本局而不是攻击动作。
    public sealed class BattleProjectile
    {
        readonly Health target;
        readonly Health[] enemies;
        readonly float damage, speed, radius;
        readonly Action<Health, Vector3> hit;
        readonly bool ground;
        readonly float range, width, height;
        readonly Vector3 direction;
        readonly HashSet<Health> pierced = new HashSet<Health>();
        float travelled;
        Vector3 position, destination;

        public BattleProjectile(Vector3 start, Health target, Health[] enemies,
            float damage, float speed, float radius, Action<Health, Vector3> hit,
            bool ground = false, Vector3 direction = default, float range = 0, float width = 0, float height = 0)
        {
            position = start;
            this.target = target;
            this.enemies = enemies;
            this.damage = damage;
            this.speed = speed;
            this.radius = radius;
            this.hit = hit;
            this.ground = ground;
            this.direction = direction;
            this.range = range;
            this.width = width;
            this.height = height;
            destination = ground ? target.GroundPosition : target.AimPosition;
        }

        // 返回 true 表示完成，本局将其移除；不会重复结算。
        public bool Tick(float delta)
        {
            if (range > 0) return TickPiercing(delta);
            if (!ground && target && target.IsAlive) destination = target.AimPosition;
            position = speed > 0 ? Vector3.MoveTowards(position, destination, speed * delta) : destination;
            if ((position - destination).sqrMagnitude > 0.0001f) return false;
            if (radius <= 0)
            {
                if (target && target.IsAlive) Hit(target);
            }
            else
            {
                foreach (var enemy in enemies)
                    if (enemy && enemy.IsAlive && (enemy.AimPosition - destination).sqrMagnitude <= radius * radius)
                        Hit(enemy);
            }
            return true;
        }

        void Hit(Health enemy)
        {
            hit?.Invoke(enemy, ground ? destination : enemy.AimPosition);
            enemy.Damage(damage);
        }

        // 直线贯穿：沿本帧飞行线段逐个判定，不能只在选中目标处产生一次爆炸。
        bool TickPiercing(float delta)
        {
            float step = Mathf.Min(speed * delta, range - travelled);
            foreach (var enemy in enemies)
            {
                if (!enemy || !enemy.IsAlive || pierced.Contains(enemy)) continue;
                Vector3 point = position + direction * Mathf.Clamp(Vector3.Dot(enemy.AimPosition - position, direction), 0, step);
                Vector3 offset = enemy.AimPosition - point;
                if (Mathf.Abs(offset.y) > height * .5f ||
                    Vector3.ProjectOnPlane(offset, Vector3.up).sqrMagnitude > width * width * .25f) continue;
                pierced.Add(enemy);
                Hit(enemy);
            }
            position += direction * step;
            travelled += step;
            return travelled >= range;
        }
    }
}
