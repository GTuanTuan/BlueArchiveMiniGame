using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// Timeline owns fixed timing and media. This component only follows actual
// targets, moves bullets and reacts to game-confirmed events.
public sealed class CharacterCombat : MonoBehaviour
{
    [SerializeField] CharacterSkillData skill;
    [SerializeField] Transform[] anchors = Array.Empty<Transform>();
    [SerializeField] SimpleCharacterTrial.ExCameraTransition cameraTransition;
    [NonSerialized] public Transform facingRoot;
    [NonSerialized] public bool normalPlaybackControlled;

    CharacterTargetBinding[] targets = Array.Empty<CharacterTargetBinding>();
    readonly HashSet<string> outcomes = new HashSet<string>();
    readonly HashSet<string> ownerExEvents = new HashSet<string>();
    readonly Dictionary<int, GameObject> bulletsByIndex = new Dictionary<int, GameObject>();
    readonly List<GameObject> activeBullets = new List<GameObject>();
    readonly List<GameObject> activeEffects = new List<GameObject>();
    readonly List<FixedRotationEffect> fixedRotationEffects = new List<FixedRotationEffect>();
    Transform supportedExOwner;
    CharacterTargetBinding supportedExBinding;
    int supportedExCount;
    int castVersion;
    int formIndex;

    struct FixedRotationEffect
    {
        public GameObject instance;
        public Quaternion rotation;
    }

    public event Action<CharacterFlightArrival> ShotArrived;
    public event Action<CharacterFormData> FormRequested;
    public event Action<int, CharacterNormalAttackData> NormalShotRequested;
    public event Action<int, CharacterGameplayStageData> GameplayStageRequested;
    public Func<Vector3> NormalRandom;
    public CharacterSkillData Skill => skill;
    public CharacterNormalAttackData CurrentNormal =>
        formIndex != 0 && skill?.enhancedNormal != null &&
        (!string.IsNullOrEmpty(skill.enhancedNormal.normalSkillId) || skill.enhancedNormal.projectile)
            ? skill.enhancedNormal : skill?.baselineNormal;

    public void SetAnchors(Transform[] value) => anchors = value ?? Array.Empty<Transform>();

    public Vector3 GetMuzzlePosition()
    {
        var normal = CurrentNormal;
        var muzzle = normal != null ? Anchor(normal.muzzleIndex) : null;
        return muzzle ? muzzle.position : transform.position;
    }

    // Preview initialization and form selection can assign data without
    // starting an EX cast or playing its Timeline.
    public void SetSkill(CharacterSkillData data)
    {
        if (skill == data) return;
        CancelCast();
        skill = data;
    }

    public void SetNormalTarget(Transform target) => SetNormalTarget(target, target, target);

    public void SetNormalTarget(Transform target, Transform aimAnchor, Transform effectAnchor)
    {
        if (targets.Length == 0) targets = new CharacterTargetBinding[1];
        var pointAnchor = aimAnchor ? aimAnchor : target;
        targets[0] = new CharacterTargetBinding { target = target, aimAnchor = aimAnchor,
            effectAnchor = effectAnchor, logicalOrigin = transform,
            worldPoint = pointAnchor ? pointAnchor.position : transform.position };
    }

    public bool BeginCast(CharacterSkillData data, CharacterTargetBinding[] bindings, Transform actorFacing = null)
    {
        if (!data || bindings == null) return false;
        CancelCast();
        skill = data;
        targets = (CharacterTargetBinding[])bindings.Clone();
        facingRoot = actorFacing;
        return true;
    }

    public bool SetTargets(CharacterTargetBinding[] value)
    {
        if (value == null) return false;
        targets = (CharacterTargetBinding[])value.Clone();
        return true;
    }

