#if UNITY_EDITOR
using System;
using System.IO;
using Game.Battle;
using Game.Characters;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using Object = UnityEngine.Object;

// 四名前排保持原样；仅在 Battle 下装配两名不参与寻路/生命值的支援。
public static class SquadSupportSetup
{
    const string MaidPortraitSource =
        "C:/UnityProject/BAAssets/Recovery/TacticalOriginalFlow20261024/CleanImportAssets/_BAConverted/Portraits/CH0203_Student.png";
    const string BattlePortraitSource =
        "C:/UnityProject/BAAssets/Tools/SquadDemo/SupportPatch/Portraits/CH0336_Student.png";
    static readonly string[] Names = { "花冈柚子（女仆）", "花冈柚子（临战）" };

    [MenuItem("Tools/Blue Archive/Build Squad Supports")]
    public static void Build()
    {
        if (EditorApplication.isPlaying) throw new InvalidOperationException("请先退出 Play。");
        var session = Object.FindObjectOfType<BattleSession>();
        if (!session || session.allies == null || session.allies.Length != 4)
            throw new InvalidOperationException("请打开已装配四名前排的 Squad Demo 场景。");
        var parent = session.transform.Find("Battle Supports");
        if (!parent)
        {
            parent = new GameObject("Battle Supports").transform;
            parent.SetParent(session.transform, false);
        }
        var supports = new BattleSession.Support[2];
        for (int i = 0; i < 2; i++)
        {
            string name = Names[i];
            string path = "Assets/GameRes/Characters/" + name + "/Prefabs/Preview/" + name + "_Preview.prefab";
            var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            if (!prefab) throw new InvalidOperationException("缺少支援 Preview：" + path);
            var root = parent.Find(name + " Root");
            if (!root)
            {
                var existing = parent.Find(name);
                root = new GameObject(name + " Root").transform;
                root.SetParent(parent, false);
                if (existing)
                {
                    // 老场景里 Preview 直接挂在 Battle Supports 下；包裹一次即可。
                    root.position = existing.position;
                    existing.SetParent(root, true);
                }
                else root.localPosition = new Vector3(i == 0 ? -3 : 3, 0, -4);
            }
            var actor = root.Find(name);
            if (!actor)
            {
                actor = ((GameObject)PrefabUtility.InstantiatePrefab(prefab, root)).transform;
                actor.name = name;
                actor.localPosition = Vector3.zero;
                actor.localRotation = Quaternion.identity;
            }
            var presentation = actor.GetComponent<BACharacterPresentation>();
            if (!presentation || !presentation.combat || presentation.skills.Length == 0 ||
                !presentation.skills[0].data || !presentation.skills[0].transition ||
                !presentation.skills[0].fieldTimeline)
                throw new InvalidOperationException(name + " 的 EX 演出资源不完整。");
            presentation.animator.applyRootMotion = false;
            presentation.animator.cullingMode = AnimatorCullingMode.AlwaysAnimate;
            foreach (var slot in presentation.skills)
                if (slot.cutinRoot) slot.cutinRoot.SetActive(false);
            supports[i] = new BattleSession.Support {
                displayName = name,
                portrait = Portrait(i),
                root = root,
                presentation = presentation,
                cooldown = 12f,
                fireTime = i == 0 ? 1.7666667f : -1f,
                damage = i == 0 ? 80f : 0f
            };
        }
        if (supports[0].presentation.skills[0].data.shots.Length != 1 ||
            supports[1].presentation.skills[0].data.shots.Length != 0 ||
            supports[1].presentation.skills[0].data.supportedEx.Length != 3)
            throw new InvalidOperationException("支援 EX 配置与 CH0203/CH0336 原数据不一致。");
        session.supports = supports;
        EditorUtility.SetDirty(session);
        AssetDatabase.SaveAssets();
        EditorSceneManager.SaveScene(session.gameObject.scene);
        Debug.Log("Squad Demo：女仆柚子与临战柚子已加入支援槽，前排与撤离人数不变。");
    }

    static Texture2D Portrait(int index)
    {
        string id = index == 0 ? "CH0203" : "CH0336";
        string source = index == 0 ? MaidPortraitSource : BattlePortraitSource;
        string output = "Assets/GameRes/Battle/UI/Portraits/" + id + "_Student.png";
        var texture = AssetDatabase.LoadAssetAtPath<Texture2D>(output);
        if (texture) return texture;
        if (!File.Exists(source))
            throw new InvalidOperationException("缺少原版 " + id + " 头像：" + source);
        Directory.CreateDirectory(Path.GetDirectoryName(output));
        File.Copy(source, output);
        AssetDatabase.ImportAsset(output, ImportAssetOptions.ForceUpdate);
        return AssetDatabase.LoadAssetAtPath<Texture2D>(output);
    }
}
#endif
