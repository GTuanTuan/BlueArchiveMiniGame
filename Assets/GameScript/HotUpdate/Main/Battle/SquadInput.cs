using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.UI;

namespace Game.Battle
{
    public sealed class SquadInput : MonoBehaviour
    {
        public BattleSession session;
        public LayerMask groundMask, unitMask, enemyMask;
        public float formationSpacing = 1.5f;
        public float dragThreshold = 8f;
        public Texture2D healthBackground, healthFill;
        public Canvas hudCanvas;
        public RectTransform selectionRect;
        public Button[] portraitButtons, exButtons;
        public GameObject[] selectionHighlights;
        public Text[] unitLabels, exLabels;
        public Text stateText, extractionText;
        public Button restartButton;
        public Health[] worldHealthTargets;
        public RectTransform[] worldHealthRoots;
        public Image[] worldHealthFills;
        public Text[] worldHealthLabels;
        [Header("原版编队：由编辑器完整绑定")]
        public GameObject formationRoot, formationPicker;
        public Button[] formationSlots, formationCandidates;
        public RawImage[] formationPortraits, formationCandidatePortraits, formationSummaryPortraits, formationBattlePortraits;
        public RawImage[] resultPortraits;
        public Text[] formationNames, formationCandidateNames;
        public GameObject[] formationCandidateMarks, formationSummaryMarks;
        public RawImage formationPreviewPortrait;
        public Text formationTitle, formationPreviewName;
        public Button formationConfirm, formationClose, formationDeploy;
        public GameObject formationStage;
        public UnityEngine.Playables.PlayableDirector formationExit;
        public Transform formationLayout;
        public Vector2 formationReferenceSize;
        public CharacterUnit[] formationUnits;
        public Transform[] formationModels, formationPositions;
        public Animator[] formationAnimators;
        public RectTransform[] formationDropAreas;
        int editingFormationSlot, pendingFormationCandidate;
        int heldFormationSlot = -1;
        bool formationDragging;
        bool deploying;
        float formationDragDepth;
        Vector3 formationDragOffset;
        AudioSource commandVoice;
        readonly List<CharacterUnit> selected = new List<CharacterUnit>();
        static readonly Key[] numberKeys = { Key.Digit1, Key.Digit2, Key.Digit3, Key.Digit4 };
        static readonly Key[] skillKeys = { Key.F1, Key.F2, Key.F3, Key.F4 };
        Vector2 dragStart;
        bool dragging;
        public IReadOnlyList<CharacterUnit> Selected => selected;
        public bool PointerOverUI => EventSystem.current && EventSystem.current.IsPointerOverGameObject();

        void Start()
        {
            for (int i = 0; portraitButtons != null && i < portraitButtons.Length; i++)
            {
                int slot = i;
                if (portraitButtons[i]) portraitButtons[i].onClick.AddListener(() =>
                {
                    if (!CanUseHUD || session.allies == null || slot >= session.allies.Length) return;
                    var k = Keyboard.current;
                    Select(session.allies[slot], k != null && (k.leftShiftKey.isPressed || k.rightShiftKey.isPressed));
                });
            }
            for (int i = 0; i < exButtons.Length; i++)
            {
                int slot = i;
                exButtons[i].onClick.AddListener(() => UseSkill(slot));
            }
            if (restartButton) restartButton.onClick.AddListener(() => { if (session) session.Restart(); });
            InitializeFormationUI();
            SelectAll();
        }

