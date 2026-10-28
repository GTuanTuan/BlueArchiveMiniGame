// Editor-only: remove solely unsupported combinations of reconstructed shaders.
// Copies of this file are unnecessary: it discovers BAOriginalVariantCoverage
// manifests. Shader name AND exact asset path must match a manifest entry.
#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEditor.Build;
using UnityEditor.Rendering;
using UnityEngine;
using UnityEngine.Rendering;

public sealed class BAOriginalVariantGuard : IPreprocessShaders
{
    [Serializable] public sealed class Record
    {
        public string shader, assetPath, passName, stage;
        public string[] universe, states;
        [NonSerialized] public HashSet<string> allowed;
        [NonSerialized] public HashSet<string> declared;
    }
    [Serializable] public sealed class Manifest { public Record[] records; }
    private static Record[] cached;
    public int callbackOrder { get { return int.MaxValue; } }

    public static Record[] LoadRecords()
    {
        if (cached != null) return cached;
        var result = new List<Record>();
        foreach (var guid in AssetDatabase.FindAssets("BAOriginalVariantCoverage t:TextAsset"))
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            if (!Path.GetFileNameWithoutExtension(path).StartsWith("BAOriginalVariantCoverage", StringComparison.Ordinal)) continue;
            var manifest = JsonUtility.FromJson<Manifest>(File.ReadAllText(path));
            if (manifest == null || manifest.records == null) throw new BuildFailedException("Invalid original variant manifest: " + path);
            foreach (var r in manifest.records)
            {
                if (string.IsNullOrEmpty(r.shader) || string.IsNullOrEmpty(r.assetPath) || r.universe == null || r.states == null)
                    throw new BuildFailedException("Incomplete original variant record: " + path);
                r.allowed = new HashSet<string>(r.states, StringComparer.Ordinal);
                r.declared = new HashSet<string>(r.universe, StringComparer.Ordinal);
                result.Add(r);
            }
        }
        cached = result.ToArray();
        return cached;
    }

    private static string Key(Record r, HashSet<string> enabled)
    {
        return string.Join(";", r.universe.Where(enabled.Contains).OrderBy(k => k, StringComparer.Ordinal));
    }

    public void OnProcessShader(Shader shader, ShaderSnippetData snippet, IList<ShaderCompilerData> data)
    {
        string path = AssetDatabase.GetAssetPath(shader);
        var matching = LoadRecords().Where(r => r.shader == shader.name && r.assetPath == path &&
            r.passName == snippet.passName && r.stage == snippet.shaderType.ToString()).ToArray();
        if (matching.Length == 0) return;
        // ShaderSnippetData exposes no SubShader index. Equal policies can
        // safely share a pass name; keep one copy of each distinct policy.
        var policies = new List<Record>();
        foreach (var candidate in matching)
            if (!policies.Any(r => r.declared.SetEquals(candidate.declared) && r.allowed.SetEquals(candidate.allowed)))
                policies.Add(candidate);
        var combinedUniverse = new HashSet<string>(policies.SelectMany(r => r.universe), StringComparer.Ordinal);
        int before = data.Count;
        for (int i = data.Count - 1; i >= 0; --i)
        {
            var enabled = new HashSet<string>(data[i].shaderKeywordSet.GetShaderKeywords().Select(k => k.name), StringComparer.Ordinal);
            // Generated pragma groups contain only their record's universe.
            // An active key declared exclusively by another same-named pass
            // proves this compiler variant cannot originate from this record.
            // Ignore engine keys outside every original universe, as before.
            var relevantEnabled = enabled.Where(combinedUniverse.Contains).ToArray();
            var feasible = policies.Where(r => relevantEnabled.All(r.declared.Contains)).ToArray();
            if (feasible.Length == 0)
                throw new BuildFailedException("No original pass declaration can produce compiler keywords for " + path + "/" + snippet.passName +
                    "/" + snippet.shaderType + ": " + string.Join(";", relevantEnabled));
            bool keep = feasible[0].allowed.Contains(Key(feasible[0], enabled));
            if (feasible.Any(r => r.allowed.Contains(Key(r, enabled)) != keep))
                throw new BuildFailedException("Ambiguous original variant policies disagree for actual compiler keywords in " + path + "/" + snippet.passName +
                    "/" + snippet.shaderType + ": " + string.Join(";", relevantEnabled) +
                    ". Distinguishing snippet evidence is required; policies were not merged.");
            if (!keep) data.RemoveAt(i);
        }
        Debug.Log("BAOriginalVariantGuard " + path + " / " + snippet.passName + " / " + snippet.shaderType +
            ": retained " + data.Count + ", removed unsupported " + (before - data.Count) +
            ", matched metadata records " + matching.Length + ", distinct policies " + policies.Count);
    }

    [MenuItem("Tools/BA Reconstruction/Audit Material Keyword Coverage")]
    public static void AuditMaterials()
    {
        cached = null;
        var records = LoadRecords();
        int checkedMaterials = 0, storedProjectionMismatches = 0;
        foreach (var guid in AssetDatabase.FindAssets("t:Material"))
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            var material = AssetDatabase.LoadAssetAtPath<Material>(path);
            if (material == null || material.shader == null) continue;
            string shaderPath = AssetDatabase.GetAssetPath(material.shader);
            var relevant = records.Where(r => r.shader == material.shader.name && r.assetPath == shaderPath).ToArray();
            if (relevant.Length == 0) continue;
            checkedMaterials++;
            var enabled = new HashSet<string>(material.shaderKeywords, StringComparer.Ordinal);
            foreach (var r in relevant)
            {
                string key = Key(r, enabled);
                if (r.allowed.Contains(key)) continue;
                storedProjectionMismatches++;
                // material.shaderKeywords is a stored enablement set, not the
                // effective ShaderCompilerData selected by Unity. A material
                // can retain multiple keys from one choice group while Unity
                // resolves a supported compiled variant. Only render evidence
                // or actual compiler data can establish a failure here.
                Debug.Log("Stored keyword projection requires effective-variant validation: " + path + " / " + r.passName + " / " + r.stage + " / " + key +
                    ". This is not an unavailable-variant error; consult original/candidate render comparison.", material);
            }
        }
        Debug.Log("BAOriginalVariantGuard stored material audit: " + checkedMaterials + " materials; " + storedProjectionMismatches +
            " stored pass/stage projections are not exact original sets. These are selection-evidence requests, not shader failures. The build guard validates actual ShaderCompilerData independently; rendering validates effective material behavior.");
    }
}
#endif
