using System;
using System.Linq;
using Cinemachine;
using Game.Battle;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Rendering.Universal;
using UnityEngine.Timeline;
using Object = UnityEngine.Object;

// Copy this editor file with SequenceStaging into the game project, then run Build.
// The staged source art has only Unity/Timeline/URP components; no old battle runtime types.
public static class SquadSequenceSetup
{
    const string Output = "Assets/GameRes/Battle/Sequence";
    const string EntrancePrefab = "a514581683ab555d894d03ac4f3f06fc";
    const string EntranceTimeline = "bfd3c161311559e292fbb73398687ac5";
    const string VictoryPrefab = "e35d83850fad5a8180040ba984334605";
    const string VictoryTimeline = "429c9b7072825a35a14bdcf22793a36d";
    static readonly string[] Characters = { "天童爱丽丝", "才羽绿", "才羽桃井", "花冈柚子" };
    static readonly string[] SupportCharacters = { "花冈柚子（女仆）", "花冈柚子（临战）" };
    static readonly string[] EntranceVoiceGuids = {
        "c71ca7df819d5a6fa7bb92ac189f1920", "a8cb02a660585b4fac00ec739e17d151",
        "fe225ea1f01c525bb7d1f347473c6e83", "9e0f3b53d5e65e919253135ef2d6fb0b" };
    static readonly string[] EntranceVoice2Guids = {
        "b2b67156c672550aa1585e1f156ef6ad", "0d1364b6b03a536fb2388ac45891b451",
        "411ad5b717a85630901ac3502d15aad3", "d04325cd77a65d999dcfb370122695b1" };
    static readonly string[] VictoryVoiceGuids = {
        "0f9d2a01842b52f3bba697acd02eee03", "7e6d7d28bd2b5c4584b16d05b2fac960",
        "81e7cfbfc5ba579d8e6f6c5d1506a5b5", "5e5f1d260ae85026abb47683d4ddedd1" };

    [MenuItem("Tools/Blue Archive/Build Squad Sequences")]
    public static void Build()
    {
        if (EditorApplication.isPlaying) throw new InvalidOperationException("Exit Play mode first.");
        var battle = Object.FindObjectOfType<BattleSession>();
        if (!battle || battle.allies == null || battle.allies.Length != 4)
            throw new InvalidOperationException("Build the four member Squad Demo scene first.");
        if (battle.supports == null || battle.supports.Length != 2 ||
            battle.supports.Any(s => s == null || !s.presentation))
            throw new InvalidOperationException("Build both support presentations before the sequences.");
        if (!battle.mainCamera || !battle.mainCamera.GetComponent<CinemachineBrain>())
            throw new InvalidOperationException("The gameplay camera needs a CinemachineBrain.");

        // Resolve every source before changing the scene or replacing generated timelines.
        var entrancePrefab = Load<GameObject>(EntrancePrefab);
        var victoryPrefab = Load<GameObject>(VictoryPrefab);
        Load<TimelineAsset>(EntranceTimeline);
        Load<TimelineAsset>(VictoryTimeline);
        var callsigns = Characters.Select((_, i) => Clip(i, "Normal_Callsign")).ToArray();
        var idles = Characters.Select((_, i) => Clip(i, "Normal_Idle")).ToArray();
        var victoryStarts = Characters.Select((_, i) => Clip(i, "Victory_Start")).ToArray();
        var victoryEnds = Characters.Select((_, i) => Clip(i, "Victory_End")).ToArray();
        var defeats = Characters.Select((_, i) => Clip(i, "Vital_Death")).ToArray();
        var supportStarts = SupportCharacters.Select((_, i) => SupportClip(i, "Tactical_Start")).ToArray();
        var entranceVoices = EntranceVoiceGuids.Select(Load<AudioClip>).ToArray();
        var victoryVoices = VictoryVoiceGuids.Select(Load<AudioClip>).ToArray();
        var entranceClips = new[] { callsigns[0], idles[1], idles[2], idles[3],
            supportStarts[0], supportStarts[1] };

        for (int i = 0; i < 4; i++)
        {
            var definition = battle.allies[i].definition;
            if (!definition) throw new InvalidOperationException("Squad member has no CharacterDefinition: " + i);
            definition.entranceClip = callsigns[i];
            definition.idleClip = idles[i];
            definition.victoryStart = victoryStarts[i];
            definition.victoryEnd = victoryEnds[i];
            definition.defeatClip = defeats[i];
            definition.entranceVoices = new[] { entranceVoices[i], Load<AudioClip>(EntranceVoice2Guids[i]) };
            definition.victoryVoice = victoryVoices[i];
            EditorUtility.SetDirty(definition);
        }
        for (int i = 0; i < 2; i++)
        {
            battle.supports[i].entranceClip = supportStarts[i];
            battle.supports[i].entranceVoice = null; // No verified event 9 clip for CH0203 or CH0336.
        }

        Folder("Assets/GameRes/Battle");
        Folder(Output);
        var old = battle.transform.Find("Squad Sequences");
        if (old) Object.DestroyImmediate(old.gameObject);
        var holder = new GameObject("Squad Sequences");
        holder.transform.SetParent(battle.transform, false);
        battle.entrance = Create(entrancePrefab, EntranceTimeline, "Entrance", holder.transform,
            "CamSet/Camera001", new[] { "Main/Leader", "Main/First", "Main/Second", "Main/Third",
                "Support/First", "Support/Second" },
            entranceClips, null, entranceVoices[0]);
        battle.victory = Create(victoryPrefab, VictoryTimeline, "Victory", holder.transform,
            "CamSet/Camera", new[] { "Leader", "First", "Second", "Third" },
            victoryStarts, victoryEnds, victoryVoices[0]);
        SetEntranceVisibility(battle.entrance);
        RestoreEntranceTransition();

        EditorUtility.SetDirty(battle);
        AssetDatabase.SaveAssets();
        EditorSceneManager.MarkSceneDirty(battle.gameObject.scene);
        EditorSceneManager.SaveScene(battle.gameObject.scene);
        Selection.activeGameObject = holder;
        Debug.Log("Squad Sequences: native four front + two support Engage and four front Victory staged.");
    }

