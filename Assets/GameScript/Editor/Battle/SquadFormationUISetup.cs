#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using System.IO;
using Game.Battle;
using Cinemachine;
using UnityEditor.Animations;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem.UI;
using UnityEngine.UI;
using Object = UnityEngine.Object;

// Editor-only reduction of the original Formation/CharacterEdit screens.
public static class SquadFormationUISetup
{
    const string Stage = "C:/UnityProject/BAAssets/Tools/SquadDemo/FormationUIStaging";
    const string Output = "Assets/GameRes/Battle/FormationUI";
    static readonly Dictionary<string, Sprite> Sprites = new Dictionary<string, Sprite>();
    static Font font;
    static readonly Color Ink = new Color(.16f, .25f, .34f);
    static readonly Color Blue = new Color(.12f, .72f, .95f);

    [MenuItem("Tools/Blue Archive/Build Squad Formation UI")]
    public static void Build()
    {
        if (EditorApplication.isPlayingOrWillChangePlaymode) throw new InvalidOperationException("请先退出运行模式。");
        var scene = UnityEngine.SceneManagement.SceneManager.GetActiveScene();
        if (!scene.path.EndsWith("Player_GameDev.unity")) throw new InvalidOperationException("请打开 Player_GameDev 场景。");
        var session = Object.FindObjectOfType<BattleSession>();
        var input = session ? session.GetComponent<SquadInput>() : null;
        if (!input) input = Object.FindObjectOfType<SquadInput>();
        if (!session || !input) throw new InvalidOperationException("BattleSession/SquadInput 尚未装配。");
        var binding = new SerializedObject(input);
        if (binding.FindProperty("formationRoot") == null)
            throw new InvalidOperationException("请先合并 FormationUIStaging/SquadInput.formation.patch。");
        ValidateRoster(new SerializedObject(session));
        var hudButtons = binding.FindProperty("exButtons");
        if (hudButtons == null || hudButtons.arraySize != 6)
            throw new InvalidOperationException("请先创建包含四前排、两支援的六卡 HUD。");
        var hudPortraits = new List<Object>();
        for (int i = 0; i < 6; i++)
        {
            var button = hudButtons.GetArrayElementAtIndex(i).objectReferenceValue as Button;
            var portrait = button ? button.transform.parent.Find("Portrait") : null;
            var image = portrait ? portrait.GetComponent<RawImage>() : null;
            if (!image) throw new InvalidOperationException("HUD第" + (i + 1) + "卡缺少Portrait RawImage。");
            hudPortraits.Add(image);
        }
        font = AssetDatabase.LoadAssetAtPath<Font>("Assets/GameRes/UI/Shared/Fonts/Minigame/黑体.ttf");
        if (!font) throw new InvalidOperationException("缺少已导入的中文字体 黑体.ttf。");
        Folder(Output); Folder(Output + "/Textures");
        ImportTextures();
        var previous = session.transform.Find("Original Formation UI");
        if (previous) Object.DestroyImmediate(previous.gameObject);
        var root = new GameObject("Original Formation UI", typeof(RectTransform), typeof(Canvas),
            typeof(CanvasScaler), typeof(GraphicRaycaster));
        root.transform.SetParent(session.transform, false);
        root.layer = 5;
        var canvas = root.GetComponent<Canvas>();
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;
        canvas.sortingOrder = 140;
        var scaler = root.GetComponent<CanvasScaler>();
        scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
        // The reference movie is 16:9. Expand with a 2960x1440 reference left
        // a visible strip above the header at 2560x1440.
        scaler.referenceResolution = new Vector2(2960, 1665);
        scaler.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand;
        var page = Node(root.transform, "UIFormation", 0, 0, 2960, 1665);
        page.anchorMin = page.anchorMax = new Vector2(.5f, .5f);
        page.anchoredPosition = new Vector2(-1480, 832.5f);
        Picture(page, "Header", "Header_Bg", 0, -14, 2960, 118, Color.white, true);
        Label(page, "Title", "部队编成", 82, 8, 600, 75, 45, TextAnchor.MiddleLeft).fontStyle = FontStyle.Bold;
        Label(page, "Subtitle", "拖动调整站位  ·  点击更换学生", 1810, 18, 1050, 55, 30, TextAnchor.MiddleRight);
        Picture(page, "Current Team", "Role_Plate", 0, 435, 345, 106, Ink);
        Label(page, "Current Team Label", "部队 1", 20, 443, 300, 83, 39).color = new Color(1, .9f, .22f);
        var slotButtons = new List<Object>();
        var slotPortraits = new List<Object>();
        var slotNames = new List<Object>();
        var dropAreas = new List<Object>();
        float[] sourceX = { -761, -233, 279, 796 }; // 原 UIFormation UnitPositions + Position1..4。
        for (int i = 0; i < 4; i++)
        {
            var slot = Node(page, "Front Slot " + i, 1480 + sourceX[i] - 240, 400, 480, 920);
            slotButtons.Add(HitButton(slot));
            dropAreas.Add(slot);
            // 保留统一头像绑定，前排本页由真正的 3D 模型呈现。
            var portrait = Node(slot, "Portrait Binding", 0, 0, 1, 1).gameObject.AddComponent<RawImage>();
            portrait.gameObject.SetActive(false);
            slotPortraits.Add(portrait);
            Picture(slot, "Name Background", "Info_Plate", 20, 760, 440, 125, new Color(1,1,1,.88f));
            Picture(slot, "Role Background", "Role_Plate", 20, 740, 220, 45, Ink);
            Label(slot, "Role", "STRIKER", 35, 740, 185, 45, 25).color = Color.white;
            Label(slot, "Slot Number", (i + 1).ToString("00"), 368, 748, 64, 45, 28).color = Ink;
            slotNames.Add(Label(slot, "Name", "", 42, 795, 390, 64, 36));
        }
        for (int i = 0; i < 2; i++)
        {
            var slot = Node(page, "Support Slot " + i, 650 + i * 800, 1465, 760, 175);
            slotButtons.Add(HitButton(slot));
            Picture(slot, "Name Background", "Info_Plate", 60, 25, 680, 138, new Color(1,1,1,.9f));
            StudentCard(slot, "Card", 0, 0, 190, 156, out _, out var portrait);
            slotPortraits.Add(portrait);
            Picture(slot, "Role Background", "Role_Plate", 205, 15, 220, 45, new Color(.08f,.48f,.68f));
            Label(slot, "Role", "SPECIAL", 220, 15, 185, 45, 25).color = Color.white;
            slotNames.Add(Label(slot, "Name", "", 210, 70, 490, 73, 32, TextAnchor.MiddleLeft));
        }
        var deployImage = Picture(page, "ActionButton", "Deploy_Bg", 2460, 1432, 402, 224,
            new Color(.9647f, .91365f, .29412f));
        deployImage.raycastTarget = true;
        var deploy = deployImage.gameObject.AddComponent<Button>();
        deploy.targetGraphic = deployImage;
        Picture(deploy.transform, "Original Button Pattern", "Deploy_Pattern", 165, 95, 220, 122, new Color(1,1,1,.6f));
        Label(deploy.transform, "Label", "出击", 0, 55, 402, 105, 65).fontStyle = FontStyle.Bold;
        var picker = Node(root.transform, "UIPopup_Formation_CharEdit", 0, 0, 2960, 1440);
        picker.anchorMin = picker.anchorMax = new Vector2(.5f, .5f);
        picker.anchoredPosition = new Vector2(-1480, 720);
        Panel(picker, "Dim", 0, -200, 2960, 1840, new Color(0, 0, 0, .6f)).raycastTarget = true;
        Picture(picker, "Popup", "Popup_Bg", 30, 125, 2900, 1245, Color.white, true).raycastTarget = true;
        var title = Label(picker, "Title", "前排", 900, 150, 1160, 90, 60);
        var close = Button(picker, "Close", "", 2770, 164, 75, 75, Color.white, 40);
        close.GetComponent<Image>().sprite = Sprites["Close"];
        close.GetComponent<Image>().type = Image.Type.Simple;
        Label(picker, "School", "千年科学学园", 165, 300, 660, 60, 39, TextAnchor.MiddleLeft);
        var previewName = Label(picker, "Preview Name", "", 165, 370, 730, 90, 59, TextAnchor.MiddleLeft);
        StudentCard(picker, "Preview Card", 170, 520, 550, 452, out _, out var previewPortrait);
        Panel(picker, "Candidate Background", 930, 300, 1900, 680, new Color(.72f, .9f, .96f));
        var candidates = new List<Object>();
        var candidatePortraits = new List<Object>();
        var candidateNames = new List<Object>();
        var candidateMarks = new List<Object>();
        for (int i = 0; i < 4; i++)
        {
            var cell = Node(picker, "Candidate " + i, 965 + i * 465, 420, 420, 510);
            Picture(cell, "Cell Background", "Popup_Bg", 0, 0, 420, 510, Color.white, true);
            candidates.Add(HitButton(cell));
            StudentCard(cell, "Card", 18, 22, 384, 315, out var mark, out var portrait);
            candidatePortraits.Add(portrait); candidateMarks.Add(mark);
            candidateNames.Add(Label(cell, "Name", "", 12, 356, 396, 110, 34));
        }
        var summaryPortraits = new List<Object>();
        var summaryMarks = new List<Object>();
        Panel(picker, "Main Team Line", 100, 1085, 992, 9, new Color(.78f, .19f, .22f));
        Panel(picker, "Support Team Line", 1125, 1085, 485, 9, new Color(.06f, .42f, .86f));
        for (int i = 0; i < 6; i++)
        {
            StudentCard(picker, "Team " + i, 100 + i * 255, 1105, 235, 193, out var mark, out var portrait);
            summaryPortraits.Add(portrait); summaryMarks.Add(mark);
        }
        var confirm = Button(picker, "Confirm", "确认", 2380, 1135, 400, 185, Blue, 60);
        picker.gameObject.SetActive(false);
        Set(binding, "formationRoot", root); Set(binding, "formationPicker", picker.gameObject);
        Set(binding, "formationSlots", slotButtons); Set(binding, "formationPortraits", slotPortraits);
        Set(binding, "formationNames", slotNames); Set(binding, "formationCandidates", candidates);
        Set(binding, "formationCandidatePortraits", candidatePortraits);
        Set(binding, "formationCandidateNames", candidateNames); Set(binding, "formationCandidateMarks", candidateMarks);
        Set(binding, "formationSummaryPortraits", summaryPortraits); Set(binding, "formationSummaryMarks", summaryMarks);
        Set(binding, "formationTitle", title); Set(binding, "formationPreviewName", previewName);
        Set(binding, "formationPreviewPortrait", previewPortrait);
        Set(binding, "formationConfirm", confirm); Set(binding, "formationClose", close); Set(binding, "formationDeploy", deploy);
        Set(binding, "formationBattlePortraits", hudPortraits);
        Set(binding, "formationDropAreas", dropAreas);
        BuildPreviewStage(session, binding);
        binding.ApplyModifiedPropertiesWithoutUndo();
        var sessionBinding = new SerializedObject(session);
        var selectionUI = sessionBinding.FindProperty("selectionUI") ?? sessionBinding.FindProperty("SelectionUI");
        if (selectionUI == null) throw new InvalidOperationException("BattleSession缺少selectionUI/SelectionUI字段。");
        selectionUI.objectReferenceValue = root;
        sessionBinding.ApplyModifiedPropertiesWithoutUndo();
        PopulateEditorPreview(sessionBinding, slotPortraits, slotNames, summaryPortraits);
        EnsureEventSystem();
        SquadSequenceSetup.RestoreEntranceTransition();
        EditorUtility.SetDirty(input); EditorUtility.SetDirty(session);
        AssetDatabase.SaveAssets();
        EditorSceneManager.MarkSceneDirty(scene);
        EditorSceneManager.SaveScene(scene);
        Debug.Log("3D 编队已创建：四名前排使用原版编队待机/提起动作，支持拖拽换位；两名支援保持头像卡。");
    }

