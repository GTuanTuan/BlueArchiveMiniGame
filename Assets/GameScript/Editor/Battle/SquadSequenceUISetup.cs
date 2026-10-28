#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Game.Battle;
using Newtonsoft.Json.Linq;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem.UI;
using Object = UnityEngine.Object;

// Only selected original UI images/layout/curves are copied; no original game or NGUI scripts.
public static class SquadSequenceUISetup
{
    const string Stage = "C:/UnityProject/BAAssets/Tools/SquadDemo/SequenceUIStaging";
    const string Output = "Assets/GameRes/Battle/SequenceUI";
    static readonly Dictionary<string, Texture2D> Textures = new Dictionary<string, Texture2D>();
    static readonly Dictionary<string, Sprite> Sprites = new Dictionary<string, Sprite>();
    static readonly Dictionary<string, AudioClip> Sounds = new Dictionary<string, AudioClip>();

    [MenuItem("Tools/Blue Archive/Build Squad Sequence UI")]
    public static void Build()
    {
        if (EditorApplication.isPlayingOrWillChangePlaymode) throw new InvalidOperationException("Exit Play before building UI.");
        var scene = UnityEngine.SceneManagement.SceneManager.GetActiveScene();
        if (scene.path != "Assets/GameRes/Scenes/Player_GameDev.unity") throw new InvalidOperationException("Open Player_GameDev.unity.");
        var session = Object.FindObjectOfType<BattleSession>();
        if (!session) throw new InvalidOperationException("BattleSession is missing.");
        var binding = new SerializedObject(session);
        if (binding.FindProperty("fightTitle") == null || binding.FindProperty("victoryUI") == null)
            throw new InvalidOperationException("BattleSession needs fightTitle (PlayableDirector) and victoryUI (GameObject).");
        var data = JObject.Parse(File.ReadAllText(Stage + "/sequence-ui.json"));
        Folder(Output); Folder(Output + "/Textures"); Folder(Output + "/Animations"); Folder(Output + "/Audio");
        Textures.Clear(); Sprites.Clear();
        ImportTextures((JArray)data["textures"]);
        ImportAudio((JArray)data["audio"]);
        var old = session.transform.Find("Sequence UI");
        if (old) Object.DestroyImmediate(old.gameObject);
        var container = new GameObject("Sequence UI"); container.transform.SetParent(session.transform, false);
        var startData = data["screens"].Single(s => (string)s["name"] == "UIBattle");
        var victoryData = data["screens"].Single(s => (string)s["name"] == "UIVictory");
        var startClip = data["clips"].Single(c => (string)c["name"] == "UIAni_Start");
        var victoryClip = data["clips"].Single(c => (string)c["name"] == "UIAni_End_Complete");
        var start = CreateScreen(container.transform, "Original Start", startData, 150);
        SetTitle(start, false);
        AddDirector(start, MakeClip(startClip, "OriginalStart", false), "OriginalStart", Sounds["StartAndFight"], .9f);
        var fight = CreateScreen(container.transform, "Original Fight", startData, 150);
        SetTitle(fight, true);
        var fightDirector = AddDirector(fight, MakeClip(startClip, "OriginalFight", false), "OriginalFight", Sounds["StartAndFight"], .9f);
        // Director roots remain active; their Start child is initially hidden and keyed on at time 0.
        start.transform.Find("Start").gameObject.SetActive(false);
        fight.transform.Find("Start").gameObject.SetActive(false);
        var victory = CreateScreen(container.transform, "Original Victory", victoryData, 151);
        // BackUI is source-inactive and is not keyed by UIAni_End_Complete.
        // This reduced UI has no original host script, so enable it explicitly.
        foreach (string path in new[] { "BackUI", "BackUI/Top", "BackUI/Top/Vic_Font", "BackUI/Top/Subinfo_BG", "BackUI/BlackBg" })
        {
            var target = victory.transform.Find(path);
            if (!target) throw new InvalidOperationException("Original victory node is missing: " + path);
            target.gameObject.SetActive(true);
        }
        var animation = victory.AddComponent<Animation>();
        var resultClip = MakeClip(victoryClip, "OriginalVictory", true);
        animation.AddClip(resultClip, resultClip.name); animation.clip = resultClip;
        animation.playAutomatically = true; animation.wrapMode = WrapMode.Once;
        // Vic_Font_L remains animation-owned: active at 0, inactive at 1.58333s,
        // with its original 0.023529 -> 1 -> 0.023529 alpha keys intact.
        // Original reward/account placeholder values must not masquerade as current game results.
        var reward = victory.transform.Find("BackUI/Top/Reward"); if (reward) reward.gameObject.SetActive(false);
        var time = victory.transform.Find("BackUI/Top/Time"); if (time) time.gameObject.SetActive(false);
        var victorySound = victory.transform.Find("BackUI/Top/Vic_Font").gameObject.AddComponent<AudioSource>();
        victorySound.clip = Sounds["VictoryTitle"]; victorySound.volume = .8f; victorySound.pitch = .9f;
        victorySound.spatialBlend = 0; victorySound.playOnAwake = true; victorySound.ignoreListenerPause = true;
        // Result controls contain no invented rewards, EXP or account levels.
        AddResultCards(victory, session);
        victory.SetActive(false);
        var defeatData = data["screens"].Single(s => (string)s["name"] == "UIBattleResult");
        var defeatClip = data["clips"].Single(c => (string)c["name"] == "UIAni_Battle_Result_Other");
        var defeat = CreateScreen(container.transform, "Original Defeat", defeatData, 151);
        foreach (string path in new[] { "BackUI", "BackUI/Defeat", "BackUI/Defeat/Other", "BackUI/Defeat/Other/Type_Other" })
            defeat.transform.Find(path).gameObject.SetActive(true);
        var defeatAnimation = defeat.AddComponent<Animation>(); var failedClip = MakeClip(defeatClip, "OriginalDefeat", true);
        defeatAnimation.AddClip(failedClip, failedClip.name); defeatAnimation.clip = failedClip;
        defeatAnimation.playAutomatically = true; defeatAnimation.wrapMode = WrapMode.Once;
        // No failure SFX is guessed: the source Defeat subtree has no UIAudioPlay binding.
        defeat.SetActive(false);
        var title = CreateScreen(container.transform, "Original Victory Title", defeatData, 151);
        title.transform.Find("BackUI/Defeat").gameObject.SetActive(false);
        title.transform.Find("BackUI/Victory").gameObject.SetActive(true);
        var titleAnimation = title.AddComponent<Animation>();
        var titleClip = MakeClip(data["clips"].Single(c => (string)c["name"] == "UIAni_Battle_Result"), "OriginalVictoryTitle", true);
        titleAnimation.AddClip(titleClip, titleClip.name); titleAnimation.clip = titleClip;
        titleAnimation.playAutomatically = true; titleAnimation.wrapMode = WrapMode.Once;
        title.SetActive(false);
        binding.Update();
        var titleBinding = binding.FindProperty("victoryTitleUI");
        if (titleBinding != null) titleBinding.objectReferenceValue = title;
        binding.FindProperty("fightTitle").objectReferenceValue = fightDirector;
        binding.FindProperty("victoryUI").objectReferenceValue = victory;
        var defeatBinding = binding.FindProperty("defeatUI");
        if (defeatBinding != null) defeatBinding.objectReferenceValue = defeat;
        binding.ApplyModifiedPropertiesWithoutUndo();
        EditorUtility.SetDirty(session); AssetDatabase.SaveAssets();
        EditorSceneManager.MarkSceneDirty(scene); EditorSceneManager.SaveScene(scene);
        Debug.Log("Original Start/Fight and basic Victory UI built. No guessed relative Victory UI delay was introduced.");
    }