    [MenuItem("Tools/Blue Archive/Restore Captain Entrance Voices")]
    public static void RestoreCaptainEntranceVoices()
    {
        if (EditorApplication.isPlaying) throw new InvalidOperationException("Exit Play mode first.");
        for (int i = 0; i < Characters.Length; i++)
        {
            var definition = AssetDatabase.LoadAssetAtPath<CharacterDefinition>(
                "Assets/GameRes/Battle/Config/" + Characters[i] + ".asset");
            definition.entranceVoices = new[] { Load<AudioClip>(EntranceVoiceGuids[i]), Load<AudioClip>(EntranceVoice2Guids[i]) };
            EditorUtility.SetDirty(definition);
        }
        AssetDatabase.SaveAssets();
    }

    [MenuItem("Tools/Blue Archive/Restore Entrance Transition")]
    public static void RestoreEntranceTransition()
    {
        if (EditorApplication.isPlaying) throw new InvalidOperationException("Exit Play mode first.");
        var battle = Object.FindObjectOfType<BattleSession>();
        var input = Object.FindObjectOfType<SquadInput>();
        if (!battle || !input || !battle.selectionUI || !battle.mainCamera || battle.entrance?.director == null)
            throw new InvalidOperationException("Open the assembled Squad Demo scene first.");
        var director = battle.entrance.director;
        var entrance = (TimelineAsset)director.playableAsset;
        foreach (var track in entrance.GetOutputTracks().OfType<ControlTrack>()
            .Where(t => t.name == "TransitionA" || t.name == "Droneview"))
            foreach (var clip in track.GetClips())
            {
                var control = (ControlPlayableAsset)clip.asset;
                control.sourceGameObject.exposedName = new PropertyName("SquadEntrance_" + track.name + "_" + clip.start);
                director.SetReferenceValue(control.sourceGameObject.exposedName, battle.mainCamera.gameObject);
                EditorUtility.SetDirty(control);
            }
        Folder("Assets/GameRes/Battle"); Folder(Output);
        var node = battle.selectionUI.transform.Find("Formation Exit");
        if (!node) node = new GameObject("Formation Exit", typeof(RectTransform), typeof(CanvasGroup),
            typeof(UnityEngine.UI.Image), typeof(Animator), typeof(PlayableDirector)).transform;
        node.SetParent(battle.selectionUI.transform, false); node.SetAsLastSibling();
        var rect = (RectTransform)node;
        rect.anchorMin = Vector2.zero; rect.anchorMax = Vector2.one;
        rect.offsetMin = rect.offsetMax = Vector2.zero;
        node.GetComponent<UnityEngine.UI.Image>().color = Color.black;
        node.GetComponent<CanvasGroup>().alpha = 0;
        string animPath = Output + "/FormationExit.anim", timelinePath = Output + "/FormationExit.playable";
        var animation = AssetDatabase.LoadAssetAtPath<AnimationClip>(animPath);
        if (!animation) { animation = new AnimationClip(); AssetDatabase.CreateAsset(animation, animPath); }
        AnimationUtility.SetEditorCurve(animation, EditorCurveBinding.FloatCurve("", typeof(CanvasGroup), "m_Alpha"),
            AnimationCurve.Linear(0, 0, .3f, 1));
        var timeline = AssetDatabase.LoadAssetAtPath<TimelineAsset>(timelinePath);
        if (!timeline) { timeline = ScriptableObject.CreateInstance<TimelineAsset>(); AssetDatabase.CreateAsset(timeline, timelinePath); }
        foreach (var oldTrack in timeline.GetRootTracks().ToArray()) timeline.DeleteTrack(oldTrack);
        var fade = timeline.CreateTrack<AnimationTrack>(null, "Fade to black");
        fade.CreateClip(animation).duration = .3;
        timeline.durationMode = TimelineAsset.DurationMode.FixedLength; timeline.fixedDuration = .3;
        var exit = node.GetComponent<PlayableDirector>();
        exit.playOnAwake = false; exit.extrapolationMode = DirectorWrapMode.Hold;
        exit.playableAsset = timeline; exit.SetGenericBinding(fade, node.GetComponent<Animator>());
        var binding = new SerializedObject(input);
        binding.FindProperty("formationExit").objectReferenceValue = exit;
        binding.ApplyModifiedPropertiesWithoutUndo(); node.gameObject.SetActive(false);
        EditorUtility.SetDirty(animation); EditorUtility.SetDirty(timeline); EditorUtility.SetDirty(exit);
        EditorUtility.SetDirty(director); EditorUtility.SetDirty(input);
        AssetDatabase.SaveAssets(); EditorSceneManager.MarkSceneDirty(battle.gameObject.scene);
    }