    // SignalReceiver reactions are persistently bound to these indexed methods
    // by the editor compiler; there is no runtime Signal registration.
    public void Fire(int index)
    {
        if (!skill || index < 0 || index >= skill.shots.Length) return;
        var shot = skill.shots[index];
        if (shot == null || !shot.projectile) return;
        var muzzle = Anchor(shot.muzzleIndex);
        if (!muzzle) return;
        if (shot.fixedForward)
        {
            Vector3 forward = transform.forward.normalized;
            StartCoroutine(Fly(index, shot, default, muzzle.position,
                muzzle.position + forward * shot.range, Vector3.zero, castVersion));
            return;
        }
        if (!TryTarget(shot.targetSlot, shot.requiredConditionKey, out var target)) return;
        if (shot.targetBone == 0)
        {
            if (!target.bodyAnchor) return;
            target.aimAnchor = target.bodyAnchor;
        }
        else if (shot.targetBone == 2)
        {
            if (!target.headAnchor) return;
            target.aimAnchor = target.headAnchor;
        }
        if (!shot.useWorldPoint && !target.useWorldPoint && !target.aimAnchor) return;
        var endpoint = Point(target, shot.useWorldPoint) + Vector3.up * shot.destinationVerticalOffset;
        Face(endpoint - muzzle.position);
        StartCoroutine(Fly(index, shot, target, muzzle.position, endpoint, Vector3.zero, castVersion));
    }

    // Momoi's four authored EX animation events each test the current aim cone.
    // The preview or game host supplies target colliders and the BodyBone anchor.
    public void AreaHit(int index)
    {
        if (!skill || index < 0 || index >= skill.areaHits.Length) return;
        var cue = skill.areaHits[index];
        if (cue == null || !cue.prefab) return;
        Vector3 origin = transform.position;
        Vector3 direction = facingRoot ? facingRoot.forward : transform.forward;
        if (targets.Length > 0)
        {
            var selected = targets[0];
            if (selected.useWorldPoint) direction = selected.worldPoint - origin;
            else if (selected.target)
            {
                var aim = selected.bodyAnchor ? selected.bodyAnchor : selected.aimAnchor;
                direction = (aim ? aim.position : selected.target.position) - origin;
            }
        }
        direction.y = 0f;
        if (direction.sqrMagnitude < 0.0001f) return;
        direction.Normalize();
        float rangeSquared = cue.range * cue.range;
        var hitTargets = new HashSet<Transform>();
        foreach (var target in targets)
        {
            if (!target.target || !target.target.gameObject.activeInHierarchy || target.hitColliders == null ||
                hitTargets.Contains(target.target)) continue;
            foreach (var hitbox in target.hitColliders)
            {
                if (!hitbox || !hitbox.enabled || !hitbox.gameObject.activeInHierarchy) continue;
                Vector3 contact = hitbox.ClosestPoint(origin);
                Vector3 offset = contact - origin;
                offset.y = 0f;
                if (offset.sqrMagnitude > rangeSquared ||
                    offset.sqrMagnitude > 0.0001f && Vector3.Angle(direction, offset) > cue.coneDegrees * .5f)
                    continue;
                Spawn(cue.prefab, target.areaHitAnchor ? target.areaHitAnchor.position : contact,
                    cue.prefab.transform.localRotation);
                hitTargets.Add(target.target);
                break; // One visual per target per authored event.
            }
        }
    }

    public void FireNormal(int index)
    {
        if (normalPlaybackControlled) return;
        EmitNormalShot(index);
    }

