using System;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEditor.U2D;
using UnityEngine;
using UnityEngine.U2D;

/// <summary>
/// Packages the small, provenance-verified selection from the original NGUI Common atlas.
/// The PNG importers already contain the original nine-slice borders. This does not recut images.
/// </summary>
public static class OriginalUIAtlasImporter
{
    [MenuItem("Tools/UI/Build Original UI Atlases")]
    public static void BuildAtlases()
    {
        Build("Preload", "PreloadOriginalAtlas", 9);
        Build("Main", "MainOriginalAtlas", 12);
        AssetDatabase.SaveAssets();
        Debug.Log("Original UI atlases ready. Source and per-sprite hashes: Documentation/ArtSources/OriginalCommonAtlas.json");
    }

    private static void Build(string package, string atlasName, int expectedCount)
    {
        string sourceFolder = "Assets/GameRes/UI/" + package + "/Art/OriginalCommon";
        string atlasFolder = "Assets/GameRes/UI/" + package + "/Atlases";
        string atlasPath = atlasFolder + "/" + atlasName + ".spriteatlas";
        string[] files = Directory.GetFiles(sourceFolder, "*.png").OrderBy(p => p, StringComparer.Ordinal).ToArray();
        if (files.Length != expectedCount)
            throw new InvalidOperationException("Unexpected original sprite selection in " + sourceFolder);

        var sprites = new UnityEngine.Object[files.Length];
        for (int i = 0; i < files.Length; ++i)
        {
            string path = files[i].Replace('\\', '/');
            AssetDatabase.ImportAsset(path, ImportAssetOptions.ForceSynchronousImport);
            var importer = AssetImporter.GetAtPath(path) as TextureImporter;
            if (importer == null || importer.textureType != TextureImporterType.Sprite || importer.spriteImportMode != SpriteImportMode.Single)
                throw new InvalidOperationException("Original sprite importer metadata is missing: " + path);
            sprites[i] = AssetDatabase.LoadAssetAtPath<Sprite>(path);
            if (sprites[i] == null)
                throw new InvalidOperationException("Original sprite failed to import: " + path);
        }

        if (!AssetDatabase.IsValidFolder(atlasFolder))
            AssetDatabase.CreateFolder("Assets/GameRes/UI/" + package, "Atlases");

        var atlas = AssetDatabase.LoadAssetAtPath<SpriteAtlas>(atlasPath);
        if (atlas == null)
        {
            atlas = new SpriteAtlas();
            AssetDatabase.CreateAsset(atlas, atlasPath);
        }
        var packing = atlas.GetPackingSettings();
        packing.enableRotation = false;
        packing.enableTightPacking = false;
        packing.padding = 4;
        atlas.SetPackingSettings(packing);
        var texture = atlas.GetTextureSettings();
        texture.generateMipMaps = false;
        texture.readable = false;
        texture.sRGB = true;
        texture.filterMode = FilterMode.Bilinear;
        atlas.SetTextureSettings(texture);
        var platform = atlas.GetPlatformSettings("DefaultTexturePlatform");
        platform.maxTextureSize = 1024;
        platform.textureCompression = TextureImporterCompression.Uncompressed;
        atlas.SetPlatformSettings(platform);
        // YooAsset owns the atlas bundle. Do not silently embed it in the Player as well.
        atlas.SetIncludeInBuild(false);
        var oldPackables = atlas.GetPackables();
        if (oldPackables.Length > 0) atlas.Remove(oldPackables);
        atlas.Add(sprites);
        EditorUtility.SetDirty(atlas);
        SpriteAtlasUtility.PackAtlases(new[] { atlas }, EditorUserBuildSettings.activeBuildTarget);
        if (atlas.spriteCount != expectedCount)
            throw new InvalidOperationException(atlasName + " packed " + atlas.spriteCount + " sprites; expected " + expectedCount);
    }
}
