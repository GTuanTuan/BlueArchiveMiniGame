using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using UnityEditor;
using UnityEngine;
using Object = UnityEngine.Object;

namespace SimpleCharacterTrial.Editor
{
    // One-time authoring repair, equivalent to the existing UseNativeMaterialLighting conversion.
    // Includes materials referenced only by native AnimationClip object-reference curves.
    public static class RepairGameDevMaterialLighting
    {
        const string Characters = "Assets/GameRes/Characters/";
        const string ShaderFolder = "Assets/GameRes/Shared/Shaders/Source";
        const string ReportPath = "Temp/SimpleCharacterTrial/material-lighting-repair.txt";
        static readonly string[] Names = { "天童爱丽丝", "才羽绿", "才羽桃井", "花冈柚子",
            "天童爱丽丝（女仆）", "才羽绿（女仆）", "才羽桃井（女仆）", "花冈柚子（女仆）",
            "天童爱丽丝（临战）", "花冈柚子（临战）" };
        static readonly string[] LightProperties = { "_MxCharLightDir", "_MxCharLightTone", "_MxCharShadowTone", "_MxCharLightData", "_ShadowCoordModifier0", "_ShadowCoordModifier" };
        sealed class Change { public Material material; public Shader shader; public string path; }

        [MenuItem("Tools/Character Trial/Repair GameDev Material Lighting")]
        public static void Build()
        {
            var report = new StringBuilder();
            Directory.CreateDirectory(Path.GetDirectoryName(ReportPath));
            try
            {
                if (EditorApplication.isPlaying) throw new InvalidOperationException("Stop Play before authoring materials.");
                var roots = Names.Select(n => Characters + n + "/Prefabs/Preview/" + n + "_Preview.prefab").ToArray();
                foreach (var path in roots) if (!AssetDatabase.LoadAssetAtPath<GameObject>(path)) throw new FileNotFoundException("Preview prefab missing", path);
                var dependencies = AssetDatabase.GetDependencies(roots, true);
                var shaders = AssetDatabase.FindAssets("t:Shader", new[] { ShaderFolder })
                    .Select(AssetDatabase.GUIDToAssetPath).Where(p => p.EndsWith(".shader", StringComparison.OrdinalIgnoreCase))
                    .Select(AssetDatabase.LoadAssetAtPath<Shader>).Where(s => s).ToArray();
                var changes = new List<Change>();
                var pptrUsage = new Dictionary<Material, List<string>>();
                var bakedLighting = Names.ToDictionary(n => n, n => new HashSet<string>());

                // Load only clip-bearing dependency formats. This includes Timeline's embedded clips.
                foreach (var path in dependencies.Where(p => p.EndsWith(".anim", StringComparison.OrdinalIgnoreCase) ||
                    p.EndsWith(".asset", StringComparison.OrdinalIgnoreCase) || p.EndsWith(".playable", StringComparison.OrdinalIgnoreCase)))
                {
                    foreach (var clip in AssetDatabase.LoadAllAssetsAtPath(path).OfType<AnimationClip>())
                    {
                        foreach (var binding in AnimationUtility.GetObjectReferenceCurveBindings(clip))
                            foreach (var key in AnimationUtility.GetObjectReferenceCurve(clip, binding))
                            {
                                var material = key.value as Material;
                                if (!material) continue;
                                List<string> usages;
                                if (!pptrUsage.TryGetValue(material, out usages)) pptrUsage[material] = usages = new List<string>();
                                string usage = path + " :: " + clip.name + " :: " + binding.path + " / " + binding.propertyName;
                                if (!usages.Contains(usage)) usages.Add(usage);
                            }
                        foreach (var binding in AnimationUtility.GetCurveBindings(clip))
                        {
                            if (!LightProperties.Take(4).Any(p => binding.propertyName.Contains(p))) continue;
                            foreach (string name in Names)
                                if (path.StartsWith(Characters + name + "/", StringComparison.Ordinal)) bakedLighting[name].Add(path + " :: " + clip.name);
                        }
                    }
                }

                // GetDependencies traverses prefab -> Timeline -> clip -> PPtr material. Add the explicit
                // curve results as a second source so the PPtr-only case is visible in the report.
                var materials = dependencies.Where(p => p.EndsWith(".mat", StringComparison.OrdinalIgnoreCase))
                    .Select(AssetDatabase.LoadAssetAtPath<Material>).Where(m => m).Concat(pptrUsage.Keys).Distinct();
                foreach (var material in materials)
                {
                    if (!material.shader) continue;
                    string sourceName = material.shader.name;
                    const string suffix = "/OriginalDefaults";
                    if (!sourceName.StartsWith("BA/Reconstructed/MX/C-", StringComparison.Ordinal) || !sourceName.EndsWith(suffix, StringComparison.Ordinal)) continue;
                    string path = AssetDatabase.GetAssetPath(material);
                    if (!Names.Any(n => path.StartsWith(Characters + n + "/", StringComparison.Ordinal)))
                    { report.AppendLine("OUTSIDE_CHARACTER_SCOPE (unchanged): " + path); continue; }
                    string targetName = sourceName.Substring(0, sourceName.Length - suffix.Length);
                    var candidates = shaders.Where(s => s.name == targetName).ToArray();
                    if (candidates.Length != 1) throw new InvalidOperationException("Expected one standalone Shader for " + path + ": " + targetName + "; found " + candidates.Length);
                    // Some Simple/Single variants do not consume all four light inputs. As in the
                    // existing converter, copy only properties actually declared by that counterpart.
                    changes.Add(new Change { material = material, shader = candidates[0], path = path });
                }

                // All resolution checks finish before the first mutation. Material references and GUIDs
                // remain unchanged, including native animated swaps and their original key timings.
                foreach (var change in changes)
                {
                    var defaults = new Material(change.shader);
                    try
                    {
                        string previousShader = change.material.shader.name;
                        change.material.shader = change.shader;
                        foreach (string property in LightProperties)
                            if (defaults.HasProperty(property)) change.material.SetVector(property, defaults.GetVector(property));
                        EditorUtility.SetDirty(change.material);
                        report.AppendLine("REPAIRED: " + change.path + " | " + previousShader + " -> " + change.shader.name);
                        foreach (string property in LightProperties)
                            if (defaults.HasProperty(property)) report.AppendLine("  SOURCE_DEFAULT " + property + "=" + defaults.GetVector(property).ToString("R"));
                        List<string> usages;
                        if (pptrUsage.TryGetValue(change.material, out usages)) foreach (string usage in usages) report.AppendLine("  ANIMATED_MATERIAL_REFERENCE " + usage);
                    }
                    finally { Object.DestroyImmediate(defaults); }
                }
                AssetDatabase.SaveAssets();
                foreach (string name in Names)
                {
                    report.AppendLine("EX_LIGHTING_CURVE_AUDIT " + name + ": " + (bakedLighting[name].Count == 0
                        ? "no _MxChar material curves in preview dependencies; exact source EX light baking remains separate"
                        : "found " + bakedLighting[name].Count + " clips (presence only, not coverage validation)"));
                    foreach (string path in bakedLighting[name]) report.AppendLine("  " + path);
                }
                report.AppendLine("COMPLETE: repaired " + changes.Count + " materials. No animation, prefab, source light, or runtime-script changes.");
                File.WriteAllText(ReportPath, report.ToString());
                Debug.Log(report.ToString());
            }
            catch (Exception e)
            {
                report.AppendLine("FAILED: " + e);
                File.WriteAllText(ReportPath, report.ToString());
                throw;
            }
        }
    }
}