    // The unit's attack clock calls this directly; authored events use FireNormal.
    public void EmitNormalShot(int index)
    {
        if (skill && skill.sourceHasNoNormalSkill) return;
        var normal = CurrentNormal;
        if (normal == null || index < 0 || index >= normal.shotFrames.Length || !normal.projectile ||
            !TryTarget(0, null, out var target)) return;
        if (!normal.pointTarget && !target.useWorldPoint && !target.aimAnchor) return;
        var muzzle = Anchor(normal.muzzleIndex);
        if (!muzzle) return;
        var random = NormalRandom != null ? NormalRandom() :
            new Vector3(UnityEngine.Random.value, UnityEngine.Random.value, UnityEngine.Random.value);
        var localOffset = normal.destinationOffset + new Vector3(
            Mathf.Lerp(normal.destinationRandomMin.x, normal.destinationRandomMax.x, random.x),
            Mathf.Lerp(normal.destinationRandomMin.y, normal.destinationRandomMax.y, random.y),
            Mathf.Lerp(normal.destinationRandomMin.z, normal.destinationRandomMax.z, random.z));
        var endpoint = Point(target, normal.pointTarget) + AimOffset(target, localOffset);
        if (normal.muzzleEffect) Spawn(normal.muzzleEffect, muzzle.position, muzzle.rotation);
        int version = castVersion;
        NormalShotRequested?.Invoke(index, normal);
        if (version != castVersion || !isActiveAndEnabled) return;
        var shot = new CharacterShotData {
            sourceNodeIndex = -1, targetSlot = 0, projectile = normal.projectile,
            speed = normal.speed, useWorldPoint = normal.pointTarget, durationFromSpeed = true,
            logicFramesPerSecond = normal.logicFramesPerSecond,
            forwardCurves = new[] { normal.forwardCurve }, rightCurves = new[] { normal.rightCurve },
            upCurves = new[] { normal.upCurve }
        };
        StartCoroutine(Fly(index, shot, target, muzzle.position, endpoint, localOffset, version));
    }

    IEnumerator Fly(int index, CharacterShotData shot, CharacterTargetBinding target,
        Vector3 origin, Vector3 endpoint, Vector3 localOffset, int version)
    {
        if (shot.fireDelay > 0f) yield return new WaitForSeconds(shot.fireDelay);
        if (version != castVersion) yield break;
        var direction = endpoint - origin;
        var bullet = Spawn(shot.projectile, origin,
            direction.sqrMagnitude > 0.000001f ? Quaternion.LookRotation(direction) : transform.rotation,
            manualStop: true, sounds: shot.sounds);
        if (!bullet) yield break;
        // Once spawned, this flight owns its captured shot and target until arrival.
        // A new cast only cancels delayed work that has not produced a bullet yet.
        activeBullets.Add(bullet);
        bulletsByIndex[index] = bullet;
        bool arrived = false;
        if (shot.fixedForward)
        {
            float travelled = 0f;
            Vector3 heading = direction.normalized;
            while (bullet && travelled < shot.range)
            {
                yield return null;
                if (!bullet) break;
                travelled = Mathf.Min(shot.range, travelled + shot.speed * Time.deltaTime);
                bullet.transform.position = origin + heading * travelled;
            }
        }
        else if (shot.simpleHoming)
        {
            while (bullet && target.target)
            {
                endpoint = Point(target, shot.useWorldPoint) + Vector3.up * shot.destinationVerticalOffset;
                Vector3 delta = endpoint - bullet.transform.position;
                if (delta.sqrMagnitude > 0.000001f) bullet.transform.rotation = Quaternion.LookRotation(delta);
                bullet.transform.position = Vector3.MoveTowards(bullet.transform.position, endpoint, shot.speed * Time.deltaTime);
                if ((bullet.transform.position - endpoint).sqrMagnitude < 0.000001f)
                { arrived = true; break; }
                yield return null;
            }
        }
        else
        {
            int fps = Mathf.Max(1, shot.logicFramesPerSecond);
            Vector3 logicalStart = target.logicalOrigin ? target.logicalOrigin.position : transform.position;
            Vector3 logicalEnd = shot.useWorldPoint || target.useWorldPoint ? target.worldPoint : target.target.position;
            float duration = shot.durationFromSpeed && shot.speed > 0f
                ? Mathf.FloorToInt(Vector2.Distance(new Vector2(logicalStart.x, logicalStart.z),
                    new Vector2(logicalEnd.x, logicalEnd.z)) / shot.speed * fps) / (float)fps
                : shot.duration;
            float began = Time.time;
            var forward = Pick(shot.forwardCurves);
            var right = Pick(shot.rightCurves);
            var up = Pick(shot.upCurves);
            Vector3 previous = origin;
            while (bullet)
            {
                if (!shot.lockDestinationAtLaunch && (target.useWorldPoint || target.target))
                    endpoint = Point(target, shot.useWorldPoint) + AimOffset(target, localOffset) + Vector3.up * shot.destinationVerticalOffset;
                float t = duration > 0f ? (Time.time - began) / duration : 1f;
                if (t >= 1f) break; // Native arrival precedes the t=1 pose.
                Vector3 delta = endpoint - origin;
                Vector3 side = delta.sqrMagnitude > 0.000001f ? Quaternion.LookRotation(delta) * Vector3.right : Vector3.right;
                Vector3 next = origin + delta * (forward != null ? forward.Evaluate(t) : t)
                    + side * (right != null ? right.Evaluate(t) : 0f) + Vector3.up * (up != null ? up.Evaluate(t) : 0f);
                Vector3 movement = next - previous;
                if (movement.sqrMagnitude > 0.000001f) bullet.transform.rotation = Quaternion.LookRotation(movement);
                bullet.transform.position = next;
                previous = next;
                yield return null;
            }
        }
        if (!shot.fixedForward && (!shot.simpleHoming || arrived))
        {
            bool available = target.useWorldPoint || target.target && target.target.gameObject.activeInHierarchy;
            if (bullet && available && shot.arrivalEffect)
                Spawn(shot.arrivalEffect, endpoint, bullet.transform.rotation, sounds: shot.arrivalSounds);
            ShotArrived?.Invoke(new CharacterFlightArrival { shotIndex = index, sourceNodeIndex = shot.sourceNodeIndex,
                target = target.target, worldPoint = endpoint,
                targetAvailable = available });
        }
        StopMedia(bullet);
        activeBullets.Remove(bullet);
        if (bulletsByIndex.TryGetValue(index, out var current) && current == bullet) bulletsByIndex.Remove(index);
    }