    static void BuildPreviewStage(BattleSession session, SerializedObject binding)
    {
        Folder(Output + "/Animations");
        var previous = session.transform.Find("Formation 3D Stage");
        if (previous) Object.DestroyImmediate(previous.gameObject);
        var stage = new GameObject("Formation 3D Stage");
        stage.transform.SetParent(session.transform, false);
        stage.transform.position = new Vector3(0, 1000, 0);
        var cameraObject = new GameObject("Formation Virtual Camera");
        cameraObject.transform.SetParent(stage.transform, false);
        cameraObject.transform.localPosition = Vector3.zero;
        cameraObject.transform.localRotation = Quaternion.identity;
        var camera = cameraObject.AddComponent<CinemachineVirtualCamera>();
        camera.Priority = 200;
        camera.m_Lens.ModeOverride = LensSettings.OverrideModes.Perspective;
        camera.m_Lens.FieldOfView = 10;
        camera.m_Lens.NearClipPlane = 9;
        camera.m_Lens.FarClipPlane = 100;
        // 原版编队背景是一张平面图；放在角色后面，主相机只渲染一次。
        var background = GameObject.CreatePrimitive(PrimitiveType.Quad);
        background.name = "Original Formation Background";
        background.transform.SetParent(cameraObject.transform, false);
        background.transform.localPosition = new Vector3(0, 0, 30);
        background.transform.localScale = new Vector3(10.8f, 5.26f, 1);
        Object.DestroyImmediate(background.GetComponent<Collider>());
        string materialPath = Output + "/Formation Background.mat";
        var material = AssetDatabase.LoadAssetAtPath<Material>(materialPath);
        if (!material)
        {
            material = new Material(Shader.Find("Universal Render Pipeline/Unlit"));
            AssetDatabase.CreateAsset(material, materialPath);
        }
        material.SetTexture("_BaseMap", Sprites["Formation_Bg"].texture);
        background.GetComponent<Renderer>().sharedMaterial = material;
        EditorUtility.SetDirty(material);
        var layout = new GameObject("Original UI Position Scale");
        layout.transform.SetParent(stage.transform, false);
        layout.transform.localPosition = new Vector3(0, 0, 11.43f);
        layout.transform.localScale = Vector3.one * (2f / 1440);
        float[] sourceX = { -761, -233, 279, 796 };
        var units = new List<Object>();
        var models = new List<Object>();
        var positions = new List<Object>();
        var animators = new List<Object>();
        for (int i = 0; i < 4; i++)
        {
            var unit = session.allies[i];
            string character = unit.definition.displayName;
            string folder = "Assets/GameRes/Characters/" + character;
            var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(folder + "/Prefabs/" + character + ".prefab");
            var idle = AssetDatabase.LoadAssetAtPath<AnimationClip>(folder + "/Animations/Formation_Idle.anim");
            var pickup = AssetDatabase.LoadAssetAtPath<AnimationClip>(folder + "/Animations/Formation_Pickup.anim");
            if (!prefab || !idle || !pickup) throw new InvalidOperationException(character + " 缺少编队模型或原版动作。");
            var slot = new GameObject("Slot " + (i + 1));
            slot.transform.SetParent(layout.transform, false);
            slot.transform.localPosition = new Vector3(sourceX[i], -300f, -316.4f);
            var holder = new GameObject(character);
            holder.transform.SetParent(layout.transform, false);
            holder.transform.position = slot.transform.position;
            holder.transform.localRotation = new Quaternion(.007243065f, .9999738f, 0, 0);
            holder.transform.localScale = Vector3.one * 570;
            var model = (GameObject)PrefabUtility.InstantiatePrefab(prefab, holder.transform);
            model.transform.localPosition = Vector3.zero;
            model.transform.localRotation = Quaternion.identity;
            var animator = model.GetComponent<Animator>();
            if (!animator) throw new InvalidOperationException(character + " 的基础 Prefab 缺少 Animator。");
            string path = Output + "/Animations/" + character + "_Formation.controller";
            var controller = AssetDatabase.LoadAssetAtPath<AnimatorController>(path);
            if (!controller) controller = AnimatorController.CreateAnimatorControllerAtPath(path);
            var machine = controller.layers[0].stateMachine;
            foreach (var state in machine.states) machine.RemoveState(state.state);
            var idleState = machine.AddState("Idle"); idleState.motion = idle; machine.defaultState = idleState;
            var pickupState = machine.AddState("Pickup"); pickupState.motion = pickup;
            animator.runtimeAnimatorController = controller;
            animator.applyRootMotion = false;
            animator.cullingMode = AnimatorCullingMode.AlwaysAnimate;
            EditorUtility.SetDirty(controller);
            units.Add(unit); models.Add(holder.transform); positions.Add(slot.transform); animators.Add(animator);
        }
        Set(binding, "formationStage", stage);
        Set(binding, "formationLayout", layout.transform);
        binding.FindProperty("formationReferenceSize").vector2Value = new Vector2(2960, 1440);
        Set(binding, "formationUnits", units); Set(binding, "formationModels", models);
        Set(binding, "formationPositions", positions); Set(binding, "formationAnimators", animators);
        SetFormationExposure(stage);
    }

