using System;
using System.Collections.Generic;
using System.Linq;
using Cinemachine;
using Game.Battle;
using Game.Characters;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Rendering.Universal;
using Object = UnityEngine.Object;

// 编辑器装配工具：只复用已经导入的角色、街道、动画和 EX 资源。
public static class SquadDemoSetup
{
    const string Output = "Assets/GameRes/Battle";
    static readonly string[] Ids = {
        "7c98ff3b0098af74d994b1cf35728d5c", "a21c140ff765d864f99e960e62380e84",
        "0121116d6a521cb4da7b22b26a8d1340", "c5feb320de8b2b94aad9d1bb46cb3fe4" };
    static readonly string[] Names = { "天童爱丽丝", "才羽绿", "才羽桃井", "花冈柚子" };

    [MenuItem("Tools/Blue Archive/Build Squad Demo")]
    public static void Build()
    {
        if (EditorApplication.isPlaying) throw new InvalidOperationException("请先退出 Play。");
        var scene = UnityEngine.SceneManagement.SceneManager.GetActiveScene();
        if (!scene.path.EndsWith("Player_GameDev.unity")) throw new InvalidOperationException("请打开 Player_GameDev 场景。");
        Folder(Output); Folder(Output + "/Characters"); Folder(Output + "/Config");
        Folder(Output + "/Animations"); Folder(Output + "/Navigation");
        SetLayer(11, "BattleGround"); SetLayer(12, "BattleObstacle");
        SetLayer(13, "BattleAlly"); SetLayer(14, "BattleEnemy");

        var targetRoot = GameObject.Find("Battle Targets");
        var previous = Object.FindObjectOfType<BattleSession>();
        var enemySources = previous ? previous.enemies.Select(x => x.gameObject).ToArray() :
            targetRoot.GetComponentsInChildren<Animator>(true).Where(x => x.name.StartsWith("敌方")).Select(x => x.gameObject).ToArray();
        var enemyRoot = new GameObject("Enemies");
        var enemies = new List<Health>();
        for (int i = 0; i < 2; i++)
        {
            var go = Object.Instantiate(enemySources[i], enemyRoot.transform);
            go.name = "敌方 " + (i + 1) + " · 不良少女";
            go.transform.position = new Vector3(i == 0 ? -1.7f : 1.7f, 0, i == 0 ? 7.5f : 9);
            go.SetActive(true);
            go.layer = 14;
            var hp = go.GetComponent<Health>() ?? go.AddComponent<Health>();
            hp.maximum = 1000;
            hp.hitbox = go.GetComponent<Collider>();
            hp.aimPoint = go.GetComponentsInChildren<Transform>(true).FirstOrDefault(t => t.name == "Bip001 Spine1") ?? go.transform;
            hp.headPoint = go.GetComponentsInChildren<Transform>(true).FirstOrDefault(t => t.name == "Bip001 Head");
            hp.visual = go;
            enemies.Add(hp);
        }
        if (previous)
        {
            foreach (var unit in previous.allies) Object.DestroyImmediate(unit.gameObject);
            foreach (var hp in previous.enemies) Object.DestroyImmediate(hp.gameObject);
            Object.DestroyImmediate(previous.gameObject);
        }
        foreach (string name in new[] { "游戏开发部 · 切换角色", "Player", "Battle Targets", "Squad Camera", "Squad Input", "Squad Route" })
        { var old = GameObject.Find(name); if (old) Object.DestroyImmediate(old); }

        var camera = Camera.main;
        camera.GetUniversalAdditionalCameraData().cameraStack.Clear();
        var brain = camera.GetComponent<CinemachineBrain>() ?? camera.gameObject.AddComponent<CinemachineBrain>();
        brain.m_DefaultBlend = new CinemachineBlendDefinition(CinemachineBlendDefinition.Style.Cut, 0);
        var map = GameObject.Find("sb_city_05_d_p01");
        var light = map.transform.Find("Lights/Directional Light").GetComponent<Light>();
        foreach (var col in map.GetComponentsInChildren<Collider>(true)) col.gameObject.layer = col.name == "Street Ground Collider" ? 11 : 12;
        BakeNavigation(map);

        var battle = new GameObject("Battle").AddComponent<BattleSession>();
        battle.mainCamera = camera;
        battle.characterLight = light;
        battle.enemies = enemies.ToArray();
        battle.obstacleMask = 1 << 12;
        battle.route = Array.Empty<Transform>();
        var units = new List<CharacterUnit>();
        for (int i = 0; i < Ids.Length; i++)
        {
            var go = new GameObject(Names[i]);
            go.layer = 13;
            go.transform.position = new Vector3((i - 1.5f) * 1.4f, 0, -1.5f + (i % 2) * .6f);
            var p = (GameObject)PrefabUtility.InstantiatePrefab(AssetDatabase.LoadAssetAtPath<GameObject>(AssetDatabase.GUIDToAssetPath(Ids[i])), go.transform);
            p.name = "Model";
            p.transform.localPosition = Vector3.zero;
            p.transform.localRotation = Quaternion.identity;
            var presentation = p.GetComponent<BACharacterPresentation>();
            presentation.animator.applyRootMotion = false;
            presentation.animator.cullingMode = AnimatorCullingMode.AlwaysAnimate;
            foreach (var slot in presentation.skills)
            {
                if (slot.cutinRoot) slot.cutinRoot.SetActive(false);
            }
            var unit = go.AddComponent<CharacterUnit>();
            unit.presentation = presentation;
            unit.agent = go.AddComponent<NavMeshAgent>();
            unit.agent.radius = .28f; unit.agent.height = 1.1f;
            unit.agent.acceleration = 14; unit.agent.angularSpeed = 720; unit.agent.stoppingDistance = .25f;
            var capsule = go.AddComponent<CapsuleCollider>();
            capsule.radius = .28f; capsule.height = 1.1f; capsule.center = new Vector3(0, .55f, 0);
            unit.health = go.AddComponent<Health>();
            unit.health.hitbox = capsule;
            unit.health.aimPoint = p.GetComponentsInChildren<Transform>(true).FirstOrDefault(t => t.name == "Bip001 Spine1") ?? p.transform;
            unit.health.headPoint = p.GetComponentsInChildren<Transform>(true).FirstOrDefault(t => t.name == "Bip001 Head");
            unit.definition = BuildDefinition(i, presentation);
            // 普通爱丽丝旧配置把普攻放在 shots[0]；转成与另外三人一致的普攻数据。
            if (i == 0) ConvertArisNormal(presentation);
            ControlledClips(i, presentation);
            PrefabUtility.SaveAsPrefabAsset(go, Output + "/Characters/" + Names[i] + ".prefab");
            units.Add(unit);
        }
        battle.allies = units.ToArray();
        battle.bloom = battle.gameObject.AddComponent<BAResourceOriginalPostProcessCamera>();
        battle.bloom.feature = units[0].presentation.battleBloom.feature;
        battle.bloom.ownerCharacterRoot = battle.gameObject;
        battle.bloom.targetCamera = camera;
        battle.bloom.enableEffect = true;
        var input = new GameObject("Squad Input").AddComponent<SquadInput>();
        input.session = battle;
        input.groundMask = 1 << 11; input.unitMask = 1 << 13; input.enemyMask = 1 << 14;
        input.formationSpacing = 1.2f;
        input.healthBackground = AssetDatabase.LoadAssetAtPath<Texture2D>(Output + "/UI/HealthBar/Combat_Bg_Hp.png");
        input.healthFill = AssetDatabase.LoadAssetAtPath<Texture2D>(Output + "/UI/HealthBar/Combat_Gauge_Hp.png");
        var rig = new GameObject("Squad Camera").AddComponent<SquadCamera>();
        var pivot = new GameObject("Pivot").transform; pivot.SetParent(rig.transform); pivot.position = new Vector3(0, 0, 3);
        var vcam = new GameObject("Virtual Camera").AddComponent<CinemachineVirtualCamera>();
        vcam.transform.SetParent(rig.transform);
        vcam.transform.rotation = Quaternion.Euler(33.6f, 307.8f, 0);
        vcam.m_Lens.FieldOfView = 10;
        rig.session = battle; rig.input = input; rig.mainCamera = camera; rig.pivot = pivot; rig.virtualCamera = vcam;
        rig.explorationDistance = 68; rig.combatDistance = 55; rig.minDistance = 25; rig.maxDistance = 95;
        rig.moveSpeed = 7; rig.zoomSpeed = 3;
        vcam.transform.position = pivot.position - vcam.transform.forward * rig.explorationDistance;
        camera.transform.SetPositionAndRotation(vcam.transform.position, vcam.transform.rotation);
        EditorBuildSettings.scenes = EditorBuildSettings.scenes.Where(s => s.path != scene.path)
            .Concat(new[] { new EditorBuildSettingsScene(scene.path, true) }).ToArray();
        AssetDatabase.SaveAssets();
        EditorSceneManager.SaveScene(scene);
        Selection.activeGameObject = battle.gameObject;
        Debug.Log("Squad Demo: 4 allies, 2 targets, native animations and EX wired.");
    }