    static AnimationCurve Pick(AnimationCurve[] curves) =>
        curves != null && curves.Length > 0 ? curves[UnityEngine.Random.Range(0, curves.Length)] : null;

    public void PlayTargetEffect(int index) => PlayTargetEffect(index, null, null);

    void PlayTargetEffect(int index, CharacterTargetBinding? actualTarget, Vector3? contact)
    {
        if (!skill || index < 0 || index >= skill.targetEffects.Length) return;
        var effect = skill.targetEffects[index];
        if (effect == null || !effect.prefab) return;
        CharacterTargetBinding binding;
        if (actualTarget.HasValue) binding = actualTarget.Value;
        else if (!TryTarget(effect.targetSlot, effect.requiredConditionKey, out binding)) return;
        if (!string.IsNullOrEmpty(effect.requiredConditionKey) &&
            (!binding.hasConditionResult || binding.conditionKey != effect.requiredConditionKey || !binding.conditionPassed)) return;
        StartCoroutine(PlayEffect(effect, binding, contact, castVersion));
    }

    IEnumerator PlayEffect(CharacterEffectData data, CharacterTargetBinding binding,
        Vector3? contact, int version)
    {
        if (data.delay > 0f) yield return new WaitForSeconds(data.delay);
        if (version != castVersion) yield break;
        Transform anchor = null;
        Vector3 position = Vector3.zero;
        switch (data.anchor)
        {
            case CharacterEffectAnchor.Caster: anchor = Anchor(data.anchorIndex); break;
            case CharacterEffectAnchor.Target: anchor = binding.target; break;
            case CharacterEffectAnchor.EffectAnchor: anchor = binding.effectAnchor; break;
            case CharacterEffectAnchor.VisualOrigin: anchor = binding.visualOrigin; break;
            case CharacterEffectAnchor.WorldPoint: position = binding.worldPoint; break;
            case CharacterEffectAnchor.HitPoint: position = contact ?? binding.worldPoint; break;
            case CharacterEffectAnchor.Projectile:
                if (bulletsByIndex.TryGetValue(data.anchorIndex, out var bullet) && bullet) anchor = bullet.transform;
                break;
        }
        if (!anchor && data.anchor != CharacterEffectAnchor.WorldPoint && data.anchor != CharacterEffectAnchor.HitPoint)
            yield break;
        if (anchor) position = anchor.position;
        Quaternion basis = data.rotationMode switch
        {
            CharacterEffectRotation.Prefab => data.prefab.transform.localRotation,
            CharacterEffectRotation.Anchor => anchor ? anchor.rotation : Quaternion.identity,
            CharacterEffectRotation.CasterForward => Look(transform.forward),
            CharacterEffectRotation.TargetForward => Look(binding.target ? binding.target.forward : Vector3.zero),
            CharacterEffectRotation.ToCaster => Look(transform.position - (binding.target ? binding.target.position : position)),
            CharacterEffectRotation.ToTarget => Look((binding.target ? binding.target.position : position) - transform.position),
            CharacterEffectRotation.EntityDirection => Look(binding.entityDirection),
            _ => Quaternion.identity
        };
        var rotation = basis * data.rotation;
        var instance = Spawn(data.prefab, position + rotation * data.offset, rotation,
            data.attach ? anchor : null, manualStop: data.duration > 0f, sounds: data.sounds);
        if (instance)
        {
            activeEffects.Add(instance);
            if (cameraTransition)
                foreach (var shake in data.shakes)
                    cameraTransition.PlayShake(shake, instance);
            else if (data.shakes != null && data.shakes.Length > 0)
                Debug.LogError("Camera shake cue has no ExCameraTransition binding.", this);
            if (data.keepWorldRotation)
                fixedRotationEffects.Add(new FixedRotationEffect { instance = instance, rotation = rotation });
            if (data.duration > 0f) StartCoroutine(StopEffectAfter(instance, data.duration, version));
        }
    }

