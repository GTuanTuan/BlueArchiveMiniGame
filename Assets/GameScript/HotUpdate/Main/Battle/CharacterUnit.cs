using Game.Characters;
using UnityEngine;
using UnityEngine.AI;

namespace Game.Battle
{
    // 每名上场角色各有一个 Unit；只由 BattleSession 驱动，不自行 Update。
    public sealed class CharacterUnit : MonoBehaviour
    {
        public BattleSession session;
        public CharacterDefinition definition;
        public Health health;
        public NavMeshAgent agent;
        public BACharacterPresentation presentation;

        enum Order { Auto, Move, AttackMove, Focus, Hold }
        enum Action { Idle, Moving, Stopping, Attack, Reload, Ex }

        Order order;
        Action action;
        Health target;
        Health attackTarget;
        Health pendingEx;
        Health[] exTargets;
        CharacterTargetBinding[] exBindings;
        Vector3 destination;
        Vector3 lastPathPoint;
        Vector3 chaseOrigin;
        float reloadRemaining;
        float exTime;
        float cooldownRemaining;
        float repathRemaining;
        int nextNormalShot;
        int nextExShot;
        int ammo;
        int routeIndex;
        bool fieldStarted;
        bool skillFinished;
        bool selected;
        bool hasPathPoint;
        string movementProblem;
        int stopStateHash;
        static readonly int IdleStateHash = Animator.StringToHash("Base Layer.Idle");
        bool defeated;

        public bool Selected => selected;
        public bool IsStopping => action == Action.Stopping;
        public bool IsMoving => action == Action.Moving;
        public bool IsEngaged => action == Action.Attack || action == Action.Reload || action == Action.Ex;
        public string Status => movementProblem ??
            (action == Action.Ex && !fieldStarted ? "Cutscene" : action.ToString());
        public Health Target => target;
        public float CooldownRemaining => cooldownRemaining;
        public int Ammo => ammo;

        public void Initialize(BattleSession owner)
        {
            session = owner;
            ammo = Mathf.Max(1, definition.magazineSize);
            agent.speed = definition.moveSpeed;
            agent.updateRotation = false;
            agent.isStopped = true;
            presentation.BindUnit(transform, session.mainCamera, session.characterLight);
            presentation.FieldStarted += OnFieldStarted;
            presentation.SkillFinished += OnSkillFinished;
            presentation.combat.normalPlaybackControlled = false;
            presentation.combat.NormalShotRequested += OnNormalShot;
            stopStateHash = Animator.StringToHash(definition.stopState);
            action = Action.Idle;
            order = Order.Auto;
        }

        void OnDestroy()
        {
            if (!presentation) return;
            presentation.FieldStarted -= OnFieldStarted;
            presentation.SkillFinished -= OnSkillFinished;
            presentation.combat.NormalShotRequested -= OnNormalShot;
        }

        public void Tick(float dt)
        {
            if (!health.IsAlive)
            {
                if (defeated) return;
                defeated = true;
                if (action == Action.Ex) session.EndCutscene(this);
                StopMoving();
                presentation.CancelAction();
                presentation.animator.SetBool("Moving", false);
                presentation.animator.Play("Base Layer.Defeat_Vital_Death", 0, 0);
                action = Action.Idle;
                return;
            }
            if (session.Won)
            {
                StopMoving();
                if (action == Action.Stopping && !BrakeFinished()) return;
                if (action == Action.Stopping) action = Action.Idle;
                DropTarget();
                Idle();
                return;
            }
            cooldownRemaining = Mathf.Max(0, cooldownRemaining - dt);
            repathRemaining -= dt;
            TickReload(dt);
            if (action == Action.Ex) { TickEx(dt); return; }
            if (action == Action.Stopping)
            {
                if (!BrakeFinished()) return;
                action = Action.Idle;
            }
            if (pendingEx)
            {
                var requested = pendingEx;
                pendingEx = null;
                if (CastEx(requested)) return;
            }

            if (target && !target.IsAlive) DropTarget();
            if (order == Order.Focus && !target) order = Order.Auto;

            if (order == Order.Move || order == Order.AttackMove)
            {
                if (order == Order.AttackMove && TryEngage(dt)) return;
                if (MoveToward(destination, dt)) order = Order.Auto;
                return;
            }

            if (order == Order.Hold)
            {
                StopMoving();
                if (!TargetReady()) target = session.FindTarget(this, definition.attackRange);
                if (CanAttackHere()) { Face(target.AimPosition, dt); TickAttack(); } else Idle();
                return;
            }

            if (!TargetReady()) FindAutoTarget();
            if (target)
            {
                if (CanAttackHere())
                {
                    StopMoving();
                    Face(target.AimPosition, dt);
                    TickAttack();
                }
                else if (CanChase()) MoveToward(target.AimPosition, dt);
                else { DropTarget(); Idle(); }
                return;
            }

            FollowRoute(dt);
        }