    static GameObject CreateScreen(Transform parent, string name, JToken screen, int order)
    {
        var root = new GameObject(name, typeof(RectTransform), typeof(Canvas), typeof(CanvasScaler), typeof(CanvasGroup));
        root.transform.SetParent(parent, false); root.layer = 5;
        var canvas = root.GetComponent<Canvas>(); canvas.renderMode = RenderMode.ScreenSpaceOverlay; canvas.sortingOrder = order;
        var scaler = root.GetComponent<CanvasScaler>(); scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
        scaler.referenceResolution = new Vector2(2960, 1440); scaler.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand;
        var group = root.GetComponent<CanvasGroup>(); group.blocksRaycasts = false; group.interactable = false;
        var objects = new Dictionary<string, GameObject> { [""] = root };
        foreach (var node in screen["nodes"])
        {
            string path = (string)node["path"];
            GameObject go;
            if (path.Length == 0) go = root;
            else
            {
                go = new GameObject(path.Split('/').Last(), typeof(RectTransform)); go.layer = 5;
                go.transform.SetParent(objects[(string)node["parent"]].transform, false); objects[path] = go;
            }
            var rect = (RectTransform)go.transform;
            rect.anchorMin = V2(node["anchorMin"]); rect.anchorMax = V2(node["anchorMax"]);
            rect.pivot = V2(node["pivot"]); rect.sizeDelta = V2(node["sizeDelta"]);
            if (node["offsetMin"] != null)
            { rect.offsetMin = V2(node["offsetMin"]); rect.offsetMax = V2(node["offsetMax"]); }
            else rect.localPosition = V3(node["localPosition"]);
            rect.localRotation = Q(node["localRotation"]); rect.localScale = V3(node["localScale"]);
            var cg = go.GetComponent<CanvasGroup>();
            if (!cg) cg = go.AddComponent<CanvasGroup>();
            // Graphic alpha belongs to Graphic.color; applying it again as a group would square it.
            cg.alpha = node["renderComponent"]?.Type == JTokenType.String ? 1 : (float)node["canvasGroupAlpha"];
            cg.blocksRaycasts = false; cg.interactable = false;
            string kind = (string)node["renderComponent"], texture = (string)node["texture"];
            Graphic graphic = null;
            if (kind == "UnityEngine.UI.RawImage" && texture != null)
            {
                var raw = go.AddComponent<RawImage>(); raw.texture = Textures[texture];
                var uv = node["uvRect"]; raw.uvRect = new Rect((float)uv[0], (float)uv[1], (float)uv[2], (float)uv[3]); graphic = raw;
                if (path == "Start/StartImage/Light") raw.material = StartLightMaterial(Textures[texture]);
            }
            else if (kind == "UnityEngine.UI.Image" && texture != null)
            {
                var img = go.AddComponent<Image>(); img.sprite = Sprites[texture];
                img.type = (string)node["imageType"] == "Sliced" ? Image.Type.Sliced : Image.Type.Simple; graphic = img;
            }
            else if (kind == "UnityEngine.UI.Text")
            {
                var text = go.AddComponent<Text>(); var settings = node["text"];
                text.font = Resources.GetBuiltinResource<Font>("LegacyRuntime.ttf");
                text.text = (string)settings["value"]; text.fontSize = (int)settings["fontSize"];
                text.fontStyle = (FontStyle)(int)settings["fontStyle"]; text.alignment = TextAnchor.MiddleCenter; graphic = text;
            }
            if (graphic)
            {
                var c = node["color"]; graphic.color = new Color((float)c[0], (float)c[1], (float)c[2], (float)c[3]);
                graphic.raycastTarget = false;
            }
            go.SetActive((bool)node["active"]);
        }
        // Descendants keep their exact source paths; only draw-order siblings are sorted.
        foreach (var siblings in screen["nodes"].Where(n => (string)n["path"] != "").GroupBy(n => (string)n["parent"]))
        {
            int index = 0;
            foreach (var n in siblings.OrderBy(n => (int)n["depth"])) objects[(string)n["path"]].transform.SetSiblingIndex(index++);
        }
        root.SetActive(true); return root;
    }

