#if UNITY_EDITOR
using System;
using Game.Characters;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;

public static class SquadArisEffectSetup
{
    // Original Aris_Original_EX1 Control clips: Charge 0–2.533333,
    // Shot 2.433333–3.266667. Their prefab instances are hidden at clip end.
    static readonly string[] Prefabs = {
        "Assets/GameRes/Characters/天童爱丽丝/Prefabs/Preview/天童爱丽丝_Preview.prefab",
        "Assets/GameRes/Battle/Characters/天童爱丽丝.prefab"
    };

    [MenuItem("Tools/Blue Archive/Restore Aris EX Effect Boundaries")]
    public static void Apply()
    {
        if (EditorApplication.isPlayingOrWillChangePlaymode)
            throw new InvalidOperationException("Exit Play Mode before editing Aris effects.");
        foreach (string path in Prefabs)
        {
            var root = PrefabUtility.LoadPrefabContents(path);
            try
            {
                int changed = 0;
                foreach (var actor in root.GetComponentsInChildren<BACharacterPresentation>(true))
                    changed += Bind(actor);
                if (changed != 2) throw new InvalidOperationException("Expected Aris charge and shot bindings: " + path);
                PrefabUtility.SaveAsPrefabAsset(root, path);
            }
            finally { PrefabUtility.UnloadPrefabContents(root); }
        }
        foreach (var actor in UnityEngine.Object.FindObjectsOfType<BACharacterPresentation>(true))
        {
            if (Bind(actor) == 0) continue;
            PrefabUtility.RecordPrefabInstancePropertyModifications(actor);
            EditorSceneManager.MarkSceneDirty(actor.gameObject.scene);
        }
        AssetDatabase.SaveAssets();
        Debug.Log("Aris EX: original charge/shot clip-end cleanup restored; projectile and hit tails unchanged.");
    }

    static int Bind(BACharacterPresentation actor)
    {
        int count = 0;
        for (int i = 0; i < actor.effects.Length; i++)
        {
            var binding = actor.effects[i];
            string guid = AssetDatabase.AssetPathToGUID(AssetDatabase.GetAssetPath(binding.prefab));
            if (guid != "42030084545644a5afbe368cb864b56e" &&
                guid != "9df5b3e4738345beafb884262eda36ce") continue;
            binding.clearOnStop = true;
            actor.effects[i] = binding;
            count++;
        }
        if (count > 0) EditorUtility.SetDirty(actor);
        return count;
    }
}
#endif