    IEnumerator StopEffectAfter(GameObject instance, float seconds, int version)
    {
        yield return new WaitForSeconds(seconds);
        if (version == castVersion) StopMedia(instance);
        activeEffects.Remove(instance);
    }

    // The host reports each actual victim and its real hit/miss result.
    public bool NotifyOutcome(int sourceNodeIndex, int occurrence, string gameplayEventId,
        Transform victim, Vector3 point, bool hit, CharacterHitMaterial material)
        => NotifyOutcome(sourceNodeIndex, occurrence, gameplayEventId,
            new CharacterTargetBinding { target = victim, aimAnchor = victim, effectAnchor = victim }, point, hit, material);

    public bool NotifyOutcome(int sourceNodeIndex, int occurrence, string gameplayEventId,
        CharacterTargetBinding victim, Vector3 point, bool hit, CharacterHitMaterial material)
    {
        if (!skill || string.IsNullOrEmpty(gameplayEventId)) return false;
        string key = sourceNodeIndex + ":" + occurrence + ":" + gameplayEventId;
        if (outcomes.Contains(key)) return false;
        CharacterOutcomeData selected = null;
        CharacterOutcomeData fallback = null;
        foreach (var entry in skill.outcomes)
            if (entry != null && entry.sourceNodeIndex == sourceNodeIndex && entry.occurrence == occurrence &&
                entry.hit == hit)
            {
                if (entry.material == material) { selected = entry; break; }
                if (entry.material == CharacterHitMaterial.Any) fallback = entry;
            }
        if (selected == null) selected = fallback;
        if (selected == null) return false;
        outcomes.Add(key); // Hit and miss share this token; callbacks cannot play both.
        foreach (int effectIndex in selected.effectIndices) PlayTargetEffect(effectIndex, victim, point);
        return true;
    }

