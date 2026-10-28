#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Game.Battle;
using Game.Characters;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using Object = UnityEngine.Object;

// Builds demo-only derivatives. Original projectiles, skills and animations stay intact.
public static class SquadProjectileSetup
{
    const string Root = "Assets/GameRes/Battle";
    const string Media = Root + "/Effects/ProjectileExpiry";
    const string Data = Root + "/Config/ProjectileExpiry";
    static readonly string[] Characters = { "天童爱丽丝", "才羽绿", "才羽桃井", "花冈柚子" };

    sealed class Rule
    {
        public readonly string path;
        public readonly int count;
        public readonly Type type;
        public Rule(string path, int count = 1, Type type = null)
        { this.path = path; this.count = count; this.type = type ?? typeof(ParticleSystemRenderer); }
    }

    sealed class Profile
    {
        public readonly string guid, name;
        public readonly Rule[] rules;
        public string Path => Media + "/" + name + ".prefab";
        public Profile(string guid, string name, params Rule[] rules)
        { this.guid = guid; this.name = name; this.rules = rules; }
    }

    // Explicitly audited renderer paths, not name heuristics over arbitrary effects.
    // par, Particle, Dot_Par3 and Streatch systems are the retained particle tails.
    static readonly Profile[] Profiles = {
        new Profile("dc757e926c11d45488685d7e2e92843a", "Aris_Normal_Expiry",
            new Rule("Scale/head"), new Rule("Scale/head (10)")),
        new Profile("ca5fa154943b04344828deaf6d8f0be0", "Aris_EX_Expiry",
            new Rule("Scale/head"), new Rule("Scale/head (2)"), new Rule("Scale/head (3)"),
            new Rule("Scale/head (8)"), new Rule("Scale/head (10)"),
            new Rule("Scale/head (11)"), new Rule("Scale/head (12)"),
            new Rule("Scale/noise_spin (3)", 2), new Rule("Scale/noise_spin (4)")),
        new Profile("c4a9fcf9d92b874479d3becd073959fb", "Midori_EX_0_Expiry", MidoriCore()),
        new Profile("55f3c4af721c0b840b60ce1a93803fd2", "Midori_EX_1_Expiry", MidoriCore()),
        new Profile("25298009d79e5634189f3603e1f5d904", "Midori_EX_2_Expiry", MidoriCore()),
        new Profile("887f0f5f8ab95a147a75f08f639f1076", "Midori_EX_3_Expiry", MidoriCore()),
        new Profile("d8c6456ed1b3f7345916f5273e6fb3c3", "Midori_EX_4_Expiry", MidoriCore()),
        new Profile("c4c662ecc42a11f408a47d2fb4e8d4bf", "Midori_Normal_Expiry",
            new Rule("fx_bullet_plane_02/position_rotation_scale/bullet_ball_Def")),
        new Profile("5d0620ce7f7f5ac4ba145a2154010b0f", "Momoi_Normal_Expiry",
            new Rule("fx_bullet_plane_02/position_rotation_scale/bullet_ball_Def")),
        new Profile("4db48bcc69ac0264da6b424ad639c190", "Yuzu_EX_Expiry",
            new Rule("head"), new Rule("head/head_Glow")),
        new Profile("13d6e19436bcbe84da23fac3627ea879", "Yuzu_Normal_Expiry",
            new Rule("position_rotation_scale/Siroko_Dron_Rocket", type: typeof(MeshRenderer)))
    };

    static Rule[] MidoriCore() => new[] { new Rule("missile"), new Rule("missile/gloow") };

