using System.Collections.Generic;
using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.Playables;
using UnityEngine.Timeline;
using Game.Characters;

namespace Game.Battle
{
    [DefaultExecutionOrder(-200)]
    public sealed class BattleSession : MonoBehaviour
    {
        [System.Serializable]
        public sealed class Sequence
        {
            public GameObject root;
            public PlayableDirector director;
            public Transform[] slots;
            public AnimationTrack[] tracks;
            public AudioClip[] voices;
            public float voiceDelay;
        }
        [System.Serializable]
        public sealed class Support
        {
            public string displayName;
            public Texture2D portrait;
            public BACharacterPresentation presentation;
            public Transform root;
            public AnimationClip entranceClip;
            public AudioClip entranceVoice;
            public float cooldown = 12f;
            public float fireTime = -1f; // -1：没有战场投射物，例如 CH0336。
            public float damage = 80f;
            [System.NonSerialized] public float cooldownRemaining;
            [System.NonSerialized] public CharacterUnit owner;
            [System.NonSerialized] public Health target;
            [System.NonSerialized] public bool fieldActive, fired;
            [System.NonSerialized] public float fieldClock;
            [System.NonSerialized] public Vector3 stagePosition;
        }
        public Camera mainCamera;
        public Light characterLight;
        public CharacterUnit[] allies;
        public Support[] supports = new Support[2];
        public Health[] enemies;
        public Transform[] route;
        public LayerMask obstacleMask;
        public BAResourceOriginalPostProcessCamera bloom;
        public Sequence entrance, victory;
        public PlayableDirector fightTitle;
        public GameObject victoryUI;
        public GameObject victoryTitleUI;
        public GameObject defeatUI, selectionUI;
        public Transform extractionPoint;
        public float extractionRadius = 3f;
        public float extractionSeconds = 3f;
        public float ExtractionProgress { get; private set; }
        readonly List<BattleProjectile> projectiles = new List<BattleProjectile>();
        readonly Dictionary<AnimationPlayableAsset, AnimationClip> sequenceClips = new Dictionary<AnimationPlayableAsset, AnimationClip>();
        CharacterUnit exOwner;
        BACharacterPresentation exPresentation;
        bool fieldStarted;
        bool frozen;
        readonly List<CharacterUnit> frozenUnits = new List<CharacterUnit>();
        public bool Paused { get; private set; }
        public bool IsCutscene => exPresentation && !fieldStarted;
        public bool Won { get; private set; }
        public bool Lost { get; private set; }
        public bool Selecting { get; private set; } = true;
        public bool ShowingIntro { get; private set; }

        void Start()
        {
            Time.timeScale = 1;
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
            selectionUI.SetActive(true);
            mainCamera.GetComponent<UnityEngine.Rendering.Universal.UniversalAdditionalCameraData>().renderPostProcessing = true;
        }

        public void BeginBattle()
        {
            if (!Selecting) return;
            Selecting = false;
            mainCamera.GetComponent<UnityEngine.Rendering.Universal.UniversalAdditionalCameraData>().renderPostProcessing = false;
            ShowingIntro = true;
            foreach (var unit in allies)
            {
                var presentation = unit.presentation;
                BindBloom(presentation);
                unit.health.maximum = unit.definition.hitPoints;
                unit.health.ResetHealth();
                unit.Initialize(this);
            }
            foreach (var support in supports)
            {
                if (support == null || !support.presentation) continue;
                BindBloom(support.presentation);
                support.stagePosition = support.root.position;
                support.presentation.BindUnit(support.root, mainCamera, characterLight);
                var slot = support;
                support.presentation.FieldStarted += () => SupportFieldStarted(slot);
                support.presentation.SkillFinished += () => SupportFinished(slot);
                HideSupport(support);
            }
            StartCoroutine(ShowIntro());
        }

        void BindBloom(BACharacterPresentation presentation)
        {
            if (!bloom || presentation.battleBloom == bloom) return;
            if (presentation.battleBloom)
            {
                presentation.battleBloom.ReleaseRegistration();
                presentation.battleBloom.enabled = false;
            }
            presentation.battleBloom = bloom;
            foreach (var slot in presentation.skills)
                if (slot.transition) slot.transition.originalBloomMarker = bloom;
        }

        IEnumerator ShowIntro()
        {
            ShowingIntro = true;
            var sequence = PlaySequence(entrance, true);
            while (sequence.MoveNext()) yield return sequence.Current;
            ShowingIntro = false;
            if (fightTitle) { fightTitle.gameObject.SetActive(true); fightTitle.Play(); }
        }