    public bool BindSupportedExOwner(Transform owner, Transform effectAnchor = null)
    {
        if (!owner || supportedExOwner && supportedExOwner != owner) return false;
        supportedExOwner = owner;
        supportedExBinding = new CharacterTargetBinding { target = owner, aimAnchor = owner,
            effectAnchor = effectAnchor ? effectAnchor : owner };
        return true;
    }

    // CH0336 reacts to the actual buff owner's first three EX starts.
    public bool NotifySupportedEx(Transform owner, int originalBehavior, bool actionStarted, string gameplayEventId)
    {
        if (!skill || owner != supportedExOwner || !owner || !actionStarted || originalBehavior < 11 ||
            originalBehavior > 20 || string.IsNullOrEmpty(gameplayEventId) || !ownerExEvents.Add(gameplayEventId)) return false;
        int ordinal = ++supportedExCount;
        foreach (var entry in skill.supportedEx)
            if (entry != null && entry.ordinal == ordinal)
                foreach (int effectIndex in entry.effectIndices) PlayTargetEffect(effectIndex, supportedExBinding, null);
        return true;
    }

    public void ApplyForm(int index)
    {
        if (!skill || index < 0 || index >= skill.forms.Length || skill.forms[index] == null) return;
        var form = skill.forms[index];
        formIndex = form.formIndex;
        FormRequested?.Invoke(form); // Host applies the actual gameplay status.
    }

    public void RequestGameplayStage(int index)
    {
        if (!skill || index < 0 || index >= skill.gameplayStages.Length) return;
        GameplayStageRequested?.Invoke(index, skill.gameplayStages[index]);
    }

    public bool NotifyNormalOutcome(int shotIndex, bool hit, Vector3 contact)
        => NotifyNormalOutcome(shotIndex, hit, CharacterHitMaterial.Any, contact, Quaternion.identity);

    public bool NotifyNormalOutcome(int shotIndex, bool hit, CharacterHitMaterial material,
        Vector3 contact, Quaternion hostRotation)
    {
        TryTarget(0, null, out var target);
        return NotifyNormalOutcome(shotIndex, hit, material, contact, hostRotation,
            target.effectAnchor, target.effectBone);
    }

    public bool NotifyNormalOutcome(int shotIndex, bool hit, CharacterHitMaterial material,
        Vector3 contact, Quaternion hostRotation, Transform outcomeAnchor, int outcomeBone)
    {
        var normal = CurrentNormal;
        if (normal == null || shotIndex < 0 || shotIndex >= normal.shotFrames.Length) return false;
        foreach (var outcome in normal.outcomes)
            if (outcome != null && outcome.hit == hit &&
                (!hit || outcome.material == material || outcome.material == CharacterHitMaterial.Any))
            {
                if (outcome.prefab)
                {
                    TryTarget(0, null, out var target);
                    Quaternion pose;
                    switch (outcome.rotationMode)
                    {
                        case CharacterEffectRotation.ToCaster:
                            if (!target.target) return false;
                            if ((transform.position - target.target.position).sqrMagnitude < 0.000001f) return false;
                            pose = Look(transform.position - target.target.position);
                            break;
                        case CharacterEffectRotation.ToTarget:
                            if (!target.target) return false;
                            if ((target.target.position - transform.position).sqrMagnitude < 0.000001f) return false;
                            pose = Look(target.target.position - transform.position);
                            break;
                        case CharacterEffectRotation.CasterForward:
                        case CharacterEffectRotation.EntityDirection:
                            pose = hostRotation;
                            break;
                        default:
                            pose = outcome.prefab.transform.localRotation;
                            break;
                    }
                    Vector3 point = contact;
                    if (!outcome.useContactPoint)
                    {
                        if (!outcomeAnchor || outcomeBone != outcome.requiredBone) return false;
                        point = outcomeAnchor.position + Look(outcomeAnchor.forward) * outcome.offset;
                    }
                    else point += pose * outcome.offset;
                    pose *= outcome.rotationOffset;
                    Spawn(outcome.prefab, point, pose, sounds: outcome.sounds);
                }
                return true;
            }
        var prefab = hit || normal.sameImpactForHitAndMiss ? normal.hitEffect : normal.missEffect;
        if (prefab) Spawn(prefab, contact, prefab.transform.localRotation);
        return true;
    }

