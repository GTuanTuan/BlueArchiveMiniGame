using System;
using System.Collections;
using UnityEngine;
using NativePresentation = Game.Characters.BACharacterPresentation;
using NativeCombat = global::CharacterCombat;

// Small scene harness: only the Model child changes; camera and player stay in place.
namespace SimpleCharacterTrial
{
public sealed class GameDevPreview : MonoBehaviour
{
    [Serializable] public sealed class CharacterEntry
    {
        public string label;
        public NativePresentation presentationPrefab;
        public int skillSlot;
        public float previewAttackRate;
    }
    [Serializable] public struct PreviewTarget
    {
        public Transform target, aimAnchor, bodyAnchor, headAnchor, effectAnchor, logicalOrigin, visualOrigin;
        public Collider[] hitColliders;
        public Transform areaHitAnchor;
        public int effectBone;
        public Vector3 worldPoint, entityDirection;
        public bool useWorldPoint, hasConditionResult, conditionPassed;
        public string conditionKey;
    }
    [SerializeField] CharacterEntry[] characters = Array.Empty<CharacterEntry>();
    [SerializeField] BACharacterController controller;
    [SerializeField] Transform modelRoot;
    public Camera mainCamera;
    [SerializeField] Light variantLight;
    [SerializeField] PreviewTarget[] previewTargets = Array.Empty<PreviewTarget>();
    [SerializeField] PreviewTarget allyTargetBinding;
    [SerializeField] Transform supportedExOwner;
    [SerializeField] int supportedExBehavior = 11;
    [SerializeField] int initialCharacter;

    GameObject currentObject;
    NativePresentation activePresentation;
    NativeCombat combat;
    int selectedCharacter, selectedForm, eventSerial, allyExUses;
    bool switching;

    void Awake()
    {
        controller.ExRequested += PlaySelectedEx;
        Select(initialCharacter);
    }

    void OnDestroy()
    {
        controller.ExRequested -= PlaySelectedEx;
        Unbind();
    }

    public void Select(int index)
    {
        if (switching || index < 0 || index >= characters.Length || index == selectedCharacter && currentObject) return;
        StartCoroutine(ChangeCharacter(index));
    }

    IEnumerator ChangeCharacter(int index)
    {
        switching = true;
        var oldObject = currentObject;
        Unbind();
        controller.BindCharacter(null);
        if (oldObject) Destroy(oldObject.gameObject);
        yield return null; // Let the previous EX camera unbind before the next presenter enables.
        selectedCharacter = index;
        activePresentation = Instantiate(characters[index].presentationPrefab, modelRoot, false);
        currentObject = activePresentation.gameObject;
        combat = activePresentation.combat;
        if (activePresentation.skills != null && activePresentation.skills.Length > 0)
        {
            activePresentation.selectedSkill = Mathf.Clamp(characters[index].skillSlot, 0, activePresentation.skills.Length - 1);
            combat.SetSkill(activePresentation.SelectedSkill.data);
        }
        controller.BindCharacter(activePresentation);
        activePresentation.BindPlayer(controller, mainCamera, variantLight);
        combat.ShotArrived += OnShotArrived;
        combat.FormRequested += OnFormRequested;
        if (activePresentation.SelectedSkill.data && activePresentation.SelectedSkill.data.characterId == "CH0336" && supportedExOwner)
            combat.BindSupportedExOwner(supportedExOwner);
        combat.SetTargets(BuildBindings());
        selectedForm = -1;
        allyExUses = 0;
        ApplyCatalogDefault();
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        switching = false;
    }

    void Unbind()
    {
        if (combat)
        {
            combat.ShotArrived -= OnShotArrived;
            combat.FormRequested -= OnFormRequested;
        }
        if (activePresentation) activePresentation.combat.CancelCast();
        activePresentation = null;
        combat = null;
        currentObject = null;
    }