    static CharacterDefinition BuildDefinition(int i, BACharacterPresentation p)
    {
        string path = Output + "/Config/" + Names[i] + ".asset";
        var d = AssetDatabase.LoadAssetAtPath<CharacterDefinition>(path);
        if (!d) { d = ScriptableObject.CreateInstance<CharacterDefinition>(); AssetDatabase.CreateAsset(d, path); }
        d.name = Names[i]; d.displayName = Names[i];
        SetCommandVoices(d, i);
        d.portrait = AssetDatabase.LoadAssetAtPath<Texture2D>(Output + "/UI/Portraits/Student_Portrait_" + new[]{"Aris","Midori","Momoi","Yuzu"}[i] + ".png");
        d.exPiercingWidth = i == 0 ? 2 : 0; d.exPiercingHeight = i == 0 ? 1 : 0;
        d.moveSpeed = 2.2f; d.attackRange = new[] { 5.5f, 6f, 4.5f, 5f }[i];
        d.magazineSize = new[] { 3, 5, 8, 4 }[i]; d.damage = new[] { 22f, 18f, 7f, 20f }[i];
        d.exCooldown = 12;
        var clips = p.animator.runtimeAnimatorController.animationClips;
        float start = clips.First(c => c.name.EndsWith("Normal_Attack_Start")).length;
        float ing = clips.First(c => c.name.EndsWith("Normal_Attack_Ing")).length;
        float delay = clips.First(c => c.name.EndsWith("Normal_Attack_Delay")).length;
        float end = clips.First(c => c.name.EndsWith("Normal_Attack_End")).length;
        int[][] shotFrames = { new[] {28}, new[] {28}, new[] {6,9,13}, new[] {3} };
        d.normalShotTimes = shotFrames[i].Select(x => start + x / 30f).ToArray();
        d.attackSeconds = start + ing + delay + end + .1f;
        d.reloadSeconds = clips.First(c => c.name.EndsWith("Normal_Reload")).length;
        int[][] releaseFrames = { new[] {78}, new[] {30,43,54,66,79}, new[] {35,50,65,70}, new[] {31} };
        d.exShotTimes = releaseFrames[i].Select(x => x / 30f).ToArray();
        d.exShotIndices = i == 0 ? new[] {1} : i == 1 ? new[] {0,1,2,3,4} : i == 2 ? new[] {-1,-1,-1,-1} : new[] {0};
        d.exDuration = new[] {120,91,85,72}[i] / 30f;
        d.exArea = i != 1; d.exRadius = i == 2 ? 4 : 2.5f; d.exDamage = i == 1 ? 45 : 80;
        EditorUtility.SetDirty(d);
        return d;
    }