    [MenuItem("Tools/Blue Archive/Build Squad Projectile Expiry")]
    public static void Build()
    {
        if (EditorApplication.isPlayingOrWillChangePlaymode)
            throw new InvalidOperationException("Exit Play Mode before building projectile derivatives.");
        var loaded = new List<(string path, GameObject root)>();
        try
        {
            // Validate every source and every currently referenced projectile before writes.
            foreach (var profile in Profiles)
            {
                string sourcePath = AssetDatabase.GUIDToAssetPath(profile.guid);
                var source = AssetDatabase.LoadAssetAtPath<GameObject>(sourcePath);
                Require(source, "Missing audited projectile: " + profile.guid);
                Require(source.GetComponentsInChildren<Animator>(true).Length == 0 &&
                    source.GetComponentsInChildren<Animation>(true).Length == 0,
                    "Audited source gained animation; refusing to alter bindings: " + sourcePath);
                ResolveCores(source, profile);
            }
            foreach (string character in Characters)
            {
                string path = Root + "/Characters/" + character + ".prefab";
                var root = PrefabUtility.LoadPrefabContents(path);
                loaded.Add((path, root));
                var unit = root.GetComponent<CharacterUnit>();
                Require(unit && unit.presentation && unit.presentation.combat,
                    "Missing demo Unit/presentation/combat: " + path);
                foreach (var slot in unit.presentation.skills)
                {
                    Require(slot != null && slot.data, "Missing demo skill: " + path);
                    foreach (var projectile in Projectiles(slot.data)) ResolveProfile(projectile);
                }
            }
            Folder(Media);
            Folder(Data);
            var projectiles = Profiles.ToDictionary(x => x, BuildProjectile);
            var skills = new Dictionary<CharacterSkillData, CharacterSkillData>();
            foreach (var item in loaded)
            {
                var presentation = item.root.GetComponent<CharacterUnit>().presentation;
                foreach (var slot in presentation.skills)
                    if (!skills.ContainsKey(slot.data)) skills.Add(slot.data, BuildSkill(slot.data, projectiles));
                Bind(presentation, skills);
                Require(PrefabUtility.SaveAsPrefabAsset(item.root, item.path), "Could not save " + item.path);
            }

            // SaveAsPrefabAsset does not reconnect existing scene instances. Rebind only
            // the four known demo units; no other scene or original preview is touched.
            var scene = UnityEngine.SceneManagement.SceneManager.GetActiveScene();
            bool changed = false;
            if (scene.IsValid() && scene.isLoaded)
                foreach (var session in scene.GetRootGameObjects().SelectMany(x => x.GetComponentsInChildren<BattleSession>(true)))
                    foreach (var unit in session.allies ?? Array.Empty<CharacterUnit>())
                    {
                        if (!unit || !unit.presentation || !Characters.Contains(unit.name)) continue;
                        changed |= Bind(unit.presentation, skills);
                    }
            AssetDatabase.SaveAssets();
            if (changed)
            {
                EditorSceneManager.MarkSceneDirty(scene);
                Require(!string.IsNullOrEmpty(scene.path) && EditorSceneManager.SaveScene(scene),
                    "Demo scene bindings changed but could not be saved.");
            }
            Debug.Log("Squad projectile expiry: 11 derivative prefabs and Expire clips; four demo skills rebound. Original media retained.");
        }
        finally
        {
            foreach (var item in loaded) if (item.root) PrefabUtility.UnloadPrefabContents(item.root);
        }
    }

    static GameObject BuildProjectile(Profile profile)
    {
        var root = PrefabUtility.LoadPrefabContents(AssetDatabase.GUIDToAssetPath(profile.guid));
        try
        {
            var cores = ResolveCores(root, profile);
            // Aris EX has two same-named noise siblings. Name only the derivative's
            // duplicates so the new curve can address each renderer unambiguously.
            MakeSiblingNamesUnique(root.transform);
            var clip = new AnimationClip { name = profile.name + "_Expire", legacy = true, frameRate = 60f };
            foreach (var core in cores)
                AnimationUtility.SetEditorCurve(clip,
                    EditorCurveBinding.FloatCurve(AnimationUtility.CalculateTransformPath(core.transform, root.transform),
                        core.GetType(), "m_Enabled"),
                    new AnimationCurve(new Keyframe(0f, 0f), new Keyframe(1f / 60f, 0f)));
            var renderers = root.GetComponentsInChildren<Renderer>(true);
            var enabled = renderers.Select(x => x.enabled).ToArray();
            clip.SampleAnimation(root, 0f);
            Require(cores.All(x => !x.enabled), "Expire did not hide every audited core: " + profile.name);
            for (int i = 0; i < renderers.Length; i++)
            {
                Require(cores.Contains(renderers[i]) || renderers[i].enabled == enabled[i],
                    "Expire changed a tail renderer: " + profile.name);
                renderers[i].enabled = enabled[i];
            }
            string clipPath = Media + "/" + profile.name + "_Expire.anim";
            var saved = AssetDatabase.LoadAssetAtPath<AnimationClip>(clipPath);
            if (saved)
            {
                EditorUtility.CopySerialized(clip, saved);
                Object.DestroyImmediate(clip);
            }
            else { Require(!AssetDatabase.LoadMainAssetAtPath(clipPath), "Occupied output: " + clipPath); saved = clip; AssetDatabase.CreateAsset(saved, clipPath); }
            EditorUtility.SetDirty(saved);
            AssetDatabase.SaveAssets();
            AssetDatabase.ImportAsset(clipPath, ImportAssetOptions.ForceUpdate);
            saved = AssetDatabase.LoadAssetAtPath<AnimationClip>(clipPath);
            Require(saved, "Saved expiry animation is missing: " + clipPath);
            var animation = root.AddComponent<Animation>();
            animation.playAutomatically = false;
            animation.cullingType = AnimationCullingType.AlwaysAnimate;
            animation.clip = saved;
            AnimationUtility.SetAnimationClips(animation, new[] { saved });
            root.name = profile.name;
            Require(!AssetDatabase.LoadMainAssetAtPath(profile.Path) || AssetDatabase.LoadAssetAtPath<GameObject>(profile.Path),
                "Occupied output: " + profile.Path);
            var result = PrefabUtility.SaveAsPrefabAsset(root, profile.Path);
            Require(result, "Could not save projectile: " + profile.Path);
            AssetDatabase.ImportAsset(profile.Path, ImportAssetOptions.ForceUpdate);
            result = AssetDatabase.LoadAssetAtPath<GameObject>(profile.Path);
            var persisted = result ? result.GetComponent<Animation>() : null;
            Require(persisted && persisted.clip == saved && AnimationUtility.GetAnimationClips(result).Contains(saved),
                "Saved projectile lost its expiry animation reference: " + profile.Path);
            return result;
        }
        finally { if (root) PrefabUtility.UnloadPrefabContents(root); }
    }