    CharacterTargetBinding[] BuildBindings()
    {
        bool useAlly = activePresentation.SelectedSkill.data && activePresentation.SelectedSkill.data.characterId == "CH0336" && allyTargetBinding.target;
        bool aris = activePresentation.SelectedSkill.data && activePresentation.SelectedSkill.data.characterId == "CH0334";
        int count = previewTargets.Length;
        foreach (var shot in activePresentation.SelectedSkill.data.shots)
            if (shot != null) count = Mathf.Max(count, shot.targetSlot + 1);
        var result = new CharacterTargetBinding[count];
        for (int i = 0; i < count; i++)
        {
            // A five-shot skill can reuse the two actors placed in this preview.
            var source = useAlly && i == 0 ? allyTargetBinding : previewTargets[i % previewTargets.Length];
            result[i] = new CharacterTargetBinding { target = source.target, aimAnchor = source.aimAnchor,
                bodyAnchor = source.bodyAnchor, headAnchor = source.headAnchor,
                effectAnchor = aris ? source.target : source.effectAnchor, effectBone = source.effectBone,
                hitColliders = source.hitColliders,
                areaHitAnchor = source.areaHitAnchor, logicalOrigin = source.logicalOrigin,
                visualOrigin = source.visualOrigin, worldPoint = source.worldPoint,
                entityDirection = source.entityDirection, useWorldPoint = source.useWorldPoint,
                hasConditionResult = source.hasConditionResult, conditionPassed = source.conditionPassed,
                conditionKey = source.conditionKey };
        }
        return result;
    }

    void OnFormRequested(CharacterFormData form)
    {
        if (form == null || !activePresentation || !activePresentation.SelectedSkill.data ||
            activePresentation.SelectedSkill.data.characterId != "CH0201" ||
            string.IsNullOrEmpty(activePresentation.SelectedSkill.data.postAttackRateParameter)) return;
        float rate = characters[selectedCharacter].previewAttackRate;
        if (rate > 0f) activePresentation.SetAttackRate(rate);
    }

    void PlaySelectedEx()
    {
        if (switching) return;
        if (!activePresentation) return;
        combat.SetTargets(BuildBindings());
        activePresentation.TryPlayEx(BuildBindings());
    }

    void ApplyCatalogDefault()
    {
        var catalog = activePresentation.variantCatalog;
        if (catalog == null || catalog.forms == null || catalog.forms.Length == 0) return;
        SelectForm(FindForm(0, 0, 0) ?? catalog.forms[0]);
    }

    CharacterVariantForm FindForm(int weaponGrade, int gearTier, int formIndex)
    {
        var catalog = activePresentation ? activePresentation.variantCatalog : null;
        if (catalog == null || catalog.forms == null) return null;
        CharacterVariantForm found = null;
        foreach (var form in catalog.forms)
            if (form.weaponGrade == weaponGrade && form.gearTier == gearTier && form.formIndex == formIndex)
            { if (found != null) return null; found = form; }
        return found;
    }

    int FindSkill(string key)
    {
        for (int i = 0; i < activePresentation.skills.Length; i++)
            if (activePresentation.skills[i] != null && activePresentation.skills[i].name == key) return i;
        return -1;
    }

    string VariantActionLabel(string skillKey)
    {
        foreach (var selector in activePresentation.variantCatalog.selectors ?? Array.Empty<CharacterVariantSelector>())
            if (selector.skillKey == skillKey)
                return selector.choiceOrder == 0 ? "光之剑" : "觉醒：超新星";
        return "觉醒：超新星"; // Ex03 is the full-charge attack and has no selector row.
    }

    void SelectForm(CharacterVariantForm form)
    {
        if (!activePresentation || activePresentation.IsBusy || form == null) return;
        if (string.IsNullOrEmpty(form.defaultSkill) || FindSkill(form.defaultSkill) < 0 ||
            Array.IndexOf(form.originalExSlots ?? Array.Empty<string>(), form.defaultSkill) < 0) return;
        selectedForm = Array.IndexOf(activePresentation.variantCatalog.forms, form);
        SelectExSkill(form.defaultSkill, form);
    }