    static void SetTitle(GameObject root, bool fight)
    {
        root.transform.Find("Start/StartImage/Start").gameObject.SetActive(!fight);
        root.transform.Find("Start/StartImage/Fight").gameObject.SetActive(fight);
    }

    static PlayableDirector AddDirector(GameObject root, AnimationClip clip, string name, AudioClip sound = null, float volume = 1)
    {
        var animator = root.GetComponent<Animator>();
        if (!animator) animator = root.AddComponent<Animator>();
        animator.cullingMode = AnimatorCullingMode.AlwaysAnimate;
        string path = Output + "/Animations/" + name + ".playable";
        var timeline = AssetDatabase.LoadAssetAtPath<TimelineAsset>(path);
        if (timeline)
        {
            foreach (var previous in timeline.GetRootTracks().ToArray()) timeline.DeleteTrack(previous);
        }
        else
        {
            if (AssetDatabase.LoadMainAssetAtPath(path)) throw new InvalidOperationException("Timeline path has another asset type.");
            timeline = ScriptableObject.CreateInstance<TimelineAsset>(); timeline.name = name;
            AssetDatabase.CreateAsset(timeline, path);
        }
        // Persist the Timeline before creating its track/playable subassets.
        var track = timeline.CreateTrack<AnimationTrack>(null, name); track.trackOffset = TrackOffset.ApplySceneOffsets;
        track.CreateClip(clip).duration = clip.length;
        EditorUtility.SetDirty(timeline);
        var director = root.AddComponent<PlayableDirector>(); director.playableAsset = timeline;
        director.playOnAwake = false; director.timeUpdateMode = DirectorUpdateMode.UnscaledGameTime;
        director.extrapolationMode = DirectorWrapMode.None;
        director.SetGenericBinding(track, animator);
        if (sound)
        {
            var audio = timeline.CreateTrack<AudioTrack>(null, "Original UI SFX");
            var audioSettings = new SerializedObject(audio);
            audioSettings.FindProperty("m_TrackProperties.volume").floatValue = volume;
            audioSettings.ApplyModifiedPropertiesWithoutUndo();
            var audioClip = audio.CreateClip<AudioPlayableAsset>();
            ((AudioPlayableAsset)audioClip.asset).clip = sound; audioClip.start = 0; audioClip.duration = sound.length;
            var source = root.AddComponent<AudioSource>(); source.playOnAwake = false; source.spatialBlend = 0;
            source.ignoreListenerPause = true; director.SetGenericBinding(audio, source);
        }
        return director;
    }