        void Update()
        {
            UpdateHUD();
            if (!session || session.allies == null) return;
            if (session.Selecting) { UpdateFormationDrag(); return; }
            var keyboard = Keyboard.current;
            var mouse = Mouse.current;
            if (keyboard != null && keyboard.spaceKey.wasPressedThisFrame &&
                !session.IsCutscene && !session.ShowingIntro && !session.Won && !session.Lost) session.TogglePause();
            if (session.IsCutscene || session.ShowingIntro || session.Won || session.Lost) { dragging = false; return; }
            bool append = keyboard != null && (keyboard.leftShiftKey.isPressed || keyboard.rightShiftKey.isPressed);
            if (keyboard != null)
            {
                for (int i = 0; i < Mathf.Min(4, session.allies.Length); i++)
                {
                    if (keyboard[numberKeys[i]].wasPressedThisFrame) Select(session.allies[i]);
                    if (!session.Paused && keyboard[skillKeys[i]].wasPressedThisFrame && Alive(session.allies[i]))
                    {
                        session.allies[i].CastEx();
                        if (session.IsCutscene) return;
                    }
                }
                if (keyboard.digit5Key.wasPressedThisFrame) SelectAll();
                if (keyboard.f5Key.wasPressedThisFrame) UseSkill(4);
                if (keyboard.f6Key.wasPressedThisFrame) UseSkill(5);
                foreach (var unit in selected)
                {
                    if (!Alive(unit)) continue;
                    if (keyboard.hKey.wasPressedThisFrame) unit.Hold();
                    if (keyboard.xKey.wasPressedThisFrame) unit.ResumeAuto();
                }
            }
            if (mouse == null || !session.mainCamera || session.IsCutscene) return;
            Vector2 position = mouse.position.ReadValue();
            if (mouse.leftButton.wasPressedThisFrame && !PointerOverUI) { dragStart = position; dragging = true; }
            if (mouse.leftButton.wasReleasedThisFrame && dragging)
            {
                dragging = false;
                if (!PointerOverUI) FinishSelection(position, append);
            }
            if (mouse.rightButton.wasPressedThisFrame && !PointerOverUI)
                Command(position, keyboard != null && (keyboard.leftAltKey.isPressed || keyboard.rightAltKey.isPressed));
        }

        void FinishSelection(Vector2 position, bool append)
        {
            if (!append) ClearSelection();
            if (Vector2.Distance(position, dragStart) < dragThreshold)
            {
                Pick(position, out var unit, out _, out _, out _);
                Add(unit);
                return;
            }
            var bounds = Rect.MinMaxRect(Mathf.Min(dragStart.x, position.x), Mathf.Min(dragStart.y, position.y),
                Mathf.Max(dragStart.x, position.x), Mathf.Max(dragStart.y, position.y));
            foreach (var unit in session.allies)
            {
                if (!Alive(unit)) continue;
                Vector3 screen = session.mainCamera.WorldToScreenPoint(unit.transform.position);
                if (screen.z > 0 && bounds.Contains(screen)) Add(unit);
            }
        }

        void Command(Vector2 position, bool attackMove)
        {
            Pick(position, out _, out var enemy, out var point, out bool ground);
            if (attackMove) enemy = null;
            if (!enemy && !ground) return;
            var living = selected.FindAll(Alive);
            int columns = Mathf.CeilToInt(Mathf.Sqrt(living.Count));
            for (int i = 0; i < living.Count; i++)
            {
                if (enemy) { living[i].AttackTarget(enemy); continue; }
                int rows = Mathf.CeilToInt((float)living.Count / columns);
                var offset = new Vector3(i % columns - (columns - 1) * 0.5f, 0,
                    i / columns - (rows - 1) * 0.5f) * formationSpacing;
                living[i].MoveTo(point + offset, attackMove);
            }
            if (!enemy && living.Count == 1) PlayCommandVoice(living[0].definition.moveVoices);
        }

        void PlayCommandVoice(AudioClip[] clips)
        {
            if (clips.Length == 0) return;
            if (commandVoice) commandVoice.Stop();
            var audio = AudioManager.Inst;
            commandVoice = audio.PlayAttached(new CharacterSound { clips = clips }, audio.transform);
            audio.ReleaseAttached(commandVoice);
        }

        void Pick(Vector2 position, out CharacterUnit ally, out Health enemy, out Vector3 point, out bool ground)
        {
            ally = null; enemy = null; point = default; ground = false;
            var hits = Physics.RaycastAll(session.mainCamera.ScreenPointToRay(position), 1000f,
                groundMask.value | unitMask.value | enemyMask.value, QueryTriggerInteraction.Ignore);
            Array.Sort(hits, (a, b) => a.distance.CompareTo(b.distance));
            foreach (var hit in hits)
            {
                int layer = 1 << hit.collider.gameObject.layer;
                var health = hit.collider.GetComponentInParent<Health>();
                var unit = hit.collider.GetComponentInParent<CharacterUnit>();
                if (!ally && (layer & unitMask.value) != 0 && Alive(unit) &&
                    Array.IndexOf(session.allies, unit) >= 0) ally = unit;
                if (!enemy && (layer & enemyMask.value) != 0 && health && health.IsAlive &&
                    Array.IndexOf(session.enemies, health) >= 0) enemy = health;
                if (!ground && !health && !unit && (layer & groundMask.value) != 0)
                { point = hit.point; ground = true; }
            }
        }