    void SelectExSkill(string key, CharacterVariantForm form)
    {
        if (!activePresentation || activePresentation.IsBusy || string.IsNullOrEmpty(key) ||
            Array.IndexOf(form.originalExSlots ?? Array.Empty<string>(), key) < 0) return;
        int slot = FindSkill(key);
        if (slot < 0) return;
        activePresentation.selectedSkill = slot;
        combat.SetSkill(activePresentation.SelectedSkill.data);
        combat.SetTargets(BuildBindings());
    }

    // CH0336's support reaction is driven by an explicit test button, matching a host action-start event.
    public void NotifySupportedAllyEx()
    {
        if (!combat || !supportedExOwner) return;
        combat.BindSupportedExOwner(supportedExOwner);
        if (allyExUses < 3 && combat.NotifySupportedEx(supportedExOwner, supportedExBehavior, true,
            "preview-ally-ex-" + (++eventSerial))) allyExUses++;
    }

    void OnShotArrived(CharacterFlightArrival arrival)
    {
        if (!combat || !activePresentation) return;
        if (arrival.sourceNodeIndex < 0)
        {
            bool hitNormal = IsHit(arrival, out var normalContact);
            var normalTarget = FindPreviewTarget(arrival.target);
            bool aris = activePresentation.SelectedSkill.data.characterId == "CH0334";
            Transform outcomeAnchor = aris ? normalTarget.aimAnchor : normalTarget.effectAnchor;
            int outcomeBone = aris ? 2 : normalTarget.effectBone;
            combat.NotifyNormalOutcome(arrival.shotIndex, hitNormal,
                hitNormal ? CharacterHitMaterial.Flesh : CharacterHitMaterial.Any,
                hitNormal ? normalContact : arrival.worldPoint, Quaternion.identity, outcomeAnchor, outcomeBone);
            return;
        }

        bool hit = IsHit(arrival, out var contact);
        var victim = MakeVictimBinding(arrival.target);
        int occurrence = 0; // Preview fires each authored node once per request.
        string eventId = "preview-outcome-" + (++eventSerial);
        combat.NotifyOutcome(arrival.sourceNodeIndex, occurrence, eventId, victim,
            hit ? contact : arrival.worldPoint, hit,
            hit ? CharacterHitMaterial.Flesh : CharacterHitMaterial.Any);
    }

    bool IsHit(CharacterFlightArrival arrival, out Vector3 point)
    {
        point = arrival.worldPoint;
        if (!arrival.targetAvailable) return false;
        foreach (var target in previewTargets)
        {
            if (target.target != arrival.target || target.hitColliders == null) continue;
            foreach (var collider in target.hitColliders)
            {
                if (!collider || !collider.enabled || !collider.gameObject.activeInHierarchy) continue;
                point = collider.ClosestPoint(arrival.worldPoint);
                if ((point - arrival.worldPoint).sqrMagnitude < .0001f) return true;
            }
        }
        if (allyTargetBinding.target == arrival.target && allyTargetBinding.hitColliders != null)
        {
            foreach (var collider in allyTargetBinding.hitColliders)
            {
                if (!collider || !collider.enabled || !collider.gameObject.activeInHierarchy) continue;
                point = collider.ClosestPoint(arrival.worldPoint);
                if ((point - arrival.worldPoint).sqrMagnitude < .0001f) return true;
            }
        }
        return false;
    }

    PreviewTarget FindPreviewTarget(Transform target)
    {
        foreach (var item in previewTargets) if (item.target == target) return item;
        if (allyTargetBinding.target == target) return allyTargetBinding;
        return default;
    }