    public void PlayFieldSound(int index)
    {
        var voice = AudioManager.Inst.PlayAttached(skill.fieldSounds[index], transform);
        AudioManager.Inst.ReleaseAttached(voice); // 换回待机后仍播放自然尾声。
    }

    public void PlayNormalAudio(int index)
    {
        if (!skill || index < 0 || index >= skill.normalAudio.Length) return;
        var cue = skill.normalAudio[index];
        if (cue?.clips == null || cue.clips.Length == 0) return;
        var clip = cue.clips[UnityEngine.Random.Range(0, cue.clips.Length)];
        if (clip) AudioManager.Inst.Play(clip, transform.position, cue.volume);
    }

    Transform Anchor(int index) => index >= 0 && index < anchors.Length ? anchors[index] : null;

    static GameObject Spawn(GameObject prefab, Vector3 point, Quaternion rotation,
        Transform parent = null, bool manualStop = false, CharacterSound[] sounds = null) =>
        EffectManager.Inst.Play(prefab, point, rotation, parent, manualStop,
            sounds ?? Array.Empty<CharacterSound>());

    void StopMedia(GameObject instance)
    {
        if (!instance) return;
        if (cameraTransition) cameraTransition.CancelShake(instance);
        if (EffectManager.Existing) EffectManager.Existing.Stop(instance);
        else Destroy(instance);
    }

    bool TryTarget(int slot, string condition, out CharacterTargetBinding binding)
    {
        binding = default;
        if (slot < 0 || slot >= targets.Length) return false;
        binding = targets[slot];
        if (!string.IsNullOrEmpty(condition) &&
            (!binding.hasConditionResult || binding.conditionKey != condition || !binding.conditionPassed)) return false;
        return binding.useWorldPoint || binding.target;
    }

    static Vector3 Point(CharacterTargetBinding binding, bool worldPoint) =>
        worldPoint || binding.useWorldPoint ? binding.worldPoint :
        binding.aimAnchor.position;

    static Vector3 AimOffset(CharacterTargetBinding binding, Vector3 local)
    {
        var anchor = binding.aimAnchor;
        return anchor && local != Vector3.zero ? Quaternion.LookRotation(anchor.forward, Vector3.up) * local : local;
    }

    static Quaternion Look(Vector3 direction) =>
        direction.sqrMagnitude > 0.000001f ? Quaternion.LookRotation(direction, Vector3.up) : Quaternion.identity;

    void Face(Vector3 direction)
    {
        var flat = Vector3.ProjectOnPlane(direction, Vector3.up);
        if (facingRoot && flat.sqrMagnitude > 0.000001f) facingRoot.rotation = Quaternion.LookRotation(flat);
    }

    void LateUpdate()
    {
        for (int i = fixedRotationEffects.Count - 1; i >= 0; i--)
        {
            var item = fixedRotationEffects[i];
            if (!item.instance) fixedRotationEffects.RemoveAt(i);
            else item.instance.transform.rotation = item.rotation;
        }
    }

    public void CancelCast()
    {
        castVersion++;
        // Pending launch/effect coroutines reject this version when they resume.
        // Keep active flights alive across attack, reload and EX transitions.
        foreach (var effect in activeEffects) StopMedia(effect);
        activeEffects.Clear(); fixedRotationEffects.Clear(); bulletsByIndex.Clear();
        outcomes.Clear(); ownerExEvents.Clear();
        supportedExOwner = null; supportedExBinding = default; supportedExCount = 0;
    }

    void OnDisable()
    {
        CancelCast();
        StopAllCoroutines();
        foreach (var bullet in activeBullets) StopMedia(bullet);
        activeBullets.Clear();
    }
}