    static AnimationClip MakeClip(JToken data, string name, bool legacy)
    {
        var clip = new AnimationClip { name = name, legacy = legacy, frameRate = (float)data["sampleRate"], wrapMode = WrapMode.Once };
        foreach (var row in data["channels"])
        {
            var type = TypeFor((string)row["component"]); var keys = new List<Keyframe>();
            foreach (var k in row["keys"])
            {
                var key = new Keyframe((float)k["time"], (float)k["value"], (bool)k["constant"] ? float.PositiveInfinity : (float)k["inTangent"],
                    (bool)k["constant"] ? float.PositiveInfinity : (float)k["outTangent"], (float)k["inWeight"], (float)k["outWeight"]);
                key.weightedMode = (WeightedMode)(int)k["weightedMode"]; keys.Add(key);
            }
            var curve = new AnimationCurve(keys.ToArray()); curve.preWrapMode = WrapMode.ClampForever; curve.postWrapMode = WrapMode.ClampForever;
            AnimationUtility.SetEditorCurve(clip, EditorCurveBinding.FloatCurve((string)row["path"], type, (string)row["property"]), curve);
        }
        AnimationUtility.SetAnimationEvents(clip, Array.Empty<AnimationEvent>());
        return Save(clip, Output + "/Animations/" + name + ".anim");
    }

    static void ImportTextures(JArray records)
    {
        foreach (var row in records)
        {
            string relative = (string)row["path"], path = Output + "/Textures/" + Path.GetFileName(relative);
            var destination = Path.Combine(Directory.GetParent(Application.dataPath).FullName, path);
            File.Copy(Stage + "/" + relative, destination, true); AssetDatabase.ImportAsset(path, ImportAssetOptions.ForceSynchronousImport);
            var importer = (TextureImporter)AssetImporter.GetAtPath(path); importer.textureType = TextureImporterType.Sprite;
            importer.spriteImportMode = SpriteImportMode.Single; importer.alphaIsTransparency = true;
            importer.mipmapEnabled = false; importer.maxTextureSize = 4096; importer.textureCompression = TextureImporterCompression.Uncompressed;
            var border = row["sourceSprite"];
            importer.spriteBorder = border == null ? Vector4.zero : new Vector4((float)border["borderLeft"], (float)border["borderBottom"], (float)border["borderRight"], (float)border["borderTop"]);
            importer.SaveAndReimport(); Textures[relative] = AssetDatabase.LoadAssetAtPath<Texture2D>(path); Sprites[relative] = AssetDatabase.LoadAssetAtPath<Sprite>(path);
        }
    }

    static void ImportAudio(JArray records)
    {
        Sounds.Clear();
        foreach (var row in records)
        {
            string file = (string)row["path"], path = Output + "/Audio/" + Path.GetFileName(file);
            File.Copy(Stage + "/" + file, Path.Combine(Directory.GetParent(Application.dataPath).FullName, path), true);
            AssetDatabase.ImportAsset(path, ImportAssetOptions.ForceSynchronousImport);
            Sounds[(string)row["event"]] = AssetDatabase.LoadAssetAtPath<AudioClip>(path);
        }
    }