    CharacterTargetBinding MakeVictimBinding(Transform victim)
    {
        foreach (var target in previewTargets)
            if (target.target == victim)
                return new CharacterTargetBinding { target = target.target, aimAnchor = target.aimAnchor,
                    effectAnchor = activePresentation.SelectedSkill.data.characterId == "CH0334" ? target.target : target.effectAnchor,
                    effectBone = target.effectBone,
                    hitColliders = target.hitColliders, areaHitAnchor = target.areaHitAnchor, worldPoint = target.worldPoint,
                    entityDirection = target.entityDirection, useWorldPoint = target.useWorldPoint,
                    hasConditionResult = target.hasConditionResult, conditionPassed = target.conditionPassed,
                    conditionKey = target.conditionKey };
        if (allyTargetBinding.target == victim)
            return new CharacterTargetBinding { target = allyTargetBinding.target, aimAnchor = allyTargetBinding.aimAnchor,
                effectAnchor = allyTargetBinding.effectAnchor, effectBone = allyTargetBinding.effectBone,
                hitColliders = allyTargetBinding.hitColliders, areaHitAnchor = allyTargetBinding.areaHitAnchor,
                worldPoint = allyTargetBinding.worldPoint,
                entityDirection = allyTargetBinding.entityDirection, useWorldPoint = allyTargetBinding.useWorldPoint,
                hasConditionResult = allyTargetBinding.hasConditionResult, conditionPassed = allyTargetBinding.conditionPassed,
                conditionKey = allyTargetBinding.conditionKey };
        return new CharacterTargetBinding { target = victim, aimAnchor = victim, effectAnchor = victim };
    }

    void OnGUI()
    {
        GUILayout.BeginArea(new Rect(12, 12, 240, Mathf.Min(Screen.height - 24, 720)), GUI.skin.box);
        GUILayout.Label("游戏开发部 · 角色预览");
        GUI.enabled = !switching;
        for (int i = 0; i < characters.Length; i++)
        {
            string label = string.IsNullOrEmpty(characters[i].label)
                ? characters[i].presentationPrefab.name : characters[i].label;
            if (GUILayout.Button((i == selectedCharacter ? "▶ " : "") + label, GUILayout.Height(27))) Select(i);
        }
        GUILayout.Label("WASD 移动 · 左键普攻 · R 换弹 · Q EX\n右键拖动视角");
        if (activePresentation && activePresentation.SelectedSkill.data && activePresentation.SelectedSkill.data.characterId == "CH0334" &&
            activePresentation.variantCatalog != null && activePresentation.variantCatalog.forms != null && activePresentation.variantCatalog.forms.Length > 0)
        {
            GUILayout.Label("临战爱丽丝 · EX技能");
            var allForms = activePresentation.variantCatalog.forms;
            var chargeForms = Array.FindAll(allForms, form => form.weaponGrade == 0);
            for (int i = 0; i < chargeForms.Length; i++)
            {
                var form = chargeForms[i];
                string label = $"充能层数 {form.formIndex}/2";
                if (GUILayout.Button((Array.IndexOf(allForms, form) == selectedForm ? "▶ " : "") + label)) SelectForm(form);
            }
            var currentForm = Array.Find(chargeForms, form => Array.IndexOf(allForms, form) == selectedForm);
            if (currentForm == null) currentForm = chargeForms[0];
            GUILayout.Label($"当前充能：{currentForm.formIndex}/2 层");
            foreach (string key in currentForm.originalExSlots ?? Array.Empty<string>())
            {
                if (FindSkill(key) < 0) continue;
                string action = VariantActionLabel(key);
                if (action == "光之剑" && currentForm.formIndex >= 2) continue;
                if (GUILayout.Button((activePresentation.SelectedSkill.name == key ? "▶ " : "") + action)) SelectExSkill(key, currentForm);
            }
        }
        if (activePresentation && activePresentation.SelectedSkill.data && activePresentation.SelectedSkill.data.characterId == "CH0336")
        {
            GUI.enabled = !switching && allyExUses < 3;
            if (GUILayout.Button("友方释放 EX（" + allyExUses + "/3）")) NotifySupportedAllyEx();
        }
        GUI.enabled = true;
        GUILayout.EndArea();
    }
}
}