    [MenuItem("Tools/Blue Archive/Restore Squad Command Voices")]
    public static void RestoreCommandVoices()
    {
        for (int i = 0; i < Names.Length; i++)
        {
            var data = AssetDatabase.LoadAssetAtPath<CharacterDefinition>(Output + "/Config/" + Names[i] + ".asset");
            SetCommandVoices(data, i);
            EditorUtility.SetDirty(data);
        }
        AssetDatabase.SaveAssets();
    }

    static void SetCommandVoices(CharacterDefinition data, int index)
    {
        var id = new[] { "Aris", "Midori", "Momoi", "Yuzu" }[index];
        string path = "Assets/GameRes/Characters/" + Names[index] + "/Audio/Voice/" + id;
        data.pickupVoices = new[] { AssetDatabase.LoadAssetAtPath<AudioClip>(path + "_Formation_Select.ogg") };
        data.moveVoices = new[] { AssetDatabase.LoadAssetAtPath<AudioClip>(path + "_Battle_Move_1.ogg"),
            AssetDatabase.LoadAssetAtPath<AudioClip>(path + "_Battle_Move_2.ogg") };
    }

    static void ConvertArisNormal(BACharacterPresentation p)
    {
        var path = Output + "/Config/天童爱丽丝_表现.asset";
        var data = AssetDatabase.LoadAssetAtPath<CharacterSkillData>(path);
        if (!data) { data = Object.Instantiate(p.skills[0].data); data.name = "天童爱丽丝_表现"; AssetDatabase.CreateAsset(data, path); }
        var shot = data.shots[0];
        data.baselineNormal = new CharacterNormalAttackData {normalSkillId="ArisNormal01",shotFrames=new[]{28},
            muzzleIndex=shot.muzzleIndex, projectile=shot.projectile, speed=shot.speed,
            forwardCurve=AnimationCurve.Linear(0,0,1,1)};
        SetArisNormalHit(data.baselineNormal);
        // 原 ArisExEntity01 命中：BodyBone、施法者方向；不是炮弹射程末端爆炸。
        data.targetEffects = new[] {new CharacterEffectData {
            prefab=AssetDatabase.LoadAssetAtPath<GameObject>(AssetDatabase.GUIDToAssetPath("9105b320f18f06841a3d1f5215ad7590")),
            anchor=CharacterEffectAnchor.EffectAnchor, rotationMode=CharacterEffectRotation.CasterForward,
            sounds=new[] {
                HitSound(new[]{"f53d53043d0e5ccf8884f9c7f7c71091"}, .3f, 1.5f),
                HitSound(new[]{"c39dfb0421f15611aa1f41cbe283b459","c6eb0d48f20d5058853d7ffbf117e991","e7c0afb9a8b356a89f80be4c207e4dee"}, .4f, 1f)
            }}};
        data.outcomes = new[] {new CharacterOutcomeData {sourceNodeIndex=1, hit=true,
            material=CharacterHitMaterial.Any, effectIndices=new[]{0}}};
        p.skills[0].data = data;
        p.combat.SetSkill(data);
        EditorUtility.SetDirty(data);
    }