        static bool Alive(CharacterUnit unit) => unit && unit.health && unit.health.IsAlive;
        void UseSkill(int slot)
        {
            if (!CanUseHUD || session.Paused) return;
            if (slot < 4) { if (Alive(session.allies[slot])) session.allies[slot].CastEx(); }
            else session.PlaySupport(slot - 4, selected.Count > 0 ? selected[0] : session.allies[0]);
        }

        void ClearSelection()
        {
            foreach (var unit in selected) if (unit) unit.SetSelected(false);
            selected.Clear();
        }

        void Add(CharacterUnit unit)
        {
            if (!Alive(unit) || selected.Contains(unit)) return;
            selected.Add(unit);
            unit.SetSelected(true);
        }

        public void Select(CharacterUnit unit, bool append = false)
        {
            if (!append) ClearSelection();
            Add(unit);
        }

        public void SelectAll()
        {
            ClearSelection();
            if (session && session.allies != null) foreach (var unit in session.allies) Add(unit);
        }

        void InitializeFormationUI()
        {
            for (int i = 4; i < 6; i++)
            {
                int slot = i;
                formationSlots[i].onClick.AddListener(() => OpenFormationSlot(slot));
            }
            for (int i = 0; i < 4; i++)
            {
                int candidate = i;
                formationCandidates[i].onClick.AddListener(() => PreviewFormationCandidate(candidate));
            }
            formationClose.onClick.AddListener(() => formationPicker.SetActive(false));
            formationConfirm.onClick.AddListener(ConfirmFormationCandidate);
            formationDeploy.onClick.AddListener(DeployFormation);
            formationStage.SetActive(true);
            RefreshFormationCards();
        }

        // 编队只移动预览模型；出击角色本身和战场 Animator 保持原样。
        void LateUpdate()
        {
            if (session.Selecting)
                formationLayout.localScale = Vector3.one * (2f / Mathf.Max(formationReferenceSize.y,
                    formationReferenceSize.x / session.mainCamera.aspect));
        }

        void UpdateFormationDrag()
        {
            if (deploying) return;
            var mouse = Mouse.current;
            if (mouse == null || formationPicker.activeSelf) return;
            Vector2 pointer = mouse.position.ReadValue();
            if (mouse.leftButton.wasPressedThisFrame)
            {
                heldFormationSlot = FormationSlotAt(pointer);
                formationDragging = false;
                dragStart = pointer;
                if (heldFormationSlot < 0) return;
                var model = FormationModel(heldFormationSlot);
                formationDragDepth = session.mainCamera.WorldToScreenPoint(model.position).z;
                formationDragOffset = model.position - FormationPointer(pointer);
            }
            if (heldFormationSlot < 0) return;
            int actor = Array.IndexOf(formationUnits, session.allies[heldFormationSlot]);
            if (mouse.leftButton.isPressed && Vector2.Distance(pointer, dragStart) >= dragThreshold)
            {
                if (!formationDragging)
                {
                    formationAnimators[actor].CrossFadeInFixedTime("Pickup", .1f, 0);
                    PlayCommandVoice(session.allies[heldFormationSlot].definition.pickupVoices);
                }
                formationDragging = true;
                formationModels[actor].position = FormationPointer(pointer) + formationDragOffset;
            }
            if (!mouse.leftButton.wasReleasedThisFrame) return;
            if (formationDragging)
            {
                int destination = FormationSlotAt(pointer);
                if (destination >= 0) SwapFrontSlots(heldFormationSlot, destination);
                formationAnimators[actor].CrossFadeInFixedTime("Idle", .12f, 0);
                RefreshFormationCards();
            }
            else OpenFormationSlot(heldFormationSlot);
            heldFormationSlot = -1;
        }