        IEnumerator ShowVictory()
        {
            extractionPoint.gameObject.SetActive(false);
            foreach (var unit in allies) unit.Hold();
            // 已释放的 EX 先结束，不能让胜利动画与 Timeline 同时写模型。
            bool busy = true;
            while (busy)
            {
                busy = false;
                foreach (var unit in allies) if (unit.presentation.IsBusy) busy = true;
                if (exPresentation && exPresentation.IsBusy) busy = true;
                if (busy) yield return null;
            }
            victoryTitleUI.SetActive(true);
            yield return new WaitForSeconds(1.3333334f);
            victoryTitleUI.SetActive(false);
            victoryUI.SetActive(true);
            yield return PlaySequence(victory, false);
        }

        IEnumerator PlaySequence(Sequence sequence, bool restore)
        {
            // 入场由编队首位队长领队；胜利从存活队员中随机选人。
            var lead = allies[0];
            if (!restore)
            {
                var candidates = new List<CharacterUnit>();
                foreach (var unit in allies)
                    if (unit.health.IsAlive) candidates.Add(unit);
                lead = candidates[Random.Range(0, candidates.Count)];
            }
            var cast = (CharacterUnit[])allies.Clone();
            int leadIndex = System.Array.IndexOf(cast, lead);
            cast[leadIndex] = cast[0];
            cast[0] = lead;
            int count = sequence.slots.Length;
            var actors = new Transform[count];
            var positions = new Vector3[count];
            var rotations = new Quaternion[count];
            var parents = new Transform[count];
            Vector3 center = Vector3.zero;
            foreach (var unit in allies) center += unit.transform.position;
            sequence.root.transform.position = center / allies.Length;
            for (int i = 0; i < count; i++)
            {
                var presentation = i < cast.Length ? cast[i].presentation : supports[i - cast.Length].presentation;
                var actor = i < cast.Length ? cast[i].transform : supports[i - cast.Length].root;
                actors[i] = actor;
                positions[i] = actor.position;
                rotations[i] = actor.rotation;
                parents[i] = actor.parent;
                if (i < cast.Length) cast[i].agent.enabled = false;
                actor.SetParent(sequence.slots[i], false);
                actor.localPosition = Vector3.zero;
                actor.localRotation = Quaternion.identity;
                sequence.director.SetGenericBinding(sequence.tracks[i], presentation.animator);
                int part = 0;
                foreach (var clip in sequence.tracks[i].GetClips())
                {
                    var playable = (AnimationPlayableAsset)clip.asset;
                    if (!sequenceClips.ContainsKey(playable)) sequenceClips.Add(playable, playable.clip);
                    if (restore) playable.clip = i < cast.Length
                        ? (i == 0 ? cast[i].definition.entranceClip : cast[i].definition.idleClip)
                        : supports[i - cast.Length].entranceClip;
                    else playable.clip = part++ == 0 ? cast[i].definition.victoryStart : cast[i].definition.victoryEnd;
                }
            }
            sequence.root.SetActive(true);
            sequence.director.time = 0;
            sequence.director.extrapolationMode = DirectorWrapMode.Hold;
            sequence.director.Play();
            // 第一帧先摆好相机、动作和显隐，再移走编队画面。
            sequence.director.Evaluate();
            if (restore) selectionUI.SetActive(false);
            mainCamera.GetComponent<Cinemachine.CinemachineBrain>().ManualUpdate();
            yield return new WaitForSeconds(sequence.voiceDelay);
            var voices = lead.definition.entranceVoices;
            var voice = restore ? voices[Random.Range(0, voices.Length)] : lead.definition.victoryVoice;
            AudioManager.Inst.Play(voice, sequence.root.transform.position);
            yield return new WaitForSeconds((float)sequence.director.duration - sequence.voiceDelay);
            if (!restore) yield break;
            sequence.director.Stop();
            for (int i = 0; i < count; i++)
            {
                actors[i].SetParent(parents[i], true);
                actors[i].SetPositionAndRotation(positions[i], rotations[i]);
                if (i < cast.Length)
                {
                    cast[i].presentation.animator.Play("Base Layer.Idle", 0, 0);
                    cast[i].agent.enabled = true;
                    cast[i].agent.Warp(positions[i]);
                }
            }
            sequence.root.SetActive(false);
        }

        void Update()
        {
            if (Selecting || Paused || ShowingIntro || Won || Lost) return;
            if (exPresentation && !exPresentation.IsBusy)
            { exPresentation = null; exOwner = null; }
            FreezeOthers(IsCutscene);
            if (IsCutscene) return;
            float dt = Time.deltaTime;
            foreach (var unit in allies) unit.Tick(dt);
            TickSupports(dt);
            for (int i = projectiles.Count - 1; i >= 0; i--)
                if (projectiles[i].Tick(dt)) projectiles.RemoveAt(i);
            bool alive = false;
            foreach (var unit in allies) if (unit.health.IsAlive) alive = true;
            if (!alive) { Lost = true; StartCoroutine(ShowDefeat()); return; }
            TickExtraction(dt);
        }