    [MenuItem("Tools/Blue Archive/Restore Aris Normal Hit")]
    public static void RestoreArisNormalHit()
    {
        foreach (var path in new[] { Output + "/Config/天童爱丽丝_表现.asset",
            Output + "/Config/ProjectileExpiry/Aris_ArisEx01.asset" })
        {
            var data = AssetDatabase.LoadAssetAtPath<CharacterSkillData>(path);
            SetArisNormalHit(data.baselineNormal);
            EditorUtility.SetDirty(data);
        }
        foreach (var health in Object.FindObjectsOfType<Health>(true))
        {
            health.headPoint = health.GetComponentsInChildren<Transform>(true)
                .FirstOrDefault(t => t.name == "Bip001 Head");
            EditorUtility.SetDirty(health);
            if (PrefabUtility.IsPartOfPrefabInstance(health))
                PrefabUtility.RecordPrefabInstancePropertyModifications(health);
        }
        AssetDatabase.SaveAssets();
        EditorSceneManager.SaveScene(UnityEngine.SceneManagement.SceneManager.GetActiveScene());
    }

    static void SetArisNormalHit(CharacterNormalAttackData normal)
    {
        // ArisNormal01 / HitFleshEffect：HeadBone，Caster，偏移与旋转来自原始技能表。
        var hit = AssetDatabase.LoadAssetAtPath<GameObject>(
            "Assets/GameRes/Shared/Effects/NormalAttack/Prefabs/FX_Common_Hit_RG_Normal_Variant.prefab");
        normal.hitEffect = hit;
        normal.outcomes = new[] { new CharacterNormalOutcomeData {
            hit = true, material = CharacterHitMaterial.Flesh, prefab = hit,
            useContactPoint = false, requiredBone = 2, offset = new Vector3(0, 0, .3f),
            rotationMode = CharacterEffectRotation.CasterForward,
            rotationOffset = Quaternion.Euler(0, 180, 0)
        }};
    }

    static CharacterSound HitSound(string[] guids, float volume, float pitch) => new CharacterSound {
        clips=guids.Select(g=>AssetDatabase.LoadAssetAtPath<AudioClip>(AssetDatabase.GUIDToAssetPath(g))).ToArray(),
        volume=volume,pitch=pitch,spatialBlend=1,minDistance=1,maxDistance=500,rolloffMode=AudioRolloffMode.Linear
    };