    [MenuItem("Tools/Blue Archive/Build Squad Original HUD")]
    public static void BuildHUD()
    {
        if (EditorApplication.isPlayingOrWillChangePlaymode) throw new InvalidOperationException("Exit Play first.");
        var scene = UnityEngine.SceneManagement.SceneManager.GetActiveScene();
        if (scene.path != "Assets/GameRes/Scenes/Player_GameDev.unity") throw new InvalidOperationException("Open Player_GameDev.");
        var input = Object.FindObjectOfType<SquadInput>();
        if (!input || !input.session) throw new InvalidOperationException("SquadInput and session are required.");
        var data = JObject.Parse(File.ReadAllText(Stage + "/sequence-ui.json"));
        Folder(Output); Folder(Output + "/Textures"); ImportTextures((JArray)data["textures"]);
        ImportHUDSprite("Combat_CardBg_EX", "Combat_Combat_CardBg_EX_aa30c9b1.png");
        BakeHealthGauge();
        var previous = input.transform.Find("Original HUD"); if (previous) Object.DestroyImmediate(previous.gameObject);
        var root = new GameObject("Original HUD", typeof(RectTransform), typeof(Canvas), typeof(CanvasScaler), typeof(GraphicRaycaster));
        root.transform.SetParent(input.transform, false); root.layer = 5;
        var canvas = root.GetComponent<Canvas>(); canvas.renderMode = RenderMode.ScreenSpaceOverlay; canvas.sortingOrder = 100;
        var scaler = root.GetComponent<CanvasScaler>(); scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
        scaler.referenceResolution = new Vector2(2960, 1440); scaler.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand;
        var eventSystem = Object.FindObjectOfType<EventSystem>();
        if (!eventSystem) eventSystem = new GameObject("EventSystem", typeof(EventSystem)).GetComponent<EventSystem>();
        var module = eventSystem.GetComponent<InputSystemUIInputModule>();
        if (!module) module = eventSystem.gameObject.AddComponent<InputSystemUIInputModule>();
        module.AssignDefaultActions();
        foreach (var other in eventSystem.GetComponents<BaseInputModule>()) other.enabled = other == module;
        var portraits = new List<Object>(); var skills = new List<Object>(); var portraitImages = new List<Object>();
        var highlights = new List<Object>(); var labels = new List<Object>(); var skillLabels = new List<Object>();
        var supportData = new SerializedObject(input.session).FindProperty("supports");
        int frontCount = input.session.allies.Length;
        int total = frontCount + (supportData == null ? 0 : Mathf.Min(2, supportData.arraySize));
        for (int i = 0; i < total; i++)
        {
            bool front = i < frontCount;
            var unit = front ? input.session.allies[i] : null;
            var support = front ? null : supportData.GetArrayElementAtIndex(i - frontCount);
            string displayName = front ? unit.definition.displayName : support.FindPropertyRelative("displayName").stringValue;
            Texture2D portraitTexture = front ? unit.definition.portrait : support.FindPropertyRelative("portrait").objectReferenceValue as Texture2D;
            // Four Strikers followed by two Specials; native EX silhouettes, no invented cost.
            var card = Node(root.transform, front ? "Front " + (i + 1) : "Support " + (i - frontCount + 1),
                new Vector2(-1040 + i * 180 + (front ? 0 : 32), 89), new Vector2(168, 139), new Vector2(1, 0));
            var bg = Picture(card, "Textures/Combat_CardBg_EX.png", Color.white); bg.type = Image.Type.Simple;
            card.gameObject.AddComponent<Mask>().showMaskGraphic = true;
            if (front)
            {
                bg.raycastTarget = true;
                var button = card.gameObject.AddComponent<Button>(); button.targetGraphic = bg;
                button.transition = Selectable.Transition.None; portraits.Add(button);
            }
            var portrait = Node(card, "Portrait", Vector2.zero, card.sizeDelta);
            var image = portrait.gameObject.AddComponent<RawImage>(); image.texture = portraitTexture;
            image.raycastTarget = false; portraitImages.Add(image);
            Picture(Node(card, "Footer", new Vector2(0,-48), new Vector2(210,48)),
                "Textures/Common_Bg_Raius10px.png", new Color(.055f,.12f,.18f,.96f));
            if (front)
            {
                var selected = Node(card, "Selected", new Vector2(0,64), new Vector2(168,3));
                Picture(selected, "Textures/Common_Line_Dot.png", new Color(.1f,.85f,1));
                selected.gameObject.SetActive(false);
                highlights.Add(selected.gameObject);
                labels.Add(Label(Node(card, "Name", new Vector2(0, -35), new Vector2(168, 23)), displayName, 16));
            }
            else Label(Node(card, "Name", new Vector2(0, -35), new Vector2(168, 23)), displayName, 16);
            var ex = Node(card, "EX", new Vector2(0, -58), new Vector2(210, 25));
            var exImage = Picture(ex, "Textures/Common_Bg_Raius10px.png", new Color(.08f,.22f,.31f,.98f));
            exImage.raycastTarget = true;
            var exButton = ex.gameObject.AddComponent<Button>(); exButton.targetGraphic = exImage;
            skills.Add(exButton);
            skillLabels.Add(Label(Node(ex, "Label", Vector2.zero, ex.sizeDelta), "EX  F" + (i + 1), 19));
            if (front) ((GameObject)highlights[i]).transform.SetAsLastSibling();
        }
        var restart = UIButton(Node(root.transform, "Restart", new Vector2(-150, -70), new Vector2(220, 66), Vector2.one), "重开", out _);
        var state = Label(Node(root.transform, "Pause", new Vector2(0, -70), new Vector2(500, 60), new Vector2(.5f, 1)), "", 40);
        var extraction = Label(Node(root.transform, "Extraction", new Vector2(0, 400), new Vector2(960, 60), new Vector2(.5f, 0)), "", 32);
        var healths = input.session.allies.Where(u => u && u.health).Select(u => u.health).Concat(input.session.enemies.Where(h => h)).ToArray();
        var healthRoots = new List<Object>(); var healthFills = new List<Object>(); var healthLabels = new List<Object>();
        foreach (var hp in healths)
        {
            var bar = Node(root.transform, "Health " + hp.name, Vector2.zero, new Vector2(177, 30));
            Picture(bar, "Textures/Combat_Bg_Hp.png", Color.white);
            var fill = Picture(Node(bar, "Fill", new Vector2(.6f, 2.7f), new Vector2(162, 15)), "Textures/Combat_Gauge_Hp_Sliced.png",
                hp.GetComponent<CharacterUnit>() ? new Color(.7294118f, .9568628f, .027451f) : new Color(1, .3254902f, .3411765f));
            fill.type = Image.Type.Filled; fill.fillMethod = Image.FillMethod.Horizontal; fill.fillOrigin = 0;
            // Native UIHpBar uses Common_Line_Dot, 2x16, inclined 10 degrees.
            // Keep these above the live fill so damage never erases the four-part scale.
            for (int tick = 1; tick < 4; tick++)
            {
                var line = Node(bar, "HP Quarter " + tick, new Vector2(-80.4f + tick * 40.5f, 2.7f), new Vector2(2,16));
                Picture(line, "Textures/Common_Line_Dot.png", new Color(0, 0, 0, .7803922f));
                line.localRotation = Quaternion.Euler(0,0,-10);
            }
            var unit = hp.GetComponent<CharacterUnit>();
            var title = Label(Node(bar, "Name", new Vector2(0, 35), new Vector2(250, 36)), unit && unit.definition ? unit.definition.displayName : "敌人", 24);
            healthRoots.Add(bar); healthFills.Add(fill); healthLabels.Add(title);
        }
        var selection = Node(root.transform, "Selection Rectangle", Vector2.zero, Vector2.zero);
        Picture(selection, "Textures/Card_Select_Line.png", new Color(.3f, .85f, 1, .8f)); selection.gameObject.SetActive(false);
        var serialized = new SerializedObject(input);
        Set(serialized, "hudCanvas", canvas); Set(serialized, "selectionRect", selection);
        Set(serialized, "stateText", state); Set(serialized, "extractionText", extraction); Set(serialized, "restartButton", restart);
        Set(serialized, "portraitButtons", portraits); Set(serialized, "exButtons", skills); Set(serialized, "selectionHighlights", highlights);
        Set(serialized, "unitLabels", labels); Set(serialized, "exLabels", skillLabels); Set(serialized, "worldHealthTargets", healths.Cast<Object>());
        Set(serialized, "worldHealthRoots", healthRoots); Set(serialized, "worldHealthFills", healthFills); Set(serialized, "worldHealthLabels", healthLabels);
        var formationPortraits = serialized.FindProperty("formationBattlePortraits");
        if (formationPortraits != null) Set(serialized, "formationBattlePortraits", portraitImages);
        serialized.ApplyModifiedPropertiesWithoutUndo(); EditorUtility.SetDirty(input); AssetDatabase.SaveAssets();
        EditorSceneManager.MarkSceneDirty(scene); EditorSceneManager.SaveScene(scene);
    }