        IEnumerator ShowDefeat()
        {
            float duration = 0;
            foreach (var unit in allies) duration = Mathf.Max(duration, unit.definition.defeatClip.length);
            yield return new WaitForSeconds(duration);
            defeatUI.SetActive(true);
        }

        void TickExtraction(float dt)
        {
            bool ready = extractionPoint;
            int alive = 0;
            foreach (var unit in allies)
            {
                if (!unit.health.IsAlive) continue;
                alive++;
                if ((unit.transform.position - extractionPoint.position).sqrMagnitude > extractionRadius * extractionRadius ||
                    unit.IsMoving || unit.IsStopping) ready = false;
            }
            ExtractionProgress = ready && alive > 0 ? ExtractionProgress + dt : 0;
            if (ExtractionProgress < extractionSeconds) return;
            Won = true;
            StartCoroutine(ShowVictory());
        }

        public Health FindTarget(CharacterUnit unit, float range)
        {
            Health nearest = null;
            float best = range * range;
            foreach (var enemy in enemies)
            {
                if (!enemy || !enemy.IsAlive) continue;
                float distance = (enemy.transform.position - unit.transform.position).sqrMagnitude;
                if (distance < best && CanSee(unit, enemy)) { best = distance; nearest = enemy; }
            }
            return nearest;
        }

        public bool CanSee(CharacterUnit unit, Health target) =>
            !Physics.Linecast(unit.health.AimPosition, target.AimPosition, obstacleMask, QueryTriggerInteraction.Ignore);

        public void Launch(CharacterUnit owner, Health target, float damage, float speed, float radius = 0,
            int shotIndex = 0, bool skill = false)
        {
            var combat = owner.presentation.combat;
            var shot = skill ? owner.ExShot(shotIndex) : null;
            int sourceNode = shot != null ? shot.sourceNodeIndex : -1;
            bool ground = skill ? shot != null && shot.useWorldPoint : combat.CurrentNormal.pointTarget;
            bool piercing = shot != null && shot.fixedForward;
            string eventId = System.Guid.NewGuid().ToString();
            projectiles.Add(new BattleProjectile(combat.GetMuzzlePosition(), target, enemies,
                damage, speed, radius, (victim, point) => {
                    if (!combat) return;
                    if (!skill)
                    {
                        var outcome = System.Array.Find(combat.CurrentNormal.outcomes,
                            o => o.hit && (o.material == CharacterHitMaterial.Flesh || o.material == CharacterHitMaterial.Any));
                        int bone = outcome != null ? outcome.requiredBone : 0;
                        combat.NotifyNormalOutcome(shotIndex, true, CharacterHitMaterial.Flesh,
                            point, owner.transform.rotation, victim.EffectAnchor(bone), bone);
                    }
                    else if (sourceNode >= 0) combat.NotifyOutcome(sourceNode, 0, eventId + victim.GetInstanceID(),
                        owner.Bind(victim), point, true, CharacterHitMaterial.Flesh);
                }, ground, owner.transform.forward, piercing ? shot.range : 0,
                owner.definition.exPiercingWidth, owner.definition.exPiercingHeight));
        }

        public bool PlaySupport(int index, CharacterUnit allyTarget = null)
        {
            if (Selecting || Paused || ShowingIntro || Won || Lost || exPresentation ||
                index < 0 || index >= supports.Length) return false;
            var support = supports[index];
            if (support == null || !support.presentation || support.cooldownRemaining > 0) return false;

            Health target;
            CharacterUnit chosenOwner = null;
            if (support.fireTime < 0) // CH0336：选中的前排是强化对象。
            {
                if (!allyTarget || !allyTarget.health.IsAlive) return false;
                chosenOwner = allyTarget;
                target = allyTarget.health;
            }
            else // CH0203：选中前排正在攻击的敌人，否则选最近存活敌人。
            {
                target = allyTarget && allyTarget.Target && allyTarget.Target.IsAlive ? allyTarget.Target :
                    FindTarget(allyTarget ? allyTarget : allies[0], 1000f);
                if (!target) return false;
            }

            exOwner = null;
            exPresentation = support.presentation;
            fieldStarted = false;
            support.target = target;
            support.fieldActive = false;
            support.fired = false;
            support.fieldClock = 0;
            support.root.position = support.stagePosition;
            if (!support.presentation.TryPlayEx(SupportBindings(support, target)))
            {
                HideSupport(support);
                exPresentation = null;
                return false;
            }
            // BeginCast 会清除旧绑定，因此必须在 TryPlayEx 成功后设置。
            if (support.fireTime < 0)
            {
                support.owner = chosenOwner;
                support.presentation.combat.BindSupportedExOwner(allyTarget.transform, allyTarget.health.aimPoint);
            }
            support.cooldownRemaining = support.cooldown;
            return true;
        }