    [MenuItem("Tools/Blue Archive/Restore Entrance Actor Visibility")]
    public static void RestoreEntranceVisibility()
    {
        var battle = Object.FindObjectOfType<BattleSession>();
        SetEntranceVisibility(battle.entrance);
        EditorUtility.SetDirty(battle.entrance.director);
        AssetDatabase.SaveAssets();
        EditorSceneManager.MarkSceneDirty(battle.gameObject.scene);
    }

    static void SetEntranceVisibility(BattleSession.Sequence sequence)
    {
        var timeline = (TimelineAsset)sequence.director.playableAsset;
        // 原版先展示支援 0–44/30，再展示前排 45/30–3 秒。
        string[] groups = { "Support", "Main" };
        double[] starts = { 0, 1.5 };
        double[] ends = { 44.0 / 30.0, 3.0 };
        for (int i = 0; i < groups.Length; i++)
        {
            string name = groups[i] + " Visibility";
            var track = timeline.GetOutputTracks().OfType<ActivationTrack>().FirstOrDefault(t => t.name == name);
            if (!track) track = timeline.CreateTrack<ActivationTrack>(null, name);
            foreach (var old in track.GetClips().ToArray()) timeline.DeleteClip(old);
            var clip = track.CreateDefaultClip();
            clip.start = starts[i]; clip.duration = ends[i] - starts[i];
            track.postPlaybackState = ActivationTrack.PostPlaybackState.Revert;
            sequence.director.SetGenericBinding(track, sequence.root.transform.Find(groups[i]).gameObject);
            EditorUtility.SetDirty(track);
        }
        EditorUtility.SetDirty(timeline);
    }