    static void ImportHUDSprite(string name, string original)
    {
        const string source = "C:/UnityProject/BAAssets/Recovery/TacticalOriginalFlow20261024/CleanImportAssets/_BAConverted/Sprites/";
        string path = Output + "/Textures/" + name + ".png";
        File.Copy(source + original, Path.Combine(Directory.GetParent(Application.dataPath).FullName, path), true);
        AssetDatabase.ImportAsset(path, ImportAssetOptions.ForceSynchronousImport);
        var importer = (TextureImporter)AssetImporter.GetAtPath(path);
        importer.textureType = TextureImporterType.Sprite; importer.spriteImportMode = SpriteImportMode.Single;
        importer.mipmapEnabled = false; importer.alphaIsTransparency = true;
        importer.textureCompression = TextureImporterCompression.Uncompressed; importer.SaveAndReimport();
        Sprites["Textures/" + name + ".png"] = AssetDatabase.LoadAssetAtPath<Sprite>(path);
    }

    static void BakeHealthGauge()
    {
        // Filled uGUI images ignore sprite borders. Bake the original 2/3/2/3
        // nine-slice at its native 162x15 display size before applying fillAmount.
        var sprite = Sprites["Textures/Combat_Gauge_Hp.png"];
        var source = new Texture2D(2,2,TextureFormat.RGBA32,false);
        source.LoadImage(File.ReadAllBytes(Path.Combine(Directory.GetParent(Application.dataPath).FullName, AssetDatabase.GetAssetPath(sprite))));
        var texture = new Texture2D(162,15,TextureFormat.RGBA32,false);
        for (int y = 0; y < 15; y++) for (int x = 0; x < 162; x++)
        {
            float skew = y * .176327f, px = x - skew;
            float sx = SlicePixel(px,159,source.width,2,2);
            float sy = SlicePixel(y,15,source.height,3,3);
            texture.SetPixel(x,y,px < 0 || px > 159 ? Color.clear : source.GetPixelBilinear(sx/source.width,sy/source.height));
        }
        texture.Apply();
        string path = Output + "/Textures/Combat_Gauge_Hp_Sliced.png";
        File.WriteAllBytes(Path.Combine(Directory.GetParent(Application.dataPath).FullName,path),texture.EncodeToPNG());
        Object.DestroyImmediate(source); Object.DestroyImmediate(texture);
        AssetDatabase.ImportAsset(path,ImportAssetOptions.ForceSynchronousImport);
        var importer = (TextureImporter)AssetImporter.GetAtPath(path);
        importer.textureType = TextureImporterType.Sprite; importer.spriteImportMode = SpriteImportMode.Single;
        importer.mipmapEnabled = false; importer.alphaIsTransparency = true;
        importer.textureCompression = TextureImporterCompression.Uncompressed; importer.SaveAndReimport();
        Sprites["Textures/Combat_Gauge_Hp_Sliced.png"] = AssetDatabase.LoadAssetAtPath<Sprite>(path);
    }

