using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

// These .asset shaders contain exported platform bytecode, not editable shader source.
// Unity can render them, but saving them with its Shader serializer discards that bytecode.
// Preserve the source files; ordinary .shader/.shadergraph files remain editable as usual.
[InitializeOnLoad]
internal sealed class CompiledShaderSaveGuard : AssetModificationProcessor
{
    static readonly Dictionary<string, bool> CompiledPaths = new Dictionary<string, bool>(StringComparer.Ordinal);

    static CompiledShaderSaveGuard()
    {
        EditorApplication.update += PreserveLoadedShaders;
        EditorApplication.projectChanged += CompiledPaths.Clear;
    }

    static bool IsCompiledShader(string path)
    {
        if (!path.StartsWith("Assets/", StringComparison.Ordinal) ||
            !path.EndsWith(".asset", StringComparison.OrdinalIgnoreCase))
            return false;

        if (!CompiledPaths.TryGetValue(path, out var result))
        {
            result = AssetDatabase.GetMainAssetTypeAtPath(path) == typeof(Shader);
            CompiledPaths[path] = result;
        }
        return result;
    }

    static void PreserveLoadedShaders()
    {
        // Importing a compiled Shader can mark it dirty without a source edit.
        // Clear that flag before Unity's filename validation runs during Ctrl+S.
        foreach (var shader in Resources.FindObjectsOfTypeAll<Shader>())
            if (EditorUtility.IsDirty(shader) && IsCompiledShader(AssetDatabase.GetAssetPath(shader)))
                EditorUtility.ClearDirty(shader);
    }

    static string[] OnWillSaveAssets(string[] paths)
    {
        var writable = new List<string>(paths.Length);
        foreach (var path in paths)
        {
            if (!IsCompiledShader(path))
            {
                writable.Add(path);
                continue;
            }

            var shader = AssetDatabase.LoadAssetAtPath<Shader>(path);
            if (shader != null) EditorUtility.ClearDirty(shader);
        }
        return writable.ToArray();
    }
}