    [MenuItem("Tools/Blue Archive/Refresh Formation Exposure")]
    public static void RefreshFormationExposure()
    {
        var input = Object.FindObjectOfType<SquadInput>();
        SetFormationExposure(input.formationStage);
        AssetDatabase.SaveAssets();
        EditorSceneManager.MarkSceneDirty(input.gameObject.scene);
        EditorSceneManager.SaveScene(input.gameObject.scene);
    }

    static void SetFormationExposure(GameObject stage)
    {
        string path = Output + "/Formation Exposure.asset";
        var profile = AssetDatabase.LoadAssetAtPath<UnityEngine.Rendering.VolumeProfile>(path);
        if (!profile)
        {
            profile = ScriptableObject.CreateInstance<UnityEngine.Rendering.VolumeProfile>();
            AssetDatabase.CreateAsset(profile, path);
            var color = profile.Add<UnityEngine.Rendering.Universal.ColorAdjustments>();
            color.postExposure.Override(-.3f); // 只调整选人画面的观感，不改战斗和 EX 灯光。
            AssetDatabase.AddObjectToAsset(color, profile);
        }
        var volume = stage.GetComponent<UnityEngine.Rendering.Volume>() ?? stage.AddComponent<UnityEngine.Rendering.Volume>();
        volume.isGlobal = true; volume.priority = 100; volume.sharedProfile = profile;
        EditorUtility.SetDirty(profile); EditorUtility.SetDirty(volume);
    }