        Vector3 FormationPointer(Vector2 pointer) => session.mainCamera.ScreenToWorldPoint(
            new Vector3(pointer.x, pointer.y, formationDragDepth));
        Transform FormationModel(int slot) => formationModels[Array.IndexOf(formationUnits, session.allies[slot])];
        int FormationSlotAt(Vector2 pointer)
        {
            for (int i = 0; i < formationDropAreas.Length; i++)
                if (RectTransformUtility.RectangleContainsScreenPoint(formationDropAreas[i], pointer)) return i;
            return -1;
        }
        void SwapFrontSlots(int first, int second)
        {
            var previous = session.allies[first];
            session.allies[first] = session.allies[second];
            session.allies[second] = previous;
        }

        string FormationName(int slot) => slot < 4 ? session.allies[slot].definition.displayName
            : session.supports[slot - 4].displayName;
        Texture2D FormationPortrait(int slot) => slot < 4 ? session.allies[slot].definition.portrait
            : session.supports[slot - 4].portrait;

        void RefreshFormationCards()
        {
            for (int i = 0; i < 6; i++)
            {
                var texture = FormationPortrait(i);
                formationPortraits[i].texture = texture;
                formationSummaryPortraits[i].texture = texture;
                resultPortraits[i].texture = texture;
                formationNames[i].text = FormationName(i);
                formationSummaryMarks[i].SetActive(i == editingFormationSlot);
            }
            for (int i = 0; i < 4; i++) FormationModel(i).position = formationPositions[i].position;
            for (int i = 0; i < formationBattlePortraits.Length; i++)
                formationBattlePortraits[i].texture = FormationPortrait(i);
        }

        void OpenFormationSlot(int slot)
        {
            if (!session.Selecting) return;
            editingFormationSlot = slot;
            pendingFormationCandidate = slot % 4;
            bool support = slot >= 4;
            formationTitle.text = support ? "支援" : "前排";
            formationPicker.SetActive(true);
            RefreshFormationCards();
            for (int i = 0; i < 4; i++)
            {
                formationCandidates[i].gameObject.SetActive(!support || i < 2);
                if (support && i >= 2) continue;
                int member = support ? i + 4 : i;
                formationCandidatePortraits[i].texture = FormationPortrait(member);
                formationCandidateNames[i].text = FormationName(member);
            }
            PreviewFormationCandidate(pendingFormationCandidate);
        }

        void PreviewFormationCandidate(int candidate)
        {
            if (!session.Selecting) return;
            pendingFormationCandidate = candidate;
            int member = editingFormationSlot < 4 ? candidate : candidate + 4;
            formationPreviewPortrait.texture = FormationPortrait(member);
            formationPreviewName.text = FormationName(member);
            for (int i = 0; i < 4; i++) formationCandidateMarks[i].SetActive(i == candidate);
        }

        void ConfirmFormationCandidate()
        {
            if (!session.Selecting) return;
            if (editingFormationSlot < 4)
            {
                SwapFrontSlots(editingFormationSlot, pendingFormationCandidate);
            }
            else
            {
                int slot = editingFormationSlot - 4;
                var previous = session.supports[slot];
                session.supports[slot] = session.supports[pendingFormationCandidate];
                session.supports[pendingFormationCandidate] = previous;
            }
            formationPicker.SetActive(false);
            RefreshFormationCards();
        }

        void DeployFormation()
        {
            if (!session.Selecting || deploying) return;
            deploying = true;
            formationPicker.SetActive(false);
            RefreshFormationCards();
            StartCoroutine(DeployAfterFade());
        }

        IEnumerator DeployAfterFade()
        {
            formationExit.gameObject.SetActive(true);
            formationExit.time = 0;
            formationExit.Play();
            formationExit.Evaluate();
            yield return new WaitUntil(() => formationExit.time >= formationExit.duration - .001);
            yield return null;
            session.BeginBattle();
            formationStage.SetActive(false);
            session.mainCamera.GetComponent<Cinemachine.CinemachineBrain>().ManualUpdate();
            formationExit.Stop();
            formationExit.gameObject.SetActive(false);
            deploying = false;
        }

        bool CanUseHUD => session && !session.Selecting && !session.IsCutscene && !session.ShowingIntro && !session.Won && !session.Lost;