        public void MoveTo(Vector3 point, bool attackMove = false)
        {
            pendingEx = null;
            destination = point;
            hasPathPoint = false;
            movementProblem = null;
            order = attackMove ? Order.AttackMove : Order.Move;
            DropTarget();
            CancelAttack(false);
            // 已开始的 EX 播完再执行这条移动命令。
            if (action != Action.Ex && action != Action.Stopping) MoveToward(destination, 0);
        }

        public void AttackTarget(Health enemy)
        {
            if (!enemy || !enemy.IsAlive) { ResumeAuto(); return; }
            order = Order.Focus;
            hasPathPoint = false;
            movementProblem = null;
            target = enemy;
            chaseOrigin = transform.position;
            CancelAttack(false);
        }

        public void Hold()
        {
            pendingEx = null;
            order = Order.Hold;
            movementProblem = null;
            DropTarget();
            CancelAttack(false);
            if (action != Action.Ex) StopMoving();
        }

        public void ResumeAuto()
        {
            order = Order.Auto;
            hasPathPoint = false;
            movementProblem = null;
            DropTarget();
            CancelAttack(false);
        }

        public bool CastEx(Health enemy = null)
        {
            var chosen = enemy && enemy.IsAlive ? enemy : target;
            if (!chosen || !chosen.IsAlive) chosen = session.FindTarget(this, definition.detectionRange);
            if (!chosen || action == Action.Ex || cooldownRemaining > 0 || !health.IsAlive) return false;
            if (action == Action.Moving || action == Action.Stopping)
            {
                pendingEx = chosen;
                StopMoving();
                return true;
            }
            if (!session.BeginCutscene(this)) return false;
            exBindings = ExBindings(chosen);
            CancelAttack();
            Face(chosen.AimPosition, 1f);
            if (!presentation.TryPlayEx(exBindings))
            {
                session.EndCutscene(this);
                exBindings = null;
                exTargets = null;
                return false;
            }
            StopMoving();
            target = chosen;
            action = Action.Ex;
            fieldStarted = false;
            skillFinished = false;
            exTime = 0;
            nextExShot = 0;
            cooldownRemaining = definition.exCooldown;
            session.OwnerExStarted(this);
            return true;
        }

        public void SetSelected(bool value) => selected = value;

        void OnFieldStarted()
        {
            if (action != Action.Ex || fieldStarted) return;
            fieldStarted = true;
            exTime = 0;
            session.EndCutscene(this);
        }

        void OnSkillFinished()
        {
            skillFinished = true;
            session.EndCutscene(this);
        }

        void TickEx(float dt)
        {
            if (!fieldStarted) return;
            exTime += dt;
            var times = definition.exShotTimes;
            while (times != null && nextExShot < times.Length && exTime >= times[nextExShot])
            {
                var victim = ExVictim(nextExShot);
                if (victim)
                    session.Launch(this, victim, definition.exDamage, ExSpeed(nextExShot),
                        definition.exArea ? definition.exRadius : 0, nextExShot, true);
                nextExShot++;
            }
            if (exTime < definition.exDuration || !skillFinished ||
                times != null && nextExShot < times.Length) return;
            fieldStarted = false;
            action = Action.Idle;
            exTargets = null;
            exBindings = null;
            if (target && !target.IsAlive) DropTarget();
        }

        bool TryEngage(float dt)
        {
            if (!TargetReady()) target = session.FindTarget(this, definition.detectionRange);
            if (!CanAttackHere()) return false;
            StopMoving();
            Face(target.AimPosition, dt);
            TickAttack();
            return true;
        }

        void FindAutoTarget()
        {
            target = session.FindTarget(this, definition.detectionRange);
            if (target) chaseOrigin = transform.position;
        }

        bool TargetReady() => target && target.IsAlive;

        bool CanAttackHere() => TargetReady() &&
            InRange(target, definition.attackRange) && session.CanSee(this, target);