    static CharacterSkillData BuildSkill(CharacterSkillData source, Dictionary<Profile, GameObject> projectiles)
    {
        string path = Data + "/" + Safe(source.characterId + "_" + source.skillId) + ".asset";
        var result = AssetDatabase.LoadAssetAtPath<CharacterSkillData>(path);
        if (!result)
        {
            Require(!AssetDatabase.LoadMainAssetAtPath(path), "Occupied output: " + path);
            result = Object.Instantiate(source);
            AssetDatabase.CreateAsset(result, path);
        }
        else if (result != source) EditorUtility.CopySerialized(source, result);
        result.name = Path.GetFileNameWithoutExtension(path);
        foreach (var shot in result.shots)
            if (shot != null && shot.projectile) shot.projectile = projectiles[ResolveProfile(shot.projectile)];
        foreach (var normal in new[] { result.baselineNormal, result.enhancedNormal })
            if (normal != null && normal.projectile) normal.projectile = projectiles[ResolveProfile(normal.projectile)];
        EditorUtility.SetDirty(result);
        return result;
    }

    static bool Bind(BACharacterPresentation presentation, Dictionary<CharacterSkillData, CharacterSkillData> skills)
    {
        bool changed = false;
        foreach (var slot in presentation.skills)
            if (slot != null && slot.data && skills.TryGetValue(slot.data, out var replacement) && slot.data != replacement)
            { slot.data = replacement; changed = true; }
        var combat = new SerializedObject(presentation.combat);
        var current = combat.FindProperty("skill");
        if (current.objectReferenceValue is CharacterSkillData source && skills.TryGetValue(source, out var data) && source != data)
        { current.objectReferenceValue = data; combat.ApplyModifiedPropertiesWithoutUndo(); changed = true; }
        if (changed)
        {
            EditorUtility.SetDirty(presentation);
            if (PrefabUtility.IsPartOfPrefabInstance(presentation))
                PrefabUtility.RecordPrefabInstancePropertyModifications(presentation);
            if (PrefabUtility.IsPartOfPrefabInstance(presentation.combat))
                PrefabUtility.RecordPrefabInstancePropertyModifications(presentation.combat);
        }
        return changed;
    }

    static IEnumerable<GameObject> Projectiles(CharacterSkillData data)
    {
        foreach (var shot in data.shots) if (shot != null && shot.projectile) yield return shot.projectile;
        foreach (var normal in new[] { data.baselineNormal, data.enhancedNormal })
            if (normal != null && normal.projectile) yield return normal.projectile;
    }

    static Profile ResolveProfile(GameObject projectile)
    {
        string path = AssetDatabase.GetAssetPath(projectile);
        string guid = AssetDatabase.AssetPathToGUID(path);
        var result = Profiles.SingleOrDefault(x => x.guid == guid || x.Path == path);
        Require(result != null, "Unaudited projectile; inspect before adding expiry: " + path);
        return result;
    }

    static Renderer[] ResolveCores(GameObject root, Profile profile)
    {
        var renderers = root.GetComponentsInChildren<Renderer>(true);
        var selected = new List<Renderer>();
        foreach (var rule in profile.rules)
        {
            var matches = renderers.Where(x => x.GetType() == rule.type &&
                AnimationUtility.CalculateTransformPath(x.transform, root.transform) == rule.path).ToArray();
            Require(matches.Length == rule.count && matches.All(x => x.enabled),
                "Audited renderer changed: " + profile.name + " / " + rule.path);
            selected.AddRange(matches);
        }
        return selected.Distinct().ToArray();
    }

    static void MakeSiblingNamesUnique(Transform parent)
    {
        var names = new HashSet<string>(StringComparer.Ordinal);
        foreach (Transform child in parent)
        {
            string original = child.name;
            int suffix = 2;
            while (!names.Add(child.name)) child.name = original + "_Expiry" + suffix++;
            MakeSiblingNamesUnique(child);
        }
    }

    static string Safe(string value)
    {
        foreach (char invalid in Path.GetInvalidFileNameChars()) value = value.Replace(invalid, '_');
        return value;
    }

    static void Folder(string path)
    {
        if (AssetDatabase.IsValidFolder(path)) return;
        string parent = Path.GetDirectoryName(path).Replace('\\', '/');
        Folder(parent);
        Require(!string.IsNullOrEmpty(AssetDatabase.CreateFolder(parent, Path.GetFileName(path))), "Could not create " + path);
    }

    static void Require(bool condition, string message)
    { if (!condition) throw new InvalidOperationException(message); }
}
#endif