    static void ValidateRoster(SerializedObject session)
    {
        var allies = session.FindProperty("allies");
        var supports = session.FindProperty("supports");
        if (allies == null || allies.arraySize != 4 || supports == null || supports.arraySize != 2)
            throw new InvalidOperationException("编队必须配置四名前排和两名支援。");
        var seen = new HashSet<Object>();
        for (int i = 0; i < 6; i++)
        {
            SerializedObject data = null;
            SerializedProperty support = null;
            if (i < 4)
            {
                var unit = allies.GetArrayElementAtIndex(i).objectReferenceValue;
                if (!unit || !seen.Add(unit)) throw new InvalidOperationException("前排为空或重复。");
                var definition = new SerializedObject(unit).FindProperty("definition").objectReferenceValue;
                if (!definition) throw new InvalidOperationException("前排缺少角色定义。");
                data = new SerializedObject(definition);
            }
            else support = supports.GetArrayElementAtIndex(i - 4);
            var portrait = data != null ? data.FindProperty("portrait") : support.FindPropertyRelative("portrait");
            var name = data != null ? data.FindProperty("displayName") : support.FindPropertyRelative("displayName");
            if (portrait == null || !portrait.objectReferenceValue || name == null || string.IsNullOrWhiteSpace(name.stringValue))
                throw new InvalidOperationException("第" + (i + 1) + "名成员缺少真实头像或姓名。");
        }
    }