        void SupportFieldStarted(Support support)
        {
            if (exPresentation != support.presentation) return;
            support.fieldActive = true;
            support.fieldClock = 0;
            fieldStarted = true;
            FreezeOthers(false);
        }

        void SupportFinished(Support support)
        {
            support.fieldActive = false;
            HideSupport(support);
            if (exPresentation == support.presentation)
            { fieldStarted = true; FreezeOthers(false); }
        }

        void TickSupports(float dt)
        {
            foreach (var support in supports)
            {
                if (support == null) continue;
                support.cooldownRemaining = Mathf.Max(0, support.cooldownRemaining - dt);
                if (!support.fieldActive || support.fired || support.fireTime < 0) continue;
                support.fieldClock += dt;
                if (support.fieldClock < support.fireTime) continue;
                support.fired = true;
                var victim = support.target;
                if (!victim || !victim.IsAlive) victim = FindTarget(allies[0], 1000f);
                if (!victim) continue;
                support.target = victim;
                support.presentation.combat.SetTargets(SupportBindings(support, victim));
                LaunchSupport(support, victim);
            }
        }

        void LaunchSupport(Support support, Health target)
        {
            var combat = support.presentation.combat;
            var shot = combat.Skill.shots[0];
            string eventId = System.Guid.NewGuid().ToString();
            projectiles.Add(new BattleProjectile(combat.GetMuzzlePosition(), target, enemies,
                support.damage, shot.speed, 0, (victim, point) => {
                    if (combat) combat.NotifyOutcome(shot.sourceNodeIndex, 0, eventId,
                        BindSupport(support, victim), point, true, CharacterHitMaterial.Flesh);
                }, shot.useWorldPoint));
        }

        CharacterTargetBinding BindSupport(Support support, Health target)
        {
            var aim = target.aimPoint ? target.aimPoint : target.transform;
            return new CharacterTargetBinding { target = target.transform, aimAnchor = aim,
                bodyAnchor = aim, headAnchor = aim, effectAnchor = aim, areaHitAnchor = aim,
                hitColliders = target.hitbox ? new[] { target.hitbox } : null,
                visualOrigin = target.visual ? target.visual.transform : target.transform,
                worldPoint = target.GroundPosition, logicalOrigin = support.root };
        }

        CharacterTargetBinding[] SupportBindings(Support support, Health target)
        {
            var binding = BindSupport(support, target);
            var bindings = new CharacterTargetBinding[5];
            for (int i = 0; i < bindings.Length; i++) bindings[i] = binding;
            return bindings;
        }

        void HideSupport(Support support) =>
            support.root.position = support.stagePosition + Vector3.down * 1000f;

        // Unit.CastEx 成功启动 Presentation 之后调用一次；11 是原 EX 行为范围 11..20 的首值。
        public void OwnerExStarted(CharacterUnit owner)
        {
            const int ExActionBehavior = 11;
            foreach (var support in supports)
                if (support != null && support.fireTime < 0 && support.owner == owner)
                    support.presentation.combat.NotifySupportedEx(owner.transform,
                        ExActionBehavior, true, System.Guid.NewGuid().ToString());
        }

        // 整段技能独占演出入口，战场阶段恢复其余队员行动。
        public bool BeginCutscene(CharacterUnit owner)
        {
            if (Selecting || Paused || ShowingIntro || Won || Lost || exPresentation) return false;
            exOwner = owner;
            exPresentation = owner.presentation;
            fieldStarted = false;
            return true;
        }

        public void EndCutscene(CharacterUnit owner)
        {
            if (owner != exOwner) return;
            fieldStarted = true;
            FreezeOthers(false);
        }

        void FreezeOthers(bool value)
        {
            if (frozen == value) return;
            frozen = value;
            if (value)
            {
                foreach (var unit in allies)
                {
                    if (unit == exOwner || !unit.health.IsAlive) continue;
                    frozenUnits.Add(unit);
                    unit.agent.isStopped = true;
                    unit.presentation.animator.speed = 0;
                }
            }
            else
            {
                foreach (var unit in frozenUnits)
                    if (unit) unit.presentation.animator.speed = 1;
                frozenUnits.Clear();
            }
        }

        public void TogglePause()
        {
            if (IsCutscene) return;
            Paused = !Paused;
            Time.timeScale = Paused ? 0 : 1;
        }

        public void Restart()
        {
            Time.timeScale = 1;
            SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
        }

        void OnDisable()
        {
            Time.timeScale = 1;
            FreezeOthers(false);
            foreach (var original in sequenceClips) if (original.Key) original.Key.clip = original.Value;
            sequenceClips.Clear();
        }
    }
}