        bool CanChase() => TargetReady() &&
            Vector3.Distance(chaseOrigin, transform.position) <= definition.maxChaseDistance;

        bool InRange(Health enemy, float range) =>
            (enemy.AimPosition - transform.position).sqrMagnitude <= range * range;

        void TickAttack()
        {
            if (action == Action.Stopping) return;
            if (reloadRemaining > 0) { ShowReload(); return; }
            if (attackTarget != target)
            {
                attackTarget = target;
                presentation.combat.SetTargets(new[] { Bind(target) });
            }
            if (action != Action.Attack)
            {
                if (presentation.IsBusy) return;
                var heading = Vector3.ProjectOnPlane(target.AimPosition - transform.position, Vector3.up);
                if (Vector3.Angle(transform.forward, heading) > 5f) return;
                if (ammo <= 0) { BeginReload(); return; }
                action = Action.Attack;
                nextNormalShot = 0;
                presentation.animator.SetBool("KeepAttacking", true);
                presentation.PlayAttack();
                return;
            }
            presentation.animator.SetBool("KeepAttacking", ammo > 0);
            if (presentation.IsBusy) return;
            action = Action.Idle;
            if (ammo <= 0) BeginReload();
        }

        void OnNormalShot(int index, CharacterNormalAttackData normal)
        {
            if (action != Action.Attack || !attackTarget || !attackTarget.IsAlive) return;
            // 每轮 Ing 的第一个射击事件开始一轮普攻；桃井一轮仍包含三发。
            if (index == 0)
            {
                if (ammo <= 0) return;
                nextNormalShot = 0;
                ammo--;
                if (ammo == 0) presentation.animator.SetBool("KeepAttacking", false);
            }
            if (index != nextNormalShot) return;
            nextNormalShot++;
            // 同一动画事件负责表现投射物，这里只扣弹并启动真实伤害。
            session.Launch(this, attackTarget, definition.damage, normal.speed, 0, index);
        }

        void BeginReload()
        {
            reloadRemaining = definition.reloadSeconds;
            if (reloadRemaining <= 0) { ammo = Mathf.Max(1, definition.magazineSize); return; }
            ShowReload();
        }

        void TickReload(float dt)
        {
            if (reloadRemaining <= 0) return;
            reloadRemaining -= dt;
            if (reloadRemaining > 0) return;
            reloadRemaining = 0;
            ammo = Mathf.Max(1, definition.magazineSize);
            if (action == Action.Reload) { presentation.CancelAction(); action = Action.Idle; }
        }

        void ShowReload()
        {
            if (action == Action.Stopping || action == Action.Reload || presentation.IsBusy) return;
            action = Action.Reload;
            presentation.PlayReload();
        }

        bool MoveToward(Vector3 point, float dt)
        {
            if (action == Action.Stopping) return false;
            if (action == Action.Attack)
            {
                CancelAttack(false); // 走完当前射击和收枪，再执行移动命令。
                if (presentation.IsBusy) return false;
                action = Action.Idle;
            }
            float stop = Mathf.Max(0.2f, agent.stoppingDistance);
            if ((point - transform.position).sqrMagnitude <= stop * stop)
            { StopMoving(); return true; }
            if (action == Action.Reload) presentation.CancelAction();
            action = Action.Moving;
            agent.isStopped = false;
            if (!hasPathPoint || repathRemaining <= 0 &&
                (point - lastPathPoint).sqrMagnitude > 0.04f)
            {
                if (!NavMesh.SamplePosition(point, out var hit, 2f, NavMesh.AllAreas) ||
                    !agent.SetDestination(hit.position))
                { FailMovement(); return false; }
                lastPathPoint = point;
                hasPathPoint = true;
                repathRemaining = 0.25f;
            }
            if (hasPathPoint && repathRemaining <= 0 && !agent.pathPending &&
                agent.pathStatus == NavMeshPathStatus.PathInvalid)
            { FailMovement(); return false; }
            presentation.SetMoving(true);
            if (agent.velocity.sqrMagnitude > 0.01f) Face(transform.position + agent.velocity, dt);
            return false;
        }

        void FollowRoute(float dt)
        {
            var route = session.route;
            if (route == null || routeIndex >= route.Length || !route[routeIndex]) { Idle(); return; }
            if (MoveToward(route[routeIndex].position, dt)) routeIndex++;
        }

        void FailMovement()
        {
            movementProblem = "No path";
            order = Order.Hold;
            hasPathPoint = false;
            StopMoving();
        }