    static void ControlledClips(int i, BACharacterPresentation p)
    {
        var source = p.animator.runtimeAnimatorController;
        var controller = source is AnimatorOverrideController existing ? Object.Instantiate(existing) : new AnimatorOverrideController(source);
        var pairs = new List<KeyValuePair<AnimationClip, AnimationClip>>(); controller.GetOverrides(pairs);
        foreach (var pair in pairs.ToArray())
        {
            var active = pair.Value ? pair.Value : pair.Key;
            if (!active.name.EndsWith("Normal_Attack_Ing")) continue;
            var clip = Object.Instantiate(active); clip.name = Names[i] + "_普攻";
            // 重复射击由状态机负责，单次片段淡出时应保持末帧，不能绕回首帧。
            var settings = AnimationUtility.GetAnimationClipSettings(clip);
            settings.loopTime = false;
            AnimationUtility.SetAnimationClipSettings(clip, settings);
            // 普攻发射与原版动画事件同步，保留姿势曲线、声音和其他表现事件。
            SetNormalShotEvents(clip, p.SelectedSkill.data.baselineNormal);
            string path = Output + "/Animations/" + clip.name + ".anim";
            var saved = AssetDatabase.LoadAssetAtPath<AnimationClip>(path);
            if (saved) { EditorUtility.CopySerialized(clip, saved); Object.DestroyImmediate(clip); clip = saved; }
            else AssetDatabase.CreateAsset(clip, path);
            controller[pair.Key] = clip;
        }
        string output = Output + "/Animations/" + Names[i] + ".overrideController";
        var old = AssetDatabase.LoadAssetAtPath<AnimatorOverrideController>(output);
        controller.name = Names[i];
        if (old) { EditorUtility.CopySerialized(controller, old); Object.DestroyImmediate(controller); controller = old; }
        else AssetDatabase.CreateAsset(controller, output);
        p.animator.runtimeAnimatorController = controller;
    }

    [MenuItem("Tools/Blue Archive/Restore Squad Normal Shot Events")]
    public static void RestoreNormalShotEvents()
    {
        if (EditorApplication.isPlayingOrWillChangePlaymode)
            throw new InvalidOperationException("Exit Play Mode before editing normal attacks.");
        foreach (string name in Names)
        {
            var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(Output + "/Characters/" + name + ".prefab");
            var presentation = prefab.GetComponentInChildren<BACharacterPresentation>(true);
            var clip = AssetDatabase.LoadAssetAtPath<AnimationClip>(Output + "/Animations/" + name + "_普攻.anim");
            SetNormalShotEvents(clip, presentation.SelectedSkill.data.baselineNormal);
        }
        AssetDatabase.SaveAssets();
        Debug.Log("Squad normal attacks: original shot frames restored to animation events.");
    }

    static void SetNormalShotEvents(AnimationClip clip, CharacterNormalAttackData normal)
    {
        var events = AnimationUtility.GetAnimationEvents(clip)
            .Where(e => e.functionName != "Fire").ToList();
        int fps = Mathf.Max(1, normal.logicFramesPerSecond);
        // 绿、桃井的编译普攻已生成枪口特效；爱丽丝仍保留原版 OnEffectEvent。
        if (normal.muzzleEffect)
            events.RemoveAll(e => e.functionName == "OnEffectEvent" &&
                normal.shotFrames.Any(frame => Mathf.Abs(e.time - frame / (float)fps) < .0001f));
        for (int i = 0; i < normal.shotFrames.Length; i++)
            if (!events.Any(e => e.functionName == "FireNormal" && e.intParameter == i))
                events.Add(new AnimationEvent { time = normal.shotFrames[i] / (float)fps,
                    functionName = "FireNormal", intParameter = i });
        AnimationUtility.SetAnimationEvents(clip, events.OrderBy(e => e.time).ToArray());
        EditorUtility.SetDirty(clip);
    }