    static void PopulateEditorPreview(SerializedObject session, List<Object> portraits,
        List<Object> labels, List<Object> summaries)
    {
        var allies = session.FindProperty("allies");
        var supports = session.FindProperty("supports");
        for (int i = 0; i < 6; i++)
        {
            Texture texture = null;
            string displayName = "空位";
            if (i < 4 && allies != null && i < allies.arraySize)
            {
                var unit = allies.GetArrayElementAtIndex(i).objectReferenceValue;
                var definition = unit ? new SerializedObject(unit).FindProperty("definition").objectReferenceValue : null;
                if (definition)
                {
                    var data = new SerializedObject(definition);
                    texture = data.FindProperty("portrait").objectReferenceValue as Texture;
                    displayName = data.FindProperty("displayName").stringValue;
                }
            }
            else if (i >= 4 && supports != null && i - 4 < supports.arraySize)
            {
                var support = supports.GetArrayElementAtIndex(i - 4);
                texture = support.FindPropertyRelative("portrait")?.objectReferenceValue as Texture;
                displayName = support.FindPropertyRelative("displayName")?.stringValue ?? "空位";
            }
            var portrait = (RawImage)portraits[i]; portrait.texture = texture; portrait.enabled = texture;
            var summary = (RawImage)summaries[i]; summary.texture = texture; summary.enabled = texture;
            ((Text)labels[i]).text = displayName;
        }
    }