    static float SlicePixel(float p, float target, float source, float first, float last)
    { return p < first ? p : p >= target-last ? source-(target-p) : first+(p-first)*(source-first-last)/(target-first-last); }

    static void AddResultCards(GameObject root, BattleSession session)
    {
        var group = root.GetComponent<CanvasGroup>(); group.blocksRaycasts = true; group.interactable = true;
        root.AddComponent<GraphicRaycaster>();
        var supports = new SerializedObject(session).FindProperty("supports");
        int count = session.allies.Length + (supports == null ? 0 : Mathf.Min(2, supports.arraySize));
        var portraits = new List<Object>();
        for (int i = 0; i < count; i++)
        {
            var slot = Node(root.transform, "Result Portrait " + (i + 1), new Vector2(110 + i * 155, 90), new Vector2(140, 115), Vector2.zero);
            var image = slot.gameObject.AddComponent<RawImage>(); image.raycastTarget = false;
            portraits.Add(image);
            image.texture = i < session.allies.Length ? session.allies[i].definition.portrait :
                supports.GetArrayElementAtIndex(i - session.allies.Length).FindPropertyRelative("portrait").objectReferenceValue as Texture2D;
        }
        var ok = UIButton(Node(root.transform, "OK", new Vector2(-150, 90), new Vector2(230, 75), new Vector2(1, 0)), "OK", out _);
        UnityEditor.Events.UnityEventTools.AddPersistentListener(ok.onClick, session.Restart);
        var input = new SerializedObject(Object.FindObjectOfType<SquadInput>());
        Set(input, "resultPortraits", portraits);
        input.ApplyModifiedPropertiesWithoutUndo();
    }