    static void BakeNavigation(GameObject map)
    {
        var sources = new List<NavMeshBuildSource>();
        NavMeshBuilder.CollectSources(map.transform, (1 << 11) | (1 << 12), NavMeshCollectGeometry.PhysicsColliders, 0,
            new List<NavMeshBuildMarkup>(), sources);
        var settings = NavMesh.GetSettingsByID(0);
        settings.agentRadius = .28f; settings.agentHeight = 1.1f; settings.agentClimb = .25f;
        settings.overrideVoxelSize = true; settings.voxelSize = .08f;
        var data = NavMeshBuilder.BuildNavMeshData(settings, sources, new Bounds(new Vector3(0,0,5),new Vector3(24,8,30)),Vector3.zero,Quaternion.identity);
        data.name = "街道";
        string path = Output + "/Navigation/街道.asset";
        var previous = AssetDatabase.LoadAssetAtPath<NavMeshData>(path);
        if (previous) { EditorUtility.CopySerialized(data, previous); Object.DestroyImmediate(data); data = previous; }
        else AssetDatabase.CreateAsset(data, path);
        var prop = typeof(UnityEditor.AI.NavMeshBuilder).GetProperty("navMeshSettingsObject",System.Reflection.BindingFlags.Static|System.Reflection.BindingFlags.Public|System.Reflection.BindingFlags.NonPublic);
        var so = new SerializedObject((Object)prop.GetValue(null));
        so.FindProperty("m_NavMeshData").objectReferenceValue = data;
        so.ApplyModifiedPropertiesWithoutUndo();
    }

    static void SetLayer(int index, string name)
    {
        var so = new SerializedObject(AssetDatabase.LoadAllAssetsAtPath("ProjectSettings/TagManager.asset")[0]);
        so.FindProperty("layers").GetArrayElementAtIndex(index).stringValue = name;
        so.ApplyModifiedPropertiesWithoutUndo();
    }

    public static void ConfigureExtractionAndCamera()
    {
        var session = Object.FindObjectOfType<BattleSession>();
        var camera = Object.FindObjectOfType<SquadCamera>();
        camera.explorationDistance = 42f;
        camera.combatDistance = 31.900003f;
        camera.minDistance = 25f; camera.maxDistance = 60f;
        camera.viewEuler = new Vector3(33.6f, 307.8f, 0);
        camera.virtualCamera.transform.rotation = Quaternion.Euler(camera.viewEuler);
        camera.virtualCamera.m_Lens.FieldOfView = 10f;
        camera.virtualCamera.m_Lens.NearClipPlane = .2f;
        camera.virtualCamera.m_Lens.FarClipPlane = 1000f;
        camera.pivot.position = new Vector3(0, 1.30173f, 3);
        var point = session.extractionPoint;
        if (!point) { point = new GameObject("撤离点").transform; point.SetParent(session.transform); }
        if (!NavMesh.SamplePosition(new Vector3(0,0,13), out var hit, 3, NavMesh.AllAreas))
            throw new InvalidOperationException("撤离点不在可行走地面。");
        point.position = hit.position + Vector3.up * .03f;
        session.extractionPoint = point;
        session.extractionRadius = 3; session.extractionSeconds = 3;
        var line = point.GetComponent<LineRenderer>();
        if (!line) line = point.gameObject.AddComponent<LineRenderer>();
        line.useWorldSpace = false; line.loop = true; line.positionCount = 64; line.widthMultiplier = .08f;
        Folder(Output + "/Materials");
        string path = Output + "/Materials/撤离区域.mat";
        var mat = AssetDatabase.LoadAssetAtPath<Material>(path);
        if (!mat) { mat = new Material(Shader.Find("Universal Render Pipeline/Unlit")); AssetDatabase.CreateAsset(mat,path); }
        mat.SetColor("_BaseColor",new Color(.1f,1f,.35f)); line.sharedMaterial = mat;
        for(int i=0;i<64;i++){float a=i*Mathf.PI*2/64;line.SetPosition(i,new Vector3(Mathf.Cos(a)*3,0,Mathf.Sin(a)*3));}
        EditorUtility.SetDirty(mat); EditorUtility.SetDirty(session); EditorUtility.SetDirty(camera);
        AssetDatabase.SaveAssets(); EditorSceneManager.SaveScene(session.gameObject.scene);
    }
    static void Folder(string path)
    {
        if (AssetDatabase.IsValidFolder(path)) return;
        int slash=path.LastIndexOf('/'); Folder(path.Substring(0,slash));
        AssetDatabase.CreateFolder(path.Substring(0,slash),path.Substring(slash+1));
    }
}