        void Face(Vector3 point, float dt)
        {
            var delta = point - transform.position;
            delta.y = 0;
            if (delta.sqrMagnitude < 0.0001f) return;
            transform.rotation = Quaternion.RotateTowards(transform.rotation,
                Quaternion.LookRotation(delta), definition.turnSpeed * dt);
        }

        void StopMoving()
        {
            if (!agent.isStopped) agent.isStopped = true;
            if (action != Action.Moving) return;
            presentation.SetMoving(false);
            action = Action.Stopping;
        }

        bool BrakeFinished()
        {
            var animator = presentation.animator;
            var current = animator.GetCurrentAnimatorStateInfo(0);
            if (current.fullPathHash == stopStateHash) return false;
            if (animator.IsInTransition(0) &&
                animator.GetNextAnimatorStateInfo(0).fullPathHash == stopStateHash) return false;
            // 刹车状态自然退出到 Idle 后才允许下一次攻击或移动。
            return !animator.IsInTransition(0) && current.fullPathHash == IdleStateHash;
        }

        void Idle()
        {
            StopMoving();
            if (action == Action.Attack)
            {
                CancelAttack(false);
                if (!presentation.IsBusy) action = Action.Idle;
            }
            if (reloadRemaining > 0) ShowReload();
        }

        void CancelAttack(bool immediate = true)
        {
            if (action != Action.Attack && action != Action.Reload) return;
            presentation.animator.SetBool("KeepAttacking", false);
            if (!immediate && action == Action.Attack) return;
            attackTarget = null;
            presentation.CancelAction();
            action = Action.Idle;
        }

        void DropTarget()
        {
            target = null;
            if (action == Action.Attack)
            {
                CancelAttack(false);
                if (!attackTarget || !attackTarget.IsAlive)
                {
                    attackTarget = null;
                    presentation.combat.SetTargets(System.Array.Empty<CharacterTargetBinding>());
                }
            }
        }

        float ExSpeed(int index)
        {
            return ExShot(index)?.speed ?? 0;
        }

        public CharacterShotData ExShot(int ordinal)
        {
            int index = definition.exShotIndices[ordinal];
            var shots = presentation.SelectedSkill.data.shots;
            return index >= 0 && index < shots.Length ? shots[index] : null;
        }

        public CharacterTargetBinding Bind(Health enemy)
        {
            var aim = enemy.aimPoint ? enemy.aimPoint : enemy.transform;
            return new CharacterTargetBinding {
                target = enemy.transform, aimAnchor = aim, bodyAnchor = aim,
                headAnchor = aim, effectAnchor = aim, areaHitAnchor = aim,
                visualOrigin = enemy.transform, entityDirection = transform.forward,
                hitColliders = enemy.hitbox ? new[] { enemy.hitbox } : null,
                worldPoint = enemy.GroundPosition,
                logicalOrigin = transform
            };
        }

        CharacterTargetBinding[] ExBindings(Health primary)
        {
            var enemies = session.enemies;
            int count = 1;
            foreach (var enemy in enemies)
                if (enemy && enemy.IsAlive && enemy != primary) count++;
            int slots = Mathf.Max(5, count);
            exTargets = new Health[slots];
            exTargets[0] = primary;
            int index = 1;
            foreach (var enemy in enemies)
                if (enemy && enemy.IsAlive && enemy != primary) exTargets[index++] = enemy;
            for (; index < slots; index++) exTargets[index] = exTargets[index % count];
            var bindings = new CharacterTargetBinding[slots];
            for (int i = 0; i < slots; i++) bindings[i] = Bind(exTargets[i]);
            return bindings;
        }

        Health ExVictim(int shotIndex)
        {
            if (exTargets == null) return null;
            int slot = shotIndex % exTargets.Length;
            var shot = ExShot(shotIndex);
            if (shot != null) slot = Mathf.Clamp(shot.targetSlot, 0, exTargets.Length - 1);
            var victim = exTargets[slot];
            if (victim && victim.IsAlive) return victim;
            foreach (var candidate in exTargets)
                if (candidate && candidate.IsAlive) { victim = candidate; break; }
            if (!victim || !victim.IsAlive)
                victim = session.FindTarget(this, definition.detectionRange);
            if (!victim || !victim.IsAlive) return null;
            exTargets[slot] = victim;
            exBindings[slot] = Bind(victim);
            presentation.combat.SetTargets(exBindings);
            return victim;
        }
    }
}