    static RectTransform Node(Transform parent, string name, Vector2 position, Vector2 size, Vector2? anchor = null)
    {
        var go = new GameObject(name, typeof(RectTransform)); go.layer = 5; var rect = (RectTransform)go.transform;
        rect.SetParent(parent, false); rect.anchorMin = rect.anchorMax = anchor ?? new Vector2(.5f, .5f);
        rect.pivot = new Vector2(.5f, .5f); rect.anchoredPosition = position; rect.sizeDelta = size; return rect;
    }
    static Image Picture(RectTransform rect, string path, Color color)
    { var image = rect.gameObject.AddComponent<Image>(); image.sprite = Sprites[path]; image.type = Image.Type.Sliced; image.color = color; image.raycastTarget = false; return image; }
    static Text Label(RectTransform rect, string text, int size)
    {
        var label = rect.gameObject.AddComponent<Text>(); label.text = text; label.fontSize = size; label.color = Color.white;
        label.font = AssetDatabase.LoadAssetAtPath<Font>("Assets/GameRes/UI/Shared/Fonts/Minigame/黑体.ttf");
        if (!label.font) label.font = Resources.GetBuiltinResource<Font>("LegacyRuntime.ttf");
        label.alignment = TextAnchor.MiddleCenter; label.raycastTarget = false; return label;
    }
    static Button UIButton(RectTransform rect, string title, out Text text)
    {
        var image = Picture(rect, "Textures/Common_Btn_BG.png", new Color(.16f, .66f, .87f)); image.raycastTarget = true;
        var button = rect.gameObject.AddComponent<Button>(); button.targetGraphic = image; button.transition = Selectable.Transition.ColorTint;
        text = Label(Node(rect, "Label", Vector2.zero, rect.sizeDelta), title, 28); return button;
    }
    static void Set(SerializedObject target, string field, Object value)
    { var p = target.FindProperty(field); if (p == null) throw new InvalidOperationException("Missing HUD field " + field); p.objectReferenceValue = value; }
    static void Set(SerializedObject target, string field, IEnumerable<Object> values)
    { var p = target.FindProperty(field); if (p == null) throw new InvalidOperationException("Missing HUD field " + field); var array = values.ToArray(); p.arraySize = array.Length; for (int i = 0; i < array.Length; i++) p.GetArrayElementAtIndex(i).objectReferenceValue = array[i]; }

    static Material StartLightMaterial(Texture2D texture)
    {
        var shader = AssetDatabase.LoadAssetAtPath<Shader>("Assets/GameRes/Shared/Shaders/Source/FX_SHADER_Additive_0.shader");
        if (!shader) throw new InvalidOperationException("The existing original additive shader is missing.");
        var mat = new Material(shader) { name = "OriginalStartLight" };
        mat.SetTexture("_Texture", texture); mat.SetColor("_Color", new Color(.990566f, .996974f, 1, 1));
        mat.SetFloat("_ZWrite_Mode", 0); mat.SetFloat("_ZTest_Mode", 4); mat.SetFloat("_Cull_Mode", 2);
        return Save(mat, Output + "/OriginalStartLight.mat");
    }
    static Type TypeFor(string type)
    {
        switch (type)
        {
            case "UnityEngine.RectTransform": return typeof(RectTransform);
            case "UnityEngine.GameObject": return typeof(GameObject);
            case "UnityEngine.UI.RawImage": return typeof(RawImage);
            case "UnityEngine.UI.Image": return typeof(Image);
            case "UnityEngine.UI.Text": return typeof(Text);
            case "UnityEngine.CanvasGroup": return typeof(CanvasGroup);
            default: throw new InvalidOperationException("Unsupported curve type " + type);
        }
    }
    static T Save<T>(T value, string path) where T : Object
    {
        var old = AssetDatabase.LoadAssetAtPath<T>(path);
        if (old) { EditorUtility.CopySerialized(value, old); EditorUtility.SetDirty(old); Object.DestroyImmediate(value); return old; }
        if (AssetDatabase.LoadMainAssetAtPath(path)) throw new InvalidOperationException("Asset type collision: " + path);
        AssetDatabase.CreateAsset(value, path); return value;
    }
    static Vector2 V2(JToken a) => new Vector2((float)a[0], (float)a[1]);
    static Vector3 V3(JToken a) => new Vector3((float)a[0], (float)a[1], (float)a[2]);
    static Quaternion Q(JToken a) => new Quaternion((float)a[0], (float)a[1], (float)a[2], (float)a[3]);
    static void Folder(string path)
    { if (AssetDatabase.IsValidFolder(path)) return; int slash = path.LastIndexOf('/'); Folder(path.Substring(0, slash)); AssetDatabase.CreateFolder(path.Substring(0, slash), path.Substring(slash + 1)); }
}
#endif