    static RectTransform StudentCard(Transform parent, string name, float x, float y, float w, float h,
        out GameObject selected, out RawImage portrait)
    {
        var root = Node(parent, name, x, y, w, h);
        Picture(root, "Original Card Background", "Card_Bg", 0, 0, w, h, Color.white);
        var photo = Node(root, "Portrait", 0, 0, w, h);
        portrait = photo.gameObject.AddComponent<RawImage>(); portrait.raycastTarget = false;
        selected = Picture(root, "Selected", "Card_Select", 0, 0, w, h, Color.white).gameObject;
        selected.SetActive(false);
        return root;
    }

    static RectTransform Node(Transform parent, string name, float x, float y, float w, float h)
    {
        var go = new GameObject(name, typeof(RectTransform)); go.layer = 5;
        var rect = (RectTransform)go.transform; rect.SetParent(parent, false);
        rect.anchorMin = rect.anchorMax = new Vector2(0, 1); rect.pivot = new Vector2(0, 1);
        rect.anchoredPosition = new Vector2(x, -y); rect.sizeDelta = new Vector2(w, h); return rect;
    }

    static Image Panel(Transform parent, string name, float x, float y, float w, float h, Color color)
    {
        var image = Node(parent, name, x, y, w, h).gameObject.AddComponent<Image>();
        image.color = color; image.raycastTarget = false; return image;
    }

    static Image Picture(Transform parent, string name, string sprite, float x, float y, float w, float h,
        Color color, bool sliced = false)
    {
        var image = Panel(parent, name, x, y, w, h, color);
        image.sprite = Sprites[sprite]; image.type = sliced ? Image.Type.Sliced : Image.Type.Simple;
        return image;
    }