        void UpdateHUD()
        {
            if (!session) return;
            bool ended = session.Won || session.Lost;
            bool visible = !session.Selecting && !session.IsCutscene && !session.ShowingIntro;
            if (hudCanvas) hudCanvas.enabled = visible;
            for (int i = 0; portraitButtons != null && i < portraitButtons.Length; i++)
            {
                var unit = session.allies != null && i < session.allies.Length ? session.allies[i] : null;
                bool alive = Alive(unit);
                if (portraitButtons[i]) { portraitButtons[i].gameObject.SetActive(!ended); portraitButtons[i].interactable = CanUseHUD && alive; }
                if (exButtons != null && i < exButtons.Length && exButtons[i])
                {
                    exButtons[i].gameObject.SetActive(!ended);
                    exButtons[i].interactable = CanUseHUD && alive && !session.Paused && unit.CooldownRemaining <= 0;
                }
                if (selectionHighlights != null && i < selectionHighlights.Length && selectionHighlights[i])
                    selectionHighlights[i].SetActive(!ended && unit && unit.Selected);
                if (unitLabels != null && i < unitLabels.Length && unitLabels[i] && unit)
                    unitLabels[i].text = unit.definition ? unit.definition.displayName : unit.name;
                if (exLabels != null && i < exLabels.Length && exLabels[i] && unit)
                    exLabels[i].text = unit.CooldownRemaining > 0 ? $"EX {unit.CooldownRemaining:0.0}" : $"EX  F{i + 1}";
            }
            if (stateText) stateText.text = !ended && session.Paused ? "战术暂停" : "";
            for (int i = 4; i < exButtons.Length; i++)
            {
                var support = session.supports[i - 4];
                exButtons[i].transform.parent.gameObject.SetActive(!ended);
                exButtons[i].interactable = CanUseHUD && !session.Paused && support.cooldownRemaining <= 0;
                exLabels[i].text = support.cooldownRemaining > 0 ? $"EX {support.cooldownRemaining:0.0}" : $"EX  F{i + 1}";
            }
            if (extractionText) extractionText.text = ended ? "" : session.ExtractionProgress > 0
                ? $"撤离中  {Mathf.Max(0, session.extractionSeconds - session.ExtractionProgress):0.0} 秒"
                : "前往撤离点  全员停留后撤离";
            if (restartButton) restartButton.interactable = visible;
            var canvasRect = hudCanvas ? hudCanvas.transform as RectTransform : null;
            for (int i = 0; worldHealthRoots != null && i < worldHealthRoots.Length; i++)
            {
                var root = worldHealthRoots[i];
                var hp = worldHealthTargets != null && i < worldHealthTargets.Length ? worldHealthTargets[i] : null;
                if (!root) continue;
                bool show = visible && !ended && hp && hp.IsAlive && session.mainCamera && canvasRect;
                Vector3 point = show ? session.mainCamera.WorldToScreenPoint(hp.AimPosition + Vector3.up * .4f) : Vector3.zero;
                show &= point.z > 0;
                root.gameObject.SetActive(show);
                if (!show) continue;
                RectTransformUtility.ScreenPointToLocalPointInRectangle(canvasRect, point, null, out var local);
                root.anchoredPosition = local;
                if (worldHealthFills != null && i < worldHealthFills.Length && worldHealthFills[i])
                    worldHealthFills[i].fillAmount = hp.Maximum > 0 ? Mathf.Clamp01(hp.Current / hp.Maximum) : 0;
                if (worldHealthLabels != null && i < worldHealthLabels.Length && worldHealthLabels[i])
                {
                    bool selectedAlly = false;
                    foreach (var unit in selected) if (unit && unit.health == hp) { selectedAlly = true; break; }
                    worldHealthLabels[i].color = selectedAlly ? Color.yellow : Color.white;
                }
            }
            if (selectionRect)
            {
                bool show = visible && !ended && dragging && Mouse.current != null && canvasRect;
                selectionRect.gameObject.SetActive(show);
                if (show)
                {
                    RectTransformUtility.ScreenPointToLocalPointInRectangle(canvasRect, dragStart, null, out var a);
                    RectTransformUtility.ScreenPointToLocalPointInRectangle(canvasRect, Mouse.current.position.ReadValue(), null, out var b);
                    selectionRect.anchoredPosition = (a + b) * .5f;
                    selectionRect.sizeDelta = new Vector2(Mathf.Abs(a.x - b.x), Mathf.Abs(a.y - b.y));
                }
            }
        }
    }
}