    static BattleSession.Sequence Create(GameObject source, string timelineGuid, string name, Transform parent,
        string cameraPath, string[] slotPaths, AnimationClip[] firstClips, AnimationClip[] endClips, AudioClip leaderVoice)
    {
        string destination = Output + "/" + name + ".playable";
        if (AssetDatabase.LoadAssetAtPath<Object>(destination)) AssetDatabase.DeleteAsset(destination);
        if (!AssetDatabase.CopyAsset(AssetDatabase.GUIDToAssetPath(timelineGuid), destination))
            throw new InvalidOperationException("Could not copy the native " + name + " Timeline.");
        var timeline = AssetDatabase.LoadAssetAtPath<TimelineAsset>(destination);
        if (!timeline) throw new InvalidOperationException("Copied Timeline did not import: " + destination);
        var root = Object.Instantiate(source, parent);
        root.name = name + " Sequence";
        var director = root.GetComponent<PlayableDirector>();
        var animator = root.GetComponent<Animator>();
        var cameraNode = root.transform.Find(cameraPath);
        if (!director || !animator || !cameraNode || !cameraNode.GetComponent<Camera>())
            throw new InvalidOperationException("Native sequence bindings are incomplete: " + name);
        director.playableAsset = timeline;
        director.playOnAwake = false;
        director.extrapolationMode = DirectorWrapMode.Hold;

        // The original Animation Track drives CamSet through the prefab's root Animator.
        var cameraTrack = timeline.GetOutputTracks().OfType<AnimationTrack>().FirstOrDefault();
        if (!cameraTrack) throw new InvalidOperationException("Native CamSet track is missing: " + name);
        director.SetGenericBinding(cameraTrack, animator);
        var nativeCamera = cameraNode.GetComponent<Camera>();
        var lens = LensSettings.Default;
        lens.FieldOfView = nativeCamera.fieldOfView;
        lens.NearClipPlane = nativeCamera.nearClipPlane;
        lens.FarClipPlane = nativeCamera.farClipPlane;
        var extra = cameraNode.GetComponent<UniversalAdditionalCameraData>();
        if (extra) Object.DestroyImmediate(extra);
        var listener = cameraNode.GetComponent<AudioListener>();
        if (listener) Object.DestroyImmediate(listener);
        Object.DestroyImmediate(nativeCamera);
        var virtualCamera = cameraNode.gameObject.AddComponent<CinemachineVirtualCamera>();
        virtualCamera.m_Lens = lens;
        virtualCamera.m_Priority = 100;
        RetargetCameraClip(timeline, cameraTrack, name, cameraPath, virtualCamera);

        var sequence = new BattleSession.Sequence {
            root = root, director = director, slots = new Transform[slotPaths.Length],
            tracks = new AnimationTrack[slotPaths.Length], voices = new[] { leaderVoice },
            voiceDelay = endClips == null ? 1.5333333333333334f : 1f / 30f
        };
        for (int i = 0; i < slotPaths.Length; i++)
        {
            sequence.slots[i] = root.transform.Find(slotPaths[i]);
            if (!sequence.slots[i]) throw new InvalidOperationException(name + " slot missing: " + slotPaths[i]);
            var track = timeline.CreateTrack<AnimationTrack>(null,
                i < Characters.Length ? Characters[i] : SupportCharacters[i - Characters.Length]);
            sequence.tracks[i] = track;
            if (endClips == null)
            {
                var cue = track.CreateClip(firstClips[i]);
                cue.start = i < 4 ? 1.5 : 0;
                cue.duration = i < 4 ? 1.5 : 1.4666666666666666;
            }
            else
            {
                var start = track.CreateClip(firstClips[i]);
                start.start = 0;
                start.duration = 3.000000238418579;
                start.blendOutDuration = 0.5;
                start.mixOutCurve = SmoothOut();
                var end = track.CreateClip(endClips[i]);
                end.start = 2.50000023841858;
                end.duration = 5.49999976158142;
                end.blendInDuration = 0.5;
                end.mixInCurve = SmoothIn();
            }
        }
        // Victory retains only its four original front participants. The two selected
        // support models have no verified model-specific Victory_Start/End clips.
        root.SetActive(false);
        EditorUtility.SetDirty(timeline);
        return sequence;
    }