    static Text Label(Transform parent, string name, string text, float x, float y, float w, float h,
        int size, TextAnchor align = TextAnchor.MiddleCenter)
    {
        var label = Node(parent, name, x, y, w, h).gameObject.AddComponent<Text>();
        label.font = font; label.text = text; label.fontSize = size; label.color = Ink;
        label.alignment = align; label.raycastTarget = false;
        label.horizontalOverflow = HorizontalWrapMode.Overflow; label.verticalOverflow = VerticalWrapMode.Overflow;
        return label;
    }

    static Button HitButton(RectTransform rect)
    {
        var hit = rect.gameObject.AddComponent<Image>(); hit.color = Color.clear; hit.raycastTarget = true;
        var button = rect.gameObject.AddComponent<Button>(); button.targetGraphic = hit;
        button.transition = Selectable.Transition.None; return button;
    }

    static Button Button(Transform parent, string name, string text, float x, float y, float w, float h,
        Color color, int size)
    {
        var image = Picture(parent, name, "Button_Bg", x, y, w, h, color, true);
        image.raycastTarget = true;
        var button = image.gameObject.AddComponent<Button>(); button.targetGraphic = image;
        button.transition = Selectable.Transition.ColorTint;
        Label(image.transform, "Label", text, 0, 0, w, h, size);
        return button;
    }

    static void ImportTextures()
    {
        Sprites.Clear();
        foreach (var source in Directory.GetFiles(Stage + "/Textures", "*.png"))
        {
            string name = Path.GetFileNameWithoutExtension(source), path = Output + "/Textures/" + name + ".png";
            File.Copy(source, Path.GetFullPath(path), true);
            AssetDatabase.ImportAsset(path, ImportAssetOptions.ForceUpdate);
            var importer = (TextureImporter)AssetImporter.GetAtPath(path);
            importer.textureType = TextureImporterType.Sprite; importer.spriteImportMode = SpriteImportMode.Single;
            importer.alphaIsTransparency = true; importer.mipmapEnabled = false;
            importer.textureCompression = TextureImporterCompression.Uncompressed;
            importer.maxTextureSize = 2048;
            importer.spriteBorder = name == "Header_Bg" ? new Vector4(70, 25, 70, 75) :
                name == "Popup_Bg" ? new Vector4(48, 65, 48, 145) :
                name == "Button_Bg" ? new Vector4(30, 35, 30, 30) :
                name == "Name_Bg" ? new Vector4(25, 5, 25, 35) : Vector4.zero;
            importer.SaveAndReimport();
            Sprites[name] = AssetDatabase.LoadAssetAtPath<Sprite>(path);
        }
    }

    static void Set(SerializedObject target, string name, Object value)
    {
        var field = target.FindProperty(name);
        if (field == null) throw new InvalidOperationException("缺少SquadInput字段：" + name);
        field.objectReferenceValue = value;
    }

    static void Set(SerializedObject target, string name, List<Object> values)
    {
        var field = target.FindProperty(name);
        if (field == null) throw new InvalidOperationException("缺少SquadInput字段：" + name);
        field.arraySize = values.Count;
        for (int i = 0; i < values.Count; i++) field.GetArrayElementAtIndex(i).objectReferenceValue = values[i];
    }

    static void EnsureEventSystem()
    {
        var events = Object.FindObjectOfType<EventSystem>();
        if (!events) events = new GameObject("EventSystem", typeof(EventSystem)).GetComponent<EventSystem>();
        var module = events.GetComponent<InputSystemUIInputModule>();
        if (!module) module = events.gameObject.AddComponent<InputSystemUIInputModule>();
        module.AssignDefaultActions();
        foreach (var other in events.GetComponents<BaseInputModule>()) other.enabled = other == module;
    }

    static void Folder(string path)
    {
        if (AssetDatabase.IsValidFolder(path)) return;
        int slash = path.LastIndexOf('/'); Folder(path.Substring(0, slash));
        AssetDatabase.CreateFolder(path.Substring(0, slash), path.Substring(slash + 1));
    }
}
#endif
