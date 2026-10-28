using System;
using System.Collections;
using UnityEngine;
using UnityEngine.Playables;
using SimpleCharacterTrial;
namespace Game.Characters
{
    [Serializable]
    public sealed class CharacterSkillSlot
    {
        public string name;
        public CharacterSkillData data;
        public ExCameraTransition transition;
        public GameObject cutinRoot;
        public PlayableDirector fieldTimeline, actorTimeline;
        public bool useActorClock;
        public float actorReleaseTime;
        public UnityEngine.Object[] actorTracks = Array.Empty<UnityEngine.Object>();
        public UnityEngine.Object[] actorTrackTargets = Array.Empty<UnityEngine.Object>();
        public PlayableDirector[] actorTrackDirectors = Array.Empty<PlayableDirector>();
        [NonSerialized] public bool actorReleased = true;
    }
    [Serializable]
    public struct CharacterEffectBinding
    {
        public GameObject prefab;
        public Transform anchor;
        [Tooltip("原版 Control 轨道控制的特效：片段结束时清除，不等待粒子自然寿命。")]
        public bool clearOnStop;
    }
    // 动作交给 Animator，固定演出交给 Timeline；这里只负责开始、交接和结束。
    [DefaultExecutionOrder(1000)]
    public sealed class BACharacterPresentation : MonoBehaviour, IBACharacterPresentation
    {
        public Animator animator;
        public AudioSource audioSource;
        public BAResourceOriginalPostProcessCamera battleBloom;
        public CharacterCombat combat;
        public CharacterSkillSlot[] skills = Array.Empty<CharacterSkillSlot>();
        public CharacterEffectBinding[] effects = Array.Empty<CharacterEffectBinding>();
        public int selectedSkill;
        public CharacterVariantCatalog variantCatalog;
        public Transform facingRoot;
        BACharacterController player;
        Camera mainCamera;
        Light mainLight;
        enum Action { Idle, Attack, Reload, Cutin, Skill }
        Action action;
        CharacterSkillSlot playing;
        bool exitCapture;
        string attackRateParameter;
        float originalAttackRate;
        GameObject[] attached;
        public bool IsBusy => action != Action.Idle;
        public CharacterSkillSlot SelectedSkill => skills[selectedSkill];
        public bool IsCutscene => playing != null && playing.transition && playing.transition.IsInCutscene;
        public event System.Action FieldStarted, SkillFinished;
        ExCameraTransition.CameraView sceneView;
        bool sceneViewCaptured;
        void Awake()
        {
            attached = new GameObject[effects.Length];
            combat.SetSkill(SelectedSkill.data);
        }
        public void BindPlayer(BACharacterController host, Camera camera, Light light)
        {
            BindUnit(host.ModelRoot, camera, light);
            player = host;
        }
        public void BindUnit(Transform unitFacingRoot, Camera camera, Light light)
        {
            player = null;
            mainCamera = camera;
            mainLight = light;
            facingRoot = unitFacingRoot;
            combat.facingRoot = unitFacingRoot;
            if (battleBloom)
            {
                battleBloom.targetCamera = camera;
                battleBloom.RefreshRegistration();
            }
        }
        public void PlayAnimation()
        {
            if (!player || IsBusy) return;
            animator.SetBool("Moving", player.currentState == BACharacterState.Move);
            if (player.currentState == BACharacterState.Shoot && !SelectedSkill.data.sourceHasNoNormalSkill)
                PlayAction(Action.Attack, "Attack");
            if (player.currentState == BACharacterState.Reload) PlayAction(Action.Reload, "Reload");
        }
        public void SetMoving(bool moving) => animator.SetBool("Moving", moving);
        public void PlayAttack()
        {
            if (!IsBusy && !SelectedSkill.data.sourceHasNoNormalSkill) PlayAction(Action.Attack, "Attack");
        }
        public void PlayReload()
        {
            if (!IsBusy) PlayAction(Action.Reload, "Reload");
        }
        public void CancelAction()
        {
            if (action != Action.Attack && action != Action.Reload) return;
            animator.ResetTrigger("Attack");
            animator.ResetTrigger("Reload");
            EndAction();
            animator.CrossFade("Base Layer.Idle", .1f);
        }
        void PlayAction(Action next, string trigger)
        {
            action = next;
            animator.SetBool("Moving", false);
            animator.SetTrigger(trigger);
        }
        public void SetAttackRate(float rate)
        {
            if (attackRateParameter == null)
            {
                attackRateParameter = SelectedSkill.data.postAttackRateParameter;
                originalAttackRate = animator.GetFloat(attackRateParameter);
            }
            animator.SetFloat(attackRateParameter, rate);
        }
        public void PlayEx() => TryPlayEx(new[] { new CharacterTargetBinding {
            target = transform, aimAnchor = transform, effectAnchor = transform
        } });
        public bool TryPlayEx(CharacterTargetBinding[] targets)
        {
            if (action == Action.Cutin || action == Action.Skill) return false;
            var slot = SelectedSkill;
            if (!slot.transition) return false;
            if (!combat.BeginCast(slot.data, targets, facingRoot)) return false;
            StopAttached();
            playing = slot;
            action = Action.Cutin;
            if (player) player.currentState = BACharacterState.Ex;
            sceneView = ExCameraTransition.CameraView.Read(mainCamera);
            sceneViewCaptured = true;
            if (slot.cutinRoot) slot.cutinRoot.SetActive(true);
            slot.transition.gameplayView = sceneView;
            slot.transition.Bind(mainCamera, mainLight, gameObject);
            slot.transition.Begin();
            animator.SetBool("Moving", false);
            animator.ResetTrigger("Attack");
            animator.ResetTrigger("Reload");
            animator.ResetTrigger("Skill");
            animator.Play("Base Layer.Idle", 0, 0);
            animator.Update(0);
            slot.transition.director.stopped += OnCutinStopped;
            slot.transition.director.time = 0;
            slot.transition.director.Play();
            return true;
        }
        // Animation Event 与 Timeline Signal 共用这个入口。
        public void OnAnimationEvent(string name)
        {
            if (playing != null && playing.transition.IsSampling) return;
            if (name == "ExReturnToGameplay" && playing != null && playing.transition.IsInCutscene)
            {
                exitCapture = true;
                playing.transition.ReturnToBattle();
            }
            if (name == "ExCutinEnd" && action == Action.Cutin) BeginField();
            if (name == "AttackEnd" && action == Action.Attack ||
                name == "ReloadEnd" && action == Action.Reload ||
                name == "SkillEnd" && action == Action.Skill && !playing.useActorClock)
                EndAction();
        }
        void BeginField()
        {
            action = Action.Skill;
            var slot = playing;
            slot.actorReleased = false;
            if (playing.actorTimeline)
            {
                for (int i = 0; i < playing.actorTracks.Length; i++)
                    playing.actorTrackDirectors[i].SetGenericBinding(playing.actorTracks[i], playing.actorTrackTargets[i]);
                Play(playing.actorTimeline);
            }
            else if (!playing.useActorClock) animator.SetTrigger("Skill");
            if (playing.fieldTimeline) Play(playing.fieldTimeline);
            if (slot.useActorClock) StartCoroutine(ReleaseAfter(slot));
            FieldStarted?.Invoke();
        }
        static void Play(PlayableDirector director)
        {
            director.gameObject.SetActive(true);
            director.timeUpdateMode = DirectorUpdateMode.GameTime;
            director.time = 0;
            director.Play();
        }
        void LateUpdate()
        {
            if (exitCapture)
            {
                exitCapture = false;
                playing.transition.SampleExitFrame();
                RestoreSceneView();
            }
            else if (sceneViewCaptured && !IsCutscene) RestoreSceneView();
        }
        IEnumerator ReleaseAfter(CharacterSkillSlot slot)
        {
            yield return new WaitForSeconds(slot.actorReleaseTime);
            ReleaseActor(slot);
            if (slot == playing && action == Action.Skill) EndAction();
        }
        void ReleaseActor(CharacterSkillSlot slot)
        {
            if (slot.actorReleased) return;
            slot.actorReleased = true;
            for (int i = 0; i < slot.actorTracks.Length; i++)
            {
                var director = slot.actorTrackDirectors[i];
                director.ClearGenericBinding(slot.actorTracks[i]);
                director.RebindPlayableGraphOutputs();
            }
            if (animator.gameObject.activeInHierarchy)
            {
                animator.Play("Base Layer.Idle");
                animator.Update(0);
            }
        }
        void EndAction()
        {
            bool finishedSkill = action == Action.Cutin || action == Action.Skill;
            action = Action.Idle;
            if (player) player.currentState = BACharacterState.Idle;
            StopAttached(); // 子弹、命中音和 Timeline 尾声按各自生命周期继续。
            if (finishedSkill) SkillFinished?.Invoke();
        }
        void OnCutinStopped(PlayableDirector director)
        {
            director.stopped -= OnCutinStopped;
            playing.transition.Unbind();
            RestoreSceneView();
            sceneViewCaptured = false;
            if (playing.cutinRoot) playing.cutinRoot.SetActive(false);
            if (action == Action.Cutin) { combat.CancelCast(); EndAction(); }
        }
        void RestoreSceneView()
        {
            if (sceneViewCaptured && mainCamera) sceneView.Apply(mainCamera);
        }
        public void OnAudioEvent(AnimationEvent cue) =>
            AudioManager.Inst.Play(cue.objectReferenceParameter as AudioClip, audioSource.transform.position,
                audioSource.volume * cue.floatParameter, audioSource.pitch, audioSource.spatialBlend);
        public void OnEffectEvent(int index)
        {
            var cue = effects[index];
            StopEffect(index);
            attached[index] = EffectManager.Inst.Play(cue.prefab,
                cue.anchor.TransformPoint(cue.prefab.transform.localPosition),
                cue.anchor.rotation * cue.prefab.transform.localRotation, cue.anchor, true);
        }
        public void StopEffect(int index)
        {
            if (attached[index])
            {
                if (EffectManager.Existing) EffectManager.Existing.Stop(attached[index], effects[index].clearOnStop);
                else Destroy(attached[index]);
            }
            attached[index] = null;
        }
        void StopAttached()
        {
            if (attached == null) return;
            for (int i = 0; i < attached.Length; i++) StopEffect(i);
        }
        void OnDisable()
        {
            StopAllCoroutines();
            if (attackRateParameter != null) animator.SetFloat(attackRateParameter, originalAttackRate);
            foreach (var slot in skills)
            {
                if (slot.transition)
                {
                    slot.transition.director.stopped -= OnCutinStopped;
                    slot.transition.director.Stop();
                    slot.transition.Unbind();
                    if (slot.cutinRoot) slot.cutinRoot.SetActive(false);
                }
                ReleaseActor(slot);
                if (slot.fieldTimeline) slot.fieldTimeline.Stop();
                if (slot.actorTimeline) slot.actorTimeline.Stop();
            }
            combat.CancelCast();
            RestoreSceneView();
            sceneViewCaptured = false;
            EndAction();
        }
    }
}
