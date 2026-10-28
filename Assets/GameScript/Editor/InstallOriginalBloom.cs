// REVIEW-ONLY STAGING. Compile this in an Editor folder only after approval.
// The three runtime .cs.txt files must first be reviewed and copied to their destinations.
// This helper does not copy source files or execute automatically.
#if UNITY_EDITOR
using System;
using System.Linq;
using SimpleCharacterTrial;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering.Universal;

public static class InstallOriginalBloom
{
    [MenuItem("Tools/GameDev/Install Original EX Bloom")]
    public static void InstallAll()
    {
        // Includes dynamically instantiated CH0334 cutin routes as well as roster previews.
        // Assets without an EX bridge are inspected but are never changed.
        var paths = AssetDatabase.FindAssets("t:Prefab", new[] { "Assets/GameRes/Characters" })
            .Select(AssetDatabase.GUIDToAssetPath)
            .Where(path => AssetDatabase.LoadAssetAtPath<GameObject>(path)
                .GetComponentsInChildren<ExCameraTransition>(true).Length > 0)
            .OrderBy(path => path, StringComparer.Ordinal).ToArray();
        Install(paths);
    }

    public static void Install(string[] approvedPreviewPrefabPaths)
    {
        const string rendererPath = "Assets/GameSetting/Rendering/BAOriginalRendererData.asset";
        const string shaderPath = "Assets/GameRes/Shared/Shaders/Source/mxfinalbloom.shader";
        var renderer = AssetDatabase.LoadAssetAtPath<UniversalRendererData>(rendererPath);
        var shader = AssetDatabase.LoadAssetAtPath<Shader>(shaderPath);
        if (!renderer || !shader || shader.passCount != 5)
            throw new InvalidOperationException("Expected existing renderer and five-pass source Bloom shader.");
        if (approvedPreviewPrefabPaths == null || approvedPreviewPrefabPaths.Length == 0)
            throw new ArgumentException("Pass the explicitly approved Preview prefab paths.");
        foreach (var path in approvedPreviewPrefabPaths)
        {
            var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            if (!prefab || !path.StartsWith("Assets/GameRes/Characters/", StringComparison.Ordinal) ||
                prefab.GetComponentsInChildren<ExCameraTransition>(true).Length == 0)
                throw new InvalidOperationException("Expected character-local EX bridges: " + path);
            // There must be one owner for each rendered camera. The runtime bridge owns its marker.
            if (prefab.GetComponentsInChildren<BAResourceOriginalPostProcessCamera>(true).Length != 0)
                throw new InvalidOperationException("Existing authored marker requires review: " + path);
        }
        var features = renderer.rendererFeatures.OfType<BAOriginalUIBloomFeature>().ToArray();
        if (features.Length > 1) throw new InvalidOperationException("More than one original Bloom feature.");
        var feature = features.SingleOrDefault();
        if (!feature)
        {
            feature = ScriptableObject.CreateInstance<BAOriginalUIBloomFeature>();
            feature.name = "Original UI Bloom";
            AssetDatabase.AddObjectToAsset(feature, renderer);
            renderer.rendererFeatures.Add(feature);
        }
        feature.originalBloomShader = shader;
        feature.bloom = new BAOriginalUIBloomFeature.BloomSettings {
            enable = true, intensity = 1.7f, threshold = 1, softKnee = 0,
            clamp = 65472, diffusion = 7, anamorphicRatio = 0, color = Color.white
        };
        feature.parametersConfigured = true;
        feature.configurationEvidence = "Original globalgamemanagers.assets 11586/62; " +
            "UIRenderPass.RenderBloom, GameAssembly RVA 0xA060080; " +
            "original camera color + UI wipe, exactly once on final camera.";
        feature.SetActive(true);
        renderer.SetDirty();
        EditorUtility.SetDirty(feature);
        EditorUtility.SetDirty(renderer);
        AssetDatabase.SaveAssetIfDirty(renderer);
        foreach (var path in approvedPreviewPrefabPaths)
        {
            var root = PrefabUtility.LoadPrefabContents(path);
            try
            {
                foreach (var bridge in root.GetComponentsInChildren<ExCameraTransition>(true))
                {
                    bridge.originalBloomFeature = feature;
                    bridge.originalBloomOwnerRoot = root;
                }
                PrefabUtility.SaveAsPrefabAsset(root, path);
            }
            finally { PrefabUtility.UnloadPrefabContents(root); }
        }
        AssetDatabase.SaveAssetIfDirty(feature);
        AssetDatabase.SaveAssetIfDirty(renderer);
        Debug.Log("Original EX Bloom installed on " + approvedPreviewPrefabPaths.Length +
            " character/route prefabs, one renderer feature.\n" + string.Join("\n", approvedPreviewPrefabPaths));
    }
}
#endif