    static void RetargetCameraClip(TimelineAsset timeline, AnimationTrack rootTrack, string sequenceName,
        string cameraPath, CinemachineVirtualCamera virtualCamera)
    {
        // Engage's CamSet is an external child track. Never edit that source track or its clip.
        var sourceTrack = sequenceName == "Entrance"
            ? rootTrack.GetChildTracks().OfType<AnimationTrack>().Single(x => x.name == "CamSet")
            : rootTrack;
        var sourceClip = sourceTrack.infiniteClip;
        if (!sourceClip) throw new InvalidOperationException(sequenceName + " native CamSet clip is missing.");
        string clipPath = Output + "/" + sequenceName + "Camera.anim";
        if (AssetDatabase.LoadAssetAtPath<Object>(clipPath)) AssetDatabase.DeleteAsset(clipPath);
        if (!AssetDatabase.CopyAsset(AssetDatabase.GetAssetPath(sourceClip), clipPath))
            throw new InvalidOperationException("Could not copy the native CamSet clip: " + sequenceName);
        var clip = AssetDatabase.LoadAssetAtPath<AnimationClip>(clipPath);

        int fieldOfViewCurves = 0;
        foreach (var binding in AnimationUtility.GetCurveBindings(clip))
        {
            if (binding.type != typeof(Camera) || binding.path != cameraPath) continue;
            var curve = AnimationUtility.GetEditorCurve(clip, binding);
            AnimationUtility.SetEditorCurve(clip, binding, null);
            if (binding.propertyName == "field of view")
            {
                var replacement = EditorCurveBinding.FloatCurve(binding.path,
                    typeof(CinemachineVirtualCamera), "m_Lens.FieldOfView");
                AnimationUtility.SetEditorCurve(clip, replacement, curve);
                fieldOfViewCurves++;
            }
            else if (binding.propertyName == "m_Enabled")
            {
                // Original Victory records Enabled=1 throughout. Preserve that directly;
                // if another source has switches, animate the virtual camera's enabled flag.
                bool alwaysOn = curve.keys.All(key => Mathf.Approximately(key.value, 1));
                if (!alwaysOn)
                {
                    var replacement = EditorCurveBinding.FloatCurve(binding.path,
                        typeof(CinemachineVirtualCamera), "m_Enabled");
                    AnimationUtility.SetEditorCurve(clip, replacement, curve);
                }
                virtualCamera.enabled = true;
            }
            else if (binding.propertyName == "near clip plane" || binding.propertyName == "far clip plane")
            {
                var property = binding.propertyName == "near clip plane"
                    ? "m_Lens.NearClipPlane" : "m_Lens.FarClipPlane";
                var replacement = EditorCurveBinding.FloatCurve(binding.path,
                    typeof(CinemachineVirtualCamera), property);
                AnimationUtility.SetEditorCurve(clip, replacement, curve);
            }
            else throw new InvalidOperationException("Unmapped native Camera curve: " + binding.propertyName);
        }
        if (fieldOfViewCurves != 1)
            throw new InvalidOperationException(sequenceName + " expected one native Camera FOV curve, found " + fieldOfViewCurves);

        AnimationTrack writableTrack = rootTrack;
        if (sourceTrack != rootTrack)
        {
            // Replace the generated Timeline's reference to the staged external CamSet
            // track with a local official track. The staged source asset stays read only.
            writableTrack = timeline.CreateTrack<AnimationTrack>(rootTrack, sourceTrack.name);
            writableTrack.infiniteClipOffsetPosition = sourceTrack.infiniteClipOffsetPosition;
            writableTrack.infiniteClipOffsetEulerAngles = sourceTrack.infiniteClipOffsetEulerAngles;
            var parent = new SerializedObject(rootTrack);
            var children = parent.FindProperty("m_Children");
            for (int i = children.arraySize - 1; i >= 0; i--)
            {
                if (children.GetArrayElementAtIndex(i).objectReferenceValue != sourceTrack) continue;
                children.GetArrayElementAtIndex(i).objectReferenceValue = null;
                children.DeleteArrayElementAtIndex(i);
            }
            parent.ApplyModifiedPropertiesWithoutUndo();
        }
        var serialized = new SerializedObject(writableTrack);
        serialized.FindProperty("m_InfiniteClip").objectReferenceValue = clip;
        serialized.ApplyModifiedPropertiesWithoutUndo();
        EditorUtility.SetDirty(writableTrack);
        EditorUtility.SetDirty(clip);
    }

    static AnimationCurve SmoothIn() => new AnimationCurve(new Keyframe(0, 0, 0, 0), new Keyframe(1, 1, 0, 0));
    static AnimationCurve SmoothOut() => new AnimationCurve(new Keyframe(0, 1, 0, 0), new Keyframe(1, 0, 0, 0));

    static T Load<T>(string guid) where T : Object
    {
        string path = AssetDatabase.GUIDToAssetPath(guid);
        var asset = AssetDatabase.LoadAssetAtPath<T>(path);
        if (!asset) throw new InvalidOperationException("Missing staged asset: " + guid);
        return asset;
    }

    static AnimationClip Clip(int character, string action)
    {
        string path = "Assets/GameRes/Characters/" + Characters[character] + "/Animations/" + action + ".anim";
        var clip = AssetDatabase.LoadAssetAtPath<AnimationClip>(path);
        if (!clip) throw new InvalidOperationException("Missing original model clip: " + path);
        return clip;
    }

    static AnimationClip SupportClip(int support, string action)
    {
        string path = "Assets/GameRes/Characters/" + SupportCharacters[support] + "/Animations/" + action + ".anim";
        var clip = AssetDatabase.LoadAssetAtPath<AnimationClip>(path);
        if (!clip) throw new InvalidOperationException("Missing original support clip: " + path);
        return clip;
    }

    static void Folder(string path)
    {
        if (AssetDatabase.IsValidFolder(path)) return;
        int slash = path.LastIndexOf('/');
        AssetDatabase.CreateFolder(path.Substring(0, slash), path.Substring(slash + 1));
    }
}
